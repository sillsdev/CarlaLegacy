// PCPATRDllProcess.h: interface for the CPCPATRDllProcess class.
//
// 2.4.5 22-May-2001 hab Fix so any errors in log file will show
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_PCPATRDLLPROCESS_H__436BCE6E_4FD6_11D2_864E_444553540000__INCLUDED_)
#define AFX_PCPATRDLLPROCESS_H__436BCE6E_4FD6_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#include "CWProcess.h"
#include "PathDescriptor.h"
#ifndef hab245
#include "Patr100.h"
#endif // hab245

class SFMFile;
#include <fstream.h>
#define PCPATRDLLDISPLAYNAME "PCPATR DLL"


class CPCPATRDllProcess : public CDLLProcess
{
public:
	// Creation
	DECLARE_DYNCREATE(CPCPATRDllProcess);
	CPCPATRDllProcess();
	virtual void readParametersFromSFMFile(SFMFile *f) ;

	// Interface
	static LPCTSTR INPUT_TYPE_DISPLAY() {return "ANA";}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return "ANA";}

	static LPCTSTR ID() {return "PCPATRDLL";}
	virtual LPCTSTR  getProcessorID() const {return ID();}
	virtual LPCTSTR getDisplayName() const {return "PC-PATR Disambiguate";}
	virtual BOOL doEditDialog(int iFunctionCode);

	// Processing
	virtual PROCESS_FILE_TYPE getInputType() {return ANA;}
	virtual PROCESS_FILE_TYPE getOutputType() {return ANA;}
	virtual void processANAFile(CProcessStatus& status);
	CString getInputTypeDisplayName();
	CString getOutputTypeDisplayName();

	// Disk I/O
	virtual void writeToStream(ostream& fout) const;

protected:
	CString getTempFileNameBase(CProcessStatus& status);

	CPathDescriptor m_sInPath, m_sOutPath, 	m_sLOGPath;

	virtual void setDefaultValues();
#ifndef hab245
	void checkResults(HRESULT &hr, LPCTSTR pszMessagePortion, IPatrParser *pPatr);
#else // hab245
	void checkResults(HRESULT &hr, LPCTSTR pszMessagePortion);
#endif // hab245
	// parameters
	BOOL	m_bAmplePropertyIsFeature;
	BOOL	m_bPromoteDefaultAtomicValues;
	BOOL	m_bShowFailures;
	BOOL	m_bDisplayFeatures;
	BOOL	m_bDisplayGloss;
	BOOL	m_bTrimEmptyFeatures;
	BOOL	m_bPerformUnification;
	BOOL	m_bWriteAmpleParses;
	UINT	m_uiMaxAmbiguities;
	CString	m_sSentenceFinalPunctuation;
	UINT	m_uiTimeLimit;
	int	m_iTreeDisplayFormat;
	CString	m_sGrammarFileName;
	BOOL	m_bFlatFeatureDisplay;
	BOOL    m_bAllFeatures;
};

#endif // !defined(AFX_PCPATRDLLPROCESS_H__436BCE6E_4FD6_11D2_864E_444553540000__INCLUDED_)
