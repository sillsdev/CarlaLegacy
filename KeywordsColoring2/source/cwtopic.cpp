// CWTopic.cpp
//

/////////////////////////////////////////////////////////////////////////////
#include "stdafx.h"
#include "CARLAStudioApp.h"

#include "CWTopic.h"
#include "CWFormView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

// CWFormTopic ===============================================

IMPLEMENT_DYNAMIC(CWFormTopic, CWTopic )


// CWTopic ===============================================

IMPLEMENT_DYNAMIC( CWTopic, CObject )

/*CWTopic::CWTopic(CWTopicTab* pOwner, char* p_label, UINT nDialogID) :
	m_owningTab(pOwner), m_label(p_label), m_nDialogID(nDialogID) //, m_pView(NULL)
{
//	TRACE("Created Topic %s\n", (LPCTSTR)*m_label);
	TRACE("Created Topic %s\n", m_label);


}
*/

CWTopic::CWTopic(CWTopicTab* pOwner, LPCTSTR p_label) :
	m_owningTab(pOwner), m_nDialogID(NULL), m_label(p_label) //,	m_pView(NULL)
{
}


CWTopic::~CWTopic()
{
//	if(m_pname)
//		delete m_pname;
}

// CWListTopic ===============================================

IMPLEMENT_DYNAMIC(CWListTopic, CWTopic )

CWListTopic::CWListTopic(CWTopicTab* pOwner, LPCTSTR p_label, CWList* p_list)
: CWTopic(pOwner, p_label), m_pList(p_list)
{

}

/*// CWTableTopic ===============================================

IMPLEMENT_DYNAMIC(CWTableTopic, CWTopic )

CWTableTopic::CWTableTopic(CWTopicTab* pOwner, char* p_label, CWTable* p_table)
: CWTopic(pOwner, p_label), m_pTable(p_table)
{

}

// currently called by the view during OnInitialUpdate
// at this point, we could probably get rid of this function,
// and get rid of the CWTableView.m_pTable, and just have it
// use m_pTopic->m_pTable
void CWTableTopic::prepare_view(YY* pView)
{
	pView->m_pTable = m_pTable;
}
*/

IMPLEMENT_DYNAMIC(CWHeadingTopic, CWTopic )

CWHeadingTopic::~CWHeadingTopic()
{
	int i = 0;
	while (i < m_pTopics.GetSize() )
	{
		delete m_pTopics.GetAt( i++ );
	}
	m_pTopics.RemoveAll();

}
