// Collected methods related the RemoveLanguage feature
// JDH 5/28/99 Created
// 1.7a1 06-Dec-1999 hab Fixed typo in warning message.

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "ProjectDoc.h"
#include "ProcessSequence.h"
#include "ProcessingPrefs.h"
#include "TransferModelSet.h"
#include "LangModelsDoc.h"
#include "QuickParseDoc.h"
#include "InputDoc.h"

#include "CarlaLanguage.h"

extern CCarlaStudioApp theApp;

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

void CProjectDoc::removeLanguage(CLangModelsDoc* pLangDocRemove)
{
	// Make sure this isn't the only language
	if(m_pLangDocs.GetSize() == 1)
	{
		AfxMessageBox(_T("Sorry, you can't remove the only language in the project"));
		return;
	}

	// Verify that we're to do this

	CString s;
	s.Format(_T("Do you really want to permanently remove the language %s from this project?"), (LPCTSTR)pLangDocRemove->getLang()->getName());
	if(IDYES != AfxMessageBox(s, MB_YESNO|MB_DEFBUTTON2|MB_ICONEXCLAMATION   ))
		return;


#ifndef hab17a1
	if(IDOK != AfxMessageBox(_T("Before removing this language, CarlaStudio will make backups of the project and language files, adding a '.b4r' to their names.  You'll have to delete these backups yourself.\r\nFurther, all open text and ana documents will be closed and you will have to reopen them later.\r\nFinally, Carla Studio will exit and you will have to run it again."), MB_OKCANCEL|MB_DEFBUTTON2|MB_ICONEXCLAMATION   ))
#else // hab17a1
	if(IDOK != AfxMessageBox(_T("Before removing this language, CarlaStudio will make a backups of the project and language files, adding a '.b4r' to their names.  You'll have to delete these backups yourself.\r\nFurther, all open text and ana documents will be closed and you will have to reopen them later.\r\nFinally, Carla Studio will exit and you will have to run it again."), MB_OKCANCEL|MB_DEFBUTTON2|MB_ICONEXCLAMATION   ))
#endif // hab17a1
		return;

	// Make backups

	CString sBackup = CDocument::GetPathName() + _T(".b4r");

	if(!CopyFile(GetPathName(), sBackup, FALSE))
	{
		AfxMessageBox(_T("Couldn't make a backup of the project file. Language not removed."));
		return;
	}

	for(int i=0; i< m_pLangDocs.GetSize();i++)
	{
		if(m_pLangDocs[i] != pLangDocRemove)
		{
			CString sBackup = m_pLangDocs[i]->GetPathName() + _T(".b4r");
			if(!CopyFile(m_pLangDocs[i]->GetPathName(), sBackup, FALSE))
			{
				AfxMessageBox(_T("Couldn't make a backup of one the languages. Language not removed."));
				return;
			}
		}
	}

	// gather some info
	CCarlaLanguage* pLangRemove = pLangDocRemove->getLang();

	// Close all input documents
	// save the input docs that are currently open so we can reopen them
	CDocTemplate* pT = theApp.getDocTemplate(CSourceTextInputDoc::getRegFileTypeID());
	ASSERTX(pT);
	POSITION pos = pT->GetFirstDocPosition();
	while(pos)
	{
		CSourceTextInputDoc* pDoc = (CSourceTextInputDoc*) pT->GetNextDoc(pos);
		if(pDoc)
			pDoc->OnCloseDocument();
	}

	// save the ana docs that are currently open so we can reopen them
	pT = theApp.getDocTemplate(CAnaInputDoc::getRegFileTypeID());
	ASSERTX(pT);
	pos = pT->GetFirstDocPosition();
	while(pos)
	{
		CAnaInputDoc* pDoc = (CAnaInputDoc*) pT->GetNextDoc(pos);
		if(pDoc)
			pDoc->OnCloseDocument();

	}

	// remove refs to this from the default prefs
	CCarlaLanguage* pLangAlternate;
	for(i=0; i< m_pLangDocs.GetSize();i++)
	{
		if(m_pLangDocs[i] != pLangDocRemove)
		{
			pLangAlternate = m_pLangDocs[i]->getLang();
			break;
		}
	}
	ASSERT(pLangAlternate);

	if(m_pSrcTextProcessingDefaults->getInputLang() == pLangRemove)
		m_pSrcTextProcessingDefaults->setInputLang(pLangAlternate);
	if(m_pSrcTextProcessingDefaults->getSrcLang()== pLangRemove)
		m_pSrcTextProcessingDefaults->setSrcLang(pLangAlternate);
	if(m_pSrcTextProcessingDefaults->getTarLang()== pLangRemove)
		m_pSrcTextProcessingDefaults->setTarLang(pLangAlternate);

	if(m_pAnaProcessingDefaults->getInputLang() == pLangRemove)
		m_pAnaProcessingDefaults->setInputLang(pLangAlternate);
	if(m_pAnaProcessingDefaults->getSrcLang()== pLangRemove)
		m_pAnaProcessingDefaults->setSrcLang(pLangAlternate);
	if(m_pAnaProcessingDefaults->getTarLang()== pLangRemove)
		m_pAnaProcessingDefaults->setTarLang(pLangAlternate);

	// Close the language document to be removed

	// For each of the other languages, remove the transfer sequences & transfer models
	for(i=0; i< m_pLangDocs.GetSize();i++)
	{
		if(m_pLangDocs[i] != pLangDocRemove)
		{
			m_pLangDocs[i]->getLang()->removeRefsToLanguage(pLangRemove);
			m_pLangDocs[i]->SetModifiedFlag(TRUE);
		}
	}

	// Remove from this project
	// the document itself will call project->removeLangDoc(pLangDocRemove),
	// so later when the project file is saved it won't leave any trace of this langauge
	pLangDocRemove->reallyCloseDocument();

	// Save
		//SetModifiedFlag(TRUE);
		//theApp.SaveAllModified();

		((CCarlaStudioApp*)&theApp)->OnFILESaveAll();

	// Quit
		theApp.OnAppExit();
}


void CCarlaLanguage::removeRefsToLanguage(CCarlaLanguage *pLang)
{
	ASSERT(pLang != this);

	for(int i=0; i< m_pTransferSequences.GetSize(); i++)
		if(m_pTransferSequences[i]->getTargetLang()==pLang)
		{
			m_pTransferSequences.RemoveAt(i);
			break;
		}

	for(i=0; i< m_pTransferModelSets.GetSize(); i++)
		if(m_pTransferModelSets[i]->getTargetLang()==pLang)
		{
			m_pTransferModelSets.RemoveAt(i);
			break;
		}
}


void CLangModelsDoc::OnRemoveLanguage()
{
	getProject()->removeLanguage(this);
}
