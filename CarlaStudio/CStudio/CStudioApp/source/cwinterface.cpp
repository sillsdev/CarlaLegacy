//	jdh 11/9/99 added support for Sentrans \CL field (generic classes)
// 1.7a1 03-Dec-1999 hab Removed Ctrl-Ms from end of lines
//                       Made order of Sentrans CL filed consistent
//       07-Dec-1999 hab Added interlinear and stamp dict code tables.
//                       Make order of Sentrans CL field consistent
// jdh 5/29/01	added sentrans patterns

#include "stdafx.h"
#include "CWInterface.h"
#include "CWTopic.h"
#include "TabbedTreeDoc.h"
#include "CarlaLanguage.h"
#include "TransferModelSet.h"
#include "StampModel.h"

static void addTransferModel(CTransferModelSet* pTMS, CWTopicTab* pTab, LPCTSTR lpszLabel);

// called by the interface::SetCurrentTopic
// call with NULL to choose default (=first) topic
CWTopic* CWTopicTab::SetCurrentTopic(CWTopic* pTopic)
{
	if (pTopic == NULL)
		pTopic = m_topics[0];

	// TO DO: should make sure this topic is one of our topics


	m_pCurrentTopic = pTopic;
	return m_pCurrentTopic;
}



CWTopic* CWTopicTab::get_currentTopic()
{
	ASSERTX(m_pCurrentTopic);
	return m_pCurrentTopic;
}

CWTopicTab::~CWTopicTab()
{
	int i = 0;
	while (i < m_topics.GetSize() )
	{
		delete m_topics.GetAt( i++ );
	}
	m_topics.RemoveAll();

}

//===========================================================
CWInterface::~CWInterface()
{
	int i = 0;
	while (i < m_topicTabs.GetSize() )
	{
		delete m_topicTabs.GetAt( i++ );
	}
	m_topicTabs.RemoveAll();

}


// called by the tree control
CWTopic* CWInterface::SetCurrentTopic(CWTopic* pTopic)
{
	ASSERTX(m_pLang);
	// if input was NULL, this will set to default
	pTopic = 	m_pCurrentTopicTab-> SetCurrentTopic(pTopic);
	m_pDoc->TopicChanged(pTopic);

	return pTopic;
}

CWTopicTab* CWInterface::GetCurrentTopicTab()
{
	ASSERTX(m_pLang);
	ASSERTX(m_pCurrentTopicTab);
	return m_pCurrentTopicTab;
}


void CWInterface::SetCurrentTabInt(UINT iTab)
{
	ASSERTX(m_pLang);
	ASSERTX(int(iTab) < m_topicTabs.GetSize());
	m_pCurrentTopicTab = m_topicTabs[iTab];
	CWTopic* t = SetCurrentTopic(NULL);// set to default topic
// already been called by SetCurrentTopic
	//	m_pDoc->TopicChanged(t);
}

TopicTabArray* CWInterface::GetTopicTabArray()
{
	ASSERTX(m_pLang);
	ASSERTX(m_topicTabs.GetSize());
	return &m_topicTabs;
}


// Called during the FinishCreate cycle to clean up
// anything that couldn't be done until all language
// docs were loaded.
void CWInterface::finishCreate()
{
	populateTransferTab();
}


// this is separate because the tab can't be setup completely until
// late in the game.  Also, in the future we will need to dynamically
// add and remove transfer paths to an existing interface
// Can be called repeatedly, at any time after setupForLang() has been called

// jdh 11/9/99 Added option to show "From Source" rather than "To Target"
void CWInterface::populateTransferTab()
{
	ASSERTX(m_pLang);

	// jdh dec 98 code was this way, looks wrong
	//if(m_pTransferTab)
	//	delete m_topicTabs.GetAt(m_iTransferTabIndex);
	// else
	//		m_iTransferTabIndex  = m_topicTabs.Add(m_pTransferTab);
	//m_pTransferTab = new CWTopicTab(getTransferTabLabel() );

	// replace the existing tab with this new one
	BOOL bFix = (m_pCurrentTopicTab == m_pTransferTab);
	if(m_pTransferTab)
		delete m_topicTabs.GetAt(m_iTransferTabIndex);

	m_pTransferTab = new CWTopicTab(getTransferTabLabel() );
	if(bFix)
		m_pCurrentTopicTab = m_pTransferTab;

	if(m_iTransferTabIndex <0) // first time
		m_iTransferTabIndex  = m_topicTabs.Add(m_pTransferTab);
	else
		m_topicTabs.SetAt(m_iTransferTabIndex, m_pTransferTab);

	// now for each language this language is set up to transfer to,
	// we insert a section for the data on how to transfer to that language

	if(!m_pLang->getTransferModels().GetSize())
	{
		CWHeadingTopic *pHeading;
		pHeading = new CWHeadingTopic(m_pTransferTab, "No Transfer Models");
		m_pTransferTab->Add(pHeading);
	}
	else
	{
		int i;
		if(m_pLang->m_wDisplayFlags & CCarlaLanguage::kLocateTransferWithTarget)
			// show "From Source" rather than "To Target"
			for(i=0; i<m_pLang->getTransferModels().GetSize(); i++)
			{
				CTransferModelSet* pTMS = m_pLang->getTransferModels()[i];
				CCarlaLanguage* pL = pTMS->getTargetLang();
				// now find our language it that language's list of transfermodels
				for(int x=0; x<pL->getTransferModels().GetSize(); x++)
					if( pL->getTransferModels()[x]->getTargetLang() == m_pLang)
					{
						// add it to the list as "From foo"
						CString s;
						s.Format("From %s", pL->getName());
						addTransferModel(pL->getTransferModels()[x], m_pTransferTab, s);
						break;
					}
			}
		else
			for(i=0; i<m_pLang->getTransferModels().GetSize(); i++)
			{
				CTransferModelSet* pTMS = m_pLang->getTransferModels()[i];
				CString s;
				s.Format("To %s", pTMS->getTargetLang()->getName());
				addTransferModel(pTMS, m_pTransferTab, s);
			}
	}
}

// jdh 11/9/99 separated out from populateTransferTab()
static void addTransferModel(CTransferModelSet* pTMS, CWTopicTab* pTab, LPCTSTR lpszLabel)
{
	CWHeadingTopic *pHeading;
	CWFormTopic *pFTopic;
	CSentransTransferModel& rSTModel = pTMS->getSentransTransferModel();

	CString s(lpszLabel);
	pHeading = new CWHeadingTopic(pTab, s);
	pTab->Add(pHeading);
		pFTopic = new CWFormTopic(pTab, "SENTRANS Punct");
			pFTopic->Add(&rSTModel.m_sPunctuation);
			pFTopic->Add(&rSTModel.m_sSentencePunctuation);
			pFTopic->Add(&rSTModel.m_cTagChar);
		pHeading->Add(pFTopic);
#ifndef hab17a1
	pHeading->Add(new CWListTopic(pTab, "SENTRANS CL Field", &rSTModel.m_genericClasses));
	pHeading->Add(new CWListTopic(pTab, "SENTRANS Patterns", &rSTModel.m_patterns));  // jdh 5/29/01
	pHeading->Add(new CWListTopic(pTab, "SENTRANS Rules", &rSTModel.m_rules));
#else // hab17a1
	pHeading->Add(new CWListTopic(pTab, "SENTRANS Rules", &rSTModel.m_rules));
	pHeading->Add(new CWListTopic(pTab, "SENTRANS CL Field", &rSTModel.m_genericClasses)); // jdh 11/9/99
#endif // hab17a1

	// stamp transfer
	pHeading->Add(new CWListTopic(
					pTab,
					"STAMP Morpheme Transfer",
					&pTMS->getStampTransferModel()->m_transferExpressions));
	pHeading->Add(new CWListTopic(
					pTab,
					"STAMP Lexical Changes",
					&pTMS->getStampTransferModel()->m_lexChanges));

}

// this is separate so that the user can change the dict-orgnanization method (unified or not)
// and have the interface dynamically adapt
void CWInterface::populateDictTab()
{
	ASSERTX(m_pLang);

	// replace the existing tab with this new one
	BOOL bFix = (m_pCurrentTopicTab == m_pDictTab);
	if(m_pDictTab)
		delete m_topicTabs.GetAt(m_iDictTabIndex);

	m_pDictTab = new CWTopicTab("Dictionary" );

	if(bFix)
		m_pCurrentTopicTab = m_pDictTab;

	if(m_iDictTabIndex <0)	// first time
		m_iDictTabIndex  = m_topicTabs.Add(m_pDictTab);
	else
		m_topicTabs.SetAt(m_iDictTabIndex, m_pDictTab);


	// now load the tab

	CWFormTopic* pFTopic=NULL;
	CWHeadingTopic* pHeading=NULL;

	if(m_pLang->getMFS()->getUsingUnifiedDicts())
	{
#ifndef hab17a1
		pFTopic = (CWFormTopic*) m_pDictTab->Add(new CWFormTopic(m_pDictTab, "Analysis SFM Markers"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_multipleAddNotice);
		pFTopic->Add(&m_multipleDelNotice);
		m_pLang->getCodeTable().m_unifiedSet.addSelfToTopic(pFTopic);

		pFTopic = (CWFormTopic*) m_pDictTab->Add(new CWFormTopic(m_pDictTab, "Interlinear SFM Markers"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_multipleAddNotice);
		pFTopic->Add(&m_multipleDelNotice);
		m_pLang->getInterCodeTable().m_unifiedSet.addSelfToTopic(pFTopic);

		pFTopic = (CWFormTopic*) m_pDictTab->Add(new CWFormTopic(m_pDictTab, "Synthesis SFM Markers"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_multipleAddNotice);
		pFTopic->Add(&m_multipleDelNotice);
		m_pLang->getSynthCodeTable().m_unifiedSet.addSelfToTopic(pFTopic);
#else //hab17a1
		pFTopic = (CWFormTopic*) m_pDictTab->Add(new CWFormTopic(m_pDictTab, "SFM Markers"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_mutltipleAllosNotice); // jdh 9/1/99
		m_pLang->getCodeTable().m_unifiedSet.addSelfToTopic(pFTopic);
#endif //hab17a1
	}
	else
	{
#ifndef hab17a1
		pHeading = new CWHeadingTopic(m_pDictTab, "Analysis SFM Markers");
		m_pDictTab->Add(pHeading);

		if (m_pLang->getHavePrefixes())
		  {
		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Prefix"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_multipleAddNotice);
		pFTopic->Add(&m_multipleDelNotice);
		m_pLang->getCodeTable().m_prefixSet.addSelfToTopic(pFTopic);
		  }
		if (m_pLang->getHaveInfixes())
		  {
		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Infix"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_multipleAddNotice);
		pFTopic->Add(&m_multipleDelNotice);
		m_pLang->getCodeTable().m_infixSet.addSelfToTopic(pFTopic);
		  }
		if (m_pLang->getHaveSuffixes())
		  {
		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Suffix"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_multipleAddNotice);
		pFTopic->Add(&m_multipleDelNotice);
		m_pLang->getCodeTable().m_suffixSet.addSelfToTopic(pFTopic);
		  }
		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Root"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_multipleAddNotice);
		pFTopic->Add(&m_multipleDelNotice);
		m_pLang->getCodeTable().m_rootSet.addSelfToTopic(pFTopic);

		pHeading = new CWHeadingTopic(m_pDictTab, "Interlinear SFM Markers");
		m_pDictTab->Add(pHeading);


		if (m_pLang->getHavePrefixes())
		  {
		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Prefix"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_multipleAddNotice);
		pFTopic->Add(&m_multipleDelNotice);
		m_pLang->getInterCodeTable().m_prefixSet.addSelfToTopic(pFTopic);
		  }
		if (m_pLang->getHaveInfixes())
		  {
		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Infix"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_multipleAddNotice);
		pFTopic->Add(&m_multipleDelNotice);
		m_pLang->getInterCodeTable().m_infixSet.addSelfToTopic(pFTopic);
		  }
		if (m_pLang->getHaveSuffixes())
		  {
		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Suffix"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_multipleAddNotice);
		pFTopic->Add(&m_multipleDelNotice);
		m_pLang->getInterCodeTable().m_suffixSet.addSelfToTopic(pFTopic);
		  }
		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Root"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_multipleAddNotice);
		pFTopic->Add(&m_multipleDelNotice);
		m_pLang->getInterCodeTable().m_rootSet.addSelfToTopic(pFTopic);

		pHeading = new CWHeadingTopic(m_pDictTab, "Synthesis SFM Markers");
		m_pDictTab->Add(pHeading);


		if (m_pLang->getHavePrefixes())
		  {
		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Prefix"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_multipleAddNotice);
		pFTopic->Add(&m_multipleDelNotice);
		m_pLang->getSynthCodeTable().m_prefixSet.addSelfToTopic(pFTopic);
		  }
		if (m_pLang->getHaveInfixes())
		  {
		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Infix"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_multipleAddNotice);
		pFTopic->Add(&m_multipleDelNotice);
		m_pLang->getSynthCodeTable().m_infixSet.addSelfToTopic(pFTopic);
		  }
		if (m_pLang->getHaveSuffixes())
		  {
		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Suffix"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_multipleAddNotice);
		pFTopic->Add(&m_multipleDelNotice);
		m_pLang->getSynthCodeTable().m_suffixSet.addSelfToTopic(pFTopic);
		  }
		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Root"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_multipleAddNotice);
		pFTopic->Add(&m_multipleDelNotice);
		m_pLang->getSynthCodeTable().m_rootSet.addSelfToTopic(pFTopic);
#else // hab17a1
		pHeading = new CWHeadingTopic(m_pDictTab, "SFM Markers");
		m_pDictTab->Add(pHeading);


		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Prefix"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_mutltipleAllosNotice); // jdh 9/1/99
		m_pLang->getCodeTable().m_prefixSet.addSelfToTopic(pFTopic);

		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Suffix"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_mutltipleAllosNotice); // jdh 9/1/99
		m_pLang->getCodeTable().m_suffixSet.addSelfToTopic(pFTopic);

		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Infix"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_mutltipleAllosNotice); // jdh 9/1/99
		m_pLang->getCodeTable().m_infixSet.addSelfToTopic(pFTopic);

		pFTopic = (CWFormTopic*) pHeading->Add(new CWFormTopic(m_pDictTab, "Root"));
		pFTopic->Add(&m_sfmNotice);
		pFTopic->Add(&m_mutltipleAllosNotice); // jdh 9/1/99
		m_pLang->getCodeTable().m_rootSet.addSelfToTopic(pFTopic);
#endif //hab17a1
	}

	pFTopic = (CWFormTopic*) m_pDictTab->Add(new CWListTopic(m_pDictTab, "Dict Orthography Changes", &m_pLang->getDictOrthoModel().m_orthoChanges));

	CWAnalysisModel &analysis = m_pLang->getAnalysisModel();

	// capitalization
		pFTopic = (CWFormTopic*) m_pDictTab->Add(new CWFormTopic(m_pDictTab, "Dictionary Capitalization"));
	pFTopic->Add(&analysis.decapitalizeEntries);


	// ----------- phonrule --------------------------------------------------------

	CPhonruleModel &phonrule = m_pLang->getPhonruleModel();

	pHeading = new CWHeadingTopic(m_pDictTab, "Phonology");
	m_pDictTab->Add(pHeading);
		pFTopic = new CWFormTopic(m_pDictTab, "Settings");
		pHeading->Add(pFTopic);
			pFTopic->Add(& phonrule.m_bBaseBecomesAllomorph);
			pFTopic->Add(& phonrule.m_cCutoffChar);
			pFTopic->Add(& phonrule.m_sCitationMarker);

		CWListTopic* pLTopic = new CWListTopic(m_pDictTab, "Rules",
			&phonrule.m_rules);
		pHeading->Add(pLTopic);

}
