// Change History
// 4/14/99 jdh moved some members from CWTextIn to CWCommonModel, as they are
//				needed for TextOut as well: m_cPrimaryFormatChar, m_cSecondaryFormatChar (actually not output to textout),
//				m_sWFC, m_WFCS
// 2.1.0 07-Mar-2000 hab Added Max properties
// 2.8.0 06-Dec-2004 hab Added maxInterfaces and interfix tests

#pragma once

#include "CWModel.h"
#include "CWAtomicTypes.h"
//#include <afxtempl.h>

class ofstream;
class SFMFile;
//class CWFormTopic;
class CPageAffixes;
class CPageCategoryProp;
class CPageFinalCatTest;

class CWAnalysisModel : public CWModel
{
public:
	void doModifyTestsDialog();
	void processTestPropertyPages(CPageAffixes *pPageAffixes,
					   CPageCategoryProp* pPageCatProp,
					   CPageFinalCatTest* pPageFinalCatTest);

	BOOL writeFile(CString & sPath, CWCommonModel& commonModel);
	CWAnalysisModel(CTextDisplayInfo* pTDI);
	BOOL loadFromFile(LPCTSTR lpszPathName, CWCommonModel& commonModel);
	CWInteger maxPrefixes, maxInfixes, maxInterfixes, maxSuffixes, maxRoots, maxNulls;
#ifndef hab210
	CWInteger maxProps;
#endif //hab210
	CWAdhocPairList adhocPairs;
	CWCompoundRootPairList compoundRootCatPairs;
	CWString m_sRootDelimiters; // hab 210 fix typo
	CWBool decapitalizeEntries;
	CWMCCList generalMCCs;
	CWTestList prefixTests, infixTests, interfixTests, rootTests, suffixTests, finalTests;

	// in commonModel, we store the following elements of this file:
	//		categories, allomorph properties, morpheme properties,
	//		category classes, morpheme classes, and string classes

	enum {kNoOutputCat, kOutputPrefixCat, kOutputSuffixCat};
	CWRadio m_radioCatOutput;
	//CWBool outputFinalCat, finalCatIsPrefix;
	CWBool	outputAllMorphCats;

protected:
	void removeTest(UINT id, char cType);
	void addTest(UINT id, char cType, BOOL bEnable=TRUE);
};


class CWTextInModel : public CWModel
{
public:
BOOL loadFromFile(LPCTSTR lpszPathName, CWCommonModel& commonModel, BOOL bLogIfMissing);
	BOOL writeFile(CString & sPath, CWCommonModel& commonModel);
	CWTextInModel(CTextDisplayInfo* pTDI);
//	CString m_label;

	CWString sFormatCodes;
	CWInteger iMaxDecap;
	// move to common CWChar	cMorphBreakChar;	//dsc (decomp sep char)
	CWBool  bHasUpperLowerCase;
	CWBool	bPreserveWordMedialCaps;
	///
	CWRadio		rIncludeOrExcludeMarkers;	// chooses
	CWString	sMarkersToIncludeOrExclude;	// chooses
	//
	CWOrthoChangeList	m_orthoChanges;	// ch

};
