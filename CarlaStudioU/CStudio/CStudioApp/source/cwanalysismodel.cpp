#include "stdafx.h"
// Change History
// 4/14/99 jdh moved some members from CWTextIn to CWCommonModel, as they are
//				needed for TextOut as well: m_cPrimaryFormatChar, m_cSecondaryFormatChar (actually not output to textout),
//				m_sWFC, m_WFCS
// JDH 5/26/99 8:49:06 AM Added List Comment Capability (\co)
// JDH 6/3/99 Added doModifyTestsDialog()
// 8/27/99 jdh added andy's punction class support
// jdh 9/1/99 added "caseless" prefix to the label for m_sWFC and m_sWFCs
// 1.5a5 24-Sep-1999 hab allow user the ability to show properties in language font
// 1.5a6 30-Sep-1999 hab Allow for suffix only case of category mapping
// 1.5a7 20-Oct-1999 hab allow user the ability to show string and morpheme class names in language font
// 1.7a1 03-Dec-1999 hab Treat \cm as a comment as well as \co.
//                       Allow test data as well as comments.
// 2.1.0 07-Mar-2000 hab Added Max properties and string check characters
// 2.1.1 09-Mar-2000 hab Add CS-specific begin and end codes in data files in
//                       order to keep full line comments and test data in
//                       the correct list.
// 2.1.7 11-Apr-2000 hab Move \\ambig write to textin
//jdh 26Sept2000 fix crash when running modify wizard, connect to absence of pPageFinalCatTest in this wizard after initial project setup (why that is, I don't remember)
// 2.4.1 26-Oct-2000 hab If infixes are chosen in the New Language Wizard, set
//                       maxInfixes to one.
// 2.6.1 11-Sep-2001 jdh Cntrl file output now uses SafeStream to generate .bak file.
// 2.6.1 11-Sep-2001 hab Added Infix orderclass test.
//                       Ensured two RSP tests and one RPS test were deleted when changing method
// 2.6.1 17-Sep-2001 hab Added new final cat page to modify tests wizard so can
//                       correctly process any final cat tests
// 2.6.1 17-Sep-2001 hab Plug memory leak when removing tests.
// 2.8.0 06-Dec-2004 hab Added maxInterfaces, interfix ad hoc pair and interfix tests

#include "CWModel.h"
#include "CWAmpleModels.h"
#include "Parsestream.h"
#include "SFMFile.h"
#include "SafeStream.h"
#include "CARLAStudioApp.h"
#include "PathDescriptor.h"
#include "PageAffixes.h"
#include "PageCategoryProp.h"
#include "PageFinalCatTest.h"
#ifndef hab261
#include "PageCatFinalModifyTests.h"
#endif // hab261
#include "ListComment.h"
#include "SheetModifyTests.h"
#ifndef hab17a1
#include "ListTestData.h"
#endif //hab17a1

IMPLEMENT_DYNAMIC(CWModel, CObject)


////////////////////////////////////////////////////
CWCommonModel::CWCommonModel(CTextDisplayInfo* pTDI)
: CWModel(_T("Common Stuff")),
	m_sLUWFC(_T("Case Associations (luwfc)"), _T(""), pTDI, TRUE, 100),
	m_sLUWFCS(_T("Multibyte Case Associations"), _T(""), pTDI, TRUE, 100),
	m_cCommentChar(_T("Comment Character"), '|'),
	m_categories(_T("Category"), _T("ca"), pTDI),
#ifndef hab15a5
	m_morphemeProperties(_T("Morpheme Property"), _T("mp"), pTDI, 4),
	m_allomorphProperties(_T("Allomorph Property"), _T("ap"), pTDI, 4),
#else
	m_morphemeProperties(_T("Morpheme Property"), _T("mp"), pTDI),
	m_allomorphProperties(_T("Allomorph Property"), _T("ap"), pTDI),
#endif // hab15a5
#ifndef hab15a7
	stringClasses(_T("String Class"), _T("scl"), TRUE, FALSE, pTDI, 8),
#else
	stringClasses(_T("String Class"), _T("scl"), TRUE, FALSE, pTDI),
#endif // hab15a7
	punctuationClasses(_T("Punctuation Class"), _T("pcl"), TRUE, FALSE, pTDI), // 1.06 hab

	categoryClasses(_T("Category Class"), _T("ccl"), FALSE, FALSE, pTDI),
#ifndef hab15a7
	morphemeClasses(_T("Morpheme Class"), _T("mcl"), FALSE, TRUE, pTDI, 16),
#else
	morphemeClasses(_T("Morpheme Class"), _T("mcl"), FALSE, TRUE, pTDI),
#endif // hab15a7
	m_cAmbigDelimiter(_T("Ambiguity Delimiter"), DEFAULT_AMBIG_CHAR),
	m_cDecompSepChar(_T("Decomposition Separator Character"), DEFAULT_DECOMP_SEP_CHAR),
#ifndef hab210
		m_sStringCheck(_T("Valid String Characters"), _T(""), pTDI, TRUE, 100),
#endif //hab210
	m_sWFC(_T("Caseless Characters"), _T(""), pTDI, TRUE, 100), // jdh 9/1/99 added "caseless"
	m_sWFCS(_T("Caseless Multi-byte Characters"), _T(""), pTDI, TRUE, 100),// jdh 9/1/99 added "caseless"
	m_cPrimaryFormatChar(_T("Primary Format Marker"), ' '),	// format
	m_cSecondaryFormatChar(_T("Secondary Format Marker"), ' ')// barchar
{
}


void CWCommonModel::readWizPages(CPageFinalCatTest* pPageFinalCatTest)
{
	if(!pPageFinalCatTest->m_bCreateFinalCatTest)
		return;

	CString sCatName;
	sCatName.LoadString(IDS_WizFinalCatClassField);
	CWClass* pC = new CWClass(sCatName, TRUE, '|');
	categoryClasses.addItem(pC);
}

////////////////////////////////////////////////////
const int kNoMax=0; // would like to default to a positive number, but if
					// we read in an ad.ctl and a max is omitted, it apparently
					// means that the max for that type is 0.
					// Incorrectly setting something to non-zero will lead to
					// a failure since we won't have a dictionary of the right
					// type.
					// To do: we need to have two setups: one for defaults on
					// new languages and another for when we're reading in a file.

CWAnalysisModel::CWAnalysisModel(CTextDisplayInfo* pTDI)
:		CWModel(_T("Analysis")),
		decapitalizeEntries(_T("Decapitalize allomorph strings in dictionary entries"), FALSE),
		m_sRootDelimiters(_T("ANA file root delimiters"), _T("<>")), // hab210 fix typo
		outputAllMorphCats(_T("Output category of each morpheme"), FALSE),
		maxNulls(_T("Max Nulls"), 5 ), //ample's default is 10
		maxInfixes(_T("Max Infixes"),0), //ample's default is 0
		maxInterfixes(_T("Max Interfixes"),0), //ample's default is 0
		maxRoots(_T("Max Roots"), 1), //ample's default is 1
		maxPrefixes(_T("Max Prefixes"), 5), //ample's default is 0 // kNoMax),
		maxSuffixes(_T("Max Suffixes"), 5), //ample's default is 99
#ifndef hab210
		maxProps(_T("Max Properties"), 255), //ample's default is 255
#endif // hab210
		prefixTests(_T("pt"), pTDI),
		infixTests(_T("it"), pTDI),
		interfixTests(_T("nt"), pTDI),
		rootTests(_T("rt"), pTDI),
		suffixTests(_T("st"), pTDI),
		finalTests(_T("ft"), pTDI),
		adhocPairs(pTDI),
		generalMCCs(pTDI),
		compoundRootCatPairs(pTDI),
		m_radioCatOutput(0, _T("Don't output word category"),
							_T("Get word category from prefix"), _T("Get word category from suffix"))
{
}

BOOL CWAnalysisModel::loadFromFile(LPCTSTR lpszPathName, CWCommonModel& commonModel)
{
	ASSERTX(lpszPathName);

	USES_CONVERSION_U8;
	SFMFile f(T2CA(lpszPathName), commonModel.m_cCommentChar);

	if(!f.ensureOpen(_T("Analysis File"), TRUE, TRUE))
		return FALSE;


	// put things that have a value by the *absense* of something here
	decapitalizeEntries = FALSE;
//	outputFinalCat = FALSE;
	outputAllMorphCats = FALSE;
	m_radioCatOutput.setData(kNoOutputCat);

	char m_cCommentChar = commonModel.m_cCommentChar;
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
//try
//	{
		while(f.getField(sMarker, sField, &bEnabled))
		{
			try
			{
				if(sMarker == _T("dsc"))
				{
#if !defined(rde270) && defined(_DEBUG)
				CString str(sField[0]);
				ASSERT(strlen(T2CU8(str)) <= 1);
#endif
					commonModel.m_cDecompSepChar.setData((char)sField[0]);
				}
				else if(sMarker == _T("scl"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(commonModel.stringClasses);
#else // hab17a1
					commentCollector.disgorge(commonModel.stringClasses);
#endif //hab17a1
					CWClass *c = new CWClass(sField, bEnabled, m_cCommentChar);
					commonModel.stringClasses.addItem(c);
				}
				// Begin insert	1.06 hab
				else if(sMarker == _T("pcl"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(commonModel.punctuationClasses);
#endif // hab17a1
					CWClass *c = new CWClass(sField, bEnabled, m_cCommentChar);
					commonModel.punctuationClasses.addItem(c);
				}
				// End insert 1.06 hab

				else if(sMarker == _T("mcl"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(commonModel.morphemeClasses);
#else // hab17a1
					commentCollector.disgorge(commonModel.morphemeClasses);
#endif // hab17a1
					CWClass *c = new CWClass(sField, bEnabled, m_cCommentChar);
					commonModel.morphemeClasses.addItem(c);
				}
				else if(sMarker == _T("ccl"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(commonModel.categoryClasses);
#else // hab17a1
					commentCollector.disgorge(commonModel.categoryClasses);
#endif // hab17a1
					CWClass *c = new CWClass(sField, bEnabled, m_cCommentChar);
					commonModel.categoryClasses.addItem(c);
				}
				else if(sMarker == _T("mp"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(commonModel.m_morphemeProperties);
#else // hab17a1
					commentCollector.disgorge(commonModel.m_morphemeProperties);
#endif // hab17a1
					commonModel.m_morphemeProperties.parseField(sField, bEnabled, m_cCommentChar);
				}
				else if(sMarker == _T("ap"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(commonModel.m_allomorphProperties);
#else // hab17a1
					commentCollector.disgorge(commonModel.m_allomorphProperties);
#endif // hab17a1
					commonModel.m_allomorphProperties.parseField(sField, bEnabled, m_cCommentChar);
				}
				else if(sMarker == _T("cr"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(compoundRootCatPairs);
#endif // hab17a1
					CWCompoundRootPair *crp = new CWCompoundRootPair(sField, bEnabled, m_cCommentChar);
					compoundRootCatPairs.addItem(crp);
				}
				else if(sMarker == _T("ca"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(commonModel.m_categories);
#else // hab17a1
					commentCollector.disgorge(commonModel.m_categories);
#endif // hab17a1
					commonModel.m_categories.parseField(sField, bEnabled, m_cCommentChar);
				}
				else if(sMarker == _T("st"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(suffixTests);
#else // hab17a1
					commentCollector.disgorge(suffixTests);
#endif // hab17a1
					CWTest *t = new CWTest(sField, bEnabled, m_cCommentChar);
					suffixTests.addItem(t);
				}
				else if(sMarker == _T("pt"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(prefixTests);
#else // hab17a1
					commentCollector.disgorge(prefixTests);
#endif // hab17a1
					CWTest *t = new CWTest(sField, bEnabled, m_cCommentChar);
					prefixTests.addItem(t);
				}
				else if(sMarker == _T("rt"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(rootTests);
#else // hab17a1
					commentCollector.disgorge(rootTests);
#endif // hab17a1
					CWTest *t = new CWTest(sField, bEnabled, m_cCommentChar);
					rootTests.addItem(t);
				}
				else if(sMarker == _T("ft"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(finalTests);
#else // hab17a1
					commentCollector.disgorge(finalTests);
#endif // hab17a1
					CWTest *t = new CWTest(sField, bEnabled, m_cCommentChar);
					finalTests.addItem(t);
				}
				else if(sMarker == _T("it"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(infixTests);
#else // hab17a1
					commentCollector.disgorge(infixTests);
#endif // hab17a1
					CWTest *t = new CWTest(sField, bEnabled, m_cCommentChar);
					infixTests.addItem(t);
				}
				else if(sMarker == _T("nt"))
				{
					coOrTdCollector.disgorge(interfixTests);
					CWTest *t = new CWTest(sField, bEnabled, m_cCommentChar);
					interfixTests.addItem(t);
				}
				else if(sMarker == _T("mcc"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(generalMCCs);
#else // hab17a1
					commentCollector.disgorge(generalMCCs);
#endif // hab17a1
					CWMCC *c = new CWMCC(sField, bEnabled, m_cCommentChar);
					generalMCCs.addItem(c);

				}
				else if(sMarker == _T("pah"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(adhocPairs);
#else // hab17a1
					commentCollector.disgorge(adhocPairs);
#endif // hab17a1
					CWAdhocPair *ap = new CWAdhocPair(sMarker, sField, bEnabled, m_cCommentChar);
					adhocPairs.addItem(ap);
				}
				else if(sMarker == _T("sah"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(adhocPairs);
#else // hab17a1
					commentCollector.disgorge(adhocPairs);
#endif // hab17a1
					CWAdhocPair *ap = new CWAdhocPair(sMarker, sField, bEnabled, m_cCommentChar);
					adhocPairs.addItem(ap);
				}
				else if(sMarker == _T("rah"))
				{
#ifndef hab17a1
					coOrTdCollector.disgorge(adhocPairs);
#else // hab17a1
					commentCollector.disgorge(adhocPairs);
#endif // hab17a1
					CWAdhocPair *ap = new CWAdhocPair(sMarker, sField, bEnabled, m_cCommentChar);
					adhocPairs.addItem(ap);
				}
				else if(sMarker == _T("nah"))
				{
					coOrTdCollector.disgorge(adhocPairs);
					CWAdhocPair *ap = new CWAdhocPair(sMarker, sField, bEnabled, m_cCommentChar);
					adhocPairs.addItem(ap);
				}
				else if(sMarker == _T("maxnull"))
				{
					maxNulls = _ttoi(sField);
				}
				else if(sMarker == _T("maxp"))
				{
					maxPrefixes = _ttoi(sField);
				}
				else if(sMarker == _T("maxi"))
				{
					maxInfixes = _ttoi(sField);
				}
				else if(sMarker == _T("maxn"))
				{
					maxInterfixes = _ttoi(sField);
				}
				else if(sMarker == _T("maxs"))
				{
					maxSuffixes = _ttoi(sField);
				}
				else if(sMarker == _T("maxr"))
				{
					maxRoots = _ttoi(sField);
				}
#ifndef hab210
				else if(sMarker == _T("maxprops"))
				{
					maxProps = _ttoi(sField);
				}
#endif //hab210
				else if(sMarker == _T("cat"))
				{
					//outputFinalCat = TRUE;
					CParseStream stream(sField);
					CString sWord;
					THROW_STR_IF_NOT(stream.word(sWord, FALSE), sField);

//	enum {kNoOutputCat, kOutputPrefixCat, kOutputSuffixCat};
					//finalCatIsPrefix = (tolower(sWord[0]) == 'p'); // else assume "suffix"
					if(tolower(sWord[0]) == 'p') // else assume "suffix"
						m_radioCatOutput.setData(kOutputPrefixCat);
					else
						m_radioCatOutput.setData(kOutputSuffixCat);

					if(stream.word(sWord, FALSE))
					{
						outputAllMorphCats = (tolower(sWord[0]) == 'm'); // assume "morph"
					}
				}

				else if(sMarker == _T("dicdecap"))
				{
					decapitalizeEntries = TRUE;
				}
				else if(sMarker == _T("rd"))
				{
					m_sRootDelimiters.setData(sField); // hab210 fix typo
				}
#ifndef hab210
				else if(sMarker == _T("strcheck"))
				{
					sField = getNRStringFromNString(sField);
					commonModel.m_sStringCheck.setData(sField);
				}
#endif //hab210
#ifndef hab17a1
				else if(sMarker == _T("co") || sMarker == _T("cm")) // 1.7a1 also allow \cm for comments
#else // hab17a1
				else if(sMarker == _T("co"))
#endif // hab17a1
				{
#ifndef hab17a1
					coOrTdCollector.add(sField, _T("co"));
#else // hab17a1
					commentCollector.add(sField); // jdh 5/26/99
#endif // hab17a1
				}
				else if(sMarker == _T("id"))
					{}	// skip it
				else if(sMarker == _T("begin"))
					{}	// skip it
				else if(sMarker == _T("_sh"))	// shoebox
					{}	// skip it
				else if(sMarker == _T("sec"))	// morris's big-foot
					{}	// skip it
#ifndef hab17a1
				else if(sMarker == _T("td")) // 1.7a1 hab test data
				{
				  coOrTdCollector.add(sField, _T("td"));
				}
#endif //hab17a1
#ifndef hab211
// hab211 added CS-specific begin codes and an end code in order to keep
// comments and test data in the same list as the user put them, regardless
// of whether the list has any "real" data or not and regardless of whether
// the comment or test data are first or last in the list.
				else if(sMarker == _T("CSbegap"))
				{
				  pLastList = &commonModel.m_allomorphProperties;
				}
				else if(sMarker == _T("CSbegmp"))
				{
				  pLastList = &commonModel.m_morphemeProperties;
				}
				else if(sMarker == _T("CSbegca"))
				{
				  pLastList = &commonModel.m_categories;
				}
				else if(sMarker == _T("CSbegscl"))
				{
				  pLastList = &commonModel.stringClasses;
				}
				else if(sMarker == _T("CSbegpcl"))
				{
				  pLastList = &commonModel.punctuationClasses;
				}
				else if(sMarker == _T("CSbegccl"))
				{
				  pLastList = &commonModel.categoryClasses;
				}
				else if(sMarker == _T("CSbegmcl"))
				{
				  pLastList = &commonModel.morphemeClasses;
				}
				else if(sMarker == _T("CSbegah"))
				{
				  pLastList = &adhocPairs;
				}
				else if(sMarker == _T("CSbegcr"))
				{
				  pLastList = &compoundRootCatPairs;
				}
				else if(sMarker == _T("CSbegmcc"))
				{
				  pLastList = &generalMCCs;
				}
				else if(sMarker == _T("CSbegpt"))
				{
				  pLastList = &prefixTests;
				}
				else if(sMarker == _T("CSbegit"))
				{
				  pLastList = &infixTests;
				}
				else if(sMarker == _T("CSbegnt"))
				{
				  pLastList = &interfixTests;
				}
				else if(sMarker == _T("CSbegrt"))
				{
				  pLastList = &rootTests;
				}
				else if(sMarker == _T("CSbegst"))
				{
				  pLastList = &suffixTests;
				}
				else if(sMarker == _T("CSbegft"))
				{
				  pLastList = &finalTests;
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
					f.logSkip(_T("ANALYSIS"), sMarker, sField);
					//TRACE("ANALYSIS Skipping Field [%s]\n", sMarker);
			}
			catch(CString sProblemStr) // these ones we can keep going
			{
				CString s(_T("ANALYSIS Couldn't parse: "));
				s += sProblemStr;
				MessageBox( NULL, s, _T("Parsing Error"), MB_OK);
			}
		}
//	}
/*	catch(CString sProblemStr)// this one catches problems encountered by getField()
	{
	// these exceptions are ones encounter while trying to just get the marker and field
		// thus, sMarker and sField aren't valid here.
	//	f.throwParseFailure("Analyis Data Control File", sMarker, sField);
		CString s("Thus was a serious problem trying to read the ad.ctl file: ");
		s += sProblemStr;
		MessageBox( NULL, s, "Parsing Error", MB_OK);

		return FALSE;
	}
*/

#ifndef hab17a1
	// have to guess where to put trailing comments
	coOrTdCollector.defaultDisgorge(finalTests);
#else // hab17a1
	// have to guess where to put trailing comments
	commentCollector.defaultDisgorge(finalTests, _T("Final Tests"), lpszPathName);
#endif //hab17a1

	return TRUE;
}

// changed for beta 8 mar 99, so that 0 IS output
//#define OUTPUT_MAX(SOUT,MARKER,VALUE) if(!(VALUE==kNoMax))SOUT<<"\\"<<MARKER<<" "<<VALUE<<"\n";
#define OUTPUT_MAX(SOUT,MARKER,VALUE) SOUT<<"\\"<<MARKER<<" "<<VALUE<<"\n";

// write or rewrite the ad.ctl file
BOOL CWAnalysisModel::writeFile(CString & sPath, CWCommonModel& commonModel)
{
	CSafeStream ssOutput(sPath);
	ofstream& fout = ssOutput.openStream();
	if(::checkForFileError(sPath) != 0)
		return FALSE;

#ifdef hab217			// wrong spot; should be in intx.ctl file
	if(!commonModel.m_cAmbigDelimiter.isEmpty() && (commonModel.m_cAmbigDelimiter!=DEFAULT_AMBIG_CHAR))
		fout << "\\ambig " << commonModel.m_cAmbigDelimiter  << "\n";
#endif //hab217

#ifndef hab210
	if(!commonModel.m_sStringCheck.isEmpty())
		fout << "\\strcheck " << commonModel.m_sStringCheck  << "\n";
#endif //hab210
	if(!commonModel.m_cDecompSepChar.isEmpty() && (commonModel.m_cDecompSepChar!=DEFAULT_DECOMP_SEP_CHAR))
		fout << "\\dsc " << commonModel.m_cDecompSepChar  << "\n";

	if(decapitalizeEntries.isTrue())
		fout << "\\dicdecap\n";

	OUTPUT_MAX(fout,"maxp", maxPrefixes);
	OUTPUT_MAX(fout,"maxs", maxSuffixes);
	OUTPUT_MAX(fout,"maxr", maxRoots);
	OUTPUT_MAX(fout,"maxi", maxInfixes);
	OUTPUT_MAX(fout,"maxn", maxInterfixes);
	OUTPUT_MAX(fout,"maxnull", maxNulls); // hab 1.03 change from "maxn"
#ifndef hab210
	OUTPUT_MAX(fout,"maxprops", maxProps);
#endif //hab210
	fout << "\n";

	if(!(m_sRootDelimiters.isEmpty()) && m_sRootDelimiters.getData()!=_T("<>"))	// hab210 fix typo
		fout << "\\rd " << m_sRootDelimiters <<"\n"; // hab210 fix typo

	if(!(m_radioCatOutput == kNoOutputCat))
	{
		if(m_radioCatOutput == kOutputPrefixCat)
			fout << "\\cat prefix ";
		else //kOutputSuffixCat
			fout << "\\cat suffix ";

		if(outputAllMorphCats.isTrue())
			fout << "morph";

		fout << "\n";
	}

	fout << "\n";


/*	if(!commonModel.categories.isEmpty())
		fout << "\\ca " << commonModel.categories << "\n";
	if(!commonModel.morphemeProperties.isEmpty())
		fout << "\\mp " << commonModel.morphemeProperties << "\n";
	if(!commonModel.allomorphProperties.isEmpty())
		fout << "\\ap " << commonModel.allomorphProperties << "\n";

*/
#ifndef hab211
	commonModel.m_allomorphProperties.write(fout, commonModel.m_cCommentChar, _T("ap"));
	commonModel.m_morphemeProperties.write(fout, commonModel.m_cCommentChar, _T("mp"));
	commonModel.m_categories.write(fout, commonModel.m_cCommentChar, _T("ca"));

	fout << "\n";

	commonModel.stringClasses.write(fout, commonModel.m_cCommentChar, _T("scl"));

	commonModel.punctuationClasses.write(fout, commonModel.m_cCommentChar, _T("pcl"));

	commonModel.categoryClasses.write(fout, commonModel.m_cCommentChar, _T("ccl"));
	commonModel.morphemeClasses.write(fout, commonModel.m_cCommentChar, _T("mcl"));

	adhocPairs.write(fout, commonModel.m_cCommentChar, _T("ah"));
	fout << "\n";

	compoundRootCatPairs.write(fout, commonModel.m_cCommentChar, _T("cr"));
	fout << "\n";

	generalMCCs.write(fout, commonModel.m_cCommentChar, _T("mcc"));
	fout << "\n";

	prefixTests.write(fout, commonModel.m_cCommentChar, _T("pt"));
	infixTests.write(fout, commonModel.m_cCommentChar, _T("it"));
	interfixTests.write(fout, commonModel.m_cCommentChar, _T("nt"));
	rootTests.write(fout, commonModel.m_cCommentChar, _T("rt"));
	suffixTests.write(fout, commonModel.m_cCommentChar, _T("st"));
	finalTests.write(fout, commonModel.m_cCommentChar, _T("ft"));
#else //hab211
	commonModel.m_allomorphProperties.write(fout, commonModel.m_cCommentChar);
	commonModel.m_morphemeProperties.write(fout, commonModel.m_cCommentChar);
	commonModel.m_categories.write(fout, commonModel.m_cCommentChar);

	fout << "\n";

	commonModel.stringClasses.write(fout, commonModel.m_cCommentChar);

	commonModel.punctuationClasses.write(fout, commonModel.m_cCommentChar);// 1.06 hab

	commonModel.categoryClasses.write(fout, commonModel.m_cCommentChar);
	commonModel.morphemeClasses.write(fout, commonModel.m_cCommentChar);

	adhocPairs.write(fout, commonModel.m_cCommentChar);
	fout << "\n";

	compoundRootCatPairs.write(fout, commonModel.m_cCommentChar);
	fout << "\n";

	generalMCCs.write(fout, commonModel.m_cCommentChar);
	fout << "\n";

	prefixTests.write(fout, commonModel.m_cCommentChar);
	infixTests.write(fout, commonModel.m_cCommentChar);
	interfixTests.write(fout, commonModel.m_cCommentChar);
	rootTests.write(fout, commonModel.m_cCommentChar);
	suffixTests.write(fout, commonModel.m_cCommentChar);
	finalTests.write(fout, commonModel.m_cCommentChar);
#endif // hab211


	ssOutput.close();
	return TRUE;
}


void CWAnalysisModel::addTest(UINT id, char cType, BOOL bEnable)
{
	CString sTest;
	sTest.LoadString(id);
	CWTest* pTest = new CWTest(sTest, bEnable, '|');
	switch(cType)
	{
		case 'f': finalTests.addItem(pTest); break;
		case 'r': rootTests.addItem(pTest); break;
		case 's': suffixTests.addItem(pTest); break;
		case 'p': prefixTests.addItem(pTest); break;
		case 'i': infixTests.addItem(pTest); break;
		case 'n': interfixTests.addItem(pTest); break;
	}
}

// jdh 6/3/99 Created
void CWAnalysisModel::removeTest(UINT id, char cType)
{
	// select the test list we're working with
	CWTestList* pTL=NULL;
	switch(cType)
	{
		case 'f': pTL  = &finalTests; break;
		case 'r': pTL  = &rootTests; break;
		case 's': pTL  = &suffixTests; break;
		case 'p': pTL  = &prefixTests; break;
		case 'i': pTL  = &infixTests; break;
		case 'n': pTL  = &interfixTests; break;
	}

	ASSERTX(pTL);

	// get the label of the test we're supposed to look for
	CString sTest;
	sTest.LoadString(id);
		// lazy way to get the label we're looking for
	CWTest matchTest(sTest, TRUE, '|');

	// see if this test list has a matching test
	CWTest* pTest = pTL->findTestWithLabel(matchTest.getLabel());

	// if so, remove it
	if(pTest)
#ifndef hab261
	  {
		pTL->removeItem(pTest);
		delete pTest;	// plug memory leak
	  }
#else // hab261
		pTL->removeItem(pTest);
#endif // hab261
}


// JDH 6/3/99
void CWAnalysisModel::doModifyTestsDialog()
{
	CSheetModifyTests sheet;
#ifndef hab261
	CPageFinalCatTest finalCatTest;
#endif // hab261

	// load in the current settings
	sheet.m_affixesPage.m_bInfixes = (maxInfixes > 0);
	sheet.m_affixesPage.m_bPrefixes = (maxPrefixes > 0);
	sheet.m_affixesPage.m_bSuffixes = (maxSuffixes > 0);

	// we don't currently have a way of knowing what the category propogation scheme
	// was before, because we don't store it

	if(sheet.DoModal() == IDCANCEL)
		return;

#ifndef hab261
				// copy answers from final cat page to the
				// page used by the new language wizard
	finalCatTest.m_bCreateFinalCatTest = sheet.m_finalCatPage.m_bCreateFinalCatTests;
	finalCatTest.m_bDisableFinalCatTest = sheet.m_finalCatPage.m_bDisableFinalCatTest;
#endif // hab261

	processTestPropertyPages(&sheet.m_affixesPage,
				 &sheet.m_categoryPropogationPage,
#ifndef hab261
				 &finalCatTest);
#else // hab261
							NULL); // don't currently give user access to this page except during initial wizard
#endif // hab261
}

// this is called 1) after a new-from-scratch new language wizard
//				  2) after a ModifyTestsDialog
void CWAnalysisModel::processTestPropertyPages(CPageAffixes *pPageAffixes,
								   CPageCategoryProp* pPageCatProp,
								   CPageFinalCatTest* pPageFinalCatTest) // can be NULL, in which case finalCatTest stuff is ignored.
{

	// maximums
	if(!pPageAffixes->m_bPrefixes)
		maxPrefixes = 0;
	if(!pPageAffixes->m_bSuffixes)
		maxSuffixes = 0;
	if(!pPageAffixes->m_bInfixes)
		maxInfixes = 0;
#ifndef hab241
	else
	  maxInfixes = 1;
#endif // hab241
	// orderclass tests
	// note each of these assumes
	//	1) same orderclassed morphs can be adjacent
	//  2) zero is the wild-card
	//	3) prefixes are negative

	// remove any existing test that we may have inserted previously
	removeTest(IDS_WizOrderclass_A0_FT, 'f');
	removeTest(IDS_WizOrderclass_A0_PT, 'p');
	removeTest(IDS_WizOrderclass_A0_ST, 's');
#ifndef hab261
	removeTest(IDS_WizOrderclass_A0_IT, 'i');
#endif //hab261


	addTest(IDS_WizOrderclass_A0_FT, 'f');
	if(pPageAffixes->m_bPrefixes)
		addTest(IDS_WizOrderclass_A0_PT, 'p');
#ifndef hab261
	if(pPageAffixes->m_bInfixes)
		addTest(IDS_WizOrderclass_A0_IT, 'i');
#endif // hab261
	if(pPageAffixes->m_bSuffixes)
		addTest(IDS_WizOrderclass_A0_ST, 's');


	// category propagation

	// remove any existing test that we may have inserted previously
	removeTest(IDS_WizCatProp_RPS_ST, 's');
	removeTest(IDS_WizCatProp_RPS_RT, 'r');
	removeTest(IDS_WizCatProp_RSP_FT, 'f');
	removeTest(IDS_WizCatProp_RSP_RT, 'r');
	removeTest(IDS_WizCatProp_Pfx_InsideOut_PT, 'p');
	removeTest(IDS_WizCatProp_Ifx_InsideOut_ST, 'i');
#ifndef hab261
	removeTest(IDS_WizFinalCat_RSP_FT, 'f');
	removeTest(IDS_WizCatProp_RSP_ST, 's');
	removeTest(IDS_WizFinalCat_RPS_FT, 'f');
#endif // hab261

	if(pPageCatProp->m_nCatPropScheme == 2)
	{}
	else if (pPageCatProp->m_nCatPropScheme == 0)
	{
		// use the last suffix for the word category
		m_radioCatOutput.setData(kOutputSuffixCat);

		// RPS (Root-Prefix-Suffix order)
		//unused now addTest(IDS_WizCatProp_RPS_FT, 'f');
		addTest(IDS_WizCatProp_RPS_ST, 's'); // added april 1, 1999 from starter kit
		addTest(IDS_WizCatProp_RPS_RT, 'r'); // added april 1, 1999 from starter kit
		// the prefix test is added below, as IDS_WizCatProp_Pfx_InsideOut_PT

		// do they want a final category class test?
		if(pPageFinalCatTest && pPageFinalCatTest->m_bCreateFinalCatTest)
		{
			addTest(IDS_WizFinalCat_RPS_FT, 'f', !pPageFinalCatTest->m_bDisableFinalCatTest);
		}
	}
	else if (pPageCatProp->m_nCatPropScheme == 1) // ROOT-SUFFIX-PREFIX
	{
		// use the last prefix for the word category
		m_radioCatOutput.setData(kOutputPrefixCat);

#ifndef hab15a6
		if (!pPageAffixes->m_bPrefixes) // ROOT-SUFFIX
		{
			// RS (Root-Suffix order)
			addTest(IDS_WizCatProp_RS_ST, 's');

			// do they want a final category class test?
			if(pPageFinalCatTest && pPageFinalCatTest->m_bCreateFinalCatTest) //jdh 26Sept2000 add check for valid pPageFinalCatTest
			{
				addTest(IDS_WizFinalCat_RS_FT, 'f', !pPageFinalCatTest->m_bDisableFinalCatTest);
			}
		}
		else  // ROOT-SUFFIX-PREFIX
		{
		  // RSP (Root-Suffix-Prefix order)
		  addTest(IDS_WizCatProp_RSP_FT, 'f');
		  addTest(IDS_WizCatProp_RSP_ST, 's');

		  // do they want a final category class test?
		  if(pPageFinalCatTest && pPageFinalCatTest->m_bCreateFinalCatTest)//jdh 26Sept2000 add check for valid pPageFinalCatTest
		  {
			addTest(IDS_WizCatProp_RSP_RT, 'r', !pPageFinalCatTest->m_bDisableFinalCatTest);
			addTest(IDS_WizFinalCat_RSP_FT, 'f', !pPageFinalCatTest->m_bDisableFinalCatTest);
		  }
		}
#else // hab15a6
		// RSP (Root-Suffix-Prefix order)
		addTest(IDS_WizCatProp_RSP_FT, 'f');
		addTest(IDS_WizCatProp_RSP_RT, 'r');

		// do they want a final category class test?
		if(pPageFinalCatTest->m_bCreateFinalCatTest)
		{
			addTest(IDS_WizFinalCat_RSP_FT, 'f', !pPageFinalCatTest->m_bDisableFinalCatTest);
		}
#endif // hab15a6
	}

	// this part of the category propagation test is common to both orderings
	if(pPageCatProp->m_nCatPropScheme != 2)
	{
		if(pPageAffixes->m_bPrefixes)
			addTest(IDS_WizCatProp_Pfx_InsideOut_PT, 'p');
		//if(pPageAffixes->m_bSuffixes)
		//	addTest(IDS_WizCatProp_Sfx_InsideOut_ST, 's');
		if(pPageAffixes->m_bInfixes)
			addTest(IDS_WizCatProp_Ifx_InsideOut_ST, 'i');
	}
}
