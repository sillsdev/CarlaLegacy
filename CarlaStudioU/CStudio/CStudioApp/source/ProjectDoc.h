// CProjectDoc.h : interface of the CProjectDoc class
//
/////////////////////////////////////////////////////////////////////////////
#ifndef __CProjectDoc__
#define __CProjectDoc__

#define LANG_MENU_COMMAND_BASE 2000
// The following is actuall 4 items + (number of docs -1), -1 cause
//		we don't have a transfer sequence from a language to itself
#define LANG_MENU_NUM_ITEMS (3+m_pLangDocs.GetSize())
// To DO: get rid of this maximum or enforce a large max if needed
#define LANG_MENU_MAX_LANGS 20
// this is also used by cstudio.cpp, since it intercepts and forwards
// these commands to the project doc
#define LANG_MENU_COMMAND_RANGE_END LANG_MENU_COMMAND_BASE + (LANG_MENU_MAX_LANGS*(4+(LANG_MENU_MAX_LANGS-1)))


#include <fstream.h>

class CLangModelsDoc;
class CInputDoc;
class CCarlaLanguage;
class CSrcTextProcessingPrefs;
class CPrefsInputDocDisplay;
class CAnaProcessingPrefs;

class CProjectDoc : public CDocument
{
protected: // create from serialization only
	// import only
	BOOL doSetupWizard(BOOL bProjectCreation);
	//BOOL doNewFromFiles(CString& sProjectPath);
	BOOL doNewFromCarlaMenu(CString& sProjectPath);

	// other stuff
	CFrameWnd* getFrame();
//	void lookupLangID(CLangModelsDoc** ppLangDoc, CString& sLangID);
//	CTypedPtrArray<CPtrArray, CCarlaLanguage*> m_pLanguages;
	CTypedPtrArray<CPtrArray, CLangModelsDoc*> m_pLangDocs;

	//CLangModelsDoc* m_pSource, *m_pTarget;
	CSrcTextProcessingPrefs* m_pSrcTextProcessingDefaults;
	CAnaProcessingPrefs* m_pAnaProcessingDefaults;
	CPrefsInputDocDisplay* m_pInputDocDisplayPrefs;

	CString fromRelativePath(LPCTSTR dir, LPCTSTR partialPath);
	CString toRelativePath(LPCTSTR dir, LPCTSTR fullPath);
//	BOOL loadControlFiles();

	void setTargetLang(CCarlaLanguage* pLang);
	void setSourceLang(CCarlaLanguage* pLang);
	void setTargetLangDoc(CLangModelsDoc* pDoc);
	void setSourceLangDoc(CLangModelsDoc* pDoc);

	CProjectDoc();
	DECLARE_DYNCREATE(CProjectDoc)
	void SetDirectory(LPCTSTR lpszPathName);

// Attributes
public:
	void updateAllOtherWindows();
	static CString getRegFileTypeID() {return _T("CarlaStudioProject");}
	BOOL readCarlaMenuSettings(CString& sPath, CString& srcAbrev, CString& targAbrev, char& cCommentChar);
	CTypedPtrArray<CPtrArray, CLangModelsDoc*>& getLangDocs() {return m_pLangDocs;}
	CCarlaLanguage* getSourceLang();
	CLangModelsDoc* getSourceLangDoc();
	CCarlaLanguage* getTargetLang();
	CLangModelsDoc* getTargetLangDoc();

	CSrcTextProcessingPrefs* getSourceProcessingDefaults() const {ASSERTX(m_pSrcTextProcessingDefaults); return m_pSrcTextProcessingDefaults;}
	CAnaProcessingPrefs* getAnaProcessingDefaults() const {ASSERTX(m_pAnaProcessingDefaults); return m_pAnaProcessingDefaults;}

	// creation methods
	enum {kFromScratch, kFromCarlaMenu, kFromControlFiles};

// Operations
public:
	void doProjectSetup() {OnProjectSetup();}

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CProjectDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	virtual BOOL OnSaveDocument(LPCTSTR lpszPathName);
	virtual BOOL OnOpenDocument(LPCTSTR lpszPathName);
	virtual void OnCloseDocument();
	//}}AFX_VIRTUAL

// Implementation
public:
	int getLanguageCount();
	void setWorkingDirectory();
	CCarlaLanguage* getLangFromIndex(int i);
	bool getHaveLanguages();
	void cleanupAfterOpen();
	CPrefsInputDocDisplay* getInputDocDisplayPrefs();
	void updateWindowMenu();
	void writeToLog(LPCTSTR lpszA, LPCTSTR lpszB, LPCTSTR lpszC, LPCTSTR lpszD);
	CString getProjectDir();
	void setSrcTextProcessingDefaults(CSrcTextProcessingPrefs*);
	void setAnaProcessingDefaults(CAnaProcessingPrefs*);
	CCarlaLanguage* getLangFromID(LPCTSTR lpszLangID);
	CLangModelsDoc* getLangDocFromID(LPCTSTR lpszLangID);
	BOOL isAlive();
	void OnFILENewLanguage();
	void OnQuickParse();
	void OnUpdateQuickParse(CCmdUI* pCmdUI);

	BOOL getIsClosing();
	void registerLangDoc(CLangModelsDoc* pLangDoc);
	void removeLangDoc(CLangModelsDoc * pLangDoc);
	void OnLangPopUpCommand(UINT id);
	void updateMenus();
//	void setupProcessDoc(CInputDoc* pDoc);
	CFont* getDefaultFont();
	void synchronizeExternals();
	virtual ~CProjectDoc();
	afx_msg void OnProjectSetup();
	void removeLanguage(CLangModelsDoc* pLangDoc);

#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	void finishOpen();
	void cycleLangDocs();
	CFont* m_pDefaultFont;
	//{{AFX_MSG(CProjectDoc)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

#endif
