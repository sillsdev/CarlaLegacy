// keywordscoloring2Doc.h : interface of the CKeywordscoloring2Doc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_KEYWORDSCOLORING2DOC_H__F82D9FC8_6073_4FC4_B0A4_5B7F22A6D8AB__INCLUDED_)
#define AFX_KEYWORDSCOLORING2DOC_H__F82D9FC8_6073_4FC4_B0A4_5B7F22A6D8AB__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CKeywordscoloring2Doc : public CDocument
{
protected: // create from serialization only
	CKeywordscoloring2Doc();
	DECLARE_DYNCREATE(CKeywordscoloring2Doc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CKeywordscoloring2Doc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CKeywordscoloring2Doc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CKeywordscoloring2Doc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_KEYWORDSCOLORING2DOC_H__F82D9FC8_6073_4FC4_B0A4_5B7F22A6D8AB__INCLUDED_)
