// CWProcess.h
//
// 2.1.0 07-Mar-2000 hab Added processInformationFile
//////////////////////////////////////////////////////////////////////

#ifndef __CWPROCESS
#define __CWPROCESS
#pragma once

#include "stdafx.h"
#include <fstream.h>
#include "PathDescriptor.h"
#include "stdafx.h"
#include <afxtempl.h>


class SFMFile;
class CModelFilesSet;
class CCarlaLanguage;
class CDlgProgress;
class CProcessingPrefs;
class CProcessSequence;
class CProcess;
class CResultStream;
class CProcessStatus;
class CDlgProgress;

typedef enum PROCESS_FILE_TYPE {INTERLINEAR, // intergen uses this
								INFORMATION, // something giving statistics would use this
								DICT, // something that modified the dictionary (phonrule)
								RAWTEXT, // maybe this should be split between source an target text
								ANA, PTEXT };


#define PROC_ENABLED_STATUS ' '<< (m_bEnabled?1:0)

class CProcess: public CObject
{
public:
	BOOL m_bEnabled;
	virtual  ~CProcess();
	static CString getFileTypeDisplayName(PROCESS_FILE_TYPE t);
	enum {kAnalysis=1, kTransfer=2, kSynthesis=4, kInterlinear=8};
	virtual LPCTSTR  getProcessorID() const = 0;
	DECLARE_DYNAMIC(CProcess);
	// Setup
	//CProcess(SFMFile* f);
	virtual void readParametersFromSFMFile(SFMFile *f) =0;
	CProcess() ;
	//void create(CProcessSequence* pOwningSeq);
	virtual void setDefaultValues() = 0;

	// Functionality
	virtual PROCESS_FILE_TYPE getInputType() = 0;
	virtual PROCESS_FILE_TYPE getOutputType() = 0;
#ifndef hab210
	virtual void processInformationFile(CProcessStatus& status);
#endif // hab210
	virtual void processRAWTextFile(CProcessStatus& status);
	virtual void processRAWTextString(CProcessStatus& status);
	virtual void processANAFile(CProcessStatus& status);
	virtual void processPTEXTFile(CProcessStatus& status);
	virtual void processDictionaries(CProcessStatus &status);
	virtual void processInterlinearFile(CProcessStatus &status);


	// Interface
	virtual LPCTSTR getDisplayName() const = 0;
	virtual CString getSpecificName() { return CString(""); };
	//virtual CString getDisplayName() const =0;
	virtual BOOL doEditDialog(int iFunctionCode) = 0;
	virtual CString getListCtrlText(int iColumn);
	virtual void addItemToListControl(CListCtrl& clc);

	// Disk I/O
	virtual void writeToStream(ostream& fout) const = 0;
	friend ostream& operator <<( ostream& fout, const CProcess& proc ) {proc.writeToStream(fout); return fout;}

	BOOL RunningNT(); // hab 1.04

protected:
	void registerLog(CProcessStatus& status, CPathDescriptor& path,
					CCarlaLanguage *pLang=NULL,
					int eIcon=-2/*CResultStream::kNoIcon will cause a search for error words*/
					);
	virtual CString getOutputTypeDisplayName();
	virtual CString getInputTypeDisplayName();
	void waitForCompletion(CProcessStatus *pStatus, CPathDescriptor* path1, CPathDescriptor* path2=NULL);
};

// Virtual superclass of processes that use DOS executables
class CDOSProcess : public CProcess
{
public:
	DECLARE_DYNAMIC(CDOSProcess);
	CDOSProcess() : CProcess() {};
protected:
		virtual CString getBatchName(CProcessStatus& status);
		BOOL executeTool(CProcessStatus& status);
		virtual CString getCommandLine(CProcessStatus& status) = 0;
		virtual const char* getToolPath() = 0;
};

// Virtual superclass of processes that use DLLs
class CDLLProcess : public CProcess
{
public:
	DECLARE_DYNAMIC(CDLLProcess);
	CDLLProcess() : CProcess() {};
};

class CProcessFailure
{
public:
	CProcessFailure(CProcess* pProcess, LPCTSTR sReason)
		: m_sReason(sReason), m_pProcess(pProcess) {}

	virtual CString getReason() {return m_sReason;}

	CProcess* m_pProcess;

	protected:
		CString m_sReason;

};

/* to do implement this:
// used when a process can't read the file type it was given
class CProcessFailureBadInputType : public CProcessFailure
{
	CProcessFailureBadInputType(CProcess* pProcess, PROCESS_FILE_TYPE type);
}
*/

class CProcessTemplate : public CObject
{
	public:
		CString getDisplayName();
		DECLARE_DYNAMIC(CProcessTemplate);
		virtual BOOL getCanAddToSeq( const CProcessSequence* pSeq) const;
		CProcessTemplate(CRuntimeClass* pClass ,
						  LPCTSTR lpszDisplayName,
						  LPCTSTR lpszInputTypeDisplay,
						  LPCTSTR lpszOutputTypeDisplay,
						  LPCTSTR lpszIdentifier,
						  DWORD allowable_seq_types,
						  long lVersion);
		virtual CProcess* createProcess(int iFunctionCode=-1, SFMFile* pInputFile = NULL);
//		 ~CProcessTemplate();

		CString& getIdentifier(){return m_sIdentifier;}
		long getVersion() {return m_lVersion;}

		void addItemToListControl(CListCtrl & clc, const CProcessSequence* pSeq);
		CString getListCtrlText(int iColumn);

	protected:
		long m_lVersion;
		CRuntimeClass* m_pClass;
		CString m_sDisplayName; // this will have to be multilingual
		CString m_sIdentifier;	// language independent; not seen by the user
		CString m_sInputTypeDisplay;
		CString m_sOutputTypeDisplay;
		DWORD m_allowable_seq_types;
};

#endif
