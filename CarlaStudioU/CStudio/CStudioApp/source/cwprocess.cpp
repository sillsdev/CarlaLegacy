// CWProcess.cpp: implementation of the CCWProcess class.
//
// 2.0.4 19-Jan-2000 hab Fix getBatchName so it allows for more than 9 processes
// 2.1.0 07-Mar-2000 hab Added processInformationFile
// rde270 25-Jun-2002   executeTool wasn't working if the current working directory was
//                      changed (this happened somehow when we opened a file from the
//                      recent files list). Now we use the run directory as a double-check
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "../resource.h" // will load the rsrc ids for carastudio, which is what we need for the progress dialog
#include <strstrea.h>
#include <fstream.h>
#include "ProcessSequence.h"
#include "ModelFilesSet.h"
#include "winerror.h"
#include <io.h>
#include <errno.h>
//#include "ProjectDoc.h"
#include "processingPrefs.h"
#include "ProcessOutput.h"
#include "ProcessStatus.h"


#include "DlgProgress.h"

static CString emptyString;

IMPLEMENT_DYNAMIC(CProcess, CObject);

CProcess::CProcess()
:m_bEnabled(TRUE)
{
}

#ifndef hab210
void CProcess::processInformationFile(CProcessStatus &status)
{
	ASSERTX(FALSE);
	//throw (CProcessFailureBadInputType(this, RAW));
}
#endif //hab210

void CProcess::processRAWTextString(CProcessStatus &status)
{
	ASSERTX(FALSE);
	//throw (CProcessFailureBadInputType(this, RAW));
}

void CProcess::processRAWTextFile(CProcessStatus &status)
{
	ASSERTX(FALSE);
	//throw (CProcessFailureBadInputType(this, RAW));
}

void CProcess::processInterlinearFile(CProcessStatus &status)
{
	ASSERTX(FALSE);
	//throw (CProcessFailureBadInputType(this, RAW));
}

void CProcess::processANAFile(CProcessStatus &status)
{
	ASSERTX(FALSE);
	//throw (CProcessFailureBadInputType(this, ANA));
}

void CProcess::processPTEXTFile(CProcessStatus &status)
{
	ASSERTX(FALSE);
	//throw (CProcessFailureBadInputType(this, PTEXT));
}


void CProcess::processDictionaries(CProcessStatus & status)
{
	ASSERTX(FALSE);
	//throw (CProcessFailureBadInputType(this, PTEXT));
}

IMPLEMENT_DYNAMIC(CDLLProcess, CProcess);
IMPLEMENT_DYNAMIC(CDOSProcess, CProcess);

CString CDOSProcess::getBatchName(CProcessStatus& status)
{
	//CCarlaLanguage* pLang = m_pOwningSequence->getSrcLang();
#ifndef hab204
	CString sBatchFile;
	sBatchFile.Format(_T("%s%d"),
			  (LPCTSTR)status.getInputMFS()->getAbrev(),
			  status.m_iProcNumber);
#else // hab204
	CString sBatchFile (status.getInputMFS()->getAbrev());
	sBatchFile+='0' + status.m_iProcNumber;
#endif // hab204
	return sBatchFile;
}

/*
 * WinExecWait(char *szCmdLine, UINT);
 *
 *  This function executes szCmdLine and doesn't return until szCmdLine is done.
 * Used by Run Batch File command.
 * Written by Doug Eberman Aug 97
 */
BOOL WinExecWait(LPCTSTR szCmdLine, UINT nCmdShow)
{

  STARTUPINFO si;
  PROCESS_INFORMATION pi;

  si.cb = sizeof(si);
  // DebugMessage ("%i", (int) sizeof(si));
  si.lpReserved = NULL;
  si.lpDesktop = NULL;
  si.lpTitle = NULL;
  si.dwFlags = STARTF_USESHOWWINDOW;
  si.wShowWindow = (WORD) nCmdShow;
  si.cbReserved2 = 0;
  si.lpReserved2 = 0;
  if (!CreateProcess (NULL, (LPTSTR)szCmdLine, NULL, NULL, FALSE,
	  CREATE_DEFAULT_ERROR_MODE, NULL, NULL, &si, &pi))
  {
	MessageBox (NULL, _T("WinExecWait failed."), _T("Installation Program"), MB_OK);
	return FALSE;
  }

  //WaitForSingleObject (pi.hProcess, 1000*60*10); // 10 minutes INFINITE);
  return TRUE;
}


BOOL CDOSProcess::executeTool(CProcessStatus& status)
{
	CString sCl = getCommandLine(status);

	/* FIND OUT WHERE THE EXECUTABLE IS */

	CString sActualPath;
#ifndef rde269
	LPTSTR lpszExePath = sActualPath.GetBuffer(MAX_PATH);
	HINSTANCE hInstance = FindExecutable(getToolPath(), NULL, lpszExePath);
	if((DWORD)hInstance == ERROR_FILE_NOT_FOUND)
	{
		// try again with the current working directory set to the dir this program is running in
		// (for some reason, when you open a recently used file, it changes the cwd and this fails
		//  even though the file is there).
		TCHAR szBuff[_MAX_PATH];
		VERIFY(::GetModuleFileName(AfxGetInstanceHandle(), szBuff, _MAX_PATH));
		CString strBuff(szBuff);
		int nIndex = strBuff.ReverseFind(_T('\\'));
		hInstance = FindExecutable(getToolPath(), strBuff.Left(nIndex), lpszExePath);
	}
#else   // rde269
	HINSTANCE hInstance = FindExecutable(getToolPath(), NULL, sActualPath.GetBuffer(MAX_PATH));
#endif  // rde269
	sActualPath.ReleaseBuffer();

	if((DWORD)hInstance == ERROR_FILE_NOT_FOUND)
	{
		CString s;
		s.Format(_T("The executable %s could not be found.  Make sure it is part of the PATH statement in your AUTOEXEC.BAT file\n"), getToolPath());
		throw(CProcessFailure(this, s));
	}
	else if((DWORD)hInstance == ERROR_PATH_NOT_FOUND)
	{
		CString s;
		s.Format(_T("Windows gave a PATH NOT FOUND error while trying to  execute %s\n"), getToolPath());
		throw(CProcessFailure(this, s));
	}
	else if((DWORD)hInstance == SE_ERR_ACCESSDENIED)
	{
		CString s;
		s.Format(_T("Windows gave an ACCESS DENIED error while trying to  execute %s\n"), getToolPath());
		throw(CProcessFailure(this, s));
	}
	else if((DWORD)hInstance <=32)
	{
		CString s;
		s.Format(_T("Unknown problem trying to execute(find?) %s\n"), getToolPath());
		throw(CProcessFailure(this, s));
	}


	CString sBatchPath = status.makeTempPath(getBatchName(status), _T(".bat"));

	USES_CONVERSION;
	ofstream fout(T2CA(sBatchPath));
	if(!fout.is_open())
	{
		MessageBox( NULL, _T("executeTool()"), _T("Couldn't open batch file for writing"), MB_ICONEXCLAMATION | MB_OK);
		return FALSE;
	}
	//TRACE("%s Command Line Length=%d\n", getToolPath(), strlen(sCl));
	fout << "REM created by CARLAStudio during a parse operation\n";
	fout << "\"" << T2CA(sActualPath) << "\" " << T2CA(sCl) << "\n";
	fout.close();

	CString s;
#ifdef Before1_04
	if(status.getVerbosity())
		s = sBatchPath;
	else
		s.Format("C:\\WINDOWS\\COMMAND.COM  /c \"%s\"", (LPCTSTR)sBatchPath);
#else  // hab and drz 1.04 to make work with NT
	TCHAR lpszCommand[MAX_PATH];
	if (RunningNT())
	{
		GetSystemDirectory(lpszCommand, MAX_PATH);
		lstrcat(lpszCommand, _T("\\cmd.exe"));
	}
	else
	{
		GetWindowsDirectory(lpszCommand, MAX_PATH);
		lstrcat(lpszCommand, _T("\\command.com"));
	}
	s.Format(_T("%s %s \"%s\""), lpszCommand,
						 (status.getVerbosity()& 0x01)  ? _T("/k") : _T("/c"), //jdh 11/10/99
						 (LPCTSTR)sBatchPath);
#endif // Before1_04

	return WinExecWait(s, TRUE); //status.getVerbosity());// false makes winoldapps

/*	 hInstance = ShellExecute(
		AfxGetMainWnd( )->m_hWnd,	// handle to parent window
		"open",	// pointer to string that specifies operation to perform
		sBatchPath,	// pointer to filename or folder name string
		NULL,	// pointer to string that specifies executable-file parameters
		// To Do: this is just a guess at the best place to put them
		//status.sRAWPath.getDirectory(),	// pointer to string that specifies default directory
		status.getTempDirectory(),
		status.getVerbosity()?SW_SHOW:SW_HIDE	// whether file is shown when opened
	   );

	return TRUE;
*/
}



CProcessTemplate::CProcessTemplate(CRuntimeClass* pClass ,
								  LPCTSTR lpszDisplayName,
								  LPCTSTR lpszInputTypeDisplay,
								  LPCTSTR lpszOutputTypeDisplay,
								  LPCTSTR lpszIdentifier,
								  DWORD allowable_seq_types,
								  long lVersion)
:	m_pClass(pClass),
	m_sDisplayName(lpszDisplayName),
	m_sIdentifier(lpszIdentifier),
	m_lVersion(lVersion),
	m_sInputTypeDisplay(lpszInputTypeDisplay),
	m_sOutputTypeDisplay(lpszOutputTypeDisplay),
	m_allowable_seq_types(allowable_seq_types)
{
}


// used to dynamically create an instance of a process
// will return null if that process is marked to only allow one instantiation
//	parameters:	pInputFile (optional).  This object is ready to
//				iSeqFunctionCode: what kind of sequence is this? (CProcess::kAnalysis, etc)
//								this is ignored by the baseclass implementation
//   give the parameters that were saved by this process.
//  Example:	\+Process JOINCOMPDLL
//				\PartialCompoundsOK 0	<--- pInputFile pointing here
//				\-Process JOINCOMPDLL

CProcess* CProcessTemplate::createProcess(int iSeqFunctionCode, SFMFile* pInputFile)
{
	CProcess* pObject = (CProcess*)m_pClass->CreateObject();
	if(pObject)
	{
		ASSERTX( pObject->IsKindOf( m_pClass ));
		if(pInputFile)
			pObject->readParametersFromSFMFile(pInputFile);
	}
	else
		AfxMessageBox(_T("Couldn't create the process.\n"));

	return pObject;
}

IMPLEMENT_DYNAMIC(CProcessTemplate, CObject);

void CProcessTemplate::addItemToListControl(CListCtrl & clc, const CProcessSequence* pSeq)
{
	LV_ITEM lvi;
	lvi.mask = LVIF_TEXT | LVIF_PARAM |LVIF_STATE; //; | LVIF_STATE;
	lvi.pszText = LPSTR_TEXTCALLBACK;   // app. maintains text
	lvi.iImage = 1;                     // image list index

	lvi.iSubItem = 0;
	lvi.iItem = 999;	// make it the last
	lvi.lParam = (LPARAM) this;

	if(!getCanAddToSeq(pSeq))
		lvi.state =  INDEXTOOVERLAYMASK(1); // draw the 'not' icon over it
		//lvi.state = 	LVIS_CUT;
	else
	{	lvi.state = 0; // getStateValue();
		lvi.stateMask = LVIS_OVERLAYMASK;
		ASSERTX(-1 != clc.InsertItem(&lvi));	// only insert the availible ones
	}
	//lvi.stateMask = LVIS_CUT;
	//ASSERTX(-1 != clc.InsertItem(&lvi));
}

CString CProcessTemplate::getListCtrlText(int iColumn)
{
	 switch(iColumn)
	{
		case 0: return m_sDisplayName;
				break;
		case 1: return m_sInputTypeDisplay; break;
		case 2: return m_sOutputTypeDisplay; break;

		default: ASSERTX(FALSE);
				return CString(_T("COLUMN ERROR")); ;
				break;
	}
}


void CProcess::addItemToListControl(CListCtrl & clc)
{
	LV_ITEM lvi;
	lvi.mask = LVIF_TEXT | LVIF_PARAM; //; | LVIF_STATE;
	lvi.pszText = LPSTR_TEXTCALLBACK;   // app. maintains text
	lvi.iImage = 1;                     // image list index

	lvi.iSubItem = 0;
	lvi.iItem = 999;	// make it the last
	lvi.lParam = (LPARAM) this;

	lvi.state = 0; // getStateValue();
	lvi.stateMask = 0; //LVIF_STATE;
	ASSERTX(-1 != clc.InsertItem(&lvi));
}

CString CProcess::getListCtrlText(int iColumn)
{
	USES_CONVERSION;
	switch(iColumn)
	{
		case 0: return A2CT(getDisplayName());
				break;

		case 1: return getInputTypeDisplayName();
				break;

		case 2: return getOutputTypeDisplayName();
				break;

		default: ASSERTX(FALSE);
				return CString(_T("COLUMN ERROR")); ;
				break;
	}
}


// path1 is a file we'll wait to appear.  Will throw an exception if it doesn't show up.
// then path2 will be checked, and an error will be thrown if it's not there.
void CProcess::waitForCompletion(CProcessStatus *pStatus, CPathDescriptor * path1, CPathDescriptor * path2)
{
	#define SECONDS_TO_WAIT_B4_MSG 15

/*	for(int x=0; x< 1000; x++)
	{
		pStatus->progress(NULL); // will check the cancel button
	}
*/

	for(int i=0; i< SECONDS_TO_WAIT_B4_MSG; i++)
	{
		if(path1->fileExistsAndIsClosed())
			break;
		Sleep(1000);
		pStatus->progress(NULL); // will check the cancel button
	}

	// if it's still not done, change the progress msg
	// to show impatience, so the user will be more likely
	// to click cancel
	if(!path1->fileExistsAndIsClosed())
	{
		CString s(_T("Waiting for "));
		USES_CONVERSION;
		s+= A2CT(getDisplayName());
		s+= _T(" to finish.  Click 'Cancel' to abort processing.");
		pStatus->progress(s);
	}

	while(!path1->fileExistsAndIsClosed())
	{
		Sleep(1000);
		pStatus->progress(NULL); // will check the cancel button
	}

	// working here
	//Delay(pStatus->m_pProcPrefs->m_iWaitSeconds * 100);

	if(path2 && !path2->fileExistsAndIsClosed())
	{
		CString s;
		s.Format(_T("It did not produce an expected file: %s.\nCheck this processor's log for more information."),
			(LPCTSTR)path2->getQuotedPath());

		throw(CProcessFailure(this, s));
	}

//	TRACE("%s closed\n", path1->getFullPath());
//	if(path2)
//		TRACE("  and also %s closed\n", path2->getFullPath());
}

// virtual, so subclasses can be more descriptive
CString CProcess::getInputTypeDisplayName()
{
	return getFileTypeDisplayName(getInputType());
}

// virtual, so subclasses can be more descriptive
CString CProcess::getOutputTypeDisplayName()
{
	return getFileTypeDisplayName(getOutputType());
}

//STATIC
CString CProcess::getFileTypeDisplayName(PROCESS_FILE_TYPE t)
{
	switch(t)
	{
		case INTERLINEAR: return _T("Interlinear Text"); break;
		case INFORMATION: return _T("Information"); break;
		case DICT: return _T("Dictionary"); break;
		case RAWTEXT: return _T("Text"); break;
		case ANA: return _T("ANA"); break;
		case PTEXT: return _T("PText"); break;

		default: return _T("UNKNOWN TYPE"); break;
	}
}


CProcess::~CProcess()
{

}

// virtual
// later, we can subclass these templates and do something smart here
BOOL CProcessTemplate::getCanAddToSeq(const CProcessSequence * pSeq) const
{
	return m_allowable_seq_types & pSeq->getFunctionCode();
}

/*void CResultStreamDescriptor::addItemToListControl(CListCtrl & clc, const CProcessSequence * pSeq)
{
	LV_ITEM lvi;
	lvi.mask = LVIF_TEXT | LVIF_PARAM ;//| LVIF_STATE;
	char* lpsz = new char[m_sDisplayLabel.GetLength()+1];
	strcpy (lpsz, m_sDisplayLabel);
	lvi.pszText = lpsz;//LPSTR_TEXTCALLBACK;   // app. maintains text
	//lvi.iImage = 1;                     // image list index

	lvi.iSubItem = 0;
	lvi.iItem = 999;	// make it the last
	lvi.lParam = (LPARAM) this;

	lvi.stateMask = NULL;
	ASSERTX(-1 != clc.InsertItem(&lvi));
}
*/

CString CProcessTemplate::getDisplayName()
{
	return m_sDisplayName;
}


void CProcess::registerLog(CProcessStatus& status,
						   CPathDescriptor & path,
							CCarlaLanguage *pLang/*=NULL*/,
#ifndef rde269
							int eIcon/*=CResultStream::kUnknownStatus*/
#else
							int eIcon/*=CResultStream::kNoIcon*/
#endif
							)
{
	if(path.fileExistsAndIsClosed())
		{	CResultStreamFile* logStream =
			new CResultStreamFile(
				new CResultStreamDescriptor(this),	// special log constructor
					path.getFullPath(),
					pLang, // can be null
					eIcon);

			status.registerResultStream(logStream);
		}
}


BOOL CProcess::RunningNT()
{
OSVERSIONINFO osv;
osv.dwOSVersionInfoSize = sizeof(osv);
if (!GetVersionEx(&osv))
			{
		  // error. you probably forgot to set osv.dwOSVersionInfoSize appropriately.
		  return false;
			}
return VER_PLATFORM_WIN32_NT == osv.dwPlatformId;

}
