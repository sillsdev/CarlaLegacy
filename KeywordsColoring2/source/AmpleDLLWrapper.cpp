// CAmpleDLLWrapper.cpp: implementation of the CAmpleDLLWrapper class.
//
//////////////////////////////////////////////////////////////////////
// jdh 6/2/99 Need to reload dicts if rootGlosses option changes
// jdh 8/27/99 added Andy's check for "in entry" as a possible error indicator
// jdh 9/1/99 Wrap version warning around failed function hookups in create()
// hab 23-Sep-1999 added Andy's check for "MORPH_CHECK" as a possible error indicator
// 1.7a1 07-Dec-1999 hab added check for use of either analysis or interlinear
//                       form of dict code table.
// 2.1.0 07-Mar-2000 hab added "STRING_CHECK" as a possible error indicator
// june 13 2000 jdh add use of the DLL's OutputStyle parameter to get xml output from parseFile
// 2.3.2 19-Sep-2000 hab Have manual parse apply input text changes to string

#include "stdafx.h"
#include "AmpleDLLWrapper.h"
#include "modelFilesSet.h"
#include "CarlaLanguage.h"
#include "processStatus.h"
#ifndef hab17a1
#include "processingPrefs.h"
#endif // hab17a1

#ifdef _DEBUG
#undef pProcess_FILE
static char pProcess_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

#define AMPLE_DLL_NAME "AMPLE322.DLL"

//#define RELEASE_DEBUG

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

// Makes sure the dll is ready to use.  Does not load any data in.
// EXCEPTIONS: CProcessFailure

CAmpleDLLWrapper::CAmpleDLLWrapper(const CCarlaLanguage* pLang)
:	m_pOptions(NULL),
	m_pLang(pLang),
	m_pMFS(((CCarlaLanguage*)pLang)->getMFS()),
	m_hAmpleLib(NULL),
	m_pSetup(NULL),
	m_lastControlFileUpdate(1972, 2, 2, 1, 1, 0),
	m_lastDictUpdate(1972, 2, 2, 1, 1, 0),
	m_pfAmpleCreateSetup(NULL),
	m_pfAmpleDeleteSetup(NULL),
	m_pfAmpleLoadControlFiles(NULL),
	m_pfAmpleLoadDictionary(NULL),
	m_pfAmpleParseFile(NULL),
	m_pfAmpleParseText(NULL),
#ifndef hab218
	m_pfAmpleGetAllAllomorphs(NULL),
#endif
#ifndef hab232
	m_pfAmpleApplyInputChangesToWord(NULL),
#endif
	m_pfAmpleSetParameter(NULL),
	m_pfAmpleAddSelectiveAnalysisMorphs(NULL),
	m_pfAmpleRemoveSelectiveAnalysisMorphs(NULL),
	m_pfAmpleReportVersion(NULL),
	m_pfAmpleReset(NULL),
	m_pfAmpleInitializeMorphChecking(NULL),	/* hab 1999.06.25 */
	m_pfAmpleCheckMorphReferences(NULL),	/* hab 1999.06.25 */
	m_bLastRunHadErrors(FALSE),
	m_bPreviousOutputRootGlosses(FALSE)
	//m_bTrace(FALSE),
	//m_iMaxMorphnameLength(100)
{
}

// Exceptions: CString
void CAmpleDLLWrapper::create()
{
#ifdef RELEASE_DEBUG
	AfxMessageBox("enter create");
#endif

	ASSERT(!m_hAmpleLib); // shouldn't call Create() more than once

	// reset the dates so that we reload next time
	m_lastControlFileUpdate = CTime(1972, 2, 2, 1, 1, 0);
	m_lastDictUpdate =m_lastControlFileUpdate;

	try
	{
		m_hAmpleLib = LoadLibrary(AMPLE_DLL_NAME);
		if ((unsigned long)m_hAmpleLib < 32)
		{
			checkForSystemError(); // will put up a helpful dialog box
			m_hAmpleLib = NULL;
			CString s;
			s.Format("The file %s must be in the same folder as CarlaStudio, in the Windows/System folder,  or on you PATH statement.", AMPLE_DLL_NAME);
			throw s;
		}

		m_pfAmpleCreateSetup = (SPECAmpleCreateSetup)GetProcAddress(m_hAmpleLib,
													  "AmpleCreateSetup");
		if (m_pfAmpleCreateSetup == NULL)
		{
			m_hAmpleLib = NULL;
			throw ( "Cannot find AmpleCreateSetup in Ample DLL");
		}

		m_pfAmpleDeleteSetup = (SPECAmpleDeleteSetup)GetProcAddress(m_hAmpleLib,
													  "AmpleDeleteSetup");
		if (m_pfAmpleDeleteSetup == NULL)
		{
			m_hAmpleLib = NULL;
			throw ( "Cannot find AmpleDeleteSetup in Ample DLL");
		}


		m_pfAmpleLoadControlFiles = (SPECAmpleLoadControlFiles)GetProcAddress(m_hAmpleLib,
													  "AmpleLoadControlFiles");
		if (m_pfAmpleLoadControlFiles == NULL)
		{
			m_hAmpleLib = NULL;
			throw ( "Cannot find AmpleLoadControlFiles in Ample DLL");
		}

		   m_pfAmpleLoadDictionary = (SPECAmpleLoadDictionary)GetProcAddress(m_hAmpleLib,
													  "AmpleLoadDictionary");
		if (m_pfAmpleLoadDictionary == NULL)
		{
			m_hAmpleLib = NULL;
			throw ( "Cannot find AmpleLoadDictionary in Ample DLL");
		}

		   m_pfAmpleParseFile = (SPECAmpleParseFile)GetProcAddress(m_hAmpleLib,
													  "AmpleParseFile");
		if (m_pfAmpleParseFile == NULL)
		{
			m_hAmpleLib = NULL;
			throw ( "Cannot find AmpleParseFile in Ample DLL");
		}

		m_pfAmpleParseText = (SPECAmpleParseText)GetProcAddress(m_hAmpleLib,
													  "AmpleParseText");
		if (m_pfAmpleParseText == NULL)
		{
			m_hAmpleLib = NULL;
			throw ( "Cannot find AmpleParseText in Ample DLL");
		}


#ifndef hab218
		m_pfAmpleGetAllAllomorphs = (SPECAmpleGetAllAllomorphs)GetProcAddress(m_hAmpleLib,
													  "AmpleGetAllAllomorphs");
		if (m_pfAmpleGetAllAllomorphs == NULL)
		{
			m_hAmpleLib = NULL;
			throw ( "Cannot find AmpleGetAllAllomorphs in Ample DLL");
		}
#endif

#ifndef hab232
		m_pfAmpleApplyInputChangesToWord = (SPECAmpleApplyInputChangesToWord)GetProcAddress(m_hAmpleLib,
													"AmpleApplyInputChangesToWord");
		if (m_pfAmpleApplyInputChangesToWord == NULL)
		{
			m_hAmpleLib = NULL;
			throw ( "Cannot find AmpleApplyInputChangesToWord in Ample DLL");
		}
#endif

		m_pfAmpleSetParameter = (SPECAmpleSetParameter)GetProcAddress(m_hAmpleLib,
													  "AmpleSetParameter");
		if(m_pfAmpleSetParameter == NULL)
		{
			m_hAmpleLib = NULL;
			throw ( "Cannot find AmpleSetParameter in Ample DLL");
		}

		m_pfAmpleAddSelectiveAnalysisMorphs = (SPECAmpleAddSelectiveAnalysisMorphs)GetProcAddress(m_hAmpleLib,
													  "AmpleAddSelectiveAnalysisMorphs");
		if(m_pfAmpleAddSelectiveAnalysisMorphs == NULL)
		{
			m_hAmpleLib = NULL;
			throw ( "Cannot find AmpleAddSelectiveAnalysisMorphs in Ample DLL");
		}

		m_pfAmpleRemoveSelectiveAnalysisMorphs = (SPECAmpleRemoveSelectiveAnalysisMorphs)GetProcAddress(m_hAmpleLib,
													  "AmpleRemoveSelectiveAnalysisMorphs");
		if(m_pfAmpleRemoveSelectiveAnalysisMorphs == NULL)
		{
			m_hAmpleLib = NULL;
			throw ( "Cannot find AmpleRemoveSelectiveAnalysisMorphs in Ample DLL");
		}

		m_pfAmpleReset = (SPECAmpleReset)GetProcAddress(m_hAmpleLib,
													  "AmpleReset");
		if(m_pfAmpleReset == NULL)
		{
			m_hAmpleLib = NULL;
			throw ( "Cannot find AmpleReset in Ample DLL");
		}


		m_pfAmpleReportVersion = (SPECAmpleReportVersion)GetProcAddress(m_hAmpleLib,
													  "AmpleReportVersion");
		if(m_pfAmpleReportVersion == NULL)
		{
			m_hAmpleLib = NULL;
			throw ( "Cannot find AmpleReportVersion in Ample DLL");
		}

	  /* hab 1999.06.25 */
		m_pfAmpleInitializeMorphChecking = (SPECAmpleInitializeMorphChecking)GetProcAddress(m_hAmpleLib,
													  "AmpleInitializeMorphChecking");
		if(m_pfAmpleInitializeMorphChecking == NULL)
		{
			m_hAmpleLib = NULL;
			throw ( "Cannot find AmpleInitializeMorphChecking in Ample DLL");
		}
		m_pfAmpleCheckMorphReferences = (SPECAmpleCheckMorphReferences)GetProcAddress(m_hAmpleLib,
													  "AmpleCheckMorphReferences");
		if(m_pfAmpleCheckMorphReferences == NULL)
		{
			m_hAmpleLib = NULL;
			throw ( "Cannot find AmpleCheckMorphReferences in Ample DLL");
		}
		/* hab 1999.06.25 */
	}
	// don't catch CStrings. The caller will catch them.  //catch(CString sError)
	catch(LPCTSTR lpszError)
	{
		CString sMsg;
		sMsg.Format("There was a problem setting up the Ample32 DLL.  Make sure you have the latest version of the DLL.\r\nThe message was: \r\n%s", lpszError);
		throw(sMsg);
	}

	// MAKE THE SETUP
	if(m_pSetup)
		removeSetup();
	//no no no we don't own it	//	delete m_pSetup;

#ifdef RELEASE_DEBUG
	AfxMessageBox("create setup");
#endif
	m_pSetup = (*m_pfAmpleCreateSetup)();
	if(m_pSetup == NULL)
	{
		m_hAmpleLib = NULL;
		throw ("Could not create and Ample DLL Setup");
	}
	//setLogFile(lpszLogPath);

	#ifdef RELEASE_DEBUG
	AfxMessageBox("end create");
	#endif
}

CAmpleDLLWrapper::~CAmpleDLLWrapper()
{
	if (m_hAmpleLib != 0)
	{
		if(m_pSetup)
			removeSetup();
		FreeLibrary(m_hAmpleLib);	// decrements the reference counter and frees if zero
	}
}

// Exceptions: CString
void CAmpleDLLWrapper::throwIfError(CString & sResult)
{
	static CString sOK = "<error code=none>";
	if( sResult.Left(sOK.GetLength()) != sOK)
	{
		//AfxMessageBox(sResult);
		throw sResult;
	}
}

// Exceptions: CString
void CAmpleDLLWrapper::removeSetup()
{
	if(!m_pSetup)
		return;

	TRACE("AmpleDLLWrapper Removing Setup\n");
	static CString sResult;
	if (m_pfAmpleReset != NULL)
	{
		sResult = (*m_pfAmpleReset)(m_pSetup);
		throwIfError(sResult);
	}
	if (m_pfAmpleDeleteSetup != NULL)
	{
		sResult = (*m_pfAmpleDeleteSetup)(m_pSetup);
		throwIfError(sResult);
	}
	m_pSetup =0;
}

// called before parsing, makes sure the dicts and control files are loaded and up to date
// EXCEPTIONS: CProcessFailure
void CAmpleDLLWrapper::updateExternals(CProcessStatus& status)
{
	#ifdef RELEASE_DEBUG
	AfxMessageBox("begin updateExternals");
	#endif
//	m_hAmpleLib = GetModuleHandle(AMPLE_DLL_NAME);
	ASSERTX(m_hAmpleLib);
	ASSERTX(m_pMFS);
	CString sResult;

/*	// ~~~~ this is here to temporarily get around our problem of not being able to reset
	if(getDictFilesNeedUpdate(status) || getControlFilesNeedUpdate(status))
	{
		if(m_hAmpleLib)
			reallyFreeLibrary();	// decrements the reference counter and frees if zero
		m_hAmpleLib = NULL;
		prepareDLL();
	}
*/
	BOOL bUpdateCtrlFiles = FALSE;
	BOOL bUpdateDicts = FALSE;


	if(!m_bLastRunHadErrors)
	{
#ifndef hab17a1
		bUpdateCtrlFiles = getControlFilesNeedUpdate(status);
#else // hab17a1
		bUpdateCtrlFiles = getControlFilesNeedUpdate();
#endif // hab17a1
		bUpdateDicts = getDictFilesNeedUpdate(status);
	}

	// jdh 6/2/99 Need to reload dicts if rootGlosses option changes
	// note this will work across the QuickParse and doc windows, since they
	// share a CAmpleDLLWrapper.
	// Also, we could probably get away with only reloading if this param
	// goes from False to True; it doesn't seem to care if you go the other direction.

	if(m_pOptions && m_bPreviousOutputRootGlosses != m_pOptions->m_bOutputRootGlosses)
		bUpdateDicts = TRUE;


	// do neither or both, because I don't think I'm allowed to just do one or the other
	if(m_bLastRunHadErrors|| bUpdateCtrlFiles || bUpdateDicts)
	{
		bUpdateCtrlFiles = bUpdateDicts = TRUE;
		(*m_pfAmpleReset)(m_pSetup);
		setLogFile(NULL);
		//setOptions();
	}
	setOptions(); // feb8-99 moved here to run every time so that the qp options
					// don't interfere with the document options and vice-versa

	if(bUpdateCtrlFiles)
	{
		/* hab 1999.06.25 */
		if (m_pOptions->m_bCheckMorphnames)
		{
			sResult = (*m_pfAmpleInitializeMorphChecking)(m_pSetup);
			throwIfError(sResult);
		}
		/* hab 1999.06.25 */

#ifndef hab17a1
		CPathDescriptor pathCDTable;
		if (status.m_pProcPrefs->getDoInterlinearize())
		  pathCDTable = m_pMFS->getCtrlFilePath("itcd.tab");
		else
		  pathCDTable = m_pMFS->getCtrlFilePath("cd.tab");
#else // hab17a1
		CPathDescriptor pathCDTable = m_pMFS->getCtrlFilePath("cd.tab");
#endif //hab17a1
		//LOG2("Ample DLL Updating Control Files...\r\n", "");
		// LOAD THE CONTROL FILES
		sResult = (*m_pfAmpleLoadControlFiles)(m_pSetup, m_pMFS->getADCtlPath(),
										   pathCDTable,
										   (m_pLang->getUsingDictOrtho())
												?m_pMFS->getCtrlFilePath("ordc.tab")
												:(LPCTSTR)NULL,
										   m_pMFS->getIntxFullPath());

		throwIfError(sResult);
		m_lastControlFileUpdate = CTime::GetCurrentTime();
	}

	// load non-unified dicationaries, if any

	if(bUpdateDicts)
	{
		// jdh 6/2/99 Need to reload dicts if rootGlosses option changes
		m_bPreviousOutputRootGlosses = m_pOptions->m_bOutputRootGlosses;

		if(!m_pMFS->getUsingUnifiedDicts())
		{
			if(m_pLang->getHavePrefixes())
			{
				if(m_pMFS->getPrefixDictPathD().IsEmpty())
					;//throw(CProcessFailure(this, "Is MaxPrefixes > 0 but no prefix dictionary specified?"));
				else
				{
					const CPathDescriptor& path = m_pMFS->getPrefixDictPathD(); //m_pMFS->getDictFilesDirectory() + m_pMFS->getPrefixDictName();
					sResult = (*m_pfAmpleLoadDictionary)(m_pSetup, path.getFullPath(), "p");
					throwIfError(sResult);
				}
			}

			if(m_pLang->getHaveInfixes())
			{
				if(m_pMFS->getInfixDictPathD().IsEmpty())
					;//throw(CProcessFailure(this, "Is MaxInfixes > 0 but no infix dictionary specified?"));
				else
				{
					const CPathDescriptor& path = m_pMFS->getInfixDictPathD();// getDictFilesDirectory() + m_pMFS->getInfixDictName();
					sResult = (*m_pfAmpleLoadDictionary)(m_pSetup, path.getFullPath(), "i");
					throwIfError(sResult);
				}
			}

			if(m_pLang->getHaveSuffixes())
			{
				if(m_pMFS->getSuffixDictPathD().IsEmpty())
					;//throw(CProcessFailure(this, "Is MaxSuffixes > 0 but no suffix dictionary specified?"));
				else
				{
					const CPathDescriptor& path = m_pMFS->getSuffixDictPathD(); //getDictFilesDirectory() + m_pMFS->getSuffixDictName();
					sResult = (*m_pfAmpleLoadDictionary)(m_pSetup, path.getFullPath(), "s");
					throwIfError(sResult);
				}
			}
		}

		//LOAD ROOT DICTIONARIES
		CString sType;
		if(m_pMFS->getUsingUnifiedDicts())
			sType = "u";
		else
			sType = "r";

		for( int i=0; i< status.m_pSrcDicts.GetSize(); i++)
		{
			sResult = (*m_pfAmpleLoadDictionary)(m_pSetup, status.m_pSrcDicts[i]->getFullPath(), sType);
			throwIfError(sResult);
		}
		m_lastDictUpdate = CTime::GetCurrentTime();
	}

	/* hab 1999.06.25 */
	if (m_pOptions->m_bCheckMorphnames)
	  {
		sResult = (*m_pfAmpleCheckMorphReferences)(m_pSetup);
		throwIfError(sResult);
	  }
	/* hab 1999.06.25 */

	#ifdef RELEASE_DEBUG
	AfxMessageBox("end updateExternals");
	#endif

}

BOOL CAmpleDLLWrapper::getControlFilesNeedUpdate(CProcessStatus& status)
{
#ifndef hab17a1
		CPathDescriptor pd;
		if (status.m_pProcPrefs->getDoInterlinearize())
	  pd = m_pMFS->getCtrlFilePath("itcd.tab");
	else
	  pd = m_pMFS->getCtrlFilePath("cd.tab");
#else // hab17a1
	CPathDescriptor pd = m_pMFS->getCtrlFilePath("cd.tab");
#endif // hab17a1
	if(pd.getModifiedSince(m_lastControlFileUpdate))
		return TRUE;

	pd = m_pMFS->getCtrlFilePath("intx.ctl");
	if(pd.getModifiedSince(m_lastControlFileUpdate))
		return TRUE;

	pd = m_pMFS->getCtrlFilePath("ad.ctl");
	if(pd.getModifiedSince(m_lastControlFileUpdate))
		return TRUE;

	pd = m_pMFS->getCtrlFilePath("ordc.tab");
	if(pd.getModifiedSince(m_lastControlFileUpdate))
		return TRUE;

	return FALSE;
}

BOOL CAmpleDLLWrapper::getDictFilesNeedUpdate(CProcessStatus& status)
{
	// !!! note that we don't detect whether the use has added, removed, enabled, or disalbed a dictionary
	// Workaround: the user must close the quick parse and open another one
	for( int i=0; i< status.m_pSrcDicts.GetSize(); i++)
	{
		if(status.m_pSrcDicts[i]->getModifiedSince(m_lastDictUpdate))
			return TRUE;
	}

	if(m_pMFS->getUsingUnifiedDicts())
		return FALSE;					// nothing left to check

	const CPathDescriptor& pdP = m_pMFS->getPrefixDictPathD();
	if(!pdP.IsEmpty() && pdP.getModifiedSince(m_lastDictUpdate))
		return TRUE;

	const CPathDescriptor& pdS = m_pMFS->getSuffixDictPathD();
	if(!pdS.IsEmpty() && pdS.getModifiedSince(m_lastDictUpdate))
		return TRUE;

	const CPathDescriptor& pdI = m_pMFS->getInfixDictPathD();
	if(!pdI.IsEmpty() && pdI.getModifiedSince(m_lastDictUpdate))
		return TRUE;

	return FALSE;
}

void CAmpleDLLWrapper::setOptions(CAmpleOptions* pOptions)//int iMaxMorphnameLength, BOOL bTrace, CString sTraceMorphs)
{
	m_pOptions = pOptions;

		// jdh 6/2/99 Patch over a bug in AmpleDLL that will give an
	// "abnormal program termination" if we try to reset when the
	// previous load had glosses off, then we turn then on, then
	// reset.  So we avoid setting the options here so that the wrapper
	// can do a reset.
	if(m_pOptions->m_bOutputRootGlosses == m_bPreviousOutputRootGlosses)
		setOptions();
}

void CAmpleDLLWrapper::setOptions()
{
	ASSERTX(m_pOptions);
	char buffer[20];
	CString sResult;
	sResult = (*m_pfAmpleSetParameter)(m_pSetup, "BeginComment", CString(m_pMFS->getCommentChar()));
	throwIfError(sResult);
	sResult = (*m_pfAmpleSetParameter)(m_pSetup, "MaxMorphnameLength", itoa(m_pOptions->m_iMaxMorphnameLength, buffer, 10));
	throwIfError(sResult);
	sResult = (*m_pfAmpleSetParameter)(m_pSetup, "MaxTrieDepth", "3");
	throwIfError(sResult);
	sResult = (*m_pfAmpleSetParameter)(m_pSetup, "RootGlosses", m_pOptions->m_bOutputRootGlosses?"TRUE":"FALSE" );
	throwIfError(sResult);
	//CString sResult = (*m_pfAmpleSetParameter)(m_pSetup, "OutputStyle", xxx);// Ana, AResult, Ptext
	//throwIfError(sResult);

	sResult = (*m_pfAmpleRemoveSelectiveAnalysisMorphs)(m_pSetup);
	throwIfError(sResult);

	sResult = (*m_pfAmpleSetParameter)(m_pSetup, "TraceAnalysis", m_pOptions->m_bTrace?"ON":"OFF");
	throwIfError(sResult);

	/* hab 1999.06.25 */
	sResult = (*m_pfAmpleSetParameter)(m_pSetup, "CheckMorphReferences", m_pOptions->m_bCheckMorphnames?"TRUE":"FALSE");
	throwIfError(sResult);
	/* hab 1999.06.25 */

	if(m_pOptions->m_bTrace && m_pOptions->m_sTraceMorphs.GetLength())
	{
		sResult = (*m_pfAmpleAddSelectiveAnalysisMorphs)(m_pSetup, m_pOptions->m_sTraceMorphs);
		throwIfError(sResult);
	}

	sResult = (*m_pfAmpleSetParameter)(m_pSetup, "OutputDecomposition", m_pOptions->m_bWriteDecompField?"TRUE":"FALSE" );
	throwIfError(sResult);



	sResult = (*m_pfAmpleSetParameter)(m_pSetup, "OutputOriginalWord", m_pOptions->m_bWriteWordField?"TRUE":"FALSE" );
	throwIfError(sResult);

	sResult = (*m_pfAmpleSetParameter)(m_pSetup, "OutputProperties", m_pOptions->m_bWritePField?"TRUE":"FALSE" );
	throwIfError(sResult);

	sResult = (*m_pfAmpleSetParameter)(m_pSetup, "ShowPercentages", m_pOptions->m_bReportAmbiguityPercentages?"TRUE":"FALSE" );
	throwIfError(sResult);

//jdh june 13 2000

	sResult = (*m_pfAmpleSetParameter)(m_pSetup, "OutputStyle", m_pOptions->m_sOutputStyle);
	throwIfError(sResult);

}

void CAmpleDLLWrapper::setLogFile(LPCTSTR lpszPath/*=NULL*/)
{
	if(lpszPath)
	{
		// if we tell the dll to set the log to what it already is,
		// then we will loose any errors encountered when the Dict and
		// control files were loaded
		//if(m_sLogPath == lpszPath
		//	return;
		//else
			m_sLogPath = lpszPath;	// can also be called with NULL to use the path we already have
	}

	if(m_sLogPath.IsEmpty())
		return;

	ASSERTX(m_pfAmpleSetParameter && m_pSetup);
	if(m_pfAmpleSetParameter && m_pSetup)
	{
		TRACE ("AmpleDLLWrapper Setting LogFile to %s\n", m_sLogPath.getFullPath());
		CString sResult = (*m_pfAmpleSetParameter)(m_pSetup, "LogFile", m_sLogPath.getFullPath());
		throwIfError(sResult);
	}
}

LPAmpleSetup CAmpleDLLWrapper::getSetup()
{
	ASSERT(m_pSetup);
	return m_pSetup;
}

CString CAmpleDLLWrapper::parseFile(CPathDescriptor &input,
									CPathDescriptor &output,
									BOOL bCheckForErrors)
{
	//ASSERT(m_pfAmpleReportVersion);	// dump version out to the log file
	//(*m_pfAmpleReportVersion)(getSetup());
	CString sResult = (*m_pfAmpleParseFile)(getSetup(), input.getFullPath(), output.getFullPath());
	if(bCheckForErrors)
		checkLogForErrors();
	return sResult;
}

CString CAmpleDLLWrapper::parseString(CString &sInput, BOOL bCheckForErrors)
{
	CString sResult = (*m_pfAmpleParseText)(getSetup(), sInput);
	if(bCheckForErrors)
		checkLogForErrors();
	return sResult;
}

#ifndef hab218
CString CAmpleDLLWrapper::getAllAllomorphs(CString &sInput, CString &sState, BOOL bCheckForErrors)
{
	CString sResult = (*m_pfAmpleGetAllAllomorphs)(getSetup(), sInput, sState);
	if(bCheckForErrors)
		checkLogForErrors();
	return sResult;
}
#endif // hab218

#ifndef hab232
CString CAmpleDLLWrapper::applyInputChanges(CString &sInput)
{
	CString sResult = (*m_pfAmpleApplyInputChangesToWord)(getSetup(), sInput);
	return sResult;
}
#endif // hab232

void CAmpleDLLWrapper::checkLogForErrors()
{

#ifdef hab210
#ifndef hab15a5
	char* errorStrings[] = {"error", "Error", "Expected", "Undefined", "Cannot", "Empty", "WARNING", "MORPH_CHECK", "in entry:"}; // hab 1999.06.30 added MORPH_CHECK and "in entry:"};
#else
	char* errorStrings[] = {"error", "Error", "Expected", "Undefined", "Cannot", "Empty", "WARNING", "in entry:"}; // hab 1999.06.30 added MORPH_CHECK and "in entry:"};
#endif // hab15a5
#else // hab210
	char* errorStrings[] = {"error", "Error", "Expected", "Undefined", "Cannot", "Empty", "WARNING", "MORPH_CHECK", "in entry:", "STRING_CHECK"}; // added STRING_CHECK
#endif //hab210
	ifstream fin(m_sLogPath.getFullPath());
	if(!fin.is_open())
	{
		AfxMessageBox("Couldn't open ampledll log path");
		m_bLastRunHadErrors=TRUE;
		return;
	}

	#define kCheckSize 256
	char buff[kCheckSize+1];	// search the first kCheckSize characters of the log
	buff[0] = '\0';
	fin.read(buff, kCheckSize);
	m_bLastRunHadErrors = FALSE;
#ifdef hab210
	for(int i = 0; i<9;i++)	// hab 1999.06.30 increased 7 to 9
#else // hab210
	for(int i = 0; i<10; i++)	// increased 9 to 10
#endif //hab210
	{
		if(strstr(buff, errorStrings[i]))	//pbBuff isn't zero terminated, I think, which is why I'm doing this slower way
		{
			m_bLastRunHadErrors=TRUE;
			break;
		}
	}
}
