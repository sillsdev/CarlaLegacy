; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CDlgEditTestColor
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "keywordscoloring2.h"
LastPage=0

ClassCount=9
Class1=CKeywordscoloring2App
Class2=CKeywordscoloring2Doc
Class3=CKeywordscoloring2View
Class4=CMainFrame

ResourceCount=6
Resource1=IDR_MAINFRAME
Resource2=IDD_EditTest
Resource3=IDR_KEYWORTYPE
Class5=CChildFrame
Class6=CAboutDlg
Class7=CDlgEditText
Resource4=IDD_KeywordsList
Class8=CDlgEditTestColor
Resource5=IDD_ABOUTBOX
Class9=CDlgKeywordsList
Resource6=IDD_EditSetColor

[CLS:CKeywordscoloring2App]
Type=0
HeaderFile=keywordscoloring2.h
ImplementationFile=keywordscoloring2.cpp
Filter=N

[CLS:CKeywordscoloring2Doc]
Type=0
HeaderFile=keywordscoloring2Doc.h
ImplementationFile=keywordscoloring2Doc.cpp
Filter=N

[CLS:CKeywordscoloring2View]
Type=0
HeaderFile=keywordscoloring2View.h
ImplementationFile=keywordscoloring2View.cpp
Filter=C
LastObject=CKeywordscoloring2View


[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T


[CLS:CChildFrame]
Type=0
HeaderFile=ChildFrm.h
ImplementationFile=ChildFrm.cpp
Filter=M


[CLS:CAboutDlg]
Type=0
HeaderFile=keywordscoloring2.cpp
ImplementationFile=keywordscoloring2.cpp
Filter=D
LastObject=CAboutDlg

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[MNU:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_MRU_FILE1
Command4=ID_APP_EXIT
Command5=ID_VIEW_TOOLBAR
Command6=ID_VIEW_STATUS_BAR
Command7=ID_APP_ABOUT
CommandCount=7

[TB:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_EDIT_CUT
Command5=ID_EDIT_COPY
Command6=ID_EDIT_PASTE
Command7=ID_FILE_PRINT
Command8=ID_APP_ABOUT
CommandCount=8

[MNU:IDR_KEYWORTYPE]
Type=1
Class=CKeywordscoloring2View
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_CLOSE
Command4=ID_FILE_SAVE
Command5=ID_FILE_SAVE_AS
Command6=ID_FILE_MRU_FILE1
Command7=ID_APP_EXIT
Command8=ID_EDIT_UNDO
Command9=ID_EDIT_CUT
Command10=ID_EDIT_COPY
Command11=ID_EDIT_PASTE
Command12=ID_VIEW_TOOLBAR
Command13=ID_VIEW_STATUS_BAR
Command14=ID_WINDOW_NEW
Command15=ID_WINDOW_CASCADE
Command16=ID_WINDOW_TILE_HORZ
Command17=ID_WINDOW_ARRANGE
Command18=ID_APP_ABOUT
CommandCount=18

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_EDIT_UNDO
Command5=ID_EDIT_CUT
Command6=ID_EDIT_COPY
Command7=ID_EDIT_PASTE
Command8=ID_EDIT_UNDO
Command9=ID_EDIT_CUT
Command10=ID_EDIT_COPY
Command11=ID_EDIT_PASTE
Command12=ID_NEXT_PANE
Command13=ID_PREV_PANE
CommandCount=13

[DLG:IDD_EditTest]
Type=1
Class=CDlgEditText
ControlCount=10
Control1=IDC_EDITLabel,edit,1350631552
Control2=IDC_EDITDescription,edit,1352732740
Control3=IDOK,button,1342242817
Control4=IDCANCEL,button,1342242816
Control5=IDC_STATIC,static,1342308352
Control6=IDC_STATIC,static,1342308352
Control7=IDC_CHECKEnabled,button,1342242819
Control8=IDC_STATIC,static,1342308352
Control9=IDC_EDITContents,RICHEDIT,1353781444
Control10=IDC_BUTTON1,button,1342242816

[CLS:CDlgEditText]
Type=0
HeaderFile=DlgEditText.h
ImplementationFile=DlgEditText.cpp
BaseClass=CDialog
Filter=D
LastObject=IDC_BUTTON1
VirtualFilter=dWC

[DLG:IDD_EditSetColor]
Type=1
Class=CDlgEditTestColor
ControlCount=21
Control1=IDC_TREE1,SysTreeView32,1350634022
Control2=IDC_STATIC,static,1342308352
Control3=IDC_RICHEDIT1,RICHEDIT,1351680196
Control4=IDC_CHECK1,button,1342242819
Control5=IDC_CHECK2,button,1342242819
Control6=IDC_CHECK3,button,1342242819
Control7=IDC_CHECK4,button,1073741827
Control8=IDC_STATIC,static,1342308352
Control9=IDC_BUTTON2,button,1342242816
Control10=IDC_BUTTON3,button,1342259211
Control11=IDC_STATIC,static,1342308352
Control12=IDC_BUTTON4,button,1342242827
Control13=IDC_STATIC,static,1342308352
Control14=IDC_CHECK5,button,1342252035
Control15=IDC_STATIC,button,1342177287
Control16=IDC_COMBO1,combobox,1344339971
Control17=IDC_STATIC,static,1342308352
Control18=IDC_STATIC,button,1342177287
Control19=IDC_CHECK6,button,1342242819
Control20=IDOK,button,1342242816
Control21=IDCANCEL,button,1342242816

[CLS:CDlgEditTestColor]
Type=0
HeaderFile=DlgEditTestColor.h
ImplementationFile=DlgEditTestColor.cpp
BaseClass=CDialog
Filter=D
LastObject=IDC_BUTTON2
VirtualFilter=dWC

[DLG:IDD_KeywordsList]
Type=1
Class=CDlgKeywordsList
ControlCount=3
Control1=IDC_STATIC,static,1342308864
Control2=IDC_LIST1,SysListView32,1350664205
Control3=IDC_RICHEDIT1,RICHEDIT,1344342084

[CLS:CDlgKeywordsList]
Type=0
HeaderFile=DlgKeywordsList.h
ImplementationFile=DlgKeywordsList.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=IDC_LIST1
