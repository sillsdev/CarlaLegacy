// LextransProcessor.cpp: implementation of the CLextransProcessor class.
//
// jdh 5/18/99 added -q, -p, and -n options
// jdh 11/11/99 watch the Status prefs for turning on tracing temporarily
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include <strstrea.h>
#include <fstream.h>
#include "DlgLextrans.h"
#include "LextransProcessor.h"
#include "SFMFile.h"
#include "ModelFilesSet.h"
#include "processOutput.h"
#include "processStatus.h"
#include "ProcessingPrefs.h"


#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

IMPLEMENT_DYNCREATE(CLextransProcessor, CDLLProcess);

extern "C"
{	int runProcess(char* lpszErrorStr);

	int setupProcess(char* lpszErrorStr,
				char cCommentChar,
				BOOL bDoTrace,
				BOOL bMonitorChanges,
				BOOL bReplaceCats, 	// jdh 5-18 added -q, -p, and -n options
				BOOL bReplaceProps,
				BOOL bReplaceRoots,

				const char* lpszSourceMarker,
				const char* lpszTargetLexMarker,
				const char* lpszRecordMarker,
				const char* lpszTargetCategoryMarker,
				const char* lpszTargetPropertyMarker,

				const char** plpszDictPaths,
				int nNumDicts,
				const char* lpszInputANAPath,
				const char* lpszOutANAPath,
				const char* lpszLogFilePath);
}


CLextransProcessor::CLextransProcessor()
:CDLLProcess(),
m_bUseTargetDict(FALSE),
m_bMonitorChanges(FALSE),
m_bTrace(FALSE)
{
	setDefaultValues();
}


// called by CProcess constructor
// even if the values will be read in, we need this in case some values are
// missing (as will happen when the user is upgrading to a new version)
void CLextransProcessor::setDefaultValues()
{
	m_bTrace=FALSE;
	m_bMonitorChanges=FALSE;
	m_bUseTargetDict=FALSE;
	m_sSourceMarker="src";	// WHAT SHOULD THIS BE???
	m_sTargetLexMarker="trg";
}

void CLextransProcessor::readParametersFromSFMFile(SFMFile *f)
{
	setDefaultValues();
	CString sMarker, sField;
	BOOL bEnabled;	// not really used here
	while(f->getField(sMarker, sField, &bEnabled))
	{
		if(sMarker=="-Process")
			break;
		else checkAndReadBool("MonitorChanges",m_bMonitorChanges)
		else checkAndReadBool("Trace",m_bTrace)
		else checkAndReadBool("UseTargetDict",m_bUseTargetDict)

		// jdh 5-18 added -q, -p, and -n options
		else checkAndReadBool("ReplaceCats",m_bReplaceCats)
		else checkAndReadBool("ReplaceProps",m_bReplaceProps)
		else checkAndReadBool("ReplaceRoots",m_bReplaceRoots)
		else checkAndReadString("TargetCatMarker", m_sTargetCatMarker)
		else checkAndReadString("TargetPropMarker", m_sTargetPropMarker)


		else checkAndReadString("SourceMarker", m_sSourceMarker)
		else checkAndReadString("TargetMarker", m_sTargetLexMarker)
		else
		{
			f->throwParseFailure(_T("LEXTRANSProcess"), sMarker, sField);
		}
	}
}

void CLextransProcessor::writeToStream(ostream& fout) const
{
	fout << "\\+Process " << ID() << PROC_ENABLED_STATUS <<"\n";
	outputBool(fout, "MonitorChanges", m_bMonitorChanges);
	outputBool(fout, "Trace", m_bTrace);
	outputBool(fout, "UseTargetDict", m_bUseTargetDict);

	// jdh 5-18 added -q, -p, and -n options
	outputBool(fout, "ReplaceCats", m_bReplaceCats);
	outputBool(fout, "ReplaceProps", m_bReplaceProps);
	outputBool(fout, "ReplaceRoots", m_bReplaceRoots);

	USES_CONVERSION_U8;
	if(m_sSourceMarker.GetLength())
		fout << "\\SourceMarker " << T2CU8(m_sSourceMarker) << "\n";

	if(m_sTargetLexMarker.GetLength())
		fout << "\\TargetMarker " << T2CU8(m_sTargetLexMarker) << "\n";

	if(m_sTargetCatMarker.GetLength())
		fout << "\\TargetCatMarker " << T2CU8(m_sTargetCatMarker) << "\n";
	if(m_sTargetPropMarker.GetLength())
		fout << "\\TargetPropMarker " << T2CU8(m_sTargetPropMarker) << "\n";

	fout << "\\-Process " << ID() << "\n";
}

// files used by the lextrans c code, which we need to make
// sure are closed properly
extern "C"
{
	extern FILE* logfile;
	extern FILE* errlogfile;
}

// EXCEPTIONS: CProcessFailure
void CLextransProcessor::processANAFile(CProcessStatus& status)
{
	CPathDescriptor sLOGPath ;
	try
	{
		CModelFilesSet* pMFS=NULL;
		if(m_bUseTargetDict)
		{
			pMFS = status.getOutputMFS();
			if(!pMFS)
				throw("Lextrans was set to use the target dict, but apparently there is no output language?");
		}
		else
			pMFS = status.getInputMFS();

		ASSERT(pMFS);


			CString sBaseName = status.m_sFileNameRoot + _T("-lextrans");
			sLOGPath = status.makeTempPath(sBaseName, _T(".log"));

			CPathDescriptor sOutputANAPath = status.makeTempPath(sBaseName,_T(".ana"));
			sOutputANAPath.deleteFile();
			sLOGPath.deleteFile();

			char lpszErrorStr[1000];

#ifndef hab203
			int nNumDicts = 0;
			if (m_bUseTargetDict)
			  nNumDicts = pMFS->getRootDictCount();
			else	// use any processed dictionaries
			  nNumDicts = status.m_pSrcDicts.GetSize();
#else // hab203
			int nNumDicts = pMFS->getRootDictCount();
#endif // hab203
			USES_CONVERSION_U8;
			LPSTR* ppDictNames = new LPSTR[nNumDicts];
			int nNumEnabledDicts=0;
			for(int i=0; i< nNumDicts; i++)
			{
#ifndef hab203
					CPathDescriptor* pd = NULL;
					if (m_bUseTargetDict)
				  pd = pMFS->getRootDictPath(i);
				else // use any processed dictionaries
				  pd = status.m_pSrcDicts[i];
#else // hab203
				CPathDescriptor* pd = pMFS->getRootDictPath(i);
#endif // hab203
				if(pd->m_bEnabled)
				{
					int len = pd->getFullPath().GetLength();//pMFS->getRootDictShortPath(i).GetLength();
					ppDictNames[nNumEnabledDicts] = new char[len+1];
					ASSERT(ppDictNames[nNumEnabledDicts]);
					strcpy(ppDictNames[nNumEnabledDicts], T2CA(pd->getFullPath()));
					++nNumEnabledDicts;
				}
			}

			BOOL OK =  setupProcess(lpszErrorStr,
							pMFS->getCommentChar(),
							m_bTrace ||
							(status.m_pProcPrefs->m_dwFlags & CProcessingPrefs::kTrace), // jdh 11/11/99
							m_bMonitorChanges,
							m_bReplaceCats,
							m_bReplaceProps,
							m_bReplaceRoots,
							T2CU8(m_sSourceMarker),
							T2CU8(m_sTargetLexMarker),
							T2CU8(pMFS->m_sRecordMarker),
								// jdh may 18-99 changed.  I had the semantics of these wrong, and was supplying source markers
							T2CU8(m_sTargetCatMarker), //pMFS->m_sCategoryMarker,
							T2CU8(m_sTargetPropMarker), //pMFS->m_sPropertyMarker,

							//pMFS->getRootDictPath(0)->getFullPath(),
							(LPCSTR*)ppDictNames,
							nNumEnabledDicts,
							T2CA(status.sANAPath.getFullPath()),
							T2CA(sOutputANAPath.getFullPath()),
							T2CA(sLOGPath.getFullPath()));

			// free up all the path names we actually used (not the disabled ones)
			for(i=0; i< nNumEnabledDicts; i++)
			{
				delete ppDictNames[i];
			}
			delete ppDictNames;

			if(!OK)
				throw(CProcessFailure(this, A2CT(lpszErrorStr)));

			sprintf(lpszErrorStr, "Error unknown"); // just in case...
			int  iError = runProcess(lpszErrorStr);

			if(iError)
			{
				CString s;
				s.Format(_T("LEXTRANS produced a serious error:\n%s"), A2CT(lpszErrorStr));
				throw(CProcessFailure(this, s));
			}

			if(!sOutputANAPath.fileExistsAndIsClosed())
				throw(CProcessFailure(this, _T("LEXTRANS did not produce the expected ana file.  Check the log for more information.")));

			// register ana file so the user can view it
			CResultStreamFile* anaStream =
				new CResultStreamFile(
						new CResultStreamDescriptor(this,
													_T("ANA from Lextrans"), //short description
													_T("ANA produced by Lextrans transfer"), // long description
													_T("LXT ANA") // tab label
												),
						sOutputANAPath.getFullPath(),
						status.getOutputLang());
			status.registerResultStream(anaStream);

		fclose(logfile);	// may be closed already
		if(errlogfile!=logfile)
			fclose(errlogfile);

		registerLog(status, sLOGPath,status.getOutputLang()); //getOutputLang may be null

			status.sANAPath = sOutputANAPath; // this will feed the next pass through
	}
	catch(CProcessFailure failure)
	{
		fclose(logfile);	// may be closed already
		if(errlogfile!=logfile)
			fclose(errlogfile);
		registerLog(status, sLOGPath);
		throw(failure);
	}
	catch(CString sError)
	{
		fclose(logfile);	// may be closed already
		if(errlogfile!=logfile)
			fclose(errlogfile);
		registerLog(status, sLOGPath);
		throw(CProcessFailure(this, sError));
	}
}


// iFunctionCode unused by this subclass
BOOL CLextransProcessor::doEditDialog(int iFunctionCode)
{
	CDlgLextrans dlg;

	// Load in all our settings
	dlg.m_bMonitor=	m_bMonitorChanges;
	dlg.m_bTrace =			m_bTrace;
	dlg.m_bUseTargetDict = m_bUseTargetDict;
	dlg.m_sSourceMarker =		m_sSourceMarker;
	dlg.m_sTargetLexMarker =		m_sTargetLexMarker;

	// jdh 5-18 added -q, -p, and -n options
	dlg.m_bReplaceCats  = m_bReplaceCats ;
	dlg.m_bReplaceProps  = m_bReplaceProps;
	dlg.m_bReplaceRoots  = m_bReplaceRoots;
	dlg.m_sTargetCatMarker = m_sTargetCatMarker;
	dlg.m_sTargetPropMarker = m_sTargetPropMarker;


	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_bMonitorChanges=	dlg.m_bMonitor;
	m_bTrace =			dlg.m_bTrace;
	m_bUseTargetDict = dlg.m_bUseTargetDict;
	m_sSourceMarker =	dlg.m_sSourceMarker;
	m_sTargetLexMarker =	dlg.m_sTargetLexMarker;

	// jdh 5-18 added -q, -p, and -n options
	m_bReplaceCats  = dlg.m_bReplaceCats ;
	m_bReplaceProps  = dlg.m_bReplaceProps;
	m_bReplaceRoots  = dlg.m_bReplaceRoots;
	m_sTargetCatMarker = dlg.m_sTargetCatMarker;
	m_sTargetPropMarker = dlg.m_sTargetPropMarker;



	return TRUE;
}
