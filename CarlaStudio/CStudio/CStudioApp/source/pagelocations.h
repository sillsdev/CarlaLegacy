#if !defined(AFX_CPageLocations_H__CF02E962_98DB_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_CPageLocations_H__CF02E962_98DB_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// CPageLocations.h : header file
//
#include "pathctrl.h"

/////////////////////////////////////////////////////////////////////////////
// CPageLocations dialog

class CPageLocations : public CPropertyPage
{
	DECLARE_DYNAMIC(CPageLocations)

// Construction
public:
	CPageLocations(const CPathDescriptor& pathAnalyzedANA,
							   const CPathDescriptor& pathInterlinear,
							   const CPathDescriptor& pathTransferedANA,
							   const CPathDescriptor& pathSynthesized,
							   const CPathDescriptor& pathDefaultInput);
							 //  BOOL bCopyInterlinearToSrcDir);
	~CPageLocations();

// Dialog Data
	//{{AFX_DATA(CPageLocations)
	enum { IDD = IDD_PageLocations };
	CPathCtrl	m_pathTransferedANA;
	CPathCtrl	m_pathSynthesized;
	CPathCtrl	m_pathAnalyzedANA;
	CPathCtrl	m_pathInterlinear;
	BOOL	m_bCopyInterlinearToSrcDir;
	BOOL	m_bLeaveNonGoalsInTempDir;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CPageLocations)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	// Generated message map functions
	//{{AFX_MSG(CPageLocations)
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CPageLocations_H__CF02E962_98DB_11D2_864F_AC380CC10000__INCLUDED_)
