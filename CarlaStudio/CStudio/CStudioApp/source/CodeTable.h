///////////
// 1.7a1 06-Dec-1999 hab Fix (I hope) bug which would output both \unified
//                       and \affix \root in code table when creating a
//                       language from scratch.
// 2.1.5 28-Mar-2000 hab Root dict codes have no orderclass; affix ones have no root gloss


#pragma once

#include "CWModel.h"
#include "CWAtomicTypes.h"
#include <afxtempl.h>

class ofstream;
class SFMFile;
class CWFormTopic;

class CGate: public CObject
{
	public:
		CGate(char cGate, LPCTSTR lpszLabel, LPCTSTR lpszDefaultMarker, bool bRequired=FALSE);
		~CGate();
		void write(ofstream& fout, BOOL bHaveThisType);
		void addFromFile(LPCTSTR lpszMarker);
		void addToGroup(CWGroup& rGroup);
		void setToDefault();
		char m_cGate;
		bool m_bRequired;
		CTypedPtrArray<CPtrArray, CWMarker*> m_markers;
	protected:
		CString m_sLabel;
		CString m_sDefault;
};

class CWCodeSet: public CObject
{
public:
	CString getFirstMarkerForGate(char cGate) const;
	virtual void appendToFile(ofstream& fout, LPCTSTR lpzType, BOOL bHaveThisType);
	virtual void populateWithDefaults();
	void populateInterface();
	virtual void addSelfToTopic(CWFormTopic* pTopic);
	CWCodeSet();
	~CWCodeSet();
	CString loadFromFile(SFMFile &sfmFile, CString& sRecordMarker);
	CWMarker m_record;
	void loadOneMapping(CString& field);
	CTypedPtrArray<CPtrArray, CGate*> m_gates;

protected:
	static void writeMapping(ofstream & fout, CGate& sMarker, char sGate);
	virtual BOOL assignMapping(char cGate, CString &sCode);
	CWGroup m_requiredCodesGroup;
	CWGroup m_optionalCodesGroup;
};


class CWUnifiedCodeSet: public CWCodeSet
{
	public:
		CWUnifiedCodeSet();
protected:
};

#ifndef hab215
class CWAffixCodeSet: public CWCodeSet
{
	public:
		CWAffixCodeSet();
protected:
};

class CWRootCodeSet: public CWCodeSet
{
	public:
		CWRootCodeSet();
protected:
};
#endif // hab215

#ifndef hab215
class CWInfixCodeSet: public CWAffixCodeSet
#else // hab215
class CWInfixCodeSet: public CWCodeSet
#endif // hab215
{
	public:
		CWInfixCodeSet();
protected:
};

class CWCodeTable : public CWModel
{
public:
	void populateWithDefaults();
	CWCodeTable();
	BOOL loadFromFile(LPCTSTR lpszPathName, char cCommentChar);

	CWUnifiedCodeSet m_unifiedSet;
#ifndef hab215
	CWAffixCodeSet m_prefixSet;
	CWRootCodeSet m_rootSet;
	CWAffixCodeSet m_suffixSet;
#else // hab215
	CWCodeSet m_prefixSet;
	CWCodeSet m_rootSet;
	CWCodeSet m_suffixSet;
#endif // hab215
	CWInfixCodeSet m_infixSet;
#ifndef hab17a1
	BOOL writeFile(CString& sPath, BOOL bHavePrefixes, BOOL bHaveInfixes, BOOL bHaveSuffixes, BOOL bUsingUnifiedDicts);
#else //hab17a1
	BOOL writeFile(CString& sPath, BOOL bHavePrefixes, BOOL bHaveInfixes, BOOL bHaveSuffixes);
#endif //hab17a1

protected:
};
