#include "stdafx.h"
#include "ParseStream.h"
#include "CARLAStudioApp.h"

#include "CWList.h"
#include "ItemEditDialogs.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

static CString sEmpty;

/////////////////////////////////////////////////////////
///////////// CWEnvironConstrainedRule /////////////////
/////////////////////////////////////////////////////////
IMPLEMENT_DYNAMIC(CWEnvironConstrainedRule, CWListEntry);

// called by <the model>::LoadFile() when it encounters a "\dis" marker
//  The effect is to add the environment found after it to
//	the rule (mcc, ortho change, etc.), but disable the the environment
void CWEnvironConstrainedRule::addDisabledEnvironment(CString& sField, char cCommentChar)
{
	CParseStream stream(sField, cCommentChar);
	parseAfterRuleStuff(stream, FALSE);
}

// virtual
// returns true if something was found/replaced
/*BOOL CWEnvironConstrainedRule::doFindReplace(FINDREPLACE * pFR)
{
	// not sure what to do about *multiple* envs yet... they probably
	// should be searched as row items on of their own
	return (getCommentText);
}
*/


// called by the getText() members of subclasses
CString CWEnvironConstrainedRule::getCommentText(int iColumn)
{
	if(m_lcComments.GetLength())
			return m_lcComments;
	else if( m_environments.GetSize())
			return m_environments[0]->getText(iColumn);	// no comment, but at least one env
		else
			return sEmpty;	// don't have a comment or an environment
}

// called by the getText() members of subclasses
CString CWEnvironConstrainedRule::getEnvironmentText(int iColumn)
{
	if(m_lcComments.GetLength())
		return sEmpty;	// first environment will start on next row
	else if( m_environments.GetSize())
		return m_environments[0]->getText(iColumn);	// no comment, but at least one env
	else
		return sEmpty;	// don't have a comment or an environment
}

// Called by: CWMCC constructor, CWOrthoCHange constructor, & addDisabledEnvironment()
// BUG: comments on a line by themselves, folling an env line, are treated as addition
//      comments on that environment, so they don't get their own line
void CWEnvironConstrainedRule::parseAfterRuleStuff(CParseStream& stream, BOOL bEnabled)
{
	// now we can have a series of environments and comments
	BOOL bKeepLooking = TRUE;	// prevents an endless loop when we get confused
	while(!stream.atEnd() && bKeepLooking)
	{
		bKeepLooking=FALSE;
		CString sEnv, sComment;
		if(stream.environment(sEnv, sComment, bEnabled))
		{
			bKeepLooking=TRUE;
			CStringEnvironment* pEnv =
				new CStringEnvironment(sEnv, sComment, m_iColumnForEnv, this, bEnabled, m_iColumnForEnvComment);
			m_environments.Add(pEnv);

			// NOTE that the new method (this app) uses to disable environments is
			// to prepend them with |DIS  (where '|') is the comment char.
			//  FOR CARLAMENU imports:
			//	ASSUMPTION: this will never be called with more than one \dis marker.
			// I.E. if we run into \dis /_foo
			//							/_goo
			// Then goo should be enabled.  We will never be called with
			// I.E. if we run into \dis /_foo
			//					   \dis /_goo
			// because the second \dis constitues a new field
			// thus, after adding the first environment, we turn off the effect of the \dis
			bEnabled = TRUE;
		}

		// a comment on a line by itself
		if(stream.endOfLineComment(sComment))
		{
			bKeepLooking=TRUE;
			if (m_lcComments.GetLength())
				m_lcComments += " ";
			m_lcComments += sComment;
				//TRACE("Throwing away comment:%s\n", sComment);
		}
	}
	stream.assertAtEnd();
}

// pInsertEnv is specified when we're doing cut/copy and paste
// it is null by default
// returns the row in which the new item is, or -1 if nothing was inserted
int CWEnvironConstrainedRule::insertEnviron(CListCtrl &clc, CStringEnvironment* pInsertEnv)
{
	CStringEnvironment* pEnv;
	if(pInsertEnv)
		pEnv = pInsertEnv;
	else
		pEnv = new CStringEnvironment(sEmpty, sEmpty, m_iColumnForEnv, this, TRUE, m_iColumnForEnvComment);

	if(!pInsertEnv)	// don't do the dialog if we're pasting
	{
		if(!pEnv->doEditDialog(clc, TRUE))
			return -1;
	}

	// 1) remove ourselves from the list control
	int iRow = getRow(clc);
	removeFromListCtrl(clc);
	// 2) add the new environment
	m_environments.Add(pEnv);
	// 3) add ourselves back in
	addYourRowsToListCtrl(clc, iRow);
	return iRow;
}

// called by CWList::populateListCtrl
//  We will enter one row for each change, plus extra rows for extra environments
int CWEnvironConstrainedRule::addYourRowsToListCtrl(CListCtrl &clc, int iStartingRow)
{
//	m_startingRow = iStartingRow;

	LV_ITEM lvi;
	lvi.mask = LVIF_TEXT | LVIF_PARAM | LVIF_STATE |LVIF_IMAGE;
	lvi.pszText = LPSTR_TEXTCALLBACK;   // app. maintains text
	lvi.iImage = getIconIndex();                     // image list index

	lvi.iSubItem = 0;
	lvi.iItem = iStartingRow;
	lvi.lParam = (LPARAM) this;    // change
	//lvi.state = INDEXTOSTATEIMAGEMASK(m_bEnabled?1:2);
	//lvi.stateMask = LVIF_STATE;
	if(!m_bEnabled)
	{
		lvi.state =  INDEXTOOVERLAYMASK(1); // draw the 'not' icon over it
		lvi.stateMask = LVIS_OVERLAYMASK;
	}
	else
	{
		lvi.state = 0;
		lvi.stateMask =  NULL;
	}

	ASSERTX(-1 != clc.InsertItem(&lvi));


	// first environment goes on first row (with the rule)
	// unless the rule has a comment, in which case the comment
	// goes on the first row with it
	int e;
	if(m_lcComments.GetLength())
	{
		e = 0;
		++iStartingRow;
	}
	else
		e = 1;	// don't give the first environment its own row

	// show one of two icons for string or morpheme environment types
 /*   if(this->m_pOwningList->getEnvironmentType() ==kMorphEnv)
		lvi.iImage = 1;
	else
		lvi.iImage = 2;
*/
	lvi.iImage = 99;	// empty
	//lvi.mask = LVIF_TEXT | LVIF_PARAM | LVIF_STATE;

	for(e; e < m_environments.GetSize(); e++)
	{
		lvi.iItem = e +  iStartingRow;
		lvi.lParam = (LPARAM) m_environments[e];    // environment
		CStringEnvironment *pEnv = m_environments[e];
		if(!pEnv->m_bEnabled)
		{
			lvi.state =  INDEXTOOVERLAYMASK(1); // draw the 'not' icon over it
			lvi.stateMask = LVIS_OVERLAYMASK;
		}
		else
		{
			lvi.state = 0;
			lvi.stateMask =  NULL;
		}
		ASSERTX(-1 != clc.InsertItem(&lvi));

		// now set the icon for the env sub item, so that the icon shows up in the right column
/*		LV_ITEM lsub;
		lsub.mask = LVIF_IMAGE;
		if(this->m_pOwningList->getEnvironmentType() ==kMorphEnv)
			lsub.iImage = 1;
		else
			lsub.iImage = 2;
		lsub.iSubItem = m_iColumnForEnv;
		ListView_SetItem(clc.m_hWnd, &lsub);
*/	}

/*		if(m_lcComments.GetLength())	comment now go on first row
	{
		lvi.iItem = e + iStartingRow;
		lvi.lParam = (LPARAM) &m_lcComments;    // comment line
		ASSERTX(-1 != clc.InsertItem(&lvi));
		++e;
	}
*/
	return e + iStartingRow;	// the next row that will be inserted
}

CWEnvironConstrainedRule::~CWEnvironConstrainedRule()
{
	int i = 0;
	while (i < m_environments.GetSize() )
	{
		delete m_environments.GetAt( i++ );
	}
	m_environments.RemoveAll();
}

//	returns How many rows do we take up in the list control?
int CWEnvironConstrainedRule::rowCount()
{
	int i=1;	// the following is verbose for clarity
	if(m_environments.GetSize())
	{	i += (m_environments.GetSize()-1);
		if(m_lcComments.GetLength())
			++i;	// the comment actually doesn't have its own line,
				// but it does bump the environments down one
	}
	return i;
}

///////////////////////////////////////////////////////////////////
////////////////////CStringEnvironment//////////////////////////////////
///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////

CStringEnvironment::CStringEnvironment(LPCTSTR lpszEnv, LPCTSTR lpszComment,
										int iShowInColumn,
										CWEnvironConstrainedRule* pOwner,
									   BOOL bEnabled,
									   int iShowCommentInColumn/*=-1*/)
:	m_pOwner(pOwner),
	m_sEnv(lpszEnv),
	m_sComments(lpszComment),
	m_iShowInColumn(iShowInColumn),
	m_iShowCommentInColumn(iShowCommentInColumn),
	CWListRowItem(bEnabled)
{
	if(m_iShowCommentInColumn == -1)
		m_iShowCommentInColumn = 1+m_iShowInColumn;
}

const CString CStringEnvironment::getDisplayName() const
{
	return "Environment";
}

BOOL CStringEnvironment::doEditDialog(CListCtrl& clc, BOOL bIsNew)
{
	BOOL bOldEnabled = m_bEnabled;
	CDlgEditEnvironment dlg(NULL);
	// Load in all our settings
	dlg.m_bEnabled = m_bEnabled;
	dlg.m_sEnvironment = m_sEnv;
	dlg.m_sComments = m_sComments;

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_bEnabled = dlg.m_bEnabled;
	setEnvString(dlg.m_sEnvironment);
	m_sComments = dlg.m_sComments;

	if(!bIsNew && (m_bEnabled != bOldEnabled))	// force the state icon to redraw if needed
	{
		ASSERTX(m_pOwner);
		m_pOwner->reset(clc);	// overkill, but we haven't written a reset() for row items yet, so this will reset the whole entry
	}

	return TRUE;
}

CString CStringEnvironment::getText(int iColumn)
{
	 ASSERTX(m_iShowInColumn >= 0); // constructor leaves at -1
	// if (m_iShowInColumn == 0)
	//	 return m_bEnabled?CString(" "):CString("OFF");
	 if (m_iShowInColumn == iColumn)
		 return m_sEnv;
	 else if (m_iShowCommentInColumn== iColumn)
		return m_sComments;
	 else
		return sEmpty;
}


///////////////////////////////////////////////////////////////////
////////////////////CWListComment//////////////////////////////////
///////////////////////////////////////////////////////////////////
CString CWListComment::getText(int iColumn)
{
	 ASSERTX(m_iShowInColumn >= 0); // constructor leaves at -1
	 if (m_iShowInColumn == iColumn)
		 return *this;
	 else
	 { ASSERT(FALSE);
		return *this;// error
	 }
}

void CWListComment::write(ostream& fout, char cCommentChar) const
{
	writeCommentStr(fout, (CString)*this, cCommentChar);
}

///////////////////////////////////////////////////////////////////
////////////////////CWOrthoChange//////////////////////////////////
///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////

// called by CWListView::OnInitialUpdate
void CWOrthoChangeList::insertColumns(CListCtrl &clc)
{

	insertColumn(clc, "Comment",	300);
	insertColumn(clc, "Environment",	100);
	insertColumn(clc, "To",	50);
	insertColumn(clc, "      From", 80);	// space are so it isn't over the icons
//	insertColumn(clc, "", 50);	// enabled/disabled
}

// called by CWListView::OnGetdispinfo
CString CWOrthoChange::getText(int iColumn)
{
	switch(iColumn)
	{
		//case 0: return m_bEnabled?CString(" "):CString("OFF");
		//		break;
		case 0: return m_sFrom;
				break;
		case 1: return m_sTo;
				break;

		// environment column
		case 2:	 return getEnvironmentText(iColumn);
/*			if(m_lcComments.GetLength())
					return sEmpty;	// first environment will start on next row
				else if( m_environments.GetSize())
					return m_environments[0]->getText(iColumn);	// no comment, but at least one env
				else
					return sEmpty;	// don't have a comment or an environment
*/				break;

		// comment column
		case 3:   return getCommentText(iColumn);

/*			if(m_lcComments.GetLength())
					return m_lcComments;
			else if( m_environments.GetSize())
					return m_environments[0]->getText(iColumn);	// no comment, but at least one env
				else
*/					return sEmpty;	// don't have a comment or an environment
				break;

		default: ASSERTX(FALSE);
				return sEmpty ;
				break;
	}
}

void CWOrthoChange::write(ostream& fout, char cCommentChar) const
{
	fout << "\\ch \"" << m_sFrom << "\" \"" << m_sTo << "\"\n";
	CWEnvironConstrainedRule::write(fout, cCommentChar);
}

CWOrthoChangeList::CWOrthoChangeList(const CTextDisplayInfo* pTDI)
:CWList(	4,
			0,
			pTDI,
			STRING_IN_COL(0)+STRING_IN_COL(1)+STRING_IN_COL(2),
			NULL,
			3)
{
}

/*void CWOrthoChangeList::addChange(CWOrthoChange* pChange)
{
	pChange->setOwningList(this);	// To DO: should be moved to the constructor
	m_pEntries.Add(pChange);
}
*/

 // override
// used when pasting into a list or undoing a deletion
CWListRowItem* CWOrthoChange::getCopy()
{
	CWOrthoChange* pNew = new CWOrthoChange(this);
	ASSERTX(pNew);
	return pNew;
}

// COPY CONSTRUCTOR
CWOrthoChange::CWOrthoChange(const CWOrthoChange *pCopy)
:	CWEnvironConstrainedRule(pCopy),
	m_sFrom(pCopy->m_sFrom),
	m_sTo(pCopy->m_sTo)
{

}


CWOrthoChange::CWOrthoChange(CString& sField, BOOL bEnabled, char cCommentChar)
: CWEnvironConstrainedRule(2, bEnabled)
{
	m_lcComments.m_iShowInColumn = 3;

	// first get the change:   "aa" > "a"
	CParseStream stream(sField, cCommentChar);

	THROW_STR_IF_NOT(stream.word(m_sFrom, TRUE), sField);

	CString s1, s2;	// could be the replace string or just a separator word (>, -->, to, ... )
	THROW_STR_IF_NOT(stream.word(s1, TRUE), sField);

	if(stream.word(s2, TRUE))	// if there are three words, then the last one is the replace string
		m_sTo = s2;
	else
		m_sTo = s1;	// otherwise, the second word is the replace string

	parseAfterRuleStuff(stream, TRUE);
}

// invoked by menu
BOOL CWOrthoChange::doEditDialog(CListCtrl& clc, BOOL bIsNew)
{
	clc.LockWindowUpdate();	//don't want to show the remove

	// 1) remove ourselves from the list control
	int iRow = getRow(clc);
	if(iRow >= 0)	// will be -1 if we were just created
		removeFromListCtrl(clc);

	// 2) do the dialog

	CDlgEditOrthoChange dlg(m_pOwningList->getTextDisplayInfo());
	// Load in all our settings
	dlg.m_bEnabled = m_bEnabled;
/*	if(!m_environments.GetSize())	// make a blank one if we need to
	{
		m_environments.Add(new CStringEnvironment( sEmpty,
												sEmpty,
												m_iColumnForEnv,
												this,
												TRUE, m_iColumnForEnvComment));
	}
*/
	//	dlg.m_sEnvironment = m_environments[0]->m_sEnv;
//	dlg.m_sEnvironComment = m_environments[0]->m_sComments;
	dlg.setRule(this);

	dlg.m_sComments = m_lcComments;
	dlg.m_sFrom = m_sFrom;
	dlg.m_sTo = m_sTo;

	// put up the dialog
	BOOL bDlgOk = dlg.DoModal();
	if(IDOK == bDlgOk)
	{

		// Reload all our settings if the user clicked 'ok'
		m_bEnabled = dlg.m_bEnabled;
		m_lcComments = dlg.m_sComments;
		m_sFrom = dlg.m_sFrom;
		m_sTo = dlg.m_sTo;
/*		if(dlg.m_sEnvironment.GetLength())
		{	m_environments[0]->m_sEnv = dlg.m_sEnvironment;
			m_environments[0]->m_sComments = dlg.m_sEnvironComment;
		}
		else	// the first env can be deleted by clearing that box
			m_environments.RemoveAt(0);
*/
	}

	// 3) add ourselves back in
	if(iRow >= 0)
		addYourRowsToListCtrl(clc, iRow);

	clc.UnlockWindowUpdate();	//now allow it to update


	return (IDOK == bDlgOk);
}

///////////////////////////////////////////////////////////////////
////////////////////CWMCC//////////////////////////////////
///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////

BOOL CWMCC::doEditDialog(CListCtrl& clc, BOOL bIsNew)
{
	// 1) remember our current number of rows

	int iOldRowCount = 0;
	if(!bIsNew)
	{
		iOldRowCount = rowCount();
	}

	// 2) prepare the dialog

	CDlgEditMCC dlg(getOwningList()->getTextDisplayInfo());

	// Load in all our settings
	dlg.m_bEnabled = m_bEnabled;




/*	if(!m_environments.GetSize())	// make a blank one if we need to
	{
		m_environments.Add(new CStringEnvironment( sEmpty,
												sEmpty,
												m_iColumnForEnv,
												this,
												TRUE, m_iColumnForEnvComment));
	}
	dlg.m_sEnvironment = m_environments[0]->m_sEnv;
	dlg.m_sEnvironComment = m_environments[0]->m_sComments;
*/
	dlg.setRule(this);
	dlg.m_sComments = m_lcComments;
	dlg.m_sMembers = m_sMembers;
	//dlg.m_listCtrlEnvironments.m_pRule = this;
	//dlg.m_listCtrlEnvironments.m_iNormalColumnForEnv	 = m_iColumnForEnv;
	//dlg.m_listCtrlEnvironments.m_pEnvironments= &m_environments;

	// 3) put up the dialog
	BOOL bDlgOk = dlg.DoModal();
	if(IDOK == bDlgOk)
	{

		// Reload all our settings if the user clicked 'ok'
		m_bEnabled = dlg.m_bEnabled;
		m_lcComments = dlg.m_sComments;
		m_sMembers = dlg.m_sMembers;
/*		if(dlg.m_sEnvironment.GetLength())
		{	m_environments[0]->m_sEnv = dlg.m_sEnvironment;
			m_environments[0]->m_sComments = dlg.m_sEnvironComment;
		}
		else	// the first env can be deleted by clearing that box
			m_environments.RemoveAt(0);
*/	}

	// 4) remove and then add ourselves back in to the list

	if(!bIsNew) // if we're not new (caller will add if we are)
		reset(clc, iOldRowCount);

	return (IDOK == bDlgOk);
}

/* BOOL CWMCC::doEditDialog(CListCtrl& clc)
{
	clc.LockWindowUpdate();	//don't want to show the remove

	// 1) remove ourselves from the list control
	int iRow = getRow(clc);
	if(iRow > 0) // will be -1 if we were just created
		removeFromListCtrl(clc);

	// 2) do the dialog

	CDlgEditMCC dlg(NULL);
	// Load in all our settings
	dlg.m_bEnabled = m_bEnabled;
	if(!m_environments.GetSize())	// make a blank one if we need to
	{
		m_environments.Add(new CStringEnvironment( sEmpty,
												sEmpty,
												m_iColumnForEnv,
												this,
												TRUE));
	}
	dlg.m_sEnvironment = m_environments[0]->m_sEnv;
	dlg.m_sEnvironComment = m_environments[0]->m_sComments;

	dlg.m_sComments = m_lcComments;
	dlg.m_sMembers = m_sMembers;

	// put up the dialog
	BOOL bDlgOk = dlg.DoModal();
	if(IDOK == bDlgOk)
	{

		// Reload all our settings if the user clicked 'ok'
		m_bEnabled = dlg.m_bEnabled;
		m_lcComments = dlg.m_sComments;
		m_sMembers = dlg.m_sMembers;
		if(dlg.m_sEnvironment.GetLength())
		{	m_environments[0]->m_sEnv = dlg.m_sEnvironment;
			m_environments[0]->m_sComments = dlg.m_sEnvironComment;
		}
		else	// the first env can be deleted by clearing that box
			m_environments.RemoveAt(0);
	}

	// 3) add ourselves back in
	if(iRow >= 0) // if we're not new (caller will add if we are)
		addYourRowsToListCtrl(clc, iRow);

	clc.UnlockWindowUpdate();	//now allow it to update


	return (IDOK == bDlgOk);
}
*/

// called by CWListView::OnInitialUpdate
void CWMCCList::insertColumns(CListCtrl &clc)
{
	insertColumn(clc, "Comment",	300);
	insertColumn(clc, "Environment",	100);
	insertColumn(clc, "Morpheme(s)", 100);
//	insertColumn(clc, "", 50);	// enabled/disabled
}

// called by CWListView::OnGetdispinfo
CString CWMCC::getText(int iColumn)
{
	 switch(iColumn)
	{
		//case 0: return m_bEnabled?CString(" "):CString("OFF");
	//			break;
		case 0: return m_sMembers;
				break;
		// environment column
		case 1: return getEnvironmentText(iColumn);
			/*if(m_lcComments.GetLength())
					return sEmpty;	// first environment will start on next row
				else if( m_environments.GetSize())
					return m_environments[0]->getText(iColumn);	// no comment, but at least one env
				else
					return sEmpty;	// don't have a comment or an environment
*/
			break;

		// comment column
		case 2:  return getCommentText(iColumn);
/*			if(m_lcComments.GetLength())
					return m_lcComments;
			else if( m_environments.GetSize())
					return m_environments[0]->getText(iColumn);	// no comment, but at least one env
				else
					return sEmpty;	// don't have a comment or an environment
*/				break;
		default: ASSERTX(FALSE);
				return m_lcComments;
				break;
	}
}


  // override
// used when pasting into a list or undoing a deletion
CWListRowItem* CWMCC::getCopy()
{
	CWMCC* pNew = new CWMCC(this);
	ASSERTX(pNew);
	return pNew;
}

// COPY CONSTRUCTOR
CWMCC::CWMCC(const CWMCC *pCopy)
:	CWEnvironConstrainedRule(pCopy),
	m_sMembers(pCopy->m_sMembers)
{
}

CWMCC::CWMCC(CString& sField, BOOL bEnabled, char cCommentChar)
: CWEnvironConstrainedRule(1, bEnabled)
{
	m_lcComments.m_iShowInColumn = 2;

	CParseStream stream(sField, cCommentChar);

	CString sTemp;

	while(stream.endOfLineComment(sTemp, TRUE))
		m_lcComments += sTemp;
		//TRACE("CWMCC::CWMCC currently can't handle comments before members\n"); 	// TO DO: don't just throw these away

	THROW_STR_IF_NOT(stream.word(m_sMembers, FALSE), sField);
	CString sMember;

	do
	{	while(stream.endOfLineComment(sTemp, TRUE))
			m_lcComments += sTemp; // TO DO: this is sloppy & will just concatenate them

		if(stream.atDisabledEnv())//	example: |DIS /blah_
			break;
		if(stream.word(sMember, FALSE))
		{	m_sMembers += " ";
			m_sMembers += sMember;
		}
		else
			break;
	} while (TRUE);

	parseAfterRuleStuff(stream, TRUE);
}

// note: the caller must do the actuall C++ delete if desired (not desired when cutting)
void CStringEnvironment::deleteSelf(CListCtrl &clc, CWList* pList)
{
	removeFromListCtrl(clc);	// remove from the control
	ASSERTX(m_pOwner);
	m_pOwner->removeEnvironment(this);
}

void CWEnvironConstrainedRule::removeEnvironment(CStringEnvironment* pEnv)
{
	for(int i=0; i< m_environments.GetSize(); i++)
	{
		if (m_environments[i] == pEnv)
		{
			m_environments.RemoveAt(i);
			return;
		}
	}

	ASSERTX (FALSE); // shouldn't get to here

}

int CWEnvironConstrainedRule::getEnvironmentCount() const
{
	return m_environments.GetSize();
}

 const CString CWOrthoChangeList::getDisplayName() const
{
	return "Orthography Change";
}

  // override
// used when pasting into a list or undoing a deletion
CWListRowItem* CWAdhocPair::getCopy()
{
	CWAdhocPair* pNew = new CWAdhocPair(this);
	ASSERTX(pNew);
	return pNew;
}

// COPY CONSTRUCTOR
CWAdhocPair::CWAdhocPair(const CWAdhocPair *pCopy)
:	CWListEntry(pCopy),
	m_sFirst(pCopy->m_sFirst),
	m_sSecond(pCopy->m_sSecond),
	m_sComments(pCopy->m_sComments),
	m_cTypeOfSecondMorpheme(pCopy->m_cTypeOfSecondMorpheme)
{

}
 const CString CWAdhocPairList::getDisplayName() const
{
	return "Adhoc Pair";
}

/* const CString&  CWOrthoChange::getDisplayName() const
{
	static CString sName("OrthoChange");
	return sName;
}
 */

/*const CString&  CWMCC::getDisplayName() const
{
	static CString sName("MCC");
	return sName;
}
*/

 const CString CWMCCList::getDisplayName() const
{
	return "MCC";
}

 CWList* CStringEnvironment::getOwningList() const
{
		ASSERTX(m_pOwner);
		return m_pOwner->getOwningList();
 }

 void CWMCC::write(ostream& fout, char cCommentChar) const
{
	fout << "\\mcc ";
	fout << m_sMembers << " ";

	CWEnvironConstrainedRule::write(fout, cCommentChar);
 }

 // called by the write() method of subclasses
void CWEnvironConstrainedRule::write(ostream& fout, char cCommentChar) const
{
	m_lcComments.write(fout, cCommentChar);

	for(int e=0; e < m_environments.GetSize(); e++)
	{
		 m_environments[e]->write(fout, cCommentChar);
	}
}


 // called by the write() method of CWEnvironConstrainedRule
void CStringEnvironment::write(ostream& fout, char cCommentChar) const
{
	if(!m_bEnabled)
		fout << " " << cCommentChar << "DIS ";	// so it will look like |DIS  /blah..._

		// note: this nicety is of course slowing us down some tiny bit
	CString x = m_sEnv;
	x.TrimLeft();
	// insert a '/' at the beginning if the user didn't have that or '+/'

	if(x.GetLength() >= 2) // make sure this check is safe
	{
		if (! ( (x[0] == '/')
				|| (x[0] == '+' && m_sEnv[1] == '/')
				|| (x[0] == '&' && m_sEnv[1] == '/')
			   )
			)
		{
			fout << "/ ";
		}
	}

	fout << x << " ";

	writeCommentStr(fout, m_sComments, cCommentChar);
}



IMPLEMENT_DYNAMIC(CStringEnvironment, CWListRowItem);

// used when copying-and-pasting an entry that has string-envs
// called by CWEnvironConstrainedRule::getCopy
CStringEnvironment::CStringEnvironment(CStringEnvironment * pCopy, CWEnvironConstrainedRule * pOwner)
:	CWListRowItem(pCopy->m_bEnabled),
	m_pOwner(pOwner), // the owner will be different
	m_iShowCommentInColumn(pCopy->m_iShowCommentInColumn),
	m_iShowInColumn(pCopy->m_iShowInColumn),
	m_sComments(pCopy->m_sComments),
	m_sEnv(pCopy->m_sEnv)
{
	setOwningList(pCopy->m_pOwningList);
}

// virtual override
// used when copying-and-pasting the string-env alone
// called by CWListView
// IT'S UP TO THE CALLER TO SET THE OWNER CORRECTLY AFTER THIS, IF THE OWNER IS CHANGING (AS IN PASTING INTO ANOTHER ENTrY)
CWListRowItem* CStringEnvironment::getCopy()
{
	CStringEnvironment* pNew = new CStringEnvironment(this, m_pOwner);
	ASSERTX(pNew);
	return pNew;
}

// COPY CONSTRUCTOR
CWEnvironConstrainedRule::CWEnvironConstrainedRule(const CWEnvironConstrainedRule * pCopy)
:	CWListEntry(pCopy),
	m_lcComments(&pCopy->m_lcComments),
	m_iColumnForEnv(pCopy->m_iColumnForEnv),
	m_iColumnForEnvComment(pCopy->m_iColumnForEnvComment)
{
	for(int e=0; e < pCopy->m_environments.GetSize(); e++)
	{
		CStringEnvironment* pEnv = new CStringEnvironment(pCopy->m_environments[e], this);
		m_environments.Add(pEnv);
	}
}

// override
// used when pasting into a list
// should be called by subclass of this class after they copy their unique members
/*
NOT HERE BECAUSE THIS IS A VIRTUAL CLASS
CWListRowItem * CWEnvironConstrainedRule::getCopy()
{
	CWEnvironConstrainedRule* pNew = new CWEnvironConstrainedRule(this);
	ASSERTX(pNew);
	return pNew);
}

*/
