// DlgKeywordsList.cpp : implementation file
//

#include "stdafx.h"
#include "keywordscoloring2.h"
#include "DlgKeywordsList.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


/////////////////////////////////////////////////////////////////////////////
// CDlgKeywordsList dialog


CDlgKeywordsList::CDlgKeywordsList(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgKeywordsList::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgKeywordsList)
	//}}AFX_DATA_INIT
}


void CDlgKeywordsList::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgKeywordsList)
	DDX_Control(pDX, IDC_RICHEDIT1, m_text);
	DDX_Control(pDX, IDC_LIST1, m_list);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgKeywordsList, CDialog)
	//{{AFX_MSG_MAP(CDlgKeywordsList)
	ON_NOTIFY(NM_DBLCLK, IDC_LIST1, OnDblclkList)
	ON_NOTIFY(LVN_ITEMCHANGED, IDC_LIST1, OnItemchangedList)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgKeywordsList message handlers

BOOL CDlgKeywordsList::OnInitDialog()
{
	CDialog::OnInitDialog();


	// add columns
	m_list.InsertColumn(0,"Keywords Categories",LVCFMT_LEFT,150,0);
	m_list.InsertColumn(1,"Comments",LVCFMT_LEFT,280,1);


	// style
	DWORD dwStyle = LVS_EX_FLATSB|LVS_EX_GRIDLINES|LVS_EX_TRACKSELECT|LVS_EX_UNDERLINEHOT|LVS_EX_FULLROWSELECT;
	m_list.SetExtendedStyle(dwStyle);


	// add keywords
	CStringArray *pStrArray = new CStringArray;
	pStrArray->SetSize( 0,10 );

	pStrArray->Add("LOGICAL OPERATORS\n0\n ");
	pStrArray->Add("   IF\n1\nWhen IF is false, the test succeeds and the expression following the THEN is not evaluated. When the expression following the IF is true, the test succeeds only when the expression following the THEN is also true.");
	pStrArray->Add("   THEN\n1\nWhen IF is false, the test succeeds and the expression following the THEN is not evaluated. When the expression following the IF is true, the test succeeds only when the expression following the THEN is also true.");
	pStrArray->Add("   OR\n1\nWhen the program evaluates a test involving the OR operator, if the first one is true, it does not actually check the second expression. This is because the result is always true if the first expression involving an OR operator is true.");
	pStrArray->Add("   AND\n1\nWhen the program evaluates a test involving the AND operator, if the first one is false, it does not actually check the second expression. This is because, il the first expression involving an AND operator is false, the result is always false. ");
	pStrArray->Add("   XOR\n1\nThe eXclusive or (XOR) operates like the colloquial use of or in English conversation. Only ONE of the alternatives can happen, not both.");
	pStrArray->Add("   IFF\n1\nThe \'if and only if\' (IFF) operation is logically the negation of the \'eXclusive or\' (XOR).");
	pStrArray->Add("   NOT\n1\nA test's value may be negated by placing the keyword NOT at the beginning of the test.  ");
	pStrArray->Add(" \n0\n ");


	pStrArray->Add("COMPARISON OPERATORS\n0\n");
	pStrArray->Add("   <\n1\nless than ");
	pStrArray->Add("   <=\n1\nless than or equal to ");
	pStrArray->Add("   =\n1\nequals ");
	pStrArray->Add("   >=\n1\ngreater than or equal to ");
	pStrArray->Add("   >\n1\ngreater than ");
	pStrArray->Add("   ~=\n1\nnot equals ");
	pStrArray->Add(" \n0\n ");

	pStrArray->Add("MORPHEMES POSITIONS\n0\n");
	pStrArray->Add("   current\n1\nAs the analysis progresses, each morpheme found becomes in turn the \'current\' morpheme.");
	pStrArray->Add("   left\n1\nThe morpheme immediately preceding the \'current\' one is referred to as the \'left\' morpheme. ");
	pStrArray->Add("   right\n1\nthe morpheme immediately following the \'current\' one is referred to as the \'right\' morpheme. ");
	pStrArray->Add("   INITIAL\n1\nThe first morpheme in the word is called the \'INITIAL\' morpheme ");
	pStrArray->Add("   FINAL\n1\nThe last morpheme in the word is called the \'FINAL\' morpheme. ");
	pStrArray->Add(" \n0\n ");

	pStrArray->Add("SEARCHING FOR DESIRED MORPHEMES\n0\n");
	pStrArray->Add("   FOR_SOME_LEFT\n1\nAllows to search if one preceding morpheme meets some condition. This operator quits after finding the first morpheme which successfully passes the stated condition.");
	pStrArray->Add("   FOR_SOME_RIGHT\n1\nAllows to search if one following morpheme meets some condition. This operator quits after finding the first morpheme which successfully passes the stated condition.");
	pStrArray->Add(" \n0\n ");

	pStrArray->Add("TESTING ALL MORPHEMES\n0\n");
	pStrArray->Add("   FOR_ALL_LEFT\n1\nAllows to impose a condition on ALL preceding morphemes. This expression is applied to every morpheme preceding the \'current\' morpheme. The test fails unless every morphemes satisfies the expressed condition.");
	pStrArray->Add("   FOR_ALL_RIGHT\n1\nAllows to impose a condition on ALL following morphemes. This expression is applied to every morpheme preceding the \'current\' morpheme. The test fails unless every morphemes satisfies the expressed condition.");
	pStrArray->Add("   LEFT\n1\nThis keyword indicates the morpheme currently being tested by the \'FOR_ALL_LEFT\' expresion. Don't confuse with the keyword \'left\', that refers to the morpheme preceding the \'current\' one ! ");
	pStrArray->Add("   RIGHT\n1\nThis keyword indicates the morpheme currently being tested by the \'FOR_ALL_RIGHT\' expresion. Don't confuse with the keyword \'right\', that refers to the morpheme following the \'current\' one ! ");
	pStrArray->Add(" \n0\n ");

	pStrArray->Add("MORPHEMES TYPES\n0\n");
	pStrArray->Add("   prefix\n1\nThe type of a morpheme may be indicated as \'prefix\', \'infix\', \'root\', or \'suffix\' (based on the dictionary). ");
	pStrArray->Add("   infix\n1\nThe type of a morpheme may be indicated as \'prefix\', \'infix\', \'root\', or \'suffix\' (based on the dictionary).  ");
	pStrArray->Add("   root\n1\nThe type of a morpheme may be indicated as \'prefix\', \'infix\', \'root\', or \'suffix\' (based on the dictionary).  ");
	pStrArray->Add("   suffix\n1\nThe type of a morpheme may be indicated as \'prefix\', \'infix\', \'root\', or \'suffix\' (based on the dictionary).  ");
	pStrArray->Add("   initial\n1\nThe type of a morpheme may be indicated as \'initial\' or \'final\' (based on position at the beginning or end of a word. ");
	pStrArray->Add("   final\n1\nThe type of a morpheme may be indicated as \'initial\' or \'final\' (based on position at the beginning or end of a word.  ");
	pStrArray->Add(" \n0\n ");

	pStrArray->Add("CATEGORIES\n0\n");
	pStrArray->Add("   tocategory\n1\nIf only a subset of the categories may begin/end a word, these categories should be put into a class, and a test written to impose that the to category of the initial/final morpheme must be a member of that class.");
	pStrArray->Add("   fromcategory\n1\nIf only a subset of the categories may begin/end a word, these categories should be put into a class, and a test written to impose that the to category of the initial/final morpheme must be a member of that class.");
	pStrArray->Add(" \n0\n ");

	pStrArray->Add("ADJACENT WORDS\n0\n");
	pStrArray->Add("   last\n1\nrefers to the surface string of the previous word.");
	pStrArray->Add("   next\n1\nrefers to the surface string of the next word.");
	pStrArray->Add("   word\n1\nused with \'last\' and \'next\'. Ex: last word is member UMBLE.");
	pStrArray->Add(" \n0\n ");

	pStrArray->Add("OTHERS KEYWORDS\n\n");
	pStrArray->Add("   allomorph\n1\nThe allomorph string of a morpheme can be tested. Ex: current allmorph is \"glyph\". ");
	pStrArray->Add("   is\n1\nEx: [<category> is <pos>] [<pos> <category> is <identifier>] [<pos> <category> is member <identifier>] [<pos> property is <identifier>] []");
	pStrArray->Add("   matches\n1\n ");
	pStrArray->Add("   member\n1\n ");
	pStrArray->Add("   morphname\n1\n ");
	pStrArray->Add("   orderclass\n1\n ");
	pStrArray->Add("   property\n1\n ");
	pStrArray->Add("   string\n1\n ");
	pStrArray->Add("   type\n1\n ");


	LVITEM lvi;
	lvi.mask=LVIF_TEXT|LVIF_IMAGE|LVIF_PARAM|LVIF_INDENT;

	for( int i=0; i<pStrArray->GetSize();i++)
	{

		int nCount=0,nV=0;
		CString s; int n=0;
		for ( ;; )
		{
			s = splitString (pStrArray->GetAt(i), n, '\n');

			switch(nCount)
			{
			case 0:
				lvi.iItem = i;
				lvi.iSubItem=0;
				lvi.pszText=(LPTSTR)(LPCTSTR)s;
				m_list.InsertItem(&lvi);
				break;
			case 1:
				nV = atoi(s);
				m_list.SetItemData(i,nV);
				break;

			case 2:
				m_list.SetItemText(i,1,s);
				break;
			}



			nCount++;
			if( s.IsEmpty() ) break;
		}

	}

	delete pStrArray;


	// richeditctrl

	// word wrap on
	m_text.SetTargetDevice(NULL,0);

	// background Color
	m_text.SetBackgroundColor(FALSE,RGB(255,255,204));

	// font
	CHARFORMAT cf;
	cf.cbSize = sizeof (CHARFORMAT);
	cf.dwMask = CFM_COLOR|CFM_FACE|CFM_SIZE|CFM_BOLD;
	cf.dwEffects = 0;
	cf.yHeight = 8*20;
	cf.crTextColor = RGB(255,0,128);
	::lstrcpy (cf.szFaceName, "Verdana" );
	m_text.SetDefaultCharFormat( cf );



	m_list.SetFocus();

	return FALSE;
}


CString CDlgKeywordsList::splitString (CString sS, int& nId, TCHAR cSep)
{
	CString sResult( "" );

	if( nId < sS.GetLength( ) )
	{
		while( sS.GetAt( nId ) == cSep )
		{
			if( nId+1 < sS.GetLength( ) )
				nId++;
			else break;
		}
	}

	if( nId >= sS.GetLength() ) return sResult;

	TCHAR c;
	for( nId; nId<sS.GetLength(); nId++ )
	{
		c = sS.GetAt( nId );

		if( sS.GetAt( nId ) != cSep )
			sResult+=sS.GetAt( nId );
		else break;
	}

	nId++;
	return sResult;
}


void CDlgKeywordsList::OnDblclkList(NMHDR* pNMHDR, LRESULT* pResult)
{
	NM_LISTVIEW* pNMListView = (NM_LISTVIEW*)pNMHDR;

	if( pNMListView->iItem != -1 )
	{
		DWORD dw = m_list.GetItemData( pNMListView->iItem );



	}




	*pResult = 0;
}

void CDlgKeywordsList::OnItemchangedList(NMHDR* pNMHDR, LRESULT* pResult)
{
	NM_LISTVIEW* pNMListView = (NM_LISTVIEW*)pNMHDR;

	m_text.SetWindowText("");

	if(( pNMListView->iItem != -1 ) && ( m_list.GetItemData( pNMListView->iItem )==1 ))
	{
		CString str = "[";
		str += m_list.GetItemText(pNMListView->iItem,0);
		str += "]";
		str.Remove(32);
		str += " ";
		str += m_list.GetItemText(pNMListView->iItem,1);

		m_text.SetWindowText(str);
	}

	*pResult = 0;
}
