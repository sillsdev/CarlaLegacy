// SenTransDllProcess.h: interface for the CSenTransDllProcess class.
//
// 1.1.0 19-Jun-2000 hab initial coding
// 1.1.1 26-Jun-2000 hab Add in process template
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_SENTRANSDLLPROCESS_H__436BCE6E_4FD6_11D2_864E_444553540000__INCLUDED_)
#define AFX_SENTRANSDLLPROCESS_H__436BCE6E_4FD6_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#include "CWProcess.h"
#include "PathDescriptor.h"

class SFMFile;
#include <fstream.h>

class CSenTransDllProcessTemplate : public CProcessTemplate
{
public:
	 CSenTransDllProcessTemplate();
	virtual CProcess* createProcess(int iSeqFunctionCode=-1, SFMFile* pInputFile=NULL);
};


#define SENTRANSDLLDISPLAYNAME "SenTrans DLL"


class CSenTransDllProcess : public CDLLProcess
{
public:
	static CProcessTemplate* getTemplate();
	// Creation
	DECLARE_DYNCREATE(CSenTransDllProcess);
	CSenTransDllProcess(int iFunction = kDisambig);
	virtual void readParametersFromSFMFile(SFMFile *f) ;

	// Interface
	static LPCTSTR INPUT_TYPE_DISPLAY() {return "ANA";}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return "ANA";}

	static LPCTSTR ID() {return "SENTRANSDLL";}
	virtual LPCTSTR  getProcessorID() const {return ID();}
	virtual LPCTSTR getDisplayName() const;
	virtual BOOL doEditDialog(int iFunctionCode);

	// Processing
	virtual PROCESS_FILE_TYPE getInputType() {return ANA;}
	virtual PROCESS_FILE_TYPE getOutputType() {return ANA;}
	virtual void processANAFile(CProcessStatus& status);
	CString getInputTypeDisplayName();
	CString getOutputTypeDisplayName();

	// Disk I/O
	virtual void writeToStream(ostream& fout) const;

	enum {kDisambig, kAdjustSrcGlossing, kTransfer,
			kAdjustAnalysis,/*added 6/2/99*/
			kOtherRuleFile };// jdh 15June2000 for ParseBench

protected:
	CString m_sRuleFile;
	CPathDescriptor m_sOtherRuleFilePath;// jdh 15June2000
	CString getTempFileNameBase(CProcessStatus& status);
	// function
	int m_iFunction;

	CPathDescriptor m_sInPath, m_sOutPath, 	m_sLOGPath;

	virtual void setDefaultValues();

	// command-line parameters
	BOOL m_bMonitorAmbiguities;
	BOOL m_bMonitorRulesApplied;
	BOOL m_bTraceRules;
	BOOL m_bOutputClassContents;

	friend CSenTransDllProcessTemplate;
};

#endif // !defined(AFX_SENTRANSDLLPROCESS_H__436BCE6E_4FD6_11D2_864E_444553540000__INCLUDED_)
