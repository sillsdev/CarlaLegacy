// CHANGE HISTORY
//jdh 9/1/99 convert multiple allomorph markers in one field to multiple gate entries
// 1.7a1 02-Dec-1999 hab Need to allow the \prefix, \infix, \suffix, \root, and
//                       \unified lines to not have a record marker after them.
//                       In such cases, the first \ch field has the record
//                       marker.
//       06-Dec-1999 hab Fix (I hope) bug which would output both \unified
//                       and \affix \root in code table when creating a
//                       language from scratch.
//       07-Dec-1999 hab Allow multiple markers for gates A,C,P,Z,!,L and F
// 2.1.5 28-Mar-2000 hab Root dict codes have no orderclass; affix ones have no root gloss
//	11-Sept-2001	jdh Cntrl file output now uses SafeStream to generate .bak file.
// jdh 12 sep 2001 added unified/classic consistency check to LoadFromFile()

#include "stdafx.h"
#include "CodeTable.h"
#include "Parsestream.h"
#include "SafeStream.h"
#include "SFMFile.h"
#include "CWTopic.h"
#include "CARLAStudioApp.h"	// for globals
#include "PathDescriptor.h"

#ifndef hab17a1
#ifndef hab241
LPCTSTR pszAllowMultipleFields = _T("ACPZ!LFND");  // gates which can have multiple fields
#else // hab241
LPCTSTR pszAllowMultipleFields = _T("ACPZ!LF");  // gates which can have multiple fields
#endif // hab241
#endif // hab17a1

////////////////////////////////////////////////////
CWCodeTable::CWCodeTable()
: CWModel(_T("Code Table"))
{

}

CWCodeSet::~CWCodeSet()
{
	for(int i=0; i<m_gates.GetSize(); i++)
		delete m_gates[i];
	m_gates.RemoveAll();
}

// jdh 12 sep 2001 added sanity check (bAppearsUnified)
BOOL CWCodeTable::loadFromFile(LPCTSTR lpszPathName, char cCommentChar, BOOL* pbAppearsUnified)
{
	*pbAppearsUnified = FALSE;	// will be set to TRUE if we find a "UNIFIED" marker

	ASSERTX(lpszPathName);
	USES_CONVERSION;
	SFMFile sfmFile(T2CA(lpszPathName), cCommentChar);
	if(!sfmFile.ensureOpen(_T("Code-Table File")))
		return FALSE;

	CWCodeSet *pCurrentSet = 0;
	CString sMarker, sField;
	BOOL bEnabled;
#ifndef hab17a1
	BOOL bHaveRecordMarker = FALSE;
#endif // hab 17a1
	try
	{
		while(sfmFile.getField(sMarker, sField, &bEnabled))
		{
			try
			{
				// trim any leading '~', which is meant to make STAMP ignore the line
				if(sMarker.GetLength() && sMarker[0] == '~')
				{
					CString s = sMarker.Right(sMarker.GetLength()-1);
					sMarker = s;
				}

				if(sMarker == _T("ch"))
				{
					if(!pCurrentSet)
						throw(CString(_T("Found \\ch before record marker (e.g. \\unified, \\prefix, etc.)")));

					pCurrentSet->loadOneMapping(sField);
#ifndef hab17a1
					if (!bHaveRecordMarker)
					  { // use code of first line as marker
						CParseStream stream(sField);
						CString sCodeWithSlash;
						stream.word(sCodeWithSlash, TRUE);
						CString sCode = LPCTSTR(sCodeWithSlash) + 1;// remove the slash
						pCurrentSet->m_record.setData(sCode);
						bHaveRecordMarker = TRUE;
					  }
#endif // hab17a1

				}
				else if(sMarker == _T("prefix") || sMarker == _T("suffix") || sMarker == _T("infix") || sMarker == _T("root") || sMarker == _T("unified"))
				{
					if(sMarker == _T("unified"))
					{
						pCurrentSet = &m_unifiedSet;
						*pbAppearsUnified = TRUE;	// jdh 11 sept 2001
					}
					else if(sMarker == _T("prefix"))
						pCurrentSet = &m_prefixSet;
					else if(sMarker == _T("suffix"))
						pCurrentSet = &m_suffixSet;
					else if(sMarker == _T("infix"))
						pCurrentSet = &m_infixSet;
					else if(sMarker == _T("root"))
						pCurrentSet = &m_rootSet;
					else ASSERTX(FALSE);

					CParseStream stream(sField);
					CString sRecordMarkerWithSlash;
#ifndef hab17a1
				// AMPLE does not require record marker
					if (stream.word(sRecordMarkerWithSlash, TRUE))
					{
					  bHaveRecordMarker = TRUE;
					  if(sRecordMarkerWithSlash[0] != '\\' || sRecordMarkerWithSlash.GetLength() < 2)
						throw(sField);
					  CString sCode = LPCTSTR(sRecordMarkerWithSlash) + 1;// remove the slash
					  pCurrentSet->m_record.setData(sCode);
					}
					else
					{
					  bHaveRecordMarker = FALSE;
					  pCurrentSet->m_record.setData(_T(""));
					}
#else // hab17a1
					THROW_STR_IF_NOT(stream.word(sRecordMarkerWithSlash, TRUE), sField);
					if(sRecordMarkerWithSlash[0] != '\\' || sRecordMarkerWithSlash.GetLength() < 2)
						throw(sField);
					CString sCode = LPCTSTR(sRecordMarkerWithSlash) + 1;// remove the slash
					pCurrentSet->m_record.setData(sCode);
#endif // hab17a1
				}
				else if(sMarker == _T("id"))
				{}
				else if(sMarker == _T("_sh"))	// shoebox
				{}	// skip it
				else if(sMarker == _T("co"))
				{
					sfmFile.logCommentSkip(sField);
				}
				else
					sfmFile.logSkip(_T("CodeTable"), sMarker, sField);
					//TRACE("CodeTable Skipping sField [%s]  [%s]\n", sMarker, sField);
			}
			catch(CString sError)	// these ones we can keep going
			{
				CString s(_T("CodeTable parsing problem: "));
				s += sError;
				AfxMessageBox(s, MB_ICONEXCLAMATION | MB_OK);
			}
		}
	}
	catch(CString sProblemStr)// this one catches problems encountered by getField(); we don't try to keep going
	{
		CString s(_T("CodeTable Couldn't parse: "));
		s += sProblemStr;
		MessageBox( NULL, s, _T("Parsing Error"), MB_OK);
		return FALSE;
		sfmFile.throwParseFailure(_T("CodeTable"), sMarker, sField);
	}

	// stick the markers into the group boxes for the interface
	m_unifiedSet.populateInterface();
	m_prefixSet.populateInterface();
	m_suffixSet.populateInterface();
	m_infixSet.populateInterface();
	m_rootSet.populateInterface();

	return TRUE;
}

////////////////////////////////////////////////////
CWUnifiedCodeSet::CWUnifiedCodeSet()
:	CWCodeSet()
{
#ifndef hab17a1
	 m_gates.Add(new CGate('L', _T("*Infix Loc"), _T("loc"),  TRUE));
#else // hab17a1
	 m_gates.Add(new CGate('L', _T("Infix Loc"), _T("loc"),  TRUE));
#endif // hab17a1
	 m_gates.Add(new CGate('T', _T("Morph Type"), _T("type"), TRUE));
#ifndef hab215
	m_gates.Add(new CGate('O', _T("Orderclass"), _T("o")));
	m_gates.Add(new CGate('G', _T("Root Gloss"), _T("g")));
#endif // hab215
#ifndef hab241
	m_gates.Add(new CGate('N', _T("*Tone Information"), _T("tone")));
	m_gates.Add(new CGate('D', _T("*Tone Domain"), _T("domain")));
#endif // hab241
}

#ifndef hab215
CWInfixCodeSet::CWInfixCodeSet()
  :  CWAffixCodeSet()
{
#else // hab215
CWInfixCodeSet::CWInfixCodeSet()
{
#endif // hab215
#ifndef hab17a1
	m_gates.Add(new CGate('L', _T("*Infix Location"), _T("loc"), TRUE));
#else // hab17a1
	m_gates.Add(new CGate('L', _T("Infix Location"), _T("loc"), TRUE));
#endif // hab17a1
}

#ifndef hab215
CWAffixCodeSet::CWAffixCodeSet()
:	CWCodeSet()
{
	m_gates.Add(new CGate('O', _T("Orderclass"), _T("o")));
#ifndef hab241
	m_gates.Add(new CGate('N', _T("*Tone Information"), _T("tone")));
	m_gates.Add(new CGate('D', _T("*Tone Domain"), _T("domain")));
#endif // hab241
}

CWRootCodeSet::CWRootCodeSet()
:	CWCodeSet()
{
	m_gates.Add(new CGate('G', _T("Root Gloss"),_T("g")));
#ifndef hab241
	m_gates.Add(new CGate('N', _T("*Tone Information"), _T("tone")));
	m_gates.Add(new CGate('D', _T("*Tone Domain"), _T("domain")));
#endif // hab241
}
#endif // hab215

CWCodeSet::CWCodeSet()
: 	m_record(_T("Record")),
	m_requiredCodesGroup(_T("Required Markers")),
	m_optionalCodesGroup(_T("Optional Markers"))
{
#ifndef hab17a1
	m_gates.Add(new CGate('A', _T("*Allomorph"), _T("a"), TRUE));
	m_gates.Add(new CGate('C', _T("*Category"), _T("c"), TRUE));
#else // hab17a1
	m_gates.Add(new CGate('A', _T("Allomorph"), _T("a"), TRUE));
	m_gates.Add(new CGate('C', _T("Category"), _T("c"), TRUE));
#endif // hab17a1
	m_gates.Add(new CGate('M', _T("Morphname"), _T("g"), TRUE));

	CWGroup& g2 = m_optionalCodesGroup;
	m_gates.Add(new CGate('E', _T("Elsewhere allo"), _T("lx")));
	m_gates.Add(new CGate('U', _T("Underlying form"), _T("lx")));
#ifndef hab17a1
	m_gates.Add(new CGate('P', _T("*Morpheme Property"), _T("mp")));
#else // hab17a1
#endif // hab17a1
#ifdef hab215
	m_gates.Add(new CGate('O', _T("Orderclass", _T("o"))); // now in CWAffixCodeSet
#endif // hab215
#ifndef hab17a1
	m_gates.Add(new CGate('Z', _T("*Co-occurrence Constraint"), _T("mcc")));
	m_gates.Add(new CGate('F', _T("*Features"), _T("f")));
	m_gates.Add(new CGate('!', _T("*Don't load"), _T("no")));
#else // hab17a1
	m_gates.Add(new CGate('Z', _T("Co-occurrence Constraint"), _T("mcc")));
	m_gates.Add(new CGate('F', _T("Features"), _T("f")));
	m_gates.Add(new CGate('!', _T("Dont load"), _T("no")));
#endif // hab17a1
#ifdef hab215
	m_gates.Add(new CGate('G', _T("RootGloss"),_T("g"))); // now in CWRootCodeSet
#endif //hab215
}

void CWCodeSet::loadOneMapping(CString& field)
{
	CParseStream stream(field);
	CString sCodeWithSlash, sGate;
	THROW_STR_IF_NOT(stream.word(sCodeWithSlash, TRUE), field);
	stream.swallow(_T(">"));	// this is optional
	THROW_STR_IF_NOT(stream.word(sGate, TRUE), field);

	if(sCodeWithSlash[0] != '\\' || sCodeWithSlash.GetLength() < 2)
		throw(field);

	CString sCode = LPCTSTR(sCodeWithSlash) + 1;// remove the slash

#if !defined(rde270) && defined(_DEBUG)
	USES_CONVERSION_U8;
	CString str(sGate[0]);
	ASSERT(strlen(T2CU8(str)) <= 1);
#endif
	char cGate = (char)sGate[0];

	if( !assignMapping(cGate, sCode))
	{	TCHAR  s[256];
		_stprintf(s, _T("Can't understand code table gate: '%s'"), sGate);
		AfxMessageBox(s, MB_ICONEXCLAMATION | MB_OK);
	}
}

// called by CWInterface::setupForLanguage to add our labels and editboxes to the topic
void CWCodeSet::addSelfToTopic(CWFormTopic * pTopic)
{
	pTopic->Add(&m_requiredCodesGroup);
	pTopic->Add(&m_optionalCodesGroup);
}

// called by CWCodeTable::loadFromFile while parsing in a set of marker-to-gate mappings
BOOL CWCodeSet::assignMapping(char cGate, CString & sCode)
{
	for(int i=0; i<m_gates.GetSize(); i++)
		if(m_gates[i]->m_cGate == cGate)
		{
			m_gates[i]->addFromFile(sCode);
			break;
		}

	if(i==m_gates.GetSize())	// didn't recognize that gate
		return FALSE;	// to do: should we throw and exception?

	return TRUE;
}

// should be called for a new project only
void CWCodeTable::populateWithDefaults()
{
	m_unifiedSet.populateWithDefaults();
	m_prefixSet.populateWithDefaults();
	m_rootSet.populateWithDefaults();
	m_suffixSet.populateWithDefaults();
	m_infixSet.populateWithDefaults();
}


//	all populateWithDefaults() methods are FOR FUTURE USE
// called by CWCodeTable::populateWithDefaults() & CWUnifiedCodeSet::populateWithDefaults()
void CWCodeSet::populateWithDefaults()
{
	m_record.setData(_T("lx"));
	for(int i=0; i<m_gates.GetSize(); i++)
		m_gates[i]->setToDefault();
	populateInterface(); // now stick the markers into the group boxes for the interface
}


// Called by CCARLALanguage::writeControlFiles()
#ifndef hab17a1
BOOL CWCodeTable::writeFile(CString & sPath, BOOL bHavePrefixes, BOOL bHaveInfixes, BOOL bHaveSuffixes, BOOL bUsingUnifiedDicts)
#else //hab17a1
BOOL CWCodeTable::writeFile(CString & sPath, BOOL bHavePrefixes, BOOL bHaveInfixes, BOOL bHaveSuffixes)
#endif //hab17a1
{
	CSafeStream ssOutput(sPath);
	ofstream& fout = ssOutput.openStream();
	if(::checkForFileError(sPath) != 0)
		return FALSE;


	// To DO: only output either unified or separate ones, and maybe
	// be smarter about which non-unified ones should be output

#ifndef hab17a1
	if (bUsingUnifiedDicts)
	  {
		if(m_unifiedSet.m_record.getData().GetLength() > 0)	// don't output gates that don't have codes assigned
		  m_unifiedSet.appendToFile(fout, _T("unified"), TRUE);
	  }
	else
	  {
		if(m_infixSet.m_record.getData().GetLength() > 0)	// don't output gates that don't have codes assigned
		  m_infixSet.appendToFile(fout, _T("infix"),bHaveInfixes);
		if(m_prefixSet.m_record.getData().GetLength() > 0)	// don't output gates that don't have codes assigned
		  m_prefixSet.appendToFile(fout, _T("prefix"),bHavePrefixes);
		if(m_suffixSet.m_record.getData().GetLength() > 0)	// don't output gates that don't have codes assigned
		  m_suffixSet.appendToFile(fout, _T("suffix"), bHaveSuffixes);
		if(m_rootSet.m_record.getData().GetLength() > 0)	// don't output gates that don't have codes assigned
		  m_rootSet.appendToFile(fout, _T("root"), TRUE);
	  }
#else // hab17a1
	if(m_unifiedSet.m_record.getData().GetLength() > 0)	// don't output gates that don't have codes assigned
		m_unifiedSet.appendToFile(fout, "unified", TRUE);
	if(m_infixSet.m_record.getData().GetLength() > 0)	// don't output gates that don't have codes assigned
		m_infixSet.appendToFile(fout, "infix",bHaveInfixes);
	if(m_prefixSet.m_record.getData().GetLength() > 0)	// don't output gates that don't have codes assigned
		m_prefixSet.appendToFile(fout, "prefix",bHavePrefixes);
	if(m_suffixSet.m_record.getData().GetLength() > 0)	// don't output gates that don't have codes assigned
		m_suffixSet.appendToFile(fout, "suffix", bHaveSuffixes);
	if(m_rootSet.m_record.getData().GetLength() > 0)	// don't output gates that don't have codes assigned
		m_rootSet.appendToFile(fout, "root", TRUE);
#endif //hab17a1

	ssOutput.close();
	return TRUE;
}

// bHaveThisType allows us to disguise the fields from STAMP if the maximum for
// this type is set to 0, since STAMP ignores the maximums
void CWCodeSet::appendToFile(ofstream & fout, LPCTSTR lpszType, BOOL bHaveThisType)
{
	USES_CONVERSION_U8;
	fout << "\n";
	fout << "\\" ;
	if(!bHaveThisType)	// disguise from STAMP without losing these codes
		fout << '~';
	fout << T2CU8(lpszType) << " \\" << T2CU8(m_record.getData()) << "\n";

	for(int i=0; i<m_gates.GetSize(); i++)
	{
		m_gates[i]->write(fout, bHaveThisType);
	}
}

void CGate::write(ofstream & fout, BOOL bHaveThisType)
{
	USES_CONVERSION_U8;
	CString sMarker(_T("\\ch "));
	if(!bHaveThisType)
		sMarker = _T("\\~ch ");

	for(int i=0; i<m_markers.GetSize(); i++)
	{
		CString sRec = m_markers[i]->getData();
		sRec.TrimLeft();//jdh 9/1/99
		sRec.TrimRight();//jdh 9/1/99
		if(sRec.GetLength() > 0)	// don't output gates that don't have codes assigned
		{
			//jdh 9/1/99 convert multiple allomorph markers in one field to multiple gate entries
#ifndef hab17a1
			if((_tcschr(pszAllowMultipleFields, m_cGate) != (LPTSTR)NULL) && sRec.Find(_T(" "), 0) )// is there a space? (17a1 hab: allow space for other appropriate fields)
#else // hab17a1
			if((m_cGate == 'A') && sRec.Find(" ", 0) )// is there a space?
#endif // hab17a1
			{
				CParseStream stream(sRec);
				CString sOneRec;	// hold individual marks (e.g. a, ab)
				while(stream.word(sOneRec, FALSE))
				{
					// m_cGate is guaranteed to be ANSI (so we don't convert it to UTF-8 which might be multibyte)
					fout << T2CU8(sMarker) << "\"\\" << T2CU8(sOneRec) << "\" \"" << (char)m_cGate << "\"\n";
				}
			}
			else
				fout << T2CU8(sMarker) << "\"\\" << T2CU8(sRec) << "\" \"" << (char)m_cGate << "\"\n";
		}
	}
}

void CGate::addToGroup(CWGroup& rGroup)
{
	if(!m_markers.GetSize())
		m_markers.Add(new CWMarker(m_sLabel, _T("")));// test only

	for(int i=0; i<m_markers.GetSize(); i++)
		rGroup.Add(m_markers[i]);

}

void CGate::setToDefault()
{
	for(int i=0; i<m_markers.GetSize(); i++)
		delete m_markers[i];
	m_markers.RemoveAll();
	m_markers.Add(new CWMarker(m_sLabel, m_sDefault));
}

CGate::	CGate(char cGate, LPCTSTR lpszLabel, LPCTSTR lpszDefaultMarker, bool bRequired)
:	m_cGate(cGate),
	m_sLabel(lpszLabel),
	m_sDefault(lpszDefaultMarker),
	m_bRequired(bRequired)
{
}

void CGate::addFromFile(LPCTSTR lpszMarker)
{
	m_markers.Add(new CWMarker(m_sLabel, lpszMarker));
}

CGate::~CGate()
{
	for(int i=0; i<m_markers.GetSize(); i++)
		delete m_markers[i];
	m_markers.RemoveAll();
}

void CWCodeSet::populateInterface()
{
	m_requiredCodesGroup.Add(& m_record);

	for(int i=0; i<m_gates.GetSize(); i++)
		if(m_gates[i]->m_bRequired)
			m_gates[i]->addToGroup(m_requiredCodesGroup);
		else
			m_gates[i]->addToGroup(m_optionalCodesGroup);
}

// called by the phonrule model, which needs to output the markers for
// root, allomorph, and category
// Although the record marker doesn't have a gate, we use 'R' to mean record marker
// If the gate isn't found, throws an assert
// If the gate is found but has no markers, returns an empty string
CString CWCodeSet::getFirstMarkerForGate(char cGate) const
{
	if(cGate == 'R')
		return m_record.getData();

	for(int i=0; i<m_gates.GetSize(); i++)
		if(m_gates[i]->m_cGate == cGate)
		{
			if(m_gates[i]->m_markers.GetSize() == 0)
				return _T("");
			return m_gates[i]->m_markers[0]->getData();
		}

	ASSERTX(FALSE);
	return _T("");

}
