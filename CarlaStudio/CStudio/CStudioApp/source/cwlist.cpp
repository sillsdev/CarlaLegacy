// CWList.cpp
//
// May 25-99 jdh moved cwclass and cwclasslist to their own cpp file, class.cpp
// 1.5a5 24-Sep-1999 hab allow user the ability to show properties in language font
// 1.5a7 18-Oct-1999 hab Do not let user enter a compound root pair with any missing categories
// 1.5a7 20-Oct-1999 hab allow user the ability to show string and morpheme class names in language font
// 1.7a1 03-Dec-1999 hab Allow test data items
// 2.1.1 09-Mar-2000 hab Alloc full line comments and test data in monads
// 2.1.1 09-Mar-2000 hab Add CS-specific begin and end codes in data files in
//                       order to keep full line comments and test data in
//                       the correct list.
// 2.1.2 13-Mar-2000 jdh removed problem with dragging and entry into the middle of another entry
// 2.6.0 07-Aug-2001 hab when drag an item up, put it in the right spot in the file (was one too high)
/////////////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "ParseStream.h"
//#include "CARLAStudioApp.h"
#include "ItemEditDialogs.h"
#include "CARLAStudioApp.h"
//#include "ProjectDoc.h"
//#include "CarlaLanguage.h"
#include "TextDisplayInfo.h"
#include "ListComment.h"
#include "CWList.h"
#ifndef hab17a1
#include "ListTestData.h"
#endif //hab17a1

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

const int kCommentEntryKind = 99;
#ifndef hab17a1
const int kTestDataEntryKind = 98;
#endif //hab17a1

/* this is needed because some built-in template fn uses it.
CWListEntry& CWListEntry::operator= (CWListEntry& right_side)
{
	ASSERTX(FALSE);
	//right_side.m_columnValues.Copy(m_columnValues);

	return *this;  // Assignment operator returns left side.

}
*/

CWList::CWList( int iNumColumns,
				DWORD dwEditableColumns,
				const CTextDisplayInfo* pTDI,
				DWORD dwLangStringColumns,	// always in lang font
				DWORD dwMorphnameColumns,	// user controls whether in lang font
				int nCommentColumn)
	:	m_dwEditableColumns(dwEditableColumns),
		m_iNumColumns(iNumColumns),
		m_pTDI(pTDI),
#ifndef hab17a1
		m_dwFlags(ITEMS_HAVE_DIALOG | SUPPORT_LIST_ENTRY_COMMENTS |
			  SUPPORT_LIST_ENTRY_TEST_DATAS),
#else // hab17a1
		m_dwFlags(ITEMS_HAVE_DIALOG | SUPPORT_LIST_ENTRY_COMMENTS),
#endif //hab17a1
		m_dwLangStringColumns(dwLangStringColumns) ,
		m_dwMorphnameColumns(dwMorphnameColumns),
		m_nCommentColumn(nCommentColumn)
{

}

CWList::~CWList()
{

	int i = 0;
	while (i < m_pEntries.GetSize() )
	{
		delete m_pEntries.GetAt( i++ );
	}
	m_pEntries.RemoveAll();
}

// called by insertColumns
void CWList::insertColumn(CListCtrl &clc, char* pszName, int iWidth, int nIconIndex/*=-1*/)
{	LV_COLUMN lv;
	lv.mask = LVCF_FMT | LVCF_TEXT | LVCF_WIDTH;


	lv.fmt = LVCFMT_LEFT;
	lv.cx = iWidth;
	lv.pszText = pszName;


	if(nIconIndex>=0)
	{
		lv.mask |= LVCF_IMAGE;
		lv.fmt |= LVCFMT_COL_HAS_IMAGES ;
		lv.iImage = 4;//nIconIndex;
	}
	ASSERTX( -1 != clc.InsertColumn(0, &lv));
}



// called by CWListView::OnInitialUpdate
void CWList::populateListCtrl(CListCtrl &clc)
{

	clc.LockWindowUpdate();	//don't want to show the remove

	int iNextRow = 0;
	for (int iEntry = 0; iEntry < m_pEntries.GetSize(); iEntry++)
	{
		iNextRow = addItemToListControl(clc, iEntry, iNextRow);
		//iNextRow = m_pEntries[r]->addYourRowsToListCtrl(clc, lvi, iNextRow);
	}


	clc.UnlockWindowUpdate();	//don't want to show the remove

}

IMPLEMENT_DYNAMIC(CWListRowItem, CObject);
IMPLEMENT_DYNAMIC(CWListEntry, CWListRowItem);

// called by CWList::populateListCtrl
//  This default implementation just adds one row for the entry
int CWListEntry::addYourRowsToListCtrl(CListCtrl &clc,  int iStartingRow)
{
	LV_ITEM lvi;
	lvi.mask = LVIF_TEXT | LVIF_PARAM | LVIF_STATE | LVIF_IMAGE;
	lvi.state = 0;
	lvi.stateMask = 0;
	lvi.pszText = LPSTR_TEXTCALLBACK;   // app. maintains text
	lvi.iImage = getIconIndex();

	lvi.iSubItem = 0;
	lvi.iItem = iStartingRow;
	lvi.lParam = (LPARAM) this;
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
	return 1+ iStartingRow;	// the next row that will be inserted
}




///////////////////////////////////////////
/////////// CWTest & CWTestList /////////
///////////////////////////////////////////

/*void CWTestList::addTest(CWTest* pTest)
{
	pTest->setOwningList(this);	// To DO: should be moved to the constructor
	m_pEntries.Add(pTest);
}
*/

// called by CWListView::OnInitialUpdate
void CWTestList::insertColumns(CListCtrl &clc)
{
	insertColumn(clc, "Comment",	300);
	insertColumn(clc, "      Label",200);
	//insertColumn(clc, "", 30);	// enabled/disabled
}


  // override
// used when pasting into a list or undoing a deletion
CWListRowItem* CWTest::getCopy()
{
	CWTest* pNew = new CWTest(this);
	ASSERTX(pNew);
	return pNew;
}

// COPY CONSTRUCTOR
CWTest::CWTest(const CWTest *pCopy)
:	CWListEntry(pCopy),
	m_sContents(pCopy->m_sContents),
	m_sDescription(pCopy->m_sDescription),
	m_sLabel(pCopy->m_sLabel)
{
}

IMPLEMENT_DYNAMIC(CWTest, CWListEntry); // jdh 6/3/99 added

CWTest::CWTest(CString& sField, BOOL bEnabled, char cCommentChar)
: CWListEntry(bEnabled)
{
	// first get the label
	CParseStream stream(sField, cCommentChar);
	CString sLabel, sTo;

	THROW_STR_IF_NOT(stream.word(m_sLabel, TRUE), sField);
	// look for a "description" comment following the title
	BOOL found=TRUE;
	BOOL bFirstOne = TRUE;
	do	// jdh dec 98 changed to suck up multiple lines at the begginning of the test, instead of just one
	{
		if(bFirstOne) // jdh 6/3/99 added to skip whitespace instead of giving up if there is a CR before the first comment
		{
			stream.eatWhiteSpace();
		}
		else //if(!bFirstOne)// we want seperators only in-between, not at the end
		{
			m_sDescription += "\r\n";
			bFirstOne = FALSE;
		}
		bFirstOne = FALSE;
		CString s;
		found = stream.endOfLineComment(s, TRUE);
		if(found)
			m_sDescription += s;
	} while (found);

	m_sDescription.TrimRight();	// remove trailing whitespace

	// leave the remaining comments in with the text
	stream.toEnd(m_sContents);
	m_sContents = getNRStringFromNString(m_sContents);
}

// search for the give string
// override because we have some text to search that isn't shown in the columns and
// thus not handled by the default implementation
BOOL CWTest::doFindReplace(FINDREPLACE * pFR)
{
	CWList* pList = getOwningList();
	ASSERTX(pList);
	CString sFind = pFR->lpstrFindWhat;

	if(! (pFR->Flags & FR_MATCHCASE))
		sFind.MakeLower();

	CString s = m_sContents;
	if(! (pFR->Flags & FR_MATCHCASE))
		s.MakeLower();

	if(s.Find(sFind) > -1)
		return TRUE;
	return CWListEntry::doFindReplace(pFR);
}
// called by CWListView::OnGetdispinfo
 CString CWTest::getText(int iColumn)
{
	 switch(iColumn)
	{
		//case 0: return m_bEnabled?CString("abcd"):CString("OFF");
		//		break;
		case 0: return m_sLabel;
				break;
		case 1: return m_sDescription;
				break;
		default: ASSERTX(FALSE);
				return m_sDescription;
				break;
	}
}
///////////////////////////////////////////
/////////// CWAdhocPair & CWAdhocPairList /////////
///////////////////////////////////////////

void CWAdhocPairList::insertColumns(CListCtrl &clc)
{
	insertColumn(clc, "Example",	300);
	insertColumn(clc, "Morph 2 Type", 80);
	insertColumn(clc, "Morpheme 2", 100);
	insertColumn(clc, "     Morpheme 1", 120);
	//insertColumn(clc, "", 30);	// enabled/disabled
}

// called by CWListView::OnGetdispinfo
 CString CWAdhocPair::getText(int iColumn)
{
	static CString s;
	switch(iColumn)
	{
	//	case 0: return m_bEnabled?CString(" "):CString("OFF");
	//			break;
		case 0: return m_sFirst;
				break;
		case 1: return m_sSecond;
				break;
		case 2: switch(m_cTypeOfSecondMorpheme)
				{
					case 'p': s = "prefix"; break;
					case 'i': s = "infix"; break;
					case 's': s = "suffix"; break;
					case 'r': s = "root"; break;
				}
				return s;
				break;
		case 3: return m_sComments;
				break;
		default: ASSERTX(FALSE);
				return m_sComments ;
				break;
	}
}

CWAdhocPair::CWAdhocPair(CString& sMarker, CString& sField, BOOL bEnabled, char cCommentChar)
: CWListEntry(bEnabled), m_cTypeOfSecondMorpheme(sMarker[0])
{
	THROW_STR_IF_NOT((	m_cTypeOfSecondMorpheme == 'p' ||
						m_cTypeOfSecondMorpheme == 'i' ||
						m_cTypeOfSecondMorpheme == 's' ||
						m_cTypeOfSecondMorpheme == 'r' ),
					sMarker);

	// first get the label
	CParseStream stream(sField, cCommentChar);
	CString sLabel, sTo;

	THROW_STR_IF_NOT(stream.word(m_sFirst, TRUE), sField);
	THROW_STR_IF_NOT(stream.word(m_sSecond, TRUE), sField);
	// collect any inline comments

	CString sDummy;	// to do: check to make sure this is empty
	stream.toEndCollectComments(sDummy, m_sComments);
}

///////////////////////////////////////////
/////////// CWCompoundRootPair & CWCompoundRootPairList /////////
///////////////////////////////////////////

 const CString CWCompoundRootPairList::getDisplayName() const
{
	return "Compound Root Pair";
}

void CWCompoundRootPairList::insertColumns(CListCtrl &clc)
{
	insertColumn(clc, "Example",	300);
	insertColumn(clc, "Category 2", 100);
	insertColumn(clc, "      Category 1", 120);
	//insertColumn(clc, "", 30);	// enabled/disabled
}

// called by CWListView::OnGetdispinfo
 CString CWCompoundRootPair::getText(int iColumn)
{
	 switch(iColumn)
	{
	//	case 0: return m_bEnabled?CString(" "):CString("OFF");
	//			break;
		case 0: return m_sFirst;
				break;
		case 1: return m_sSecond;
				break;
		case 2: return m_sComments;
				break;
		default: ASSERTX(FALSE);
				return m_sComments;
				break;
	}
}

CWCompoundRootPair::CWCompoundRootPair(CString& sField, BOOL bEnabled, char cCommentChar)
: CWListEntry(bEnabled)
{
	// first get the label
	CParseStream stream(sField, cCommentChar);
	CString sLabel, sTo;

	THROW_STR_IF_NOT(stream.word(m_sFirst, TRUE), sField);
	THROW_STR_IF_NOT(stream.word(m_sSecond, TRUE), sField);
	// collect any inline comments

	CString sDummy;	// to do: check to make sure this is empty
	stream.toEndCollectComments(sDummy, m_sComments);
}

  // override
// used when pasting into a list or undoing a deletion
CWListRowItem* CWCompoundRootPair::getCopy()
{
	CWCompoundRootPair* pNew = new CWCompoundRootPair(this);
	ASSERTX(pNew);
	return pNew;
}

// COPY CONSTRUCTOR
CWCompoundRootPair::CWCompoundRootPair(const CWCompoundRootPair *pCopy)
:	CWListEntry(pCopy),
	m_sFirst(pCopy->m_sFirst),
	m_sSecond(pCopy->m_sSecond),
	m_sComments(pCopy->m_sComments)
{
}


CFont* CWListRowItem::getLangFont()
{
// TO DO: we need to be able to figure out what our doc is!
	//	CLangModelsDoc* pDoc = (CLangModelsDoc*)
//	return pDoc->getLangFont();

	return CFont::FromHandle( (HFONT) GetStockObject(ANSI_FIXED_FONT));

}

BOOL CWListRowItem::doEditDialog(CListCtrl& clc, BOOL bIsNew)
{
	return FALSE;	// must be overriden
}

#ifndef mr270
BOOL CWListRowItem::setTypeOfTest(BOOL bIsAmple) // added by mr 5/24/2002
{
	return FALSE;	// must be overriden
}
#endif // mr270

//#include "DlgProjectSettings.h"
#include "cwtopic.h"
// invoked by menu

#ifndef mr270
BOOL CWTest::setTypeOfTest(BOOL bAmple) // added by mr 5/24/2002
{
	m_bIsAmple=bAmple;
	return 0;
}
#endif // mr270

BOOL CWTest::doEditDialog(CListCtrl& clc, BOOL bIsNew )
{

CWTopic *p=NULL;
#ifndef hab15a7
	CDlgEditTest dlg(m_pOwningList->getTextDisplayInfo());
#else
	CDlgEditTest dlg(NULL);
#endif // hab15a7
	// Load in all our settings
	dlg.m_bEnabled = m_bEnabled;
	dlg.m_sLabel = m_sLabel;
	dlg.m_sContents = m_sContents;
	dlg.m_sDescription = m_sDescription;
#ifndef mr270
	dlg.m_bIsAmpleTest = m_bIsAmple; // added by mr 5/24/2002
#endif // mr270

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_bEnabled = dlg.m_bEnabled;
	m_sLabel = dlg.m_sLabel;
	m_sContents = dlg.m_sContents;
	m_sDescription = dlg.m_sDescription;

	if(!bIsNew)
		reset(clc);	// currently needed to get the enabled button to work

	return TRUE;
}
#ifndef mr270
void CWList::setTypeOfTest(BOOL bFlag)
{
	m_bIsAmple=bFlag;
}
#endif // mr270

// called by a iuent item when it is changed or by the list when it has changed
void CWList::setModifiedFlag()
{
	//m_pModel->setModifiedFlag();
}


/*int CWListRowItem::toggleEnabled()
{
	m_bEnabled = !m_bEnabled;
	return getStateValue();	// will be different for different types of entries
}
*/

//	Parameters:	clc the list control we're adding to
//				iStartingRow the listitem before-which we should insert a new entry
//					if this is -1, then the item is created at the end of the list
//	Called by: CWListView::OnUpdateEditInsertEntry
// iKind will be zero usually; will be 1 for STAMPFlag rules. Ignored if pInsertEntry non-null.
//	pInsertEntry is used for copy-paste.  otherwise, it will be null
// returns the row in which the new item is, or -1 if nothing was inserted
int CWList::insertNewItem(CListCtrl &clc, int iStartingRow, int iKind, CWListEntry* pInsertEntry)
{
	int iBeforeEntry, iInsertAtRow;
	// 1) First, create the item
	CWListEntry* pEntry;

	if(pInsertEntry)
		pEntry = pInsertEntry;	// entry being pasted

	// JDH 5/25/99 3:43:58 PM Added List Comment Capability (\co)
	else if(iKind == kCommentEntryKind)
		pEntry = new CListEntryComment;
#ifndef hab17a1
	else if(iKind == kTestDataEntryKind)
		pEntry = new CListEntryTestData;
#endif //hab17a1
	else
		pEntry = createNewEntry(iKind);

	pEntry->setOwningList(this);	// To DO: should be moved to the constructor
	if(m_pEntries.GetSize() == 0)	// if the list is currently empty
	{
		iBeforeEntry = iInsertAtRow = 0;
	}
	else if(iStartingRow >=0)
	{
		iBeforeEntry = rowToEntryIndex(clc, iStartingRow);
		ASSERTX(iBeforeEntry >= 0);
		iInsertAtRow = entryIndexToRowIndex(clc, iBeforeEntry);
		ASSERTX(iInsertAtRow >= 0);
	}
	else	// iStartingRow=-1, make this the last member of the list
	{
		iBeforeEntry=-1;
		iInsertAtRow = iStartingRow = clc.GetItemCount();
	}
	// 2) Let the user fill in its dialog

#ifndef hab211
	if(!pInsertEntry  	// don't do the dialog if we're pasting
		&&( (m_dwFlags & ITEMS_HAVE_DIALOG) ||  // or for simple types (CMonad) that don't have dialog boxes
			(iKind == kCommentEntryKind) || // unless its a comment or
					(iKind == kTestDataEntryKind))) // test data
#else //hab211
	if(!pInsertEntry  	// don't do the dialog if we're pasting
		&&(m_dwFlags & ITEMS_HAVE_DIALOG)) // or for simple types (CMonad) that don't have dialog boxes
#endif //hab211
	{
#ifndef mr270
		pEntry->setTypeOfTest(getTypeOfTest());
#endif // mr270
		if (!pEntry->doEditDialog(clc, TRUE) )
			return -1;
	}

	// 3) if they ok'd the dialog, add it to our list

	int iNewEntryIndex ;
	if(iBeforeEntry >= 0)
	{
		iNewEntryIndex = iBeforeEntry;
		m_pEntries.InsertAt(iBeforeEntry, pEntry);
	}
	else
	{
		iInsertAtRow = clc.GetItemCount();	// at the end
		iNewEntryIndex = m_pEntries.Add(pEntry); // stick it at the end
	}

	// 4) Add the item to the list control
	//ASSERTX(iStartingRow >= 0);
	if( addItemToListControl(clc, iNewEntryIndex, iInsertAtRow))
		return iInsertAtRow;
	else
		return -1;
}

// JDH 5/26/99 Added List Comment handling
// iColumn is -1, then we have a CListEntryComment, which takes up the whole line
#ifndef hab17a1
// iColumn is -2, then we have CListEntryTestData, which takes up the whole
// line and is always in the language font
#endif //hab17a1

BOOL CWList::getUseLangFontInColumn(int iColumn) const
{
	return ( m_dwLangStringColumns & (1<< iColumn)
				|| (	m_pTDI
					&&	m_dwMorphnameColumns & (1<< iColumn)
					&&	m_pTDI->m_bShowMorphnamesInLangFont)
				|| (	m_pTDI
					&&	(m_nCommentColumn == iColumn)
					&&	m_pTDI->m_bShowCommentsInLangFont)
				|| (	m_pTDI
					&&	(-1 == iColumn)
					&&	m_pTDI->m_bShowCommentsInLangFont)
#ifndef hab17a1
				|| (	m_pTDI // test data in whole line
					&&	(-2 == iColumn))
#endif //hab17a1
#ifndef hab15a5
				|| (	m_pTDI
					&&	m_dwMorphnameColumns & (2<< (iColumn + 1))
					&&	m_pTDI->m_bShowPropertiesInLangFont)
#endif // hab15a5
#ifndef hab15a7
				|| (	m_pTDI
					&&	m_dwMorphnameColumns & ((iColumn + 1)<<3) // there's got to be a better way...
					&&	m_pTDI->m_bShowStringClassesInLangFont)
				|| (	m_pTDI
					&&	m_dwMorphnameColumns & ((iColumn + 1)<<4) // there's got to be a better way...
					&&	m_pTDI->m_bShowMorphemeClassesInLangFont)
#endif // hab15a7
			);
}

//	Parameters:	clc the list control we're adding to
//				iStartingRow the listitem before-which we should insert a new entry
//	Returns:	the next item index that would follow the row(s) this adds
//  Called by:	CWListView::OnEditInsert() and CWList::populateListCtrl()
int CWList::addItemToListControl(CListCtrl &clc, int iEntry, int iStartingRow)
{
 // Initialize LV_ITEM members that are common to all items.
/*	LV_ITEM lvi;
	lvi.mask = LVIF_TEXT | LVIF_PARAM | LVIF_STATE;
	lvi.state = 0;
	lvi.stateMask = 0;
	lvi.pszText = LPSTR_TEXTCALLBACK;   // app. maintains text
	lvi.iImage = 0;                     // image list index
*/
	CWListEntry* pEntry = m_pEntries[iEntry];
	ASSERTX(pEntry);
	return pEntry->addYourRowsToListCtrl(clc, iStartingRow);

}

CWListEntry* CWList::createNewEntry(int iKind)
{
	ASSERTX(FALSE);	// should be overridden
	return NULL;
}

//	override
CWListEntry* CWTestList::createNewEntry(int iKind)
{
	return new CWTest;
}

// given an entry index, what row is it on (remember, entries can have multiple rows)
 int CWList::entryIndexToRowIndex(CListCtrl &clc, int iEntry)
{
	CWListEntry* pEntry = m_pEntries[iEntry];
	// now search for an item that has this pointer as its lparam value
	for(int iRow=0; iRow< clc.GetItemCount(); iRow++)
	{
		CWListRowItem* x = (CWListRowItem*)clc.GetItemData(iRow);
		if(x == pEntry)
		{
			return iRow;
		}
	}
	return -1;
}


 int CWList::rowToEntryIndex(CListCtrl &clc, int iRow)
{
	CWListEntry* pEntry = (CWListEntry*) clc.GetItemData(iRow);
//	ASSERTX( pEntry->IsKindOf( RUNTIME_CLASS( CWListEntry  ) ) );

	pEntry = pEntry->owningEntry();	// will be the same for CWListEntries,
								// some owning entry for environs & comment lines

	for(int i=0; i < m_pEntries.GetSize(); i++)
	{
		if ( pEntry == m_pEntries[i])
			break;
	}

	if ( i < m_pEntries.GetSize())
		return i;
	else
		return -1;
}


 CWListEntry* CStringEnvironment::owningEntry()
{
	ASSERTX(m_pOwner);
	return m_pOwner;
}



 const CString CWListRowItem::getDisplayName() const
{
	return m_pOwningList->getDisplayName();
}

 // called by the editctrl when the user edits the item directly in the list
 // this should be impossible for becase the list's m_dwEditableColumns should be NULL for all other classes
void CWListRowItem::setText(int iColumn, LPCTSTR lpszStr)
{
	 // as of dec 30, 1998, only CWMonad implemented this function
	AfxMessageBox("Whoops.  You have to double click on this item's icon to edit it.  Please report this msg as a bug.");
}

 const CString CWList::getDisplayName() const
{
	return "?????";	// must override
}


// returns the index of the row that the entry starts on
int CWListEntry::getStartingRow(CListCtrl & clc)
{
	for(int i=0; i< clc.GetItemCount(); i++)
		if((CWListEntry*)clc.GetItemData(i) == this)
		{
			return i;
		}
	ASSERTX(FALSE);
	return -1;
}

// called when a change is made that changes the number of of rows
// this item takes up.
// Note:	currently, this is also the only way to make the state icon update
// Parameters:	iOldRowCount is needed when a row may have been added or deleted, so that
//				current rowCount() would not be the right number to remove

//	13-Mar-2000 jdh removed problem with dragging and entry into the middle of another entry
void CWListEntry::reset(CListCtrl &clc, int iOldRowCount, int iNewStartingRow)
{
	clc.LockWindowUpdate();	//don't want to show the remove
	int iStartingRow;
	if(iNewStartingRow==-1)
		iStartingRow = getStartingRow(clc);
	else
	{
		iStartingRow = iNewStartingRow;
		// jdh 3/13/2000 if we're moving down, we need to subtract
		//				the rows we will remove from above from the iNewStartingRow
		if (iStartingRow > this->getStartingRow(clc))
			iStartingRow -= this->rowCount();
	}

	ASSERTX(iStartingRow >=0);

	// 1) remove ourselves from the list control
	int iRow = getRow(clc);
	removeFromListCtrl(clc, iOldRowCount);

	// 2) add ourselves back in	// made this change for drag & drop
	addYourRowsToListCtrl(clc, iStartingRow); // iRow);

	clc.UnlockWindowUpdate();	//don't want to show the remove

}

// Parameters:	iOldRowCount is needed when a row may have been added or deleted, so that
//				current rowCount() would not be the right number to remove
void CWListRowItem::removeFromListCtrl(CListCtrl &clc, int iOldRowCount)
{
	int iRow = getRow(clc);
	int iRowCount = (iOldRowCount<1)?rowCount():iOldRowCount;

	for(int i=0; i< iRowCount; i++) // jdh dec 98 found bug here: was i<rowCount()
		clc.DeleteItem(iRow);
}

/*int CWListRowItem::getStateValue()
{
	// Note the the state image sutff seems to be 1-based indexing
	// instead of zero.
	return INDEXTOSTATEIMAGEMASK(m_bEnabled?1:2);
}
*/

// Returns -1 if not found (which will happen if the item is new)
 int CWListRowItem::getRow(CListCtrl &clc)
{
	LV_FINDINFO lvf;
	lvf.flags=LVFI_PARAM;
	lvf.lParam = (LPARAM) this;
	int iRow = clc.FindItem(&lvf);
	return iRow;
}



void CWListEntry::deleteSelf(CListCtrl &clc, CWList* pList)
{
	removeFromListCtrl(clc);	// remove from the control
	pList->removeItem(this);	// remove from the list
}

void CWList::removeItem(CWListEntry* pEntry)
{
	for(int i=0; i< m_pEntries.GetSize(); i++)
	{
		if (m_pEntries[i] == pEntry)
		{
			m_pEntries.RemoveAt(i);
			return;
		}
	}

	ASSERTX(FALSE);
}


void CWList::addItem(CWListEntry* pItem)
{
	ASSERTX(pItem);
	pItem->setOwningList(this);	// To DO: should be moved to the constructor
	m_pEntries.Add(pItem);

}

// invoked by menu
BOOL CWCompoundRootPair::doEditDialog(CListCtrl& clc, BOOL bIsNew)
{
	CDlgEditCmpdRootPair dlg(m_pOwningList->getTextDisplayInfo());
	// Load in all our settings
	dlg.m_bEnabled = m_bEnabled;
	dlg.m_sCategory1 = m_sFirst;
	dlg.m_sCategory2 = m_sSecond;
	dlg.m_sComments = m_sComments;

#ifndef hab15a7
		// put up the dialog
		int iResult;
		while ((iResult = dlg.DoModal()) == IDOK)
		  {
			if (dlg.m_sCategory1.IsEmpty() ||
				dlg.m_sCategory2.IsEmpty())
			  {
				CString sMsg;
				sMsg.LoadString(IDS_MSGCompoundRootsNeedTwoCats);
				AfxMessageBox(sMsg);
			  }
			else
			  break;
		  }
		if(IDOK != iResult)
				return FALSE;
#else  // hab15a7
	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;
#endif // hab15a7

	// Reload all our settings if the user clicked 'ok'
	m_bEnabled = dlg.m_bEnabled;
	m_sFirst = dlg.m_sCategory1;
	m_sSecond = dlg.m_sCategory2;
	m_sComments = dlg.m_sComments;

	if(!bIsNew)
		reset(clc);	// currently needed to get the enabled button to work

	return TRUE;
}
// invoked by menu
BOOL CWAdhocPair::doEditDialog(CListCtrl& clc, BOOL bIsNew)
{
	CDlgEditAdhocPair dlg(m_pOwningList->getTextDisplayInfo());
	// Load in all our settings
	dlg.m_bEnabled = m_bEnabled;
	dlg.m_sMorph1 = m_sFirst;
	dlg.m_sMorph2 = m_sSecond;
	dlg.m_sComments = m_sComments;
	switch(m_cTypeOfSecondMorpheme)
	{
		case 'p': dlg.m_sMorphType = "Prefix";
			break;
		case 'i': dlg.m_sMorphType = "Infix";
			break;
		case 'r': dlg.m_sMorphType = "Root";
			break;
		case 's': dlg.m_sMorphType = "Suffix";
			break;
		case 0: dlg.m_sMorphType = "Prefix";
			break;
	}

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_bEnabled = dlg.m_bEnabled;
	m_sFirst = dlg.m_sMorph1;
	m_sSecond = dlg.m_sMorph2;
	m_sComments = dlg.m_sComments;
	m_cTypeOfSecondMorpheme = tolower(dlg.m_sMorphType[0]);

	if(!bIsNew)
		reset(clc);	// currently needed to get the enabled button to work

	return TRUE;
}

// send our data out to the control file
#ifndef hab211
void CWList::write(ostream & fout, char cCommentChar, char *pszCode) const
{
		int iSize = m_pEntries.GetSize();
	if (iSize)
	  fout << "\\CSbeg" << pszCode << "\n";	// indicate begin type
	for(int i=0; i < iSize; i++)
	{
		if(!m_pEntries[i]->m_bEnabled)
			fout << "\\dis ";
		m_pEntries[i]->write(fout, cCommentChar);
		fout << "\n"; // blank line in-between items
	}
	if (iSize)
	  fout << "\\CSend\n";	// indicate end of type
}
#else //hab211
void CWList::write(ostream & fout, char cCommentChar) const
{
	for(int i=0; i < m_pEntries.GetSize(); i++)
	{
		if(!m_pEntries[i]->m_bEnabled)
			fout << "\\dis ";
		m_pEntries[i]->write(fout, cCommentChar);
		fout << "\n"; // blank line in-between items
	}
}
#endif //hab211

void CWAdhocPair::write(ostream& fout, char cCommentChar) const
{
	switch(m_cTypeOfSecondMorpheme)
	{
		case 'p':	fout << "\\pah ";
					break;
		case 's':	fout << "\\sah ";
					break;
		case 'i':	fout << "\\iah ";
					break;
		case 'r':	fout << "\\rah ";
					break;

		default: TRACE("bad adhoc pair type\n");
				fout << "\\pah ";	// to do: do something smarter
				break;
	}

	fout << m_sFirst << " " << m_sSecond << " ";
	writeCommentStr(fout, m_sComments, cCommentChar);
}

void CWCompoundRootPair::write(ostream& fout, char cCommentChar) const
{
	fout << "\\cr ";

	fout << m_sFirst << " " << m_sSecond << " ";
	writeCommentStr(fout, m_sComments, cCommentChar);
	fout << "\n";
}


void CWTest::write(ostream& fout, char cCommentChar) const
{
	ASSERTX(m_pOwningList);
	fout << "\\" << ((CWTestList*)m_pOwningList)->getSFMCode() << " ";
	if(m_sLabel.GetLength() == 0)
		fout << "UNLABELED";
	else
		fout << m_sLabel;

	writeCommentStr(fout, m_sDescription, cCommentChar);
	fout << " " << getNStringFromNRString(m_sContents) << " ";
	fout << "\n";
}

void CWListRowItem::writeCommentStr(ostream & fout, const CString & sComment, char cCommentChar)
{
	// TO DO: handle multi-line comments using comment character

	//fout << cCommentChar << " " << sComment;

	if(sComment.GetLength() == 0)
		return;

	fout << ' ' << cCommentChar << ' ';
	//CString& sC = (CString) sComment;	// get around the const (we promise not to change it)

	CString sC = getNStringFromNRString(sComment);
	LPTSTR x = (char*) sC.GetBuffer(1);
	while(*x)
	{
		fout << *x;
		if(*x == '\n' && *(x+1)) // CR and more chars to follow
		{
			fout << cCommentChar << ' ';
		}
		++x;
	}
	fout << "\n";
	sC.ReleaseBuffer(-1);
	//fout << "\n\\co " << sComment << "\n";
}


// change history
//		 13-Mar-2000 jdh removed problem with dragging and entry into the middle of another entry

void CWListEntry::doMoveToSlot(CListCtrl & clc, int iSlot)
{
#ifdef beforeJDH3_13_2000
	// move in the underlying list
	m_pOwningList->moveItem(this, m_pOwningList->rowToEntryIndex(clc, iSlot));

	// move in the list control
	reset(clc, -1, iSlot);
#else
	// Note: non-simple case is for multi-row entries (e.g. Environmentally constrained rules, like MCC)

	//		when we're dragging up, we can just use the row index of the entry we just dragged onto.
	// That will insert the dragged items rows right above it.

	// The problem is when we drag *down*.  Then, we need to determine the number of rows
	// of the item we dragged on top so we can insert after it.

	int iDraggedOntoEntryIndex = m_pOwningList->rowToEntryIndex(clc, iSlot);
	int iRowIndex=0;

	int iNewEntryIndex =0;
	if (getStartingRow(clc) > iSlot) // moving up, want to end up BEFORE the item we dragged onto
	{
		   // it's ok if this -1
		if(0==iDraggedOntoEntryIndex)
			iNewEntryIndex=iRowIndex=0;
		else
		{
#ifndef hab260
		  iNewEntryIndex= iDraggedOntoEntryIndex;  // put at right spot in file, too
#else
			iNewEntryIndex= iDraggedOntoEntryIndex-1;
#endif // hab260
			iRowIndex=m_pOwningList->entryIndexToRowIndex(clc, iDraggedOntoEntryIndex);
		}
	}
	else // moving down, want to end up immediately AFTER the item we dragged onto
	{
		// the dragged-onto item's index will decrease by one because we vacated our old slot
		iNewEntryIndex = iDraggedOntoEntryIndex;
		CWListEntry* pe = m_pOwningList->getEntry(iDraggedOntoEntryIndex);
		iRowIndex = pe->getStartingRow(clc) + pe->rowCount();
	}


	// move in the underlying list
	m_pOwningList->moveItem(this, iNewEntryIndex);

	// move in the list control
	reset(clc, -1, iRowIndex);
#endif
}


CFont* CWList::getUserFont()
{
	return ::getDefaultUserFont();
}

CFont* CWList::getLangFont()
{
	if(!m_pTDI)	// some classes, like category classes, won't have a vernacular component
		return NULL; // jdh changed dec 98, effectively changing the semantics too
		//return getUserFont();

	// string classes will have a vernacular component

	return m_pTDI->getFont();
}

const CTextDisplayInfo* CWList::getTextDisplayInfo()
{
//	ASSERTX(m_pTDI);
	return m_pTDI;
}

// store the widths of the columns so we can restore them later
void CWList::retrieveHeaderParams(CListCtrl& clc)
{
	m_iColumnWidths.RemoveAll();

	for(int c=0; c< getColumnCount(); c++)
	{
		m_iColumnWidths.Add(clc.GetColumnWidth(c));
	}
}

void CWList::restoreHeaderParams(CListCtrl& clc)
{
	// doesn't seem to work correctly (too small), maybe because it must use the default font of the list ctrl
	//if(m_iColumnWidths.GetSize()==0)
	//	clc.SetColumnWidth( 0, LVSCW_AUTOSIZE );

	for(int c=0; c< m_iColumnWidths.GetSize(); c++)
	{
		if(m_iColumnWidths[c] > 0)
			clc.SetColumnWidth(c, m_iColumnWidths[c]);
	}
}

// this is used by the drag-and-drop reordering
void CWList::moveItem(CWListEntry * pEntry, int iNewLoc)
{
	int iCurrentLoc = entryToIndex(pEntry);
	m_pEntries.RemoveAt(iCurrentLoc);
	m_pEntries.InsertAt(iNewLoc, pEntry);
}

int CWList::entryToIndex(CWListEntry * pEntry)
{
	for(int i=0; i < m_pEntries.GetSize(); i++)
	{
		if(m_pEntries[i] == pEntry)
			return i;
	}
	ASSERTX(FALSE);
	return -1;
}

// search for the give string
// this uses what is shown in the columns of the list.
// if a class has other data it wants searched, it must override this.
BOOL CWListRowItem::doFindReplace(FINDREPLACE * pFR)
{
	CWList* pList = getOwningList();
	ASSERTX(pList);
	CString sFind = pFR->lpstrFindWhat;

	if(! (pFR->Flags & FR_MATCHCASE))
		sFind.MakeLower();

	for(int i=0; i< pList->getColumnCount(); i++)
	{
		CString s = getText(i);
		if(! (pFR->Flags & FR_MATCHCASE))
			s.MakeLower();

		if(s.Find(sFind) > -1)
			return TRUE;
	}
	return FALSE;
}
	/*typedef struct {    // fr
	DWORD        lStructSize;
	HWND         hwndOwner;
	HINSTANCE    hInstance;
	DWORD        Flags;
	LPTSTR        lpstrFindWhat;
	LPTSTR        lpstrReplaceWith;
	WORD         wFindWhatLen;
	WORD         wReplaceWithLen;
	LPARAM        lCustData;
	LPFRHOOKPROC lpfnHook;
	LPCTSTR       lpTemplateName;
}*/


// used when pasting into a list
// subclasses must override
CWListRowItem* CWListRowItem::getCopy()
{
return NULL;
	// this won't work because we can give a parameter (this) to the CreateObject()
	/*CObject* pObject =  this->GetRuntimeClass()->CreateObject();
	ASSERTX(pObject);
	ASSERTX( pObject->IsKindOf( this->GetRuntimeClass() ));
	return (CWListRowItem*) pObject;
	*/
}


// COPY CONSTRUCTOR
CWListComment::CWListComment(const CWListComment * pCopy)
: CWListRowItem(pCopy),
	CString(*pCopy),
	m_pOwner(pCopy->m_pOwner),
	m_iShowInColumn(pCopy->m_iShowInColumn)
{
}

// COPY CONSTRUCTOR
CWListRowItem::CWListRowItem(const CWListRowItem * pCopy)
: m_bEnabled(pCopy->m_bEnabled),
	m_pOwningList(pCopy->m_pOwningList)
{

}

// COPY CONSTRUCTOR
CWListEntry::CWListEntry(const CWListEntry * pCopy)
: CWListRowItem(pCopy)
{

}

//called after an in-place edit of the list view
void CWListComment::setText(int iColumn, LPCTSTR lpszStr)
{
	 ASSERTX (m_iShowInColumn == iColumn);
	 *this = lpszStr;
}


void CStringEnvironment::setText(int iColumn, LPCTSTR lpszStr)
{
	if(m_iShowInColumn == iColumn)
		 setEnvString(lpszStr);
}

// maybe do some parsing some day
void CStringEnvironment::setEnvString(LPCTSTR pszStr)
{
	CString x = pszStr;

	// ensure that we start with some kind of slash
	x.TrimLeft();
	if(x.GetLength() >= 2) // make sure this check is safe
	{
		if (! ( (x[0] == '/')
				|| (x[0] == '+' && x[1] == '/')
				|| (x[0] == '&' && x[1] == '/')
			   )
			)
		{
			x.Insert(0,"/");
		}
	}
	m_sEnv = pszStr;
}

// virtual
int CWListEntry::getIconIndex() const
{
	return 0;
}

// used to write column widths
CString CWList::getPrefsField()
{
	CString s;
	s = "VER0 ";	// which version of this field
	for(int i=0; i< m_iNumColumns; i++)
	{
		CString n;

		// the first time a list is created, it won't have column widths until it is shown
		if(m_iColumnWidths.GetSize() <= i)
			n.Format("0 ");
		else
			n.Format("%d ", m_iColumnWidths[i]);
		s+= n;
	}
	return s;
}

void CWList::readPrefsField(CString &sField)
{
	CParseStream stream(sField);

	if(!stream.swallow("VER0 "))
		return;	// just loose these prefs
	LONG width;
	for(int i=0; i< m_iNumColumns; i++)
	{
		if(!stream.getLong(&width))
			return;	// just loose these prefs
		m_iColumnWidths.SetAtGrow(i, int(width));
	}
}

// jdh 6/3/99 Created
CWTest* CWTestList::findTestWithLabel(LPCTSTR lpszLabel)
{
	for(int i=0; i< m_pEntries.GetSize(); i++)
		if(m_pEntries.GetAt(i)->IsKindOf(RUNTIME_CLASS(CWTest)))
			if(((CWTest*)m_pEntries.GetAt(i))->getLabel() == lpszLabel)
				return (CWTest*)m_pEntries.GetAt(i);

	return NULL; // not found
}

CWListEntry* CWList::getEntry(int index)
{
	return m_pEntries[index];
}

#ifndef hab218
void CWAllomorphSelectionList::insertColumns(CListCtrl &clc)
{
	insertColumn(clc, "Infix Location", 100);
	insertColumn(clc, "Type", 50);
	insertColumn(clc, "Morphname", 150);
	insertColumn(clc, "Allomorph",	100);
}

// COPY CONSTRUCTOR
CWAllomorphSelection::CWAllomorphSelection(const CWAllomorphSelection *pCopy)
:	CWListEntry(pCopy),
	m_sShape(pCopy->m_sShape),
	m_sMorphName(pCopy->m_sMorphName),
	m_sType(pCopy->m_sType),
	m_sInfixContext(pCopy->m_sInfixContext)
{
}

IMPLEMENT_DYNAMIC(CWAllomorphSelection, CWListEntry);

CWAllomorphSelection::CWAllomorphSelection(CString& sShape,CString& sMorphName,
					   CString& sType,
					   CString& sInfixContext)
: CWListEntry(TRUE),
  m_sShape(sShape),
  m_sMorphName(sMorphName),
  m_sType(sType),
  m_sInfixContext(sInfixContext)
{
}

// called by CWListView::OnGetdispinfo
CString CWAllomorphSelection::getText(int iColumn)
{
  switch(iColumn)
	{
	case 0: return m_sShape;
	  break;
	case 1: return m_sMorphName;
	  break;
	case 2: return m_sType;
	  break;
	case 3: return m_sInfixContext;
	  break;
	default: ASSERTX(FALSE);
	  return m_sShape;
	  break;
	}
}
CWListEntry* CWAllomorphSelectionList::createNewEntry(int iKind)
{
	return new CWAllomorphSelection;
}

BOOL CWAllomorphSelectionList::getUseLangFontInColumn(int iColumn) const
{
   switch (iColumn)
	 {
	 case 0:
	 case 3:
	   return TRUE;
	 case 1:
	   return m_pTDI->m_bShowMorphnamesInLangFont;
	 case 2:
	   return FALSE;
	 }
   return FALSE;
}

#endif // hab218
