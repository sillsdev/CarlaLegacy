// InputDoc.h : header file
//
class CInputDocView;
class CCarlaLanguage;

class CProcessSequence;
class ostream;
class CProcessingPrefs;
class CSrcTextProcessingPrefs;
class CAnaProcessingPrefs;
class CPrefsInputDocDisplay;
class CResultStreamFile;
class CProcessStatus;
class CResultStream;
class SFMFile;
class ofstream;
class CResultStreamDescriptor;
class CPathDescriptor;

// 5/15/99 JDH added several members here to support ITask Automation stuff
class CRemoteCommand
{
public:
	CRemoteCommand() : pSourceLang(NULL), pTargetLang(NULL), flags(NULL), bIncludeMarkers(TRUE){}
	int iGoal;

	typedef enum CSOUTPUTLOCATION	// this is duplicated in the Task.idl file
	{								// so any changes need to be in both places
		csReplaceInput,
		csSameFolderAsInput,
		csSpecifiedPath
	} CSOUTPUTLOCATION;
	CSOUTPUTLOCATION eOutputLocation;

	CCarlaLanguage* pSourceLang;
	CCarlaLanguage* pTargetLang;

	CString sDesiredOutputPath;
	CString sActualOutputPath;
	BOOL	bIncludeMarkers;	// if FALSE, then exclude lines with these markers
	CString sMarkersToIncludeOrExclude;
	CString sErrorMessage; // unused in feb 99
	DWORD flags; // unused in feb 99
} ;


/////////////////////////////////////////////////////////////////////////////
// CInputDoc document
class CInputDoc : public CDocument	// ABSTRACT CLASS, but MFC won't let it be truelly abstract since it has to be declare_dyncreate
{
protected:

	CProcessStatus* m_pProcessStatus;
	CResultStreamFile* m_pBaseStream;
	void doViewDependentSetup();
	void loadResultPanels(BOOL bWarnIfNotFound, CProcessStatus* pProcessResults);
	DECLARE_DYNCREATE(CInputDoc)
	// dialog i/o
	virtual void customizePropertySheet(CPropertySheet& dlg);// should be =0;
	virtual void readPropertySheet(CPropertySheet& dlg);
	virtual void propertySheetClosed(CPropertySheet& dlg);// should be =0;

	CCarlaLanguage* getInputLang() ;
	CInputDocView* m_pView;

// Attributes
public:
	CCarlaLanguage* getSrcLang() ;
	CCarlaLanguage* getTarLang() ;
	CPrefsInputDocDisplay* getDisplayPrefs();
	CProcessStatus* getProcessResults() {return m_pProcessStatus;}
	CString getInputFilePath() {return m_strPathName;}
	virtual BOOL doRunProcessors(CRemoteCommand* pRemoteCmd=NULL);

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CInputDoc)
	public:
	virtual	 void OnUpdateRunProcessors(CCmdUI* pCmdUI);
	virtual void SetTitle(LPCTSTR lpszTitle);
	virtual BOOL OnSaveDocument(LPCTSTR lpszPathName);
	virtual void SetPathName(LPCTSTR lpszPathName, BOOL bAddToMRU = TRUE);
	protected:
	virtual BOOL OnNewDocument();
	//}}AFX_VIRTUAL

// Implementation
public:
	void SetBaseReadOnly(BOOL bReadOnly);
	virtual void SetModifiedFlag(BOOL bModified);
	BOOL m_bBaseIsEditable;
	virtual CString getBeginMarker() const {return "+ERROR";} // should be = 0;
	virtual CString getEndMarker() const {return "-ERROR";}// should be = 0;

	void OnActivate();
	CResultStream* getNthVisibleStream(int index);
	void setView(CInputDocView* pWin) {m_pView = pWin;}
	virtual void readParams(SFMFile& f) {}// should be =0;
	virtual void writeParams(ofstream& fout);
//	void setProcessSequence(CProcessSequence* pSeq);
	CWnd* getWindow();
	 CInputDoc();
	virtual ~CInputDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
	afx_msg void OnRunProcessors();
protected:
	void redirectOutputFile(int nGoal, int nStage,CPathDescriptor& originalOutPath,
							CPathDescriptor &newPath,
							CProcessStatus* pStatus);
	virtual BOOL getCanDoAnalysis() const {return FALSE;}
	virtual CProcessingPrefs* getProcessingPrefs() {ASSERTX(FALSE); return NULL;}
//	virtual void beforeRunProcessors();
	CResultStream* getResultStreamFromDescriptor(CResultStreamDescriptor& rRSD);
	void storeAvailablePanels();
	//CPageInputDocPanels* m_pPanelPrefsPage;
	//{{AFX_MSG(CInputDoc)
	afx_msg void OnEditProcessSequence();
	afx_msg void OnEditProcessingProperties();
	afx_msg void OnUpdateEditInputDocProperties(CCmdUI* pCmdUI);
	afx_msg void OnEditDisplayProperties();
	afx_msg void OnFileSaveAs();
	afx_msg void OnRunTrace();
	afx_msg void OnUpdateRunTrace(CCmdUI* pCmdUI);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
// CSourceTextInputDoc document

class CSourceTextInputDoc : public CInputDoc
{
protected:
	virtual BOOL getCanDoAnalysis() const {return TRUE;}
	// dialog i/o
	//virtual void customizePropertySheet(CPropertySheet& dlg);
	//virtual void readPropertySheet(CPropertySheet& dlg);
	//virtual void propertySheetClosed(CPropertySheet& dlg);


	CSrcTextProcessingPrefs* m_pProcessingPrefs;	// when null, means use default of project
	virtual CProcessingPrefs* getProcessingPrefs() {return (CProcessingPrefs*)m_pProcessingPrefs;}

	DECLARE_DYNCREATE(CSourceTextInputDoc)

// Attributes
public:
	static CSourceTextInputDoc* loadDocument(LPCTSTR lpszField, SFMFile& f);
	static CString getRegFileTypeID() {return "CarlaStudioSourceDoc";}
	static CString BEGIN_MARKER() {return "+SrcTextInputDoc";}
	static CString END_MARKER() {return "-SrcTextInputDoc";}
	virtual CString getBeginMarker() const {return "+SrcTextInputDoc";}
	virtual CString getEndMarker() const {return "-SrcTextInputDoc";}
	virtual void readParams(SFMFile& f);
// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSourceTextInputDoc)
	public:
	protected:
	//virtual BOOL OnNewDocument();
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual CResultStream* getBaseStream();
	 CSourceTextInputDoc();
	virtual ~CSourceTextInputDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
protected:
	//{{AFX_MSG(CSourceTextInputDoc)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
// CAnaInputDoc document

class CAnaInputDoc : public CInputDoc
{
protected:
	virtual BOOL getCanDoAnalysis() const {return FALSE;}
	// dialog i/o
	//virtual void customizePropertySheet(CPropertySheet& dlg);
	//virtual void readPropertySheet(CPropertySheet& dlg);
	//virtual void propertySheetClosed(CPropertySheet& dlg);


	CAnaProcessingPrefs* m_pProcessingPrefs;	// when null, means use default of project
	virtual CProcessingPrefs* getProcessingPrefs() {return (CProcessingPrefs*)m_pProcessingPrefs;}

	DECLARE_DYNCREATE(CAnaInputDoc)

// Attributes
public:
	static CAnaInputDoc* loadDocument(LPCTSTR lpszField, SFMFile& f);
	static CString getRegFileTypeID() {return "CarlaStudioANADoc";}
	static CString BEGIN_MARKER() {return "+ANAInputDoc";}
	static CString END_MARKER() {return "-ANAInputDoc";}
	virtual CString getBeginMarker() const {return "+ANAInputDoc";}
	virtual CString getEndMarker() const {return "-ANAInputDoc";}
	virtual void readParams(SFMFile& f);
// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAnaInputDoc)
	public:
	protected:
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual CResultStream* getBaseStream();
	 CAnaInputDoc();
	virtual ~CAnaInputDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
protected:
	//{{AFX_MSG(CAnaInputDoc)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
