// Monad.cpp: implementation of the CWMonad class.
//
// this is named after "monadic" features.  It is used for items
// that have a label, a description, and nothing else. (categories & properties)
//////////////////////////////////////////////////////////////////////
// 1.5a5 24-Sep-1999 hab allow user the ability to show properties in language font
// 1.7a1 03-Dec-1999 hab add test data
// 2.1.1 09-Mar-2000 hab Alloc full line comments and test data in monads

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "Monad.h"
#include "parsestream.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
class CTextDisplayInfo;

CWMonad::~CWMonad()
{

}

CWMonad::CWMonad(CString &sField, BOOL bEnabled, char cCommentChar)
: CWListEntry(bEnabled)
{
	ASSERT(FALSE); // not used for any AMPLE types, because they all require
					// that the CWMonadList do the parsing to come out right.

	// first get the label
	CParseStream stream(sField, cCommentChar);
	CString sLabel, sTo;

	THROW_STR_IF_NOT(stream.word(m_sLabel, TRUE), sField);
	// look for a "description" comment following the title
	BOOL found=TRUE;
	do{
		CString s;
		found = stream.endOfLineComment(s);
		if(found)
			m_sDescription += s + "\r\n";
	} while (found);

	stream.assertAtEnd();
}


CWMonad::CWMonad(const CWMonad *pCopy)
:	CWListEntry(pCopy),
	m_sDescription(pCopy->m_sDescription),
	m_sLabel(pCopy->m_sLabel)
{
}

CWMonad::CWMonad(CString &sLabel, CString &sDescription, BOOL bEnabled)
: CWListEntry(bEnabled),
 m_sLabel(sLabel),
 m_sDescription(sDescription)
{
}

#ifndef hab15a5
CWMonadList::CWMonadList(LPCTSTR lpszDisplayName, LPCTSTR lpszSFMCode, const CTextDisplayInfo* pTDI, DWORD dwMorphnameColumns)
: CWList(2,
		 CBEditMonad(0)+CBEditMonad(1),
		 pTDI,
		 NULL,
		 dwMorphnameColumns,
		 1),// comment col
#else // hab15a5
CWMonadList::CWMonadList(LPCTSTR lpszDisplayName, LPCTSTR lpszSFMCode, const CTextDisplayInfo* pTDI)
: CWList(2,
		 CBEditMonad(0)+CBEditMonad(1),
		 pTDI,
		 NULL,
		 NULL,
		 1),// comment col
#endif // hab15a5
	m_sDisplayName(lpszDisplayName),
	m_sSFMCode(lpszSFMCode)
{
	m_dwFlags &= ~ITEMS_HAVE_DIALOG;
#ifndef hab211
	m_dwFlags |= SUPPORT_LIST_ENTRY_COMMENTS;
	m_dwFlags |= SUPPORT_LIST_ENTRY_TEST_DATAS;
#else //hab211
	m_dwFlags &= ~SUPPORT_LIST_ENTRY_COMMENTS;
#ifndef hab17a1
	m_dwFlags &= ~SUPPORT_LIST_ENTRY_TEST_DATAS;
#endif //hab17a1
#endif //hab211
}


BOOL CWMonad::doEditDialog(CListCtrl &clc, BOOL bIsNew)
{
	AfxMessageBox("Edit this item by double-clicking on the label or the comment itself", MB_OK|MB_ICONINFORMATION);
	return FALSE; // we don't do dialogs
}

CWListRowItem* CWMonad::getCopy()
{
	CWMonad* pNew = new CWMonad(this);
	ASSERTX(pNew);
	return pNew;
}

CString CWMonad::getText(int iColumn)
{
	 switch(iColumn)
	{
		case 0: return m_sLabel;
				break;
		case 1: return m_sDescription;
				break;
		default: ASSERTX(FALSE);
				return m_sDescription ;
				break;
	}
}

void CWMonad::write(ostream &fout, char cCommentChar) const
{
	ASSERTX(m_pOwningList);
	fout << "\\" << ((CWMonadList*)m_pOwningList)->getSFMCode() << " ";
	if(m_sLabel.GetLength() == 0)
		fout << "UNLABELED";
	else
		fout << m_sLabel;

	writeCommentStr(fout, m_sDescription, cCommentChar);
	fout << "\n";
}

// called by CWListView::OnInitialUpdate
void CWMonadList::insertColumns(CListCtrl &clc)
{
	insertColumn(clc, "Comment",	500, 0);
	insertColumn(clc, "Label",200, 0);
}

CWListEntry* CWMonadList::createNewEntry(int iKind)
{
	return new CWMonad();
}

// this kind of list is different from others (CWTestList, CWStringList)
// because it doesn't necessarily get a seperate SFM for each item.
// For example, all the categories can be grouped into one "\ca" field.
void CWMonadList::parseField(CString &sField, BOOL bEnabled, char cCommentChar)
{
	CParseStream stream(sField, cCommentChar);
	// get the comments up to the first non-comment word

	CString sDescription;
	BOOL found;
	do{
		CString s;
		found = stream.endOfLineComment(s);
		if(found)
		{
			if(!sDescription.IsEmpty())
				sDescription += " ";
			sDescription += s;
		}
	} while (found);

	// while not at end
	while(!stream.atEnd())
	{
		CString sLabel;

		// read a label-word
		THROW_STR_IF_NOT(stream.word(sLabel, TRUE), sField);

		// collect comments
		do{
			CString s;
			found = stream.endOfLineComment(s);
			if(found)
			{
				if(!sDescription.IsEmpty())
					sDescription += " ";
				sDescription += s;
			}
		} while (found);

		CWMonad* pm = new CWMonad(sLabel, sDescription, bEnabled);
		sDescription="";
		addItem(pm);
	}
}


void CWMonad::setText(int iColumn, LPCTSTR lpszStr)
{
	ASSERT(lpszStr);
	switch(iColumn)
	{
		case 0: if(strlen(lpszStr)>0)
					m_sLabel = lpszStr;
				break;
		case 1: m_sDescription = lpszStr;
				break;
	}
}
