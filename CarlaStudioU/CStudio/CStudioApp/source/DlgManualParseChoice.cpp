// DlgManualParseChoice.cpp : implementation file
//
// jdh 21June2000 made double-click work

#include "stdafx.h"
#include "DlgManualParseChoice.h"
#include "AmpleResult.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgManualParseChoice dialog

IMPLEMENT_DYNCREATE(CDlgManualParseChoice, CDialog)

CDlgManualParseChoice::CDlgManualParseChoice()
	: CDialog(CDlgManualParseChoice::IDD, NULL),
	  m_iChoice(0),
	  m_pAlloResult(0),
	  m_AlloList(NULL),
	  m_pList(NULL)
{
	//{{AFX_DATA_INIT(CDlgManualParseChoice)
	//}}AFX_DATA_INIT
}
CDlgManualParseChoice::CDlgManualParseChoice(const CTextDisplayInfo* pTDI,
						 CWnd* pParent /*=NULL*/)
	: CDialog(CDlgManualParseChoice::IDD, pParent),
	  m_iChoice(0),
	  m_pAlloResult(0),
	  m_AlloList(pTDI)
{
  m_pList = &m_AlloList;
}

void CDlgManualParseChoice::DoDataExchange(CDataExchange* pDX)
{
  CDialog::DoDataExchange(pDX);
  //{{AFX_DATA_MAP(CDlgManualParseChoice)
	DDX_Control(pDX, IDC_LISTManualParse, m_ListCtrl);
	//}}AFX_DATA_MAP

  if(!pDX->m_bSaveAndValidate) // loading
	{
	  //      fillListControl(); // duplicates what's done in OnInitDialog
	}
  else				// saving
	{
	  m_iChoice = m_ListCtrl.GetSelectionMark();
	}
}


BEGIN_MESSAGE_MAP(CDlgManualParseChoice, CDialog)
	//{{AFX_MSG_MAP(CDlgManualParseChoice)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgManualParseChoice message handlers

BOOL CDlgManualParseChoice::OnInitDialog()
{
	CDialog::OnInitDialog();

	DWORD dExStyle = m_ListCtrl.GetExtendedStyle();
	dExStyle |= LVS_EX_FULLROWSELECT;
	m_ListCtrl.SetExtendedStyle(dExStyle);
	m_ListCtrl.m_dwColumnEditBitfield = m_pList->m_dwEditableColumns;
	m_AlloList.insertColumns(m_ListCtrl);
	m_AlloList.restoreHeaderParams(m_ListCtrl);
	fillListControl();
	m_AlloList.populateListCtrl(m_ListCtrl);

	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}

void CDlgManualParseChoice::fillListControl(void)
{
  m_ListCtrl.DeleteAllItems();
  CAllo *pAllo = NULL;
  if (m_pAlloResult)
	{
	  for(int i=0; i< m_pAlloResult->getSizeOfResults(); i++)
	{
	  pAllo = (CAllo *)m_pAlloResult->getResult(i);
	  if (pAllo)
		{
		  CWAllomorphSelection *pAS =
		new CWAllomorphSelection(pAllo->m_sShape,
					 pAllo->m_sMorphName,
					 pAllo->m_sType,
					 pAllo->m_sInfixContext);
		  m_AlloList.addItem(pAS);
		}
	}
	}
}


	// jdh 21June2000 called by CWListCtrl when list is double-clicked
void CDlgManualParseChoice::OnOK()
{
	// TODO: Add extra validation here

	CDialog::OnOK();
}
