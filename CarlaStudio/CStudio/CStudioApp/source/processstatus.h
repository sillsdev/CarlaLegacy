// 2.1.2 14-Mar-2000 jdh Various additions to support using dictionary preprocessors w/ quickparse
#pragma once

#include "PathDescriptor.h"
#include <afxtempl.h>

class CProcessingPrefs;
class CModelFilesSet;
class CProcess;
class CCarlaLanguage;
class CResultStream;
class CDlgProgress;

//jdh 3/13/2000 moved here
const UINT     wm_RemoteSaveAll = RegisterWindowMessage( "ShbxSaveAll" );//jdh
const UINT     wm_RemoteRefreshAll = RegisterWindowMessage( "ShbxRefreshAll" );//jdh

// this is passed from each processor to the next, with
// the state of paths and such that later processors will need
/// to know.
class CProcessStatus: public CObject
{
	public:
		void storePreprocessedSrcDictsArrayInLang();
		const CProcessingPrefs* getProcPrefs();	// jdh 3/13/2000 added
		int m_iCurrentSeqFunction;
		void setCurrentSequenceFunction(int iFunction);
		void finishedProcessing();
		int getProcNumber();
		int m_iTotalProcessCount;
		void expectSequenceWithCount(int iCount); //CProcessSequence* pSeq);
		void startingProcessor(CProcess* pProc);
		void setOutputLang(CCarlaLanguage* pLang);
		void setInputLang(CCarlaLanguage* pLang);
		BOOL setupTempDir(LPCTSTR lpszName);
		CProcessStatus(	LPCTSTR lpszFile,
						const CProcessingPrefs* pProcPrefs,
						CCarlaLanguage* pInputLang,	// these are here so we can compile dlls that us this code without including
						CModelFilesSet* pInputMFS,
						CCarlaLanguage* pOuputLang,
						CModelFilesSet* pOutputMFS);

		// for processing strings instead of files
		CProcessStatus(	const CProcessingPrefs* pProcPrefs,
						LPCTSTR lpszInputString,
						//LPCTSTR lpszTraceMorphs,

						CCarlaLanguage* pInputLang,	// these are here so we can compile dlls that us this code without including
						CModelFilesSet* pInputMFS,
						CCarlaLanguage* pOuputLang,
						CModelFilesSet* pOutputMFS);


		~CProcessStatus();

		void loadOriginalDictsArrayFromLang();
		BOOL loadPreprocessedSrcDictsArrayFromLang();	// added jdh 3/13/2000 for quickparse

		void closeProgressDialog();
		void progress(LPCTSTR lpszMessage, int iPercentage=-1);
		void registerResultStream(CResultStream* pResultStream);
		CString makeTempPath(LPCTSTR lpszFileName, LPCTSTR lpszExtension=NULL);
		CString makeTempPathShort(LPCTSTR lpszFileName, LPCTSTR lpszExtension=NULL);

		CCarlaLanguage* getInputLang() {return m_pInputLang;}
		CCarlaLanguage* getOutputLang() {return m_pOutputLang;} // may be null
		CModelFilesSet* getOutputMFS();// may be null
		CModelFilesSet* getInputMFS();
		CString getTempDirectory() const {return m_sTempFilesDirectory;}

		int getVerbosity();

		CDlgProgress *m_pProgessDlg;
		// for now, the existence of some result types is hard-coded
		CPathDescriptor sANAPath, sRAWPath, sPTextPath, sInterlinearPath;

		CString m_sInputFileName; // not path, not name+extension, just name

		// these paths can be changed by a processor like phonrule
		// they are currently just used for root and/or unified dicts
		//CTypedPtrArray<CPtrArray, CPathDescriptor*>  m_pSrcDicts;
		//CTypedPtrArray<CPtrArray, CPathDescriptor*>  m_pTarDicts;
		CPathDescArray m_pSrcDicts;		// jdh 3/14/2000
		CPathDescArray  m_pTarDicts;	// jdh 3/14/2000


		//CModelFilesSet* pMFS;	// paths, directories, etc. for dicts and control files
		CCarlaLanguage* m_pInputLang;
		CCarlaLanguage* m_pOutputLang;
		CString m_sTempFilesDirectory;
		// for now, these are used just for user-viewing of the results
		CTypedPtrArray<CPtrArray, CResultStream*>  m_pResultStreams;
		int m_iProcNumber; // tell if we're doing the 0th process, the 1st, etc.
		const CProcessingPrefs* m_pProcPrefs;
		CString m_sFileNameRoot;
		CModelFilesSet* m_pInputMFS, *m_pOutputMFS; // must be members for the sake of dlls
		//CString m_sTraceMorphs; // for ample tracing
		CString m_sRAWString;

};
