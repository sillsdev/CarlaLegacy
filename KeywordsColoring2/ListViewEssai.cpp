// ListViewEssai.cpp : implementation file
//

#include "stdafx.h"

#include "KeywordsColoring2.h"
#include "DlgEditText.h"
#include "ListViewEssai.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CListViewEssai

IMPLEMENT_DYNCREATE(CListViewEssai, CListView)

CListViewEssai::CListViewEssai()
{
}

CListViewEssai::~CListViewEssai()
{
}


BEGIN_MESSAGE_MAP(CListViewEssai, CListView)
	//{{AFX_MSG_MAP(CListViewEssai)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	ON_NOTIFY_REFLECT(NM_DBLCLK, OnCLICK)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CListViewEssai drawing

void CListViewEssai::OnDraw(CDC* pDC)
{
	CDocument* pDoc = GetDocument();
	// TODO: add draw code here
}

/////////////////////////////////////////////////////////////////////////////
// CListViewEssai diagnostics

#ifdef _DEBUG
void CListViewEssai::AssertValid() const
{
	CListView::AssertValid();
}

void CListViewEssai::Dump(CDumpContext& dc) const
{
	CListView::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CListViewEssai message handlers

void CListViewEssai::OnInitialUpdate()
{
	//CListView::OnInitialUpdate();

	/*
	DWORD dw = LVS_EX_CHECKBOXES|
				LVS_EX_FLATSB|
				LVS_EX_ONECLICKACTIVATE|
				LVS_EX_GRIDLINES|
				LVS_EX_TRACKSELECT;



	GetListCtrl().SetExtendedStyle( dw );
		*/

	// create columns
	GetListCtrl().InsertColumn( 0, "Type", LVCFMT_LEFT, 150, 0 );
	GetListCtrl().InsertColumn( 1, "Label", LVCFMT_LEFT, 200, 1 );
	GetListCtrl().InsertColumn( 2, "Comment", LVCFMT_LEFT, 200, 2 );
	GetListCtrl().InsertColumn( 3, "", LVCFMT_LEFT, 0, 3 );



	GetListCtrl().InsertItem( 0, "AMPLE Prefix Tests" );
		GetListCtrl().SetItemText( 0, 1, "NO_REPEATED_PREFIX_PT" );
		GetListCtrl().SetItemText( 0, 2, "From Cebaara Project, RCI" );
		GetListCtrl().SetItemText( 0, 3, "" );
			//NOT (current morphname is left morphname)\n\\co commentaire\n| commentaire

	GetListCtrl().InsertItem( 1, "AMPLE Infix Tests" );
		GetListCtrl().SetItemText( 1, 1, "NO_REPEATED_PREFIX_PT" );
		GetListCtrl().SetItemText( 1, 2, "Generic" );
		GetListCtrl().SetItemText( 1, 3, "left fromcategory is current tocategory" );



	GetListCtrl().InsertItem( 2, "AMPLE Root Tests" );
		GetListCtrl().SetItemText( 2, 1, "VOICED_ALLOMORPH_RT" );
		GetListCtrl().SetItemText( 2, 2, "From Cebaara Project, RCI" );
		GetListCtrl().SetItemText( 2, 3, "IF (current property is voiced)\nTHEN\n\t((left property is voices-following-C)\n\tOR (left morphname is HYPHEN-Q))" );



	GetListCtrl().InsertItem( 3, "AMPLE Suffix Tests" );
		GetListCtrl().SetItemText( 3, 1, "G2S_GLOTTAL_ST" );
		GetListCtrl().SetItemText( 3, 2, "From Cebaara RCI" );
		GetListCtrl().SetItemText( 3, 3, "IF (current morphname is G2S)\nTHEN\n\t((current allomorph matches member GLOTTAL)\nIFF (left property is underlying-long))" );

	GetListCtrl().InsertItem( 4, "AMPLE Final Tests" );
		GetListCtrl().SetItemText( 4, 1, "IMPERFECTIVE_RI_HIGH_FT" );
		GetListCtrl().SetItemText( 4, 2, "From Cebaara RCI" );
		GetListCtrl().SetItemText( 4, 3, "IF (current property is impf-ri)\nTHEN\n\t((right morphname is IMPFV)\n\t\tAND (right allomorph is \"ri\"))" );



		GetListCtrl().InsertItem( 5, "STAMP Synthesis Tests" );
		GetListCtrl().SetItemText( 5, 1, "" );
		GetListCtrl().SetItemText( 5, 2, "" );


}

BOOL CListViewEssai::PreCreateWindow(CREATESTRUCT& cs)
{
	cs.style &= ~LVS_TYPEMASK;
	cs.style |= LVS_REPORT|
				//LVS_NOSORTHEADER|
				LVS_SHOWSELALWAYS|
				LVS_SINGLESEL;
				//LVS_OWNERDRAWFIXED;

	return CListView::PreCreateWindow(cs);


}
void CListViewEssai::OnCLICK(NMHDR* pNMHDR, LRESULT* pResult)
{
	NM_LISTVIEW* pNMListView = (NM_LISTVIEW*)pNMHDR;

	CDlgEditText dlg (this);



	dlg.m_sLabel = GetListCtrl().GetItemText( pNMListView->iItem, 1 );
	dlg.m_sDescription = GetListCtrl().GetItemText(  pNMListView->iItem, 2 );
	dlg.m_sContents = GetListCtrl().GetItemText(  pNMListView->iItem, 3 );




	if( dlg.DoModal()==IDOK )
	{
	}





	*pResult = 0;
}