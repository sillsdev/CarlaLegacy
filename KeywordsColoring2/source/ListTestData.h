#ifndef hab17a1
// ListTestData.h: interface for the CListEntryTestData class.
//
// 1.7a1 03-Dec-1999 hab Created
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_LISTTESTDATA_H__AA7BDDA2_127E_11D3_8669_8C970CC10000__INCLUDED_)
#define AFX_LISTTESTDATA_H__AA7BDDA2_127E_11D3_8669_8C970CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "CWList.h"
#include "ListComment.h"

class CTextDisplayInfo;


class CListEntryTestData : public CWListEntry
{
public:
	DECLARE_DYNAMIC(CListEntryTestData);
	virtual int getIconIndex() const;
	CListEntryTestData() : CWListEntry(TRUE) {}
	CListEntryTestData(const CListEntryTestData *pCopy): CWListEntry(TRUE), m_sTestData(pCopy->m_sTestData){}
	CListEntryTestData(CString& sTestData) : CWListEntry(TRUE), m_sTestData(sTestData){}

	virtual ~CListEntryTestData() {};

	virtual void write(ostream& fout, char cCommentChar) const;
	virtual CString getText(int iColumn);
	virtual CWListRowItem* getCopy();
	virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew);

protected:
	CString m_sTestData;
};

#endif // !defined(AFX_LISTTESTDATA_H__AA7BDDA2_127E_11D3_8669_8C970CC10000__INCLUDED_)
#include "LogWindow.h"
class CTestDataCollector
{
private:
	CStringArray m_vecTestDatas;

public:
	void add(CString sTestData)
	{
		m_vecTestDatas.Add(sTestData);
	}
	void disgorge(CWList& list)
	{
		int i;
		for(i=0; i< m_vecTestDatas.GetSize(); i++)
			list.addItem(new CListEntryTestData(m_vecTestDatas[i]));

		m_vecTestDatas.RemoveAll();
	}
	void defaultDisgorge(CWList& list, LPCTSTR szListName, LPCTSTR szFileName);
		void removeAll(void)
	{
			m_vecTestDatas.RemoveAll();
		}
};

class CCommentOrTestDataCollector
{
private:
	CStringArray m_vecInfos;

public:
	void add(CString sData, CString sType)
	{
			m_vecInfos.Add(sType);
		m_vecInfos.Add(sData);
	}
	void disgorge(CWList& list)
	{
		int i;
		for(i=0; i< m_vecInfos.GetSize(); i++)
		  {
			if (m_vecInfos[i] == "co")
			list.addItem(new CListEntryComment(m_vecInfos[++i]));
			else
			list.addItem(new CListEntryTestData(m_vecInfos[++i]));
		  }
		m_vecInfos.RemoveAll();
	}
	void defaultDisgorge(CWList& list);
		void removeAll(void)
	{
			m_vecInfos.RemoveAll();
		}
};
#endif //hab17a1
