#pragma once

#include "cwprocess.h"

class SFMFile;
#include <fstream.h>
#define JOINCOMPDISPLAYNAME "JOINCOMP"

class CJoinCompProcess: public CDLLProcess
{
public:
	// Creation
	DECLARE_DYNCREATE(CJoinCompProcess);
	CJoinCompProcess();
//	CJoinCompProcess(SFMFile *f);
	virtual void readParametersFromSFMFile(SFMFile *f) ;

	// Interface
	static LPCTSTR INPUT_TYPE_DISPLAY() {return _T("Source Text");}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return _T("Source Text");}

	static LPCSTR ID() {return "JOINCOMPDLL";}
	virtual LPCSTR  getProcessorID() const {return ID();}
	virtual LPCSTR getDisplayName() const { return JOINCOMPDISPLAYNAME;}
	virtual BOOL doEditDialog(int iFunctionCode);

	// Processing
	virtual PROCESS_FILE_TYPE getInputType() {return RAWTEXT;}
	virtual PROCESS_FILE_TYPE getOutputType() {return RAWTEXT;}
	virtual void processRAWTextFile(CProcessStatus& status);

	// Disk I/O
	virtual void writeToStream(ostream& fout) const;


protected:
	virtual void setDefaultValues();

	// command-line parameters
	BOOL m_bPartialCompoundsOK;		//-p
	CString m_sVariantFormMarker;	//-v
	CString m_sJoinWordsMarker;		//-j
	CString m_sAllomorphMarker;		//-a
/*
NOT IMPLEMENTED YET
-s          show compounds found in dictionar
-m          monitor progress
-t          trace joined words
*/
};
