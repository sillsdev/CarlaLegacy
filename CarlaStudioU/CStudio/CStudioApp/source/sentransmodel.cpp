// SentransModel.cpp: implementation of the CSentransModel class.
//
// JDH 5/25/99 3:20:51 PM Added List Comment Capbility (\co)
//	jdh 11/9/99 added support for Sentrans \CL field (generic classes)
//					in so-doing, had to modify the comment handling during parsing
// 1.7a1 03-Dec-1999 hab Allow \cm for comments as well as \co
//                       Allow \td test data lines
// 2.1.1 09-Mar-2000 hab Add CS-specific begin and end codes in data files in
//                       order to keep full line comments and test data in
//                       the correct list.
//	jdh  5/29/01 added support for Sentrans \pat field
//	11-Sept-2001	jdh Cntrl file output now uses SafeStream to generate .bak file.
// jdh 4/19/02	added support for Sentrans \bpunct field
// 2.6.4 28-May-2002 hab \cl and \pat were putting comments and test data in
//                       the morpheme class list.  Now they show up in the right spots.
// rde270   26-Jun-2002 Added a function to insure that sentence punctuation would be
//                      separated by at least a space between punctuation symbols.
//////////////////////////////////////////////////////////////////////


#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "SentransModel.h"
#include "SFMFile.h"
#include "SafeStream.h"
#include "PathDescriptor.h"
#include "DlgEditSentransDisambig.h"
#include "DlgEditSentransTransfer.h"
#include "DlgSentransDirective.h"
#include "ParseStream.h"
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

IMPLEMENT_DYNAMIC(CSentransModel, CWModel)

CSentransModel::CSentransModel(const CTextDisplayInfo* pTDI)
:CWModel(_T("SENTRANS")), // this label currently unused, actually
	m_sPunctuation(_T("Punctuation")),
	m_sBeginPunctuation(_T("Begining Punctuation")),
	m_sSentencePunctuation(_T("Sentence Punctuation")),
	m_cTagChar(_T("Tag Char"), '^'),	// added feb 99

	//	jdh 11/9/99 added support for Sentrans \CL field (generic classes)
	m_genericClasses(_T("Generic Class"), _T("cl"),
					TRUE, // contents are strings? (could be...)
					TRUE, // contents are morphemes? (could be...)
					pTDI),
	//	jdh  5/29/01 added support for Sentrans \pat field
	m_patterns(_T("Pattern"), _T("pat"),
					FALSE, // contents are strings? no
					TRUE, // contents are morphemes? (could be...)
					pTDI)
{

}

CSentransModel::~CSentransModel()
{

}

IMPLEMENT_DYNAMIC(CSentransDisambigModel, CSentransModel)
CSentransDisambigModel::CSentransDisambigModel(const CTextDisplayInfo* pTDI)
: CSentransModel(pTDI),
	m_rules(pTDI)
{
}

IMPLEMENT_DYNAMIC(CSentransTransferModel, CSentransModel)
CSentransTransferModel::CSentransTransferModel(const CTextDisplayInfo* pTDI)
: CSentransModel(pTDI),
m_rules(pTDI)
{
}

BOOL CSentransModel::loadFromFile(LPCTSTR lpszPathName,
								  CWCommonModel& commonModel,
								  BOOL bLogIfMissing)
{
	ASSERTX(lpszPathName);
	USES_CONVERSION_U8;
	SFMFile f(T2CA(lpszPathName), commonModel.m_cCommentChar);

	if(!f.ensureOpen(_T("Sentrans File"), bLogIfMissing))
		return FALSE;

	char cCommentChar = commonModel.m_cCommentChar;
#ifndef hab17a1
	CCommentOrTestDataCollector coOrTdCollector;
	BOOL bSeenSenTransField = FALSE; // 1.7a1 need to ignore comments from non-Sentrans specific items; using this flag to do so
#else // hab17a1
	CCommentCollector commentCollector;	// jdh 11/9/99
#endif //hab17a1

#ifndef hab211
	CWList * pLastList = 0;
#endif //hab211

	CString sMarker, sField;
	BOOL bEnabled;
	BOOL bIsDisambig = this->IsKindOf(RUNTIME_CLASS(CSentransDisambigModel));
try
	{
		while(f.getField(sMarker, sField, &bEnabled))
		{
			try
			{
				if(sMarker == _T("ru"))
				{
					if(!bIsDisambig)
					{
#ifndef hab17a1
						coOrTdCollector.disgorge(((CSentransTransferModel*)this)->m_rules);
#else // hab17a1
						commentCollector.disgorge(((CSentransTransferModel*)this)->m_rules); // jdh 11/9/99
#endif // hab17a1
						CSentransTransferRule *r = new CSentransTransferRule(sField, bEnabled, cCommentChar);
						((CSentransTransferModel*)this)->m_rules.addItem(r);
#ifndef hab17a1
						bSeenSenTransField = TRUE;
#endif // hab17a1
					}
					else
					{
						CString s(_T("SENTRANS-Disambig files can't have transfer rules."));
						f.logSkip(_T("SENTRANS-Disambig"), sMarker, sField, s);
					}
				}
#ifndef hab17a1
				else if(sMarker == _T("co") || sMarker == _T("cm"))
#else // hab17a1
				else if(sMarker == _T("co"))
#endif // hab17a1
				{
				 /*
				 // JDH 5/25/99 3:28:36 PM Added List Comment Capbility (\co)
					CListEntryComment *com = new CListEntryComment(sField);
					if(bIsDisambig)
						((CSentransDisambigModel*)this)->m_rules.addItem(com);
					else
						((CSentransTransferModel*)this)->m_rules.addItem(com);
					*/

				// jdh 11/9/99 changed to use the commentCollector because now have two lists (rules and \cl list)
#ifndef hab17a1
					coOrTdCollector.add(sField, _T("co"));
#else // hab17a1
					commentCollector.add(sField);
#endif // hab17a1
				 }
				else if(sMarker == _T("am") || sMarker == _T("rej") || sMarker == _T("reject")
						|| sMarker == _T("amun") || sMarker == _T("rejun"))
				{
					bool bAccept = (sMarker == _T("am") || sMarker == _T("amun") );
					bool bUnanimousEnvirons = (sMarker == _T("amun") || sMarker == _T("rejun"));
					if(bIsDisambig)
					{
#ifndef hab17a1
						coOrTdCollector.disgorge(((CSentransDisambigModel*)this)->m_rules);
#else // hab17a1
						commentCollector.disgorge(((CSentransDisambigModel*)this)->m_rules);
#endif // hab17a1
						CSentransDisambigRule *r = new CSentransDisambigRule(sField, bAccept, bEnabled, bUnanimousEnvirons, cCommentChar);
						((CSentransDisambigModel*)this)->m_rules.addItem(r);
#ifndef hab17a1
						bSeenSenTransField = TRUE;
#endif // hab17a1
					}
					else
					{
						CString s(_T("SENTRANS-Transfer files can't have disambiguation rules."));
						f.logSkip(_T("SENTRANS-Transfer"), sMarker, sField, s);
						//MessageBox( NULL, s, _T("Parsing Error"), MB_OK);
					}
				}

				// various SentransDirectiveTypes

				// jdh 11/9/99 todo: add commentCollector.disgorge() in each of these
				else if(sMarker == _T("..."))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(((CSentransDisambigModel*)this)->m_rules);
					bSeenSenTransField = TRUE;
#endif // hab17a1
					addRule( new CSentransDirective(CSentransDirective::kLimit, sField, bEnabled, cCommentChar));
				}
				else if(sMarker == _T("ruleset"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(((CSentransDisambigModel*)this)->m_rules);
					bSeenSenTransField = TRUE;
#endif // hab17a1
					addRule( new CSentransDirective(CSentransDirective::kBeginRuleSet, sField, bEnabled, cCommentChar));
				}
				else if(sMarker == _T("endruleset"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(((CSentransDisambigModel*)this)->m_rules);
					bSeenSenTransField = TRUE;
#endif // hab17a1
					addRule( new CSentransDirective(CSentransDirective::kEndRuleSet, sField, bEnabled, cCommentChar));
				}
				else if(sMarker == _T("ruleson"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(((CSentransDisambigModel*)this)->m_rules);
					bSeenSenTransField = TRUE;
#endif // hab17a1
					addRule( new CSentransDirective(CSentransDirective::kRulesOn, sField, bEnabled, cCommentChar));
				}
				else if(sMarker == _T("rulesoff"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(((CSentransDisambigModel*)this)->m_rules);
					bSeenSenTransField = TRUE;
#endif // hab17a1
					addRule( new CSentransDirective(CSentransDirective::kRulesOff, sField, bEnabled, cCommentChar));
				}

				// jdh 11/9/99 add \cl field
				else if(sMarker == _T("cl"))
				{
#ifndef hab17a1
#ifndef hab264
					coOrTdCollector.disgorge(m_genericClasses);
#else
					coOrTdCollector.disgorge(commonModel.morphemeClasses);
#endif // hab264
#else // hab17a1
					commentCollector.disgorge(commonModel.morphemeClasses);
					bSeenSenTransField = TRUE;
#endif // hab17a1
					CWClass *c = new CWClass(sField, bEnabled, commonModel.m_cCommentChar);
					m_genericClasses.addItem(c);
				}

				// jdh 5/29/01 add \pat field
				else if(sMarker == _T("pat"))
				{
#ifndef hab264
					coOrTdCollector.disgorge(m_patterns);
#else
					coOrTdCollector.disgorge(commonModel.morphemeClasses);	// why these, why here?  I just copied from the generic_class code above.
#endif // hab264
					CWClass *c = new CWClass(sField, bEnabled, commonModel.m_cCommentChar);
					m_patterns.addItem(c);
				}

				// punctuation fields
				else if(sMarker == _T("sentpunc"))
				{
					m_sSentencePunctuation.setData(sField);
				}

				else if(sMarker == _T("punc"))
				{
					m_sPunctuation.setData(sField);
				}
				else if(sMarker == _T("bpunc"))
				{
					m_sBeginPunctuation.setData(sField);
				}
				else if(sMarker == _T("tagchar")) // tagchar added feb 99
				{
					if(sField.GetLength()>0)
					{
#if !defined(rde270) && defined(_DEBUG)
						CString str(sField[0]);
						ASSERT(strlen(T2CU8(str)) <= 1);
#endif
						m_cTagChar.setData((char)sField[0]);
					}
				}
				else if(sMarker == _T("CarlaStudioPrefs"))
					getRuleList()->readPrefsField(sField);

				// fields to ignore
				else if(sMarker == _T("id"))
					{}	// skip it
				else if(sMarker == _T("_sh"))	// shoebox
				{}	// skip it
				else if(sMarker == _T("mcl") /*|| sMarker == _T("cl") jdh commented out 11/9/99*/
						|| sMarker==_T("scl") ||
						sMarker == _T("ca") || sMarker==_T("ccl") || sMarker==_T("ap") || sMarker==_T("mp"))
#ifndef hab17a1
					{
					  // skip these, which are duplicated in several files,  but don't bother the user
					  coOrTdCollector.removeAll();
					}
#else // hab17a1
					{} // skip these, which are duplicated in several files,  but don't bother the user
#endif // hab17a1
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
				else if(sMarker == _T("CSbegmp"))
				{
				  pLastList = 0; // belongs in ad file
				}
				else if(sMarker == _T("CSbegap"))
				{
				  pLastList = 0; // belongs in ad file
				}
				else if(sMarker == _T("CSbegccl"))
				{
				  pLastList = 0; // belongs in ad file
				}
				else if(sMarker == _T("CSbegmcl"))
				{
				  pLastList = 0; // belongs in ad file
				}
				else if(sMarker == _T("CSbegcl"))
				{
				  pLastList = &m_genericClasses;
				}
				else if(sMarker == _T("CSbegpat"))	//jdh 5/29/01
				{
				  pLastList = &m_patterns;
				}
				else if(sMarker == _T("CSbegru"))
				{
				  pLastList = &((CSentransTransferModel*)this)->m_rules;
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
				{	if(bIsDisambig)
					{	f.logSkip(_T("SENTRANS-Disambig"), sMarker, sField);
					}
					else
						f.logSkip(_T("SENTRANS-Transfer"), sMarker, sField);
				}
			}
			catch(CString sProblemStr) // these ones we can keep going
			{
				f.logParseFailure(_T("Sentrans"), sMarker, sField);
			}
		}
	}
	catch(CString sProblemStr)// this one catches problems encountered by getField()
	{
		CString s(_T("CStudio SENTRANS parser Could not parse: "));
		s += sProblemStr;
		MessageBox( NULL, s, _T("Parsing Error"), MB_OK);
		return FALSE;
	}

#ifndef hab17a1
	if (bSeenSenTransField)
	  {
	// have to guess where to put trailing comments (jdh 11/9/99)
	if(bIsDisambig)
		coOrTdCollector.defaultDisgorge(((CSentransDisambigModel*)this)->m_rules);
	else
		// it's not easy to determine from her just what instance of the model this is
		coOrTdCollector.defaultDisgorge(((CSentransTransferModel*)this)->m_rules);
	  }
#else // hab17a1
	// have to guess where to put trailing comments (jdh 11/9/99)
	if(bIsDisambig)
		commentCollector.defaultDisgorge(((CSentransDisambigModel*)this)->m_rules, _T("Surrounding Word Rules"), lpszPathName); // jdh 11/9/99
	else
		// it's not easy to determine from her just what instance of the model this is
		commentCollector.defaultDisgorge(((CSentransTransferModel*)this)->m_rules, _T("Sentrans Transfer Rules"), lpszPathName); // jdh 11/9/99
#endif // hab17a1

	return TRUE;
}

#ifndef rde270
// function for insuring that unicode chars are separated by spaces (at least upto the comment char).
void SeparateWithSpaces(CWString& str, CWChar& cCommentChar)
{
#ifdef  _UNICODE
	CString strStr = str.getData();
	CString strNew;

	// eat up beginning spaces.
	int i = 0;
	while( strStr[i] == ' ' )
		i++;

	// while there are characters left (sorry, I'm terrible with algorithms...)
	while( strStr[i] != 0 )
	{
		if( strStr[i] == cCommentChar.getData() )
		{
			// plop the rest in as is.
			strNew += strStr.Right(strStr.GetLength() - i);
			break;
		}

		// copy this char
		strNew += strStr[i];
		i++;    // next char

		// if the user is not doing it right (i.e. with a space in between), then add a space
		//  manually
		if( (strStr[i] != ' ') && (strStr[i] != 0) )
		{
			strNew += ' ';
		}

		// otherwise, if they were doing it correct, then add that as well (but only 1)
		else if( strStr[i] == ' ' )
		{
			strNew += strStr[i];
			while( strStr[++i] == ' ' )
				;   // nothing really, just skip all more than 1.
		}
	}

	// set the data and update the edit control to reflect the new reality (if new).
	BOOL bDataChanged = (strNew != strStr);
	str.setData(strNew, bDataChanged);
#else   // !_UNICODE
#pragma message("This doesn't work!!!! And until (if) this ever becomes the 'Release' baseline, there's no need to fix this!")
#endif  // _UNICODE
}
#endif  // rde270

void CSentransModel::writeHeader(ostream& fout,CWCommonModel& commonModel)
{
	//fout << "\\ca " << commonModel.categories << "\n";
#ifndef hab211
	commonModel.m_categories.write(fout, commonModel.m_cCommentChar, _T("ca"));
				// hab 1.05 \mp was missing
	commonModel.m_morphemeProperties.write(fout, commonModel.m_cCommentChar, _T("mp"));
				// hab 1.05 \ap was missing
	commonModel.m_allomorphProperties.write(fout, commonModel.m_cCommentChar, _T("ap"));
	commonModel.categoryClasses.write(fout, commonModel.m_cCommentChar, _T("ccl"));
	commonModel.morphemeClasses.write(fout, commonModel.m_cCommentChar, _T("mcl"));

	m_genericClasses.write(fout, commonModel.m_cCommentChar, _T("cl")); // jdh 11/9/99
	m_patterns.write(fout, commonModel.m_cCommentChar, _T("pat")); //jdh 5/29/01

#else //hab211
	commonModel.m_categories.write(fout, commonModel.m_cCommentChar);
				// hab 1.05 \mp was missing
	commonModel.m_morphemeProperties.write(fout, commonModel.m_cCommentChar);
				// hab 1.05 \ap was missing
	commonModel.m_allomorphProperties.write(fout, commonModel.m_cCommentChar);
	commonModel.categoryClasses.write(fout, commonModel.m_cCommentChar);
	commonModel.morphemeClasses.write(fout, commonModel.m_cCommentChar);

	m_genericClasses.write(fout, commonModel.m_cCommentChar); // jdh 11/9/99
#endif // hab211

	if(!m_sPunctuation.isEmpty())
		fout << "\\punc " <<  m_sPunctuation << '\n';
	if(!m_sBeginPunctuation.isEmpty())
		fout << "\\bpunc " <<  m_sBeginPunctuation << '\n';
	if(!m_sSentencePunctuation.isEmpty())
#ifndef rde270
	{
		SeparateWithSpaces(m_sSentencePunctuation, commonModel.m_cCommentChar);
		fout << "\\sentpunc " <<  m_sSentencePunctuation << '\n';
	}
#else   // rde270
		fout << "\\sentpunc " <<  m_sSentencePunctuation << '\n';
#endif  // rde270
	if(!m_cTagChar.isEmpty() && m_cTagChar != _T("^")) // tagchar added feb 99
		fout << "\\tagchar " << m_cTagChar << '\n';
}

BOOL CSentransDisambigModel::writeFile(CString& sPath, CWCommonModel& commonModel)

{
	CSafeStream ssOutput(sPath);
	ofstream& fout = ssOutput.openStream();
	if(::checkForFileError(sPath) != 0)
		return FALSE;

	writeHeader(fout, commonModel);
	fout << "\n";
	CString sPref = m_rules.getPrefsField();
	USES_CONVERSION_U8;
	fout << "\\CarlaStudioPrefs " << T2CU8(sPref) << "\n\n";

#ifndef hab211
	m_rules.write(fout, commonModel.m_cCommentChar, _T("ru"));
#else //hab211
	m_rules.write(fout, commonModel.m_cCommentChar);
#endif //hab211

	ssOutput.close();
	return TRUE;
}

BOOL CSentransTransferModel::writeFile(CString& sPath, CWCommonModel& commonModel)
{
	CSafeStream ssOutput(sPath);
	ofstream& fout = ssOutput.openStream();
	if(::checkForFileError(sPath) != 0)
		return FALSE;

	writeHeader(fout, commonModel);
	fout << "\n";
	CString sPref = m_rules.getPrefsField();
	USES_CONVERSION_U8;
	fout << "\\CarlaStudioPrefs " << T2CU8(sPref) << "\n\n";

#ifndef hab211
	m_rules.write(fout, commonModel.m_cCommentChar, _T("ru"));
#else //hab211
	m_rules.write(fout, commonModel.m_cCommentChar);
#endif //hab211

	ssOutput.close();

	return TRUE;
}
const CString CSentransDisambigList::getDisplayName() const
{
	return _T("ST Disambig Rule");
}

const CString CSentransTransferList::getDisplayName() const
{
	return _T("ST Transfer Rule");
}

// called by CWListView::OnInitialUpdate
void CSentransDisambigList::insertColumns(CListCtrl &clc)
{
	insertColumn(clc, _T("Comment"),	500);
	insertColumn(clc, _T("Environment"),	100);
	insertColumn(clc, _T("Morphemes"), 100);
	insertColumn(clc, _T("Type"), 100);
//	insertColumn(clc, _T(""), 50);	// enabled/disabled
}

// called by CWListView::OnInitialUpdate
void CSentransTransferList::insertColumns(CListCtrl &clc)
{
	insertColumn(clc, _T("Comment"),	500);
	insertColumn(clc, _T("Environment"),	100);
	insertColumn(clc, _T("Rule"), 200);
//	insertColumn(clc, _T(""), 50);	// enabled/disabled
}


// virtual
// returns true if something was found/replaced
BOOL CSentransDisambigRule::doFindReplace(FINDREPLACE * pFR)
{
// nothing special implemented yet
	return CWEnvironConstrainedRule::doFindReplace(pFR);

	//return (m_sMembers.Find(pFR->lpstrFindWhat) || CWEnvironConstrainedRule::doFindReplace(pFR));
}


CString CSentransDisambigRule::getText(int iColumn)
{
	static CString s;
	switch(iColumn)
	{
		//case 0: return m_bEnabled?CString(_T(" ")):CString(_T("OFF"));
	//			break;
		case 0: s= m_bAccept?_T("Accept"):_T("Reject");
			return s;
				break;
		case 1: return m_sMembers;
				break;
		// environment column
		case SENTRANS_DISAMBIG_RULE_ENVIRONCOLUMN:  return getEnvironmentText(iColumn);
				break;

		// comment column
		case SENTRANS_DISAMBIG_RULE_ENVIRONCOLUMN+1:  return getCommentText(iColumn);
				break;
		default: ASSERTX(FALSE);
				return m_lcComments ;
				break;
	}
}

CString CSentransTransferRule::getText(int iColumn)
{
	static CString s;
	switch(iColumn)
	{
		//case 0: return m_bEnabled?CString(_T(" ")):CString(_T("OFF"));
	//			break;
	 case 0: {	s = m_sFrom;	// these are combined because directives are also shown in this list
				s += _T(" > ");		// and we can't make some row/col items editable but not others, at this point
				s += m_sTo;
				return s;
			 }
		 break;
		// environment column
	case SENTRANS_TRANSFER_RULE_ENVIRONCOLUMN:  return getEnvironmentText(iColumn);
				break;

		// comment column
		case SENTRANS_TRANSFER_RULE_ENVIRONCOLUMN+1:  return getCommentText(iColumn);
				break;
		default: ASSERTX(FALSE);
				return m_lcComments;
				break;
	}
}

BOOL CSentransDisambigRule::doEditDialog(CListCtrl& clc, BOOL bIsNew)
{
	// 1) remember our current number of rows

	int iOldRowCount = 0;
	if(!bIsNew)
	{
		iOldRowCount = rowCount();
	}

	// 2) prepare the dialog

	CDlgEditSentransDisambig dlg(getOwningList()->getTextDisplayInfo());
	// Load in all our settings
	dlg.m_bEnabled = m_bEnabled;
	dlg.setRule(this);

/*	if(!m_environments.GetSize())	// make a blank one if we need to
	{
		m_environments.Add(new CStringEnvironment( _T(""),
												_T(""),
												m_iColumnForEnv,
												this,
												TRUE));
	}
*/
	//	dlg.m_sEnvironment = m_environments[0]->m_sEnv;
//	dlg.m_sEnvironComment = m_environments[0]->m_sComments;

	dlg.m_sComments = m_lcComments;
	dlg.m_sMembers = m_sMembers;
	dlg.m_iAcceptReject = !m_bAccept;
	dlg.m_bUnanimousEnvirons = m_bUnanimousEnvirons;

	// 3) put up the dialog
	BOOL bDlgOk = dlg.DoModal();
	if(IDOK == bDlgOk)
	{

		// Reload all our settings if the user clicked 'ok'
		m_bEnabled = dlg.m_bEnabled;
		m_lcComments = dlg.m_sComments;
		m_sMembers = dlg.m_sMembers;
		m_bAccept = !dlg.m_iAcceptReject;
		m_bUnanimousEnvirons = dlg.m_bUnanimousEnvirons;

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

// override
// used when pasting into a list or undoing a deletion
CWListRowItem* CSentransTransferRule::getCopy()
{
	CSentransTransferRule* pNew = new CSentransTransferRule(this);
	ASSERTX(pNew);
	return pNew;
}

// COPY CONSTRUCTOR
CSentransTransferRule::CSentransTransferRule(const CSentransTransferRule *pCopy)
:	CWEnvironConstrainedRule(pCopy),
	m_sFrom(pCopy->m_sFrom),
	m_sTo(pCopy->m_sTo)
{

}




BOOL CSentransTransferRule::doEditDialog(CListCtrl& clc, BOOL bIsNew)
{
	// 1) remember our current number of rows

	int iOldRowCount = 0;
	if(!bIsNew)
	{
		iOldRowCount = rowCount();
	}

	// 2) prepare the dialog

	CDlgEditSentransTransfer dlg(getOwningList()->getTextDisplayInfo());
	// Load in all our settings
	dlg.setRule(this);
	dlg.m_bEnabled = m_bEnabled;
/*	if(!m_environments.GetSize())	// make a blank one if we need to
	{
		m_environments.Add(new CStringEnvironment( _T(""),
												_T(""),
												m_iColumnForEnv,
												this,
												TRUE));
	}
*/
	//	dlg.m_sEnvironment = m_environments[0]->m_sEnv;
//	dlg.m_sEnvironComment = m_environments[0]->m_sComments;

	dlg.m_sComments = m_lcComments;
	dlg.m_sFrom = m_sFrom;
	dlg.m_sTo = m_sTo;

	// 3) put up the dialog
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
*/	}

	// 4) remove and then add ourselves back in to the list

	if(!bIsNew) // if we're not new (caller will add if we are)
		reset(clc, iOldRowCount);

	return (IDOK == bDlgOk);
}

 void CSentransTransferRule::write(ostream& fout, char cCommentChar) const
{
	USES_CONVERSION_U8;
	fout << "\\ru ";
	fout << T2CU8(m_sFrom) << " > " << T2CU8(m_sTo) << ' ';

	CWEnvironConstrainedRule::write(fout, cCommentChar);
 }

 void CSentransDisambigRule::write(ostream& fout, char cCommentChar) const
{
	if(m_bUnanimousEnvirons)
	{
		if(m_bAccept)
			fout << "\\amun ";
		else
			fout << "\\rejun ";
	}
	else
	{
		if(m_bAccept)
			fout << "\\am ";
		else
			fout << "\\rej ";
	}

	USES_CONVERSION_U8;
	fout << T2CU8(m_sMembers) << " ";

	CWEnvironConstrainedRule::write(fout, cCommentChar);
}

CSentransDisambigRule::CSentransDisambigRule(LPCTSTR lpszField,
											 BOOL bAccept,
											 BOOL bEnabled,
											 BOOL bUnanimousEnvirons,
											 char cCommentChar)
:	m_bAccept(bAccept),
	m_bUnanimousEnvirons(bUnanimousEnvirons),
	CWEnvironConstrainedRule(SENTRANS_DISAMBIG_RULE_ENVIRONCOLUMN, bEnabled)
{
	m_lcComments.m_iShowInColumn = 1+SENTRANS_DISAMBIG_RULE_ENVIRONCOLUMN;

	CParseStream stream(lpszField, cCommentChar);

	CString sTemp;

	while(stream.endOfLineComment(sTemp, TRUE))
		m_lcComments += sTemp;

	THROW_STR_IF_NOT(stream.word(m_sMembers, FALSE), lpszField);
	CString sMember;

	do
	{	while(stream.endOfLineComment(sTemp, TRUE))
			m_lcComments += sTemp; // TO DO: this is sloppy & will just concatenate them

		if(stream.atDisabledEnv())//	example: |DIS /blah_
			break;
		if(stream.word(sMember, FALSE))
		{	m_sMembers += _T(" ");
			m_sMembers += sMember;
		}
		else
			break;
	} while (TRUE);

	parseAfterRuleStuff(stream, TRUE);
}

CSentransTransferRule::CSentransTransferRule(LPCTSTR lpszField,
											 BOOL bEnabled,
											 char cCommentChar)
:	CWEnvironConstrainedRule(SENTRANS_TRANSFER_RULE_ENVIRONCOLUMN, bEnabled)
{
	m_lcComments.m_iShowInColumn = 1+SENTRANS_TRANSFER_RULE_ENVIRONCOLUMN;

	CParseStream stream(lpszField, cCommentChar);

	THROW_STR_IF_NOT(stream.upTo(m_sFrom, '>'), lpszField);
	if(!stream.swallow(_T(">")))
		stream.swallow(_T("->"));	// docs say it can be one of these two
	// it appears that is is legal to have an empty right side  THROW_STR_IF_NOT(stream.upTo(m_sTo, '/', '|', '&'), lpszField);
	stream.upTo(m_sTo, '/', '|', '&');


	parseAfterRuleStuff(stream, TRUE);
}



//////////////////////////////////////////////////////////////////////////////////
///////////////////////////// CSentransDirective  //////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

BOOL CSentransDirective::doEditDialog(CListCtrl& clc, BOOL bIsNew)
{
	// 1) remember our current number of rows

	int iOldRowCount = 0;
	if(!bIsNew)
	{
		iOldRowCount = rowCount();
	}

	// 2) prepare the dialog

	CDlgSentransDirective dlg(getOwningList()->getTextDisplayInfo());
	// Load in all our settings
	dlg.m_bEnabled = m_bEnabled;
	dlg.m_sComments = m_sComments;
	dlg.m_iType = m_iType;
	if(m_iType == kLimit)
		dlg.m_iLimit = m_iLimit;

	// 3) put up the dialog
	BOOL bDlgOk = dlg.DoModal();
	if(IDOK == bDlgOk)
	{
		// Reload all our settings if the user clicked 'ok'
		m_bEnabled = dlg.m_bEnabled;
		m_sComments = dlg.m_sComments;
		m_iType = dlg.m_iType;
		if(m_iType == kLimit)
			m_iLimit = dlg.m_iLimit;
	}

	// 4) remove and then add ourselves back in to the list

	if(!bIsNew) // if we're not new (caller will add if we are)
		reset(clc, iOldRowCount);

	return (IDOK == bDlgOk);
}

 void CSentransDirective::write(ostream& fout, char cCommentChar) const
{
	switch(m_iType)
	{
		case kLimit:	fout << "\\... ";
						fout << m_iLimit << " ";
						break;
		case kBeginRuleSet: fout << "\\ruleset ";
						break;
		case kEndRuleSet: fout << "\\endruleset ";
						break;
		case kRulesOn: fout << "\\ruleson ";
						break;
		case kRulesOff: fout << "\\rulesoff ";
						break;
		default: ASSERTX(FALSE);
					break;
	}
	writeCommentStr(fout, m_sComments,  cCommentChar);
 }

 CString CSentransDirective::getText(int iColumn)
{
	static CString s;
	switch(iColumn)
	{
		//case 0: return m_bEnabled?CString(" "):CString("OFF");
	//			break;
	 case 0:
		 switch(m_iType)
		{
			case kLimit:{

							s.Format(_T("Limit %d"), m_iLimit);
							return s;
						}
							break;
			case kBeginRuleSet: s= _T("Begin Set");
							return s;
							break;
			case kEndRuleSet: s= _T("End Set");return s;
							break;
			case kRulesOn: s= _T("Rules On");return s;
							break;
			case kRulesOff: s= _T("Rules Off");return s;
							break;
			default: ASSERTX(FALSE);
						break;
		}

		 break;

		case 1:  s= _T("");	return s;// used by transfer rules
				break;

		case 2:  s= _T("");return s;
				break;

		case 3:  return m_sComments;
				break;

		default: ASSERTX(FALSE);
				break;
	}
	return m_sComments ;
}

 CSentransDirective::CSentransDirective(int iType,
											 LPCTSTR lpszField,
											 BOOL bEnabled,
											 char cCommentChar)
:	m_iType(iType), CWListEntry(bEnabled)
{
	CParseStream stream(lpszField, cCommentChar);

	if(iType == kLimit)
		THROW_STR_IF_NOT(stream.integer(&m_iLimit), lpszField);

	CString s;
	stream.toEndCollectComments(s, m_sComments);
	// shouldn't be anything but comments left
	THROW_STR_IF_NOT(0==s.GetLength(), lpszField);
}

 // override
// used when pasting into a list or undoing a deletion
CWListRowItem* CSentransDirective::getCopy()
{
	CSentransDirective* pNew = new CSentransDirective(this);
	ASSERTX(pNew);
	return pNew;
}

// COPY CONSTRUCTOR
CSentransDirective::CSentransDirective(const CSentransDirective *pCopy)
:	CWListEntry(pCopy),
	m_iLimit(pCopy->m_iLimit),
	m_iType(pCopy->m_iType),
	m_sComments(pCopy->m_sComments)
{

}

// override
// used when pasting into a list or undoing a deletion
CWListRowItem* CSentransDisambigRule::getCopy()
{
	CSentransDisambigRule* pNew = new CSentransDisambigRule(this);
	ASSERTX(pNew);
	return pNew;
}

// COPY CONSTRUCTOR
CSentransDisambigRule::CSentransDisambigRule(const CSentransDisambigRule *pCopy)
:	CWEnvironConstrainedRule(pCopy),
	m_bAccept(pCopy->m_bAccept),
	m_bUnanimousEnvirons(pCopy->m_bUnanimousEnvirons),
	m_sMembers(pCopy->m_sMembers)
{

}

int CSentransDisambigRule::getIconIndex() const
{
	if(m_bAccept)
		return CWListEntry::getIconIndex();
	else
		return 7;
}

int CSentransDirective::getIconIndex() const
{
	const int iFirst=8;
	switch(m_iType)
	{
		case kLimit:		return iFirst;	break;
		case kBeginRuleSet: return iFirst+1;	break;
		case kEndRuleSet:	return iFirst+2;	break;
		case kRulesOn:	return iFirst+3;	break;
		case kRulesOff:	return iFirst+4;	break;
		default: ASSERTX(FALSE);
					break;
	}
	return 99;
}

int CSentransTransferRule::getIconIndex() const
{
	return CWListEntry::getIconIndex();
}
