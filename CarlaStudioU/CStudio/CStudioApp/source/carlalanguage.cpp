// JDH 6/2/99 catch exceptions thrown during AmpleDLLWrapper->create() so we can clear the wrapper ptr
// jdh 8/27/99 added hab's punctuation class support
// jdh 9/1/99 catch exceptions thrown by AmpleDLLWrapper if they are LPCSTRs
// jdh 9/1/99 add special intergen-only version of outtxt.ctl (outit.ctl) for output only (doesn't import it)
// 1.5a5 24-Sep-1999 hab allow user the ability to show properties in language font
// 1.5a7 20-Oct-1999 hab allow user the ability to show user tests, string and morpheme class names in language font
// jdh 11/8/99 Fix for Korean Windows
// jdh 11/9/99 added m_wDisplayFlags
// 1.7a1 02-Dec-1999 hab Add lexical changes to Synthesis (Sample)
//       06-Dec-1999 hab Fix (I hope) bug which would output both \unified
//                       and \affix \root in code table when creating a
//                       language from scratch.
//       07-Dec-1999 hab Added analysis, interlinear, and synthesis code tables
//       10-Dec-1999 hab Edit Transfer Sequence is from target language's
//                       perspective when the kLocateTransferWithTarget is set
// 2.0.2 19-Jan-2000 hab Use unified dictionary in prepareMFSForProcessors()
// 2.7.3 30-Nov-2002 rde the .csl file contains the PC-PATR punctuation which might be UTF-8, so
//                       we have to check the UTF-8 safeness earlier in the process than we were.
// 2.8.0 06-Dec-2004 hab Added maxInterfixes

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "CarlaLanguage.h"
#include "SFMFile.h"
#include <strstrea.h>
#include "ProcessSequence.h"

#include "LangModelsDoc.h"
#include "TransferModelSet.h"
#include "ProjectDoc.h"
#include "WizNewFromFiles.h"
#include "PageRootUnifiedDict.h"
#include "PageDictAffixes.h"
#include "SheetlangProperties.h"
#include <io.h>

#include "SimpleProgressBar.h"
#include "SafeStream.h"
#include "logwindow.h"
#include "AmpleDLLWrapper.h"
#include "ListComment.h"

#define CONTROL_FOLDER_SUFFIX _T("Control Files")

// called by CProcessSequence
CModelFilesSet* CCarlaLanguage::getCopyOfModelFilesSet()
{
	return new CModelFilesSet(m_mfs);
}

CCarlaLanguage::CCarlaLanguage(CLangModelsDoc *pDoc, LPCTSTR lpszAbrev)
:	m_pAmpleDLLWrapper(NULL),
	m_displayInfo(),
	//m_bCopyInterlinearToSrcDir(FALSE),
	m_textInModel(&m_displayInfo),
	m_textOutModel(&m_displayInfo),
	m_dictOrthoModel(&m_displayInfo),
	m_commonModel(&m_displayInfo),
	m_analysisModel(&m_displayInfo),
	m_sentransGlossAdjustmentModel(&m_displayInfo),
	m_sentransAnaAdjustmentModel(&m_displayInfo), // JDH 6/2/99
	m_sentransDisambigModel(&m_displayInfo),
	m_phonruleModel(&m_displayInfo),
	m_stampSynthesisModel(&m_displayInfo),
	m_pDoc(pDoc),
	m_pTempConversionTargetLang(NULL),
	m_pFilesWiz(NULL),
	m_mfs(lpszAbrev),
	//m_bLeaveNonGoalsInTempDir(TRUE),
	m_sAbrev(lpszAbrev),	// note that these may be NULL, since we don't know the abrev yet
	m_wDisplayFlags(kLocateTransferWithTarget) // jdh 11/9/99
{
	m_pAnalysisSequence = new CAnalysisProcessSequence(this);
	m_pSynthesisSequence = new CSynthesisProcessSequence(this);
	m_pInterlinearSequence = new CInterlinearProcessSequence(this);

	// to do: I don't like these names, but currently
	// the name is both for display and identification
	// program internally.  Should separate out a display
	// name and a funtional id name
//	m_pAnalysisSequence->create("Analyzer");
//	m_pSynthesisSequence->create("Synthesizer");

	// setup a default font
	CFont* pTempFont = CFont::FromHandle( (HFONT) GetStockObject(ANSI_FIXED_FONT));
	m_displayInfo.setToCopy(pTempFont);
}

// Parameters: lpszProjectDirectory ignored if this lang file already exists
//				otherwise, it tells us where to put it (and create a directory for it if needed)
BOOL CCarlaLanguage::save(LPCTSTR lpszProjectDirectory)
{
	notifyIfNotConsistent();	// jdh 17 Sept 2001 added

	// if we haven't saved this file before, determine where to put it
	if(m_mfs.m_sCtrlFilesDirectory.GetLength() ==0 )
		m_mfs.m_sCtrlFilesDirectory = getLanguageDirectory(lpszProjectDirectory );
	else if(m_mfs.m_sCtrlFilesDirectory != getLanguageDirectory(lpszProjectDirectory))
	{
		// we get this when the whole project has been moved.
		m_mfs.m_sCtrlFilesDirectory = getLanguageDirectory(lpszProjectDirectory);
	}

	CSafeStream safeWrite(getFilePath());
	ofstream& fout = safeWrite.openStream();
	if(!fout.is_open())
	{	CString s(_T("Couldn't save the language file: "));
		s += getFilePath();
		MessageBox( NULL, s, NULL, MB_ICONERROR | MB_OK);
		return FALSE;
	}

	USES_CONVERSION_U8;
	fout << "\\id This file contains information about a CarlaStudio language.\n";
	fout << "\\co You should normally not attempt to edit this file.\n";
	fout << "\\formatversion 1\n";
	fout << "\\name " << T2CU8(m_sName) << "\n";
	fout << "\\abrev " << T2CU8(m_sAbrev) << "\n";
	//outputBool(fout, "CopyItxToSrcDir", m_bCopyInterlinearToSrcDir);
	//outputBool(fout, "LeaveNonGoalFilesInTemp", m_bLeaveNonGoalsInTempDir);
	//fout << "\\outputProcessingFlags " << m_dwOutputProcessingFlags << '\n';

	m_pDoc->writeParams(fout);
	m_displayInfo.write(fout);
	fout << "\\interface ";
	if(m_pDoc->m_pCurrentInterface == m_pDoc->m_pCarlaMenuInterface)
		fout << "carlaMenuStyle\n";
	else
		fout << "funtionalStyle\n";

	if(m_pFilesWiz)	// added mar 11 99 for beta 7
	{
		if(!m_pFilesWiz->m_analysisPage.m_sCommentChar.IsEmpty())
			// rde270 the comment char is limited to ANSI
			m_commonModel.m_cCommentChar = (char)m_pFilesWiz->m_analysisPage.m_sCommentChar.GetAt(0);
	}
	fout << "\\commentChar " << m_commonModel.m_cCommentChar << "\n"; // added feb 99

	#define WRITEPREFS(M,LIST) fout << "\\"<<M<<" "<< T2CU8(LIST.getPrefsField()) <<'\n';

	WRITEPREFS("adhocPairsPrefs",m_analysisModel.adhocPairs);
	WRITEPREFS("rtCatPairsPrefs",m_analysisModel.compoundRootCatPairs);
	WRITEPREFS("ftestPrefs",m_analysisModel.finalTests);
	WRITEPREFS("ptestPrefs",m_analysisModel.prefixTests);
	WRITEPREFS("stestPrefs",m_analysisModel.suffixTests);
	WRITEPREFS("itestPrefs",m_analysisModel.infixTests);
	WRITEPREFS("ntestPrefs",m_analysisModel.interfixTests);
	WRITEPREFS("rttestPrefs",m_analysisModel.rootTests);
	WRITEPREFS("mccPrefs",m_analysisModel.generalMCCs);
	WRITEPREFS("apPrefs",m_commonModel.m_allomorphProperties);
	WRITEPREFS("mpPrefs",m_commonModel.m_morphemeProperties);
	WRITEPREFS("catPrefs",m_commonModel.m_categories);
	WRITEPREFS("cclPrefs",m_commonModel.categoryClasses);
	WRITEPREFS("mclPrefs",m_commonModel.morphemeClasses);
	WRITEPREFS("sclPrefs",m_commonModel.stringClasses);

	WRITEPREFS("pclPrefs",m_commonModel.punctuationClasses);// 1.06 hab

	WRITEPREFS("textInOrthoPrefs",m_textInModel.m_orthoChanges);
	WRITEPREFS("textOutOrthoPrefs",m_textOutModel.m_orthoChanges);
	WRITEPREFS("dictOrthoPrefs",m_dictOrthoModel.m_orthoChanges);
	WRITEPREFS("phonrulPrefs",m_phonruleModel.m_rules);
#ifndef hab17a1
	WRITEPREFS("sampleLexChangePrefs",m_stampSynthesisModel.m_lexChanges);
#endif // hab17a1
	WRITEPREFS("sampleSoundPrefs",m_stampSynthesisModel.m_regSoundChanges);
	WRITEPREFS("sampleTestPrefs",m_stampSynthesisModel.m_tests);
	WRITEPREFS("sentAdjPrefs",m_sentransGlossAdjustmentModel.m_rules);
	WRITEPREFS("sentAnaAdjPrefs",m_sentransAnaAdjustmentModel.m_rules);// JDH 6/2/99
	WRITEPREFS("sentDisamPrefs",m_sentransDisambigModel.m_rules);

	fout << "\\DisplayFlags " << m_wDisplayFlags << "\n";	// jdh 11/9/99

	// If needed, finish conversion from CARLA MENU
	if(m_sTempConvertFromDirectory.GetLength() >0)	// will be "" after first save
	{
		LOG(_T("--------BEGIN CARLMENU CONVERSION FOR "));
		LOG(getName());
		LOG (_T("\r\n"));
		LOG (_T("Copying control files...\r\n"));
		convertFromCarla();	// first time, just copy over the files
		LOG (_T("Loading control files...\r\n"));
		loadControlFiles(TRUE, FALSE);
		LOG(_T("--------FINISHED CARLMENU CONVERSION FOR "));
		LOG(getName());
		LOG (_T("\r\n"));
	}
	else if(m_pFilesWiz)
	{
		LOG(_T("--------BEGIN FROM-FILES CREATION\r\n"));
		convertFromFiles();
		loadControlFiles(FALSE, TRUE);

		LOG(_T("--------FINISHED FROM-FILES CREATION\r\n"));
	}

	// this is here as a convenient place to fix new lang wizards (from files or from scratch)
	// that can't conveniently change the maxes according to what kind of dicts were chosen

	if(!m_mfs.getUsingUnifiedDicts())
	{
		if(m_mfs.getPrefixDictPathD().IsEmpty())
			m_analysisModel.maxPrefixes=0;

		if(m_mfs.getSuffixDictPathD().IsEmpty())
			m_analysisModel.maxSuffixes=0;

		if(m_mfs.getInfixDictPathD().IsEmpty())
			m_analysisModel.maxInfixes=0;
	}


	if(m_pAnalysisSequence)
		m_pAnalysisSequence->writeToFile(fout);

	for(int i=0; i<m_pTransferSequences.GetSize(); i++)
		m_pTransferSequences[i]->writeToFile(fout);

	if(m_pSynthesisSequence)
		m_pSynthesisSequence->writeToFile(fout);

	if(m_pInterlinearSequence)
		m_pInterlinearSequence->writeToFile(fout);


	writeControlFiles();
	m_mfs.writeToStream(fout);	// must be *after* call to convertFromFiles()

	safeWrite.close();
	return TRUE;
}


BOOL CCarlaLanguage::open(LPCTSTR lpszPathName)
{
	CString sPath(lpszPathName);
	// this isn't needed since the calling methods make sure it is here
	if(!theApp.askUserToFindFileIfNotFound(sPath, CLangModelsDoc::getRegFileTypeID()))
		return FALSE;




	CSimpleProgressBar pb(_T(""));
	pb.SetTextEx(_T("Loading"), getName(), _T(" Lang File..."));

	USES_CONVERSION_U8;
	SFMFile *pFile = new SFMFile(T2CA(sPath), getCommentChar());
	if(!pFile->ensureOpen(_T("Language Document")))
		return FALSE;
	m_mfs.m_sCtrlFilesDirectory = getDirectory(sPath);

	// rename?
	if(::_tcsicmp(m_mfs.m_sCtrlFilesDirectory.Right(14), _T("Control Files\\")))
	{
		int len = m_mfs.m_sCtrlFilesDirectory.GetLength();
		CString sOldDirName = m_mfs.m_sCtrlFilesDirectory.Left(len-1);
		CString sNewDirName = m_mfs.m_sCtrlFilesDirectory.Left(1+len-_tcslen(_T("Files\\"))) + CONTROL_FOLDER_SUFFIX;

		if(-1 == _taccess(sNewDirName, 00))	// directory not found
		{
			CString s;
			s.Format(_T("This version of CarlaStudio uses a new name for the folder that contains control files.\n\nThe folder named %s will now be renamed to %s"),
						(LPCTSTR)sOldDirName, (LPCTSTR)sNewDirName);
			AfxMessageBox(s, MB_ICONINFORMATION   );
			if(0 == _taccess(m_mfs.m_sCtrlFilesDirectory, 00))	// is the dir of the old name there?
			{
				// rename it
				TRY
				{
					CFile::Rename( sOldDirName, sNewDirName );
				}
				CATCH( CFileException, e )
				{
					::checkForFileError(m_mfs.m_sCtrlFilesDirectory);
				}
				END_CATCH
			}
			m_mfs.m_sCtrlFilesDirectory = sNewDirName + _T("\\");
		}
	}

	CString sMarker, sField;
	BOOL bEnabled;

	while(pFile->getField(sMarker, sField, &bEnabled))
	{
		if(sMarker == _T("formatversion"))
			;	// TO DO: check this & make & warn if the format is too new
		else if (sMarker == CLangModelsDoc::getLangDocBeginMarker())
			m_pDoc->readParams(*pFile);
		else if(sMarker == _T("name"))
			m_sName = sField;
		else if(sMarker == _T("abrev"))
#ifndef rde273
		{
			setAbrev(sField);

			// this is the soonest we can determine the UTF-8 safeness (now that we have the
			//  abrev and the ctrlfile path from above).
			// now that we have a CModelFilesSet, we can get the path to the intergen "outit.ctl" file
			//  (which is our best bet for determining whether this project is UTF8Safe or not). So
			//  before loading the control files (which I'm assuming are the only files that may contain
			//  non UTF-8 safe data), establish whether we're UTF-8 safe or not.
			// rde273: the .csl file contains the PC-PATR punctuation which might be UTF-8, so
			//  we had to move this here)
			if( !EstablishUTF8Safeness(m_mfs.getCtrlFilePath(_T("outit.ctl"))) )
			{
				// this means that not both projects are the same encoding. This isn't allowed at
				//  present
				CString str; str.Format(_T("The language model '%s' is using a different encoding scheme than some other language model in this project."), lpszPathName);
				AfxMessageBox(str,MB_ICONEXCLAMATION);
				return false;
			}
		}
#else   // rde273
			setAbrev(sField);
#endif  // rde273
		else if(sMarker == CTextDisplayInfo::getOldSFMMarker())
				m_displayInfo.readOld(sField);
		else if(sMarker == CTextDisplayInfo::getSFMMarker())
				m_displayInfo.read(sField);

		else if(sMarker ==  _T("commentChar")) // added feb 99
		{
			if(!sField.IsEmpty())
			{
				// sField values must be ANSI
#if !defined(rde270) && defined(_DEBUG)
				CString str(sField[0]);
				ASSERT(strlen(T2CU8(str)) <= 1);
#endif
				m_commonModel.m_cCommentChar.setData((char)sField[0]);
			}
		}
		else if (sMarker == _T("interface"))
		{
			if(sField == _T("carlaMenuStyle"))
				m_pDoc->m_pCurrentInterface = 	m_pDoc->m_pCarlaMenuInterface;
			else
				m_pDoc->m_pCurrentInterface = m_pDoc->m_pFunctionalInterface;
		}
		else if (sMarker == CTransferProcessSequence::OPENING_SFM_MARKER())
		{
			try
			{
				CTransferProcessSequence* pTPS = new CTransferProcessSequence(this, *pFile);
				m_pTransferSequences.Add(pTPS);
			}
			catch(LPCTSTR lpszError)
			{
				AfxMessageBox(lpszError);
			}
		}
		else if (sMarker == CAnalysisProcessSequence::OPENING_SFM_MARKER())
		{
			m_pAnalysisSequence->readFromFile(*pFile);
		}
		else if (sMarker == CSynthesisProcessSequence::OPENING_SFM_MARKER())
		{
				m_pSynthesisSequence->readFromFile(*pFile);
		}
		else if (sMarker == CInterlinearProcessSequence::OPENING_SFM_MARKER())
		{
				m_pInterlinearSequence->readFromFile(*pFile);
		}

#define CHECKPREFS(M,LIST) else if(sMarker==M) LIST.readPrefsField(sField)

		CHECKPREFS("adhocPairsPrefs",m_analysisModel.adhocPairs);
		CHECKPREFS("rtCatPairsPrefs",m_analysisModel.compoundRootCatPairs);
		CHECKPREFS("ftestPrefs",m_analysisModel.finalTests);
		CHECKPREFS("ptestPrefs",m_analysisModel.prefixTests);
		CHECKPREFS("stestPrefs",m_analysisModel.suffixTests);
		CHECKPREFS("itestPrefs",m_analysisModel.infixTests);
		CHECKPREFS("ntestPrefs",m_analysisModel.interfixTests);
		CHECKPREFS("rttestPrefs",m_analysisModel.rootTests);
		CHECKPREFS("mccPrefs",m_analysisModel.generalMCCs);
		CHECKPREFS("apPrefs",m_commonModel.m_allomorphProperties);
		CHECKPREFS("mpPrefs",m_commonModel.m_morphemeProperties);
		CHECKPREFS("catPrefs",m_commonModel.m_categories);
		CHECKPREFS("cclPrefs",m_commonModel.categoryClasses);
		CHECKPREFS("mclPrefs",m_commonModel.morphemeClasses);
		CHECKPREFS("sclPrefs",m_commonModel.stringClasses);

		CHECKPREFS("pclPrefs",m_commonModel.punctuationClasses);// 1.06 hab

		CHECKPREFS("textInOrthoPrefs",m_textInModel.m_orthoChanges);
		CHECKPREFS("textOutOrthoPrefs",m_textOutModel.m_orthoChanges);
		CHECKPREFS("dictOrthoPrefs",m_dictOrthoModel.m_orthoChanges);
		CHECKPREFS("phonrulPrefs",m_phonruleModel.m_rules);
#ifndef hab17a1
		CHECKPREFS("sampleLexChangePrefs",m_stampSynthesisModel.m_lexChanges);
#endif // hab17a1
		CHECKPREFS("sampleSoundPrefs",m_stampSynthesisModel.m_regSoundChanges);
		CHECKPREFS("sampleTestPrefs",m_stampSynthesisModel.m_tests);
		CHECKPREFS("sentAdjPrefs",m_sentransGlossAdjustmentModel.m_rules);
		CHECKPREFS("sentAnaAdjPrefs",m_sentransAnaAdjustmentModel.m_rules); // JDH 6/2/99
		CHECKPREFS("sentDisamPrefs",m_sentransDisambigModel.m_rules);
		// prefs for transfer stuff is saved by the individual models in their own files,
		// to simplify my life

		else if(m_mfs.recognizeField(sMarker, sField))
		{}
		else if(sMarker == _T("_sh"))	// shoebox
		{}	// skip it
		else if (sMarker == _T("id"))	//comment
		{}
		else if (sMarker == _T("co"))	//comment
		{
			// comments in here are carlastudio comments, so not reason to tell the user
		}
		else if (sMarker == _T("CopyItxToSrcDir"))	//this has been moved to the processing prefs
		{}
		//else checkAndReadBool(_T("CopyItxToSrcDir"), m_bCopyInterlinearToSrcDir)
		//else checkAndReadBool(_T("LeaveNonGoalFilesInTemp"), m_bLeaveNonGoalsInTempDir)

		else if (sMarker == _T("DisplayFlags")) // jdh 11/9/99
		{
			m_wDisplayFlags = _ttoi(sField);
		}
		else
			TRACE(_T("****UNKNOWN sField [%s]  [%s]\n"), sMarker, sField);
	}

	delete pFile;
	return TRUE;
}

// sPath defaults to m_mfs.m_sCtrlFilesDirectory if NULL
CString CCarlaLanguage::getFilePath(LPCTSTR lpszDirPath)
{
	if(lpszDirPath == NULL)
		lpszDirPath = m_mfs.m_sCtrlFilesDirectory;

	CString sPath(lpszDirPath);
	ASSERTX(sPath.GetLength());
	ASSERTX(m_sAbrev.GetLength());
	sPath += m_sAbrev;
	sPath += _T(".csl");
	return sPath;
}

// called only the first time the language file is saved
CString CCarlaLanguage::getLanguageDirectory(LPCTSTR lpszProjectDirectory,  BOOL bOKToCreate)
{
	// 1) strip off the fileName of the project, leaving just its directory

	ASSERTX(lpszProjectDirectory);
	ASSERTX(*lpszProjectDirectory);	// not empty

	TCHAR path_buffer[_MAX_PATH];
	TCHAR drive[_MAX_DRIVE];
	TCHAR dir[_MAX_DIR];
	TCHAR fname[_MAX_FNAME];
	TCHAR ext[_MAX_EXT];

	_tsplitpath( lpszProjectDirectory, drive, dir, fname, ext );
	_stprintf(path_buffer, _T("%s%s"), drive, dir);

	// 2) add the name of our directory
	CString sPath = path_buffer;
	ASSERTX(m_sAbrev.GetLength());
	sPath += m_sAbrev;
	sPath += _T(" ");
	sPath += CONTROL_FOLDER_SUFFIX;
	sPath += _T("\\");

	// 3) create our directory

	if (bOKToCreate)
		CreateDirectory(LPCTSTR(sPath), NULL); // will fail if it already exists

	return sPath;
}


CString CCarlaLanguage::getUniqueID()
{
	ASSERTX(m_sName.GetLength() > 0);
	CString sResult(m_sName);
	sResult += _T("-");
	ASSERTX(m_sAbrev.GetLength());
	sResult += m_sAbrev;
	return sResult;
}



// called by CCLangModelsDoc::OnOpenDocument
// it's not clear that we need both of these params, but I'm feeling lazy
BOOL CCarlaLanguage::loadControlFiles(BOOL bFirstLoadAfterCarlaMenuImport, BOOL bFirstLoadAfterFilesImport)
{

	BOOL bDoLogOptionalSrcFiles=TRUE;
	BOOL bDoLogOptionalTarFiles=TRUE;
	if(bFirstLoadAfterCarlaMenuImport)
	{
		BOOL bWasCMenuSource = bFirstLoadAfterCarlaMenuImport && theApp.getProject()->getSourceLang() == this;
		bDoLogOptionalSrcFiles = !bWasCMenuSource;
		bDoLogOptionalTarFiles = bWasCMenuSource;
	}
	else if(bFirstLoadAfterFilesImport)
	{
		bDoLogOptionalSrcFiles = bDoLogOptionalTarFiles = FALSE;
	}

#ifndef hab17a1
	CSimpleProgressBar progress(_T("Loading code table for analysis..."));
	BOOL bAppearsUnified; // jdh 12 sep 2001 added sanity check (bAppearsUnified)
	m_codeTable.loadFromFile(m_mfs.getCtrlFilePath(_T("cd.tab")), getCommentChar(), &bAppearsUnified);
	if(bAppearsUnified && !m_mfs.getUsingUnifiedDicts())
	{
		CString sMsg;
		sMsg.Format(_T("For the language '%s', the code table appears to be for Unified dictionaries, but this Language is set to Classic mode.  Please go to Language:Options dialog and choose the proper mode.  Also, make sure your dictionary markers are correct."), (LPCTSTR)this->m_sName);
		AfxMessageBox(sMsg);
	}
	if(!bAppearsUnified && m_mfs.getUsingUnifiedDicts())
	{
		CString sMsg;
		sMsg.Format(_T("For the language '%s', the code table appears to be for Classic dictionaries (at least there is no 'UNIFIED' marker), but this Language is set to Unified mode.  Please go to Language:Options dialog and choose the proper mode.  Also, make sure your dictionary markers are correct."), (LPCTSTR)this->m_sName);
		AfxMessageBox(sMsg);
	}

	progress.SetText(_T("Loading code table for interlinearizing..."));
#ifndef hab17a2
	CFile fTestForExistence;
	CString sPath = m_mfs.getCtrlFilePath(_T("itcd.tab"));
	if (!fTestForExistence.Open(sPath, CFile::modeReadWrite))
				// It's not there. Use cd.tab
	  CopyFile(m_mfs.getCtrlFilePath(_T("cd.tab")), sPath, FALSE);
	else
	  fTestForExistence.Close(); // It's already there, so close it.
#endif // hab17a2

	m_interCodeTable.loadFromFile(m_mfs.getCtrlFilePath(_T("itcd.tab")), getCommentChar(), &bAppearsUnified);

	progress.SetText(_T("Loading code table for synthesis..."));
#ifndef hab17a2
	sPath = m_mfs.getCtrlFilePath(_T("sycd.tab"));
	if (!fTestForExistence.Open(sPath, CFile::modeReadWrite))
				// It's not there. Use cd.tab
	  CopyFile(m_mfs.getCtrlFilePath(_T("cd.tab")), sPath, FALSE);
	else
	  fTestForExistence.Close(); // It's already there, so close it.
#endif // hab17a2
	m_synthCodeTable.loadFromFile(m_mfs.getCtrlFilePath(_T("sycd.tab")), getCommentChar(), &bAppearsUnified);
#else // hab17a1
	CSimpleProgressBar progress("Loading code table...");
	m_codeTable.loadFromFile(m_mfs.getCtrlFilePath(_T("cd.tab")), getCommentChar());
#endif // hab17a1
	progress.SetText(_T("Loading phonrule..."));
	m_phonruleModel.loadFromFile(m_mfs.getCtrlFilePath(_T("phon.rul")), m_commonModel, bDoLogOptionalSrcFiles);

	progress.SetText(_T("Loading TextIn control file..."));
	m_textInModel.loadFromFile(m_mfs.getCtrlFilePath(_T("intx.ctl")), m_commonModel, bDoLogOptionalTarFiles);

	progress.SetText(_T("Loading TextOut control file..."));
	m_textOutModel.loadFromFile(m_mfs.getCtrlFilePath(_T("outtx.ctl")), m_commonModel, bDoLogOptionalSrcFiles);

	progress.SetText(_T("Loading DictOrtho control file..."));
	m_dictOrthoModel.loadFromFile(m_mfs.getCtrlFilePath(_T("ordc.tab")), m_commonModel, bDoLogOptionalSrcFiles);

	progress.SetText(_T("Loading Analysis Data Control File..."));
	m_analysisModel.loadFromFile(m_mfs.getADCtlPath(), m_commonModel);

	progress.SetText(_T("Loading Sentrans Disambig File..."));
	m_sentransDisambigModel.loadFromFile(m_mfs.getCtrlFilePath(_T("disam.sen")), m_commonModel, bDoLogOptionalTarFiles);

	progress.SetText(_T("Loading Sentrans Gloss Adjustment File..."));
	m_sentransGlossAdjustmentModel.loadFromFile(m_mfs.getCtrlFilePath(_T("adj.sen")), m_commonModel, bDoLogOptionalTarFiles);

	// JDH 6/2/99 Added Sentrans Adjust Rules Set for analysis
	progress.SetText(_T("Loading Sentrans Anan Adjustment File..."));
	BOOL bFound = m_sentransAnaAdjustmentModel.loadFromFile(m_mfs.getCtrlFilePath(_T("ana.sen")), m_commonModel, FALSE);
	if(!bFound)
	{
		CString s(_T("Few Carla users will need these rules.  They allow you to use Sentrans lexical changes, not for glossing or transfer, but for analysis of the source language.  In order to use any rules you do put here, you will need to add a Sentrans Adjust Analysis procesor to your Analysis Sequence for this language."));
		CListEntryComment *com = new CListEntryComment(s);
		m_sentransAnaAdjustmentModel.m_rules.addItem(com);
	}

	progress.SetText(_T("Loading Stamp Synthesis File..."));
	m_stampSynthesisModel.loadFromFile(m_mfs.getStampSynthPath(), m_commonModel, bDoLogOptionalSrcFiles);
	return TRUE;
}


// checks for consistency of various parameters, and returns string
//  explaning the first inconsistency it finds.
CString CCarlaLanguage::getConsistencyMsg()
{
	if(!m_mfs.getUsingUnifiedDicts())
	{
		if(getHavePrefixes() && (m_mfs.getPrefixDictPathD().IsEmpty()))
			return CString(_T("Warning: maxPrefixes is >0 and Unified Dicts is off but no prefix dict is specified."));
		if(getHaveSuffixes() && m_mfs.getSuffixDictPathD().IsEmpty())
			return CString(_T("Warning: maxSuffixes is >0 and Unified Dicts is off but no suffix dict is specified."));
		if(getHaveInfixes() && m_mfs.getInfixDictPathD().IsEmpty())
			return CString(_T("Warning: maxInfixes is >0 and Unified Dicts is off but no infix dict is specified."));
	}

	if(!getHavePrefixes() && !m_mfs.getPrefixDictPathD().IsEmpty())
			return CString(_T("Warning: maxPrefixes is 0 but a prefix dict is specified."));

	if(!getHaveSuffixes() && !m_mfs.getSuffixDictPathD().IsEmpty())
			return CString(_T("Warning: maxSuffixes is 0 but a suffix dict is specified."));

	if(!getHaveInfixes() && !m_mfs.getInfixDictPathD().IsEmpty())
		return CString(_T("Warning: maxInfixes is 0 but an infix dict is specified."));

	// TO DO: is the presence/abscense of affix dics consistent with the code table?

	return CString();	// empty string means no problem
}

//	Returns TRUE if the language data is consistent
BOOL CCarlaLanguage::notifyIfNotConsistent()
{
	CString s = getConsistencyMsg();
	if(s.GetLength())
	{
		MessageBox( NULL, s, NULL,  MB_ICONEXCLAMATION | MB_OK);
		return FALSE;
	}
	else
		return TRUE;
}


BOOL CCarlaLanguage::getHavePrefixes() const
{
	return (m_analysisModel.maxPrefixes > 0);
}

BOOL CCarlaLanguage::getHaveSuffixes() const
{
	return (m_analysisModel.maxSuffixes > 0);
}

BOOL CCarlaLanguage::getHaveInfixes() const
{
	return (m_analysisModel.maxInfixes > 0);
}

BOOL CCarlaLanguage::writeControlFiles()
{
	if(!m_phonruleModel.writeFile(m_mfs.getCtrlFilePath(_T("phon.rul")), m_commonModel, m_codeTable, m_mfs.getUsingUnifiedDicts()))
		return FALSE;

#ifndef hab17a1
	if(!m_codeTable.writeFile(m_mfs.getCtrlFilePath(_T("cd.tab")),
							m_analysisModel.maxPrefixes>0,
							m_analysisModel.maxInfixes>0,
							m_analysisModel.maxSuffixes>0,
													m_mfs.getUsingUnifiedDicts()))
		return FALSE;
	if(!m_interCodeTable.writeFile(m_mfs.getCtrlFilePath(_T("itcd.tab")),
							m_analysisModel.maxPrefixes>0,
							m_analysisModel.maxInfixes>0,
							m_analysisModel.maxSuffixes>0,
													m_mfs.getUsingUnifiedDicts()))
		return FALSE;
	if(!m_synthCodeTable.writeFile(m_mfs.getCtrlFilePath(_T("sycd.tab")),
							m_analysisModel.maxPrefixes>0,
							m_analysisModel.maxInfixes>0,
							m_analysisModel.maxSuffixes>0,
													m_mfs.getUsingUnifiedDicts()))
		return FALSE;
#else //hab17a1
	if(!m_codeTable.writeFile(m_mfs.getCtrlFilePath("cd.tab"),
							m_analysisModel.maxPrefixes>0,
							m_analysisModel.maxInfixes>0,
							m_analysisModel.maxSuffixes>0))
		return FALSE;
#endif //hab17a1

	if(!m_textInModel.writeFile(m_mfs.getCtrlFilePath(_T("intx.ctl")), m_commonModel))
		return FALSE;

	// jdh 9/1/99 added FALSE for "include scl" parameter
	if(!m_textOutModel.writeFile(m_mfs.getCtrlFilePath(_T("outtx.ctl")), m_commonModel, FALSE))
		return FALSE;

	// jdh 9/1/99 add this special intergen-only version of outtxt.ctl
	if(!m_textOutModel.writeFile(m_mfs.getCtrlFilePath(_T("outit.ctl")), m_commonModel, TRUE))
		return FALSE;

	if(!m_dictOrthoModel.writeFile(m_mfs.getCtrlFilePath(_T("ordc.tab")), m_commonModel))
		return FALSE;

	if(!m_analysisModel.writeFile(m_mfs.getADCtlPath(), m_commonModel))
		return FALSE;

	if(!m_sentransDisambigModel.writeFile(m_mfs.getCtrlFilePath(_T("disam.sen")), m_commonModel))
		return FALSE;

	if(!m_sentransGlossAdjustmentModel.writeFile(m_mfs.getCtrlFilePath(_T("adj.sen")), m_commonModel))
		return FALSE;

	if(!m_sentransAnaAdjustmentModel.writeFile(m_mfs.getCtrlFilePath(_T("ana.sen")), m_commonModel)) //jdh 6/2/99
		return FALSE;

	for(int i=0; i< m_pTransferModelSets.GetSize() ; i++)
	{
		m_pTransferModelSets[i]->writeControlFiles(&m_mfs, m_commonModel);
	}

	if(!m_stampSynthesisModel.writeFile(m_mfs.getCtrlFilePath(_T("synt.chg")), m_commonModel))
		return FALSE;


	return TRUE;
}

char CCarlaLanguage::getCommentChar()
{
	return m_commonModel.m_cCommentChar;
}

void CCarlaLanguage::setAbrev(LPCTSTR lpszAbrev)
{
	ASSERTX(lpszAbrev);
	ASSERTX(_tcslen(lpszAbrev));
	m_sAbrev = lpszAbrev;
	m_mfs.setAbrev(lpszAbrev);
}

//	Called with bProjectCreation=TRUE when the user is creating
//			the language from scratch (no files), give a wizard
//	Called with bProjectCreation=FALSE to edit the
//				language properties, gives a tabbed dialog box
BOOL CCarlaLanguage::OnEditProperties(BOOL bProjectCreation)
{
//	CDlgLangProperties dlg(getName());

	CString s(getName());
	s+=_T(" Properties...");
	CSheetLangProperties dlg(s, this);

	//CPageDictMethod pageDictMethod(&dlg);
	//dlg.AddPage(&pageDictMethod);

	// Load the display properties page
	// make abrev read only if it's not blank.  It will be blank for new-from-files and new-from-scratch
//	CPageLangDisplay pageDisplay(_T("Display"), getAbrev().GetLength());
	dlg.m_pageDisplay.m_sAbrev = getAbrev();
	dlg.m_pageDisplay.m_sName = getName();
	m_displayInfo.getFont()->GetLogFont(&dlg.m_pageDisplay.m_logFont);
	dlg.m_pageDisplay.m_bShowMorphnamesInLangFont=m_displayInfo.m_bShowMorphnamesInLangFont;
	dlg.m_pageDisplay.m_bShowCommentsInLangFont=m_displayInfo.m_bShowCommentsInLangFont;
#ifndef hab15a5
	dlg.m_pageDisplay.m_bShowPropertiesInLangFont=m_displayInfo.m_bShowPropertiesInLangFont;
#endif // hab15a5
#ifndef hab15a7
	dlg.m_pageDisplay.m_bShowStringClassesInLangFont=m_displayInfo.m_bShowStringClassesInLangFont;
	dlg.m_pageDisplay.m_bShowMorphemeClassesInLangFont=m_displayInfo.m_bShowMorphemeClassesInLangFont;
	dlg.m_pageDisplay.m_bShowUserTestsInLangFont=m_displayInfo.m_bShowUserTestsInLangFont;
#endif // hab15a7
	//jdh 11/8/99 For Korean Windows
	dlg.m_pageDisplay.m_bDisableFontAssociation = m_displayInfo.m_bDisableFontAssociation;

	//jdh 11/9/99
	dlg.m_pageDisplay.m_bLocateTransferWithTarget = (m_wDisplayFlags & kLocateTransferWithTarget) > 0 ;

	//pageDictMethod.manageAffixPage();

//	CPageDictAffixes pageAffixDicts(_T("Affix Dicts"));

	// Load the root/unified dictionary paths page
	//CPageRootUnifiedDict pageRootUnified(m_mfs.getRootDicList(),
	//	m_mfs.getUsingUnifiedDicts(),
	//	&pageAffixDicts,
	//	FALSE); // use tab-y labels, no wizard-y ones
	//dlg.AddPage(&pageRootUnified);


	if(!m_mfs.getUsingUnifiedDicts())
	{
		//dlg.AddPage(&pageAffixDicts);
		m_mfs.exchangeAffixDictPaths(dlg.m_pageAffixDicts.m_sPrefixPath,
							dlg.m_pageAffixDicts.m_sInfixPath,
							dlg.m_pageAffixDicts.m_sSuffixPath,
							FALSE); // write these values into the property page
	}

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	readLangDisplayPage(dlg.m_pageDisplay );

	m_mfs.setUnifiedDictMode(dlg.m_pageRootUnifiedDicts.m_bUnifiedMode);

	// load in the output directories.  If one is empty, then the default will be used
	m_mfs.setOutputDirAnalyzedANA(&dlg.m_pageLocations.m_pathAnalyzedANA.m_path);
	m_mfs.setOutputDirInterlinear(&dlg.m_pageLocations.m_pathInterlinear.m_path);
	m_mfs.setOutputDirSynthesizedText(&dlg.m_pageLocations.m_pathSynthesized.m_path);
	m_mfs.setOutputDirTransferedANA(&dlg.m_pageLocations.m_pathTransferedANA.m_path);
	//m_bCopyInterlinearToSrcDir = dlg.m_pageLocations.m_bCopyInterlinearToSrcDir;
	//m_bLeaveNonGoalsInTempDir = dlg.m_pageLocations.m_bLeaveNonGoalsInTempDir;

	if(!m_mfs.getUsingUnifiedDicts())
	{
		m_mfs.exchangeAffixDictPaths(dlg.m_pageAffixDicts.m_sPrefixPath,
							dlg.m_pageAffixDicts.m_sInfixPath,
							dlg.m_pageAffixDicts.m_sSuffixPath,
							TRUE); // read these values into the mfs
	}

	m_pDoc->SetTitle(NULL);
	m_pDoc->updateInterface(); // jdh 11/9/99 in case they changed the transfer "from/to"
	theApp.getProject()->updateAllOtherWindows(); // font or name change needs to be update everywhere
	return TRUE;

/*	CWizLanguageProperties dlg(bProjectCreation);

	// Load in all our settings
	dlg.m_namesPage.m_sSrcAbrev = getAbrev();
	dlg.m_namesPage.m_sSrcName = getName();
	m_font.GetLogFont(&dlg.m_namesPage.m_srcLogFont);

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	setAbrev(dlg.m_namesPage. m_sSrcAbrev);
	setName(dlg.m_namesPage.m_sSrcName);
	m_font.Detach();// needed to avoid an assert on the next line
	m_font.CreateFontIndirect(& dlg.m_namesPage.m_srcLogFont);

	return TRUE;
	*/

}


CCarlaLanguage::~CCarlaLanguage()
{
	try
	{
		if(m_pAmpleDLLWrapper)
			delete m_pAmpleDLLWrapper;
	}
	catch (CString sError)
	{
			CString s;
			s.Format(_T("Please report this bug: Deleting AmpleDLLWrapper gave error: %s"), (LPCTSTR)sError);
			AfxMessageBox(s);
	}

	if(m_pAnalysisSequence)
		delete m_pAnalysisSequence;
	if(m_pSynthesisSequence)
		delete m_pSynthesisSequence;
	if(m_pInterlinearSequence)
		delete m_pInterlinearSequence;
	for(int i=0; i<m_pTransferModelSets.GetSize();i++)
	{
		delete m_pTransferModelSets.GetAt(i);
	}
	for(i=0; i<m_pTransferSequences.GetSize();i++)
	{
		delete m_pTransferSequences.GetAt(i);
	}
}

// returns true if the user clicked OK
BOOL CCarlaLanguage::OnEditAnalysisSeq()
{
	if(m_pAnalysisSequence)
		if(m_pAnalysisSequence->doEditDialog())
			return TRUE;	// they clicked 'OK'

	return FALSE;
}

// returns true if the user clicked OK
BOOL CCarlaLanguage::OnEditInterlinearSeq()
{
	if(m_pInterlinearSequence)
		if(m_pInterlinearSequence->doEditDialog())
			return TRUE;	// they clicked 'OK'

	return FALSE;

}

// returns true if the user clicked OK
BOOL CCarlaLanguage::OnEditSynthesisSeq()
{
	if(m_pSynthesisSequence)
		if(m_pSynthesisSequence->doEditDialog())
			return TRUE;	// they clicked 'OK'

	return FALSE;
}

BOOL CCarlaLanguage::OnEditTransferSequence(int iSeq)
{
#ifndef hab17a1
	ASSERTX(iSeq < m_pTransferSequences.GetSize());
	if ((m_wDisplayFlags & kLocateTransferWithTarget) > 0)
	  {			// User sees transfer sequence from target
				// language's perspective, so target and source
				// are flipped.
				// Get the target language (which is the source
				//  because it is shown as "From XXX".
		CCarlaLanguage *pSourceLang = m_pTransferSequences[iSeq]->getTargetLang();
		ASSERTX(pSourceLang);
		ASSERTX(pSourceLang->m_pTransferSequences.GetSize());
				// Find the transfer sequence in the true
				//  source which has this language as the
				//  target.
		for (iSeq = 0;
		 iSeq < pSourceLang->m_pTransferSequences.GetSize();
		 iSeq++)
		  if (pSourceLang->m_pTransferSequences[iSeq]->getTargetLang() == this)
		return pSourceLang->m_pTransferSequences[iSeq]->doEditDialog();
				// Something went wrong if we get here
		AfxMessageBox(_T("Could not find the requested source-target transfer mapping.  We suggest you unset the \"Display Transfer Data with the Target language instead of the Source\" box in the Language/Properties... Display tab for all languages in your project.  Then go to the source language and edit the transfer process from there.\r\n  Please send an email message to carlastudio_support@sil.org telling us that you obtained this message."), MB_OKCANCEL|MB_DEFBUTTON2|MB_ICONEXCLAMATION   );
		return FALSE;
	  }
	else
	  return m_pTransferSequences[iSeq]->doEditDialog();
#else // hab17a1
	ASSERTX(iSeq < m_pTransferSequences.GetSize());
	return m_pTransferSequences[iSeq]->doEditDialog();
#endif // hab17a1
}

void CCarlaLanguage::setFont(LOGFONT * pLogFont)
{
//	m_font.Detach();// needed to avoid an assert on the next line
//	m_font.CreateFontIndirect(pLogFont);
	m_displayInfo.setFontFromLogFont(pLogFont);
}

CLangModelsDoc* CCarlaLanguage::getLangDoc()
{
	ASSERTX(m_pDoc);
	return m_pDoc;
}

CTransferModelSet* CCarlaLanguage::addTransferSet(CCarlaLanguage * pTargetLang)
{
	CTransferModelSet* pTMS = new CTransferModelSet(&m_displayInfo, pTargetLang);
	m_pTransferModelSets.Add(pTMS);
	// load the corresponding controls, if they exist already
	pTMS->loadControlFiles(&m_mfs, m_commonModel);
	return pTMS;
}
CTransferProcessSequence* CCarlaLanguage::getTransferSequence(CCarlaLanguage* pTarget)
{
	for(int i=0; i< m_pTransferSequences.GetSize(); i++)
		if(m_pTransferSequences[i]->getTargetLang()==pTarget)
			return m_pTransferSequences[i];
	return NULL;
}

// called by BOOL CLangModelsDoc::finishCreate()
void CCarlaLanguage::loadTransferControlFiles(CCarlaLanguage* pTargetLang)
{
		CTransferModelSet* pTMS = addTransferSet(pTargetLang);
}

// Things that go in here are things that depend on knowning
// about other languages (transfer)
// Thus, this is called after all language documents have been opened
// Called by CLangModelsDoc.finishCreate()
void CCarlaLanguage::finishCreate()
{
	CProjectDoc* pDoc = getProject();
	for(int iTrg =0; iTrg<pDoc->getLangDocs().GetSize(); iTrg++)
	{
		CCarlaLanguage* pTargetLang = pDoc->getLangDocs()[iTrg]->getLang();
		if(this != pTargetLang) // no transfer to self needed
			loadTransferControlFiles(pTargetLang);
	}
	if(m_pAnalysisSequence)
		m_pAnalysisSequence->finishCreate();
	if(m_pSynthesisSequence)
		m_pSynthesisSequence->finishCreate();
	if(m_pInterlinearSequence)
		m_pInterlinearSequence->finishCreate();

	// Consistency checks related to transfer
	if(m_pTransferSequences.GetSize() != m_pTransferModelSets.GetSize())
	{
		CString s(getName());
		s+= _T("'s count of transfer sequences does not equal its count of transfer models.  Something has become corrupted, and you should get help from carlastudio_support@sil.org");
		AfxMessageBox(s);
	}
	if(m_pTransferSequences.GetSize() != (getProject()->getLangDocs().GetSize() -1))
	{
		CString s(getName());
		s+= _T("'s count of transfer sequences does not equal number of other languages in the project.  Something has become corrupted, and you should get help from carlastudio_support@sil.org");
		AfxMessageBox(s);
	}

	// finish creating the transfer sequences
	for(int i=m_pTransferSequences.GetSize()-1; i>=0; i--)
	{
		try
		{
			m_pTransferSequences[i]->finishCreate();
		}
		catch(CString sError)
		{
			m_pTransferSequences.RemoveAt(i);
			CString s(_T("The Transfer Sequence for (src) language "));
			s+= getName();
			s+= _T(" could not be created.  \nReason: ");
			s+= sError;
			s+=_T("\nThe Transfer Sequence has been removed.");
			AfxMessageBox(s);
		}
	}
}


CProjectDoc* CCarlaLanguage::getProject()
{
	return m_pDoc->getProject();
}

// This should be called when another language (not this one) is
// added to the project.  We need to know this so we can set up
// transfer information.
void CCarlaLanguage::notifyLanguageAddedToProject(CCarlaLanguage * pLang)
{
	CTransferProcessSequence* pTPS = new CTransferProcessSequence(this, pLang);
	m_pTransferSequences.Add(pTPS);

	// note that transfer model sets (as opposed to transfer process
	// sequences) are created on the fly each time the language is
	// openened, based on what other languages are opened too.

	// Currently all lang docs are closed and reopened at the end of
	// a conversion.

	// However, when we get to the place where we allow languages to
	// be added once this doc is already open and visible, we will need
	// 1) add the model sets
	// 2) to update the interface

	// Short of that, we could just add the new doc to the project, the
	// close & reopen everthing, which will create the model sets.
}

CModelFilesSet* CCarlaLanguage::getMFS()
{
	return &m_mfs;
}


// CURRENTLY UNSED
void CCarlaLanguage::setLanguagePath(LPCTSTR lpszProjectDir)
{
/*	if((m_mfs.m_sCtrlFilesDirectory.GetLength() !=0 )
		&& (m_mfs.m_sCtrlFilesDirectory != getLanguageDirectory(lpszProjectDir)))
		AfxMessageBox(_T("Warning: saving a language to a new location has not been tested (or implemented properly)."));
*/
	m_mfs.m_sCtrlFilesDirectory = getLanguageDirectory(lpszProjectDir);
}

BOOL CCarlaLanguage::getUsingDictOrtho() const
{
	return (m_dictOrthoModel.getInUse());
}


// called when this is a new language, made from scratch
void CCarlaLanguage::populateWithDefaults()
{
	// right now, all we have setup for this function is the code Table

	m_codeTable.populateWithDefaults();
#ifndef hab17a1
	m_interCodeTable.populateWithDefaults();
	m_synthCodeTable.populateWithDefaults();
#endif // hab17a1
}


// put things that belong to us but which will commonly be needed by proceses
// into the mfs, which is a class they know about.  Trying to avoid all processes
// having to know about CCarlaLanguage.
void CCarlaLanguage::prepareMFSForProcessors()
{
	m_mfs.m_cCommentChar = getCommentChar();

	// these are used by lextrans dll
#ifndef hab202
	if (m_mfs.m_bUseUnified)
	  {
		m_mfs.m_sRecordMarker = m_codeTable.m_unifiedSet.getFirstMarkerForGate('R');
		m_mfs.m_sPropertyMarker = m_codeTable.m_unifiedSet.getFirstMarkerForGate('P');
		m_mfs.m_sCategoryMarker = m_codeTable.m_unifiedSet.getFirstMarkerForGate('C');
	  }
	else
	  {
		m_mfs.m_sRecordMarker = m_codeTable.m_rootSet.getFirstMarkerForGate('R');
		m_mfs.m_sPropertyMarker = m_codeTable.m_rootSet.getFirstMarkerForGate('P');
		m_mfs.m_sCategoryMarker = m_codeTable.m_rootSet.getFirstMarkerForGate('C');
	  }
#else // hab202
	m_mfs.m_sRecordMarker = m_codeTable.m_rootSet.getFirstMarkerForGate('R');
	m_mfs.m_sPropertyMarker = m_codeTable.m_rootSet.getFirstMarkerForGate('P');
	m_mfs.m_sCategoryMarker = m_codeTable.m_rootSet.getFirstMarkerForGate('C');
#endif // hab202
}


// kind of a semi-global for all quickparse and document windows of this language
// allows them so share a single ampledll "setup" so that dicts and control files
// don't have to be reloaded unless necessary

// Exceptions: CString
CAmpleDLLWrapper* CCarlaLanguage::getAmpleDLLWrapper()
{
	if(!m_pAmpleDLLWrapper)
	{
		m_pAmpleDLLWrapper = new CAmpleDLLWrapper(this);
		try // JDH 6/2/99 catch exceptions thrown during create so we can clear the wrapper ptr
		{
			m_pAmpleDLLWrapper->create();
		}
		catch(CString sError)
		{
			delete m_pAmpleDLLWrapper;	// could remove this if necessary
			m_pAmpleDLLWrapper = NULL;
			throw sError;
		}
		catch(LPCTSTR lpszError)
		{
			delete m_pAmpleDLLWrapper;	// could remove this if necessary
			m_pAmpleDLLWrapper = NULL;
			// convert it to a CString and re-throw
			static CString sError;
			sError = lpszError;
			throw sError;
		}
	}
	return m_pAmpleDLLWrapper;
}

void CCarlaLanguage::readLangDisplayPage(CPageLangDisplay &pPage)
{
	setAbrev(pPage.m_sAbrev);
	setName(pPage.m_sName);
	setFont(&pPage.m_logFont);
	m_displayInfo.m_bShowMorphnamesInLangFont = pPage.m_bShowMorphnamesInLangFont;
	m_displayInfo.m_bShowCommentsInLangFont = pPage.m_bShowCommentsInLangFont;
#ifndef hab15a5
	m_displayInfo.m_bShowPropertiesInLangFont = pPage.m_bShowPropertiesInLangFont;
#endif // hab15a5
#ifndef hab15a7
	m_displayInfo.m_bShowStringClassesInLangFont = pPage.m_bShowStringClassesInLangFont;
	m_displayInfo.m_bShowMorphemeClassesInLangFont = pPage.m_bShowMorphemeClassesInLangFont;
	m_displayInfo.m_bShowUserTestsInLangFont = pPage.m_bShowUserTestsInLangFont;
#endif // hab15a7
	//jdh nov11-99 For Korean Windows
	m_displayInfo.m_bDisableFontAssociation = pPage.m_bDisableFontAssociation;

	//jdh 11/9/99
	m_wDisplayFlags = 0; //&= ~ kLocateTransferWithTarget; // clear it
	if(pPage.m_bLocateTransferWithTarget)
		m_wDisplayFlags |= kLocateTransferWithTarget;
}
