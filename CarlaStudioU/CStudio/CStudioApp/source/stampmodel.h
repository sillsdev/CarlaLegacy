// StampModel.h: interface for the CSentransModel class.
//
//	jdh 8/27/99 added andy's fix to change xfer rule's comment column on the default contructor
// 1.7a1 03-Dec-1999 hab Add Synthesis lexical changes
//                       Fix regular sound change
//////////////////////////////////////////////////////////////////////

#pragma once

#include "CWModel.h"
#include "CWAtomicTypes.h"
#include "fstream.h"

class CStampTransferFlag: public CWListEntry
{
	public:
		virtual int getIconIndex() const;
		CStampTransferFlag() : CWListEntry(TRUE){}
		CStampTransferFlag(LPCTSTR lpszField, BOOL bEnabled, char cCommentChar);
		virtual CWListRowItem* getCopy();
		CStampTransferFlag(const CStampTransferFlag *pCopy);
		virtual CString getText(int iColumn);
		virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew=FALSE);
		virtual void write(ostream& fout, char cCommentChar) const;
	protected:
		CString m_sMorphemes;
		CString m_sFlag;
		CString m_sComments;
};

#define STAMP_TRANSFER_RULE_ENVIRONCOLUMN 4

class CStampTransferRule: public CWEnvironConstrainedRule
{
	protected:
		enum {kSTRSub, kSTRCopy, kSTRInsert}; // types
	public:

		// hab changed this ot the following  // CStampTransferRule() : m_iType(kSTRSub), m_sFrom(""), m_sTo(""), CWEnvironConstrainedRule(2, TRUE) { m_lcComments.m_iShowInColumn = 3;}
		CStampTransferRule() : m_iType(kSTRSub), m_sFrom(_T("")), m_sTo(_T("")), CWEnvironConstrainedRule(STAMP_TRANSFER_RULE_ENVIRONCOLUMN, TRUE) { m_lcComments.m_iShowInColumn = STAMP_TRANSFER_RULE_ENVIRONCOLUMN + 1;}

		CStampTransferRule(		LPCTSTR lpszMarker,
											LPCTSTR lpszField,
											 BOOL bEnabled,
											 char cCommentChar);
		virtual CWListRowItem* getCopy();
		CStampTransferRule(const CStampTransferRule *pCopy);
		virtual CString getText(int iColumn);
		virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew=FALSE);
		virtual void write(ostream& fout, char cCommentChar) const;
	protected:
		CString m_sFlags;
		CString m_sFrom, m_sTo;
		int m_iType;
};



// this holds both transfer rules and flag declarations.
// note the we don't have to specify either, since they
// are held in the ?? member of CWList
class CStampTransferExpressionList : public CWList
{
	public:
		CStampTransferExpressionList(const CTextDisplayInfo* pTDI)
			: CWList(	5,
						0,
						pTDI,
						0,
						MORPH_IN_COL(1)+MORPH_IN_COL(2)+MEC_IN_COL(4),/*morpheme columns*/
						5) // comment col
					{};
		virtual void insertColumns(CListCtrl &clc);
		virtual CString getSecondaryEntryTypeDisplayName() const {return _T("Flag");};
		virtual BOOL haveSecondaryEntryType() const {return TRUE;}
	protected:
		virtual const CString getDisplayName() const;
		virtual CWListEntry* createNewEntry(int iKind) {if(iKind==1) return new CStampTransferFlag; else return new CStampTransferRule;}
};


class CStampLexChange: public CWEnvironConstrainedRule
{
	public:
		enum{kEnvironColumn = 2};
		CStampLexChange() : m_sFrom(_T("")), m_sTo(_T("")), CWEnvironConstrainedRule(kEnvironColumn, TRUE) { m_lcComments.m_iShowInColumn = kEnvironColumn+1;}
		CStampLexChange(	LPCTSTR lpszField,
							BOOL bEnabled,
							char cCommentChar);
		virtual CWListRowItem* getCopy();
		CStampLexChange(const CStampLexChange *pCopy);
		virtual CString getText(int iColumn);
		virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew=FALSE);
		virtual void write(ostream& fout, char cCommentChar) const;
	protected:
		CString m_sFrom, m_sTo;
};

class CStampLexChangeList : public CWList
{
	public:
#ifndef hab17a1
		CStampLexChangeList(const CTextDisplayInfo* pTDI, BOOL bDoingSynthesis = FALSE)
			: m_bDoingSynthesis(bDoingSynthesis),
				  CWList(	4,
						0,
						pTDI,
						0,
						MORPH_IN_COL(0)+MORPH_IN_COL(1)+MEC_IN_COL(2),
						3)// comment col
						{};
#else // hab17a1
		CStampLexChangeList(const CTextDisplayInfo* pTDI)
			: CWList(	4,
						0,
						pTDI,
						0,
						MORPH_IN_COL(0)+MORPH_IN_COL(1)+MEC_IN_COL(2),
						3)// comment col
						{};
#endif // hab17a1
		virtual void insertColumns(CListCtrl &clc);
	protected:
		virtual const CString getDisplayName() const;
		virtual CWListEntry* createNewEntry(int iKind) {return new CStampLexChange;}
#ifndef hab17a1
		BOOL m_bDoingSynthesis;
#endif // hab17a1
};


class CRegSoundChange: public CWEnvironConstrainedRule
{
	public:
#ifndef hab17a1
		enum{kEnvironColumn = 3};
		CRegSoundChange() : m_sFrom(_T("")), m_sTo(_T("")), m_sRscIds(_T("")), CWEnvironConstrainedRule(kEnvironColumn, TRUE) { m_lcComments.m_iShowInColumn = kEnvironColumn+1;}
#else
		enum{kEnvironColumn = 2};
		CRegSoundChange() : m_sFrom(_T("")), m_sTo(_T("")), CWEnvironConstrainedRule(kEnvironColumn, TRUE) { m_lcComments.m_iShowInColumn = kEnvironColumn+1;}
#endif // hab17a1
		CRegSoundChange(	LPCTSTR lpszField,
							BOOL bEnabled,
							char cCommentChar);
		virtual CWListRowItem* getCopy();
		CRegSoundChange(const CRegSoundChange *pCopy);
		virtual CString getText(int iColumn);
		virtual BOOL doEditDialog(CListCtrl& clc, BOOL bIsNew=FALSE);
		virtual void write(ostream& fout, char cCommentChar) const;
	protected:
		CString m_sFrom, m_sTo;
#ifndef hab17a1
		CString m_sRscIds;
#endif // hab17a1
};

class CRegSoundChangeList : public CWList
{
	public:
#ifndef hab16a3
		CRegSoundChangeList(const CTextDisplayInfo* pTDI)
			:CWList(5, 0, pTDI,
			STRING_IN_COL(0)+STRING_IN_COL(1)+STRING_IN_COL(2)+STRING_IN_COL(3),
			NULL, // JDH 5/26/99 fixed bug where this param was missing
			4)//comment col
			{}
#else // hab16a3
		CRegSoundChangeList(const CTextDisplayInfo* pTDI)
			:CWList(4, 0, pTDI,
			STRING_IN_COL(0)+STRING_IN_COL(1)+STRING_IN_COL(2),
			NULL, // JDH 5/26/99 fixed bug where this param was missing
			3)//comment col
			{}
#endif // hab16a3
		virtual void insertColumns(CListCtrl &clc);
	//	virtual BOOL getUseLangFontInColumn(int iColumn) const {return iColumn<3;}
		virtual int  getEnvironmentType() const {return kStringEnv;}
	protected:
		virtual const CString getDisplayName() const {return _T("Regular Sound Change");}
		virtual CWListEntry* createNewEntry(int iKind) {return new CRegSoundChange;}
};

class CStampTransferModel : public CWModel
{
public:
	DECLARE_DYNAMIC(CStampTransferModel);
	CStampTransferModel(const CTextDisplayInfo* pTDI);
	virtual ~CStampTransferModel();

	// i'm confused about this being here...
	//	virtual BOOL haveEnvironments(){return TRUE;};

	BOOL writeFile(CString & sPath, CWCommonModel& commonModel);

	BOOL loadFromFile(LPCTSTR lpszPathName, CWCommonModel& commonModel, BOOL bLogIfMissing);

	CStampTransferExpressionList m_transferExpressions;
	CStampLexChangeList m_lexChanges;
};


class CStampSynthesisModel : public CWModel
{
public:
	DECLARE_DYNAMIC(CStampSynthesisModel);
	CStampSynthesisModel(const CTextDisplayInfo* pTDI);
	virtual ~CStampSynthesisModel();

	// i'm confused about this being here...
	//	virtual BOOL haveEnvironments(){return TRUE;};

	BOOL writeFile(CString & sPath, CWCommonModel& commonModel);

	BOOL loadFromFile(LPCTSTR lpszPathName, CWCommonModel& commonModel, BOOL bLogIfMissing);

#ifndef hab16a3
	CStampLexChangeList m_lexChanges;
#else
//	CStampLexChangeList m_lexChanges;
#endif // hab16a3
	CWString m_protoformChars;
	CRegSoundChangeList m_regSoundChanges;
	CWTestList m_tests;
};
