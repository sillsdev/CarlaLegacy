	// JDH 6/2/99Add Sentrans Adjust Rules Set for analysis changed kAdjustSrc to kAdjustSrcGlossing
// 1.7a1 07-Dec-1999 hab Add interlinear and stamp dict code table processing

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "CarlaLanguage.h"
#include "SFMFile.h"
#include <strstrea.h>
#include "wizNewFromFiles.h"
#include "PathDescriptor.h"
#include "AnalysisProcesses.h"
#include "ProcessSequence.h"
#include "LogWindow.h"
#include "ParseStream.h"

// !!!!we could eliminate these by looking up their templates instead
#include "AmpleDLLProcess.h"
#include "SentransProcess.h"
#include "StampProcess.h"




//	Called by CProjectDoc::loadCarlaMenuFile()
//	Parameters: lpszDirOfCMenuLang the directory where the <abrev>carla.set file
//					for this language should be found
// ASSUMPTIONS: m_sAbrev has already been set
BOOL CCarlaLanguage::readCARLAMenuLangFile(char cCommentChar)//LPCTSTR lpszDirOfCMenuLang)
{
	ASSERTX(m_sAbrev.GetLength());


	// strangely, the comment char is found in the carla.set file, not the xxxcarla.set file that we're about to read
	// thus it is passed in by the CWProject
	m_commonModel.m_cCommentChar = cCommentChar;

	// 1) Open and parse the <abrev>carla.SET file for this langauge

	ASSERTX(m_sDirContainingCarlaSet);
//	ASSERTX(*lpszDirOfCMenuLang);
	CString sCarlaSetPath(m_sDirContainingCarlaSet);
	sCarlaSetPath += m_sAbrev;
	sCarlaSetPath += _T("carla.set");

	// to do: these may always be the same directory... I'm not sure enough
	// to combine them
	m_sTempConvertFromDirectory = m_sDirContainingCarlaSet;

	USES_CONVERSION;
	SFMFile f(T2CA(sCarlaSetPath), '*'); // comment won't be found in this kind of file anyhow
	if(!f.isOpen())	// that's ok, the file could have been deleted since the last run
	{
		CString s(_T("Couldn't open the CARLAMenu Language File named:"));
		s += sCarlaSetPath;
		MessageBox( NULL, s, NULL, MB_OK | MB_ICONEXCLAMATION);
		return FALSE;
	}

	CString sMarker, sField;
	BOOL bEnabled;
	CString sDictFilesDir = m_sDirContainingCarlaSet; // guess as a default

	// carla menu doesn't support unified dicts
	m_mfs.setUnifiedDictMode(FALSE);

	while(f.getField(sMarker, sField, &bEnabled))
	{
		if(sMarker == _T("DIRdict"))
		{
			if(sField.GetLength())
			{
				sDictFilesDir = sField;
				::fixDirectory(sDictFilesDir);
			}
		}
		else if(sMarker == _T("DIRadctl"))
			m_mfs.m_sAdctlFileDirectory = sField;
		else if(sMarker == _T("adctl"))
			m_mfs.m_sAdctlFileName =sField;
		else if(sMarker == _T("pfd"))
			m_mfs.setPrefixDictPath(sDictFilesDir+sField);
		else if(sMarker == _T("ifd"))
			m_mfs.setInfixDictPath(sDictFilesDir+sField);
		else if(sMarker == _T("sfd"))
			m_mfs.setSuffixDictPath(sDictFilesDir+sField);
		else if(sMarker == _T("rtd"))
		{	// this can multiple dicts, seperated by a space
			CParseStream stream(sField);
			CString sWord;
			if(sField.GetLength())
				while(stream.word(sWord, FALSE))
					m_mfs.getRootDicList()->add(sDictFilesDir +sWord);
		}
		else if(sMarker == _T("id"))
		{
		}
		else if(sMarker == _T("_sh"))	// shoebox
		{}	// skip it
		else
			TRACE(_T("****UNKNOWN FIELD in %s.set [%s]  [%s]\n"), m_sAbrev, sMarker, sField);
	}
	return TRUE;
}


// called once we know where the project directory is going, so we can create
// the folder for this language
//		TO DO: since we can now just output files, is there still a reason
//		to first copy them to the new dir?

//	TO DO: since we've become much more restrictive on adctl files,
//       this should be rewritten and simplified
void CCarlaLanguage::convertFromCarla()
{
	//	copy all the control files to our new directory for this langauge

	// adctrl files are a mess!!!
	// note that clearing these if not special will clear their special entries in the langauge file
	if(m_mfs.m_sAdctlFileDirectory == m_sTempConvertFromDirectory)
		m_mfs.m_sAdctlFileDirectory = _T("");	// make empty if not special

	ASSERTX(m_sAbrev.GetLength());
	CString sCanonicalADCTLName(m_sAbrev);
	sCanonicalADCTLName += _T("ad.ctl");

	//m_sAdctlFileName could be 1) empty 2) same as m_sTempConvertFromDirectory,
	//					or 3) different from m_sTempConvertFromDirectory

// sept 30 '98	if(sCanonicalADCTLName == m_mfs.m_sAdctlFileName)
//	sept 30 '98	m_mfs.m_sAdctlFileName = ""; // make empty if not special


//	if(m_mfs.m_sAdctlFileDirectory.GetLength()==0)	// if we have a special dir, don't copy it
//	{
		//if(m_mfs.m_sAdctlFileName.GetLength()>0)
		//	copyFile(m_sTempConvertFromDirectory, m_mfs.getCtrlFilesDirectory(), m_mfs.m_sAdctlFileName);
		//else

		// Since we're not going to allow the user to continue to reuse
		// an ad.ctl file for more than one lang (per Terry & Andy & that
		// it makes life difficult for me), copy over to the canonical name
		// for *this* language, thus making a duplicate
		// of the ad.ctl file if it was used for the other language as well.

		copyFile(m_sTempConvertFromDirectory,	// copy from dir
				m_mfs.getCtrlFilesDirectory(), // copy to dir
				m_mfs.m_sAdctlFileName,	// name of file to copy
				sCanonicalADCTLName);	// name of new file
//	}
//	else
		; //leave the file be

	// again, we're not allowing the ad.ctl to be in a different
	// dir, have a special name, or be shared with another language
	m_mfs.m_sAdctlFileDirectory = _T("");
	m_mfs.m_sAdctlFileName = _T("");

	// ASSUMPTION: the rest of the control files are always in the same dir as the <abrev>carla.set file
	copyCtrlFile(m_sTempConvertFromDirectory, _T("intx.ctl"));
	copyCtrlFile(m_sTempConvertFromDirectory, _T("outtx.ctl"));
#ifndef hab17a1
	copyCtrlFile(m_sTempConvertFromDirectory, _T("cd.tab"));
				// also create interlinear and synthesis copies
	copyCtrlFile(m_sTempConvertFromDirectory, _T("cd.tab"), _T("itcd.tab"));
	copyCtrlFile(m_sTempConvertFromDirectory, _T("cd.tab"), _T("sycd.tab"));
#else // hab17a1
	copyCtrlFile(m_sTempConvertFromDirectory, _T("cd.tab"));
#endif // hab17a1
	copyCtrlFile(m_sTempConvertFromDirectory, _T("phon.rul"));
	copyCtrlFile(m_sTempConvertFromDirectory, _T("ordc.tab"));
	copyCtrlFile(m_sTempConvertFromDirectory, _T("disam.sen"));
	copyCtrlFile(m_sTempConvertFromDirectory, _T("adj.sen"));
	copyCtrlFile(m_sTempConvertFromDirectory, _T("synt.chg"));

	if(m_pTempConversionTargetLang)
	{
		// get the sentrans transfer file
		CString s(m_pTempConversionTargetLang->getAbrev());
		s+= _T("tr.sen");
		copyCtrlFile(m_sTempConvertFromDirectory, s);

		// get the stamp transfer file
		s = m_pTempConversionTargetLang->getAbrev();
		s+= _T("tr.chg");
		copyCtrlFile(m_sTempConvertFromDirectory, s);

		m_pTempConversionTargetLang = NULL; // done with it
	}

/*	// copy the dictionary files only if they were in the same directory as the control
	// files or if the \DIRdict field in the <abrev>carla.set field was empty.
	// Otherwise, assume that the user may use these dicts for non-carla purposes
	// and leave the path for the dicts pointing there.
	if(m_sTempConvertFromDirectory == m_mfs.m_sDictFilesDirectory
		|| m_mfs.m_sDictFilesDirectory.GetLength()==0)
	{
		m_mfs.m_sDictFilesDirectory = "";	// since we're moving them to the the default location

		// copy any non-unified dicts

		if(!m_mfs.getPrefixDictPathD.IsEmpty())
			copyFile(m_sTempConvertFromDirectory, m_mfs.m_sCtrlFilesDirectory, m_mfs.getPrefixDictPathD().getFileFullName());
		if(!m_mfs.getInfixDictPathD.IsEmpty())
			copyFile(m_sTempConvertFromDirectory, m_mfs.m_sCtrlFilesDirectory, m_mfs.getInfixDictPathD().getFileFullName();
		if(!m_mfs.getSuffixDictPathD.IsEmpty())
			copyFile(m_sTempConvertFromDirectory, m_mfs.m_sCtrlFilesDirectory, m_mfs.getSuffixDictPathD().getFileFullName();

/*		// copy any unified or root dicts
		for(int i=0; i< m_mfs.getRootDictCount(); i++)
		{
			copyFile(m_sTempConvertFromDirectory, m_mfs.m_sCtrlFilesDirectory,
				m_mfs.getRootDictPath(i));
		}

	}
*/
	m_sTempConvertFromDirectory = _T("");	// clear this so we're not called to convert again


	// SETUP THE PROCESS SEQUENCES

	//  ---- analysis
	ASSERTX(m_pAnalysisSequence);
	CProcessTemplate* pPhonruleTempate = theApp.findTemplateFromID(_T("PHONRULEDLL"));
	if(pPhonruleTempate)
		m_pAnalysisSequence->addProcess(pPhonruleTempate->createProcess());

	//		ample dll
	m_pAnalysisSequence->addProcess(new CAmpleDLLProcess());

	m_pAnalysisSequence->addProcess(new CSentransProcess(CSentransProcess::kDisambig));

	//  ---- interlinear
	ASSERTX(m_pInterlinearSequence);

	// JDH 6/2/99Add Sentrans Adjust Rules Set for analysis changed kAdjustSrc to kAdjustSrcGlossing
	m_pInterlinearSequence->addProcess(new CSentransProcess(CSentransProcess::kAdjustSrcGlossing));
	m_pInterlinearSequence->addProcess(new CIntergenProcess());


	//  ---- transfer
	if(m_pTransferSequences.GetSize())	// the following assumes there can be at most one other language coming from carlamenu import
	{
		ASSERTX(m_pTransferSequences[0]);
		m_pTransferSequences[0]->addProcess(new CSentransProcess(CSentransProcess::kTransfer));
		m_pTransferSequences[0]->addProcess(new CTrampleProcess());
	}

	//  ---- synthesis
	ASSERTX(m_pSynthesisSequence);
	if(pPhonruleTempate)
		m_pSynthesisSequence->addProcess(pPhonruleTempate->createProcess());
	m_pSynthesisSequence->addProcess(new CSampleProcess());
}

// When the user fills out a convert from files wizard, we
// know where the files are on the disk.  We rely on the
// user's explicit instruction (by way of the check box)
// on whether to copy the dictionaries to the "xxx files"
//	or leave them be and record their location.
//	Either way, we always need to move the
// control files to this "xxx files" directory that is on
// the same level as the project file.  This process is
// postponed until the end of the import process, when the
// user has selected the location of the project file.
void CCarlaLanguage::convertFromFiles()
{
	ASSERTX(m_pFilesWiz);

	//	copy all the control files to our new directory for this langauge

	ASSERTX(m_sAbrev.GetLength());
	ASSERTX(m_mfs.m_sCtrlFilesDirectory.GetLength());	// OnSave sets this


	m_mfs.m_sAdctlFileDirectory = _T(""); // empty string means same as other control files

	CopyFile(m_pFilesWiz->m_analysisPage.m_sAnalysisPath, m_mfs.getCtrlFilePath(_T("ad.ctl")), FALSE);
	CopyFile(m_pFilesWiz->m_analysisPage.m_sTextInPath, m_mfs.getCtrlFilePath(_T("intx.ctl")), FALSE);
	CopyFile(m_pFilesWiz->m_analysisPage.m_sCodeTablePath, m_mfs.getCtrlFilePath(_T("cd.tab")), FALSE);
#ifndef hab17a1
				// copy file if user specified it, otherwise
				// make a copy of the required one
	if(m_pFilesWiz->m_analysisPage.m_sCodeTableItPath.GetLength())
	  CopyFile(m_pFilesWiz->m_analysisPage.m_sCodeTableItPath,
		   m_mfs.getCtrlFilePath(_T("itcd.tab")), FALSE);
	else
	  CopyFile(m_pFilesWiz->m_analysisPage.m_sCodeTablePath,
		   m_mfs.getCtrlFilePath(_T("itcd.tab")), FALSE);
	if(m_pFilesWiz->m_synthPage.m_sCodeTableStampPath.GetLength())
	  CopyFile(m_pFilesWiz->m_synthPage.m_sCodeTableStampPath,
		   m_mfs.getCtrlFilePath(_T("sycd.tab")), FALSE);
	else
	  CopyFile(m_pFilesWiz->m_analysisPage.m_sCodeTablePath,
		   m_mfs.getCtrlFilePath(_T("sycd.tab")), FALSE);
#endif // hab17a1
	if(m_pFilesWiz->m_analysisPage.m_sPhonrulePath.GetLength())
	   CopyFile(m_pFilesWiz->m_analysisPage.m_sPhonrulePath, m_mfs.getCtrlFilePath(_T("phon.rul")), FALSE);
	if(m_pFilesWiz->m_analysisPage.m_sDictOrthoPath.GetLength())
		CopyFile(m_pFilesWiz->m_analysisPage.m_sDictOrthoPath, m_mfs.getCtrlFilePath(_T("ordc.tab")), FALSE);

	// copy non-transfer sentrans-related stuff
	if(m_pFilesWiz->m_analysisPage.m_sSTDisambigPath.GetLength())
		CopyFile(m_pFilesWiz->m_analysisPage.m_sSTDisambigPath, m_mfs.getCtrlFilePath(_T("disam.sen")), FALSE);
	if(m_pFilesWiz->m_transferPage.m_sSTGlossingPath.GetLength())
		CopyFile(m_pFilesWiz->m_transferPage.m_sSTGlossingPath, m_mfs.getCtrlFilePath(_T("adj.sen")), FALSE);

	if(m_pFilesWiz->m_synthPage.m_sStampSynth.GetLength())
		CopyFile(m_pFilesWiz->m_synthPage.m_sStampSynth, m_mfs.getStampSynthPath(), FALSE);
	if(m_pFilesWiz->m_synthPage.m_sTextOut.GetLength())
		CopyFile(m_pFilesWiz->m_synthPage.m_sTextOut, m_mfs.getCtrlFilePath(_T("outtx.ctl")), FALSE);


	// store the paths to the dicts and copy if the user requested
	// this step is now taken by the code that runs the wizard, in  CLangModelsDoc::OnNewDocument()
	//exchangeWithDictPage(&m_pFilesWiz->m_dictPage, FALSE);

	// don't need this anymore
	delete m_pFilesWiz;
	m_pFilesWiz = 0;
	m_sTempConvertFromDirectory = _T("");	// this should already be empty, since it's only for CARLAMENU conversion


	addDefaultListOfProcessors();
/*	// SETUP THE PROCESS SEQUENCES


	//  ---- analysis
	ASSERTX(m_pAnalysisSequence);
	CProcessTemplate* pPhonruleTempate = theApp.findTemplateFromID("PHONRULEDLL");
	if(pPhonruleTempate)
		m_pAnalysisSequence->addProcess(pPhonruleTempate->createProcess());


	//		ample dll
	m_pAnalysisSequence->addProcess(new CAmpleDLLProcess());

	m_pAnalysisSequence->addProcess(new CSentransProcess(CSentransProcess::kDisambig));

	//  ---- interlinear
	ASSERTX(m_pInterlinearSequence);
	m_pInterlinearSequence->addProcess(new CSentransProcess(CSentransProcess::kAdjustSrcGlossing));
	m_pInterlinearSequence->addProcess(new CIntergenProcess());

	//  ---- synthesis
	ASSERTX(m_pSynthesisSequence);
	if(pPhonruleTempate)
		m_pSynthesisSequence->addProcess(pPhonruleTempate->createProcess());
	m_pSynthesisSequence->addProcess(new CSampleProcess());
	*/
}


// assumes canonical naming for the control file (used when converting from CARLAMenu)
void CCarlaLanguage::copyCtrlFile(LPCTSTR lpszFromDir, LPCTSTR lpszSuffix)
{
	ASSERTX(m_sAbrev.GetLength());
	// note: the FALSE here means that this copy will over-write an existing file
   CString sFrom(lpszFromDir);
   sFrom += m_sAbrev;	// assumes the "from" abrev is the same as ours
   sFrom += lpszSuffix;
   CopyFile(sFrom, m_mfs.getCtrlFilePath(lpszSuffix), FALSE);

}

#ifndef hab17a1
// like the one above except it creates a copy with a new suffix.
void CCarlaLanguage::copyCtrlFile(LPCTSTR lpszFromDir, LPCTSTR lpszFromSuffix, LPCTSTR lpszToSuffix)
{
	ASSERTX(m_sAbrev.GetLength());
	// note: the FALSE here means that this copy will over-write an existing file
   CString sFrom(lpszFromDir);
   sFrom += m_sAbrev;	// assumes the "from" abrev is the same as ours
   sFrom += lpszFromSuffix;
   CopyFile(sFrom, m_mfs.getCtrlFilePath(lpszToSuffix), FALSE);
}
#endif // hab17a1

// Parameters: sFromPath the full path to file to be copied
//				sToDir the directory to copy the file to
//				sFileName the name of the new file
//				lpszToFileName NULL if the src file name should be retained
void CCarlaLanguage::copyFile(CString& sFromDir, CString& sToDir, CString& sFileName, LPCTSTR lpszToFileName)
{
	CString sFromPath(sFromDir);
	sFromPath += sFileName;
	CString sToPath(sToDir);
	if(lpszToFileName)
		sToPath += lpszToFileName;
	else
		sToPath += sFileName;
	if(!CopyFile(LPCTSTR(sFromPath), LPCTSTR(sToPath), FALSE))
	{
		LOG4(_T("Couldn't copy the file: "), sFromPath, _T(" to "), sToPath + _T("\r\n"));
	}
}

// Parameters: sFromPath the full path to file to be copied
//				sToDir the directory to copy the file to
void CCarlaLanguage::copyFile(CString & sFromPath, CString & sToDir)
{
	CString sToPath(sToDir);
	sToPath += getFullFileName(sFromPath);
	if(!CopyFile(LPCTSTR(sFromPath), LPCTSTR(sToPath), FALSE))
	{
		LOG4(_T("Couldn't copy the file: "), sFromPath, _T(" to "), sToPath + _T("\r\n"));
	}
}


// called by CProjectDoc::doNewFromCarlaMenu
// This will allow us to copy over the correct sentrans transfer
//	file and stamp transfer file into the new control file directory
// Of course we can't do that just yet, because when this is
//	called the user hasn't yet chosen the location of the new
//	CarlaStudio project.
void CCarlaLanguage::setConversionTargetLang(CCarlaLanguage * pTargetLang)
{
	m_pTempConversionTargetLang = pTargetLang;
}


//	Called when we're completing an conversion from CARLAMenu,
//		and there were two languages in the CARLAMenu settings
//	This must make a TransferModelSet for that other language
//		and then tell it to copy over the relevant files to the new
//		control files directory for this language.
/*void CCarlaLanguage::importTransferSet(CCarlaLanguage * pTargetLang)
{
	CTransferModelSet* pTMS = new CTransferModelSet(pTargetLang);
	m_pTransferModelSets.Add(pTMS);
	pTMS->importCarlaMenu(&m_mfs);
}*/


	// SETUP THE PROCESS SEQUENCES
void CCarlaLanguage::addDefaultListOfProcessors()
{
	//  ---- analysis
	ASSERTX(m_pAnalysisSequence);
	CProcessTemplate* pPhonruleTempate = theApp.findTemplateFromID(_T("PHONRULEDLL"));
	if(pPhonruleTempate)
		m_pAnalysisSequence->addProcess(pPhonruleTempate->createProcess());
	//		ample dll
	m_pAnalysisSequence->addProcess(new CAmpleDLLProcess());
	//		sentrans disambig
	m_pAnalysisSequence->addProcess(new CSentransProcess(CSentransProcess::kDisambig));

	//  ---- interlinear
	ASSERTX(m_pInterlinearSequence);
	//		sentrans adjust
	m_pInterlinearSequence->addProcess(new CSentransProcess(CSentransProcess::kAdjustSrcGlossing));
	//		sentrans disambig
	m_pInterlinearSequence->addProcess(new CIntergenProcess());

	//  ---- synthesis
	ASSERTX(m_pSynthesisSequence);
	//		phonrule
	if(pPhonruleTempate)
		m_pSynthesisSequence->addProcess(pPhonruleTempate->createProcess());
	//		stamp
	m_pSynthesisSequence->addProcess(new CSampleProcess());
}
