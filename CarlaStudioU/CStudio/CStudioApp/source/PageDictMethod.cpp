// PageDictMethod.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "PageDictMethod.h"
#include "PageDictAffixes.h"
#include "PageRootUnifiedDict.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPageDictMethod property page

IMPLEMENT_DYNAMIC(CPageDictMethod, CPropertyPage)

CPageDictMethod::CPageDictMethod(BOOL bUnifiedDictMethod,
								 CPropertySheet* pModifyPropSheet,
								 CPageDictAffixes* pPageAffixDicts)
:	CWizPage(CPageDictMethod::IDD),
	m_pAffixPage(pPageAffixDicts),
	m_pModifyPropSheet(pModifyPropSheet) // not necessarily the owner of this!!!
{
//	m_psp.dwFlags &= ~PSP_HASHELP; // no help yet

	//{{AFX_DATA_INIT(CPageDictMethod)
	m_nDictMethod = bUnifiedDictMethod?0:1;
	//}}AFX_DATA_INIT
}

CPageDictMethod::~CPageDictMethod()
{
}

void CPageDictMethod::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageDictMethod)
	DDX_Radio(pDX, IDC_DictMethod, m_nDictMethod);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CPageDictMethod, CPropertyPage)
	//{{AFX_MSG_MAP(CPageDictMethod)
	ON_BN_CLICKED(IDC_DictMethod, OnBtnDictMethod)
	ON_BN_CLICKED(IDC_DictMethod2, OnBtnDictMethod)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageDictMethod message handlers

void CPageDictMethod::OnBtnDictMethod()
{
	int oldMethod = m_nDictMethod;
	UpdateData(TRUE);
	if(oldMethod == m_nDictMethod)
		return; // no change

	manageChange();
}

// The propertysheet should call this after adding all pages, including the affix dict one
// This page itself also calls this.
// It will remove or show it, as appropriate

// Note that since we use m_pModifyPropSheet instead of calling GetOwner(), this
// can operate on a property sheet that it doesn't belong to.  This is used
// outside of wizards where a button bring this up, rather than having to have this
// page be a permanent part of the property sheet, just so the the user can switch
// methods.

// STATIC so that CUnifiedOrRootPage can call without launching dialog

void CPageDictMethod::manageAffixPage(CPropertySheet* pSheet, CPageDictAffixes* pPage, BOOL bUnifiedMethod)
{
	//CPropertySheet* ps = getOwner();
	ASSERTX(pSheet);
	ASSERTX(pSheet->IsKindOf(RUNTIME_CLASS(CPropertySheet)));

	////////////////////////////////////////////////
	// NOW HIDE OR SHOW THE AFFIX PAGE

	int n = 1 + pSheet->GetActiveIndex();
	// find the affix page
/*	if(!pPage)
		while(n<pSheet->GetPageCount())
		{
			CPropertyPage* pp = pSheet->GetPage(n);
			if(pp->IsKindOf(RUNTIME_CLASS(CPageDictAffixes)))
			{
				pPage = (CPageDictAffixes*)pp;
				break;
			}
			++n;
		}
*/
	ASSERT(pPage);

	if(bUnifiedMethod) // unified, remove affix dict page
	{
		if(pSheet->GetPageIndex(pPage)>=0)	// it's in there now
			pSheet->RemovePage(pPage);
	}
	else
	{
		// note: this will always make it the last item in the list
		// we could write something to insert it where we want by
		// removing pages and then reinserting them in order?
		if(pSheet->GetPageIndex(pPage)<0)	// it's not in there now
			pSheet->AddPage(pPage);
	}
}



void CPageDictMethod::manageChange()
{
	if(!m_pModifyPropSheet)
		m_pModifyPropSheet = getOwner();

	//////////////////////////////////////////////////////////////////////////
	// SET THE LABELS ON THE ROOT-OR-UNIFIED PAGE TO REFLECT WHICH IT IS

	int nPage = 0;

	// find the root/unified page
	CPageRootUnifiedDict* pRootPage = NULL;
	while(nPage<m_pModifyPropSheet->GetPageCount())
	{
		CPropertyPage* pp = m_pModifyPropSheet->GetPage(nPage);
		if(pp->IsKindOf(RUNTIME_CLASS(CPageRootUnifiedDict)))
		{
			pRootPage = (CPageRootUnifiedDict*)pp;
			break;
		}
		++nPage;
	}
	ASSERT(pRootPage);
	pRootPage->setLabelMode(m_pModifyPropSheet, m_nDictMethod==0);


	manageAffixPage(m_pModifyPropSheet, m_pAffixPage, m_nDictMethod==kUnified);
}
