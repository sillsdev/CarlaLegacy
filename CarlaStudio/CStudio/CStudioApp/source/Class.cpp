
#include "stdafx.h"
#include "ParseStream.h"
#include "ItemEditDialogs.h"
#include "CARLAStudioApp.h"
#include "TextDisplayInfo.h"

#include "CWList.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


CWClass::CWClass(CString& sField, BOOL bEnabled, char cCommentChar)
: CWListEntry(bEnabled)
{
	// first get the label
	CParseStream stream(sField, cCommentChar);
	CString sLabel, sTo;

	THROW_STR_IF_NOT(stream.word(m_sLabel, TRUE), sField);

	// collect the first comment and assign it to the class
	stream.endOfLineComment(m_sComments, TRUE); // ok if this fails


	// just throw all comments in together
	stream.toEnd(m_sContents);	// jdh changed may 25-1999 from toEndCollectComments
	m_sContents = getNRStringFromNString(m_sContents);

}

void CWClass::write(ostream& fout, char cCommentChar) const
{
	ASSERTX(m_pOwningList);
	fout << "\\" << ((CWClassList*)m_pOwningList)->getSFMCode() << " ";
	if(m_sLabel.GetLength() == 0)
		fout << "UNLABELED";
	else
		fout << m_sLabel;

	writeCommentStr(fout, m_sComments, cCommentChar);
	fout << " " << getNStringFromNRString(m_sContents) << " ";
	fout << "\n";
}

/*CWClass::CWClass(CString& sField, BOOL bEnabled, char cCommentChar)
: CWListEntry(bEnabled)
{
	// first get the label
	CParseStream stream(sField, cCommentChar);
	CString sLabel, sTo;

	THROW_STR_IF_NOT(stream.word(m_sLabel, TRUE), sField);

	// collect all the comments up to the first member of the class
	stream.endOfLineComment(m_sComments, FALSE); // ok if this fails

	m_sContents="";
	CString s;
	while(	stream.toEndOfLine(s, TRUE)) // to the next comment marker
	{
		m_sContents += s + ' ';

		CString sComment;
		if(stream.endOfLineComment(sComment, FALSE)) // suck up all the comments that follow
		{
			m_sContents += " (" + sComment + ") ";
		}
	}
	//stream.toEndCollectComments(m_sContents, m_sComments);

	m_sContents = getNRStringFromNString(m_sContents);
	m_sContents.TrimRight();
}
*/
/*void CWClass::write(ostream& fout, char cCommentChar) const
{
	ASSERTX(m_pOwningList);
	fout << "\\" << ((CWClassList*)m_pOwningList)->getSFMCode() << " ";
	if(m_sLabel.GetLength() == 0)
		fout << "UNLABELED";
	else
		fout << m_sLabel;

	writeCommentStr(fout, m_sComments, cCommentChar);

	fout << " ";
	CString sContents = getNStringFromNRString(m_sContents) ;
	CParseStream stream(sContents, cCommentChar);
	CString s;
	while(stream.upTo(s, '('))
	{
		if(stream.peek(CString("(")))
		{
			CString sComment;
			stream.upTo(sComment, ')');
			if(sComment.ReverseFind(')')>-1) // is there a matching closing marker?
			{
				fout << s << ' ' << cCommentChar << ' ' << sComment << '\n';
			}
			else
				fout << s << " ( " << sComment << " ";	// just treat it as normal text
		}
		else
			sContents += s + ' ';
	}
	fout << "\n";
}
*/
/*
CWClass::CWClass(CString& sField, BOOL bEnabled, char cCommentChar)
: CWListEntry(bEnabled)
{
	// first get the label
	CParseStream stream(sField, cCommentChar);
	CString sLabel, sTo;

	THROW_STR_IF_NOT(stream.word(m_sLabel, TRUE), sField);
	// just throw all comments in together
	stream.toEndCollectComments(m_sContents, m_sComments);
	m_sContents = getNRStringFromNString(m_sContents);

}

void CWClass::write(ostream& fout, char cCommentChar) const
{
	ASSERTX(m_pOwningList);
	fout << "\\" << ((CWClassList*)m_pOwningList)->getSFMCode() << " ";
	if(m_sLabel.GetLength() == 0)
		fout << "UNLABELED";
	else
		fout << m_sLabel;

	writeCommentStr(fout, m_sComments, cCommentChar);
	fout << " " << getNStringFromNRString(m_sContents) << " ";
	fout << "\n";
}
*/


// COPY CONSTRUCTOR
CWClass::CWClass(const CWClass *pCopy)
:	CWListEntry(pCopy),
	m_sContents(pCopy->m_sContents),
	m_sLabel(pCopy->m_sLabel),
	m_sComments(pCopy->m_sComments)
{

}

// called by CWListView::OnInitialUpdate
void CWClassList::insertColumns(CListCtrl &clc)
{
	insertColumn(clc, "Comment",	300);
	insertColumn(clc, "Contents",	200);
	insertColumn(clc, "      Label", 150);
}

// called by CWListView::OnGetdispinfo
 CString CWClass::getText(int iColumn)
{
	 switch(iColumn)
	{
		case 0: return m_sLabel;
				break;
		case 1: return m_sContents;
				break;

		case 2: return m_sComments;
				break;

		default: ASSERTX(FALSE);
				return m_sComments ;
				break;
	}
}
//called after an in-place edit of the list view
void CWClass::setText(int iColumn, LPCTSTR lpszStr)
{
	 switch(iColumn)
	{
		case 0: m_sLabel = lpszStr;
				break;
		case 1:  m_sContents=lpszStr;
				break;

		case 2: m_sComments=lpszStr;
				break;

		default: ASSERTX(FALSE);
				break;
	}
}



// invoked by menu
// this is generic enough to work for morph and string classes, as long as we don't
// have any conceptual model for the "contents" of the class.
//  The code (in may 98) is also similar (or the same) as that for CWTest.
BOOL CWClass::doEditDialog(CListCtrl& clc, BOOL bIsNew)
{
	CFont* pFont=NULL;

/*	if(m_pOwningList->getFontFlags() & SRCFont)
	{
		//CProjectDoc* pProjectDoc = ((CCarlaStudioApp*)AfxGetApp())->getProject();
		//ASSERTX(pProjectDoc);
		pFont = getLangFont(); //& pProjectDoc->getSrcFont();
	}
*/

	CDlgEditClass dlg(m_pOwningList->getTextDisplayInfo(),
					((CWClassList*)m_pOwningList)->m_bContentsAreMorphnames,
					((CWClassList*)m_pOwningList)->m_bContentsAreStrings );

	// Load in all our settings
	dlg.m_bEnabled = m_bEnabled;
	dlg.m_sLabel = m_sLabel;
	dlg.m_sContents = m_sContents;
	dlg.m_sComments = m_sComments;

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_bEnabled = dlg.m_bEnabled;
	m_sLabel = dlg.m_sLabel;
	m_sContents = dlg.m_sContents;
	m_sComments = dlg.m_sComments;

	if(!bIsNew)
		reset(clc);	// currently needed to get the enabled button to work

	return TRUE;
}


//friend of CWClass, called by operator<< of CWList
/*
ostream& operator <<( ostream& fout, const CWClass& aClass )
{
	ASSERTX(m_pOwningList);
	fout << "\\" << ((CWClassList*)m_pOwningList)->m_sSFMCode << " ";
	fout << aClass.m_sLabel << " " << aClass.m_sContents << getFileCommentStr(aClass.m_sComments);
}
*/


/*void CWClassList::addClass(CWClass* pClass)
{
	pClass->setOwningList(this);	// To DO: should be moved to the constructor
	m_pEntries.Add(pClass);
}
*/



  // override
// used when pasting into a list or undoing a deletion
CWListRowItem* CWClass::getCopy()
{
	CWClass* pNew = new CWClass(this);
	ASSERTX(pNew);
	return pNew;
}
