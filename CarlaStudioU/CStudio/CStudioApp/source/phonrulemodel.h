// PhonruleModel.h: interface for the CPhonruleModel class.
//
//////////////////////////////////////////////////////////////////////

 // jdh Apr8-99 changed the environment column from the incorrect value
	//		of '2' for the environ column to the correct constant PHONRULE_RULE_ENVIRONCOLUMN (which is 3)
// JDH 5/26/99 Added two optional params to initialization of the phonrule list


#if !defined(AFX_PHONRULEMODEL_H__408DD7A1_47C6_11D2_864E_444553540000__INCLUDED_)
#define AFX_PHONRULEMODEL_H__408DD7A1_47C6_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#include "CWModel.h"
#include "CWList.h"
class CTextDisplayInfo;
class CWCodeTable;
#define PHONRULE_RULE_ENVIRONCOLUMN 3

class CPhonruleRule : public CWEnvironConstrainedRule
{
public:
	enum {kPhonological, kBase}; // types
	enum {kForceNone, kForceInitial, kForceFinal}; // types

public:
	CPhonruleRule() : m_iForceType(kForceNone),
						//m_bBaseBecomesAllomorph(TRUE),
						m_iType(kPhonological), // jdh Apr8-99 changed from the incorrect value of '2' for the environ column to the correct constant
						CWEnvironConstrainedRule(PHONRULE_RULE_ENVIRONCOLUMN, 2+PHONRULE_RULE_ENVIRONCOLUMN, TRUE)
						{ m_lcComments.m_iShowInColumn = 2+PHONRULE_RULE_ENVIRONCOLUMN;}
	CPhonruleRule(	LPCTSTR lpszField,
					BOOL bEnabled,
					char cCommentChar,
					int iType,
					int iForceType);

	virtual CWListRowItem* getCopy();
	CPhonruleRule(const CPhonruleRule *pCopy);

	virtual CString getText(int iColumn);
	virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew=FALSE);
	virtual void write(ostream& fout, char cCommentChar) const;

protected:
	CString m_sFrom, m_sTo;
	CString m_sCategory;
	int m_iType;
	int m_iForceType;
};

class CPhonruleRuleList : public CWList
{
	public:
		CPhonruleRuleList(const CTextDisplayInfo* pTDI)
			:CWList(6,
				CBEdit(1)+CBEdit(2)+CBEdit(3)+CBEdit(5),
				pTDI,
				STRING_IN_COL(1)+STRING_IN_COL(2)+STRING_IN_COL(3),
				NULL, // jdh 5/26/99 added these two params
				5)	// comment column
				{}
		virtual void insertColumns(CListCtrl &clc);
		//virtual BOOL getUseLangFontInColumn(int iColumn) const {return iColumn==1/*from*/ || iColumn==2/*to*/ || iColumn ==3/*env*/;}
		virtual int  getEnvironmentType() const {return kStringEnv;}
	protected:
		virtual const CString getDisplayName() const {return _T("Phonology Rule");}
		virtual CWListEntry* createNewEntry(int iKind) {return new CPhonruleRule;}
};

class CPhonruleModel : public CWModel
{
public:
	CPhonruleModel(const CTextDisplayInfo* pTDI);
	virtual ~CPhonruleModel();
	BOOL loadFromFile(LPCTSTR lpszPathName, CWCommonModel& commonModel,  BOOL bLogIfMissing);
	BOOL writeFile(CString& sPath, CWCommonModel& commonModel, CWCodeTable& codeTable, BOOL bUsingUnifiedDicts);
	CPhonruleRuleList m_rules;

	CWBool m_bBaseBecomesAllomorph;
	CWChar m_cCutoffChar;
	CWMarker m_sCitationMarker;
};

#endif // !defined(AFX_PHONRULEMODEL_H__408DD7A1_47C6_11D2_864E_444553540000__INCLUDED_)
