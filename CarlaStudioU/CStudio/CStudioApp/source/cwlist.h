// 1.5a5 24-Sep-1999 hab allow user the ability to show properties in language font
// 1.5a7 20-Oct-1999 hab allow user the ability to show string and morpheme class names in language font
// 1.7a1 09-Dec-1999 hab Add test data
// 2.1.1 09-Mar-2000 hab Add CS-specific begin and end codes in data files in
//                       order to keep full line comments and test data in
//                       the correct list.
// 2.1.2 13-Mar-2000 jdh moved entryIndexToRowIndex out of 'protected'
//	        	 made rowCount() public
// 2.1.2 13-Mar-2000 hab fixed bug which would cause insertion and editing of
//                       monads to display "Edit by double-clicking message".

#ifndef __CWLIST__
#define __CWLIST__

#ifndef __AFXTEMPL_H__
#include <afxtempl.h>
#endif
#include <afxcoll.h>
#ifdef _DEBUG
#define new DEBUG_NEW
#endif

class CProjectDoc;

class CParseStream;
class CWModel;
class CWListEntry;
class CWList;
class CWEnvironConstrainedRule;
class CTextDisplayInfo;
class CEnvironmentListCtrl;

#include "CWAtomicTypes.h"	// just for CWINFONTSELECTOR
#include "iostream.h"

// everything that can be a row should subclass this.
// Full Entries may have one or more rows; if some of their attributes get their
// own rows, then those attributes should be subclasses of this too.
class CWListRowItem : public CObject
{
public:
	 CWListRowItem(const CWListRowItem* pCopy);
	virtual CWListRowItem* getCopy();
	virtual BOOL doFindReplace(FINDREPLACE * pFR);
	DECLARE_DYNAMIC(CWListRowItem);
	static void writeCommentStr(ostream& fout, const CString& sComment, char cCommentChar);
	CWListRowItem(BOOL bEnabled=TRUE) : m_pOwningList(NULL), m_bEnabled(bEnabled) {};
	int getRow(CListCtrl &clc);
	virtual CWListEntry* owningEntry()  {ASSERTX(FALSE); return NULL;};
	virtual const CString getDisplayName() const;
	virtual void deleteSelf(CListCtrl &clc, CWList* pList) {ASSERTX(FALSE);}
	//UNUSED now virtual int toggleEnabled();
	virtual CString getText(int iColumn) = 0;
	virtual void setText(int iColumn, LPCTSTR lpszStr);
	//UNUSED now virtual int getStateValue();
	virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew=FALSE);
	void setOwningList(CWList* pOwningList)  {m_pOwningList=pOwningList;}
	virtual CWList* getOwningList() const {ASSERTX(m_pOwningList); return m_pOwningList;}
	virtual void write(ostream& fout, char cCommentChar) const {fout << "\\co UNIMPLEMENTED WRITE()\n";}

	BOOL m_bEnabled;
protected:
	virtual void removeFromListCtrl(CListCtrl &clc, int iOldRowCount=NULL);
	virtual int rowCount() {return 1;}
	CFont* getLangFont();

	CWList* m_pOwningList;
};

class CWListEntry : public CWListRowItem
{
	public:
		virtual int getIconIndex() const;
		 CWListEntry(const CWListEntry* pCopy);
		DECLARE_DYNAMIC(CWListEntry);
		CWListEntry(BOOL bEnabled) :  CWListRowItem(bEnabled) {};
		virtual void deleteSelf(CListCtrl &clc, CWList* pList);
		virtual  CWListEntry*  owningEntry()  {return this;}
		virtual int addYourRowsToListCtrl(CListCtrl &clc, int iStartingRow);
		void reset(CListCtrl &clc, int iOldRowCount = NULL, int iNewStartingRow=-1);
	void doMoveToSlot(CListCtrl& clc, int iSlot);

	int getStartingRow(CListCtrl & clc);	// jdh 3/13/2000 made public
};

// these CBs were for specifying editable columns.
// however, this is currently supported for only a few items (CWMonadList), so
// I have defined the macro to say that nothing is editable.
// If I ever change this policy, then I only have to change this macro
// back.  The reason I didn't allow editing, in the end, is that it go so
// complicated to implement (make some king of setText() for 18 items)
//	that I didn't feel it was worth it at the time. (JDH Dec 98)
//#define CBEdit(x) (1<<x)
#define CBEdit(x) 0
// this one used in setting m_dwLangFontColumns
#define STRING_IN_COL(x) (1<<x)
// this one used in setting m_dwMorphnameColumns
#define MORPH_IN_COL(x) (1<<x)
#define MEC_IN_COL(x) (1<<x)

class CWList : public CObject
{
	public:
		CWListEntry* getEntry(int index);
		void readPrefsField(CString& sField);
		CString getPrefsField();

		CWList( int iNumColumns,
				DWORD dwEditableColumns,
				const CTextDisplayInfo* pTDI=NULL,
				DWORD dwLangStringColumns=NULL,	// always in lang font
				DWORD dwMorphnameColumns=NULL,	// user controls whether in lang font
#ifndef hab15a5
				// dwMorphnameColumns = 4 means pay attention to
				// pTDi->m_pTDI->m_bShowPropertiesInLangFont
#endif // hab15a5
				int nCommentColumn=-1)
			//	int nMECColumn=-1,	// future use
			//	int nSECColumn=-1)	// future use
				;
		virtual ~CWList();

#ifndef hab212
		enum{ITEMS_HAVE_DIALOG=1, SUPPORT_LIST_ENTRY_COMMENTS=2,
			   SUPPORT_LIST_ENTRY_TEST_DATAS=4};
#else //hab212
#ifndef hab17a1
		enum{ITEMS_HAVE_DIALOG=1, SUPPORT_LIST_ENTRY_COMMENTS=2,
			   SUPPORT_LIST_ENTRY_TEST_DATAS};
#else // hab17a1
		enum{ITEMS_HAVE_DIALOG=1, SUPPORT_LIST_ENTRY_COMMENTS=2};
#endif //hab17a1
#endif //hab212
		DWORD m_dwFlags;
		DWORD m_dwLangStringColumns;
		DWORD m_dwEditableColumns;
		DWORD m_dwMorphnameColumns;
		int m_nCommentColumn;

		// operations

		void moveItem(CWListEntry* pEntry, int iNewLocation);
		void retrieveHeaderParams(CListCtrl& clc);
		void restoreHeaderParams(CListCtrl& clc);
#ifndef hab211
		void write(ostream& fout, char cCommentChar, LPTSTR pszCode) const;
#else //hab211
		void write(ostream& fout, char cCommentChar) const;
#endif // hab211
		void addItem(CWListEntry* pItem);
		void removeItem(CWListEntry* pEntry);
		int insertNewItem(CListCtrl &clc, int iAfterItem, int iKind, CWListEntry* pInsertEntry=NULL);
		virtual void insertColumns(CListCtrl &clc) = 0;
		virtual void populateListCtrl(CListCtrl &clc);

		// accessors

		virtual BOOL getUseLangFontInColumn(int iColumn) const;
		const CTextDisplayInfo* getTextDisplayInfo();
		virtual CString getSecondaryEntryTypeDisplayName() const {return _T("Error");}
		virtual int  getEnvironmentType() const {return kNoEnv;}
		int getColumnCount() const  {return m_iNumColumns;}
		virtual const CString getDisplayName() const;
		virtual BOOL haveSecondaryEntryType() const {return FALSE;}
		 int rowToEntryIndex(CListCtrl &clc, int iRow);
		CFont* getLangFont();
		CFont* getUserFont();
		int getSize() const {return m_pEntries.GetSize();}
		 int entryIndexToRowIndex(CListCtrl &clc, int iEntry); // jdh 3/13/00 moved out of 'protected'
		 virtual  int rowCount() {return 1;}  	// jdh 3/13/2000 moved here from CWEnvironConstrainedRule

	protected:
		int entryToIndex(CWListEntry* pEntry);
		//CWINFONTSELECTOR m_iFontFlags;
		const CTextDisplayInfo* m_pTDI;
		int m_iNumColumns;
		CArray<int, int>  m_iColumnWidths;

		virtual CWListEntry* createNewEntry(int iKind);
		int addItemToListControl(CListCtrl &clc, int iEntry, int iStartingRow);

		void setModifiedFlag();
		void insertColumn(CListCtrl &clc, LPTSTR pszName, int iWidth, int nIconIndex=-1);

		CTypedPtrArray<CPtrArray, CWListEntry*> m_pEntries;	// note that one entry could have multiple rows, as with ortho changes

	friend class CWListView;
};


class CStringEnvironment : public CWListRowItem
{
	public:
		void setEnvString(LPCTSTR pszStr);
		virtual void setText(int iColumn, LPCTSTR lpszStr);
		virtual CWListRowItem* getCopy();
		DECLARE_DYNAMIC(CStringEnvironment);
		 CStringEnvironment(CStringEnvironment* pCopy, CWEnvironConstrainedRule* pOwner);
		virtual CWList* getOwningList() const ;
		virtual void deleteSelf(CListCtrl &clc, CWList* pList);
		virtual const CString getDisplayName() const;
		virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew=FALSE);
		virtual  CWListEntry* owningEntry() ;
		virtual CString getText(int iColumn);
//		virtual int getStateValue() {return INDEXTOSTATEIMAGEMASK(m_bEnabled?3:4);}
		CStringEnvironment(LPCTSTR lpszEnv, LPCTSTR lpszComment,
				int iShowInColumn,
				CWEnvironConstrainedRule* pOwner,
				BOOL bEnabled = TRUE,
				int iShowCommentInColumn=-1);	// default is the column after iShowInColumn
		CString m_sEnv, m_sComments;
		CWEnvironConstrainedRule* m_pOwner;
		virtual void write(ostream& fout, char cCommentChar) const;
protected:
		int m_iShowInColumn, m_iShowCommentInColumn;
};

// THIS CLASS IS NOT REALLY NEEDED, CURRENTLY, SINCE i DON'T CURRENTLY ALLOW
//  MULTIPLE COMMENTS.  SHOULD BE REMOVED IF THIS STAYS THE SAME, AND REPLACED
// BY A SIMPLE CSTRING ATTRIBUTE
class CWListComment: public CString, CWListRowItem
{
	public:
		virtual void setText(int iColumn, LPCTSTR lpszStr);
		 CWListComment(const CWListComment* pCopy);
		const CString& operator =( const CString& stringSrc ) {return CString::operator=(stringSrc);};
		CWListComment(CWListEntry* pOwner): m_pOwner(pOwner), m_iShowInColumn(-1) {};
		virtual CString getText(int iColumn);
		int m_iShowInColumn;
		virtual void write(ostream& fout, char cCommentChar) const;

		CWListEntry* m_pOwner;
};

// this is an abstract class which has subclasses that have a
//  rule followed by a series of environment raints.
//  Subclasses include CWOrthoChange and CWMCC
class CWEnvironConstrainedRule: public CWListEntry
{
	public:
		 CWEnvironConstrainedRule(const CWEnvironConstrainedRule* pCopy);
		DECLARE_DYNAMIC(CWEnvironConstrainedRule);
		int getEnvironmentCount() const;
		void removeEnvironment(CStringEnvironment* pEnv);
		int insertEnviron(CListCtrl &clc, CStringEnvironment* pInsertEnv=NULL);
		virtual int  getEnvironmentType() const {return kMorphEnv;} // default to morph
		void addDisabledEnvironment(CString& sField, char cCommentChar);
		virtual int addYourRowsToListCtrl(CListCtrl &clc, int iStartingRow);
		CWEnvironConstrainedRule(int iColumnForEnv, BOOL bEnabled)
				:m_lcComments((CWListEntry*)NULL),
				m_iColumnForEnv(iColumnForEnv),
				m_iColumnForEnvComment(-1), // means use default
				CWListEntry(bEnabled) {m_lcComments.m_pOwner = this;};	// can't be done ni the initializer list};

		// where comment column isn't immediately after the environ column
		CWEnvironConstrainedRule(int iColumnForEnv, int iColumnForEnvComment, BOOL bEnabled)
				:m_lcComments((CWListEntry*)NULL),
				m_iColumnForEnv(iColumnForEnv),
				m_iColumnForEnvComment(iColumnForEnvComment),
				CWListEntry(bEnabled) {m_lcComments.m_pOwner = this;};	// can't be done ni the initializer list};

		virtual CString getEnvironmentText(int iColumn);
		virtual CString getCommentText(int iColumn);
		virtual  int rowCount();  	// jdh 3/13/2000 made public and available on the base class too

		~CWEnvironConstrainedRule();
	protected:
//		virtual CWListRowItem* getCopy();
		virtual void write(ostream& fout, char cCommentChar) const;
		void parseAfterRuleStuff(CParseStream& stream, BOOL bEnabled);

		CWListComment m_lcComments;
		int m_iColumnForEnv, m_iColumnForEnvComment;
		CTypedPtrArray<CPtrArray, CStringEnvironment*> m_environments;

		friend CEnvironmentListCtrl;

};

class CWOrthoChange : public CWEnvironConstrainedRule
{
	public:
//	virtual const CString getDisplayName() const;
		CWListRowItem* getCopy();
		CWOrthoChange(const CWOrthoChange *pCopy);
		CWOrthoChange() : CWEnvironConstrainedRule(2, TRUE) { m_lcComments.m_iShowInColumn = 3;}
		CWOrthoChange(CString& sField, BOOL bEnabled, char cCommentChar);
		virtual CString getText(int iColumn);
		virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew=FALSE);
		virtual void write(ostream& fout, char cCommentChar) const;
	protected:
		CString m_sFrom;
		CString m_sTo;
};

class CWOrthoChangeList : public CWList
{
	public:
		CWOrthoChangeList(const CTextDisplayInfo* pTDI);
		//virtual BOOL getUseLangFontInColumn(int iColumn) const {return iColumn==0 || iColumn==1 ||iColumn==2;}
		virtual int  getEnvironmentType() const {return kStringEnv;}
	//	void addChange(CWOrthoChange* pChange);
		virtual void insertColumns(CListCtrl &clc);

	protected:
		virtual const CString getDisplayName() const;
		virtual CWListEntry* createNewEntry(int iKind) {return new CWOrthoChange;}

};

class CWMCC : public CWEnvironConstrainedRule
{
	public:
	//virtual const CString getDisplayName() const;
		CWMCC() : CWEnvironConstrainedRule(1, TRUE){};
		CWMCC(CString& sField, BOOL bEnabled, char cCommentChar);
		CWListRowItem* getCopy();
		CWMCC(const CWMCC *pCopy);
		virtual CString getText(int iColumn);
		virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew=FALSE);
		virtual void write(ostream& fout, char cCommentChar) const;
	protected:
		CString m_sMembers;
};

class CWMCCList : public CWList
{
	public:
		CWMCCList(const CTextDisplayInfo* pTDI)
			:CWList(3,
					CBEdit(0)+CBEdit(1)+CBEdit(2),
					pTDI,
					0,
					MORPH_IN_COL(0)+MEC_IN_COL(1),
					2) // comment column
			{};
		virtual int  getEnvironmentType() const {return kMorphEnv;}
//		void addMCC(CWMCC* pMCC) { m_pEntries.Add(pMCC);}
		virtual void insertColumns(CListCtrl &clc);
	protected:
		virtual const CString getDisplayName() const;
		virtual CWListEntry* createNewEntry(int iKind) {return new CWMCC;}
};


class CWClass : public CWListEntry
{
	public:
		CWClass() : CWListEntry(TRUE){}
		CWClass(CString& sField, BOOL bEnabled, char cCommentChar);
		CWListRowItem* getCopy();
		CWClass(const CWClass *pCopy);
		virtual  CString getText(int iColumn);
		virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew);
		virtual void setText(int iColumn, LPCTSTR lpszStr);
	protected:
		CString m_sLabel;
		CString m_sContents;
		CString m_sComments;
//	friend ostream& operator <<( ostream& fout, const CWClass& aClass );
	virtual void write(ostream& fout, char cCommentChar) const;
};

// used for category classes, string classe, etc.
class CWClassList : public CWList
{
	public:
		BOOL m_bContentsAreStrings;
		BOOL m_bContentsAreMorphnames;
		CWClassList(LPCTSTR lpszDisplayName, LPCTSTR lpszSFMCode,
			BOOL bContentsAreStrings=FALSE,
			BOOL bContentsAreMorphnames=FALSE,
#ifndef hab15a7
			const CTextDisplayInfo* pTDI=NULL,	// null means is doesn't contain vernacular characters
						int iCol= 0)
#else
			const CTextDisplayInfo* pTDI=NULL)	// null means is doesn't contain vernacular characters
#endif // hab15a7
			:	//m_iColumnInLangFont(bShowContentsInLangFont?1:-1),
				m_sDisplayName(lpszDisplayName),
				m_sSFMCode(lpszSFMCode),
				m_bContentsAreStrings(bContentsAreStrings),
				m_bContentsAreMorphnames(bContentsAreMorphnames),
				CWList(	3,
						CBEdit(0)+CBEdit(1)+CBEdit(2),
						pTDI,
						bContentsAreStrings?STRING_IN_COL(1):NULL,
#ifndef hab15a7
						iCol,
#else
						bContentsAreMorphnames?MORPH_IN_COL(1):NULL,
#endif // hab15a7
						2)// comment
						{}
		virtual const CString getDisplayName() const {return m_sDisplayName;}
		virtual void insertColumns(CListCtrl &clc);
		CString getSFMCode() const {return m_sSFMCode;}
		//virtual BOOL getUseLangFontInColumn(int iColumn) const {return iColumn==m_iColumnInLangFont;}
	protected:
		//int m_iColumnInLangFont;
		CString m_sDisplayName, m_sSFMCode;
		virtual CWListEntry* createNewEntry(int iKind) {return new CWClass;}
};

class CWTest : public CWListEntry
{
	public:
		DECLARE_DYNAMIC(CWTest);	// jdh 6/3/99 added
		virtual  BOOL doFindReplace(FINDREPLACE * pFR);
		CWTest() : CWListEntry(TRUE) {}
		CWListRowItem* getCopy();
		CWTest(const CWTest *pCopy);
		virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew=FALSE);
		CWTest(CString& sField, BOOL bEnabled, char cCommentChar);
		virtual CString getText(int iColumn);
	//	virtual const CString getDisplayName() const {return CString("Test");}
		virtual void write(ostream& fout, char cCommentChar) const;
		virtual CString getLabel() {return m_sLabel;} // jdh 6/3/99
	protected:
		CString m_sLabel;
		CString m_sContents;
		CString m_sDescription;
};

class CWTestList : public CWList
{
	public:
		CWTest* findTestWithLabel(LPCTSTR lpszLabel);
		CWTestList(LPCTSTR lpszSFMCode, 	const CTextDisplayInfo* pTDI)
			: CWList(2,CBEdit(0)+CBEdit(1), pTDI, 0, 0, 1),
			m_sSFMCode(lpszSFMCode) {};
		virtual void insertColumns(CListCtrl &clc);
		virtual const CString getDisplayName() const {static CString sName(_T("Test")); return sName;}
		CString getSFMCode() const {return m_sSFMCode;}

protected:
	virtual CWListEntry* createNewEntry(int iKind);
	CString m_sSFMCode;
};




class CWCompoundRootPair : public CWListEntry
{
	public:
		CWCompoundRootPair() : CWListEntry(TRUE){}
		CWCompoundRootPair(CString& sField, BOOL bEnabled, char cCommentChar);
		CWListRowItem* getCopy();
		CWCompoundRootPair(const CWCompoundRootPair *pCopy);
		virtual CString getText(int iColumn);
		virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew);
		virtual void write(ostream& fout, char cCommentChar) const;
	protected:
		CString m_sFirst, m_sSecond, m_sComments;
};

// used for category classes, string classe, etc.
class CWCompoundRootPairList : public CWList
{
	public:
		CWCompoundRootPairList(	const CTextDisplayInfo* pTDI)
			: CWList(3,CBEdit(0)+CBEdit(1)+CBEdit(2), pTDI,
				0,0,
				2) // comment col
			{};
//		void addPair(CWCompoundRootPair* pPair) { m_pEntries.Add(pPair);}
		virtual void insertColumns(CListCtrl &clc);
		const CString getDisplayName() const;
	protected:
		virtual CWListEntry* createNewEntry(int iKind) {return new CWCompoundRootPair;}
};

class CWAdhocPair : public CWListEntry
{
	public:
		CWAdhocPair() : CWListEntry(TRUE), m_cTypeOfSecondMorpheme('p') {}
		  CWAdhocPair(CString& sMarker, CString& sField, BOOL bEnabled, char cCommentChar);
		CWListRowItem* getCopy();
		CWAdhocPair(const CWAdhocPair *pCopy);
		virtual CString getText(int iColumn);
		virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew);
		virtual void write(ostream& fout, char cCommentChar) const;
	protected:
		CString m_sFirst, m_sSecond, m_sComments;
		TCHAR m_cTypeOfSecondMorpheme;
};


// used for category classes, string classe, etc.
class CWAdhocPairList : public CWList
{
	public:
		CWAdhocPairList(const CTextDisplayInfo* pTDI)
			: m_pTDI(pTDI),
			CWList(	4,
						CBEdit(0)+CBEdit(1)+CBEdit(3),
						pTDI,
						0,	// other lang font columns
						MORPH_IN_COL(0)+MORPH_IN_COL(1),
						3) // comment col
						{};
//		void addPair(CWAdhocPair* pPair)  {m_pEntries.Add(pPair);}
		virtual void insertColumns(CListCtrl &clc);
		virtual const CString getDisplayName() const;
		const CTextDisplayInfo* m_pTDI;
	protected:
		virtual CWListEntry* createNewEntry(int iKind) {return new CWAdhocPair;}
};

#ifndef hab218
class CWAllomorphSelection : public CWListEntry
{
	public:
		DECLARE_DYNAMIC(CWAllomorphSelection);
		CWAllomorphSelection() : CWListEntry(TRUE) {}
		CWAllomorphSelection(const CWAllomorphSelection *pCopy);
		CWAllomorphSelection(CString& sShape, CString& sMorphName,
					 CString& sType, CString& sInfixContext);
		virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew=FALSE) {return FALSE;};
		virtual CString getText(int iColumn);
		virtual CString getShape() {return m_sShape;}
	protected:
		CString m_sShape;
		CString m_sMorphName;
		CString m_sType;
		CString m_sInfixContext;
};

class CWAllomorphSelectionList : public CWList
{
	public:
		CWAllomorphSelectionList(const CTextDisplayInfo* pTDI)
			: CWList(4,0, pTDI) {};
		virtual void insertColumns(CListCtrl &clc);
		virtual const CString getDisplayName() const {static CString sName(_T("AllomorphSelection")); return sName;}
		virtual BOOL getUseLangFontInColumn(int iColumn) const;

protected:
	virtual CWListEntry* createNewEntry(int iKind);
};
#endif // hab218
#endif
