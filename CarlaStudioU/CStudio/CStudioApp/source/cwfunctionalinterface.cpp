// JDH 6/2/99 Added Sentrans Adjust Rules Set for analysis
// jdh 8/27/99 Added Andy's punctuation classes of 1.06
//	jdh 11/9/99 added support for Sentrans \CL field (generic classes)
// 1.7a1 03-Dec-1999 hab Add lexical changes to Synthesis (Sample)
//                       Make order of Sentrans CL field consistent
// 2.1.0 07-Mar-2000 hab Added Max properties and string check
// jdh 5/29/01	added sentrans patterns
// jdh 4/19/02	added support for Sentrans \bpunct field
// 2.8.0 06-Dec-2004 hab Added maxInterfaces and interfix tests

#include "stdafx.h"
#include "CWInterface.h"
#include "CWTopic.h"
#include "CWModel.h"
#include "TabbedTreeDoc.h"
#include "CarlaLanguage.h"



CWFunctionalInterface::CWFunctionalInterface(CTabbedTreeDoc* pDoc):
	CWInterface(pDoc)
{
}


void CWFunctionalInterface::setupForLang(CCarlaLanguage* pLang)
{
	ASSERTX(pLang);
	m_pLang = pLang;
	m_label = _T("Functional Organization");
	CWCommonModel &common = pLang->getCommonModel();

	// text
	//		character set
	//			source characters, source case associations, target case...
	// text markers, input text changes, ouput text changes

	CWTopicTab* pTab = new CWTopicTab(_T("Input") );
	m_pCurrentTopicTab = pTab;
	CWTextInModel& txtIn = pLang->getTextInModel();
	CWTextOutModel& txtOut = pLang->getTextOutModel();

	// CHARACTERS

	CWHeadingTopic* pHeading =	new CWHeadingTopic(pTab, _T("Character Sets"));
	pTab->Add(pHeading);
		CWFormTopic* pFTopic = new CWFormTopic(pTab, _T("Chars"));
		pHeading->Add(pFTopic);
			pFTopic->Add(& common.m_sWFC);
			pFTopic->Add(& common.m_sWFCS);
			pFTopic->Add(& common.m_cDecompSepChar);
			pFTopic->Add(& common.m_cAmbigDelimiter);
			pFTopic->Add(& common.m_cDecompSepChar);
			pFTopic->Add(& common.m_cCommentChar);

			// add group
			pFTopic->Add(& capitalizationGroup);
			capitalizationGroup.Add(& txtIn.bHasUpperLowerCase);
			capitalizationGroup.Add(& txtIn.bPreserveWordMedialCaps);
			capitalizationGroup.Add(& txtIn.iMaxDecap);

			// add group
			pFTopic->Add(& formatGroup);
			formatGroup.Add(& common.m_cPrimaryFormatChar);
			formatGroup.Add(& common.m_cSecondaryFormatChar);
			formatGroup.Add(& txtIn.sFormatCodes);
#ifndef hab210
				// add to end:
			pFTopic->Add(& common.m_sStringCheck);
#endif //hab210

	// CASES ASSOCIATIONS
			pFTopic = new CWFormTopic(pTab, _T("Case Associations"));
				pHeading->Add(pFTopic);
				pFTopic->Add(&common.m_sLUWFC);
				pFTopic->Add(&common.m_sLUWFCS);


	// TEXT MARKERS
			pFTopic = new CWFormTopic(pTab, _T("Text Markers"));
			pHeading->Add(pFTopic);

			// add group
			pFTopic->Add(& textMarkerGroup);
			textMarkerGroup.Add(& txtIn.rIncludeOrExcludeMarkers);
			textMarkerGroup.Add(& txtIn.sMarkersToIncludeOrExclude);

		// TEXT IN CHANGES
			CWListTopic* pLTopic = new CWListTopic(pTab, _T("Input Ortho Changes"),
				& txtIn.m_orthoChanges);
			pHeading->Add(pLTopic);

	pTab->SetCurrentTopic(pFTopic);
	m_topicTabs.Add(pTab);

	///////////////////Dictionary//////////////////////////////
	populateDictTab();



	/////////////////// ANALYSIS //////////////////////////////
	CWAnalysisModel &analysis = m_pLang->getAnalysisModel();

	pTab = new CWTopicTab(_T("Analysis") );
	m_topicTabs.Add(pTab);

	pHeading = new CWHeadingTopic(pTab, _T("Morphophonemics"));
	pTab->Add(pHeading);

//	pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, _T("Allomorph Properties")));
//	pFTopic->Add(&common.allomorphProperties);

	pHeading->Add(new CWListTopic(pTab, _T("Allomorph Properties"), &common.m_allomorphProperties));
	pHeading->Add(new CWListTopic(pTab, _T("String Classes"), &common.stringClasses));

	// 1.06 hab added
	pHeading->Add(new CWListTopic(pTab, _T("Punctuation Classes"), &common.punctuationClasses));

	pHeading = new CWHeadingTopic(pTab, _T("Morphotactics"));
	pTab->Add(pHeading);

	pHeading->Add(new CWListTopic(pTab, _T("Ad-hoc Pairs"), &analysis.adhocPairs));
	pHeading->Add(new CWListTopic(pTab, _T("Categories"), &common.m_categories));
	pHeading->Add(new CWListTopic(pTab, _T("Category Classes"), &common.categoryClasses));

	pHeading->Add(new CWListTopic(pTab, _T("Compound Root Pairs"), &analysis.compoundRootCatPairs));

	pHeading->Add(new CWListTopic(pTab, _T("Morpheme Classes"), &common.morphemeClasses));

	pHeading->Add(new CWListTopic(pTab, _T("Morpheme Cooccurrences"), &analysis.generalMCCs));

	pHeading->Add(new CWListTopic(pTab, _T("Morpheme Properties"), &common.m_morphemeProperties));


	// apparently nested headings are not supported yet
	//CWHeadingTopic* pHeading2 = new CWHeadingTopic(pTab, _T("Tests"));
	//pHeading->Add(pHeading2);
	pHeading->Add(new CWListTopic(pTab, _T("Prefix Tests"), &analysis.prefixTests));
	pHeading->Add(new CWListTopic(pTab, _T("Infix Tests"), &analysis.infixTests));
	pHeading->Add(new CWListTopic(pTab, _T("Suffix Tests"), &analysis.suffixTests));
	pHeading->Add(new CWListTopic(pTab, _T("Root Tests"), &analysis.rootTests));
	pHeading->Add(new CWListTopic(pTab, _T("Interfix Tests"), &analysis.interfixTests));
	pHeading->Add(new CWListTopic(pTab, _T("Final Tests"), &analysis.finalTests));


	// Maximums
	pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, _T("Maximums")));
	pFTopic->Add(&analysis.maxNulls);
	pFTopic->Add(&analysis.maxPrefixes);
	pFTopic->Add(&analysis.maxInfixes);
	pFTopic->Add(&analysis.maxSuffixes);
	pFTopic->Add(&analysis.maxRoots);
	pFTopic->Add(&analysis.maxInterfixes);
#ifndef hab210
	pFTopic->Add(&analysis.maxProps);
#endif //hab210

	pHeading = new CWHeadingTopic(pTab, _T("Syntax"));
	pTab->Add(pHeading);

	// sentrans disambig
	CSentransDisambigModel &stDisambig = pLang->getSentransDisambigModel();
#ifndef hab17a1
	pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, _T("Surrounding Words Punctuation")));
	pFTopic->Add(&stDisambig.m_sPunctuation);
	pFTopic->Add(&stDisambig.m_sBeginPunctuation);
	pFTopic->Add(&stDisambig.m_sSentencePunctuation);
	pFTopic->Add(&stDisambig.m_cTagChar);
	pHeading->Add(new CWListTopic(pTab, _T("Sentrans CL Field"), &stDisambig.m_genericClasses));
	pHeading->Add(new CWListTopic(pTab, _T("Sentrans Patterns"), &stDisambig.m_patterns)); // jdh 5/29/01
	pHeading->Add(new CWListTopic(pTab, _T("Surrounding Words Rules"), &stDisambig.m_rules));
#else // hab17a1
	pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, _T("Surrounding Words Punctuation")));
	pFTopic->Add(&stDisambig.m_sPunctuation);
	pFTopic->Add(&stDisambig.m_sSentencePunctuation);
	pFTopic->Add(&stDisambig.m_cTagChar);
	pHeading->Add(new CWListTopic(pTab, _T("Surrounding Words Rules"), &stDisambig.m_rules));
	pHeading->Add(new CWListTopic(pTab, _T("Sentrans CL Field"), &stDisambig.m_genericClasses)); // jdh 11/9/99
#endif // hab17a1

	// JDH 6/2/99 Renamed _T("Adjust Punctional") and _T("Adjust Rules") to _T("Adjust Gloss ...")
	//			Since we're adding another set, strictly for analysis

		// sentrans adjustment, a transfer model, used when glossing
	pHeading = new CWHeadingTopic(pTab, _T("Adjust Gloss (Sentrans)"));	// jdh 11/9/99 added heading
	pTab->Add(pHeading);
	CSentransTransferModel &stGlossAdjust = pLang->getSentransGlossAdjustmentModel();
	pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, _T("Punctuation")));
	pFTopic->Add(&stGlossAdjust.m_sPunctuation);
	pFTopic->Add(&stGlossAdjust.m_sBeginPunctuation);
	pFTopic->Add(&stGlossAdjust.m_sSentencePunctuation);
	pFTopic->Add(&stGlossAdjust.m_cTagChar);
	pHeading->Add(new CWListTopic(pTab, _T("CL Field"), &stGlossAdjust.m_genericClasses)); // jdh 11/9/99
	pHeading->Add(new CWListTopic(pTab, _T("Patterns"), &stGlossAdjust.m_patterns)); // jdh 5/29/01
	pHeading->Add(new CWListTopic(pTab, _T("Rules"), &stGlossAdjust.m_rules));

	// JDH 6/2/99 Added Sentrans Adjust Rules Set for analysis
		// sentrans adjustment, a transfer model, used for analysis
		// in rare cases, I suspect, but needed by Steve White
	pHeading = new CWHeadingTopic(pTab, _T("Adjust Analysis (Sentrans)"));	// jdh 11/9/99 added heading
	pTab->Add(pHeading);

	CSentransTransferModel &stAnaAdjust = pLang->getSentransAnaAdjustmentModel();
	pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, _T("Punctuation")));
	pFTopic->Add(&stAnaAdjust.m_sPunctuation);
	pFTopic->Add(&stAnaAdjust.m_sBeginPunctuation);
	pFTopic->Add(&stAnaAdjust.m_sSentencePunctuation);
	pFTopic->Add(&stAnaAdjust.m_cTagChar);
	pHeading->Add(new CWListTopic(pTab, _T("CL Field"), &stAnaAdjust.m_genericClasses)); // jdh 11/9/99
	pHeading->Add(new CWListTopic(pTab, _T("Patterns"), &stAnaAdjust.m_patterns)); // // jdh 5/29/01
	pHeading->Add(new CWListTopic(pTab, _T("Rules"), &stAnaAdjust.m_rules));


	//ANA Output
	pFTopic = new CWFormTopic(pTab, _T("ANA File Output"));
	pTab->Add(pFTopic);
	//pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, _T("ANA File Output")));
#ifdef hab210
	//pFTopic->Add(&analysis.m_sRootDelimeters);
#else
	pFTopic->Add(&analysis.m_sRootDelimiters); // turn on and correct typo
#endif //hab210

	// category output
	pFTopic->Add(& wordCategoryGroup);
	wordCategoryGroup.Add(& analysis.m_radioCatOutput);
	pFTopic->Add(&analysis.outputAllMorphCats);


	/////////////////// TRANSFER //////////////////////////////
	populateTransferTab();

	/////////////////// Synthesis //////////////////////////////
	pTab = new CWTopicTab(_T("Synthesis") );
	m_topicTabs.Add(pTab);

#ifndef hab17a1			// 1.7a1 hab add synthesis lex changes and rework outline
	pHeading = new CWHeadingTopic(pTab, _T("Mappings"));
	pTab->Add(pHeading);
	pHeading->Add(new CWListTopic(
				pTab,
				_T("Synthesis Lexical Changes"),
				&m_pLang->getStampSynthesisModel().m_lexChanges));
	pFTopic = new CWFormTopic(pTab, _T("Protoform Symbols"));
		pFTopic->Add(&m_pLang->getStampSynthesisModel().m_protoformChars);
		pHeading->Add(pFTopic);

	pHeading->Add(new CWListTopic(
				pTab,
				_T("Protoform Rules"),
				&m_pLang->getStampSynthesisModel().m_regSoundChanges));

	pHeading = new CWHeadingTopic(pTab, _T("Morphophonemics"));
	pTab->Add(pHeading);
	pHeading->Add(new CWListTopic(
				pTab,
				_T("Synthesis Tests"),
				&m_pLang->getStampSynthesisModel().m_tests));

	pHeading = new CWHeadingTopic(pTab, _T("Text Output"));
	pTab->Add(pHeading);
	pHeading->Add( new CWListTopic(pTab, _T("Output Ortho Changes"),
				& txtOut.m_orthoChanges));
#else
	pFTopic = new CWFormTopic(pTab, _T("Protoform Symbols"));
		pFTopic->Add(&m_pLang->getStampSynthesisModel().m_protoformChars);
		pTab->Add(pFTopic);

	pTab->Add(new CWListTopic(
				pTab,
				_T("Protoform Rules"),
				&m_pLang->getStampSynthesisModel().m_regSoundChanges));

	pTab->Add(new CWListTopic(
				pTab,
				_T("Synthesis Tests"),
				&m_pLang->getStampSynthesisModel().m_tests));

	pTab->Add( new CWListTopic(pTab, _T("Output Ortho Changes"),
				& txtOut.m_orthoChanges));
#endif // hab17a1
}
