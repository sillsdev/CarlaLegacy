// JDH 6/2/99 Added Sentrans Adjust Rules Set for analysis
// jdh 8/27/99 Added Andy's punctuation classes of 1.06
//	jdh 11/9/99 added support for Sentrans \CL field (generic classes)
// 1.7a1 03-Dec-1999 hab Add lexical changes to Synthesis (Sample)
//                       Make order of Sentrans CL field consistent
// 2.1.0 07-Mar-2000 hab Added Max properties and string check
// jdh 5/29/01	added sentrans patterns
// jdh 4/19/02	added support for Sentrans \bpunct field

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
	m_label = "Functional Organization";
	CWCommonModel &common = pLang->getCommonModel();

	// text
	//		character set
	//			source characters, source case associations, target case...
	// text markers, input text changes, ouput text changes

	CWTopicTab* pTab = new CWTopicTab("Input" );
	m_pCurrentTopicTab = pTab;
	CWTextInModel& txtIn = pLang->getTextInModel();
	CWTextOutModel& txtOut = pLang->getTextOutModel();

	// CHARACTERS

	CWHeadingTopic* pHeading =	new CWHeadingTopic(pTab, "Character Sets");
	pTab->Add(pHeading);
		CWFormTopic* pFTopic = new CWFormTopic(pTab, "Chars");
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
			pFTopic = new CWFormTopic(pTab, "Case Associations");
				pHeading->Add(pFTopic);
				pFTopic->Add(&common.m_sLUWFC);
				pFTopic->Add(&common.m_sLUWFCS);


	// TEXT MARKERS
			pFTopic = new CWFormTopic(pTab, "Text Markers");
			pHeading->Add(pFTopic);

			// add group
			pFTopic->Add(& textMarkerGroup);
			textMarkerGroup.Add(& txtIn.rIncludeOrExcludeMarkers);
			textMarkerGroup.Add(& txtIn.sMarkersToIncludeOrExclude);

		// TEXT IN CHANGES
			CWListTopic* pLTopic = new CWListTopic(pTab, "Input Ortho Changes",
				& txtIn.m_orthoChanges);
			pHeading->Add(pLTopic);

	pTab->SetCurrentTopic(pFTopic);
	m_topicTabs.Add(pTab);

	///////////////////Dictionary//////////////////////////////
	populateDictTab();



	/////////////////// ANALYSIS //////////////////////////////
	CWAnalysisModel &analysis = m_pLang->getAnalysisModel();

	pTab = new CWTopicTab("Analysis" );
	m_topicTabs.Add(pTab);

	pHeading = new CWHeadingTopic(pTab, "Morphophonemics");
	pTab->Add(pHeading);

//	pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, "Allomorph Properties"));
//	pFTopic->Add(&common.allomorphProperties);

	pHeading->Add(new CWListTopic(pTab, "Allomorph Properties", &common.m_allomorphProperties));
	pHeading->Add(new CWListTopic(pTab, "String Classes", &common.stringClasses));

	// 1.06 hab added
	pHeading->Add(new CWListTopic(pTab, "Punctuation Classes", &common.punctuationClasses));

	pHeading = new CWHeadingTopic(pTab, "Morphotactics");
	pTab->Add(pHeading);

	pHeading->Add(new CWListTopic(pTab, "Ad-hoc Pairs", &analysis.adhocPairs));
	pHeading->Add(new CWListTopic(pTab, "Categories", &common.m_categories));
	pHeading->Add(new CWListTopic(pTab, "Category Classes", &common.categoryClasses));

	pHeading->Add(new CWListTopic(pTab, "Compound Root Pairs", &analysis.compoundRootCatPairs));

	pHeading->Add(new CWListTopic(pTab, "Morpheme Classes", &common.morphemeClasses));

	pHeading->Add(new CWListTopic(pTab, "Morpheme Cooccurrences", &analysis.generalMCCs));

	pHeading->Add(new CWListTopic(pTab, "Morpheme Properties", &common.m_morphemeProperties));


	// apparently nested headings are not supported yet
	//CWHeadingTopic* pHeading2 = new CWHeadingTopic(pTab, "Tests");
	//pHeading->Add(pHeading2);
	pHeading->Add(new CWListTopic(pTab, "Prefix Tests", &analysis.prefixTests));
	pHeading->Add(new CWListTopic(pTab, "Infix Tests", &analysis.infixTests));
	pHeading->Add(new CWListTopic(pTab, "Suffix Tests", &analysis.suffixTests));
	pHeading->Add(new CWListTopic(pTab, "Root Tests", &analysis.rootTests));
	pHeading->Add(new CWListTopic(pTab, "Final Tests", &analysis.finalTests));


	// Maximums
	pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, "Maximums"));
	pFTopic->Add(&analysis.maxNulls);
	pFTopic->Add(&analysis.maxPrefixes);
	pFTopic->Add(&analysis.maxInfixes);
	pFTopic->Add(&analysis.maxSuffixes);
	pFTopic->Add(&analysis.maxRoots);
#ifndef hab210
	pFTopic->Add(&analysis.maxProps);
#endif //hab210

	pHeading = new CWHeadingTopic(pTab, "Syntax");
	pTab->Add(pHeading);

	// sentrans disambig
	CSentransDisambigModel &stDisambig = pLang->getSentransDisambigModel();
#ifndef hab17a1
	pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, "Surrounding Words Punctuation"));
	pFTopic->Add(&stDisambig.m_sPunctuation);
	pFTopic->Add(&stDisambig.m_sBeginPunctuation);
	pFTopic->Add(&stDisambig.m_sSentencePunctuation);
	pFTopic->Add(&stDisambig.m_cTagChar);
	pHeading->Add(new CWListTopic(pTab, "Sentrans CL Field", &stDisambig.m_genericClasses));
	pHeading->Add(new CWListTopic(pTab, "Sentrans Patterns", &stDisambig.m_patterns)); // jdh 5/29/01
	pHeading->Add(new CWListTopic(pTab, "Surrounding Words Rules", &stDisambig.m_rules));
#else // hab17a1
	pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, "Surrounding Words Punctuation"));
	pFTopic->Add(&stDisambig.m_sPunctuation);
	pFTopic->Add(&stDisambig.m_sSentencePunctuation);
	pFTopic->Add(&stDisambig.m_cTagChar);
	pHeading->Add(new CWListTopic(pTab, "Surrounding Words Rules", &stDisambig.m_rules));
	pHeading->Add(new CWListTopic(pTab, "Sentrans CL Field", &stDisambig.m_genericClasses)); // jdh 11/9/99
#endif // hab17a1

	// JDH 6/2/99 Renamed "Adjust Punctional" and "Adjust Rules" to "Adjust Gloss ..."
	//			Since we're adding another set, strictly for analysis

		// sentrans adjustment, a transfer model, used when glossing
	pHeading = new CWHeadingTopic(pTab, "Adjust Gloss (Sentrans)");	// jdh 11/9/99 added heading
	pTab->Add(pHeading);
	CSentransTransferModel &stGlossAdjust = pLang->getSentransGlossAdjustmentModel();
	pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, "Punctuation"));
	pFTopic->Add(&stGlossAdjust.m_sPunctuation);
	pFTopic->Add(&stGlossAdjust.m_sBeginPunctuation);
	pFTopic->Add(&stGlossAdjust.m_sSentencePunctuation);
	pFTopic->Add(&stGlossAdjust.m_cTagChar);
	pHeading->Add(new CWListTopic(pTab, "CL Field", &stGlossAdjust.m_genericClasses)); // jdh 11/9/99
	pHeading->Add(new CWListTopic(pTab, "Patterns", &stGlossAdjust.m_patterns)); // jdh 5/29/01
	pHeading->Add(new CWListTopic(pTab, "Rules", &stGlossAdjust.m_rules));

	// JDH 6/2/99 Added Sentrans Adjust Rules Set for analysis
		// sentrans adjustment, a transfer model, used for analysis
		// in rare cases, I suspect, but needed by Steve White
	pHeading = new CWHeadingTopic(pTab, "Adjust Analysis (Sentrans)");	// jdh 11/9/99 added heading
	pTab->Add(pHeading);

	CSentransTransferModel &stAnaAdjust = pLang->getSentransAnaAdjustmentModel();
	pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, "Punctuation"));
	pFTopic->Add(&stAnaAdjust.m_sPunctuation);
	pFTopic->Add(&stAnaAdjust.m_sBeginPunctuation);
	pFTopic->Add(&stAnaAdjust.m_sSentencePunctuation);
	pFTopic->Add(&stAnaAdjust.m_cTagChar);
	pHeading->Add(new CWListTopic(pTab, "CL Field", &stAnaAdjust.m_genericClasses)); // jdh 11/9/99
	pHeading->Add(new CWListTopic(pTab, "Patterns", &stAnaAdjust.m_patterns)); // // jdh 5/29/01
	pHeading->Add(new CWListTopic(pTab, "Rules", &stAnaAdjust.m_rules));


	//ANA Output
	pFTopic = new CWFormTopic(pTab, "ANA File Output");
	pTab->Add(pFTopic);
	//pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, "ANA File Output"));
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
	pTab = new CWTopicTab("Synthesis" );
	m_topicTabs.Add(pTab);

#ifndef hab17a1			// 1.7a1 hab add synthesis lex changes and rework outline
	pHeading = new CWHeadingTopic(pTab, "Mappings");
	pTab->Add(pHeading);
	pHeading->Add(new CWListTopic(
				pTab,
				"Synthesis Lexical Changes",
				&m_pLang->getStampSynthesisModel().m_lexChanges));
	pFTopic = new CWFormTopic(pTab, "Protoform Symbols");
		pFTopic->Add(&m_pLang->getStampSynthesisModel().m_protoformChars);
		pHeading->Add(pFTopic);

	pHeading->Add(new CWListTopic(
				pTab,
				"Protoform Rules",
				&m_pLang->getStampSynthesisModel().m_regSoundChanges));

	pHeading = new CWHeadingTopic(pTab, "Morphophonemics");
	pTab->Add(pHeading);
	pHeading->Add(new CWListTopic(
				pTab,
				"Synthesis Tests",
				&m_pLang->getStampSynthesisModel().m_tests));

	pHeading = new CWHeadingTopic(pTab, "Text Output");
	pTab->Add(pHeading);
	pHeading->Add( new CWListTopic(pTab, "Output Ortho Changes",
				& txtOut.m_orthoChanges));
#else
	pFTopic = new CWFormTopic(pTab, "Protoform Symbols");
		pFTopic->Add(&m_pLang->getStampSynthesisModel().m_protoformChars);
		pTab->Add(pFTopic);

	pTab->Add(new CWListTopic(
				pTab,
				"Protoform Rules",
				&m_pLang->getStampSynthesisModel().m_regSoundChanges));

	pTab->Add(new CWListTopic(
				pTab,
				"Synthesis Tests",
				&m_pLang->getStampSynthesisModel().m_tests));

	pTab->Add( new CWListTopic(pTab, "Output Ortho Changes",
				& txtOut.m_orthoChanges));
#endif // hab17a1
}
