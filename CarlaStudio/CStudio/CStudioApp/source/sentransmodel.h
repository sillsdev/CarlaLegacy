// SentransModel.h: interface for the CSentransModel class.
//
//	jdh 8/27/99 added andy's fix to change xfer rule's comment column on the default contructor
//	jdh 11/9/99 added support for Sentrans \CL field (generic classes)
// 1.7a1 03-Dec-1999 hab Added Ctrl-L keyboard notice to Directive menu item
// jdh 5/29/01	added support for \pat field
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_SENTRANSMODEL_H__D2489341_2252_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_SENTRANSMODEL_H__D2489341_2252_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#include "CWModel.h"
#include "CWAtomicTypes.h"
#include "fstream.h"


class CSentransDirective: public CWListEntry
{
	public:
		virtual int getIconIndex() const;
		enum{kLimit, kBeginRuleSet, kEndRuleSet, kRulesOn, kRulesOff};
		CSentransDirective() : m_iType(kLimit), m_iLimit(4), CWListEntry(TRUE) {}
		CSentransDirective(int iType, LPCTSTR lpszField, BOOL bEnabled, char cCommentChar);
		CWListRowItem* getCopy();
		CSentransDirective(const CSentransDirective *pCopy);
		virtual CString getText(int iColumn);
		virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew=FALSE);
		virtual void write(ostream& fout, char cCommentChar) const;

	protected:
		int m_iType;
		int m_iLimit;
		CString m_sComments;
};

#define SENTRANS_DISAMBIG_RULE_ENVIRONCOLUMN 2

class CSentransDisambigRule: public CWEnvironConstrainedRule
{
	public:
		virtual int getIconIndex() const;
		 CSentransDisambigRule(const CSentransDisambigRule*);
		virtual CWListRowItem* getCopy();
//	virtual const CString& getDisplayName() const;
		virtual BOOL doFindReplace(FINDREPLACE * pFR);
		CSentransDisambigRule() : m_bAccept(TRUE), m_bUnanimousEnvirons(TRUE), CWEnvironConstrainedRule(2, TRUE) { m_lcComments.m_iShowInColumn = 3;}
		CSentransDisambigRule(LPCTSTR lpszField, BOOL bAccept, BOOL bEnabled,BOOL bUnanimousEnvirons,  char cCommentChar);
		virtual CString getText(int iColumn);
		virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew=FALSE);
		virtual void write(ostream& fout, char cCommentChar) const;

	protected:
		BOOL m_bUnanimousEnvirons;
		CString m_sMembers;
		BOOL m_bAccept;	// if false, reject
};

class CSentransDisambigList : public CWList
{
	public:
		CSentransDisambigList(const CTextDisplayInfo* pTDI)
			: CWList(	4,
						CBEdit(1)+CBEdit(2)+CBEdit(3),
						pTDI,
						0,
						MORPH_IN_COL(1)+MEC_IN_COL(SENTRANS_DISAMBIG_RULE_ENVIRONCOLUMN),/*morpheme column*/
						3) // comment col
						{};
		virtual void insertColumns(CListCtrl &clc);
		virtual BOOL haveSecondaryEntryType() const {return TRUE;}
#ifndef hab17a1
		virtual CString getSecondaryEntryTypeDisplayName() const {return "Directive\tCtrl+L";};
#else // hab17a1
		virtual CString getSecondaryEntryTypeDisplayName() const {return "Directive";};
#endif // hab17a1

	protected:
		virtual CWListEntry* createNewEntry(int iKind) {if(iKind==1) return new CSentransDirective; else return new CSentransDisambigRule;}
		virtual const CString getDisplayName() const;
};

#define SENTRANS_TRANSFER_RULE_ENVIRONCOLUMN 1

class CSentransTransferRule: public CWEnvironConstrainedRule
{
	public:
		virtual int getIconIndex() const;
//	virtual const CString& getDisplayName() const;
		CWListRowItem* getCopy();
		CSentransTransferRule(const CSentransTransferRule *pCopy);

		//hab changed to following line for 1.08 //CSentransTransferRule() : m_sFrom(""), m_sTo(""), CWEnvironConstrainedRule(SENTRANS_TRANSFER_RULE_ENVIRONCOLUMN, TRUE) { m_lcComments.m_iShowInColumn = 3;}
		CSentransTransferRule() : m_sFrom(""), m_sTo(""), CWEnvironConstrainedRule(SENTRANS_TRANSFER_RULE_ENVIRONCOLUMN, TRUE) { m_lcComments.m_iShowInColumn = SENTRANS_TRANSFER_RULE_ENVIRONCOLUMN + 1;}

		CSentransTransferRule(LPCTSTR lpszField, BOOL bEnabled, char cCommentChar);
		virtual CString getText(int iColumn);
		virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew=FALSE);
		virtual void write(ostream& fout, char cCommentChar) const;
	protected:
		CString m_sFrom, m_sTo;
};

class CSentransTransferList : public CWList
{	// currently we can handle to rule types: \ru from>to, and \limit
	public:
		CSentransTransferList(const CTextDisplayInfo* pTDI)
			: CWList(3,
					CBEdit(1)+CBEdit(2),
					pTDI,
					0,
					MORPH_IN_COL(0)/*rule column*/+MEC_IN_COL(SENTRANS_TRANSFER_RULE_ENVIRONCOLUMN),
					2) {};
		virtual void insertColumns(CListCtrl &clc);
		virtual BOOL haveSecondaryEntryType() const {return TRUE;}
#ifndef hab17a1
		virtual CString getSecondaryEntryTypeDisplayName() const {return "Directive\tCtrl+L";};
#else // hab17a1
		virtual CString getSecondaryEntryTypeDisplayName() const {return "Directive";};
#endif // hab17a1

	protected:
		virtual const CString getDisplayName() const;
		//virtual CWListEntry* createNewEntry() {return new CSentransTransferRule;}
		virtual CWListEntry* createNewEntry(int iKind) {if(iKind==1) return new CSentransDirective; else return new CSentransTransferRule;}
};

class CSentransModel : public CWModel
{
public:
	DECLARE_DYNAMIC(CSentransModel);
	CSentransModel(const CTextDisplayInfo* pTDI);
	virtual ~CSentransModel();

	virtual int  getEnvironmentType() const {return kMorphEnv;}
	void writeHeader(ostream& fout, CWCommonModel& commonModel);
	CWString m_sPunctuation;
	CWString m_sSentencePunctuation;
	CWChar	 m_cTagChar;
	CWClassList m_genericClasses;	// SENTRANS \CL field  Added jdh 11/9/99
	CWClassList m_patterns;	// SENTRANS \pat field  Added jdh 5/29/01


	BOOL loadFromFile(LPCTSTR lpszPathName, CWCommonModel& commonModel,  BOOL bLogIfMissing);
protected:
	virtual CWList* getRuleList()=0;
	virtual void addRule(CWListEntry* pEntry) {ASSERTX(FALSE);}
};


class CSentransDisambigModel : public CSentransModel
{
	public:
	DECLARE_DYNAMIC(CSentransDisambigModel);
	CSentransDisambigModel(const CTextDisplayInfo* pTDI);
	BOOL writeFile(CString & sPath, CWCommonModel& commonModel);

	CSentransDisambigList m_rules;

	protected:
		virtual void addRule(CWListEntry* pEntry) {m_rules.addItem(pEntry);}
		virtual CWList* getRuleList() {return &m_rules;}

};

class CSentransTransferModel : public CSentransModel
{
	public:
		DECLARE_DYNAMIC(CSentransTransferModel);
		CSentransTransferModel(const CTextDisplayInfo* pTDI);
		BOOL writeFile(CString & sPath, CWCommonModel& commonModel);
		CSentransTransferList m_rules;
	protected:
		virtual void addRule(CWListEntry* pEntry) {m_rules.addItem(pEntry);}
		virtual CWList* getRuleList() {return &m_rules;}

};


#endif // !defined(AFX_SENTRANSMODEL_H__D2489341_2252_11D2_A09E_E12649467D2F__INCLUDED_)
