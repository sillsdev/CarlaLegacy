// jdh 15June2000 added "OtherRuleFile" function to support ParseBench (or any other external rule filed generator)

#pragma once

#include "cwprocess.h"
#include "PathDescriptor.h"

class SFMFile;
#include <fstream.h>

class CSentransProcessTemplate : public CProcessTemplate
{
public:
	 CSentransProcessTemplate();
	virtual CProcess* createProcess(int iSeqFunctionCode=-1, SFMFile* pInputFile=NULL);
};

class CSentransProcess: public CDOSProcess
{
public:
	static CProcessTemplate* getTemplate();
	// for the template
	static LPCTSTR INPUT_TYPE_DISPLAY() {return _T("ANA");}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return _T("ANA");}

	// accessors
	virtual CString getInputTypeDisplayName();
	virtual CString getOutputTypeDisplayName();
	virtual LPCSTR getDisplayName() const;
	static LPCSTR ID() {return "SENTRANSDOS";}
#ifndef rde270
	static LPCTSTR _tID() {return _T("SENTRANSDOS");}   // cause this is use in ctor and we can't do USES_CONVERSION there
	virtual LPCSTR getProcessorID() const { return ID(); };
#else   // rde270
	virtual LPCSTR getProcessorID() const {static CString sID(ID()); return sID;}
#endif  // rde270
	// Creation
	DECLARE_DYNCREATE(CSentransProcess);
	CSentransProcess(int iFunction = kDisambig);
	virtual void readParametersFromSFMFile(SFMFile *f) ;

	// Interface
	//virtual CString getDisplayName() const;
//	virtual CString getListCtrlText(int iColumn);
	virtual BOOL doEditDialog(int iFunctionCode);

	// Processing
	virtual PROCESS_FILE_TYPE getInputType() {return ANA;}
	virtual PROCESS_FILE_TYPE getOutputType() {return ANA;}
	virtual void processANAFile(CProcessStatus& status);

	// Disk I/O
	virtual void writeToStream(ostream& fout) const;

	enum {kDisambig, kAdjustSrcGlossing, kTransfer,
			kAdjustAnalysis,/*added 6/2/99*/
			kOtherRuleFile };// jdh 15June2000 for ParseBench

protected:
	CPathDescriptor m_sOtherRuleFilePath;// jdh 15June2000
	CString getTempFileNameBase(CProcessStatus& status);
	// function
	int m_iFunction;

	CPathDescriptor m_sInPath, m_sOutPath, 	m_sLOGPath;


//	void outputSupportFiles(CProcessStatus& status);
	virtual LPCTSTR getToolPath();
	virtual CString getCommandLine(CProcessStatus& status);
	virtual void setDefaultValues();
	virtual CString getBatchName(CProcessStatus& status);

	// command-line parameters
	BOOL m_bMonitorAmbiguities;
	BOOL m_bMonitorRulesApplied;
	BOOL m_bTraceRules;
	BOOL m_bOutputClassContents;

	friend CSentransProcessTemplate;
};
