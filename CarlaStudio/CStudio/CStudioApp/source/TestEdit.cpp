// Last revison: 4/19/2002 11:47:50 AM [mr]
// TestEdit.cpp : implementation file
//

#include "stdafx.h"
#include "TestEdit.h"
#include "resource.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

static const TCHAR szSection [] = _T("Settings\\TestsColor");

/////////////////////////////////////////////////////////////////////////////
// CTestEdit

CTestEdit::CTestEdit()
{
	m_chComment = 1;
	//m_bCaseSensitive = FALSE;
	m_bChangeCase = TRUE;


	m_bInForcedChange = FALSE;
	m_changeType = ctUndo;
	m_crOldSel.cpMin = m_crOldSel.cpMax = 0;
	m_bOpenQuote=FALSE;
	m_lpzFontSize="10";

}

CTestEdit::~CTestEdit()
{

}

void CTestEdit::readRegistry( LPCTSTR lpzSection )
{
	CWinApp* pApp = AfxGetApp ();


	clrDefaultColor=pApp->GetProfileInt( lpzSection,"DefaultColor",RGB(0,0,0));

	// background color
	m_bUseBackgroundSystemColor=pApp->GetProfileInt( lpzSection, "UseSystemColorBackground", TRUE);
	m_clrBackgoundColor = GetSysColor(COLOR_WINDOW);

	if( !m_bUseBackgroundSystemColor )
	{
		m_clrBackgoundColor=pApp->GetProfileInt( lpzSection, "ColorBackground", GetSysColor(COLOR_WINDOW));
	}


	setColor( m_colorDefault,
				pApp->GetProfileInt( lpzSection,"Defaultcolor",RGB(0,0,0)),	// color
				pApp->GetProfileInt( lpzSection,"Defaultbold",FALSE),		// bold
				pApp->GetProfileInt( lpzSection,"Defaultitalic",FALSE),		// italic
				pApp->GetProfileInt( lpzSection,"Defaultunderline",FALSE),	// underline
				pApp->GetProfileInt( lpzSection,"Defaultstrikeout",FALSE));	// striketout

	setColor( m_colorOPErators,
				pApp->GetProfileInt( lpzSection,"OPEcolor",RGB(255,0,0)),
				pApp->GetProfileInt( lpzSection,"OPEbold",FALSE),
				pApp->GetProfileInt( lpzSection,"OPEitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"OPEunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"OPESsrikeout",FALSE));

	setColor( m_colorForOPErators,
				pApp->GetProfileInt( lpzSection,"FOROPEcolor",RGB(0,0,255)),
				pApp->GetProfileInt( lpzSection,"FOROPEbold",FALSE),
				pApp->GetProfileInt( lpzSection,"FOROPEitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"FOROPEunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"FOROPEstrikeout",FALSE));

	setColor( m_colorLOCations,
				pApp->GetProfileInt( lpzSection,"LOCcolor",RGB(0,0,255)),
				pApp->GetProfileInt( lpzSection,"LOCbold",TRUE),
				pApp->GetProfileInt( lpzSection,"LOCitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"LOCunderline",TRUE),
				pApp->GetProfileInt( lpzSection,"LOCstrikeout",FALSE));

	setColor( m_colorKEYWords,
				pApp->GetProfileInt( lpzSection,"KEYWcolor",RGB(0,0,0)),
				pApp->GetProfileInt( lpzSection,"KEYWbold",TRUE),
				pApp->GetProfileInt( lpzSection,"KEYWitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"KEYWunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"KEYWstrikeout",FALSE));

	setColor( m_colorCONNectors,
				pApp->GetProfileInt( lpzSection,"CONNcolor",RGB(0,0,0)),
				pApp->GetProfileInt( lpzSection,"CONNbold",FALSE),
				pApp->GetProfileInt( lpzSection,"CONNitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"CONNunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"CONNstrikeout",FALSE));

	setColor( m_colorTYPes,
				pApp->GetProfileInt( lpzSection,"TYPEcolor",RGB(255,0,0)),
				pApp->GetProfileInt( lpzSection,"TYPEbold",FALSE),
				pApp->GetProfileInt( lpzSection,"TYPEitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"TYPEunderline",TRUE),
				pApp->GetProfileInt( lpzSection,"TYPEstrikeout",FALSE));

	setColor( m_colorIdentifiers,
				pApp->GetProfileInt( lpzSection,"IDENTIFcolor",RGB(123,112,230)),
				pApp->GetProfileInt( lpzSection,"IDENTIFbold",TRUE),
				pApp->GetProfileInt( lpzSection,"IDENTIFitalic",TRUE),
				pApp->GetProfileInt( lpzSection,"IDENTIFunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"IDENTIFstrikeout",FALSE));

	setColor( m_colorNBR,
				pApp->GetProfileInt( lpzSection,"NBRcolor",RGB(255,0,255)),
				pApp->GetProfileInt( lpzSection,"NBRbold",FALSE),
				pApp->GetProfileInt( lpzSection,"NBRitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"NBRunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"NBRstrikeout",FALSE));

	setColor( m_colorCOMments,
				pApp->GetProfileInt( lpzSection,"COMcolor",RGB(192,192,192)),
				pApp->GetProfileInt( lpzSection,"COMbold",FALSE),
				pApp->GetProfileInt( lpzSection,"COMitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"COMunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"COMstrikeout",FALSE));

	setColor( m_colorError,
				pApp->GetProfileInt( lpzSection,"ERRORcolor",RGB(128,128,128)),
				pApp->GetProfileInt( lpzSection,"ERRORbold",FALSE),
				pApp->GetProfileInt( lpzSection,"ERRORitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"ERRORunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"ERRORstrikeout",TRUE));


	// font size
	SetFontSize( pApp->GetProfileString( szSection,"FontSize","10"));

	// word wrap
	setWordWrap( pApp->GetProfileInt( lpzSection,"WordWrap",FALSE ));
}

void CTestEdit::SetFontSize( LPCTSTR lpzFontSize)
{
	m_lpzFontSize=lpzFontSize;
}

void CTestEdit::Initialize()
{
	readRegistry(szSection);

	// tab
	PARAFORMAT pf;
	pf.cbSize = sizeof(PARAFORMAT);
	pf.dwMask = PFM_TABSTOPS ;
	pf.cTabCount = MAX_TAB_STOPS;
	for( int itab = 0 ; itab < pf.cTabCount  ; itab++ )
		pf.rgxTabs[itab] =  800;//(itab + 1) * 2000/5;
	SetParaFormat( pf );


	// font
	setDefaultCharFormat( );
	SetEventMask(ENM_CHANGE | ENM_SELCHANGE | ENM_PROTECTED);

	// background
	setBackgroundColor( m_bUseBackgroundSystemColor );

}

void CTestEdit::setDefaultCharFormat( )
{
	CHARFORMAT cfDefault;
	cfDefault.cbSize = sizeof(cfDefault);
	cfDefault.dwEffects = CFE_PROTECTED|CFE_AUTOCOLOR ;
	cfDefault.dwMask = CFM_BOLD | CFM_FACE | CFM_SIZE | CFM_CHARSET | CFM_PROTECTED;
	//int nV = atoi (m_lpzFontSize);

	cfDefault.yHeight = 20*atoi (m_lpzFontSize);
	cfDefault.bCharSet = 0xEE;
	cfDefault.crTextColor = RGB(0,0,0);
	strcpy(cfDefault.szFaceName, _T("Verdana"));

	SetDefaultCharFormat(cfDefault);
}

void CTestEdit::setSelectionCharFormat( )
{
	HideSelection(TRUE, FALSE);

	CHARFORMAT cf;
	GetSelectionCharFormat( cf );
	cf.dwMask = CFM_BOLD | CFM_FACE | CFM_SIZE | CFM_CHARSET | CFM_PROTECTED;
	cf.yHeight=20*atoi (m_lpzFontSize);

	SetSel( 0,-1);
	SetSelectionCharFormat( cf);
	SetSel( 0,0);

	HideSelection(FALSE, FALSE);
}


void CTestEdit::SetSLComment( TCHAR chComment )
{
	m_chComment = chComment;
}

void CTestEdit::SetSLComment(LPCTSTR lpszComment)
{
	m_strComment = lpszComment;
}


void CTestEdit::AddKeywords( LPCTSTR lpszKwd,CString &str, CString &strLower )
{
	str = str + lpszKwd;
	strLower = str;
	strLower.MakeLower();
}

void CTestEdit::SetChangeCase(BOOL bChange)
{
	m_bChangeCase = bChange;
}

void CTestEdit::SetStringQuotes(LPCTSTR lpszStrQ)
{
	m_strStringQuotes += lpszStrQ;
}

void CTestEdit::setColor( SymbolColor &color,COLORREF clr,
												BOOL bBold,
												BOOL bItalic,
												BOOL bUnderline,
												BOOL bStrikeout )
{
	color.clrColor = clr;
	color.bBold = bBold;
	color.bItalic = bItalic;
	color.bUnderline = bUnderline;
	color.bStrikeout = bStrikeout;
}

BEGIN_MESSAGE_MAP(CTestEdit, CRichEditCtrl)
	ON_CONTROL_REFLECT(EN_CHANGE, OnChange)
	ON_WM_GETDLGCODE()
	ON_WM_CHAR()
	ON_NOTIFY_REFLECT(EN_PROTECTED, OnProtected)
	ON_NOTIFY_REFLECT(EN_SELCHANGE, OnSelChange)
	ON_MESSAGE(WM_SETTEXT, OnSetText)
	ON_WM_CONTEXTMENU()
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTestEdit message handlers

UINT CTestEdit::OnGetDlgCode()
{
	UINT uCode = CRichEditCtrl::OnGetDlgCode();

	uCode = DLGC_WANTALLKEYS | DLGC_WANTARROWS | DLGC_WANTCHARS | DLGC_WANTMESSAGE | DLGC_WANTTAB;

	return uCode;
}

void CTestEdit::OnChar(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	if (nChar == '\t' && GetKeyState(VK_CONTROL) >= 0) {
		ReplaceSel("\t");
		return;
	}

	CRichEditCtrl::OnChar(nChar, nRepCnt, nFlags);
}


int CTestEdit::searching( LPCTSTR lpszSymbol,CString &strGroup )
{
	CString strSymbol; strSymbol.Format(" %s ", lpszSymbol);
	strSymbol.MakeLower();

	return strGroup.Find(strSymbol);
}

BOOL CTestEdit::IsStringQuote(TCHAR ch)
{
	return (m_strStringQuotes.Find(ch) >= 0);
}


void CTestEdit::SetFormatRange(int nStart, int nEnd, BOOL bBold,
							   BOOL bItalic,BOOL bUnderline,
							   BOOL bStrikeout,COLORREF clr)
{
	if (nStart >= nEnd)
		return;

	SetSel(nStart, nEnd);

	DWORD dwEffects = 0;
	if( bBold )
	{
		dwEffects |= CFE_BOLD;
	}

	if( bItalic )
	{
		dwEffects |= CFE_ITALIC;
	}

	if( bUnderline )
	{
		dwEffects |= CFE_UNDERLINE;
	}

	if( bStrikeout )
	{
		dwEffects |= CFE_STRIKEOUT;
	}

	CHARFORMAT cfm;
	cfm.cbSize = sizeof(cfm);
	GetSelectionCharFormat(cfm);

	cfm.dwEffects = dwEffects;
	cfm.crTextColor = clr;
	cfm.dwMask = CFM_BOLD|CFM_ITALIC|CFM_UNDERLINE|CFM_STRIKEOUT|CFM_COLOR;

	SetSelectionCharFormat(cfm);
}

void CTestEdit::ChangeCase(int nStart, int nEnd, LPCTSTR lpsz)
{
	ASSERT((nEnd - nStart) == (int)_tcslen(lpsz));

	if(( strcmp( lpsz,"left" )==0 ) ||
	   ( strcmp( lpsz,"LEFT" )==0 ) ||
	   ( strcmp( lpsz,"right" )==0 ) ||
	   ( strcmp( lpsz,"RIGHT" )==0 ) ||
	   ( strcmp( lpsz,"initial" )==0 ) ||
	   ( strcmp( lpsz,"INITIAL" )==0 ) ||
	   ( strcmp( lpsz,"final" )==0 ) ||
	   ( strcmp( lpsz,"FINAL" )==0 ) )
	{
		return;
	}

	if( m_bChangeCase )
	{
		SetSel(nStart, nEnd);
		ReplaceSel(lpsz);
	}
}

void CTestEdit::FormatTextRange(int nStart, int nEnd)
{
	if (nStart >= nEnd)
		return;

	m_bInForcedChange = TRUE;
	BOOL bCommentMarker = FALSE;
	BOOL bFound=FALSE;

	CHARRANGE crOldSel;

	GetSel(crOldSel);
	LockWindowUpdate();
	HideSelection(TRUE, FALSE);

	TCHAR *pBuffer = NULL;
	try {
		SetSel(nStart, nEnd);
		pBuffer = new TCHAR[nEnd - nStart + 1];
		long nLen = GetSelText(pBuffer);

		ASSERT(nLen <= nEnd - nStart);

		pBuffer[nLen] = 0;

		TCHAR *pStart, *pPtr;
		pStart = pPtr = pBuffer;

		TCHAR* pSymbolStart = NULL;
		SymbolColor ic = m_colorCOMments;

		while (*pPtr != 0)
		{
			TCHAR ch = *pPtr;

			// //////////////////
			// Process comment |
			// //////////////////
			if (ch == m_chComment )
			{
				pSymbolStart = pPtr;
				do
				{
					ch = *(++pPtr);
				}	while (ch != 0 && ch != '\r');
				ic = m_colorCOMments;}

			// ////////////////////////////////
			// Process strings with quotes
			// ////////////////////////////////
			else if ( IsStringQuote(ch) )
			{
				pSymbolStart = pPtr;
				TCHAR ch1 = ch;
				do
				{
					ch = *(++pPtr);
				}	while (ch != 0 && ch != ch1 && ch != '\r');

				if (ch == ch1)
				{
					pPtr++;
				}
				m_bOpenQuote = TRUE;
				ic = m_colorIdentifiers;
				m_strLastKeyWord.Empty();
			}

			// ///////////////////////
			// Process numbers
			// ///////////////////////
			else if ( _istdigit(ch) )
			{
				pSymbolStart = pPtr;
				_tcstod(pSymbolStart, &pPtr);
				ic = m_colorNBR;
				m_strLastKeyWord.Empty();
			}

			// //////////////////////////////////////////////////////////
			// Process keywords: OPErators POSitions TYPes TRM NBR ACT
			// //////////////////////////////////////////////////////////
			else if ( _istalpha(ch ) || ch == '_'
									 || ch == '='
									 || ch == '>'
									 || ch == '<'
									 || ch == '-'
									 || ch == '~'
									 || ch == '\\' )

			{

				pSymbolStart = pPtr;
				do {

					ch = *(++pPtr);
				} while (_istalnum(ch) || ch == '_'
									 || ch == '='
									 || ch == '>'
									 || ch == '<'
									 || ch == '~'
									 || ch == '-'
									 || ch == '\\' );


					// ///////////////////
					// logical operators
					// ///////////////////

					*pPtr = 0;
					int nPos = searching( pSymbolStart,m_strOPEratorsLower );
					if (nPos >= 0 && !bFound )
					{
						ChangeCase(nStart + pSymbolStart - pBuffer, nStart + pPtr - pBuffer,
									m_strOPErators.Mid(nPos+1, pPtr - pSymbolStart));
						ic = m_colorOPErators;
						bFound = TRUE;
						m_strLastKeyWord = pSymbolStart;
					}

					// ///////////////////
					// FOR operators
					// ///////////////////

					*pPtr = 0;
					nPos = searching( pSymbolStart,m_strFOROPeratorsLower );
					if (nPos >= 0 && !bFound )
					{
						ChangeCase(nStart + pSymbolStart - pBuffer, nStart + pPtr - pBuffer,
									m_strFOROPerators.Mid(nPos+1, pPtr - pSymbolStart));
						ic = m_colorForOPErators;
						bFound = TRUE;
						m_strLastKeyWord = pSymbolStart;
					}

					// ///////////////////
					// locators
					// ///////////////////

					*pPtr = 0;
					nPos = searching( pSymbolStart,m_strLOCationsLower );
					if (nPos >= 0 && !bFound )
					{
						ChangeCase(nStart + pSymbolStart - pBuffer, nStart + pPtr - pBuffer,
									m_strLOCations.Mid(nPos+1, pPtr - pSymbolStart));
						ic = m_colorLOCations;
						bFound = TRUE;
						m_strLastKeyWord = pSymbolStart;
					}

					// ///////////////////
					// item keywords
					// ///////////////////

					*pPtr = 0;
					nPos = searching( pSymbolStart,m_strKEYWordsLower );
					if (nPos >= 0 && !bFound )
					{
						ChangeCase(nStart + pSymbolStart - pBuffer, nStart + pPtr - pBuffer,
									m_strKEYWords.Mid(nPos+1, pPtr - pSymbolStart));
						ic = m_colorKEYWords;
						bFound = TRUE;
						m_strLastKeyWord = pSymbolStart;
					}

					// ///////////////////
					// connectors
					// ///////////////////

					*pPtr = 0;
					nPos = searching( pSymbolStart,m_strCONNectorsLower );
					if (nPos >= 0 && !bFound )
					{
						ChangeCase(nStart + pSymbolStart - pBuffer, nStart + pPtr - pBuffer,
									m_strCONNectors.Mid(nPos+1, pPtr - pSymbolStart));
						ic = m_colorCONNectors;
						bFound = TRUE;
						m_strLastKeyWord = pSymbolStart;
					}


					// /////////
					// TYPes
					// /////////

					nPos = searching( pSymbolStart,m_strTYPesLower );
					if (nPos >= 0 && !bFound )
					{
						ChangeCase(nStart + pSymbolStart - pBuffer, nStart + pPtr - pBuffer,
										m_strTYPes.Mid(nPos+1, pPtr - pSymbolStart));
						ic = m_colorTYPes;
						bFound = TRUE;
						m_strLastKeyWord = pSymbolStart;
					}


					// /////////
					// OTHER
					// /////////

					if (!bFound )
					{
						if((( m_strLastKeyWord == "is" ) ||
						  ( m_strLastKeyWord == "member" ) ||
						  ( m_strLastKeyWord == "matches" ) ))
						{
							m_strLastKeyWord.Empty();
							ic = m_colorIdentifiers;
						}
						else
						{
							ic = m_colorError;
						}

						bFound = TRUE;
					}


					// does the line begin with the marker \co ?
					if( strspn( pSymbolStart, "\\co" ) == 3 )
					{
						bCommentMarker=TRUE;
					}


				bFound=FALSE;
				*pPtr = ch;
			}
			else
			{
				pPtr++;
			}


			if (pSymbolStart != NULL)
			{
				ASSERT(pSymbolStart < pPtr);
				SetFormatRange(nStart + pStart - pBuffer, nStart + pSymbolStart - pBuffer, FALSE, FALSE, FALSE, FALSE, clrDefaultColor);

				// line begins with the marker \co
				if( bCommentMarker )
				{
					ic = m_colorCOMments;
				}

				SetFormatRange(nStart + pSymbolStart - pBuffer, nStart + pPtr - pBuffer, ic.bBold,ic.bItalic,ic.bUnderline,ic.bStrikeout, ic.clrColor);
				pStart = pPtr;
				pSymbolStart = 0;
			}
			else if (*pPtr == 0)
			{
				SetFormatRange(nStart + pStart - pBuffer, nStart + pPtr - pBuffer, FALSE,FALSE,FALSE,FALSE,clrDefaultColor);
			}
		}

		} // while 1



	catch(...){}

	delete [] pBuffer;

	SetSel(crOldSel);
	HideSelection(FALSE, FALSE);
	UnlockWindowUpdate();

	m_bInForcedChange = FALSE;
}


void CTestEdit::FormatTextLines(int nLineStart, int nLineEnd)
{
	long nStart = LineIndex(LineFromChar(nLineStart));
	long nEnd = LineIndex(LineFromChar(nLineEnd));
	nEnd += LineLength(nLineEnd);

	FormatTextRange(nStart, nEnd);
}


void CTestEdit::FormatAll()
{
	FormatTextRange(0, GetTextLength());
}

LRESULT CTestEdit::OnSetText(WPARAM wParam, LPARAM lParam)
{
	LRESULT res = Default();
	FormatAll();
	return res;
}

void CTestEdit::OnChange()
{
	if (m_bInForcedChange)
		return;


	CHARRANGE crCurSel;
	GetSel(crCurSel);

	if (m_changeType == ctMove && crCurSel.cpMin == crCurSel.cpMax)
	{
		m_changeType = ctPaste;
	}

	switch(m_changeType) {
	case ctReplSel:
	case ctPaste:
		FormatTextLines(m_crOldSel.cpMin, crCurSel.cpMax);
		break;
	case ctDelete:
	case ctBack:
	case ctCut:
		FormatTextLines(crCurSel.cpMin, crCurSel.cpMax);
		break;
	case ctUndo:
		FormatTextLines(crCurSel.cpMin, crCurSel.cpMax);
		break;
	case ctMove:
		FormatTextLines(crCurSel.cpMin, crCurSel.cpMax);
		if (crCurSel.cpMin > m_crOldSel.cpMin) // move after
			FormatTextLines(m_crOldSel.cpMin, m_crOldSel.cpMin);
		else // move before
			FormatTextLines(m_crOldSel.cpMax, m_crOldSel.cpMax);
		break;
	default:
		FormatAll();
		break;
	}

	// undo action does not call OnProtected, so make it default
	m_changeType = ctUndo;
}

void CTestEdit::OnProtected(NMHDR* pNMHDR, LRESULT* pResult)
{
	ENPROTECTED* pEP = (ENPROTECTED*)pNMHDR;


	switch (pEP->msg)
	{
		case WM_KEYDOWN:
			switch (pEP->wParam)
			{
			case VK_DELETE:
				m_changeType = ctDelete;
				break;
			case VK_BACK:
				m_changeType = ctBack;
				break;
			default:
				m_changeType = ctUnknown;
				break;
			}
		break;
	case EM_REPLACESEL:
	case WM_CHAR:
		m_changeType = ctReplSel;
		break;
	case WM_PASTE:
		m_changeType = (m_changeType == ctCut)?ctMove:ctPaste;
		break;
	case WM_CUT:
		m_changeType = ctCut;
		break;
	default:
		m_changeType = ctUnknown;
		break;
	};

	if (pEP->msg != EM_SETCHARFORMAT && m_changeType != ctMove)
		m_crOldSel = pEP->chrg;

	*pResult = FALSE;
}

void CTestEdit::OnSelChange(NMHDR* pNMHDR, LRESULT* pResult)
{
	SELCHANGE* pSC = (SELCHANGE*)pNMHDR;

	*pResult = 0;
}

void CTestEdit::setWordWrap( BOOL bFlag )
{
	// 0 = ON	1 = OFF

	int nFlag = 1;

	if( bFlag )
		nFlag=0;


	SetTargetDevice(NULL,nFlag);
}

void CTestEdit::setBackgroundColor( BOOL bUseSystemColor )
{

	SetBackgroundColor( bUseSystemColor,m_clrBackgoundColor );
}
