// AmpleDLLProcess.h: interface for the CAmpleDLLProcess class.
//
//////////////////////////////////////////////////////////////////////
// 2.3.2 19-Sep-2000 hab Have manual parse apply input text changes to string

#if !defined(AFX_AMPLEDLLPROCESS_H__99C4C3E1_5A92_11D2_864E_444553540000__INCLUDED_)
#define AFX_AMPLEDLLPROCESS_H__99C4C3E1_5A92_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#include "CWProcess.h"
class SFMFile;
#include <fstream.h>
#define AMPLEDLLDISPLAYNAME "AmpleDLL"

#include "AmpleDLLWrapper.h"
class CProcessStatus;


class CAmpleDLLProcess : public CDLLProcess
{
public:
	void setXMLOutputPath(CString sPath);
	void setOutputStyle(CString sOutputStyle);
	BOOL getLastRunHadError();
	void updateExternals(CProcessStatus& status);
	void setTrace(BOOL bTrace, LPCTSTR lpszTraceMorphs);
	CAmpleDLLProcess();
	virtual ~CAmpleDLLProcess();
	enum {kText=0, kDicts, kANA};	// file types

	DECLARE_DYNCREATE(CAmpleDLLProcess);
	virtual void readParametersFromSFMFile(SFMFile *f) ;

	// Interface
	static LPCTSTR INPUT_TYPE_DISPLAY() {return "Source Text";}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return "Source ANA";}
	virtual PROCESS_FILE_TYPE getInputType() {return RAWTEXT;}
	virtual PROCESS_FILE_TYPE getOutputType() {return ANA;}

	static LPCTSTR ID() {return "AMPLE-DLL";}
	virtual LPCTSTR  getProcessorID() const {return ID();}
	virtual LPCTSTR getDisplayName() const { return AMPLEDLLDISPLAYNAME;}
	virtual BOOL doEditDialog(int iFunctionCode);
	void setReloadOptions() {m_bReloadOptionsIntoDLL=TRUE;}

	// Processing
	virtual void processRAWTextFile(CProcessStatus& statuss);
	virtual void processRAWTextString(CProcessStatus& status, LPCTSTR lpszLogPath=NULL);
#ifndef hab218
#ifndef hab232
	virtual CString getAllAllomorphs(CProcessStatus& status, CString &sState, LPCTSTR lpszLogPath=NULL);
#else // hab232
	virtual void getAllAllomorphs(CProcessStatus& status, CString &sState, LPCTSTR lpszLogPath=NULL);
#endif // hab232
#endif // hab218
	// Disk I/O
	virtual void writeToStream(ostream& fout) const;
#ifndef hab241
	void setMaxMorphnameLength(int iMax);
#endif // hab241

protected:
	virtual void setDefaultValues();
	CAmpleDLLWrapper* m_pAmpleWrapper;
	void removeSetup();
	BOOL m_bReloadOptionsIntoDLL;
	void throwIfError(CString& sResult);
	BOOL checkDLLResult(CString& sResult);

	void processFileCore(CProcessStatus& status);
	CPathDescriptor m_sLOGPath;
	CPathDescriptor m_sANAPath;
	CPathDescriptor m_sCMDPath;


	// command-line parameters
	CAmpleOptions m_options;
};

#endif // !defined(AFX_AMPLEDLLPROCESS_H__99C4C3E1_5A92_11D2_864E_444553540000__INCLUDED_)
