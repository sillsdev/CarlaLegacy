// STAMPModel.cpp: implementation of the CStampTransferModel class.
//
// JDH 5/26/99 8:48:50 AM Added List Comment Capability (\co)
// jdh 8/27/99	removed unused STAMP_TRANSFER_RULE_ENVIRONCOLUMN declaration per hab
// 1.7a1 02-Dec-1999 hab Add RSC ids to regular sound change processing.
//                       Add Lexical Changes to synthesis
//                       Allow \cm for comments as well as \co
//       09-Dec-1999 hab Move location of transfer files from source to target
//                       control file directory
// 2.1.1 09-Mar-2000 hab Add CS-specific begin and end codes in data files in
//                       order to keep full line comments and test data in
//                       the correct list.
//	11-Sept-2001	jdh Cntrl file output now uses SafeStream to generate .bak file.
//////////////////////////////////////////////////////////////////////
#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "StampModel.h"
#include "SafeStream.h"
#include "SFMFile.h"
#include "PathDescriptor.h"
#include "DlgEditStampLexChange.h"
#include "DlgEditRegSoundChange.h"
#include "DlgEditStampTransfer.h"
#include "DlgEditStampFlag.h"
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

IMPLEMENT_DYNAMIC(CStampTransferModel, CWModel)

CStampTransferModel::CStampTransferModel(const CTextDisplayInfo* pTDI)
:CWModel("STAMPTRANSFER"), // this label currently unused, actually
 m_lexChanges(pTDI),
 m_transferExpressions(pTDI)
{
}

CStampTransferModel::~CStampTransferModel()
{
}


BOOL CStampTransferModel::loadFromFile(LPCTSTR lpszPathName, CWCommonModel& commonModel,  BOOL bLogIfMissing)
{
	ASSERTX(lpszPathName);
	SFMFile f(lpszPathName, commonModel.m_cCommentChar);

	if(!f.ensureOpen("STAMP Transfer File", bLogIfMissing))
		return FALSE;

	char cCommentChar = commonModel.m_cCommentChar;

#ifndef hab17a1
	CCommentOrTestDataCollector coOrTdCollector;
#else // hab17a1
	CCommentCollector commentCollector;
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
				if(sMarker == "lc")
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(m_lexChanges);
#else // hab17a1
					commentCollector.disgorge(m_lexChanges);
#endif // hab17a1
					CStampLexChange *r = new CStampLexChange(sField, bEnabled, cCommentChar);
					m_lexChanges.addItem(r);
				}
				else if(sMarker == "sr" || sMarker == "cr" || sMarker == "ir")
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(m_transferExpressions);
#else // hab17a1
					commentCollector.disgorge(m_transferExpressions);
#endif // hab17a1
					CStampTransferRule *r = new CStampTransferRule(sMarker, sField, bEnabled, cCommentChar);
					m_transferExpressions.addItem(r);
				}

				else if(sMarker == "fl")
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(m_transferExpressions);
#else // hab17a1
					commentCollector.disgorge(m_transferExpressions);
#endif // hab17a1
					CStampTransferFlag *f = new CStampTransferFlag(sField, bEnabled, cCommentChar);
					m_transferExpressions.addItem(f);
				}

				// handled here instead of by carlalanguage becuase of multiple transfer sets
				else if(sMarker == "CarlaStudioLexChangePrefs")
					m_lexChanges.readPrefsField(sField);
				else if(sMarker == "CarlaStudioXferExprPrefs")
					m_transferExpressions.readPrefsField(sField);

#ifndef hab17a1
				else if(sMarker == "co" || sMarker == "cm")
#else // hab17a1
				else if(sMarker == "co")
#endif // hab17a1
				{
#ifndef hab17a1
					coOrTdCollector.add(sField, "co");
#else
					commentCollector.add(sField);
#endif // hab17a1
				}
				else if(sMarker == "id")
					{}	// skip it
				else if(sMarker == "_sh")	// shoebox
				{}	// skip it
#ifndef hab17a1
				else if(sMarker == "td") // 1.7a1 hab test data
				{
				  coOrTdCollector.add(sField, "td");
				}
#endif //hab17a1
#ifndef hab211
				else if(sMarker == "CSbegtr")
				{
				  pLastList = &m_transferExpressions;
				}
				else if(sMarker == "CSbeglc")
				{
				  pLastList = &m_lexChanges;
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
				{	f.logSkip("STAMP-Transfer", sMarker, sField);
					//TRACE("CStudio STAMP-Transfer parser Skipping Field [%s]\n", sMarker);
				}
			}
			catch(CString sProblemStr) // these ones we can keep going
			{
				f.logParseFailure("STAMP-Transfer", sMarker, sField);
			}
		}
	}
	catch(CString sProblemStr)// this one catches problems encountered by getField()
	{
		CString s("CStudio STAMP-Transfer control file parser could not parse: ");
		s += sProblemStr;
		MessageBox( NULL, s, "Parsing Error", MB_OK);
		return FALSE;
	}

#ifndef hab17a1
	// we have to guess where to
	// insert any comments and test data that were at the end of the file (at least after any list items)
	coOrTdCollector.defaultDisgorge(m_lexChanges);
#else // hab17a1
	// we have to guess where to
	// insert any comments that were at the end of the file (at least after any list items)
	commentCollector.defaultDisgorge(m_lexChanges, "STAMP Lexical Changes", lpszPathName);
#endif // hab17a1

	return TRUE;
}

BOOL CStampTransferModel::writeFile(CString& sPath, CWCommonModel& commonModel)
{
	CSafeStream ssOutput(sPath);
	ofstream& fout = ssOutput.openStream();
	if(::checkForFileError(sPath) != 0)
		return FALSE;

#ifndef hab211
	m_transferExpressions.write(fout, commonModel.m_cCommentChar, "tr");
	m_lexChanges.write(fout, commonModel.m_cCommentChar, "lc");
#else //hab211
	m_transferExpressions.write(fout, commonModel.m_cCommentChar, "tr");
	m_lexChanges.write(fout, commonModel.m_cCommentChar, "lc");
#endif //hab211
// handled here instead of by carlalanguage because of multiple transfer sets
	fout << "\\CarlaStudioLexChangePrefs " << m_lexChanges.getPrefsField()<<'\n';
	fout << "\\CarlaStudioXferExprPrefs " << m_transferExpressions.getPrefsField()<<'\n';

	ssOutput.close();
	return TRUE;
}

const CString CStampTransferExpressionList::getDisplayName() const
{
	return "Stamp Morpheme Transfer Rule";
}

// called by CWListView::OnInitialUpdate
void CStampTransferExpressionList::insertColumns(CListCtrl &clc)
{
	insertColumn(clc, "Comment",	300);
	insertColumn(clc, "Environment",	100);
	insertColumn(clc, "Flags", 75);
	insertColumn(clc, "Substitute", 100);
	insertColumn(clc, "Match/Insert", 100);
	insertColumn(clc, "Type", 75);
}
///////////////////////////////////////////////////////////
//	CStampTransferRule
///////////////////////////////////////////////////////////

CString CStampTransferRule::getText(int iColumn)
{
	static CString s;
	switch(iColumn)
	{
		 case 0: switch(m_iType)
				 {
					case kSTRSub: s= "Subst"; break;
					case kSTRCopy: s= "Copy"; break;
					case kSTRInsert: s= "Insert"; break;
					default: ASSERTX(FALSE); break;
				 }
				break;
		 case 1: return m_sFrom;  // insert/match
				break;
		 case 2: return m_sTo;	// subs
				break;
		 case 3: return m_sFlags;	// flags
				break;

		// environment column
		case STAMP_TRANSFER_RULE_ENVIRONCOLUMN:  return getEnvironmentText(iColumn);
				break;

		// comment column
		case STAMP_TRANSFER_RULE_ENVIRONCOLUMN+1:  return getCommentText(iColumn);
				break;
		default: ASSERTX(FALSE);
					break;
	}
	return s;
}


BOOL CStampTransferRule::doEditDialog(CListCtrl& clc, BOOL bIsNew)
{
	// 1) remember our current number of rows

	int iOldRowCount = 0;
	if(!bIsNew)
	{
		iOldRowCount = rowCount();
	}

	// 2) prepare the dialog

	CDlgEditStampTransfer dlg(getOwningList()->getTextDisplayInfo());
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
	dlg.m_sEnvironment = m_environments[0]->m_sEnv;
	dlg.m_sEnvironComment = m_environments[0]->m_sComments;
*/

	dlg.m_sComments = m_lcComments;
	dlg.m_sFrom = m_sFrom;
	dlg.m_sTo = m_sTo; // unused if this is an insertion rule
	dlg.m_sFlags = m_sFlags;
	dlg.m_iType = m_iType;

	// 3) put up the dialog
	BOOL bDlgOk = dlg.DoModal();
	if(IDOK == bDlgOk)
	{

		// Reload all our settings if the user clicked 'ok'
		m_bEnabled = dlg.m_bEnabled;
		m_lcComments = dlg.m_sComments;
		m_sFrom = dlg.m_sFrom;
		m_sTo = dlg.m_sTo;	// unused if this is an insertion rule
		m_iType = dlg.m_iType;
		m_sFlags = dlg.m_sFlags;

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

void CStampTransferRule::write(ostream& fout, char cCommentChar) const
{
	switch(m_iType)
	 {
		case kSTRSub: fout << "\\sr ";
				fout << "\"" << m_sFrom << "\" \"" << m_sTo << "\" " << m_sFlags << ' ';
				break;
		case kSTRCopy: fout <<  "\\cr ";
				fout << "\"" << m_sFrom << "\" \"" << m_sTo << "\" " << m_sFlags << ' ';
				break;
		case kSTRInsert: fout <<  "\\ir ";
				fout << "\"" << m_sFrom << "\" " << m_sFlags << ' ';
				break;
		default: ASSERTX(FALSE); break;
	 }

	CWEnvironConstrainedRule::write(fout, cCommentChar);
 }


  // override
// used when pasting into a list or undoing a deletion
CWListRowItem* CStampTransferRule::getCopy()
{
	CStampTransferRule* pNew = new CStampTransferRule(this);
	ASSERTX(pNew);
	return pNew;
}

// COPY CONSTRUCTOR
CStampTransferRule::CStampTransferRule(const CStampTransferRule *pCopy)
:	CWEnvironConstrainedRule(pCopy),
	m_iType(pCopy->m_iType),
	m_sFlags(pCopy->m_sFlags),
	m_sFrom(pCopy->m_sFrom),
	m_sTo(pCopy->m_sTo)
{
}


CStampTransferRule::CStampTransferRule(		LPCTSTR lpszMarker,
											LPCTSTR lpszField,
											 BOOL bEnabled,
											 char cCommentChar)
:	CWEnvironConstrainedRule(STAMP_TRANSFER_RULE_ENVIRONCOLUMN, bEnabled)
{
	CString sMarker(lpszMarker);

	if(sMarker == "sr")
		m_iType = kSTRSub;
	else if(sMarker == "cr")
		m_iType = kSTRCopy;
	else if(sMarker == "ir")
		m_iType = kSTRInsert;
	else ASSERTX(FALSE); // the caller should never have called us

	m_lcComments.m_iShowInColumn = 1+STAMP_TRANSFER_RULE_ENVIRONCOLUMN;

	CParseStream stream(lpszField, cCommentChar);

/*	// the tricky thing here is that there can be any word
	// in between the from and to, or no word at all
	THROW_STR_IF_NOT(stream.getItemFlexible(m_sFrom), lpszField);

	if(m_iType != kSTRInsert)	// added this if() feb 99 for b3
	{
		CString s1, s2;	// could be the replace string or just a separator word (>, -->, to, ... )
		THROW_STR_IF_NOT(stream.getItemFlexible(s1), lpszField);

		if(stream.getItemFlexible(s2))	// if there are three words, then the last one is the replace string
			m_sTo = s2;
		else
			m_sTo = s1;	// otherwise, the second word is the replace string
	}
*/

	// Parsing algorithm from Andy:
	// Look for that first non-whitespace character after the field code.

	stream.eatWhiteSpace();
	char cDelim;
	THROW_STR_IF_NOT(stream.getChar(cDelim), lpszField);

	// Everything between it and its next occurrence is the match string.
	THROW_STR_IF_NOT(stream.upTo(m_sFrom, cDelim), lpszField);
	THROW_STR_IF_NOT(stream.swallow(cDelim), lpszField);	// eat the ending delim

	// insertion rules don't have a second item
	if(m_iType == kSTRCopy || m_iType == kSTRSub)
	{
		// Skip until you find that delimiter again.
		CString sJunk;
		stream.upTo(sJunk, cDelim); // can't check return value because it will be false if nothing is in between, which is alright
		THROW_STR_IF_NOT(stream.swallow(cDelim), lpszField);	// eat the starting delim

		// Now everything until the next occurrence of the delimiter is the substitution string.
		if(!stream.upTo(m_sTo, cDelim)) // "" will give us false
			m_sTo = "";

		THROW_STR_IF_NOT(stream.swallow(cDelim), lpszField);	// eat the ending delim
	}

	// After that, anything not the environment marker is a flag, etc.
	//  DANGER: this will choke on +BLUE, thinking the + is the start of +/
	stream.upTo(m_sFlags, '+', '/', cCommentChar); // Don't check 'cause its optional

	parseAfterRuleStuff(stream, TRUE);
}

//////////////////////////////////////////////////////////
//	CStampTransferFlag


CString CStampTransferFlag::getText(int iColumn)
{
	static CString s;
	switch(iColumn)
	{
		 case 0: s= "Flag";
				break;
		 case 1: return m_sMorphemes;
				break;
		 case 2: return ""; // subst/insert
				break;
		 case 3: return m_sFlag;
				break;
		 case STAMP_TRANSFER_RULE_ENVIRONCOLUMN: s= ""; // this is the env column for transferRules, not used for flags
				break;
		// comment column
		 case 1+STAMP_TRANSFER_RULE_ENVIRONCOLUMN: return m_sComments;
				break;
		default: ASSERTX(FALSE);
					break;
	}
	return s ;
}


BOOL CStampTransferFlag::doEditDialog(CListCtrl& clc, BOOL bIsNew)
{
	// 1) remember our current number of rows

	int iOldRowCount = 0;
	if(!bIsNew)
	{
		iOldRowCount = rowCount();
	}

	// 2) prepare the dialog

	CDlgEditStampFlag dlg(NULL);
	// Load in all our settings
	dlg.m_bEnabled = m_bEnabled;

	dlg.m_sComments = m_sComments;
	dlg.m_sFlag = m_sFlag;
	dlg.m_sMorphemes = m_sMorphemes;

	// 3) put up the dialog
	BOOL bDlgOk = dlg.DoModal();
	if(IDOK == bDlgOk)
	{

		// Reload all our settings if the user clicked 'ok'
		m_bEnabled = dlg.m_bEnabled;
		m_sComments = dlg.m_sComments;
		m_sFlag = dlg.m_sFlag;
		m_sMorphemes = dlg.m_sMorphemes;
	}

	// 4) remove and then add ourselves back in to the list

	if(!bIsNew) // if we're not new (caller will add if we are)
		reset(clc, iOldRowCount);

	return (IDOK == bDlgOk);
}

void CStampTransferFlag::write(ostream& fout, char cCommentChar) const
{
	fout << "\\fl " << m_sFlag << ' ' << m_sMorphemes;
	writeCommentStr(fout, m_sComments,  cCommentChar);
}

CStampTransferFlag::CStampTransferFlag(	LPCTSTR lpszField,
										BOOL bEnabled,
										char cCommentChar)
:	CWListEntry(bEnabled)
{
	CParseStream stream(lpszField, cCommentChar);
	THROW_STR_IF_NOT(stream.word(m_sFlag, FALSE), lpszField);
	THROW_STR_IF_NOT(stream.toEndCollectComments(m_sMorphemes, m_sComments), lpszField);
}

  // override
// used when pasting into a list or undoing a deletion
CWListRowItem* CStampTransferFlag::getCopy()
{
	CStampTransferFlag* pNew = new CStampTransferFlag(this);
	ASSERTX(pNew);
	return pNew;
}

// COPY CONSTRUCTOR
CStampTransferFlag::CStampTransferFlag(const CStampTransferFlag *pCopy)
:	CWListEntry(pCopy),
	m_sComments(pCopy->m_sComments),
	m_sFlag(pCopy->m_sFlag),
	m_sMorphemes(pCopy->m_sMorphemes)
{
}

///////////////////////////////////////////////////////////
//	CStampLexChange
///////////////////////////////////////////////////////////


CString CStampLexChange::getText(int iColumn)
{
	switch(iColumn)
	{
		 case 0: return m_sFrom;
				break;
		 case 1: return m_sTo;
				break;

		// environment column
		case kEnvironColumn:  return getEnvironmentText(iColumn);
				break;

		// comment column
		case kEnvironColumn+1:  return getCommentText(iColumn);
				break;
		default: ASSERTX(FALSE);
					break;
	}
	return m_lcComments ;
}


BOOL CStampLexChange::doEditDialog(CListCtrl& clc, BOOL bIsNew)
{
	// 1) remember our current number of rows

	int iOldRowCount = 0;
	if(!bIsNew)
	{
		iOldRowCount = rowCount();
	}

	// 2) prepare the dialog

	CDlgEditStampLexChange dlg(getOwningList()->getTextDisplayInfo());
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

void CStampLexChange::write(ostream& fout, char cCommentChar) const
{
	fout << "\\lc \"" << m_sFrom << "\" > \"" << m_sTo << "\" ";
	CWEnvironConstrainedRule::write(fout, cCommentChar);
 }

  // override
// used when pasting into a list or undoing a deletion
CWListRowItem* CStampLexChange::getCopy()
{
	CStampLexChange* pNew = new CStampLexChange(this);
	ASSERTX(pNew);
	return pNew;
}

// COPY CONSTRUCTOR
CStampLexChange::CStampLexChange(const CStampLexChange *pCopy)
:	CWEnvironConstrainedRule(pCopy),
	m_sFrom(pCopy->m_sFrom),
	m_sTo(pCopy->m_sTo)
{
}

CStampLexChange::CStampLexChange(LPCTSTR lpszField,
								 BOOL bEnabled,
								 char cCommentChar)
:	CWEnvironConstrainedRule(kEnvironColumn, bEnabled)
{
	m_lcComments.m_iShowInColumn = 1+kEnvironColumn;

	CParseStream stream(lpszField, cCommentChar);

/*	// the tricky thing here is that there can be any word
	// in between the from and to, or no word at all
	THROW_STR_IF_NOT(stream.getItemFlexible(m_sFrom), lpszField);

	CString s1, s2;	// could be the replace string or just a separator word (>, -->, to, ... )
	THROW_STR_IF_NOT(stream.getItemFlexible(s1), lpszField);


	if(stream.getItemFlexible(s2))	// if there are three words, then the last one is the replace string
		m_sTo = s2;
	else
		m_sTo = s1;	// otherwise, the second word is the replace string

	parseAfterRuleStuff(stream, TRUE);
*/
	// Parsing algorithm from Andy:
	// Look for that first non-whitespace character after the field code.

	stream.eatWhiteSpace();
	char cDelim;
	THROW_STR_IF_NOT(stream.getChar(cDelim), lpszField);

	// Everything between it and its next occurrence is the match string.
	THROW_STR_IF_NOT(stream.upTo(m_sFrom, cDelim), lpszField);
	THROW_STR_IF_NOT(stream.swallow(cDelim), lpszField);	// eat the ending delim

	// Skip until you find that delimiter again.
	CString sJunk;
	stream.upTo(sJunk, cDelim); // can't check return value because it will be false if nothing is in between, which is alright
	THROW_STR_IF_NOT(stream.swallow(cDelim), lpszField);	// eat the starting delim

	// Now everything until the next occurrence of the delimiter is the substitution string.
	if(!stream.upTo(m_sTo, cDelim)) // "" will give us false
		m_sTo = "";

	THROW_STR_IF_NOT(stream.swallow(cDelim), lpszField);	// eat the ending delim

	parseAfterRuleStuff(stream, TRUE);
}

const CString CStampLexChangeList::getDisplayName() const
{
#ifndef hab17a1
		if (m_bDoingSynthesis)
	  return "Synthesis Lexical Change";
	else
	  return "Stamp Lexical Change";
#else // hab17a1
	return "Stamp Lexical Change";
#endif // hab17a1
}

// called by CWListView::OnInitialUpdate
void CStampLexChangeList::insertColumns(CListCtrl &clc)
{
	insertColumn(clc, "Comment",	300);
	insertColumn(clc, "Environment",	100);
	insertColumn(clc, "To", 100);
	insertColumn(clc, "From", 100);
}



//////////////////////////////////////////////////////////////////////
// CStampSynthesisModel
//////////////////////////////////////////////////////////////////////

IMPLEMENT_DYNAMIC(CStampSynthesisModel, CWModel)

CStampSynthesisModel::CStampSynthesisModel(const CTextDisplayInfo* pTDI)
:m_regSoundChanges(pTDI),
#ifndef hab17a1
 m_lexChanges(pTDI, TRUE),
#endif // hab17a1
	m_tests("test", pTDI),	// this is the SFM marker used when writing ctrl file
	CWModel("STAMPSYNTHESIS"),
	m_protoformChars("Protoform Chars", "", pTDI)
{
}

CStampSynthesisModel::~CStampSynthesisModel()
{
}


BOOL CStampSynthesisModel::loadFromFile(LPCTSTR lpszPathName,
										CWCommonModel& commonModel,
										 BOOL bLogIfMissing)
{
	ASSERTX(lpszPathName);
	SFMFile f(lpszPathName, commonModel.m_cCommentChar);

	if(!f.ensureOpen("STAMP Synthesis File", bLogIfMissing))
		return FALSE;

	char cCommentChar = commonModel.m_cCommentChar;
#ifndef hab17a1
	CCommentOrTestDataCollector coOrTdCollector;
#else // hab17a1
	CCommentCollector commentCollector;
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
#ifndef hab17a1
				if(sMarker == "lc")
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(m_lexChanges);
#else // hab17a1
					commentCollector.disgorge(m_lexChanges);
#endif // hab17a1
					CStampLexChange *r = new CStampLexChange(sField, bEnabled, cCommentChar);
					m_lexChanges.addItem(r);
				}
				else
#else // hab17a1
				//if(sMarker == "lc")
				//{
				//	CStampLexChange *r = new CStampLexChange(sField, bEnabled, cCommentChar);
				//	m_lexChanges.addItem(r);
				//}
				//else
#endif // hab17a1
				if(sMarker == "rsc")
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(m_regSoundChanges);
#else // hab17a1
					commentCollector.disgorge(m_regSoundChanges);
#endif // hab17a1
					CRegSoundChange *r = new CRegSoundChange(sField, bEnabled, cCommentChar);
					m_regSoundChanges.addItem(r);
				}
				else if(sMarker == "rscid")
				{
					m_protoformChars.setData(sField);
				}

				else if(sMarker == "test")
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(m_tests);
#else // hab17a1
					commentCollector.disgorge(m_tests);
#endif // hab17a1
					CWTest *t = new CWTest(sField, bEnabled, cCommentChar);
					m_tests.addItem(t);
				}
				// JDH 5/26/99 8:38:45 AM Added List Comment Capability (\co)
#ifndef hab17a1
				else if(sMarker == "co" || sMarker == "cm")
#else // hab17a1
				else if(sMarker == "co")
#endif // hab17a1
				{
#ifndef hab17a1
					coOrTdCollector.add(sField, "co");
#else // hab17a1
					commentCollector.add(sField);
#endif // hab 16a3
				}
				else if(sMarker == "id")
					{}	// skip it
				else if(sMarker == "_sh")	// shoebox
				{}	// skip it
#ifndef hab17a1
				else if(sMarker == "td") // 1.7a1 hab test data
				{
				  coOrTdCollector.add(sField, "td");
				}
#endif //hab17a1
#ifndef hab211
				else if(sMarker == "CSbeglc")
				{
				  pLastList = &m_lexChanges;
				}
				else if(sMarker == "CSbegrsc")
				{
				  pLastList = &m_regSoundChanges;
				}
				else if(sMarker == "CSbegtest")
				{
				  pLastList = &m_tests;
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
				{	f.logSkip("STAMP-Synthesis", sMarker, sField);
					TRACE("CStudio STAMP-Synthesis parser Skipping Field [%s]\n", sMarker);
				}
			}
			catch(CString sProblemStr) // these ones we can keep going
			{
				f.logParseFailure("STAMP-Synthesis", sMarker, sField);
			}
		}
	}
	catch(CString sProblemStr)// this one catches problems encountered by getField()
	{
		CString s("CStudio STAMP-Synthesis control file parser could not parse: ");
		s += sProblemStr;
		MessageBox( NULL, s, "Parsing Error", MB_OK);
		return FALSE;
	}

#ifndef hab17a1
	// we have to guess where these go these unclaimed comments
	coOrTdCollector.defaultDisgorge(m_regSoundChanges);
#else // hab17a1
	// we have to guess where these go these unclaimed comments
	commentCollector.defaultDisgorge(m_regSoundChanges, "STAMP Protoform Rules", lpszPathName);
#endif // hab17a1
	return TRUE;
}

BOOL CStampSynthesisModel::writeFile(CString& sPath, CWCommonModel& commonModel)
{
	CSafeStream ssOutput(sPath);
	ofstream& fout = ssOutput.openStream();
	if(::checkForFileError(sPath) != 0)
		return FALSE;

#ifndef hab211
#ifndef hab17a1
	m_lexChanges.write(fout, commonModel.m_cCommentChar, "lc");
#endif // hab17a1
	fout << "\\rscid " << m_protoformChars << '\n';
	m_regSoundChanges.write(fout, commonModel.m_cCommentChar, "rsc");
	m_tests.write(fout, commonModel.m_cCommentChar, "test");
#else // hab211
#ifndef hab17a1
	m_lexChanges.write(fout, commonModel.m_cCommentChar);
#endif // hab17a1
	fout << "\\rscid " << m_protoformChars << '\n';
	m_regSoundChanges.write(fout, commonModel.m_cCommentChar);
	m_tests.write(fout, commonModel.m_cCommentChar);
#endif //hab211

	ssOutput.close();
	return TRUE;
}

///////////////////////////////////////////////////////////////////
////////////////////CRegularSoundChange//////////////////////////////////
///////////////////////////////////////////////////////////////////

// called by CWListView::OnInitialUpdate
void CRegSoundChangeList::insertColumns(CListCtrl &clc)
{
#ifndef hab17a1
	insertColumn(clc, "Comment",	300);
	insertColumn(clc, "Environment",	100);
	insertColumn(clc, "RSC ids",	50);
	insertColumn(clc, "To",	50);
	insertColumn(clc, "    From", 80);	// space are so it isn't over the icons
#else // hab17a1
	insertColumn(clc, "Comment",	300);
	insertColumn(clc, "Environment",	100);
	insertColumn(clc, "To",	50);
	insertColumn(clc, "    From", 80);	// space are so it isn't over the icons
#endif // hab17a1
}

// called by CWListView::OnGetdispinfo
CString CRegSoundChange::getText(int iColumn)
{
	switch(iColumn)
	{
		case 0: return m_sFrom;
				break;
		case 1: return m_sTo;
				break;

#ifndef hab17a1
		// RSC ids column
		case 2: return m_sRscIds;
				break;

		// environment column
		case 3:	 return getEnvironmentText(iColumn);
				break;

		// comment column
		case 4:   return getCommentText(iColumn);
				break;
#else // hab17a1
		// environment column
		case 2:	 return getEnvironmentText(iColumn);
				break;

		// comment column
		case 3:   return getCommentText(iColumn);
				break;
#endif // hab17a1

		default: ASSERTX(FALSE);
				return m_lcComments ;
				break;
	}
}

void CRegSoundChange::write(ostream& fout, char cCommentChar) const
{
#ifndef hab17a1
		fout << "\\rsc \"" << m_sFrom << "\" \"" << m_sTo << "\" " << m_sRscIds << "\n";
#else // hab17a1
	fout << "\\rsc \"" << m_sFrom << "\" \"" << m_sTo << "\"\n";
#endif // hab17a1
	CWEnvironConstrainedRule::write(fout, cCommentChar);
}

  // override
// used when pasting into a list or undoing a deletion
CWListRowItem* CRegSoundChange::getCopy()
{
	CRegSoundChange* pNew = new CRegSoundChange(this);
	ASSERTX(pNew);
	return pNew;
}

// COPY CONSTRUCTOR
CRegSoundChange::CRegSoundChange(const CRegSoundChange *pCopy)
:	CWEnvironConstrainedRule(pCopy),
	m_sFrom(pCopy->m_sFrom),
#ifndef hab17a1
	m_sTo(pCopy->m_sTo),
	m_sRscIds(pCopy->m_sRscIds)
#else
	m_sTo(pCopy->m_sTo)
#endif // hab17a1
{
}

#ifndef hab17a1
				// 1.7a1 hab Fix so it allows RSC identifiers
CRegSoundChange::CRegSoundChange(LPCTSTR lpszField, BOOL bEnabled, char cCommentChar)
: m_sRscIds(""), CWEnvironConstrainedRule(3, bEnabled)
{
	m_lcComments.m_iShowInColumn = 4;

	// first get the change:   "aa" > "a"
	CParseStream stream(lpszField, cCommentChar);

	THROW_STR_IF_NOT(stream.word(m_sFrom, TRUE), lpszField);
	stream.swallow(">");	// this is optional
	THROW_STR_IF_NOT(stream.word(m_sTo, TRUE), lpszField);

				// get any RSC ids
	CString sRscId;
	while (stream.word(sRscId, FALSE))
			if (m_sRscIds.IsEmpty())
		  m_sRscIds = sRscId;
			else
		  m_sRscIds = m_sRscIds + " " + sRscId;

	parseAfterRuleStuff(stream, TRUE);
}
#else // hab17a1
CRegSoundChange::CRegSoundChange(LPCTSTR lpszField, BOOL bEnabled, char cCommentChar)
: CWEnvironConstrainedRule(2, bEnabled)
{
	m_lcComments.m_iShowInColumn = 3;

	// first get the change:   "aa" > "a"
	CParseStream stream(lpszField, cCommentChar);

	THROW_STR_IF_NOT(stream.word(m_sFrom, TRUE), lpszField);
	CString s1, s2;	// could be the replace string or just a separator word (>, -->, to, ... )
	THROW_STR_IF_NOT(stream.word(s1, TRUE), lpszField);

	if(stream.word(s2, TRUE))	// if there are three words, then the last one is the replace string
		m_sTo = s2;
	else
		m_sTo = s1;	// otherwise, the second word is the replace string

	parseAfterRuleStuff(stream, TRUE);
}
#endif // hab17a1

// invoked by menu
BOOL CRegSoundChange::doEditDialog(CListCtrl& clc, BOOL bIsNew)
{
	clc.LockWindowUpdate();	//don't want to show the remove

	// 1) remove ourselves from the list control
	int iRow = getRow(clc);
	if(iRow >= 0)	// will be -1 if we were just created
		removeFromListCtrl(clc);

	// 2) do the dialog

	CDlgEditRegSoundChange dlg(m_pOwningList->getTextDisplayInfo());

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
	dlg.m_sFrom = m_sFrom;
	dlg.m_sTo = m_sTo;
#ifndef hab17a1
	dlg.m_sRscIds = m_sRscIds;
#endif // hab17a1
	dlg.setRule(this);

	// put up the dialog
	BOOL bDlgOk = dlg.DoModal();
	if(IDOK == bDlgOk)
	{

		// Reload all our settings if the user clicked 'ok'
		m_bEnabled = dlg.m_bEnabled;
		m_lcComments = dlg.m_sComments;
		m_sFrom = dlg.m_sFrom;
		m_sTo = dlg.m_sTo;
#ifndef hab17a1
		m_sRscIds = dlg.m_sRscIds;
#endif // hab17a1
/*		if(dlg.m_sEnvironment.GetLength())
		{	m_environments[0]->m_sEnv = dlg.m_sEnvironment;
			m_environments[0]->m_sComments = dlg.m_sEnvironComment;
		}
		else	// the first env can be deleted by clearing that box
			m_environments.RemoveAt(0);
*/	}

	// 3) add ourselves back in
	if(iRow >= 0)
		addYourRowsToListCtrl(clc, iRow);

	clc.UnlockWindowUpdate();	//now allow it to update


	return (IDOK == bDlgOk);
}

int CStampTransferFlag::getIconIndex() const
{
	return 5;
}
