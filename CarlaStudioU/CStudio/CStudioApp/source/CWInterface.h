//       06-Dec-1999 hab Remove extra ctrl-Ms at end of lines
// 1.7a1 06-Dec-1999 hab Add multiple field and deletion messages

#ifndef __CWInterface__
#define __CWInterface__

#ifndef __AFXTEMPL_H__
#include <afxtempl.h>
#endif

#include <afxcoll.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#include "CWAtomicTypes.h"

class CWTopic;
class CTabbedTreeDoc;
class CWTopicTreeView;
class CWTabBar;
class CCarlaLanguage;

//===========================================
class CWTopicTab: public CObject
{
public:
	~CWTopicTab();
	CWTopicTab(LPCTSTR lpszLabel) : m_pCurrentTopic(NULL), m_label(lpszLabel) {};
	CWTopic* Add(CWTopic* t) {m_topics.Add(t); return t;}
	CWTopic* get_currentTopic();
	CWTopic* SetCurrentTopic(CWTopic* pTopic);

protected:
	CString m_label;
	CWTopic* m_pCurrentTopic;
	CTypedPtrArray<CPtrArray, CWTopic*> m_topics;

	friend class CWTopicTreeView;
	friend class CWTabBar;
};

typedef CTypedPtrArray<CPtrArray, CWTopicTab*> TopicTabArray;
//===========================================
class CWInterface : public  CObject
{
public:
	CWInterface(CTabbedTreeDoc* pDoc);
	~CWInterface();
	virtual void setupForLang(CCarlaLanguage* pLang) =0;
	virtual void finishCreate();

	virtual void populateTransferTab();
	virtual void populateDictTab();
	CWTopic* SetCurrentTopic(CWTopic* pTopic);
	CWTopicTab* GetCurrentTopicTab();
	void SetCurrentTabInt(UINT iTab);
	TopicTabArray* GetTopicTabArray();

//not used?	CWTopicTab* AddTab(CWTopicTab* t) {m_topicTabs.Add(t); return t;}
protected:
	virtual CString getTransferTabLabel() {return _T("Transfer");}
	CCarlaLanguage *m_pLang;
	CWTopicTab *m_pCurrentTopicTab;
	CString m_label;
	CTabbedTreeDoc* m_pDoc;
	TopicTabArray m_topicTabs;
	CWTopicTab *m_pTransferTab;
	CWTopicTab *m_pDictTab;
	int m_iTransferTabIndex;
	int m_iDictTabIndex;

	CWGroup		textMarkerGroup;
	CWGroup		capitalizationGroup;
	CWGroup		formatGroup;
	CWGroup		wordCategoryGroup;

	CWStatic	m_sfmNotice;
#ifndef hab17a1
	CWStatic	m_multipleAddNotice;
	CWStatic	m_multipleDelNotice;
#else //hab17a1
	CWStatic	m_mutltipleAllosNotice; // jdh 9/1/99
#endif //hab17a1
};


//===========================================
class CWCarlaMenuInterface : public CWInterface
{
public:
	CWCarlaMenuInterface(CTabbedTreeDoc* pDoc);
	virtual void setupForLang(CCarlaLanguage* pLang);
	virtual	void populateTransferTab();

protected:
	virtual CString getTransferTabLabel() {return _T("Adaptation");}
};

//===========================================
class CWFunctionalInterface : public CWInterface
{
public:
	CWFunctionalInterface(CTabbedTreeDoc* pDoc);
	virtual void setupForLang(CCarlaLanguage* pLang);
protected:
//	CWGroup		requiredDictCodesGroup, optionalDictCodesGroup;
};

#endif
