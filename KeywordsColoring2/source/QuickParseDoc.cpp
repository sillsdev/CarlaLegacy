// QuickParseDoc.cpp : implementation file
//
// 2.1.2 14-Mar-2000 jdh Various additions to support using dictionary preprocessors w/ quickparse

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "QuickParseDoc.h"
#include "CarlaLanguage.h"
#include "ProjectDoc.h"
#include "QuickParseView.h"



#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CQuickParseDoc

IMPLEMENT_DYNCREATE(CQuickParseDoc, CDocument)

CQuickParseDoc::CQuickParseDoc()
: m_pSourceLang(NULL)
{
	m_pSourceLang = theApp.getProject()->getSourceLang();
}

CQuickParseDoc::~CQuickParseDoc()
{
}


BEGIN_MESSAGE_MAP(CQuickParseDoc, CDocument)
	//{{AFX_MSG_MAP(CQuickParseDoc)
	ON_COMMAND(ID_QuickParse_ChangeLang, OnQuickParseChangeLang)
	ON_COMMAND(ID_QUICKPARSE_RefreshRequest, OnQuickParseRefreshRequest)
	ON_UPDATE_COMMAND_UI(ID_QuickParse_ChangeLang, OnUpdateQuickParseChangeLang)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CQuickParseDoc commands

void CQuickParseDoc::setup(CCarlaLanguage * pSrcLang)
{
	ASSERTX(pSrcLang);
	m_pSourceLang = pSrcLang;
}

void CQuickParseDoc::SetTitle(LPCTSTR lpszTitle)
{
	CString s(lpszTitle);
	if(m_pSourceLang)
	{
		s+= " ";
		s+= m_pSourceLang->getName();
	}
	CDocument::SetTitle(s);
}

// simply cycle through to the next available language
void CQuickParseDoc::OnQuickParseChangeLang()
{
	CProjectDoc* pProj = theApp.getProject();
	int iNew = 0;
	for(int i=0; i< pProj->getLanguageCount(); i++)
	{
		if(pProj->getLangFromIndex(i) == m_pSourceLang)
		{
			iNew = i+1;
			if(iNew >= pProj->getLanguageCount())
				iNew = 0;
			break;
		}
	}
	m_pSourceLang = pProj->getLangFromIndex(iNew);
	ASSERTX(m_pSourceLang);
	SetTitle("QuickParse");
	ASSERTX(m_pQPView);
	m_pQPView->languageChanged();
}
//jdh 3/14/2000
void CQuickParseDoc::OnQuickParseRefreshRequest()
{
	ASSERTX(m_pQPView);
	m_pQPView->m_bManualRefreshPending = TRUE;
}

void CQuickParseDoc::OnUpdateQuickParseChangeLang(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(theApp.getProject()->getLanguageCount() > 1);
}

void CQuickParseDoc::setView(CQuickParseView * pV)
{
	m_pQPView = pV;
}
