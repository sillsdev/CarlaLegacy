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
#ifndef mr270
#include "..\..\CarlaStudio\COMMON CODE\PathDescriptor.h"	// Added by ClassView

#else // mr270
#include "..\..\..\COMMON CODE\PathDescriptor.h"	// Added by ClassView

#endif // mr270


class CANACountProcess  : public CDOSProcess
{
public:
	DECLARE_DYNCREATE(CANACountProcess);
	CANACountProcess();
	virtual ~CANACountProcess();

	static LPCTSTR ID() {return "ANACountDOS";}
	static LPCTSTR INPUT_TYPE_DISPLAY() {return "ANA";}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return "ANA Statistics";}
	virtual LPCTSTR  getProcessorID() const {return ID();}

	virtual void readParametersFromSFMFile(SFMFile *f) ;
	virtual void setDefaultValues();

	// Interface
	virtual LPCTSTR getDisplayName() const { return "ANACount";}
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
	virtual const char* getToolPath();
	CPathDescriptor m_sLOGPath;
};

#endif // !defined(AFX_ANACount_H__AA7BDDA0_127E_11D3_8669_8C970CC10000__INCLUDED_)
