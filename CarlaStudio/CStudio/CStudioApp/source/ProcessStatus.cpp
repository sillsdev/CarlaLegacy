//changes
//jdh 11/11/99 changed to use the TEMP environment variable instead of assuming it's in the windows dir (per Randy Regnier)
// 2.1.2 14-Mar-2000 jdh Various additions to support using dictionary preprocessors w/ quickparse
// 2.1.2 14-Mar-2000 jdh Reuse empty directories that WinNT won't let use remove
// 2.1.5 28-Mar-2000 hab Fix memory leak
//		 20-June-2000 jdh added anx as a valid ana file extension
// 2.4.0 20-Sep-2000 hab Allow for various upper/lower case in ANA file
//                       extensions

#include "stdafx.h"
#include "../resource.h" // will load the rsrc ids for carastudio, which is what we need for the progress dialog
#include "ProcessStatus.h"
#include "ModelFilesSet.h"
#include <io.h>
#include "sfmfile.h" // for throwstring macro, actually
#include <errno.h>
#include "ProcessOutput.h"
#include "ProcessingPrefs.h"
#include "DlgProgress.h"
#include "cwProcess.h"  // for CParseFailure

// for processing strings instead of files
CProcessStatus::CProcessStatus(	const CProcessingPrefs* pProcPrefs,
							   LPCTSTR lpszInputString,
								CCarlaLanguage* pInputLang,	// these are here so we can compile dlls that us this code without including
								CModelFilesSet* pInputMFS,
								CCarlaLanguage* pOuputLang,
								CModelFilesSet* pOutputMFS)
:	m_sRAWString(lpszInputString),
//	m_sTraceMorphs(lpszTraceMorphs),
	m_pProcPrefs(pProcPrefs),
	m_pProgessDlg(NULL),
	m_iProcNumber(0),
	m_iTotalProcessCount(0),
	m_iCurrentSeqFunction(-1),
	m_pInputLang(pInputLang),
	m_pOutputLang(pOuputLang),
	m_pInputMFS(pInputMFS),
	m_pOutputMFS(pOutputMFS),
	m_pSrcDicts(TRUE), // jdh 3/14/2000 plug leak
	m_pTarDicts(TRUE) // jdh 3/14/2000 plug leak
{
	if(pInputLang)
		ASSERTX(pInputMFS);
	if(pOuputLang)
		ASSERTX(pOutputMFS);
	ASSERTX(pInputLang || pOuputLang);
	loadOriginalDictsArrayFromLang();
}

// Parameters: lpszFilePath can be the path or just the file; we just use the root and throw the rest away
// WHY BOTH LANG AND ITS MFS? Because if we call CCarlaLanguage::getMFS(), then all processor DLLs have to
// include the ccarlaLanguage code.  Not good.  So the caller, which is always in carlaStudio, must supply this
CProcessStatus::CProcessStatus(LPCTSTR lpszFile,
							   const CProcessingPrefs* pProcPrefs,
							//	int iCurrentSeqFunction,
						CCarlaLanguage* pInputLang,	// these are here so we can compile dlls that us this code without including
						CModelFilesSet* pInputMFS,
						CCarlaLanguage* pOuputLang,
						CModelFilesSet* pOutputMFS)
:	m_pProcPrefs(pProcPrefs),
	m_pProgessDlg(NULL),
	m_iProcNumber(0),
	m_iTotalProcessCount(0),
	m_sFileNameRoot(getFileName(lpszFile)),
	m_iCurrentSeqFunction(-1),
	m_pInputLang(pInputLang),
	m_pOutputLang(pOuputLang),
	m_pInputMFS(pInputMFS),
	m_pOutputMFS(pOutputMFS),
	m_pSrcDicts(TRUE), // jdh 3/14/2000 plug leak
	m_pTarDicts(TRUE) // jdh 3/14/2000 plug leak
{
	if(pInputLang)
		ASSERTX(pInputMFS);
	if(pOuputLang)
		ASSERTX(pOutputMFS);
	ASSERTX(pInputLang || pOuputLang);

	CString sPath(lpszFile);
	CString sExt(sPath.Right(3));
#ifndef hab240
	sExt.MakeLower();
#endif // hab240
	 if(sExt == "ana"
		 || sExt == "anx")	// jdh 20June2000 added
		sANAPath = sPath;
	else					// assume its text (mar 12, beta 7)
		sRAWPath = sPath;
//	else
//		THROWSTRING2("CProcessStatus doesn't know how to handle a file with extension ",sExt);

	loadOriginalDictsArrayFromLang();
}


BOOL CProcessStatus::setupTempDir(LPCTSTR lpszName)
{
	CString sTempFilesDirectory;

	// when something goes wrong with a process, it may leave
	// the file open until we restart.  The idea here is to
	// notice this situation and just make a diferent directory
	const int MAXTRIES = 10;
	BOOL bDirOK=FALSE;
/*#ifdef Before1_04
	#define ROOTTEMPDIR  "C:\\WINDOWS\\TEMP\\CSTUDIO"
#else  // hab 1.04
	TCHAR lpszWinDirectory[MAX_PATH];
	GetWindowsDirectory(lpszWinDirectory, MAX_PATH);
	CString sRootTempDir;
	sRootTempDir.Format("%s\\TEMP\\CSTUDIO", lpszWinDirectory);
#endif // Before1_04
*/

	//jdh 11/11/99 changed to use the TEMP environment variable instead of assuming it's in the windows dir (per Randy Regnier)
	CString sRootTempDir;
	sRootTempDir.Format("%s\\CSTUDIO", getenv("TEMP"));


	for(int i=0; i<MAXTRIES; i++)
	{
		// paths are too long for dos
		//		GetTempPath( 1000, sTempFilesDirectory.GetBuffer(1001));
#ifdef Before1_04
		sTempFilesDirectory = ROOTTEMPDIR;
#else  // hab 1.04
		sTempFilesDirectory = sRootTempDir;
#endif // Before1_04

		CreateDirectory(sTempFilesDirectory, NULL);

		sTempFilesDirectory += "\\";
		sTempFilesDirectory += lpszName;

		sTempFilesDirectory += ('0' + i);

		BOOL bDeletedAllFiles;// jdh 3/14/2000  added this because under NT we are able to delete the files but not always the dir
		BOOL bDeletedDir = ::nukeDirectory(sTempFilesDirectory, &bDeletedAllFiles);
		if (bDeletedDir || bDeletedAllFiles)
		{
			CreateDirectory(sTempFilesDirectory, NULL);
			sTempFilesDirectory += "\\";
			bDirOK = TRUE;
			break;
		}
	}
	#define WARN_AFTER_COUNT 5

	if(!bDirOK || i > WARN_AFTER_COUNT)
	{
		CString s("The directory the CStudio uses for temporary storage, ");
#ifdef Before1_04
		s += ROOTTEMPDIR;
#else  // hab 1.04
		s += sRootTempDir;
#endif // Before1_04
		s += " has files which CStudio cannot delete.  This can happen when a processor runs into unexpected problems. You should report this situation if it continues. Quitting CarlaStudio and running it again will usually solve the problem.  If it doesn't, then restarting your computer should allow you to delete these directories.\n";
		AfxMessageBox(s);
		if(!bDirOK)
			return FALSE;
	}

	const char* x = LPCTSTR(sTempFilesDirectory);
	m_sTempFilesDirectory = sTempFilesDirectory;
	//pStatus->setInputLang(m_pLang);

	return TRUE;
}

void CProcessStatus::registerResultStream(CResultStream* pResultStream)
{
	m_pResultStreams.Add(pResultStream);
}
int CProcessStatus::getVerbosity()
{
	return m_pProcPrefs->getVerbosity();
}


CString CProcessStatus::makeTempPath(LPCTSTR lpszFileName, LPCTSTR lpszExtension)
{
	CString sPath(m_sTempFilesDirectory + lpszFileName + lpszExtension);

	int iResult = _access(sPath, 02); // ask for write permission

	if(-1 == iResult)
	{
		if(errno == EACCES)
		{
			CString sError("Some process left this file open, so it can't be written to: ");
			sError += sPath;
			throw(sError);
		}
/* to do:		else
		{
			checkForFileError(sPath);
			throw(sError);
		}
*/	}
	return sPath;
}

// this is a dangerous function; because shortPaths
// can't be generated unless the file exists, this
// will create the file if it needs to in order to return
// a short path.  If there is another process running
// (like a DOS app) that will be writing to this, this
// can screw things up.  So the suggested usage is to
// call this once at the beginning of the process and
// store the result, not calling it again.

CString CProcessStatus::makeTempPathShort(LPCTSTR lpszFileName, LPCTSTR lpszExtension)
{
	CString& sLong =  makeTempPath(lpszFileName, lpszExtension);

	int iResult = _access(sLong, 02); // ask for write permission

	if(-1 == iResult)
	{
		if(errno == EACCES)
		{
			CString sError("Some process left this file open, so it can't be written to: ");
			sError += sLong;
			throw(sError);
		}
		else if (errno == ENOENT)
		{
			TRACE("Creating %s for makeTempPath\n", sLong);
			FILE* f = fopen(sLong, "w"); // create it
			ASSERTX(f);
			fclose(f);
		}
		else
		{
			CString sError("Unknown error trying to check the access permisions of the file: ");
			sError += sLong;
			throw(sError);
		}
	}
	ASSERTX(!_access(sLong, 02));

/*	// can't get a shortpath unless the file exists.  So we
	// need to make it exist if it doesn't already

	FILE*f = fopen(sLong, "r"); // does it exist?
	if(!f)
	{
		TRACE("Creating %s for makeTempPath\n", sLong);
		f = fopen(sLong, "w"); // create it
		ASSERTX(f);
	}
	fclose(f);
*/
//return sLong;
	char shortPath[1000];
	DWORD result = GetShortPathName( sLong, shortPath, 1000);
	ASSERTX(1000 > result);
	if(!result)
	{
		::checkForFileError(sLong, FALSE);
	}
	return CString(shortPath);
}




// can be called with lpszMessage=NULL to allow cancel button checking
void CProcessStatus::progress(LPCTSTR lpszMessage, int iPercentage)
{
	if(!m_pProgessDlg)
	{	m_pProgessDlg = new CDlgProgress(IDS_ProcessSeqProgressCaption);

		m_pProgessDlg->Create();
		m_pProgessDlg->SetPos(0);
	}
	if(m_pProgessDlg->CheckCancelButton())
	{
		throw(CProcessFailure(NULL, "User Cancelled Processing"));
	}
	if(!lpszMessage)
		return; // can be called with NULL to allow cancel button checking

	if(iPercentage >-1)
	{
		m_pProgessDlg->SetStatus(lpszMessage);
		m_pProgessDlg->SetPos(iPercentage);
	}
	else
		m_pProgessDlg->SetStatusNoProgressBar(lpszMessage);
}

void CProcessStatus::closeProgressDialog()
{
	if(m_pProgessDlg)
	{
		delete m_pProgessDlg;
		m_pProgessDlg = 0;
	}
}

// these two are useful, even though the languages themselves are
// directly availible, so that processors don't need to include
// CarlaLanguage.h, which is especially bad for DLLs
CModelFilesSet* CProcessStatus::getInputMFS()
{
	ASSERTX(m_pInputMFS);
	return m_pInputMFS;
	//return m_pInputLang->getMFS();<-- this call will cause a linking problem for dlls
}

CModelFilesSet* CProcessStatus::getOutputMFS()
{
	return m_pOutputMFS;

	//if(m_pOutputLang)
	//	return m_pOutputLang->getMFS();	<-- this call will cause a linking problem for dlls
	//else return NULL;
}

void CProcessStatus::setInputLang(CCarlaLanguage * pLang)
{
	m_pInputLang = pLang;
}

void CProcessStatus::setOutputLang(CCarlaLanguage* pLang)
{
	m_pOutputLang = pLang;

}


CProcessStatus::~CProcessStatus()
{
	for(int i=0; i< m_pResultStreams.GetSize(); i++)
	{
		delete m_pResultStreams[i];
	}
/*	now handled by PathDescArray destructor

	for(i=0; i< m_pSrcDicts.GetSize(); i++)
	{
		delete m_pSrcDicts[i];
	}
	for(i=0; i< m_pTarDicts.GetSize(); i++)
	{
		delete m_pTarDicts[i];
	}
*/

//	if(pMFS)
//		delete pMFS;
	if(m_pProgessDlg)
		delete m_pProgessDlg;
}

void CProcessStatus::startingProcessor(CProcess * pProc)
{
	m_iProcNumber++;
	ASSERTX(m_iTotalProcessCount);
	int iPercentage = (int) (100.0* (float(m_iProcNumber-1) / float(m_iTotalProcessCount)));
	progress(pProc->getDisplayName(), iPercentage);
}

// before I had it sending the sequence, but then dlls would have to include CProcessSequence
void CProcessStatus::expectSequenceWithCount(int iCount)
{
	m_iTotalProcessCount += iCount; // pSeq->getProcessorCount();
}

int CProcessStatus::getProcNumber()
{
	return m_iProcNumber;
}

void CProcessStatus::finishedProcessing()
{
	progress("Finishing", 100);
}


void CProcessStatus::setCurrentSequenceFunction(int iFunction)
{
	m_iCurrentSeqFunction = iFunction;
}

void CProcessStatus::loadOriginalDictsArrayFromLang()
{
	// we store the list of paths to dictionaries so that phonrule (or its successor)
	// can feed latter processors by creating new dicts and changing these values

	// load up the src root & unified dicts, skipping disabled ones
	if(m_pInputMFS)
	{
		m_pSrcDicts.DeleteAndRemoveAll();// jdh 3/14/2000
		for(int i=0; i< m_pInputMFS->getRootDictCount(); i++)
		{
			if(m_pInputMFS->getRootDictPath(i)->m_bEnabled)
				// we have to make a copy because processors (like phonrule) are allowed to changed these paths
				m_pSrcDicts.Add (new CPathDescriptor(*m_pInputMFS->getRootDictPath(i)));
		}
	}

	// load up the src root & unified dicts, skipping disabled ones
	if(m_pOutputMFS)
	{
		m_pTarDicts.DeleteAndRemoveAll();// jdh 3/14/2000
		for(int i=0; i< m_pOutputMFS->getRootDictCount(); i++)
		{
			if(m_pOutputMFS->getRootDictPath(i)->m_bEnabled)
				// we have to make a copy because processors (like phonrule) are allowed to changed these paths
				m_pTarDicts.Add (new CPathDescriptor(*m_pOutputMFS->getRootDictPath(i)));
		}
	}
}

//jdh 3/13/2000 added in support of dictionary preprocessing for quickparse
const CProcessingPrefs* CProcessStatus::getProcPrefs()
{
	ASSERTX(m_pProcPrefs);
	return m_pProcPrefs;
}

//jdh 3/13/2000 added in support of dictionary preprocessing for quickparse
BOOL CProcessStatus::loadPreprocessedSrcDictsArrayFromLang()
{
	CPathDescArray* pDicts = m_pInputMFS->getPreprocessedDictArray();

	// if there is a list of preprocessed dicts, use it.  Otherwise, stick with the originals
	if(pDicts && pDicts->GetSize() > 0)
	{
		//LEAK HERE?
#ifndef hab215
	  m_pSrcDicts.DeleteAndRemoveAll();  // fix leak
#else // hab215
		m_pSrcDicts.RemoveAll();
#endif // hab215

		for (int i=0; i< pDicts->GetSize();i++)
		{
			CString s;
			s.Format("loadFromLang: %s\n",((*pDicts)[i])->getFullPath());
			TRACE(s);
			m_pSrcDicts.Add (new CPathDescriptor(((*pDicts)[i])->getFullPath()));
		}
		return TRUE;
	}
	else
		return FALSE;
}

//jdh 3/14/2000
void CProcessStatus::storePreprocessedSrcDictsArrayInLang()
{
	m_pInputMFS->copyInPreprocessedDictArray(&m_pSrcDicts);
}
