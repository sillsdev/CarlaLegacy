// ListComment.cpp: implementation of the CListEntryComment class.
//
// JDH 5/25/99 created
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "..\resource.h"
#include "ListComment.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif


class CDlgEditComment : public CDialog
{
// Construction
public:
	CDlgEditComment(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditComment)
	enum { IDD = IDD_EditComment };
	CString	m_sComment;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditComment)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditComment)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
// CDlgEditComment dialog


CDlgEditComment::CDlgEditComment(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditComment::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEditComment)
	m_sComment = _T("");
	//}}AFX_DATA_INIT
}


void CDlgEditComment::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditComment)
	DDX_Text(pDX, IDC_SComment, m_sComment);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEditComment, CDialog)
	//{{AFX_MSG_MAP(CDlgEditComment)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditComment message handlers



IMPLEMENT_DYNAMIC(CListEntryComment, CWListEntry);

BOOL CListEntryComment::doEditDialog(CListCtrl &clc, BOOL bIsNew)
{
	CDlgEditComment dlg;
	dlg.m_sComment=m_sComment;
	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	m_sComment = dlg.m_sComment;

	return TRUE;
}

CWListRowItem* CListEntryComment::getCopy()
{
	CListEntryComment* pNew = new CListEntryComment(this);
	ASSERTX(pNew);
	return pNew;
}

CString CListEntryComment::getText(int iColumn)
{
	if(iColumn == 0)
		return m_sComment;
	//if(iColumn == m_pOwningList->m_nCommentColumn)
	///	return m_sComment;
	else
		return "";
}

void CListEntryComment::write(ostream &fout, char cCommentChar) const
{
	fout << "\\co " <<  m_sComment << '\n';
}

int CListEntryComment::getIconIndex() const
{
	return 13;
}

//jdh 11/9/99 made this actually work
void CCommentCollector::defaultDisgorge(CWList& list, LPCTSTR szListName, LPCTSTR szFileName)
{
	if(m_vecComments.GetSize()==0)
		return;

/*	jdh 11/9/99 removed this because this message would come up everytime they openned
	it, which seems slightly worse that not mentioning it the first (an only) interesting time


	CString s;
	s.Format("While reading in the file %s, it was not clear what these comments apply to.\r\nThey will be put in the %s list.\r\n", szFileName, szListName);
	LOG(s);
	for(int i=0;i<m_vecComments.GetSize(); i++)
		LOG3("---> ", m_vecComments[i], "\r\n");
	LOG("\r\n");

*/
	disgorge(list); // jdh 11/9/99 added
}