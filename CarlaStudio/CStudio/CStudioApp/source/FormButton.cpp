// FormButton.cpp : implementation file
//

#include "stdafx.h"
//#include "..\cstudio.h"
#include "FormButton.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CFormButton

CFormButton::CFormButton()
{
}

CFormButton::~CFormButton()
{
}


BEGIN_MESSAGE_MAP(CFormButton, CButton)
	//{{AFX_MSG_MAP(CFormButton)
	ON_CONTROL_REFLECT(BN_CLICKED, OnClicked)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CFormButton message handlers

void CFormButton::OnClicked()
{
	CView* pv = (CView*)GetParent();
	pv->GetDocument()->SetModifiedFlag();
}
