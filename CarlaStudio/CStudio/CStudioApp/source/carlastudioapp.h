// CarlaStudioApp.h : main header file for the CWORK application
//

#if !defined(AFX_CWORK_H__F2B8DE05_FEC1_11D1_89BE_0000C035C8C8__INCLUDED_)
#define AFX_CWORK_H__F2B8DE05_FEC1_11D1_89BE_0000C035C8C8__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "../resource.h"       // main symbols
#include <afxtempl.h>
#include <afxadv.h>

/////////////////////////////////////////////////////////////////////////////
// CCarlaStudioApp:
// See cwork.cpp for the implementation of this class
//

class CProjectDoc;
class CProcessTemplate;
class CRemoteCommand;

class CCarlaStudioApp : public CWinApp
{
public:
	CString m_sLastOpenDir;
	int RunProcessors(CRemoteCommand* pRemoteCmd=NULL, CDocument* pDoc=NULL);
	CProcessTemplate* findTemplateFromID(LPCTSTR lpszProcID);
	static BOOL askUserToFindFile(CString& sPath, LPCTSTR lpszRegFileTypeID);
	static BOOL askUserToFindFileIfNotFound(CString& sPath, LPCTSTR lpszRegFileTypeID);
	void projectClosing();
	 ~CCarlaStudioApp();
	CProjectDoc* getProject(BOOL bDontComplainIfNone=FALSE);
	CDocTemplate* getDocTemplate(LPCTSTR lpszTemplateName);
//	void writeToLog(LPCTSTR lpszA, LPCTSTR lpszB=NULL, LPCTSTR lpszC=NULL, LPCTSTR lpszD=NULL);

//	int getNewProjectCreationMethod();
	CCarlaStudioApp();
	CTypedPtrArray<CPtrArray, CProcessTemplate*>& getProcessTemplates() {return m_pProcessTemplates;}
	virtual CDocument* internalOpenDocumentFile(LPCTSTR lpszFileName);
// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCarlaStudioApp)
	public:
	virtual BOOL InitInstance();
	virtual CDocument* OpenDocumentFile(LPCTSTR lpszFileName);
	virtual void AddToRecentFileList(LPCTSTR lpszPathName);
	virtual int ExitInstance();
	virtual int Run();
	virtual BOOL OnDDECommand(LPTSTR lpszCommand);
	virtual int DoMessageBox(LPCTSTR lpszPrompt, UINT nType, UINT nIDPrompt);
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CCarlaStudioApp)
	afx_msg void OnAppAbout();
	afx_msg void OnProjectSetup();
	afx_msg void OnUpdateProjectSetup(CCmdUI* pCmdUI);
	afx_msg void OnLangPopUpCommand(UINT id);
	afx_msg void OnFILESAVEProject();
	afx_msg void OnFileNewProject();
	afx_msg void OnFILENewLanguage();
	afx_msg void OnUpdateFILENewLanguage(CCmdUI* pCmdUI);
	afx_msg void OnUpdateFileNewProject(CCmdUI* pCmdUI);
	afx_msg void OnWindowArrange();
	afx_msg void OnFileOpen();
	afx_msg void OnFILEOPENDocument();
	afx_msg void OnFILEOPENProject();
	afx_msg void OnFileCloseProject();
	afx_msg void OnUpdateFILEOPENDocument(CCmdUI* pCmdUI);
	afx_msg void OnUpdateFileMruProject(CCmdUI* pCmdUI);
	afx_msg void OnFileMruProject(UINT id);
	afx_msg void OnAppExit();
	afx_msg void OnQuickParse();
	afx_msg void OnUpdateQuickParse(CCmdUI* pCmdUI);
	afx_msg void OnFILESaveAll();
	afx_msg void OnRunProcessors();
	afx_msg void OnUpdateRunProcessors(CCmdUI* pCmdUI);
	afx_msg void OnFILENewDocument();
	afx_msg void OnJump();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()


protected:
//	int m_iNewProjectCreationMethod;
	virtual void OnFileNew();
	void createProjectFromControlFiles();
	void createProjectFromCarlaMenu();
	void createProjectFromScratch();
//	CDocTemplate* getProjectDocTemplate();
	CTypedPtrArray<CPtrArray, CProcessTemplate*>  m_pProcessTemplates;
	CRecentFileList m_recentProjectsList;
private:
	void ShowTipAtStartup(void);
private:
	void ShowTipOfTheDay(void);

private:
	BOOL m_bATLInited;
private:
	BOOL InitATL();
};

  extern CCarlaStudioApp theApp;

/////////////////////////////////////////////////////////////////////////////

CString getTruncatedPath(LPCTSTR s, int iCharacters=25);
CFont* getDefaultUserFont();

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CStudio_H__F2B8DE05_FEC1_11D1_89BE_0000C035C8C8__INCLUDED_)
