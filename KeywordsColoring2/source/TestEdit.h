// Last revison: 4/19/2002 1:24:12 PM [mr]

/////////////////////////////////////////////////////////////////////////////

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// TestEdit.h : header file
//
#ifndef mr270
#include "TestEditModel.h"
#endif // mr270

/////////////////////////////////////////////////////////////////////////////
// CTestEdit window

class CTestEdit : public CRichEditCtrl
{
// Construction
public:
	CTestEdit();


// Attributes
public:
	struct SymbolColor {
		COLORREF clrColor;
		BOOL bBold;
		BOOL bItalic;
		BOOL bUnderline;
		BOOL bStrikeout;
	};

	BOOL m_bIsAmple;


	SymbolColor m_colorDefault,m_colorOPErators,m_colorForOPErators,
		m_colorLOCations,m_colorKEYWords,m_colorCONNectors,
		m_colorTYPes,m_colorNBR,m_colorIdentifiers,m_colorError,
		m_colorCOMments;

	CString m_strOPE,m_strFOROPE,m_strLOC,m_strCONN,
			m_strTYP,m_strNBRE,m_strKEYW;

	CString m_strOPErators,m_strFOROPerators,m_strLOCations,m_strKEYWords,
			m_strKEYWords_Act,m_strCONNectors,m_strTYPes,m_strNBR;

	CString m_strOPEratorsLower,m_strFOROPeratorsLower,m_strLOCationsLower,
			m_strKEYWordsLower,m_strKEYWords_ActLower,m_strCONNectorsLower,
			m_strTYPesLower,m_strNBRLower;


	CTestEditModel *m_pTestEditModel;

	CStringArray *m_pTYPEList,*m_pLOGOPList,*m_pPOSITIONList,*m_pNEIGHBORList,
					*m_pRELOPList,*m_pAllKeywords,*m_pConstant,*m_pKeyword_property,
					*m_pKeyword_morphname,*m_pIdentifier,*m_pKeyword_member,
					*m_pKeyword_position,*m_pKeyword_allomorph,
					*m_pKeyword_surface,*m_pKeyword_word,*m_pKeyword_neighbor,
					*m_pKeyword_fromtocategory,*m_pKeyword_capitalized,*m_pKeyword_orderclass,
					*m_pKeyword_relop,*m_pConst,*m_pType,*m_pKeyword_type,*m_pKeyword_logop,
					*m_pKeyword_for,*m_pKeyword_insert,*m_pKeyword_posStamp,*m_pKeyword_report,
					*m_pKeyword_afterbefore,*m_pKeyword_orderclassminmax,*m_pKeywordPunctuation;


	// Operations
public:
	void Initialize(BOOL bIsAmple,TCHAR szComment,
						   CString strFontFaceName,
						   CTestEditModel *pTestEditModel,
						   BOOL bReadOnly );
	void FormatAll();
	void SetFontSize( LPCTSTR lpzFontSize);
	void SetChangeCase(BOOL bChange);
	void SetSLComment( TCHAR chComment );
	//void SetSLComment(LPCTSTR lpszComment);
	void SetStringQuotes(LPCTSTR lpszStrQ);
	void AddKeywords( LPCTSTR lpszKwd,CString &str, CString &strLower );
	void setColor( SymbolColor &color,COLORREF clr,BOOL bBold,BOOL bItalic,BOOL bUnderline,BOOL bStrikeout);
	void setDefaultCharFormat();
	void setSelectionCharFormat( );
	void setWordWrap( BOOL bFlag );
	void setBackgroundColor( BOOL bUseSystemColor );
#ifndef mr270
	void readTestEditModel();
#else // mr270
	void readRegistry( LPCTSTR lpzSection );
#endif // mr270

#ifndef mr270
	void setFontFaceName(CString lpstrFontName);
#endif // mr270

#ifndef mr270
	void setTestEditModel(CTestEditModel *pTestEditModel){m_pTestEditModel=pTestEditModel;}
#endif // mr270


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTestEdit)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CTestEdit();

	// Generated message map functions
//protected:
public:


	BOOL m_bUseBackgroundSystemColor;


	BOOL IsStringQuote(TCHAR ch);
	int searching( LPCTSTR lpszSymbol,CString &strGroup );
	void SetFormatRange(int nStart, int nEnd, BOOL bBold,
						BOOL bItalic,BOOL bUnderline,
						BOOL bStrikeout,COLORREF clr);
	void FormatTextRange(int nStart, int nEnd);
	void FormatTextLines(int nStart, int nEnd);
	void ChangeCase(int nStart, int nEnd, LPCTSTR lpszStr);
	int checkNextWord(CStringArray *pstrAuthorized,
						CStringArray *pstrAall,
						CString &pstrLastKeyWord,
						BOOL bIdentifierAuthorized,
						BOOL bIsIdentifier=FALSE);
	BOOL checkConstant(CStringArray *pstrConstant,
							 CString &pstrLastKeyWord );


	enum ChangeType {ctUndo, ctUnknown, ctReplSel, ctDelete, ctBack, ctCut, ctPaste, ctMove, ctSpace};

	COLORREF m_clrDefaultColor,m_clrBackgoundColor;

	BOOL m_bInForcedChange,m_bChangeCase;

	TCHAR m_chComment;

	CString m_lpzFontSize,m_strPOSition,
		m_strTYPe,m_strTRM,m_strACTions,m_strComment,
		m_strStringQuotes,m_strPOSitionLower,m_strTYPeLower,
		m_strTRMLower;

	ChangeType m_changeType;
	CHARRANGE m_crOldSel;

	//{{AFX_MSG(CTestEdit)
	afx_msg void OnChange();
	afx_msg UINT OnGetDlgCode();
	afx_msg void OnChar(UINT nChar, UINT nRepCnt, UINT nFlags);

	//}}AFX_MSG
	afx_msg LRESULT OnSetText(WPARAM wParam, LPARAM lParam);
	afx_msg void OnProtected(NMHDR*, LRESULT* pResult);
	afx_msg void OnSelChange(NMHDR*, LRESULT* pResult);
	DECLARE_MESSAGE_MAP()



#ifndef mr270
	CString m_strFontFaceName;
#endif // mr270

public:

	COLORREF getColor(COLORREF &color){return color;};

};

/////////////////////////////////////////////////////////////////////////////
