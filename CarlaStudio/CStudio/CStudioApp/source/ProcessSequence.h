// ProcessSequence.h: interface for the CProcessSequence class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_ProcessSequence_H__F831CC01_FEAF_11D1_89BE_0000C035C8C8__INCLUDED_)
#define AFX_ProcessSequence_H__F831CC01_FEAF_11D1_89BE_0000C035C8C8__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXTEMPL_H__
#include <afxtempl.h>
#endif
#include <afxcoll.h>
#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#include <fstream.h>

#include "CWProcess.h"
#include "SFMFile.h"
class CCarlaLanguage;
class CProcessSequence;

class CProcessSequence : public CObject
{
public:
	CProcess* getFirstProcessOfType(CString sTypeID);
	int getProcessorCount() const;
	// creation
	CProcessSequence(CCarlaLanguage* pLang);
	virtual ~CProcessSequence();
	void setupDefault();
	virtual void finishCreate();

	// processing
//	BOOL processRAWTextFile(LPCTSTR lpszPath, CProcessStatus* pStatus);
	BOOL continueProcessing(CProcessStatus* pStatus);

	// i/o
	BOOL doEditDialog();
	virtual void readFromFile(SFMFile& f);
	virtual void writeToFile(ofstream& fout) const;
	virtual void writeParamsToFile(ofstream & fout) const;

	// accessors
	virtual BOOL isValidSequence(CString& sInvalidMsg) const;
	virtual CString getFullName() const =0;
	static void getAvailableProcessorList(	CTypedPtrArray<CPtrArray, CProcessTemplate*>& pProcessTemplates);
	virtual int getFunctionCode() const =0;
	virtual CString getOpeningSFMMarker()  const =0;
	void addProcess(CProcess* pProc, int index=-1);

protected:
	// to do: fix this (transfer overrides)
	BOOL setupStatus(CProcessStatus* pStatus);
	CCarlaLanguage* m_pLang;
	CProcessTemplate* findTemplateFor(LPCSTR sIdentifier);
	CTypedPtrArray<CPtrArray, CProcess*>  m_pProcesses;
	void removeAll();
	virtual CString getClosingSFMMarker() const = 0;
};

class CAnalysisProcessSequence : public CProcessSequence
{
	public:
		virtual int getFunctionCode() const {return CProcess::kAnalysis; }
		virtual BOOL isValidSequence(CString& sInvalidMsg) const;
		CAnalysisProcessSequence(CCarlaLanguage* pSourceLang);
		CAnalysisProcessSequence(CCarlaLanguage* pSourceLang, SFMFile& f);
		virtual CString getFullName() const;
		virtual CString getOpeningSFMMarker()  const {return "+AnalysisProcessSequence";}
		static CString OPENING_SFM_MARKER()  {return "+AnalysisProcessSequence";}
		virtual CString getClosingSFMMarker() const {return "-AnalysisProcessSequence";}

	protected:

};

class CSynthesisProcessSequence : public CProcessSequence
{
	public:
		virtual int getFunctionCode() const {return CProcess::kSynthesis; }
		CSynthesisProcessSequence(CCarlaLanguage* pTargetLang);
		CSynthesisProcessSequence(CCarlaLanguage* pTargetLang, SFMFile& f);
		virtual BOOL isValidSequence(CString& sInvalidMsg) const;
		virtual CString getFullName() const;
		virtual CString getOpeningSFMMarker() const {return "+SynthesisProcessSequence";}
		static CString OPENING_SFM_MARKER()  {return "+SynthesisProcessSequence";}
		virtual CString getClosingSFMMarker() const {return "-SynthesisProcessSequence";}
	protected:

};

class CInterlinearProcessSequence : public CProcessSequence
{
	public:
		virtual int getFunctionCode() const {return CProcess::kInterlinear; }
		CInterlinearProcessSequence(CCarlaLanguage* pSourceLang);
		CInterlinearProcessSequence(CCarlaLanguage* pSourceLang, SFMFile& f);
		virtual BOOL isValidSequence(CString& sInvalidMsg) const;
		virtual CString getFullName() const;
		virtual CString getOpeningSFMMarker() const {return "+InterlinearProcessSequence";}
		static CString OPENING_SFM_MARKER()  {return "+InterlinearProcessSequence";}
		virtual CString getClosingSFMMarker() const {return "-InterlinearProcessSequence";}
	protected:

};
class CTransferProcessSequence : public CProcessSequence
{
	public:
		virtual int getFunctionCode() const {return CProcess::kTransfer; }
		virtual BOOL isValidSequence(CString& sInvalidMsg) const;
		CTransferProcessSequence(CCarlaLanguage* pSourceLang, CCarlaLanguage* pTargetLang);
		CTransferProcessSequence(CCarlaLanguage* pSourceLang, SFMFile& f);
//		void create (CCarlaLanguage* pTargetLang);
		virtual void finishCreate();
		virtual void writeToFile(ofstream & fout) const;
		virtual CString getFullName() const;
		virtual CString getFunctionName() const;
		CCarlaLanguage* getTargetLang() {return m_pTargetLang;}
		virtual CString getOpeningSFMMarker() const {return "+TransferProcessSequence";}
		static CString OPENING_SFM_MARKER()  {return "+TransferProcessSequence";}

		virtual CString getClosingSFMMarker() const {return "-TransferProcessSequence";}
	protected:
		virtual void readFromFile(SFMFile& f);
		CString m_sTempTargetID;
		CCarlaLanguage* m_pTargetLang;
		virtual void writeParamsToFile(ofstream & fout) const;
};
#endif // !defined(AFX_ProcessSequence_H__F831CC01_FEAF_11D1_89BE_0000C035C8C8__INCLUDED_)
