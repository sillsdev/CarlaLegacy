// ToneGen.h: interface for the CToneGenProcess class.
//
//////////////////////////////////////////////////////////////////////
// 2.4.1 01-Nov-2000 hab Reworked to handle ToneGen 1.0.0

#if !defined(AFX_TONEGEN_H__AA7BDDA0_127E_11D3_8669_8C970CC10000__INCLUDED_)
#define AFX_TONEGEN_H__AA7BDDA0_127E_11D3_8669_8C970CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "cwprocess.h"

class SFMFile;
#include <fstream.h>
#include "..\..\..\COMMON CODE\PathDescriptor.h"	// Added by ClassView


class CToneGenProcess  : public CDOSProcess
{
public:
	DECLARE_DYNCREATE(CToneGenProcess);
	CToneGenProcess();
	virtual ~CToneGenProcess();

	static LPCSTR ID() {return "TONEGENDOS";}
	virtual CString getInputTypeDisplayName() {return _T("Target ANA");}
	virtual CString getOutputTypeDisplayName() {return _T("Target Text");}
	static LPCTSTR INPUT_TYPE_DISPLAY() {return _T("Target ANA");}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return _T("Target Text");}
	static LPCTSTR staticGetDisplayName() { return _T("TONEGENDOS");}
	virtual LPCSTR  getProcessorID() const {return ID();}

	virtual void readParametersFromSFMFile(SFMFile *f) ;
	virtual void setDefaultValues();

	// Interface
	virtual LPCSTR getDisplayName() const { return "TONEGEN";}
	virtual BOOL doEditDialog(int iFunctionCode);

	// Processing
	virtual PROCESS_FILE_TYPE getInputType() {return ANA;}
	virtual PROCESS_FILE_TYPE getOutputType() {return RAWTEXT;}
	virtual void processANAFile(CProcessStatus& status);

	// Disk I/O
	virtual void writeToStream(ostream& fout) const;

protected:
	virtual CString getBatchName(CProcessStatus& status);
	virtual CString getCommandLine(CProcessStatus& status);
	void outputSupportFiles(CProcessStatus& status);
	virtual LPCTSTR getToolPath();
	CPathDescriptor m_sLOGPath;
	CPathDescriptor m_sOutputTextPath;
	CString m_sEXEName;
	CPathDescriptor m_sControlFilePath;
	CPathDescriptor m_sCMDPath;
	BOOL m_bVerifyControlFileInformation;
	BOOL m_bTraceToneProcessing;
	BOOL m_bMonitorProgress;
	int m_nTracingLevel;
	BOOL	m_bCheckMorphnames;
	BOOL	m_bOutputAllSyntheses;
	BOOL	m_bCheckRootCats;
	BOOL	m_bTraceSynthesis;
};

#endif // !defined(AFX_TONEGEN_H__AA7BDDA0_127E_11D3_8669_8C970CC10000__INCLUDED_)
