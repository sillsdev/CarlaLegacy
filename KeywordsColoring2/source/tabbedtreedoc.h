#if !defined(AFX_TABBEDTREEDOC_H__D5687881_1CCE_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_TABBEDTREEDOC_H__D5687881_1CCE_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// TabbedTreeDoc.h : header file
//
#include "CWInterface.h"


class CWTopicTab;
class CWTopic;
class CWCarlaMenuInterface;
class CWFunctionalInterface;
class CWInterface;
class CTabbedTreeChild;

/////////////////////////////////////////////////////////////////////////////
// CTabbedTreeDoc document

class CTabbedTreeDoc : public CDocument
{
protected:
	CTabbedTreeDoc();           // protected constructor used by dynamic creation
	DECLARE_DYNCREATE(CTabbedTreeDoc)
	CWInterface* m_pCurrentInterface;
	//CTabbedTreeChildFrame* m_pSettingsFrame;

// Attributes
public:
	CTabbedTreeChild* getFrame();
	void TopicChanged(CWTopic* pTopic);
	CWInterface* GetCurrentInterface();
	CWTopicTab* GetCurrentTopicTab();
	bool m_bSettingUpPhase;
	void OnDataModified();

// Operations
public:
//	void setSettingsFrame(CProjChildFrame* pF);
//	void setModified(BOOL bModified);

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTabbedTreeDoc)
	public:
	protected:
	virtual BOOL OnNewDocument();
	//}}AFX_VIRTUAL

// Implementation
//	static void outputWindowPlacement(ostream& fout, CWnd* pWnd);

public:
	virtual void SetModifiedFlag(BOOL bModified=TRUE);
	virtual ~CTabbedTreeDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
protected:
	//{{AFX_MSG(CTabbedTreeDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TABBEDTREEDOC_H__D5687881_1CCE_11D2_A09E_E12649467D2F__INCLUDED_)
