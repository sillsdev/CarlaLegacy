// BatchProcess.h: interface for the CBatchProcess class.
//
// 2.1.0 06-Mar-2000 hab Initial coding
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_BatchProcess_H__A7066661_5878_11D2_864E_444553540000__INCLUDED_)
#define AFX_BatchProcess_H__A7066661_5878_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#include "CWProcess.h"
class SFMFile;
#include <fstream.h>
#define BATCHDISPLAYNAME "Batch"

class CBatchProcess : public CDOSProcess
{
public:
	enum {kNone=0, kText, kDicts, kANA, kInterlinear};	// file types

	DECLARE_DYNCREATE(CBatchProcess);
	CBatchProcess();
	virtual ~CBatchProcess();
	virtual void readParametersFromSFMFile(SFMFile *f) ;

	// Interface
	static LPCTSTR INPUT_TYPE_DISPLAY();
	static LPCTSTR OUTPUT_TYPE_DISPLAY() ;

	static LPCTSTR ID() {return "Batch";}
	virtual LPCTSTR  getProcessorID() const {return ID();}
	virtual LPCTSTR getDisplayName() const { return BATCHDISPLAYNAME;}
	virtual BOOL doEditDialog(int iFunctionCode);

	// Processing
	virtual PROCESS_FILE_TYPE getInputType();
	virtual PROCESS_FILE_TYPE getOutputType() ;
	virtual void processInformationFile(CProcessStatus& status);
	virtual void processRAWTextFile(CProcessStatus& status);
	virtual void processANAFile(CProcessStatus& status);
	virtual void processDictionaries(CProcessStatus& status);
	virtual void processInterlinearFile(CProcessStatus& status);

	// Disk I/O
	virtual void writeToStream(ostream& fout) const;


protected:
	void beforeProcessing(CProcessStatus& status, CString & sBaseName);
	void afterProcessing(CProcessStatus& status);
	void runBatchFile(CPathDescriptor& outPath, CProcessStatus& status);
	void runBatchFile(CPathDescriptor& inPath, CPathDescriptor& outPath, CProcessStatus& status);
	virtual CString getBatchName(CProcessStatus& status);
	virtual CString getCommandLine(CProcessStatus& status);
	virtual const char* getToolPath();
	void checkInPathValidity(CPathDescriptor & inPath, CString sType);

	ofstream* m_pLogOut;
	CString m_sName;
	CString m_sDescription;
	CString m_sBatchPath;
	CPathDescriptor m_sInPath, m_sOutPath, m_sLogPath;
	int m_iFileType;
	virtual void setDefaultValues();
};

#endif // !defined(AFX_BatchProcess_H__A7066661_5878_11D2_864E_444553540000__INCLUDED_)
