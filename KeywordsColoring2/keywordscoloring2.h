// keywordscoloring2.h : main header file for the KEYWORDSCOLORING2 application
//

#if !defined(AFX_KEYWORDSCOLORING2_H__2045AE2F_A9D1_43B7_9464_D11603102FEB__INCLUDED_)
#define AFX_KEYWORDSCOLORING2_H__2045AE2F_A9D1_43B7_9464_D11603102FEB__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CKeywordscoloring2App:
// See keywordscoloring2.cpp for the implementation of this class
//

class CKeywordscoloring2App : public CWinApp
{
public:
	CKeywordscoloring2App();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CKeywordscoloring2App)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CKeywordscoloring2App)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_KEYWORDSCOLORING2_H__2045AE2F_A9D1_43B7_9464_D11603102FEB__INCLUDED_)
