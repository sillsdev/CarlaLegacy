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
//////////////////////////////////////////////////////////////////////


#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "SentransModel.h"
#include "SFMFile.h"
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
:CWModel("SENTRANS"), // this label currently unused, actually
	m_sPunctuation("Punctuation"),
	m_sSentencePunctuation("Sentence Punctuation"),
	m_cTagChar("Tag Char", '^'),	// added feb 99

	//	jdh 11/9/99 added support for Sentrans \CL field (generic classes)
	m_genericClasses("Generic Class", "cl",
					TRUE, // contents are strings? (could be...)
					TRUE, // contents are morphemes? (could be...)
					pTDI),
	//	jdh  5/29/01 added support for Sentrans \pat field
	m_patterns("Pattern", "pat",
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
	SFMFile f(lpszPathName, commonModel.m_cCommentChar);

	if(!f.ensureOpen("Sentrans File", bLogIfMissing))
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
				if(sMarker == "ru")
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
						CString s("SENTRANS-Disambig files can't have transfer rules.");
						f.logSkip("SENTRANS-Disambig", sMarker, sField, s);
					}
				}
#ifndef hab17a1
				else if(sMarker == "co" || sMarker == "cm")
#else // hab17a1
				else if(sMarker == "co")
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
					coOrTdCollector.add(sField, "co");
#else // hab17a1
					commentCollector.add(sField);
#endif // hab17a1
				 }
				else if(sMarker == "am" || sMarker == "rej" || sMarker == "reject"
						|| sMarker == "amun" || sMarker == "rejun")
				{
					bool bAccept = (sMarker == "am" || sMarker == "amun" );
					bool bUnanimousEnvirons = (sMarker == "amun" || sMarker == "rejun");
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
						CString s("SENTRANS-Transfer files can't have disambiguation rules.");
						f.logSkip("SENTRANS-Transfer", sMarker, sField, s);
						//MessageBox( NULL, s, "Parsing Error", MB_OK);
					}
				}

				// various SentransDirectiveTypes

				// jdh 11/9/99 todo: add commentCollector.disgorge() in each of these
				else if(sMarker == "...")
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(((CSentransDisambigModel*)this)->m_rules);
					bSeenSenTransField = TRUE;
#endif // hab17a1
					addRule( new CSentransDirective(CSentransDirective::kLimit, sField, bEnabled, cCommentChar));
				}
				else if(sMarker == "ruleset")
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(((CSentransDisambigModel*)this)->m_rules);
					bSeenSenTransField = TRUE;
#endif // hab17a1
					addRule( new CSentransDirective(CSentransDirective::kBeginRuleSet, sField, bEnabled, cCommentChar));
				}
				else if(sMarker == "endruleset")
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(((CSentransDisambigModel*)this)->m_rules);
					bSeenSenTransField = TRUE;
#endif // hab17a1
					addRule( new CSentransDirective(CSentransDirective::kEndRuleSet, sField, bEnabled, cCommentChar));
				}
				else if(sMarker == "ruleson")
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(((CSentransDisambigModel*)this)->m_rules);
					bSeenSenTransField = TRUE;
#endif // hab17a1
					addRule( new CSentransDirective(CSentransDirective::kRulesOn, sField, bEnabled, cCommentChar));
				}
				else if(sMarker == "rulesoff")
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(((CSentransDisambigModel*)this)->m_rules);
					bSeenSenTransField = TRUE;
#endif // hab17a1
					addRule( new CSentransDirective(CSentransDirective::kRulesOff, sField, bEnabled, cCommentChar));
				}

				// jdh 11/9/99 add \cl field
				else if(sMarker == "cl")
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(commonModel.morphemeClasses);
#else // hab17a1
					commentCollector.disgorge(commonModel.morphemeClasses);
					bSeenSenTransField = TRUE;
#endif // hab17a1
					CWClass *c = new CWClass(sField, bEnabled, commonModel.m_cCommentChar);
					m_genericClasses.addItem(c);
				}

				// jdh 5/29/01 add \pat field
				else if(sMarker == "pat")
				{
					coOrTdCollector.disgorge(commonModel.morphemeClasses);	// why these, why here?  I just copied from the generic_class code above.

					CWClass *c = new CWClass(sField, bEnabled, commonModel.m_cCommentChar);
					m_patterns.addItem(c);
				}

				// punctuation fields
				else if(sMarker == "sentpunc")
				{
					m_sSentencePunctuation.setData(sField);
				}

				else if(sMarker == "punc")
				{
					m_sPunctuation.setData(sField);
				}
				else if(sMarker == "tagchar") // tagchar added feb 99
				{
					if(sField.GetLength()>0)
						m_cTagChar.setData(sField[0]);
				}
				else if(sMarker == "CarlaStudioPrefs")
					getRuleList()->readPrefsField(sField);

				// fields to ignore
				else if(sMarker == "id")
					{}	// skip it
				else if(sMarker == "_sh")	// shoebox
				{}	// skip it
				else if(sMarker == "mcl" /*|| sMarker == "cl" jdh commented out 11/9/99*/
						|| sMarker=="scl" ||
						sMarker == "ca" || sMarker=="ccl" || sMarker=="ap" || sMarker=="mp")
#ifndef hab17a1
					{
					  // skip these, which are duplicated in several files,  but don't bother the user
					  coOrTdCollector.removeAll();
					}
#else // hab17a1
					{} // skip these, which are duplicated in several files,  but don't bother the user
#endif // hab17a1
#ifndef hab17a1
				else if(sMarker == "td") // 1.7a1 hab test data
				{
				  coOrTdCollector.add(sField, "td");
				}
#endif //hab17a1
#ifndef hab211
				else if(sMarker == "CSbegca")
				{
				  pLastList = 0; // belongs in ad file
				}
				else if(sMarker == "CSbegmp")
				{
				  pLastList = 0; // belongs in ad file
				}
				else if(sMarker == "CSbegap")
				{
				  pLastList = 0; // belongs in ad file
				}
				else if(sMarker == "CSbegccl")
				{
				  pLastList = 0; // belongs in ad file
				}
				else if(sMarker == "CSbegmcl")
				{
				  pLastList = 0; // belongs in ad file
				}
				else if(sMarker == "CSbegcl")
				{
				  pLastList = &m_genericClasses;
				}
				else if(sMarker == "CSbegpat")	//jdh 5/29/01
				{
				  pLastList = &m_patterns;
				}
				else if(sMarker == "CSbegru")
				{
				  pLastList = &((CSentransTransferModel*)this)->m_rules;
				}
				else if(sMarker == "CSend") // CS-specific section end marker
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
					{	f.logSkip("SENTRANS-Disambig", sMarker, sField);
					}
					else
						f.logSkip("SENTRANS-Transfer", sMarker, sField);
				}
			}
			catch(CString sProblemStr) // these ones we can keep going
			{
				f.logParseFailure("Sentrans", sMarker, sField);
			}
		}
	}
	catch(CString sProblemStr)// this one catches problems encountered by getField()
	{
		CString s("CStudio SENTRANS parser Could not parse: ");
		s += sProblemStr;
		MessageBox( NULL, s, "Parsing Error", MB_OK);
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
		commentCollector.defaultDisgorge(((CSentransDisambigModel*)this)->m_rules, "Surrounding Word Rules", lpszPathName); // jdh 11/9/99
	else
		// it's not easy to determine from her just what instance of the model this is
		commentCollector.defaultDisgorge(((CSentransTransferModel*)this)->m_rules, "Sentrans Transfer Rules", lpszPathName); // jdh 11/9/99
#endif // hab17a1

	return TRUE;
}

void CSentransModel::writeHeader(ostream& fout,CWCommonModel& commonModel)
{
	//fout << "\\ca " << commonModel.categories << "\n";
#ifndef hab211
	commonModel.m_categories.write(fout, commonModel.m_cCommentChar, "ca");
				// hab 1.05 \mp was missing
	commonModel.m_morphemeProperties.write(fout, commonModel.m_cCommentChar, "mp");
				// hab 1.05 \ap was missing
	commonModel.m_allomorphProperties.write(fout, commonModel.m_cCommentChar, "ap");
	commonModel.categoryClasses.write(fout, commonModel.m_cCommentChar, "ccl");
	commonModel.morphemeClasses.write(fout, commonModel.m_cCommentChar, "mcl");

	m_genericClasses.write(fout, commonModel.m_cCommentChar, "cl"); // jdh 11/9/99
	m_patterns.write(fout, commonModel.m_cCommentChar, "pat"); //jdh 5/29/01

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
	if(!m_sSentencePunctuation.isEmpty())
		fout << "\\sentpunc " <<  m_sSentencePunctuation << '\n';
	if(!m_cTagChar.isEmpty() && m_cTagChar != '^') // tagchar added feb 99
		fout << "\\tagchar " << m_cTagChar << '\n';
}

BOOL CSentransDisambigModel::writeFile(CString& sPath, CWCommonModel& commonModel)
{
	DWORD error = ::checkForFileError(sPath);
	if(error)
		return FALSE;

	ofstream fout(sPath);



	writeHeader(fout, commonModel);
	fout << "\n";
	CString sPref = m_rules.getPrefsField();
	fout << "\\CarlaStudioPrefs " << sPref << "\n\n";

#ifndef hab211
	m_rules.write(fout, commonModel.m_cCommentChar, "ru");
#else //hab211
	m_rules.write(fout, commonModel.m_cCommentChar);
#endif //hab211

	return TRUE;
}

BOOL CSentransTransferModel::writeFile(CString& sPath, CWCommonModel& commonModel)
{
	DWORD error = ::checkForFileError(sPath);
	if(error)
		return FALSE;

	ofstream fout(sPath);

	writeHeader(fout, commonModel);
	fout << "\n";
	CString sPref = m_rules.getPrefsField();
	fout << "\\CarlaStudioPrefs " << sPref << "\n\n";

#ifndef hab211
	m_rules.write(fout, commonModel.m_cCommentChar, "ru");
#else //hab211
	m_rules.write(fout, commonModel.m_cCommentChar);
#endif //hab211

	return TRUE;
}

const CString CSentransDisambigList::getDisplayName() const
{
	return "ST Disambig Rule";
}

const CString CSentransTransferList::getDisplayName() const
{
	return "ST Transfer Rule";
}

// called by CWListView::OnInitialUpdate
void CSentransDisambigList::insertColumns(CListCtrl &clc)
{
	insertColumn(clc, "Comment",	500);
	insertColumn(clc, "Environment",	100);
	insertColumn(clc, "Morphemes", 100);
	insertColumn(clc, "Type", 100);
//	insertColumn(clc, "", 50);	// enabled/disabled
}

// called by CWListView::OnInitialUpdate
void CSentransTransferList::insertColumns(CListCtrl &clc)
{
	insertColumn(clc, "Comment",	500);
	insertColumn(clc, "Environment",	100);
	insertColumn(clc, "Rule", 200);
//	insertColumn(clc, "", 50);	// enabled/disabled
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
		//case 0: return m_bEnabled?CString(" "):CString("OFF");
	//			break;
		case 0: s= m_bAccept?"Accept":"Reject";
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
		//case 0: return m_bEnabled?CString(" "):CString("OFF");
	//			break;
	 case 0: {	s = m_sFrom;	// these are combined because directives are also shown in this list
				s += " > ";		// and we can't make some row/col items editable but not others, at this point
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
		m_environments.Add(new CStringEnvironment( "",
												"",
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
		m_environments.Add(new CStringEnvironment( "",
												"",
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
	fout << "\\ru ";
	fout << m_sFrom << " > " << m_sTo << ' ';

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

	fout << m_sMembers << " ";

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
		{	m_sMembers += " ";
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
	if(!stream.swallow(">"))
		stream.swallow("->");	// docs say it can be one of these two
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

							s.Format("Limit %d", m_iLimit);
							return s;
						}
							break;
			case kBeginRuleSet: s= "Begin Set";
							return s;
							break;
			case kEndRuleSet: s= "End Set";return s;
							break;
			case kRulesOn: s= "Rules On";return s;
							break;
			case kRulesOff: s= "Rules Off";return s;
							break;
			default: ASSERTX(FALSE);
						break;
		}

		 break;

		case 1:  s= "";	return s;// used by transfer rules
				break;

		case 2:  s= "";return s;
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
