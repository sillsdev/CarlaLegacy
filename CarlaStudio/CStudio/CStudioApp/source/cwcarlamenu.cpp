// JDH 6/2/99 Added Sentrans Adjust Rules Set for analysis
// jdh 8/27/99 Added Andy's punctuation classes of 1.06
// jdh 11/9/99 added support for Sentrans \CL field (generic classes)
// 1.7a1 03-Dec-1999 hab Add lexical changes to Synthesis (Sample)
//       07-Dec-1999 hab Allow multiple markers for certain fields
// 2.1.0 07-Mar-2000 hab Added Max properties and string checks
// jdh 4/19/02	added support for Sentrans \bpunct field
// 2.8.0 03-Dec-2004 hab Added maxInterfaces and interfix tests

#include "stdafx.h"
#include "CWInterface.h"
#include "CWTopic.h"
#include "CWModel.h"
#include "CWAmpleModels.h"
#include "CarlaLanguage.h"
#include "SentransModel.h"
#include "TransferModelSet.h"

CWInterface::CWInterface(CTabbedTreeDoc* pDoc)
: 	m_pTransferTab(NULL),
	m_pDictTab(NULL),
	m_iTransferTabIndex(-1),
	m_iDictTabIndex(-1),
	m_pLang(0),
	m_pCurrentTopicTab(NULL),
	m_pDoc(pDoc),
	textMarkerGroup("SFM markers of text to parse"),
	capitalizationGroup("Capitalization"),
	formatGroup("Format Markers"),
	wordCategoryGroup("Word Category Output"),
	m_sfmNotice("Enter the markers without slashes."),
#ifndef hab17a1
	m_multipleAddNotice("Use a space to add multiple markers (for items with a *)."),
	m_multipleDelNotice("Leave an item blank to remove extra markers.")
#else // hab17a1
	m_mutltipleAllosNotice("Use a space to add multiple allomorph markers.")
#endif //hab17a1
{}

CWCarlaMenuInterface::CWCarlaMenuInterface(CTabbedTreeDoc* pDoc):
	CWInterface(pDoc)
{

}

void CWCarlaMenuInterface::setupForLang(CCarlaLanguage* pLang)
{
	ASSERTX(pLang);
	m_pLang = pLang;
	CWCommonModel &common = pLang->getCommonModel();

	m_label = "CARLAMenu Organization";

	// text
	//		character set
	//			source characters, source case associations, target case...
	// text markers, input text changes, ouput text changes

	CWTopicTab* pTab = new CWTopicTab("Text" );
	m_topicTabs.Add(pTab);
	m_pCurrentTopicTab = pTab;
	CWTextInModel& txtIn = pLang->getTextInModel();
	CWTextOutModel& txtOut = pLang->getTextOutModel();
	CSentransDisambigModel &stDisambig = pLang->getSentransDisambigModel();
	CSentransTransferModel &stAnaAdjust = pLang->getSentransAnaAdjustmentModel();
	CSentransTransferModel &stGlossAdjust = pLang->getSentransGlossAdjustmentModel();

	// ---- CHARS ------
	CWHeadingTopic* pHeading =	new CWHeadingTopic(pTab, "Character Sets");
		pTab->Add(pHeading);
		CWFormTopic* pFTopic = new CWFormTopic(pTab, "Chars");
		pHeading->Add(pFTopic);
			pFTopic->Add(& common.m_sWFC);
			pFTopic->Add(& common.m_sWFCS);
			pFTopic->Add(& common.m_cDecompSepChar);
			pFTopic->Add(& common.m_cAmbigDelimiter);
			//pFTopic->Add(& common.m_cDecompSepChar);
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

	// CASE ASSOCIATIONS
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
		CWListTopic* pLTopic = new CWListTopic(pTab, "Input Text Changes",
			& txtIn.m_orthoChanges);
		pHeading->Add(pLTopic);


	// TEXT OUT CHANGES
		pHeading->Add(new CWListTopic(pTab, "Output Text Changes",
			& txtOut.m_orthoChanges));



	///////////////////Dictionary//////////////////////////////
	populateDictTab();

/*	pTab = new CWTopicTab("Dictionary" );

	m_topicTabs.Add(pTab);
		pHeading = new CWHeadingTopic(pTab, "Dictionary Markers");
		pTab->Add(pHeading);
			pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, "Unified"));
			pLang->getCodeTable().m_unifiedSet.addSelfToTopic(pFTopic);

			pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, "Prefix"));
			pLang->getCodeTable().m_prefixSet.addSelfToTopic(pFTopic);

			pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, "Suffix"));
			pLang->getCodeTable().m_suffixSet.addSelfToTopic(pFTopic);

			pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, "Infix"));
			pLang->getCodeTable().m_infixSet.addSelfToTopic(pFTopic);

			pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, "Root"));
			pLang->getCodeTable().m_rootSet.addSelfToTopic(pFTopic);


	// ----------- dict ortho changes -----------------------------------------------

	pFTopic = (CWFormTopic*) pTab->Add(new CWListTopic(pTab, "Dict Orthography Changes", &pLang->getDictOrthoModel().m_orthoChanges));

	// ----------- capitalization -----------------------------------------------

	CWAnalysisModel &analysis = pLang->getAnalysisModel();
	pFTopic = (CWFormTopic*) pTab->Add(new CWFormTopic(pTab, "Dictionary Capitalization"));
		pFTopic->Add(&analysis.decapitalizeEntries);


	// ----------- phonrule --------------------------------------------------------
	CPhonruleModel &phonrule = pLang->getPhonruleModel();

	pHeading = new CWHeadingTopic(m_pDictTab, "Phonology");
	m_pDictTab->Add(pHeading);
		pFTopic = new CWFormTopic(m_pDictTab, "Settings");
		pHeading->Add(pFTopic);
			pFTopic->Add(& phonrule.m_bBaseBecomesAllomorph);
			pFTopic->Add(& phonrule.m_cCutoffChar);
			pFTopic->Add(& phonrule.m_sCitationMarker);

		pLTopic = new CWListTopic(m_pDictTab, "Rules",
			&phonrule.m_rules);
		pHeading->Add(pLTopic);
*/


	/////////////////// Lists //////////////////////////////

	pTab = new CWTopicTab("Lists" );
	m_topicTabs.Add(pTab);

	pTab->Add(new CWListTopic(pTab, "Categories", &common.m_categories));
	pTab->Add(new CWListTopic(pTab, "Allomorph Properties", &common.m_allomorphProperties));
	pTab->Add(new CWListTopic(pTab, "Morpheme Properties", &common.m_morphemeProperties));
/*	pFTopic = (CWFormTopic*) pTab->Add(new CWFormTopic(pTab, "Categories"));
	pFTopic->Add(& common.categories);
	pFTopic = (CWFormTopic*) pTab->Add(new CWFormTopic(pTab, "Allomorph Properties"));
	pFTopic->Add(& common.allomorphProperties);

	pFTopic = (CWFormTopic*) pTab->Add(new CWFormTopic(pTab, "Morpheme Properties"));
	pFTopic->Add(& common.morphemeProperties);
*/
	pTab->Add(new CWListTopic(pTab, "Category Classes", &common.categoryClasses));
	pTab->Add(new CWListTopic(pTab, "Morpheme Classes", &common.morphemeClasses));
	pTab->Add(new CWListTopic(pTab, "String Classes", &common.stringClasses));

	// 1.06 hab added
	pTab->Add(new CWListTopic(pTab, "Punctuation Classes", &common.punctuationClasses));

	pTab->Add(new CWListTopic(pTab, "Adjust Gloss CL (Sentrans)", &stGlossAdjust.m_genericClasses)); // jdh 11/9/99
	pTab->Add(new CWListTopic(pTab, "Adjust Analysis CL (Sentrans)", &stAnaAdjust.m_genericClasses)); // jdh 11/9/99

	/////////////////// Constraints //////////////////////////////
	CWAnalysisModel &analysis = m_pLang->getAnalysisModel();

	pTab = new CWTopicTab("Constraints" );
	m_topicTabs.Add(pTab);
	pTab->Add(new CWListTopic(pTab, "Morpheme Cooccurrences", &analysis.generalMCCs));

		// sentrans disambig
	pFTopic = (CWFormTopic*) pTab->Add(new CWFormTopic(pTab, "Surrounding Words Punctuation"));
	pFTopic->Add(&stDisambig.m_sPunctuation);
	pFTopic->Add(&stDisambig.m_sBeginPunctuation);
	pFTopic->Add(&stDisambig.m_sSentencePunctuation);
	pFTopic->Add(&stDisambig.m_cTagChar);
	pTab->Add(new CWListTopic(pTab, "Surrounding Words Rules", &stDisambig.m_rules));

	// JDH 6/2/99 Renamed "Adjust Punctional" and "Adjust Rules" to "Adjust Gloss ..."
	//			Since we're adding another set, strictly for analysis

		// sentrans adjustment, a transfer model, used when glossing
	pHeading = new CWHeadingTopic(pTab, "Adjust Gloss (Sentrans)");	// jdh 11/9/99 added heading
	pTab->Add(pHeading);
	pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, "Punctuation"));
	pFTopic->Add(&stGlossAdjust.m_sPunctuation);
	pFTopic->Add(&stGlossAdjust.m_sBeginPunctuation);
	pFTopic->Add(&stGlossAdjust.m_sSentencePunctuation);
	pFTopic->Add(&stGlossAdjust.m_cTagChar);
	//moved to "LISTS" pHeading->Add(new CWListTopic(pTab, "CL Field", &stGlossAdjust.m_genericClasses)); // jdh 11/9/99
	pHeading->Add(new CWListTopic(pTab, "Rules", &stGlossAdjust.m_rules));

	// JDH 6/2/99 Added Sentrans Adjust Rules Set for analysis
		// sentrans adjustment, a transfer model, used for analysis
		// in rare cases, I suspect, but needed by Steve White

	pHeading = new CWHeadingTopic(pTab, "Adjust Analysis (Sentrans)");	// jdh 11/9/99 added heading
	pTab->Add(pHeading);

	pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(pTab, "Punctuation"));
	pFTopic->Add(&stAnaAdjust.m_sPunctuation);
	pFTopic->Add(&stAnaAdjust.m_sBeginPunctuation);
	pFTopic->Add(&stAnaAdjust.m_sSentencePunctuation);
	pFTopic->Add(&stAnaAdjust.m_cTagChar);
	//moved to "LISTS" pHeading->Add(new CWListTopic(pTab, "CL Field", &stAnaAdjust.m_genericClasses)); // jdh 11/9/99
	pHeading->Add(new CWListTopic(pTab, "Rules", &stAnaAdjust.m_rules));


	pTab->Add(new CWListTopic(pTab, "Compound Root Pairs", &analysis.compoundRootCatPairs));
	pTab->Add(new CWListTopic(pTab, "Ad-hoc Pairs", &analysis.adhocPairs));


	pHeading = new CWHeadingTopic(pTab, "Custom Test");
	pTab->Add(pHeading);
	pHeading->Add(new CWListTopic(pTab, "Prefix Tests", &analysis.prefixTests));
	pHeading->Add(new CWListTopic(pTab, "Infix Tests", &analysis.infixTests));
	pHeading->Add(new CWListTopic(pTab, "Suffix Tests", &analysis.suffixTests));
	pHeading->Add(new CWListTopic(pTab, "Root Tests", &analysis.rootTests));
	pHeading->Add(new CWListTopic(pTab, "Interfix Tests", &analysis.interfixTests));
	pHeading->Add(new CWListTopic(pTab, "Final Tests", &analysis.finalTests));

	/////////////////// Adaptation //////////////////////////////
//	m_pTransferTab = new CWTopicTab("Adaptation" );
//	m_iTransferTabIndex  = m_topicTabs.Add(m_pTransferTab);
	populateTransferTab();

	/////////////////// MISC //////////////////////////////
	pTab = new CWTopicTab("Misc" );
	m_topicTabs.Add(pTab);
	pFTopic = (CWFormTopic*) pTab->Add(new CWFormTopic(pTab, "Maximums"));
	pFTopic->Add(&analysis.maxNulls);
	pFTopic->Add(&analysis.maxPrefixes);
	pFTopic->Add(&analysis.maxInfixes);
	pFTopic->Add(&analysis.maxSuffixes);
	pFTopic->Add(&analysis.maxRoots);
	pFTopic->Add(&analysis.maxInterfixes);
#ifndef hab210
	pFTopic->Add(&analysis.maxProps);
#endif //hab210

	// ana output
	pFTopic = (CWFormTopic*) pTab->Add(new CWFormTopic(pTab, "ANA File Output"));
	pFTopic->Add(&analysis.m_sRootDelimiters); // hab210 fix typo
	pFTopic->Add(& wordCategoryGroup);
	wordCategoryGroup.Add(& analysis.m_radioCatOutput);

	pFTopic->Add(&analysis.outputAllMorphCats);
}


// this is separate because the tab can't be setup completely until
// late in the game.  Also, in the future we will need to dynamically
// add and remove transfer paths to an existing interface
// Can be called repeatedly, at any time after setupForLang() has been called
void CWCarlaMenuInterface::populateTransferTab()
{
	CWInterface::populateTransferTab();

	// carla menu puts synthesis and transfer together, under adaptation

	CWHeadingTopic* pHeading = new CWHeadingTopic(m_pTransferTab, "Synthesis");
		m_pTransferTab->Add(pHeading);

#ifndef hab17a1			// 1.7a1 hab add synthesis lex changes
	pHeading->Add(new CWListTopic(
				m_pTransferTab,
				"Synthesis Lexical Changes",
				&m_pLang->getStampSynthesisModel().m_lexChanges));
#endif // hab17a1

	CWFormTopic* pFTopic = new CWFormTopic(m_pTransferTab, "Protoform Symbols");
		pFTopic->Add(&m_pLang->getStampSynthesisModel().m_protoformChars);
		pHeading->Add(pFTopic);


	pHeading->Add(new CWListTopic(
				m_pTransferTab,
				"Protoform Rules",
				&m_pLang->getStampSynthesisModel().m_regSoundChanges));

#ifndef hab17a1
/* Lexical changes must be here as well as in transfer.  Synthesis lex changes
   apply to forms coming into synthesis (i.e. regardless of the source).
   Transfer lex changes are pair-wise changes.  See STAMP book.
*/
#else // hab17a1
/* "Lexical changes isn't here because it's a transfer thing, and those
	have to be handled differently in CStudio than carla menu because
	we have more than one possible target lang.
*/
#endif // hab17a1

	pHeading->Add(new CWListTopic(
				m_pTransferTab,
				"Synthesis Tests",
				&m_pLang->getStampSynthesisModel().m_tests));

}
