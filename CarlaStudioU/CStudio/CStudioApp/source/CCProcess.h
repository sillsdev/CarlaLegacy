// CCProcess.h: interface for the CCCProcess class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_CCPROCESS_H__A7066661_5878_11D2_864E_444553540000__INCLUDED_)
#define AFX_CCPROCESS_H__A7066661_5878_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#include "CWProcess.h"
class SFMFile;
#include <fstream.h>
#define CCDISPLAYNAME "CC"

class CCCProcess : public CDLLProcess
{
public:
	enum {kText=0, kDicts, kANA, kInterlinear};	// file types

	DECLARE_DYNCREATE(CCCProcess);
	CCCProcess();
	virtual ~CCCProcess();
	virtual void readParametersFromSFMFile(SFMFile *f) ;

	// Interface
	static LPCTSTR INPUT_TYPE_DISPLAY();
	static LPCTSTR OUTPUT_TYPE_DISPLAY() ;

	static LPCSTR ID() {return "CC-DLL";}
	virtual LPCSTR  getProcessorID() const {return ID();}
	virtual LPCSTR getDisplayName() const { return CCDISPLAYNAME;}
	virtual BOOL doEditDialog(int iFunctionCode);

	// Processing
	virtual PROCESS_FILE_TYPE getInputType();
	virtual PROCESS_FILE_TYPE getOutputType() ;
	virtual void processRAWTextFile(CProcessStatus& status);
	virtual void processANAFile(CProcessStatus& status);
	virtual void processDictionaries(CProcessStatus& status);
	virtual void processInterlinearFile(CProcessStatus& status);

	// Disk I/O
	virtual void writeToStream(ostream& fout) const;


protected:
	void beforeProcessing(CProcessStatus& status, CString& sBaseName);
	void afterProcessing(CProcessStatus& status);

	ofstream* m_pLogOut;
	void unloadTable();
	HANDLE m_hCCEnvironment;
/*int WINAPI m_funcCCLoadTable(char *lpszCCTableFile,
					   HANDLE* hpLoadHandle,
					   HINSTANCE hParent);

					   //FARPROC m_funcCCLoadTable;
	FARPROC m_funcCCProcessFile;
	FARPROC m_funcCCUnloadTable;
*/
	void runCCDLL(CPathDescriptor& inPath, CPathDescriptor& outPath);
	CString m_sName;
	CString m_sDescription;
	CString m_sTablePath;
	CPathDescriptor m_sLogPath;
	int m_iFileType;
	virtual void setDefaultValues();
};

#endif // !defined(AFX_CCPROCESS_H__A7066661_5878_11D2_864E_444553540000__INCLUDED_)
