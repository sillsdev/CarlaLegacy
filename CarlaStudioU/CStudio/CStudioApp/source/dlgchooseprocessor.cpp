// DlgChooseProcessor.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "CWProcess.h"

#include "DlgChooseProcessor.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

extern CCarlaStudioApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CDlgChooseProcessor dialog


CDlgChooseProcessor::CDlgChooseProcessor(const CProcessSequence* pSeq)
	: m_pSequence(pSeq), m_pChosenTemplate(0), CDialog(CDlgChooseProcessor::IDD, NULL)
{
	//{{AFX_DATA_INIT(CDlgChooseProcessor)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CDlgChooseProcessor::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgChooseProcessor)
	DDX_Control(pDX, IDC_LIST, m_listctrl);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgChooseProcessor, CDialog)
	//{{AFX_MSG_MAP(CDlgChooseProcessor)
	ON_NOTIFY(LVN_GETDISPINFO, IDC_LIST, OnGetdispinfoList)
	ON_NOTIFY(NM_DBLCLK, IDC_LIST, OnDblclkList)
	ON_NOTIFY(LVN_ITEMCHANGING, IDC_LIST, OnItemchangingList)
	//}}AFX_MSG_MAP


END_MESSAGE_MAP()

CProcessTemplate* CDlgChooseProcessor::getFirstSelectedItem()
{
	if(!m_listctrl.GetSelectedCount())
		return NULL;	// none selected

	for(int i=0; i< m_listctrl.GetItemCount(); i++)
	{
		if(m_listctrl.GetItemState(i, LVIS_SELECTED) == LVIS_SELECTED)
		{
			return (CProcessTemplate*)m_listctrl.GetItemData(i);
		}
	}
	return NULL;
}
/////////////////////////////////////////////////////////////////////////////
// CDlgChooseProcessor message handlers

BOOL CDlgChooseProcessor::OnInitDialog()
{
	CDialog::OnInitDialog();

	LV_COLUMN lv;
	lv.mask = LVCF_FMT | LVCF_TEXT | LVCF_WIDTH;
	lv.fmt = LVCFMT_LEFT;
	lv.cx = 110;
	lv.pszText = _T("Processor");
	ASSERTX( -1 != m_listctrl.InsertColumn(0, &lv));

	lv.cx = 90;
	lv.pszText = _T("Input");
	ASSERTX( -1 != m_listctrl.InsertColumn(1, &lv));

	lv.pszText = _T("Output");
	ASSERTX( -1 != m_listctrl.InsertColumn(2, &lv));

	m_iconList.Create(GetSystemMetrics(SM_CXSMICON),
			GetSystemMetrics(SM_CYSMICON), TRUE, 1, 2); // this last param is a mystery

	HICON hiconItem;        // icon for processors
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_Process));
	m_iconList.Add(hiconItem);
	DeleteObject(hiconItem);
	m_listctrl.SetImageList( &m_iconList, LVSIL_SMALL);

	// make the "not availible" overlay icon
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_NOT));
	m_iconList.Add(hiconItem);
	DeleteObject(hiconItem);
	m_iconList.SetOverlayImage( 1, // image number 2(zero-based) in the list
								1);	// is overlay image #1 (one-based).  Got that?

	// get the list of processors that the application found
	CTypedPtrArray<CPtrArray, CProcessTemplate*>& rProcessTemplates=
			theApp.getProcessTemplates();


	//	m_processListCtrl.LockWindowUpdate();	//don't want to show the remove

	for (int i = 0; i < rProcessTemplates.GetSize(); i++)
	{
		rProcessTemplates[i]->addItemToListControl(m_listctrl, m_pSequence);
	}


	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}

void CDlgChooseProcessor::OnGetdispinfoList(NMHDR* pNMHDR, LRESULT* pResult)
{
	LV_DISPINFO* pnmv = (LV_DISPINFO*)pNMHDR;
	// Provide the item or subitem's text, if requested.
	if (pnmv->item.mask & LVIF_TEXT)
	{
		CProcessTemplate* pProc = (CProcessTemplate *) (pnmv->item.lParam);
		lstrcpy(pnmv->item.pszText, pProc->getListCtrlText(pnmv->item.iSubItem));
	}

	*pResult = 0; //	THIS WAS PUT HERE BY THE WIZARD
}


void CDlgChooseProcessor::OnOK()
{
	// can be null
	m_pChosenTemplate = getFirstSelectedItem();

	CDialog::OnOK();
}

void CDlgChooseProcessor::OnDblclkList(NMHDR* pNMHDR, LRESULT* pResult)
{
	//m_pChosenTemplate = getFirstSelectedItem();

	//*pResult = 0;

	OnOK();
}

void CDlgChooseProcessor::OnItemchangingList(NMHDR* pNMHDR, LRESULT* pResult)
{
	NM_LISTVIEW* pNMListView = (NM_LISTVIEW*)pNMHDR;
	CProcessTemplate* pPT = (CProcessTemplate*) m_listctrl.GetItemData(pNMListView->iItem);
	// this fails when the template is from a dll.  Maybe
	// it can't tell they are the same.
	// ASSERTX(pPT->IsKindOf(RUNTIME_CLASS(CProcessTemplate)));
	*pResult = !pPT->getCanAddToSeq(m_pSequence);
}
