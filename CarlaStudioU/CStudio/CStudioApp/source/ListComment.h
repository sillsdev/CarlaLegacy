// ListComment.h: interface for the CListEntryComment class.
//
// JDH 5/25/99 Created
// 1.7a1 03-Dec-1999 hab Add comments and/or test data
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_LISTCOMMENT_H__AA7BDDA2_127E_11D3_8669_8C970CC10000__INCLUDED_)
#define AFX_LISTCOMMENT_H__AA7BDDA2_127E_11D3_8669_8C970CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "CWList.h"
//#define CBEditMonad(x) (1<<x)
class CTextDisplayInfo;


class CListEntryComment : public CWListEntry
{
public:
	DECLARE_DYNAMIC(CListEntryComment);
	virtual int getIconIndex() const;
	CListEntryComment() : CWListEntry(TRUE) {}
	CListEntryComment(const CListEntryComment *pCopy): CWListEntry(TRUE), m_sComment(pCopy->m_sComment){}
	//CListEntryComment(CString& sField) :CWListEntry(TRUE) , m_sComment(sField);
	CListEntryComment(CString& sComment) : CWListEntry(TRUE), m_sComment(sComment){}

	virtual ~CListEntryComment() {};

	//virtual void setText(int iColumn, LPCTSTR lpszStr);
	virtual void write(ostream& fout, char cCommentChar) const;
	virtual CString getText(int iColumn);
	virtual CWListRowItem* getCopy();
	virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew);

protected:
	CString m_sComment;
};

#endif // !defined(AFX_LISTCOMMENT_H__AA7BDDA2_127E_11D3_8669_8C970CC10000__INCLUDED_)
#include "LogWindow.h"
class CCommentCollector
{
private:
	CStringArray m_vecComments;

public:
	void add(CString sComment)
	{
		m_vecComments.Add(sComment);
	}
	void disgorge(CWList& list)
	{
		int i;
		for(i=0; i< m_vecComments.GetSize(); i++)
			list.addItem(new CListEntryComment(m_vecComments[i]));

		m_vecComments.RemoveAll();
	}
	void defaultDisgorge(CWList& list, LPCTSTR szListName, LPCTSTR szFileName);
#ifndef hab17a1
		void removeAll(void)
	{
			m_vecComments.RemoveAll();
		}
#endif // hab17a1
};
