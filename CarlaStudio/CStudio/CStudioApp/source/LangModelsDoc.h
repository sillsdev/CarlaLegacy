// jdh 11/9/99 added finishCreateInterface() to enable bi-directional transfer user-interface topic

#if !defined(AFX_LANGMODELSDOC_H__D5687882_1CCE_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_LANGMODELSDOC_H__D5687882_1CCE_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// LangModelsDoc.h : header file
//
class CCarlaLanguage;
class CTextDisplayInfo;
class SFMFile;
class ofstream ;
#include "TabbedTreeDoc.h"

const UINT kBaseFormControlID = 2000;

/////////////////////////////////////////////////////////////////////////////
// CLangModelsDoc document

class CLangModelsDoc : public CTabbedTreeDoc
{
protected:
	CLangModelsDoc();           // protected constructor used by dynamic creation
	DECLARE_DYNCREATE(CLangModelsDoc)
	CCarlaLanguage *m_pLang;
	CWCarlaMenuInterface* m_pCarlaMenuInterface;
	CWFunctionalInterface* m_pFunctionalInterface;

// Attributes
public:
	static CString getRegFileTypeID() {return "CarlaStudioLanguageDoc";}

// Operations
public:

	 // Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLangModelsDoc)
	public:
	virtual BOOL OnOpenDocument(LPCTSTR lpszPathName);
	virtual void OnCloseDocument();
	virtual void SetTitle(LPCTSTR lpszTitle);
	virtual BOOL OnSaveDocument(LPCTSTR lpszPathName);
	protected:
	virtual BOOL OnNewDocument();
	virtual BOOL SaveModified();
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual void SetModifiedFlag( BOOL bModified = TRUE );
	void writeProjectDocLine(ofstream& fout);
	static CLangModelsDoc* loadDocument(LPCTSTR lpszField, LPCTSTR sProjectPath);
	static CString getLangDocBeginMarker() {return "+LangDoc";}
	static CString getProjectDocMarker() {return "Lang";}
	void writeParams(ofstream& fout);
	void readParams(SFMFile& f);
	void reallyCloseDocument();
	void finishCreateData();
	// jdh 11/9/99 added finishCreateInterface() & updateInterface() to enable bi-directional transfer user-interface topic
	void finishCreateInterface();
	void updateInterface();

	void showWindow();
	CProjectDoc* getProject();
//	 CLangModelsDoc(LPCTSTR lpszAbrev, LPCTSTR lpszDirContainingCarlaSet);
	CFont* getLangFont();
	const CTextDisplayInfo* getLangDisplayInfo();
	CCarlaLanguage* getLang();
	virtual ~CLangModelsDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
protected:
	CString m_sWindowPlacementField;
	//{{AFX_MSG(CLangModelsDoc)
	afx_msg void OnCARLAMenu();
	afx_msg void OnFunctional();
	afx_msg void OnUpdateFunctional(CCmdUI* pCmdUI);
	afx_msg void OnUpdateCARLAMenu(CCmdUI* pCmdUI);
	afx_msg void OnTestGrid();
	afx_msg void OnUpdateLangProperties(CCmdUI* pCmdUI);
	afx_msg void OnLangProperties();
	afx_msg void OnLangSynthesisSeq();
	afx_msg void OnLangAnalysisSeq();
	afx_msg void OnLangQuickParse();
	afx_msg void OnLangInterlinearSeq();
	afx_msg void OnRemoveLanguage();
	afx_msg void OnModifyTests();
	afx_msg void OnCustomizeUserTestDisplay();
	//}}AFX_MSG
	afx_msg void OnTransferSeqCommand(UINT id);
	DECLARE_MESSAGE_MAP()

	friend CCarlaLanguage; // these two will be merged into one class eventually
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LANGMODELSDOC_H__D5687882_1CCE_11D2_A09E_E12649467D2F__INCLUDED_)
