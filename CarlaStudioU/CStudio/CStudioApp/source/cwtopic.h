// CWTopic.h: header file
//

/////////////////////////////////////////////////////////////////////////////

#ifndef __AFXTEMPL_H__
#include <afxtempl.h>
#endif

#include <afxcoll.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#include "CWAtomicTypes.h"
//#include "ProjectDoc.h"

class CMDIChildWnd;
class CWTopicTab;
class CWListView;
class CWList;

//===========================================
class CWTopic : public CObject
{
	DECLARE_DYNCREATE(CWTopic)	// stuck this in here trying to get IsKindOf to work
public:
//	CWTopic(CWTopicTab* pOwner, char* p_label, UINT nDialogID);

	CWTopic(CWTopicTab* pOwner, LPCTSTR p_label);

	virtual ~CWTopic();

	CWTopicTab* GetOwningTab(){ASSERTX(m_owningTab); return m_owningTab;}

	//CView* m_pView; //changed from CFormView Sat, Mar 28
	CString m_label;
	UINT m_nDialogID;
protected:
	CWTopicTab* m_owningTab;
};

//===========================================
class CWHeadingTopic : public CWTopic
{
public:
	DECLARE_DYNAMIC(CWHeadingTopic)	// stuck this in here trying to get IsKindOf to work
	~CWHeadingTopic();
	CWHeadingTopic(CWTopicTab* pOwner, LPCTSTR p_label): CWTopic(pOwner, p_label) {};
	CWTopic* Add(CWTopic* t) {m_pTopics.Add(t); return t;}
protected:
	CTypedPtrArray<CPtrArray, CWTopic*> m_pTopics;

	friend class CWTopicTreeView;
};

//===========================================
/*class CWTableTopic : public CWTopic
{
public:
	DECLARE_DYNAMIC(CWTableTopic)	// stuck this in here trying to get IsKindOf to work

	void prepare_view(YY* pView);
	CWTableTopic(CWTopicTab* pOwner, char* p_label, CWTable* p_table);
protected:
	CWTable* m_pTable;

	friend class YY;
};
*/

//===========================================
class CWListTopic : public CWTopic
{
public:
	DECLARE_DYNAMIC(CWListTopic)	// stuck this in here trying to get IsKindOf to work

	CWListTopic(CWTopicTab* pOwner, LPCTSTR p_label, CWList* p_table);
protected:
	CWList* m_pList;

	friend class CWListView;
};

//===========================================
class CWFormTopic : public CWTopic
{
public:
DECLARE_DYNAMIC(CWFormTopic)
	CWFormTopic(CWTopicTab* pOwner, LPCTSTR p_label): CWTopic(pOwner, p_label) {};
	void Add(CWAtomic* p_item) {m_pItems.Add(p_item);}
protected:
	CTypedPtrArray<CPtrArray, CWAtomic*> m_pItems;

	friend class CWFormView;
};