// ANACount.h: interface for the CANACountProcess class.
//
// 2.4.5 22-May-2001 hab Initial coding
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_ANACount_H__AA7BDDA0_127E_11D3_8669_8C970CC10000__INCLUDED_)
#define AFX_ANACount_H__AA7BDDA0_127E_11D3_8669_8C970CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "cwprocess.h"

class SFMFile;
#include <fstream.h>
#include "..\..\..\COMMON CODE\PathDescriptor.h"	// Added by ClassView


class CANACountProcess  : public CDOSProcess
{
public:
	DECLARE_DYNCREATE(CANACountProcess);
	CANACountProcess();
	virtual ~CANACountProcess();

	static LPCSTR ID() {return "ANACountDOS";}
	static LPCTSTR INPUT_TYPE_DISPLAY() {return _T("ANA");}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return _T("ANA Statistics");}
	virtual LPCSTR  getProcessorID() const {return ID();}

	virtual void readParametersFromSFMFile(SFMFile *f) ;
	virtual void setDefaultValues();

	// Interface
	virtual LPCSTR getDisplayName() const { return "ANACount";}
	virtual BOOL doEditDialog(int iFunctionCode);

	// Processing
	virtual PROCESS_FILE_TYPE getInputType() {return ANA;}
	virtual PROCESS_FILE_TYPE getOutputType() {return INFORMATION;}
	virtual void processANAFile(CProcessStatus& status);

	// Disk I/O
	virtual void writeToStream(ostream& fout) const;

protected:
	virtual CString getBatchName(CProcessStatus& status);
	virtual CString getCommandLine(CProcessStatus& status);
	virtual LPCTSTR getToolPath();
	CPathDescriptor m_sLOGPath;
};

#endif // !defined(AFX_ANACount_H__AA7BDDA0_127E_11D3_8669_8C970CC10000__INCLUDED_)
