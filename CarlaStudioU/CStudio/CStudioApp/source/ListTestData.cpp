// ListTestData.cpp: implementation of the CListEntryTestData class.
//
// 1.7a1 03-Dec-1999 hab created
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#ifndef hab17a1
#include "..\resource.h"
#include "ListTestData.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif


class CDlgEditTestData : public CDialog
{
// Construction
public:
	CDlgEditTestData(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditTestData)
	enum { IDD = IDD_EditTestData };
	CString	m_sTestData;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditTestData)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditTestData)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
// CDlgEditTestData dialog


CDlgEditTestData::CDlgEditTestData(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditTestData::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEditTestData)
	m_sTestData = _T("");
	//}}AFX_DATA_INIT
}


void CDlgEditTestData::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditTestData)
	DDX_Text(pDX, IDC_STestData, m_sTestData);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEditTestData, CDialog)
	//{{AFX_MSG_MAP(CDlgEditTestData)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditTestData message handlers



IMPLEMENT_DYNAMIC(CListEntryTestData, CWListEntry);

BOOL CListEntryTestData::doEditDialog(CListCtrl &clc, BOOL bIsNew)
{
	CDlgEditTestData dlg;
	dlg.m_sTestData=m_sTestData;
	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	m_sTestData = dlg.m_sTestData;

	return TRUE;
}

CWListRowItem* CListEntryTestData::getCopy()
{
	CListEntryTestData* pNew = new CListEntryTestData(this);
	ASSERTX(pNew);
	return pNew;
}

CString CListEntryTestData::getText(int iColumn)
{
	if(iColumn == 0)
		return m_sTestData;
	//if(iColumn == m_pOwningList->m_nTestDataColumn)
	///	return m_sTestData;
	else
		return _T("");
}

void CListEntryTestData::write(ostream &fout, char cCommentChar) const
{
	USES_CONVERSION_U8;
	fout << "\\td " <<  T2CU8(m_sTestData) << '\n';
}

int CListEntryTestData::getIconIndex() const
{
	return 14;
}

//jdh 11/9/99 made this actually work
void CTestDataCollector::defaultDisgorge(CWList& list, LPCTSTR szListName, LPCTSTR szFileName)
{
	if(m_vecTestDatas.GetSize()==0)
		return;

/*	jdh 11/9/99 removed this because this message would come up everytime they openned
	it, which seems slightly worse that not mentioning it the first (an only) interesting time


	CString s;
	s.Format("While reading in the file %s, it was not clear what these comments apply to.\r\nThey will be put in the %s list.\r\n", szFileName, szListName);
	LOG(s);
	for(int i=0;i<m_vecTestDatas.GetSize(); i++)
		LOG3("---> ", m_vecTestDatas[i], "\r\n");
	LOG("\r\n");

*/
	disgorge(list); // jdh 11/9/99 added
}

void CCommentOrTestDataCollector::defaultDisgorge(CWList& list)
{
	if(m_vecInfos.GetSize()==0)
		return;
	disgorge(list);
}
#endif //hab17a1
