// KeywordsColoringDoc.h : interface of the CKeywordsColoringDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_KEYWORDSCOLORINGDOC_H__886FE0EB_1C83_45BC_9AB6_A1F05CD28C7D__INCLUDED_)
#define AFX_KEYWORDSCOLORINGDOC_H__886FE0EB_1C83_45BC_9AB6_A1F05CD28C7D__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CKeywordsColoringDoc : public CDocument
{
protected: // create from serialization only
	CKeywordsColoringDoc();
	DECLARE_DYNCREATE(CKeywordsColoringDoc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CKeywordsColoringDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CKeywordsColoringDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CKeywordsColoringDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_KEYWORDSCOLORINGDOC_H__886FE0EB_1C83_45BC_9AB6_A1F05CD28C7D__INCLUDED_)
