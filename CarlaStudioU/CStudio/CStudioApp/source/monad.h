// Monad.h: interface for the CWMonad class.
//
//////////////////////////////////////////////////////////////////////
// 1.5a5 24-Sep-1999 hab allow user the ability to show properties in language font

#if !defined(AFX_MONAD_H__4CA8FD00_9765_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_MONAD_H__4CA8FD00_9765_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "CWList.h"

#define CBEditMonad(x) (1<<x)
class CTextDisplayInfo;

class CWMonad : public CWListEntry
{
public:
	virtual void setText(int iColumn, LPCTSTR lpszStr);
	CWMonad(CString& sLabel, CString& sDescription, BOOL bEnabled);
	virtual void write(ostream& fout, char cCommentChar) const;
	virtual CString getText(int iColumn);
	virtual CWListRowItem* getCopy();
	virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew);
	CWMonad(const CWMonad *pCopy);
	CWMonad(CString& sField, BOOL bEnabled, char cCommentChar);
	CWMonad() : CWListEntry(TRUE) {}
	virtual ~CWMonad();

protected:
	CString m_sLabel;
	CString m_sDescription;
};

class CWMonadList : public CWList
{
	public:
		void parseField(CString& sField, BOOL bEnabled, char cCommentChar);
#ifndef hab15a5
		CWMonadList(LPCTSTR lpszDisplayName, LPCTSTR lpszSFMCode,  const CTextDisplayInfo* pTDI, DWORD dwMorphnameColumns=NULL);// : CWList(2, CBEditMonad(0)+CBEditMonad(1)), m_sDisplayName(lpszDisplayName), m_sSFMCode(lpszSFMCode) {};
#else
		CWMonadList(LPCTSTR lpszDisplayName, LPCTSTR lpszSFMCode,  const CTextDisplayInfo* pTDI);// : CWList(2, CBEditMonad(0)+CBEditMonad(1)), m_sDisplayName(lpszDisplayName), m_sSFMCode(lpszSFMCode) {};
#endif // hab15a5
		virtual void insertColumns(CListCtrl &clc);
		virtual const CString getDisplayName() const {return m_sDisplayName;}
		CString getSFMCode() const {return m_sSFMCode;}

	protected:
		CString m_sDisplayName;
		virtual CWListEntry* createNewEntry(int iKind);
		CString m_sSFMCode;
};

#endif // !defined(AFX_MONAD_H__4CA8FD00_9765_11D2_864F_AC380CC10000__INCLUDED_)
