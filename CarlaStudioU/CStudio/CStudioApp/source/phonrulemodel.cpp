// PhonruleModel.cpp: implementation of the CPhonruleModel class.
//
//////////////////////////////////////////////////////////////////////

// jdh april 9, 1999 fixed missing category reading/writing from the dialog
// JDH 5/26/99 8:49:26 AM Added List Comment Capability (\co)
// 1.7a1 03-Dec-1999 hab Allow \cm for comments as well as \co
//                       Allow \td test data lines
// 2.1.1 09-Mar-2000 hab Add CS-specific begin and end codes in data files in
//                       order to keep full line comments and test data in
//                       the correct list.
// 2.1.5 28-Mar-2000 hab Root dict codes have no orderclass; affix ones have no root gloss
//	11-Sept-2001	jdh Cntrl file output now uses SafeStream to generate .bak file.

#include "stdafx.h"
#include "carlaStudioApp.h"
#include "PhonruleModel.h"
#include "DlgPhonruleRule.h"
#include "SafeStream.h"
#include "SFMFile.h"
#include "PathDescriptor.h"
#include "ParseStream.h"
#include "TextDisplayInfo.h"
#include "CodeTable.h"
#include "ListComment.h"
#ifndef hab17a1
#include "ListTestData.h"
#endif //hab17a1

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CPhonruleModel::CPhonruleModel(const CTextDisplayInfo* pTDI)
:	CWModel(_T("Phonrule")),
	m_rules(pTDI),
	m_bBaseBecomesAllomorph(_T("Base form always becomes allomorph"), TRUE),
	m_cCutoffChar(_T("Cutoff character in base form"), ' ', pTDI),
	m_sCitationMarker(_T("Citation form marker for base rules"))
{

}


CPhonruleModel::~CPhonruleModel()
{
}


BOOL CPhonruleModel::loadFromFile(LPCTSTR lpszPathName, CWCommonModel& commonModel,  BOOL bLogIfMissing)
{
	ASSERTX(lpszPathName);
	USES_CONVERSION_U8;
	SFMFile f(T2CA(lpszPathName), commonModel.m_cCommentChar);

	if(!f.ensureOpen(_T("Phonrule Rule File"), bLogIfMissing))
		return FALSE;

	char cCommentChar = commonModel.m_cCommentChar;
	m_bBaseBecomesAllomorph = FALSE; // in the abscence of the marker, this is false
#ifndef hab17a1
	CCommentOrTestDataCollector coOrTdCollector;
	BOOL bSeenPhonruleField = FALSE;
#endif //hab17a1
#ifndef hab211
	CWList * pLastList = 0;
#endif //hab211

	CString sMarker, sField;
	BOOL bEnabled;
	try
	{
		while(f.getField(sMarker, sField, &bEnabled))
		{
			try
			{
				if(sMarker == _T("scl") || sMarker == _T("ccl"))
#ifndef hab17a1
					{ // leave for the ad.ctl file
					  coOrTdCollector.removeAll();
					}
#else // hab17a1
					{} // leave for the ad.ctl file
#endif // hab17a1

				else if(sMarker == _T("pr") || sMarker == _T("pri") || sMarker == _T("prf") ||
					sMarker == _T("br") || sMarker == _T("bri") || sMarker == _T("brf") )
				{
					int iType;
					int iForceType;
					if(sMarker == _T("pr"))
					{
						iType = CPhonruleRule::kPhonological;
						iForceType = CPhonruleRule::kForceNone;
					}
					else if(sMarker == _T("pri"))
					{
						iType = CPhonruleRule::kPhonological;
						iForceType = CPhonruleRule::kForceInitial;
					}
					else if(sMarker == _T("prf"))
					{
						iType = CPhonruleRule::kPhonological;
						iForceType = CPhonruleRule::kForceFinal;
					}
					else if(sMarker == _T("br"))
					{
						iType = CPhonruleRule::kBase;
						iForceType = CPhonruleRule::kForceNone;
					}
					else if(sMarker == _T("bri"))
					{
						iType = CPhonruleRule::kBase;
						iForceType = CPhonruleRule::kForceInitial;
					}
					else if(sMarker == _T("brf"))
					{
						iType = CPhonruleRule::kBase;
						iForceType = CPhonruleRule::kForceFinal;
					}
					else ASSERTX(FALSE);

#ifndef hab17a1
					coOrTdCollector.disgorge(((CPhonruleModel*)this)->m_rules);
					bSeenPhonruleField = TRUE;
#endif // hab17a1
					CPhonruleRule *r = new CPhonruleRule(
											sField,
											bEnabled,
											cCommentChar,
											iType,
											iForceType);
					m_rules.addItem(r);
				}
				else if(sMarker == _T("base_becomes_allo"))
				{
					m_bBaseBecomesAllomorph = TRUE;
				}
				else if(sMarker == _T("cut"))
				{
					if(sField.GetLength())
					{
#if !defined(rde270) && defined(_DEBUG)
						CString str(sField[0]);
						ASSERT(strlen(T2CU8(str)) <= 1);
#endif
						m_cCutoffChar.setData((char)sField[0]);
					}
				}
				else if(sMarker == _T("ca"))
				{
#ifndef hab17a1
					// assume these are the same in ad.ctl file
				  coOrTdCollector.removeAll();
#else // hab17a1
					// assume these are the same in ad.ctl file
#endif // hab17a1
				}
				else if(sMarker == _T("b"))
					m_sCitationMarker.setData(sField);

				else if(sMarker == _T("r") || sMarker == _T("a") || sMarker == _T("c"))
				{
					// these can be determined from the code table
				}

#ifndef hab17a1
				else if(sMarker == _T("co") || sMarker == _T("cm"))
				{
					coOrTdCollector.add(sField, _T("co"));
				}
#else // hab17a1
				else if(sMarker == _T("co"))
				{
					CListEntryComment *com = new CListEntryComment(sField);
					m_rules.addItem(com);
				}
#endif // hab17a1
				else if(sMarker == _T("id"))
					{}	// skip it
				else if(sMarker == _T("_sh"))	// shoebox
				{}	// skip it
#ifndef hab17a1
				else if(sMarker == _T("td")) // 1.7a1 hab test data
				{
				  coOrTdCollector.add(sField, _T("td"));
				}
#endif //hab17a1
#ifndef hab211
				else if(sMarker == _T("CSbegca"))
				{
				  pLastList = 0; // belongs in ad file
				}
				else if(sMarker == _T("CSbegscl"))
				{
				  pLastList = 0; // belongs in ad file
				}
				else if(sMarker == _T("CSbegccl"))
				{
				  pLastList = 0; // belongs in ad file
				}
				else if(sMarker == _T("CSbegru"))
				{
				  pLastList = &m_rules;
				}
				else if(sMarker == _T("CSend")) // CS-specific section end marker
				{
				  if (pLastList)
					{ // dump any comments or test data to list
					  coOrTdCollector.disgorge(*pLastList);
					  pLastList = 0;
					}
				  else
					coOrTdCollector.removeAll();
				}
#endif //hab211
				else
				{	f.logSkip(_T("Phonrule"), sMarker, sField);
				}
			}
			catch(CString sProblemStr) // these ones we can keep going
			{
				f.logParseFailure(_T("Phonrule"), sMarker, sField);
			}
		}
	}
	catch(CString sProblemStr)// this one catches problems encountered by getField()
	{
		CString s(_T("CStudio Phonrule control file parser could not parse: "));
		s += sProblemStr;
		MessageBox( NULL, s, _T("Parsing Error"), MB_OK);
		return FALSE;
	}

#ifndef hab17a1
	if (bSeenPhonruleField)
	  {
		coOrTdCollector.defaultDisgorge(((CPhonruleModel*)this)->m_rules);
	  }

#endif // hab17a1

	return TRUE;
}

BOOL CPhonruleModel::writeFile(CString& sPath, CWCommonModel& commonModel, CWCodeTable& codeTable, BOOL bUsingUnifiedDicts)
{
	CSafeStream ssOutput(sPath);
	ofstream& fout = ssOutput.openStream();
	if(::checkForFileError(sPath) != 0)
		return FALSE;

	USES_CONVERSION_U8;
	fout << "\\id " << T2CA(getFullFileName(sPath)) << "     Phonological Rule File Created by CarlaStudio\n";
	if(m_bBaseBecomesAllomorph.isTrue())
		fout << "\\base_becomes_allo\n";
	if(!m_cCutoffChar.isEmpty())
		outputChar(fout, "cut", m_cCutoffChar);

#ifndef hab215
	// feb 99 fixed bug where this only looked at the rootset
	CWCodeSet* pSet;
	if (bUsingUnifiedDicts)
	  pSet = &codeTable.m_unifiedSet;
	else
	  pSet = &codeTable.m_rootSet;
#else // hab215 (MSC Compiler wants to convert the root to a unified with the following version)
	// feb 99 fixed bug where this only looked at the rootset
	CWCodeSet* pSet = (bUsingUnifiedDicts) ? &codeTable.m_unifiedSet:&codeTable.m_rootSet;
#endif // hab215

	CString sR = pSet->getFirstMarkerForGate('R');
	if(sR.IsEmpty())
		AfxMessageBox(_T("Under Dictionary:SFM Markers, make sure that your record marker is not blank.\nIf it is not blank, and you have at least one affix dictionary specified (Menu Language:Properties), please report this message as a bug related to Phonrule.\n"));

	fout << "\\r " << T2CU8(sR) << "\n";
	fout << "\\a " << T2CU8(pSet->getFirstMarkerForGate('A')) << "\n";
	fout << "\\c " << T2CU8(pSet->getFirstMarkerForGate('C')) << "\n";

	if(!m_sCitationMarker.isEmpty())
		fout << "\\b " << m_sCitationMarker << "\n";

	fout << "\n";
	//fout << "\\ca " << commonModel.categories << "\n\n";
#ifndef hab211
	commonModel.m_categories.write(fout, commonModel.m_cCommentChar, _T("ca"));
	commonModel.categoryClasses.write(fout, commonModel.m_cCommentChar, _T("ccl"));
	commonModel.stringClasses.write(fout, commonModel.m_cCommentChar, _T("scl"));

	m_rules.write(fout, commonModel.m_cCommentChar, _T("ru"));
#else //hab211
	commonModel.m_categories.write(fout, commonModel.m_cCommentChar);
	commonModel.categoryClasses.write(fout, commonModel.m_cCommentChar);
	commonModel.stringClasses.write(fout, commonModel.m_cCommentChar);

	m_rules.write(fout, commonModel.m_cCommentChar);
#endif //hab211
	ssOutput.close();
	return TRUE;
}

// called by CWListView::OnInitialUpdate
void CPhonruleRuleList::insertColumns(CListCtrl &clc)
{
	insertColumn(clc, _T("Comment"),	100);
	insertColumn(clc, _T("Category"),	100);
	insertColumn(clc, _T("Environment"),	100);
	insertColumn(clc, _T("To"), 100);
	insertColumn(clc, _T("From"), 100);
	insertColumn(clc, _T("Type"), 75);
}
///////////////////////////////////////////////////////////
//	CPhonruleRule
///////////////////////////////////////////////////////////


CString CPhonruleRule::getText(int iColumn)
{
	static CString s;
	switch(iColumn)
	{
		case 0: {
					switch(m_iType)
					 {
						case kPhonological: s =  _T("Phon"); break;
						case kBase: s = _T("Base"); break;
						default: ASSERTX(FALSE); break;
					 }
					switch(m_iForceType)
					{
						case kForceNone: break;
						case kForceInitial: s += _T("-I"); break;
						case kForceFinal:  s += _T("-F"); break;
					}
					return s;
				}
				break;
		 case 1: return m_sFrom;
				break;
		 case 2: return m_sTo;
				break;

		// environment column
		case PHONRULE_RULE_ENVIRONCOLUMN:  return getEnvironmentText(iColumn);
				break;

		// category column
		case PHONRULE_RULE_ENVIRONCOLUMN+1:  return m_sCategory;
				break;

		// comment column
		case PHONRULE_RULE_ENVIRONCOLUMN+2:  return getCommentText(iColumn);
				break;
		default: ASSERTX(FALSE);
					break;
	}
	return m_lcComments;
}


BOOL CPhonruleRule::doEditDialog(CListCtrl& clc, BOOL bIsNew)
{
	// 1) remember our current number of rows

	int iOldRowCount = 0;
	if(!bIsNew)
	{
		iOldRowCount = rowCount();
	}

	// 2) prepare the dialog

	CDlgPhonruleRule dlg(m_pOwningList->getTextDisplayInfo());

	// Load in all our settings
	dlg.m_bEnabled = m_bEnabled;

	dlg.setRule(this);
	dlg.m_sComments = m_lcComments;
	dlg.m_sFrom = m_sFrom;
	dlg.m_sTo = m_sTo;
	dlg.m_iRuleType = m_iType;
	dlg.m_iForceType = m_iForceType;
	dlg.m_sCategory = m_sCategory;	// jdh april 9 fixed missing category reading/writing from the dialog

	// 3) put up the dialog
	BOOL bDlgOk = dlg.DoModal();
	if(IDOK == bDlgOk)
	{

		// Reload all our settings if the user clicked 'ok'
		m_bEnabled = dlg.m_bEnabled;
		m_lcComments = dlg.m_sComments;
		m_sFrom = dlg.m_sFrom;
		m_sTo = dlg.m_sTo;
		m_iType = dlg.m_iRuleType;
		m_iForceType = dlg.m_iForceType;
		m_sCategory = dlg.m_sCategory;

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

void CPhonruleRule::write(ostream& fout, char cCommentChar) const
{
	switch(m_iType)
	 {
		case kPhonological: fout << "\\pr"; break;
		case kBase: fout <<  "\\br"; break;
		default: ASSERTX(FALSE); break;
	 }
	switch(m_iForceType)
	{
		case kForceNone: break;
		case kForceInitial: fout << "i" ; break;
		case kForceFinal:  fout << "f" ; break;
	}

	USES_CONVERSION_U8;
	if(!m_sCategory.IsEmpty())
		fout << " " << T2CU8(m_sCategory);
	fout << " " << T2CU8(m_sFrom) << " -> " << T2CU8(m_sTo) << ' ';

	CWEnvironConstrainedRule::write(fout, cCommentChar);
 }

CPhonruleRule::CPhonruleRule(	LPCTSTR lpszField,
								BOOL bEnabled,
								char cCommentChar,
								int iType,
								int iForceType)
:	m_iType(iType),
	m_iForceType(iForceType),
	CWEnvironConstrainedRule(PHONRULE_RULE_ENVIRONCOLUMN, 2+PHONRULE_RULE_ENVIRONCOLUMN, bEnabled)
{
	m_lcComments.m_iShowInColumn = 2+PHONRULE_RULE_ENVIRONCOLUMN;

	CParseStream stream(lpszField, cCommentChar);

	CString sFirst;
	THROW_STR_IF_NOT(stream.word(sFirst, TRUE), lpszField);
	if(stream.swallow(_T("->")))
		m_sFrom = sFirst;
	else
	{
		m_sCategory = sFirst;
		THROW_STR_IF_NOT(stream.word(m_sFrom, TRUE), lpszField);
		stream.swallow(_T("->"));
	}

	// the stuff after the -> can have more than one word, for adding allomorph properties
	THROW_STR_IF_NOT(stream.upTo(m_sTo,
										'/', // begining of a string environemnt
										cCommentChar, // beginning of a comment
										'\n',	// end of line
										NULL,	// not using this param
										_T("+/")), // beginning of morpheme environment
										lpszField);

	parseAfterRuleStuff(stream, TRUE);
}


  // override
// used when pasting into a list or undoing a deletion
CWListRowItem* CPhonruleRule::getCopy()
{
	CPhonruleRule* pNew = new CPhonruleRule(this);
	ASSERTX(pNew);
	return pNew;
}

// COPY CONSTRUCTOR
CPhonruleRule::CPhonruleRule(const CPhonruleRule *pCopy)
:	CWEnvironConstrainedRule(pCopy),
	m_iType(pCopy->m_iType),
	m_iForceType(pCopy->m_iForceType),
	m_sFrom(pCopy->m_sFrom),
	m_sTo(pCopy->m_sTo),
	m_sCategory(pCopy->m_sCategory)
{
}
