// ProcessSettings.cpp: implementation of the CProcessSequence class.
//
// 2.1.0 14-Feb-2000 hab Added PrintANA
//       06-Mar-2000 hab Added Batch process
//       07-Mar-2000 hab Added processInformationFile
// 2.1.2 14-Mar-2000 jdh Various additions to support using dictionary preprocessors w/ quickparse
// 2.4.5 22-May-2001 hab Added ANACount; made PrintANA work with all process sequences
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "ProcessSequence.h"
#include "ProcessingPrefs.h"

#include "CARLAStudioApp.h"
#include "DlgProcessSequence.h"
#include "ProjectDoc.h"
#include <strstrea.h>
#include <fstream.h>
#include "AnalysisProcesses.h"
#include "AmpleDLLProcess.h"
#include "ToneParse.h"
#ifndef hab240
#include "ToneGen.h"
#endif //hab240
#ifndef hab210
#include "PrintANA.h"
#include "BatchProcess.h"
#endif //hab210
#include "CarlaLanguage.h"
#include "SentransProcess.h"
#include "StampProcess.h"
#include "DlgProgress.h"
#include "CCProcess.h"
#include "processStatus.h"
#include "parseStream.h"
#ifndef hab245
#include "ANACount.h"
#endif //hab245

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

extern CCarlaStudioApp theApp;

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

// default constructor
CProcessSequence::CProcessSequence(CCarlaLanguage* pLang)
: m_pLang(pLang)
{
}


CProcessSequence::~CProcessSequence()
{
	removeAll();
}
int CProcessSequence::getProcessorCount() const
{
	return m_pProcesses.GetSize();
}

BOOL CProcessSequence::doEditDialog()
{
	ASSERTX(m_pLang);
	CDlgProcessSequence dlg(getFunctionCode(), getFullName(), this);

	// Load in all our settings
	CTypedPtrArray<CPtrArray, CProcess*>  copy_pProcesses;
	copy_pProcesses.Copy(m_pProcesses);
	dlg.m_ppProcesses = &m_pProcesses;

	// put up the dialog
	if(IDOK != dlg.DoModal())
	{
		// note that this restores the list of processors, but not
		// the settings of the individual processors; that would entail
		// making a copy of the actual processors, not just the array
		// that points to them.
		m_pProcesses.Copy(copy_pProcesses);

		// note too that this is possible because the dialog doesn't
		// actually delete a process, even if the user 'deletes' it.
		// the dialog just removes it from our list of processors.
		return FALSE;
	}
	// Reload all our settings if the user clicked 'ok'

	// There will be a leak at this point for each process that
	// was removed from the sequence.  It wouldn't be hard to walk
	// through our copy_pProcesses and find these and delete them.

	return TRUE;
}

// Virtual
void CProcessSequence::writeToFile(ofstream & fout) const
{
	ASSERTX(m_pLang);
	USES_CONVERSION_U8;
	fout << "\\" << T2CU8(getOpeningSFMMarker()) << "\n";
	writeParamsToFile(fout);
	fout << "\\" << T2CU8(getClosingSFMMarker()) << "\n";
}


// Virtual
//	Called by writeToFile() of this class and subclasses
void CProcessSequence::writeParamsToFile(ofstream & fout) const
{
	for (int i=0; i < m_pProcesses.GetSize() ; i++)
	{
		CProcess* x = m_pProcesses[i];
		ASSERTX(x);
		fout << *x;
	}
}

//	Exceptions: An error string
void CProcessSequence::readFromFile(SFMFile& f)
{
	ASSERTX(m_pLang);
	CString sMarker, sField;
	BOOL bEnabled;	// not really used here
	while(f.getField(sMarker, sField, &bEnabled))
	{
		if(sMarker == _T("+Process"))
		{
			CProcess* pProc;
			CParseStream stream(sField);
			CString sID;
			stream.word(sID, TRUE);
			CProcessTemplate* pTemplate = theApp.findTemplateFromID(sID);
			if(!pTemplate)
			{
				MSG2(_T("CARLA Studio could not find a DLL for the processor with ID: "), sID);

				// don't want to stop the whole load just because this is missing
					//throw(CString("Couldn't read the Process Sequence from the project file."));


				// skip this whole entry for the missing process
				while(f.getField(sMarker, sField) && sMarker != _T("-Process"));
			}
			else
			{
				pProc = pTemplate->createProcess(-1, &f);
				int bEnabled;
				if(stream.integer(&bEnabled))	// enabled stuff added beta 6, mar 99
					pProc->m_bEnabled=bEnabled;

				ASSERTX(pProc);

				addProcess(pProc,m_pProcesses.GetSize());
			}
		}
		else if (sMarker == getClosingSFMMarker())
			break;
		else
		{
			MSG2(_T("ProcessSequence Can't understand project file marker: "), sMarker);
			throw(CString(_T("Couldn't read the Process Sequence from the project file.")));
		}
	}
}


// this should be obsoleted someday, by a wizard perhaps
// it just sticks AMPLE in our list
void CProcessSequence::setupDefault()
{
	ASSERTX(m_pLang);
	removeAll();
	// note that it would be better to find
	//			the right template and use is to create the process
	addProcess(new CAmpleProcess(), 0);
	addProcess(new CIntergenProcess(), 1);
}

void CProcessSequence::removeAll()
{
	int i = 0;
	while (i < m_pProcesses.GetSize() )
	{
		delete m_pProcesses.GetAt( i++ );
	}
	m_pProcesses.RemoveAll();
}

// default for index is -1, which means "add at the end"
void CProcessSequence::addProcess(CProcess * pProc, int index)
{
	if(index == -1)
		index = m_pProcesses.GetSize();
	m_pProcesses.InsertAt(index, pProc);
}


// STATIC
// called by the InitInstance() of the application
// makes a list of all the processors that are availble,
// both built-in to the application and found as DLLs
// in the directory of the application
void CProcessSequence::getAvailableProcessorList(	CTypedPtrArray<CPtrArray, CProcessTemplate*>& pProcessTemplates)
{
	USES_CONVERSION;
	pProcessTemplates.Add(new CProcessTemplate(
		RUNTIME_CLASS(CAmpleProcess),
		_T("Ample EXE"),
		CAmpleProcess::INPUT_TYPE_DISPLAY(),
		CAmpleProcess::OUTPUT_TYPE_DISPLAY(),
		A2CT(CAmpleProcess::ID()),
		CProcess::kAnalysis,
		0));	// to do: figure out what the version really means

	pProcessTemplates.Add(new CProcessTemplate(
		RUNTIME_CLASS(CToneParseProcess),
		_T("ToneParse"),
		CToneParseProcess::INPUT_TYPE_DISPLAY(),
		CToneParseProcess::OUTPUT_TYPE_DISPLAY(),
		A2CT(CToneParseProcess::ID()),
		CProcess::kAnalysis,
		0));	// to do: figure out what the version really means

#ifndef hab210
	pProcessTemplates.Add(new CProcessTemplate(
		RUNTIME_CLASS(CPrintANAProcess),
		_T("PrintANA"),
		CPrintANAProcess::INPUT_TYPE_DISPLAY(),
		CPrintANAProcess::OUTPUT_TYPE_DISPLAY(),
		A2CT(CPrintANAProcess::ID()),
#ifndef hab245
		CProcess::kAnalysis | CProcess::kInterlinear | CProcess::kTransfer | CProcess::kSynthesis,
#else // hab245
		CProcess::kAnalysis,
#endif // hab245
		0));	// to do: figure out what the version really means

	pProcessTemplates.Add(new CProcessTemplate(
		RUNTIME_CLASS(CBatchProcess),
		_T("Batch Processor"),
		CBatchProcess::INPUT_TYPE_DISPLAY(),
		CBatchProcess::OUTPUT_TYPE_DISPLAY(),
		A2CT(CBatchProcess::ID()),
		CProcess::kAnalysis | CProcess::kInterlinear | CProcess::kTransfer | CProcess::kSynthesis,
		0));	// to do: figure out what the version really means

#endif //hab210

#ifndef hab245
	pProcessTemplates.Add(new CProcessTemplate(
		RUNTIME_CLASS(CANACountProcess),
		_T("ANACount"),
		CANACountProcess::INPUT_TYPE_DISPLAY(),
		CANACountProcess::OUTPUT_TYPE_DISPLAY(),
		A2CT(CANACountProcess::ID()),
		CProcess::kAnalysis | CProcess::kInterlinear | CProcess::kTransfer | CProcess::kSynthesis,
		0));	// to do: figure out what the version really means
#endif // hab245

	pProcessTemplates.Add(new CProcessTemplate(
		RUNTIME_CLASS(CIntergenProcess),
		_T("Intergen"),
		CIntergenProcess::INPUT_TYPE_DISPLAY(),
		CIntergenProcess::OUTPUT_TYPE_DISPLAY(),
		A2CT(CIntergenProcess::ID()),
		CProcess::kInterlinear,
		0));	// to do: figure out what the version really means

	pProcessTemplates.Add(CSentransProcess::getTemplate());

	pProcessTemplates.Add(new CProcessTemplate(
		RUNTIME_CLASS(CTrampleProcess),
		CTrampleProcess::staticGetDisplayName(),
		CTrampleProcess::INPUT_TYPE_DISPLAY(),
		CTrampleProcess::OUTPUT_TYPE_DISPLAY(),
		A2CT(CTrampleProcess::ID()),
		CProcess::kTransfer,
		0));	// to do: figure out what the version really means

	pProcessTemplates.Add(new CProcessTemplate(
		RUNTIME_CLASS(CSampleProcess),
		CSampleProcess::staticGetDisplayName(),
		CSampleProcess::INPUT_TYPE_DISPLAY(),
		CSampleProcess::OUTPUT_TYPE_DISPLAY(),
		A2CT(CSampleProcess::ID()),
		CProcess::kSynthesis,
		0));	// to do: figure out what the version really means

#ifndef hab240
	pProcessTemplates.Add(new CProcessTemplate(
		RUNTIME_CLASS(CToneGenProcess),
		_T("ToneGen"),
		CToneGenProcess::INPUT_TYPE_DISPLAY(),
		CToneGenProcess::OUTPUT_TYPE_DISPLAY(),
		A2CT(CToneGenProcess::ID()),
		CProcess::kSynthesis,
		0));	// to do: figure out what the version really means
#endif // hab240

	pProcessTemplates.Add(new CProcessTemplate(
		RUNTIME_CLASS(CCCProcess),
		_T("CC"),
		CCCProcess::INPUT_TYPE_DISPLAY(),
		CCCProcess::OUTPUT_TYPE_DISPLAY(),
		A2CT(CCCProcess::ID()),
		CProcess::kAnalysis | CProcess::kInterlinear | CProcess::kTransfer | CProcess::kSynthesis,
		0));	// to do: figure out what the version really means

	pProcessTemplates.Add(new CProcessTemplate(
		RUNTIME_CLASS(CAmpleDLLProcess),
		_T("AmpleDLL"),
		CAmpleDLLProcess::INPUT_TYPE_DISPLAY(),
		CAmpleDLLProcess::OUTPUT_TYPE_DISPLAY(),
		A2CT(CAmpleDLLProcess::ID()),
		CProcess::kAnalysis,
		0));	// to do: figure out what the version really means


	// LOOK FOR CARLA STUDIO-compatible Processor DLLs

	// _pgmptr is a global that should have the path to our executable
#ifndef rde270
#ifdef  _UNICODE
	SetCurrentDirectory(::getDirectory(_wpgmptr));
#else
	SetCurrentDirectory(::getDirectory(_pgmptr));
#endif
#else   // rde270
	SetCurrentDirectory(::getDirectory(_pgmptr));
#endif  // rde270
	//TRACE(_T("executable at %s\n"), _pgmptr);

	WIN32_FIND_DATA findFileData;
	HANDLE hFileInfo = FindFirstFile( _T("*.DLL"), &findFileData);
	BOOL bFound = (INVALID_HANDLE_VALUE != hFileInfo);
	while (bFound)
	{
//			TRACE(_T("DLL found: %s\n"), findFileData.cFileName);

		HINSTANCE hDLL = LoadLibrary(findFileData.cFileName);
		VERIFY(hDLL); // to do
		FARPROC getCarlaProcessorTemplate
#ifndef hab270
#ifdef _UNICODE
			= GetProcAddress(hDLL, "?GetProcessTemplateU@@YAPAVCProcessTemplate@@XZ");
#else  // _UNICODE
			= GetProcAddress(hDLL, "?GetProcessTemplate@@YAPAVCProcessTemplate@@XZ");
#endif // _UNICODE
#else  // hab270
			= GetProcAddress(hDLL, "?GetProcessTemplate@@YAPAVCProcessTemplate@@XZ");
#endif // hab270

		// use the existence of that function as the determiner
		// for whether this is a process DLL or something else
		// that happens to be in this directory.
		if(getCarlaProcessorTemplate)
		{
			CProcessTemplate* pTemplate = (CProcessTemplate*) getCarlaProcessorTemplate();
			ASSERTX(pTemplate);
			pProcessTemplates.Add(pTemplate);
		}
		else	// it's not one of our cstudio plug-in dlls
		{
			::FreeLibrary(hDLL);
			hDLL=0;
		}
		bFound = FindNextFile(hFileInfo, &findFileData);
	}

	/*	CFileFind finder;
	if(finder.FindFile("*.hlp"))
	{	BOOL bWorking = finder.FindNextFile();
		while (bWorking)
		{
			TRACE("DLL found: %s\n", finder.GetFileName());

			HINSTANCE hDLL = LoadLibrary(finder.GetFileName());
			ASSERTX(hDLL); // to do
			FARPROC getCarlaProcessorTemplate
				= GetProcAddress(hDLL, "getCarlaProcessorTemplate");

			// use the existence of that function as the determiner
			// for whether this is a process DLL or something else
			// that happens to be in this directory.
			if(getCarlaProcessorTemplate)
			{
				CProcessTemplate* pTemplate = (CProcessTemplate*) getCarlaProcessorTemplate();
				ASSERTX(pTemplate);
				pProcessTemplates.Add(pTemplate);
			}
			bWorking = finder.FindNextFile();
		}
	}
	*/
}

// Called during the FinishCreate cycle to clean up
// anything that couldn't be done until all language
// docs were loaded.
void CProcessSequence::finishCreate()
{
	ASSERTX(m_pLang);
}


BOOL CProcessSequence::continueProcessing(CProcessStatus * pStatus)
{
	ASSERTX(m_pLang);
	try
	{
		int nEnabledCount=0;
		for(int i=0; i<m_pProcesses.GetSize(); i++)
		{
			if(m_pProcesses[i]->m_bEnabled)
				++nEnabledCount;
		}

		if(nEnabledCount==0)
		{
			CString s;
			s = _T("You must first add at least one enabled processor to the ");
			s += getFullName();
			THROWSTRING2(s, _T(""));
		}

		// Now just tell the next process to go.  These have different
		// names because in the future a single process could have multiple
		// input formats that it takes. I don't know.... we'll see.
		for( i=0; i<m_pProcesses.GetSize(); i++)
		{
			if ((m_pProcesses[i]->m_bEnabled) // added beta 6, mar 99
				// skip processors that don't process dictionaries if that's all we're doing (for quickparse)
				&& ((pStatus->getProcPrefs()->getGoal() != CProcessingPrefs::kPreprocessDicts) // jdh 3/13/2000
					|| m_pProcesses[i]->getInputType() == DICT))			// jdh 3/13/2000
			{
				pStatus->startingProcessor(m_pProcesses[i]);

				switch(m_pProcesses[i]->getInputType())
				{
#ifndef hab210
					case INFORMATION:
						m_pProcesses[i]->processInformationFile(*pStatus);
						break;
#endif //hab210
					case RAWTEXT:
						m_pProcesses[i]->processRAWTextFile(*pStatus);
						break;
					case ANA:
						m_pProcesses[i]->processANAFile(*pStatus);
						break;
					case DICT:
						m_pProcesses[i]->processDictionaries(*pStatus);
						break;
					case INTERLINEAR:	// a cc-table may be the only thing that takes this as input
						m_pProcesses[i]->processInterlinearFile(*pStatus);
						break;
					default: throw CProcessFailure(m_pProcesses[i], _T("This version of CarlaStudio does not handle the input type desired by this processor."));
								break;
				}
			}
		}
	}
	catch(CString sError)// ideally, everything would use CProcessFailure instead
	{
#ifndef rde270
		// can't use alloca in an exception handler (so we can't convert from wide to narrow
		//  which is required by strstream), so do it a different way...
		CString str;
		AfxFormatString1(str, IDS_CONT_PROC_FAILURE2, (LPCTSTR)sError);
#else   // rde270
		strstream sout;
		sout << "Processing was not completed. Reason:\n";
		sout << sError;
		CString str(sout.str(), sout.pcount());
		sout.rdbuf()->freeze(0); // else get a memory leak
#endif  // rde270
		AfxMessageBox(str);
		return FALSE;

	}
	catch (CProcessFailure failure)
	{
#ifndef rde270
		// can't use alloca in an exception handler (so we can't convert from wide to narrow
		//  which is required by strstream), so do it a different way...
		CString str;
		if(failure.m_pProcess)	// will be null if not thrown by a process
			AfxFormatString2(str, IDS_CONT_PROC_FAILURE, (LPCTSTR)CString(failure.m_pProcess->getDisplayName()), failure.getReason());
		else
			AfxFormatString1(str, IDS_CONT_PROC_FAILURE2, (LPCTSTR)failure.getReason());
#else   // rde270
		strstream sout;
		if(failure.m_pProcess)	// will be null if not thrown by a process
			sout << "The process \"" << failure.m_pProcess->getDisplayName() << "\"";
		else
			sout << "Processing ";
		sout << " was not completed.\n";
		sout << failure.getReason();
		CString str(sout.str(), sout.pcount());
		sout.rdbuf()->freeze(0); // else get a memory leak
#endif  // rde270
		AfxMessageBox(str);
		return FALSE;
	}

	return TRUE;	// TO DO: fix this
}

// called by CDlgProcessSequence
// if it's invalid, will put a message in sInvalidMsg and return FALSE
BOOL CProcessSequence::isValidSequence(CString & sInvalidMsg) const
{
	 sInvalidMsg = _T("");
	 if(!m_pProcesses.GetSize())
		 return TRUE; // an empty sequence is ok

	 // no checks yet
	 return TRUE;
}

///////////////////////////////////////////////////////////////
//	TransferCProcessSequence
///////////////////////////////////////////////////////////////

// new sequence constructor
CTransferProcessSequence::CTransferProcessSequence(CCarlaLanguage* pSourceLang, CCarlaLanguage* pTargetLang)
:m_pTargetLang(pTargetLang), CProcessSequence(pSourceLang)
{
}

// read-from-file constructor
//	Exceptions: An error string
CTransferProcessSequence::CTransferProcessSequence(CCarlaLanguage* pSourceLang, SFMFile& f)
:m_pTargetLang(NULL), CProcessSequence(pSourceLang)
{
	readFromFile(f);
	// note: m_pTargetLang will still be null until finishCreate() is called
}

// This just picks up the extra parameter used by this subclass
//  to determine the target language of this sequence
//	and then calls the superclass.
//	Exceptions: An error string
// This must be followed by a call to finishCreate() (a misleading name)
void CTransferProcessSequence::readFromFile(SFMFile& f)
{
	CString sMarker, sField;
	BOOL bEnabled;	// not really used here
	f.getField(sMarker, sField, &bEnabled);
	if (sMarker == _T("TargetLangID"))
	{
		m_pTargetLang = NULL; // can't look this up yet
		m_sTempTargetID = sField;	// save for the "finish create" cycle, when all language docs have been loaded
									// and we can look up this id and get the pointer

		CProcessSequence::readFromFile(f);
	}
	else throw(CString(_T("Didn't find the \\TargetLangID field.")));
}



void CTransferProcessSequence::writeToFile(ofstream & fout) const
{
	USES_CONVERSION_U8;
	ASSERTX(m_pLang);
	fout << "\\+TransferProcessSequence\n";
	writeParamsToFile(fout);
	fout << "\\" << T2CU8(getClosingSFMMarker()) << "\n";
}

void CTransferProcessSequence::writeParamsToFile(ofstream & fout) const
{
	USES_CONVERSION_U8;
	ASSERTX(m_pTargetLang);
	fout << "\\TargetLangID " << T2CU8(m_pTargetLang->getUniqueID()) << "\n";
	CProcessSequence::writeParamsToFile(fout);
}

// Called during the FinishCreate cycle to clean up
// anything that couldn't be done until all language
// docs were loaded.
//	Note: need to be careful not to  *do* very much
// with other languages, because they may still not
// have loaded their control files yet, since that
// is part of the finishcreate cycle to.  If we needed
// to, we could make a finishcreate cycle1 and cycle2.
// Exceptions: and error string
void CTransferProcessSequence::finishCreate()
{
	CProjectDoc *pProjectDoc = theApp.getProject();

	ASSERTX(!m_pTargetLang);
	m_pTargetLang = pProjectDoc->getLangFromID(m_sTempTargetID);
	if(!m_pTargetLang)
	{
		THROWSTRING2(_T("Could not find the target language, which has ID "),
						m_sTempTargetID);
	}
	m_sTempTargetID = _T("");
	CProcessSequence::finishCreate();
}

// virtual override
CString  CTransferProcessSequence::getFullName() const
{
	ASSERTX(m_pTargetLang);
	CString s;
	s.Format(_T("%s Transfer To %s Sequence"), (LPCTSTR)m_pLang->getName(), (LPCTSTR)m_pTargetLang->getName());
	return s;
}

// virtual override
CString  CTransferProcessSequence::getFunctionName() const
{
	ASSERTX(FALSE); //is this called?
	return _T("");
}


//virtual override
BOOL CTransferProcessSequence::isValidSequence(CString& sInvalidMsg) const
{
	 if(!m_pProcesses.GetSize())
		 return TRUE; // an empty sequence is ok

	 if(!CProcessSequence::isValidSequence(sInvalidMsg))
		 return FALSE;
	// RULES
	 // there must be at least on process that takes ANA Input
	 for(int i=0; i<m_pProcesses.GetSize(); i++)
	 {
		if(m_pProcesses[i]->getInputType() == ANA)
			break;
	 }
	 if(i == m_pProcesses.GetSize())
	 {
		sInvalidMsg = _T("At least one process must input the source ANA (examples: SENTRANS && STAMP)");
		return FALSE;
	 }

	 // this must be followed by at least on process that gives ANA or PTEXT as output
	 for(; i<m_pProcesses.GetSize(); i++)
	 {
		if(m_pProcesses[i]->getInputType() == ANA)
			break;
	 }
	 if(i == m_pProcesses.GetSize())
	 {
		sInvalidMsg = _T("One proccess must output an ANA file(example: SENTRANS && TRAMPLE)");
		return FALSE;
	 }
	 return TRUE;
}

///////////////////////////////////////////////////////////////
//	AnalysisCProcessSequence
///////////////////////////////////////////////////////////////

// new sequence constructor (when creating in dialog)
CAnalysisProcessSequence::CAnalysisProcessSequence(CCarlaLanguage* pSourceLang)
:CProcessSequence(pSourceLang)
{
}

// read-from-file constructor
//	Exceptions: An error string
CAnalysisProcessSequence::CAnalysisProcessSequence(CCarlaLanguage* pSourceLang, SFMFile& f)
:CProcessSequence(pSourceLang)
{
	readFromFile(f);
}

// virtual override
CString  CAnalysisProcessSequence::getFullName() const
{
	CString s;
	s.Format(_T("%s Analysis Sequence"), (LPCTSTR)m_pLang->getName());
	return s;
}

//virtual override
// if it's invalid, will put a message in sInvalidMsg and return FALSE
BOOL CAnalysisProcessSequence::isValidSequence(CString& sInvalidMsg) const
{
	 if(!m_pProcesses.GetSize())
		 return TRUE; // an empty sequence is ok

	 if(!CProcessSequence::isValidSequence(sInvalidMsg))
		 return FALSE;
	// RULES
	 // there must be at least on process that takes RAWTeXT as input
	 for(int i=0; i<m_pProcesses.GetSize(); i++)
	 {
		if(m_pProcesses[i]->getInputType() == RAWTEXT)
			break;
	 }
	 if(i == m_pProcesses.GetSize())
	 {
		sInvalidMsg = _T("At least one process must input the source text (example: AMPLE)");
		return FALSE;
	 }

	 // this must be followed by at least on process that gives ANA or PTEXT as output
	 for(; i<m_pProcesses.GetSize(); i++)
	 {
		if(m_pProcesses[i]->getOutputType() == ANA)
			break;
	 }
	 if(i == m_pProcesses.GetSize())
	 {
		sInvalidMsg = _T("One proccess must output an ANA file(example: AMPLE)");
		return FALSE;
	 }

	 return TRUE;
}


///////////////////////////////////////////////////////////////
//	SynthesisCProcessSequence
///////////////////////////////////////////////////////////////

// new sequence constructor (when creating in dialog)
CSynthesisProcessSequence::CSynthesisProcessSequence(CCarlaLanguage* pSourceLang)
:CProcessSequence(pSourceLang)
{
}

// read-from-file constructor
//	Exceptions: An error string
CSynthesisProcessSequence::CSynthesisProcessSequence(CCarlaLanguage* pSourceLang, SFMFile& f)
:CProcessSequence(pSourceLang)
{
	readFromFile(f);
}

// virtual override
CString  CSynthesisProcessSequence::getFullName() const
{
	CString s;
	s.Format(_T("%s Synthesis Sequence"), (LPCTSTR)m_pLang->getName());
	return s;
}

//virtual override
// if it's invalid, will put a message in sInvalidMsg and return FALSE
BOOL CSynthesisProcessSequence::isValidSequence(CString& sInvalidMsg) const
{
	 if(!m_pProcesses.GetSize())
		 return TRUE; // an empty sequence is ok

	 if(!CProcessSequence::isValidSequence(sInvalidMsg))
		 return FALSE;

	// RULES

	 for(int i=0; i<m_pProcesses.GetSize(); i++)
	 {
		if(m_pProcesses[i]->getInputType() == ANA)
			break;
	 }
	 if(i == m_pProcesses.GetSize())
	 {
		sInvalidMsg = _T("At least one process must input the target ANA (example: STAMP)");
		return FALSE;
	 }

	 // that's all for now.  I don't think it's necessary to require
	 // any particular output format.

	return TRUE;
}


///////////////////////////////////////////////////////////////
//	InterlinearCProcessSequence
///////////////////////////////////////////////////////////////

// new sequence constructor (when creating in dialog)
CInterlinearProcessSequence::CInterlinearProcessSequence(CCarlaLanguage* pSourceLang)
:CProcessSequence(pSourceLang)
{
}

// read-from-file constructor
//	Exceptions: An error string
CInterlinearProcessSequence::CInterlinearProcessSequence(CCarlaLanguage* pSourceLang, SFMFile& f)
:CProcessSequence(pSourceLang)
{
	readFromFile(f);
}

// virtual override
CString  CInterlinearProcessSequence::getFullName() const
{
	CString s;
	s.Format(_T("%s Interlinearizing Sequence"), (LPCTSTR)m_pLang->getName());
	return s;
}

//virtual override
// if it's invalid, will put a message in sInvalidMsg and return FALSE
BOOL CInterlinearProcessSequence::isValidSequence(CString& sInvalidMsg) const
{
	 if(!m_pProcesses.GetSize())
		 return TRUE; // an empty sequence is ok

	 if(!CProcessSequence::isValidSequence(sInvalidMsg))
		 return FALSE;

	// RULES

	 for(int i=0; i<m_pProcesses.GetSize(); i++)
	 {
		if(m_pProcesses[i]->getInputType() == ANA)
			break;
	 }
	 if(i == m_pProcesses.GetSize())
	 {
		sInvalidMsg = _T("At least one process must input the  ANA (example: INTERGEN)");
		return FALSE;
	 }

	 // that's all for now.  I don't think it's necessary to require
	 // any particular output format.

	return TRUE;
}

// used when we're doing a remote parse to lookup the intergen process
// to learn about its codes for de-interlinearizing
CProcess* CProcessSequence::getFirstProcessOfType(CString sTypeID)
{
	USES_CONVERSION;
	for(int i=0; i<m_pProcesses.GetSize(); i++)
	{
		if(sTypeID == A2CT(m_pProcesses[i]->getProcessorID()))
			return m_pProcesses[i];
	}
	return NULL;	// not found
}
