// TabbedTreeDoc.pp : implementation file
//
// 2.1.6 10-Apr-2000-1999 hab Editing the Format markers and Valid String
//                            characters of Input/Chars did not set the
//                            Modified flag

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "TabbedTreeDoc.h"
#include "TabbedTreeChild.h"
#include "ProjectDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTabbedTreeDoc

IMPLEMENT_DYNCREATE(CTabbedTreeDoc, CDocument)

CTabbedTreeDoc::CTabbedTreeDoc()
:
 m_pCurrentInterface(NULL),
m_bSettingUpPhase(TRUE)
{
}

BOOL CTabbedTreeDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;
	return TRUE;
}

CTabbedTreeDoc::~CTabbedTreeDoc()
{

}

#include <malloc.h>
void CTabbedTreeDoc::OnDataModified()
{

//	TRACE(".");
	if(!m_bSettingUpPhase) // when a control is first given its data, that doesn't consitute modifying the document
	{
		SetModifiedFlag(TRUE);
		//getProject()->SetModifiedFlag();
	}
}

#define kBaseFormControlID 2000
#ifndef hab216
// Added +7 and +8 below.  I have no idea why these were not there...
// for one at least, it meant that SetModifiedFlag did not get set when
// one changed the last few items under Input/Chars...
#endif // hab216

BEGIN_MESSAGE_MAP(CTabbedTreeDoc, CDocument)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+1, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+2, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+3, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+4, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+5, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+6, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+7, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+8, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+9, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+10, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+11, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+12, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+13, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+14, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+15, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+16, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+17, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+18, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+19, OnDataModified)
	ON_CONTROL(EN_UPDATE, kBaseFormControlID+20, OnDataModified)
	//{{AFX_MSG_MAP(CTabbedTreeDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//	ON_CONTROL_RANGE(EN_UPDATE, kBaseFormControlID, kBaseFormControlID+1, OnDataModified)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTabbedTreeDoc diagnostics

#ifdef _DEBUG
void CTabbedTreeDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CTabbedTreeDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

// SetModifiedFlag isn't virtual, so we could override it.
// we have to make our own version instead
/*void CTabbedTreeDoc::setModified(BOOL bModified)
{

	if(IsModified() != bModified)
	{
		SetModifiedFlag(bModified);
		if(bModified)	// if we're modified, the whole project is considered to be modified
			theApp.getProject()->SetModifiedFlag(TRUE);
		SetTitle(NULL); // want to show indicator
	}
}
*/

/////////////////////////////////////////////////////////////////////////////
// CTabbedTreeDoc commands

CWTopicTab* CTabbedTreeDoc::GetCurrentTopicTab()
{
	ASSERTX(m_pCurrentInterface);
	return m_pCurrentInterface->GetCurrentTopicTab();
}


CWInterface* CTabbedTreeDoc::GetCurrentInterface()
{
	ASSERTX(m_pCurrentInterface);
	return m_pCurrentInterface;
}

// called by Interface
void CTabbedTreeDoc::TopicChanged(CWTopic* pTopic)
{
	getFrame()->TopicChanged(pTopic);
}

CTabbedTreeChild* CTabbedTreeDoc::getFrame()
{
	POSITION p  = GetFirstViewPosition( );
	CView* pView= GetNextView(p);
	if(!pView)
		return NULL; // happens when app is quiting
	CFrameWnd* pF = pView->GetParentFrame();
	ASSERTX(pF->IsKindOf(RUNTIME_CLASS(CTabbedTreeChild)));
	/*	while(p)
	{
		CView* pView= GetNextView(p);
		if(pView->IsKindOf(RUNTIME_CLASS(CTabbedTreeChild)))
			return (CTabbedTreeChild*) pView;
	}
*/

	return (CTabbedTreeChild*) pF;
}


void CTabbedTreeDoc::SetModifiedFlag(BOOL bModified)
{
	if(bModified==IsModified())
		return; // no change

	CDocument::SetModifiedFlag(bModified);
	SetTitle(NULL);

}
