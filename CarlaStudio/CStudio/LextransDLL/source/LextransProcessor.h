// LextransProcessor.h: interface for the CLextransProcessor class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_LEXTRANSPROCESSOR_H__436BCE6E_4FD6_11D2_864E_444553540000__INCLUDED_)
#define AFX_LEXTRANSPROCESSOR_H__436BCE6E_4FD6_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#include "CWProcess.h"
class SFMFile;
#include <fstream.h>
#define LEXTRANSDISPLAYNAME "LEXTRANS"


class CLextransProcessor : public CDLLProcess
{
public:
	CString m_sTargetPropMarker;
	// Creation
	DECLARE_DYNCREATE(CLextransProcessor);
	CLextransProcessor();
	virtual void readParametersFromSFMFile(SFMFile *f) ;

	// Interface
	static LPCTSTR INPUT_TYPE_DISPLAY() {return "ANA";}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return "ANA";}// removed "target ana" because andy says people use it for glossing, to

	static LPCTSTR ID() {return "LEXTRANSDLL";}
	virtual LPCTSTR  getProcessorID() const {return ID();}
	virtual LPCTSTR getDisplayName() const { return LEXTRANSDISPLAYNAME;}
	virtual BOOL doEditDialog(int iFunctionCode);

	// Processing
	virtual PROCESS_FILE_TYPE getInputType() {return ANA;}
	virtual PROCESS_FILE_TYPE getOutputType() {return ANA;}
	virtual void processANAFile(CProcessStatus& status);

	// Disk I/O
	virtual void writeToStream(ostream& fout) const;


protected:
	CString m_sTargetCatMarker;
	BOOL m_bReplaceRoots;
	BOOL m_bReplaceProps;
	BOOL m_bReplaceCats;
	BOOL m_bUseTargetDict;
	virtual void setDefaultValues();

	// command-line parameters
	CString m_sSourceMarker;
	CString m_sTargetLexMarker;
	BOOL m_bMonitorChanges;
	BOOL m_bTrace;
	/*
	-d file     dictionary file to use for lexical transfer\n\
	-f file     AMPLE .CMD file containing names of files \n\
	-r mark     dictionary record marker (without backslash)\n\
	-s mark     dictionary marker for source lexical items\n\
	-n mark     dictionary marker for target lexical items\n\
	-p mark     dictionary marker for category\n\
	-q mark     dictionary marker for property\n\
	-i file     infile is an AMPLE analysis file\n\
	-o file     outfile is a modified analysis file\n\
	-c char     comment character\n\
	-m  monitor changes applied\n\
	-t  trace changes applied\n\
	*/

};

#endif // !defined(AFX_LEXTRANSPROCESSOR_H__436BCE6E_4FD6_11D2_864E_444553540000__INCLUDED_)
