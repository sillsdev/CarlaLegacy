/////////////////////////////////////////////////////////////////////////////

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// TestEdit.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CTestEdit window

class CTestEdit : public CRichEditCtrl
{
// Construction
public:
	CTestEdit();

	void Initialize();
// Attributes
public:
	void SetChangeCase(BOOL bChange);

	void SetSLComment( TCHAR chComment );
	void SetSLComment(LPCTSTR lpszComment);
	void SetStringQuotes(LPCTSTR lpszStrQ);

	void AddOPErators(LPCTSTR lpszKwd);
	void AddPOSition(LPCTSTR lpszKwd);
	void AddTYPe(LPCTSTR lpszKwd);
	void AddTRM(LPCTSTR lpszKwd);
	void AddNBR(LPCTSTR lpszKwd);
	void AddACTions(LPCTSTR lpszKwd);

	void SetDefaultColor(COLORREF clr, BOOL bBold,BOOL bItalic, BOOL bUnderline, BOOL bStrikeout);
	void SetOPEratorsColor( COLORREF clr,BOOL bBold,BOOL bItalic,BOOL bUnderline,BOOL bStrikeout );
	void SetPOSitionColor( COLORREF clr,BOOL bBold,BOOL bItalic,BOOL bUnderline,BOOL bStrikeout );
	void SetTYPeColor( COLORREF clr,BOOL bBold,BOOL bItalic,BOOL bUnderline,BOOL bStrikeout );
	void SetTRMColor( COLORREF clr,BOOL bBold,BOOL bItalic,BOOL bUnderline,BOOL bStrikeout );
	void SetNBRColor( COLORREF clr,BOOL bBold,BOOL bItalic,BOOL bUnderline,BOOL bStrikeout );
	void SetACTionsColor( COLORREF clr, BOOL bBold,BOOL bItalic, BOOL bUnderline,BOOL bStrikeout );
	void SetCOMmentsColor( COLORREF clr,BOOL bBold,BOOL bItalic,BOOL bUnderline,BOOL bStrikeout );
	void SetStringColor( COLORREF clr,BOOL bBold,BOOL bItalic,BOOL bUnderline,BOOL bStrikeout );
	void SetMistakeColor( COLORREF clr,BOOL bBold,BOOL bItalic,BOOL bUnderline,BOOL bStrikeout );
	void setDefaultCharFormat();
	void setSelectionCharFormat( );
	void setWordWrap( BOOL bFlag );
	void setBackgroundColor( BOOL bUseSystemColor );
	void readRegistry( LPCTSTR lpzSection );

// Operations
public:
	void FormatAll();
	void SetFontSize( LPCTSTR lpzFontSize);


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTestEdit)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CTestEdit();

	// Generated message map functions
protected:
	BOOL IsStringQuote(TCHAR ch);

	int IsOPErators( LPCTSTR lpszSymbol );
	int IsPOSitions( LPCTSTR lpszSymbol );
	int IsTYPes( LPCTSTR lpszSymbol );
	int IsTRM( LPCTSTR lpszSymbol );
	int IsACTions( LPCTSTR lpszSymbol );

	CString m_lpzFontSize;

	void SetFormatRange(int nStart, int nEnd, BOOL bBold,
						BOOL bItalic,BOOL bUnderline,
						BOOL bStrikeout,COLORREF clr);
	void FormatTextRange(int nStart, int nEnd);
	void FormatTextLines(int nStart, int nEnd);
	void ChangeCase(int nStart, int nEnd, LPCTSTR lpszStr);


	struct SymbolColor {
		COLORREF clrColor;
		BOOL bBold;
		BOOL bItalic;
		BOOL bUnderline;
		BOOL bStrikeout;
	};

	COLORREF clrDefaultColor;

	enum ChangeType {ctUndo, ctUnknown, ctReplSel, ctDelete, ctBack, ctCut, ctPaste, ctMove, ctSpace};

	BOOL m_bCaseSensitive;
	BOOL m_bChangeCase;
	TCHAR m_chComment;

	CString m_strLastKeyWord;

	CString m_strOPErators;
	CString m_strPOSition;
	CString m_strTYPe;
	CString m_strTRM;
	CString m_strNBR;
	CString m_strACTions;
	CString m_strComment;
	CString m_strStringQuotes;


	CString m_strOPEratorsLower;
	CString m_strPOSitionLower;
	CString m_strTYPeLower;
	CString m_strTRMLower;
	CString m_strNBRLower;
	CString m_strACTionsLower;


	SymbolColor m_colorDefault;
	SymbolColor m_colorOPErators;
	SymbolColor m_colorPOSitions;
	SymbolColor m_colorTYPes;
	SymbolColor m_colorTRM;
	SymbolColor m_colorNBR;
	SymbolColor m_colorACTions;
	SymbolColor m_colorCOMments;
	SymbolColor m_colorString;
	SymbolColor m_colorMistake;


	COLORREF m_clrBackgoundColor;


	BOOL m_bInForcedChange;
	ChangeType m_changeType;
	CHARRANGE m_crOldSel;

	//{{AFX_MSG(CTestEdit)
	afx_msg void OnChange();
	afx_msg UINT OnGetDlgCode();
	afx_msg void OnChar(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg void OnContextMenu(CWnd* pWnd, CPoint point);

	//}}AFX_MSG
	afx_msg LRESULT OnSetText(WPARAM wParam, LPARAM lParam);
	afx_msg void OnProtected(NMHDR*, LRESULT* pResult);
	afx_msg void OnSelChange(NMHDR*, LRESULT* pResult);
	afx_msg void displayKeywordsList();
	DECLARE_MESSAGE_MAP()

	private:
		BOOL m_bOpenQuote;
		BOOL m_bUseBackgroundSystemColor;



};

/////////////////////////////////////////////////////////////////////////////
