// 2.1.5 28-Mar-2000 hab Added apply output changes as a boolean

#pragma once

#include "cwprocess.h"

class SFMFile;
#include <fstream.h>

class CIntergenMarkersCtrl;

//#define AMPLEID "AMPLEDOS"
//#define INTERGENID "INTERGENDOS"

class CAmpleProcess: public CDOSProcess
{
public:
	static LPCSTR ID() {return "AMPLEDOS";}
	static LPCTSTR INPUT_TYPE_DISPLAY() {return _T("Source Text");}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return _T("Source ANA");}
	virtual LPCSTR  getProcessorID() const {return ID();}
	//virtual CString& getProcessorID() const {return CString(AMPLEID);}
	// Creation
	DECLARE_DYNCREATE(CAmpleProcess);
	CAmpleProcess();
	//CAmpleProcess(SFMFile *f);
	virtual void readParametersFromSFMFile(SFMFile *f) ;

	// Interface
	//virtual CString getDisplayName() const;
	virtual LPCSTR getDisplayName() const { return "AMPLE EXE";}
	virtual BOOL doEditDialog(int iFunctionCode);

	// Processing
	virtual PROCESS_FILE_TYPE getInputType() {return RAWTEXT;}
	virtual PROCESS_FILE_TYPE getOutputType() {return ANA;}
	virtual void processRAWTextFile(CProcessStatus& status);

	// Disk I/O
	virtual void writeToStream(ostream& fout) const;


protected:
	BOOL m_bTrace;
	CPathDescriptor m_sLOGPath;
	CPathDescriptor m_sANAPath;
	CPathDescriptor m_sCMDPath;
//	CString getCMDFilePath(CProcessStatus& status, BOOL bSurroundQuotes = FALSE);

	void outputSupportFiles(CProcessStatus& status);
	virtual LPCTSTR getToolPath();
	virtual CString getCommandLine(CProcessStatus& status);
	virtual void setDefaultValues();

	virtual CString getBatchName(CProcessStatus& status);

	// command-line parameters
	int m_iMaxMorphnameLength;
	BOOL m_bOutputRootGlosses;
	BOOL m_bReportAmbiguityPercentages;
	BOOL m_bCheckMorphnames;
	BOOL m_bPrintTestParseTrees;
	BOOL m_bWriteDecompField;
	BOOL m_bWritePField;	// what's p?
	BOOL m_bWriteWordField;

};

class CIntergenMarker : public CObject
{
public:
	char m_cCode;
	CIntergenMarker(char cCode, LPCTSTR lpszMarker, LPCTSTR lpszDescription, BOOL bEnabled)
		:m_cCode(cCode),
		m_sMarker(lpszMarker),
		m_sDescription(lpszDescription),
		m_bEnabled(bEnabled) {};
	CString m_sMarker;
	CString m_sDescription;
	BOOL m_bEnabled;
};


class CIntergenProcess: public CDOSProcess
{
public:
	CString m_sPostIntergenStripMarker;
	CString getAnalysisMarkers();
	void getAnalysisMarkers(CStringArray &analysisMarkers);
	CString getWordMarker();
	//void getMarkers(CString &sWordMrk, CStringArray& analysisMarkers);
	//void getMarkers(CString& sWordMrk, CString& sAnalysisMarkers);
	static LPCSTR ID() {return "INTERGENDOS";}
	static LPCTSTR INPUT_TYPE_DISPLAY() {return _T("ANA");}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return _T("Interlinear Text");}
	virtual LPCSTR  getProcessorID() const {return ID();}
	virtual LPCSTR getDisplayName() const { return "INTERGEN";}
	virtual void readParametersFromSFMFile(SFMFile *f) ;

	DECLARE_DYNCREATE(CIntergenProcess);
	//virtual CString getDisplayName() const;
	virtual PROCESS_FILE_TYPE getInputType() {return ANA;}
	virtual PROCESS_FILE_TYPE getOutputType() {return INTERLINEAR;}

	//CIntergenProcess(SFMFile *f);
	virtual void processANAFile(CProcessStatus& status);
	CIntergenProcess() ;
	~CIntergenProcess();
	virtual BOOL doEditDialog(int iFunctionCode);
	virtual void writeToStream(ostream& fout) const;

protected:
	CString m_sITXPath;
		// INTERGEN CURRENT CAN'T BE REDIRECTED
			//CString m_sLOGPath;
	//CString getLogPath(CProcessStatus& status);
	//CString getInterlinearOutputPath(CProcessStatus& status);
	char m_cDecompChar; // same as "morph-break char"
	virtual void setDefaultValues();
	virtual LPCTSTR getToolPath();
	virtual CString getCommandLine(CProcessStatus& status);

	 virtual CString getBatchName(CProcessStatus& status);

	// command-line parameters
	int	m_iMaxLineLength;
	CString	m_sDecompChar;
	BOOL	m_bUseSFMarkers;
	BOOL	m_bAllDecompAmgiguities;
#ifndef hab215
	BOOL	m_bApplyOutputChanges;
#endif // hab215

	CTypedPtrArray<CPtrArray, CIntergenMarker*> m_markers;

/*	BOOL	m_bIncludeAnalysis;
	BOOL	m_bIncludeCategory;
	BOOL	m_bIncludeDecomp;
	BOOL	m_bIncludeFeature;
	BOOL	m_bIncludeOriginalWord;
	BOOL	m_bIncludeProperty;
	BOOL	m_bIncludeUForm;
	// markers
	CString	m_sMarkerAnalysis;
	CString	m_sMarkerCategory;
	CString	m_sMarkerDecomp;
	CString	m_sMarkerFeature;
	CString	m_sMarkerOriginalWord;
	CString	m_sMarkerProperty;
	CString	m_sMarkerUForm;
*/
	friend CIntergenMarkersCtrl;
};
