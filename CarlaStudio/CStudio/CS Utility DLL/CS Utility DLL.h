// CS Utility DLL.h : main header file for the CS UTILITY DLL DLL
//

#if !defined(AFX_CSUTILITYDLL_H__1078A396_D7C0_11D2_8651_8C750CC10000__INCLUDED_)
#define AFX_CSUTILITYDLL_H__1078A396_D7C0_11D2_8651_8C750CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CCSUtilityDLLApp
// See CS Utility DLL.cpp for the implementation of this class
//

class CCSUtilityDLLApp : public CWinApp
{
public:
	CCSUtilityDLLApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCSUtilityDLLApp)
	//}}AFX_VIRTUAL

	//{{AFX_MSG(CCSUtilityDLLApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CSUTILITYDLL_H__1078A396_D7C0_11D2_8651_8C750CC10000__INCLUDED_)
