// CProcessing prefs holds what the user wants to do with a document
// JDH 5/28/99 Added setInputLang() in support of Remove Language ability


#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "ProcessingPrefs.h"
#include <fstream.h>
#include "ProjectDoc.h"
#include "PageSrcTextProcessing.h"
#include "PageAnaProcessing.h"
#include "CarlaLanguage.h"
#include "SFMFile.h"
#include "LangModelsDoc.h"

#define ksrcEndMarker "-SrcProcessingPrefs"

// exceptions: CString for parsing errors
CProcessingPrefs::CProcessingPrefs(SFMFile* f)
:	m_pInputLang(NULL),
	m_pTargetLang(NULL),
	m_iGoal(kTargetText),
	m_iVerbosity(0)
{
	CString sMarker, sField;
	while(f->getField(sMarker, sField))
	{
		if(sMarker==ksrcEndMarker)
			break;
		else if (sMarker == "Verbosity")
		{
			m_iVerbosity = atoi(sField);
		}
		else checkAndReadInt("Goal", m_iGoal)

		else if(sMarker == "Flags")
			m_dwFlags=atol(sField);

		else if (sMarker == "InputLangID")
		{
			m_pInputLang = NULL; // can't look this up yet
			m_sTempInputLangID = sField;	// save for the "finish create" cycle, when all language docs have been loaded
										// and we can look up this id and get the pointer
		}
		else if (sMarker == "TargetLangID")
		{
			m_pTargetLang = NULL; // can't look this up yet
			m_sTempTargetLangID = sField;	// save for the "finish create" cycle, when all language docs have been loaded
										// and we can look up this id and get the pointer
		}
		else f->throwParseFailure("ProcessingPrefs", sMarker, sField);
	}

	if(theApp.getProject()->getHaveLanguages())
	{
		if(!m_pInputLang)
			m_pInputLang = theApp.getProject()->getLangFromIndex(0);
		if(!m_pTargetLang)
			m_pTargetLang = theApp.getProject()->getLangFromIndex(0);
	}
}

CProcessingPrefs::CProcessingPrefs(CProcessingPrefs* pCopy)
:	m_pInputLang(pCopy->getSrcLang()),
	m_pTargetLang(pCopy->getTarLang()),
	m_iGoal(pCopy->getGoal()),
	m_iVerbosity(pCopy->getVerbosity()),
	m_dwFlags(pCopy->m_dwFlags)
{
	if(!theApp.getProject()->getHaveLanguages())
			AfxMessageBox("You have run into a bug.  The copy constructor for CProcessingPrefs assumes there is at least one language installed, but your project does not appear to have one.  More error dialogs will follow this one.");

	if(!m_pInputLang)
	{
		m_pInputLang = theApp.getProject()->getLangFromIndex(0);
	}
	if(!m_pTargetLang)
		m_pTargetLang = theApp.getProject()->getLangFromIndex(0);
}

CProcessingPrefs::CProcessingPrefs(CCarlaLanguage *pInputLang,
								   CCarlaLanguage *pTargetLang,
								   int iGoal)
:	m_pInputLang(pInputLang),
	m_pTargetLang(pTargetLang),
	m_iGoal(iGoal),
	m_iVerbosity(0),
	m_dwFlags(kLeaveNonGoalsInTemp)
{
	// this for safety only.  Can't do this because a new the project will not have any languages yet
	//m_pInputLang = theApp.getProject()->getLangFromIndex(0);
	//m_pTargetLang = theApp.getProject()->getLangFromIndex(0);
}

CProcessingPrefs::~CProcessingPrefs()
{
}

void CProcessingPrefs::writeToFile(ostream& fout) const
{
	fout << "\\" << getBeginMarker() << "\n";
	if(m_pInputLang)
		fout << "\\InputLangID " << m_pInputLang->getUniqueID() << "\n";
	if(m_pTargetLang)
		fout << "\\TargetLangID " << m_pTargetLang->getUniqueID() << "\n";
	fout << "\\Verbosity " << m_iVerbosity << "\n";
	fout << "\\Goal " << m_iGoal << "\n";
	fout << "\\Flags " << m_dwFlags << '\n';
	fout << "\\" << ksrcEndMarker << "\n";
}




// Exceptions: and error string if language not found
void CProcessingPrefs::finishCreate()
{
	CProjectDoc *pProjectDoc = theApp.getProject();

	if(m_sTempInputLangID.GetLength())
	{
		m_pInputLang = pProjectDoc->getLangFromID(m_sTempInputLangID);
		if(!m_pInputLang)
		{
			THROWSTRING2("Could not find the source language, which has ID ",
							m_sTempInputLangID);
		}
	}


	if(m_sTempTargetLangID.GetLength())
	{
		m_pTargetLang = pProjectDoc->getLangFromID(m_sTempTargetLangID);
		if(!m_sTempTargetLangID)
		{
			THROWSTRING2("Could not find the target language, which has ID ",
							m_sTempTargetLangID);
		}
	}

	m_sTempTargetLangID = "";
	m_sTempInputLangID = "";
}

CLangModelsDoc* CProcessingPrefs::getSrcLangDoc() const
{
	if(getSrcLang())
		return getSrcLang()->getLangDoc();
	else
		ASSERTX(FALSE);

	return NULL;
}


CCarlaLanguage* CProcessingPrefs::getInputLang() const
{
	ASSERTX(m_pInputLang);
	return m_pInputLang;
}


// may return null
CCarlaLanguage* CProcessingPrefs::getSrcLang() const
{
	if(getDoAnalysis() || getDoTransfer())
		return m_pInputLang;
	else
		return NULL; // no src if we're just synthesizing
}

// may return null
CCarlaLanguage* CProcessingPrefs::getTarLang() const
{
	if(getDoTransfer() || getDoSynthesis())
		return m_pTargetLang;
	else
		return NULL; // no tar if we're just analyzing
}

void CProcessingPrefs::setSrcLangDoc(CLangModelsDoc * pDoc)
{
	ASSERTX(pDoc);
	m_pInputLang = pDoc->getLang();
}

void CProcessingPrefs::setSrcLang(CCarlaLanguage * pLang)
{
	// can be legitimately null if called by the project
	//ASSERTX(pLang);
	m_pInputLang = pLang;
}

// can be null
void CProcessingPrefs::setTarLang(CCarlaLanguage * pLang)
{
	m_pTargetLang = pLang;
}

// can be null
void CProcessingPrefs::setTarLangDoc(CLangModelsDoc * pDoc)
{
	if(pDoc)
		setTarLang(pDoc->getLang());
	else
		setTarLang(NULL);
}

BOOL CProcessingPrefs::getDoSynthesis() const
{
		return (m_pInputLang
				&& m_pTargetLang
				&& (	m_iGoal==kAutoSynthCheck)
						|| (m_iGoal==kTargetText));
}


BOOL CProcessingPrefs::getDoTransfer() const
{
		return 	(m_pInputLang
				&& m_pTargetLang
				&& (m_pInputLang != m_pTargetLang) // don't need transfer if in right lang already
				&& (	m_iGoal==kTargetANA
						|| (m_iGoal==kTargetText )));
}




//////////////////////////////////////////////////////////
/////////////// CSrcProcessingPrefs  //////////////////////////
//////////////////////////////////////////////////////////

// caller will call 1) customizePropertySheet()
//					2) readPropertySheet() (unless dlg cancelled)
//					3) propertySheetClosed()

void CSrcTextProcessingPrefs::customizePropertySheet(
				CPropertySheet& dlg, BOOL bShowDefaultButton)
{
	ASSERTX(!m_pProcPrefsPage);
	m_pProcPrefsPage = new CPageSrcTextProcessing
							  ( m_iGoal,
								m_pInputLang,
								m_pTargetLang,
								m_iVerbosity!=0,
								bShowDefaultButton,
								m_dwFlags
								);

	//dlg.SetTitle("Goal");
	dlg.AddPage(m_pProcPrefsPage);
}

void CSrcTextProcessingPrefs::readPropertySheet(CPropertySheet& dlg)
{
	ASSERTX(m_pProcPrefsPage);
	m_iGoal = m_pProcPrefsPage->m_iGoal;

	// right now we just have a on/off verbosity
	m_iVerbosity = m_pProcPrefsPage->m_bVerbosity;

	m_dwFlags = NULL;
	if(m_pProcPrefsPage->m_bLeaveNonGoalsInTemp)
		m_dwFlags |= kLeaveNonGoalsInTemp;
	if(m_pProcPrefsPage->m_bOutputItxToSameDir)
		m_dwFlags |= kOutputItxToSameDir;

	m_pInputLang = m_pProcPrefsPage->m_pSourceLang; // may not be NULL
	ASSERTX(m_pInputLang);

	if(m_pProcPrefsPage->m_pTargetLang)// may be null
		setTarLang(	m_pProcPrefsPage->m_pTargetLang);
	else
		setTarLang(NULL);

	if(m_pProcPrefsPage->m_bMakeDefault)
	{
		CProjectDoc *pProjectDoc = theApp.getProject();
		pProjectDoc->setSrcTextProcessingDefaults(this);
	}
}

void CSrcTextProcessingPrefs::propertySheetClosed(CPropertySheet& dlg)
{
	delete m_pProcPrefsPage;
	m_pProcPrefsPage = NULL;
}



//////////////////////////////////////////////////////////
/////////////// CAnaProcessingPrefs  //////////////////////////
//////////////////////////////////////////////////////////

// caller will call 1) customizePropertySheet()
//					2) readPropertySheet() (unless dlg cancelled)
//					3) propertySheetClosed()

void CAnaProcessingPrefs::customizePropertySheet(
				CPropertySheet& dlg, BOOL bShowDefaultButton)
{
	ASSERTX(!m_pProcPrefsPage);
	m_pProcPrefsPage = new CPageAnaProcessing
							  ( m_iGoal,
								m_pInputLang,
								m_pTargetLang,
								m_iVerbosity!=0,
								bShowDefaultButton,
								m_dwFlags);

	dlg.AddPage(m_pProcPrefsPage);
}

void CAnaProcessingPrefs::readPropertySheet(CPropertySheet& dlg)
{
	ASSERTX(m_pProcPrefsPage);
	m_iGoal = m_pProcPrefsPage->m_iGoal;

	// right now we just have a on/off verbosity
	m_iVerbosity = m_pProcPrefsPage->m_bVerbosity;

	m_dwFlags = NULL;
	if(m_pProcPrefsPage->m_bLeaveNonGoalsInTemp)
		m_dwFlags |= kLeaveNonGoalsInTemp;


	m_pInputLang = m_pProcPrefsPage->m_pInputLang; // may not be NULL
	ASSERTX(m_pInputLang);

	if(m_pProcPrefsPage->m_pTargetLang)// may be null
		setTarLang(	m_pProcPrefsPage->m_pTargetLang);
	else
		setTarLang(NULL);

	if(m_pProcPrefsPage->m_bMakeDefault)
	{
		CProjectDoc *pProjectDoc = theApp.getProject();
		pProjectDoc->setAnaProcessingDefaults(this);
	}
}

void CAnaProcessingPrefs::propertySheetClosed(CPropertySheet& dlg)
{
	delete m_pProcPrefsPage;
	m_pProcPrefsPage = NULL;
}

void CProcessingPrefs::setGoal(int iGoal)
{
	m_iGoal = iGoal;
}

// JDH 5/28/99 Added in support of Remove Language ability
void CProcessingPrefs::setInputLang(CCarlaLanguage *pLang)
{
	ASSERT(pLang);
	m_pInputLang = pLang;
}
