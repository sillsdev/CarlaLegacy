// PcPatr.h: interface for the CPcPatrProcess class.
//
// 2.1.0 10-Feb-2000 hab Initial coding
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_PcPatr_H__AA7BDDA0_127E_11D3_8669_8C970CC10000__INCLUDED_)
#define AFX_PcPatr_H__AA7BDDA0_127E_11D3_8669_8C970CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "cwprocess.h"

class SFMFile;
#include <fstream.h>
#include "..\..\..\COMMON CODE\PathDescriptor.h"	// Added by ClassView


class CPcPatrProcess  : public CDOSProcess
{
public:
	DECLARE_DYNCREATE(CPcPatrProcess);
	CPcPatrProcess();
	virtual ~CPcPatrProcess();

	static LPCSTR ID() {return "PcPatrDOS";}
	static LPCTSTR INPUT_TYPE_DISPLAY() {return _T("Source ANA");}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return _T("Source ANA");}
	virtual LPCSTR  getProcessorID() const {return ID();}

	virtual void readParametersFromSFMFile(SFMFile *f) ;
	virtual void setDefaultValues();

	// Interface
	virtual LPCSTR getDisplayName() const { return "PC-PATR";}
	virtual BOOL doEditDialog(int iFunctionCode);

	// Processing
	virtual PROCESS_FILE_TYPE getInputType() {return ANA;}
	virtual PROCESS_FILE_TYPE getOutputType() {return ANA;}
	virtual void processANAFile(CProcessStatus& status);

	// Disk I/O
	virtual void writeToStream(ostream& fout) const;

protected:
	virtual CString getBatchName(CProcessStatus& status);
	virtual CString getCommandLine(CProcessStatus& status);
	virtual LPCTSTR getToolPath();
	CPathDescriptor m_sLOGPath;
	CPathDescriptor m_sOutputANAPath;
	CString m_sEXEName;
	CPathDescriptor m_sGrammarFile;
	CPathDescriptor m_sTakeFile;
};

#endif // !defined(AFX_PcPatr_H__AA7BDDA0_127E_11D3_8669_8C970CC10000__INCLUDED_)
