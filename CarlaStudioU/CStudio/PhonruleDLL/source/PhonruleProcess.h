// PhonruleProcess.h: interface for the CPhonruleProcess class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_PHONRULEPROCESS_H__42D0690C_4D76_11D2_864E_444553540000__INCLUDED_)
#define AFX_PHONRULEPROCESS_H__42D0690C_4D76_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#include "CWProcess.h"
class SFMFile;
#include <fstream.h>
#define PHONRULEDISPLAYNAME "Phonrule"

class CPhonruleProcess : public CDLLProcess
{
public:
	DECLARE_DYNCREATE(CPhonruleProcess);
	CPhonruleProcess();
	virtual ~CPhonruleProcess();
	virtual void readParametersFromSFMFile(SFMFile *f) ;

	// Interface
	static LPCTSTR INPUT_TYPE_DISPLAY() {return _T("Dictionary");}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return _T("Dictionary");}

	static LPCSTR ID() {return "PHONRULEDLL";}
	virtual LPCSTR  getProcessorID() const {return ID();}
	virtual LPCSTR getDisplayName() const { return PHONRULEDISPLAYNAME;}
	virtual BOOL doEditDialog(int iFunctionCode);

	// Processing
	virtual PROCESS_FILE_TYPE getInputType() {return DICT;}
	virtual PROCESS_FILE_TYPE getOutputType() {return DICT;}
	virtual void processDictionaries(CProcessStatus& status);

	// Disk I/O
	virtual void writeToStream(ostream& fout) const;


protected:
	virtual void setDefaultValues();

	// command-line parameters
	BOOL m_bMonitorRules;
	BOOL m_bTrace;
	char m_cCommentChar;

};

#endif // !defined(AFX_PHONRULEPROCESS_H__42D0690C_4D76_11D2_864E_444553540000__INCLUDED_)
