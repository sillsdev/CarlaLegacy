#pragma once

#include "cwprocess.h"
#include <fstream.h>

class SFMFile;

// to do: split this into transfer and synthesis
class CStampProcess: public CDOSProcess
{
public:
	// for the template
	static LPCTSTR INPUT_TYPE_DISPLAY() {return "ANA";}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return "Target Text";}
	static LPCTSTR ID() {ASSERTX(FALSE); return "ERROR";}
	virtual LPCTSTR  getProcessorID() const {return ID();}

	virtual LPCTSTR getDisplayName() const {ASSERTX(FALSE); return "ERROR";}
	virtual PROCESS_FILE_TYPE getOutputType() {ASSERTX(FALSE); return ANA;}

	// Creation
	DECLARE_DYNCREATE(CStampProcess);
	CStampProcess();
	virtual void readParametersFromSFMFile(SFMFile *f) ;

	// Interface
	virtual BOOL doEditDialog(int iFunctionCode);
	virtual PROCESS_FILE_TYPE getInputType() {return ANA;}
//	virtual void processANAFile(CProcessStatus& status);

	// Disk I/O
	virtual void writeToStream(ostream& fout) const;

protected:
	CPathDescriptor m_sLOGPath;
	CPathDescriptor m_sOutPath;
	CPathDescriptor m_sCMDPath;

	void outputSupportFiles(CProcessStatus& status);
	virtual const char* getToolPath();
	virtual CString getCommandLine(CProcessStatus& status);
	virtual void setDefaultValues();

	// places to fit in differences between sample and trample
	virtual void insertOtherFlags(ostream& sout) {};
	virtual CString getTransferPath(CProcessStatus& status){ASSERTX(FALSE);return "ERROR";}
	virtual CString getSynthPath(CProcessStatus& status){ASSERTX(FALSE);return "ERROR";}

	// command-line parameters
	BOOL m_bMonitorProgress;
	BOOL m_bCheckMorphnames;	// -r
	BOOL m_bPrintTestParseTrees;
	BOOL m_bTrace;
	BOOL m_bAllAllomorphCombos; // synth only
	BOOL m_bCheckRootCats; // if false, output -n

};

class CTrampleProcess: public CStampProcess
{
public:
	CTrampleProcess();
	DECLARE_DYNCREATE(CTrampleProcess);

	virtual CString getInputTypeDisplayName() {return "Source ANA";}
	virtual CString getOutputTypeDisplayName() {return "Target ANA";}

	// for the template
	static LPCTSTR INPUT_TYPE_DISPLAY() {return "Source ANA";}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return "Target ANA";}
	static LPCTSTR ID() {return "TRAMPLEDOS";}
	virtual LPCTSTR getDisplayName() const { return "TRAMPLE";}
	static LPCTSTR staticGetDisplayName() { return "TRAMPLE";}
	virtual LPCTSTR  getProcessorID() const {return ID();}

	// Processing
	virtual PROCESS_FILE_TYPE getOutputType() {return ANA;}
	virtual void processANAFile(CProcessStatus& status);

protected:
	virtual void insertOtherFlags(ostream& sout);
	virtual CString getTransferPath(CProcessStatus& status);
	virtual CString getSynthPath(CProcessStatus& status);
	virtual CString getBatchName(CProcessStatus& status);

};

class CSampleProcess: public CStampProcess
{
public:
	CSampleProcess();
	DECLARE_DYNCREATE(CSampleProcess);

	virtual CString getInputTypeDisplayName() {return "Target ANA";}
	virtual CString getOutputTypeDisplayName() {return "Target Text";}
	// for the template
	static LPCTSTR INPUT_TYPE_DISPLAY() {return "Target ANA";}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return "Target Text";}
	static LPCTSTR ID() {return "SAMPLEDOS";}
	virtual LPCTSTR getDisplayName() const { return "SAMPLE";}
	static LPCTSTR staticGetDisplayName() { return "SAMPLE";}
	virtual LPCTSTR  getProcessorID() const {return ID();}

	// processing
	virtual PROCESS_FILE_TYPE getOutputType() {return RAWTEXT;}
	virtual void processANAFile(CProcessStatus& status);
protected:
	virtual CString getTransferPath(CProcessStatus& status);
	virtual CString getSynthPath(CProcessStatus& status);
	virtual CString getBatchName(CProcessStatus& status);
};

/*-x       apply transfer without synthesis
*/
