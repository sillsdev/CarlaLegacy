VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{037A11B7-D2BB-44C3-BF8A-5F9C313686E1}#1.0#0"; "PAWSControl.ocx"
Begin VB.Form PAWSStarterContainer
   Caption         =   "PAWS Starter Kit"
   ClientHeight    =   5430
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   7980
   Icon            =   "PAWSStarter.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5430
   ScaleWidth      =   7980
   StartUpPosition =   3  'Windows Default
   Begin PAWSControl.PAWSCtl ctlPAWSCtl
	  Align           =   1  'Align Top
	  Height          =   1455
	  Left            =   0
	  TabIndex        =   2
	  Top             =   420
	  Width           =   7980
	  _ExtentX        =   14076
	  _ExtentY        =   2566
   End
   Begin MSComDlg.CommonDialog dlgCommonDialog
	  Left            =   0
	  Top             =   2880
	  _ExtentX        =   847
	  _ExtentY        =   847
	  _Version        =   393216
   End
   Begin MSComctlLib.StatusBar sbStatusBar
	  Align           =   2  'Align Bottom
	  Height          =   270
	  Left            =   0
	  TabIndex        =   1
	  Top             =   5160
	  Width           =   7980
	  _ExtentX        =   14076
	  _ExtentY        =   476
	  Style           =   1
	  SimpleText      =   "Simple"
	  _Version        =   393216
	  BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628}
		 NumPanels       =   3
		 BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628}
			AutoSize        =   1
			Object.Width           =   8440
			Text            =   "Status"
			TextSave        =   "Status"
		 EndProperty
		 BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628}
			Style           =   6
			AutoSize        =   2
			TextSave        =   "5/9/2001"
		 EndProperty
		 BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628}
			Style           =   5
			AutoSize        =   2
			TextSave        =   "2:53 PM"
		 EndProperty
	  EndProperty
   End
   Begin MSComctlLib.ImageList imlToolbarIcons
	  Left            =   960
	  Top             =   2880
	  _ExtentX        =   1005
	  _ExtentY        =   1005
	  BackColor       =   -2147483643
	  ImageWidth      =   16
	  ImageHeight     =   16
	  MaskColor       =   12632256
	  _Version        =   393216
	  BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628}
		 NumListImages   =   8
		 BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "PAWSStarter.frx":030A
			Key             =   "New"
		 EndProperty
		 BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "PAWSStarter.frx":041C
			Key             =   "Open"
		 EndProperty
		 BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "PAWSStarter.frx":052E
			Key             =   "Save"
		 EndProperty
		 BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "PAWSStarter.frx":0986
			Key             =   "Cut"
		 EndProperty
		 BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "PAWSStarter.frx":0A98
			Key             =   "Copy"
		 EndProperty
		 BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "PAWSStarter.frx":0BAA
			Key             =   "Paste"
		 EndProperty
		 BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "PAWSStarter.frx":0CBC
			Key             =   "Back"
		 EndProperty
		 BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "PAWSStarter.frx":0DCE
			Key             =   "Forward"
		 EndProperty
	  EndProperty
   End
   Begin MSComctlLib.Toolbar tbToolBar
	  Align           =   1  'Align Top
	  Height          =   420
	  Left            =   0
	  TabIndex        =   0
	  Top             =   0
	  Width           =   7980
	  _ExtentX        =   14076
	  _ExtentY        =   741
	  ButtonWidth     =   609
	  ButtonHeight    =   582
	  Appearance      =   1
	  ImageList       =   "imlToolbarIcons"
	  _Version        =   393216
	  BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628}
		 NumButtons      =   10
		 BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Key             =   "New"
			Object.ToolTipText     =   "New Ctrl+N"
			ImageKey        =   "New"
		 EndProperty
		 BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Key             =   "Open"
			Object.ToolTipText     =   "Open Ctrl+O"
			ImageKey        =   "Open"
		 EndProperty
		 BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Key             =   "Save"
			Object.ToolTipText     =   "Save Files Ctrl+S"
			ImageKey        =   "Save"
		 EndProperty
		 BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Style           =   3
		 EndProperty
		 BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Key             =   "Cut"
			Object.ToolTipText     =   "Cut Ctrl+X"
			ImageKey        =   "Cut"
		 EndProperty
		 BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Key             =   "Copy"
			Object.ToolTipText     =   "Copy Ctrl+C"
			ImageKey        =   "Copy"
		 EndProperty
		 BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Key             =   "Paste"
			Object.ToolTipText     =   "Paste Ctrl+V"
			ImageKey        =   "Paste"
		 EndProperty
		 BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Style           =   3
		 EndProperty
		 BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Key             =   "Back"
			Object.ToolTipText     =   "Back"
			ImageKey        =   "Back"
		 EndProperty
		 BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Key             =   "Forward"
			Object.ToolTipText     =   "Forward"
			ImageKey        =   "Forward"
		 EndProperty
	  EndProperty
   End
   Begin VB.Menu mnuFile
	  Caption         =   "&File"
	  Begin VB.Menu mnuFileNew
		 Caption         =   "&New"
		 Shortcut        =   ^N
	  End
	  Begin VB.Menu mnuFileOpen
		 Caption         =   "&Open"
		 Shortcut        =   ^O
	  End
	  Begin VB.Menu mnuFileClose
		 Caption         =   "&Close"
	  End
	  Begin VB.Menu mnuFileBar0
		 Caption         =   "-"
	  End
	  Begin VB.Menu mnuFileSave
		 Caption         =   "&Save Files"
		 Shortcut        =   ^S
	  End
	  Begin VB.Menu mnuFileSaveAs
		 Caption         =   "Save &As"
	  End
	  Begin VB.Menu mnuFileBar1
		 Caption         =   "-"
	  End
	  Begin VB.Menu mnuFileMRU
		 Caption         =   "MRU Filelist"
		 Index           =   0
		 Visible         =   0   'False
	  End
	  Begin VB.Menu mnuFileBar5
		 Caption         =   "-"
		 Visible         =   0   'False
	  End
	  Begin VB.Menu mnuFileExit
		 Caption         =   "E&xit"
	  End
   End
   Begin VB.Menu mnuEdit
	  Caption         =   "&Edit"
	  Begin VB.Menu mnuEditUndo
		 Caption         =   "&Undo"
	  End
	  Begin VB.Menu mnuEditBar0
		 Caption         =   "-"
	  End
	  Begin VB.Menu mnuEditCut
		 Caption         =   "Cu&t"
		 Shortcut        =   ^X
	  End
	  Begin VB.Menu mnuEditCopy
		 Caption         =   "&Copy"
		 Shortcut        =   ^C
	  End
	  Begin VB.Menu mnuEditPaste
		 Caption         =   "&Paste"
		 Shortcut        =   ^V
	  End
   End
   Begin VB.Menu mnuLanguage
	  Caption         =   "&Language"
	  Begin VB.Menu mnuLanguageName
		 Caption         =   "&Name..."
	  End
	  Begin VB.Menu mnuLanguageFont
		 Caption         =   "&Font..."
	  End
	  Begin VB.Menu mnuLanguageTextSFM
		 Caption         =   "&Text Marker..."
	  End
   End
   Begin VB.Menu mnuView
	  Caption         =   "&View"
	  Begin VB.Menu mnuViewToolbar
		 Caption         =   "&Tool Bar"
		 Checked         =   -1  'True
	  End
	  Begin VB.Menu mnuViewStatusBar
		 Caption         =   "&Status Bar"
		 Checked         =   -1  'True
	  End
	  Begin VB.Menu mnuViewBar0
		 Caption         =   "-"
	  End
	  Begin VB.Menu mnuViewRefresh
		 Caption         =   "&Refresh"
	  End
   End
   Begin VB.Menu mnuWindow
	  Caption         =   "&Window"
	  WindowList      =   -1  'True
	  Begin VB.Menu mnuWindowNewWindow
		 Caption         =   "&New"
	  End
	  Begin VB.Menu mnuWindowBar0
		 Caption         =   "-"
	  End
	  Begin VB.Menu mnuWindowCascade
		 Caption         =   "&Cascade"
	  End
	  Begin VB.Menu mnuWindowTileHorizontal
		 Caption         =   "Tile &Horizontal"
	  End
	  Begin VB.Menu mnuWindowTileVertical
		 Caption         =   "Tile &Vertical"
	  End
	  Begin VB.Menu mnuWindowArrangeIcons
		 Caption         =   "&Arrange Icons"
	  End
   End
   Begin VB.Menu mnuHelp
	  Caption         =   "&Help"
	  Begin VB.Menu mnuHelpContents
		 Caption         =   "&Contents"
	  End
	  Begin VB.Menu mnuHelpSearchForHelpOn
		 Caption         =   "&Search"
	  End
	  Begin VB.Menu mnuHelpBar0
		 Caption         =   "-"
	  End
	  Begin VB.Menu mnuHelpAbout
		 Caption         =   "&About..."
	  End
   End
End
Attribute VB_Name = "PAWSStarterContainer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function OSWinHelp% Lib "user32" Alias "WinHelpA" (ByVal hwnd&, ByVal HelpFile$, ByVal wCommand%, dwData As Any)
	' filenames used with control
'Public gsWorkingFile As String
'Public gsNewAnswerFile As String
'Public gsUserFile As String
'Public gsUserPath As String

Const gsCaption As String = "PAWSStarter Kit"

	'font info
Public gsVernacularFont As String

	'For MRU list
Option Explicit

Private Const MaxMRU = 6  'Maximum number of MRUs in list (-1 for no limit)
Private Const NotFound = -1   'Indicates a duplicate entry was not found
Private Const NoMRUs = -1     'Indicates no MRUs are currently defined

Private MRUCount As Long      'Maintains a count of MRUs defined

Private Sub ctlPAWSCtl_PAWSDataModified()
	Dim sCaption As String
	sCaption = gsCaption & " - " & ctlPAWSCtl.langName
	If (ctlPAWSCtl.Dirty) Then
		Me.Caption = sCaption & "*"
	Else
		Me.Caption = sCaption
	End If
End Sub

Private Sub ctlPAWSCtl_PAWSTitleChange(sTitle As String)
	sbStatusBar.SimpleText = sTitle
End Sub

Private Sub Form_Load()
		' show splash screen
	frmSplash.Show
	frmSplash.Refresh
	'For i = 0 To 2000000  ' pause long enough for splash to show...
	'i = i
	'Next i

	LoadResStrings Me
	Me.Left = GetSetting(App.Title, "Settings", "MainLeft", 1000)
	Me.Top = GetSetting(App.Title, "Settings", "MainTop", 1000)
	Me.Width = GetSetting(App.Title, "Settings", "MainWidth", 6500)
	Me.Height = GetSetting(App.Title, "Settings", "MainHeight", 6500)

	' Initialize the count of MRUs
	MRUCount = NoMRUs

	' Call sub to retrieve the MRU filenames
	GetMRUFileList
	'MsgBox "MRUCount = " & MRUCount ' DELETE ME!
	If (mnuFileMRU(0).Caption <> "MRU Filelist") Then
		   ' Initially use most recent file
		If (Not ctlPAWSCtl.bFileLoad(mnuFileMRU(0).Caption)) Then
			'TODO: could not load it, so what do we do?
			Dim sNewFile As String
			sNewFile = App.Path & "..\Data\PAWSStarterKitNew.paw"
			If (Not ctlPAWSCtl.bFileLoad(sNewFile)) Then
				MsgBox "The PAWS Starter Kit could not get started!  Contact Support.", vbCritical Or vbOKOnly, "Serious Start Up Error"
				Stop
			End If
			NewLanguage
		End If
	Else
		NewLanguage
	End If

	Unload frmSplash
End Sub

Private Sub Form_Unload(Cancel As Integer)

	ctlPAWSCtl.SaveFileIfNeeded

	'close all sub forms
	Dim i As Integer
	For i = Forms.Count - 1 To 1 Step -1
		Unload Forms(i)
	Next
	If Me.WindowState <> vbMinimized Then
		SaveSetting App.Title, "Settings", "MainLeft", Me.Left
		SaveSetting App.Title, "Settings", "MainTop", Me.Top
		SaveSetting App.Title, "Settings", "MainWidth", Me.Width
		SaveSetting App.Title, "Settings", "MainHeight", Me.Height
	End If
   ' Call sub to save the MRU filenames
   SaveMRUFileList
End Sub

Private Sub mnuLanguageFont_Click()
	ctlPAWSCtl.LanguageFont
End Sub

Private Sub mnuLanguageName_Click()
	ctlPAWSCtl.DialogLangName
End Sub

Private Sub mnuLanguageTextSFM_Click()
	ctlPAWSCtl.DialogTextSfm
End Sub

Private Sub tbToolBar_ButtonClick(ByVal Button As MSComCtlLib.Button)
	On Error Resume Next
	Select Case Button.Key
		Case "New"
			mnuFileNew_Click
		Case "Open"
			mnuFileOpen_Click
		Case "Save"
			mnuFileSave_Click
		Case "Cut"
			mnuEditCut_Click
		Case "Copy"
			mnuEditCopy_Click
		Case "Paste"
			mnuEditPaste_Click
		Case "Back"
			ctlPAWSCtl.BrowserBack
		Case "Forward"
			ctlPAWSCtl.BrowserForward
	End Select
End Sub

Private Sub mnuHelpAbout_Click()
	frmAbout.Show vbModal, Me
End Sub

Private Sub mnuHelpSearchForHelpOn_Click()
	Dim nRet As Integer


	'if there is no helpfile for this project display a message to the user
	'you can set the HelpFile for your application in the
	'Project Properties dialog
	If Len(App.HelpFile) = 0 Then
		MsgBox "Unable to display Help Contents. There is no Help associated with this project.", vbInformation, Me.Caption
	Else
		On Error Resume Next
		nRet = OSWinHelp(Me.hwnd, App.HelpFile, 261, 0)
		If Err Then
			MsgBox Err.Description
		End If
	End If

End Sub

Private Sub mnuHelpContents_Click()
	Dim nRet As Integer


	'if there is no helpfile for this project display a message to the user
	'you can set the HelpFile for your application in the
	'Project Properties dialog
	If Len(App.HelpFile) = 0 Then
		MsgBox "Unable to display Help Contents. There is no Help associated with this project.", vbInformation, Me.Caption
	Else
		On Error Resume Next
		nRet = OSWinHelp(Me.hwnd, App.HelpFile, 3, 0)
		If Err Then
			MsgBox Err.Description
		End If
	End If

End Sub


Private Sub mnuWindowArrangeIcons_Click()
	'ToDo: Add 'mnuWindowArrangeIcons_Click' code.
	MsgBox "'mnuWindowArrangeIcons_Click' not implemented yet."
End Sub

Private Sub mnuWindowTileVertical_Click()
	'ToDo: Add 'mnuWindowTileVertical_Click' code.
	MsgBox "'mnuWindowTileVertical_Click' not implemented yet."
End Sub

Private Sub mnuWindowTileHorizontal_Click()
	'ToDo: Add 'mnuWindowTileHorizontal_Click' code.
	MsgBox "'mnuWindowTileHorizontal_Click' not implemented yet."
End Sub

Private Sub mnuWindowCascade_Click()
	'ToDo: Add 'mnuWindowCascade_Click' code.
	MsgBox "'mnuWindowCascade_Click' not implemented yet."
End Sub

Private Sub mnuWindowNewWindow_Click()
	'ToDo: Add 'mnuWindowNewWindow_Click' code.
	MsgBox "'mnuWindowNewWindow_Click' not implemented yet."
End Sub

Private Sub mnuViewRefresh_Click()
	ctlPAWSCtl.BrowserRefresh
End Sub

Private Sub mnuViewStatusBar_Click()
	mnuViewStatusBar.Checked = Not mnuViewStatusBar.Checked
	sbStatusBar.Visible = mnuViewStatusBar.Checked
	Form_Resize
End Sub

Private Sub mnuViewToolbar_Click()
	mnuViewToolbar.Checked = Not mnuViewToolbar.Checked
	tbToolBar.Visible = mnuViewToolbar.Checked
	Form_Resize
End Sub

Private Sub mnuEditPaste_Click()
	'ToDo: Add 'mnuEditPaste_Click' code.
	MsgBox "'mnuEditPaste_Click' not implemented yet."
End Sub

Private Sub mnuEditCopy_Click()
	'ToDo: Add 'mnuEditCopy_Click' code.
	MsgBox "'mnuEditCopy_Click' not implemented yet."
End Sub

Private Sub mnuEditCut_Click()
	'ToDo: Add 'mnuEditCut_Click' code.
	MsgBox "'mnuEditCut_Click' not implemented yet."
End Sub

Private Sub mnuEditUndo_Click()
	'ToDo: Add 'mnuEditUndo_Click' code.
	MsgBox "'mnuEditUndo_Click' not implemented yet."
End Sub

Private Sub mnuFileExit_Click()
	ctlPAWSCtl.SaveFileIfNeeded
	'unload the form
	Unload Me

End Sub

Private Sub mnuFileSaveAs_Click()
	If (ctlPAWSCtl.bFileSave("Save As")) Then
		' Call sub to add this file as an MRU
		AddMRUItem ctlPAWSCtl.AnswerFileName
	End If
End Sub

Private Sub mnuFileSave_Click()
	If (ctlPAWSCtl.bFileSave("Save")) Then
		' Call sub to add this file as an MRU
		AddMRUItem ctlPAWSCtl.AnswerFileName
	End If
End Sub


Private Sub mnuFileClose_Click()
	mnuFileNew_Click
End Sub

Private Sub mnuFileOpen_Click()
	If (ctlPAWSCtl.bFileOpen()) Then
		' Call sub to add this file as an MRU
		AddMRUItem ctlPAWSCtl.AnswerFileName
	End If
End Sub

Private Sub mnuFileNew_Click()
		' see if need to save any changes
	ctlPAWSCtl.SaveFileIfNeeded
	If (Not ctlPAWSCtl.bFileNew) Then
		Dim sMsg As String
		MsgBox "Could not find PAWSStarterKitNew.xml file!  Contact a PAWS consultant.", vbCritical
	End If
End Sub

Private Sub Form_Resize()
	On Error Resume Next
	If Me.Width < 3000 Then Me.Width = 3000
	ctlPAWSCtl.SizeControls Me.Width, Me.ScaleHeight, _
							sbStatusBar.Height, sbStatusBar.Visible, _
							tbToolBar.Height, tbToolBar.Visible
End Sub

Private Sub mnuFileMRU_Click(Index As Integer)
	If (ctlPAWSCtl.bFileLoad(mnuFileMRU(Index).Caption)) Then
		' Call sub to reorder the MRU list
		ReorderMRUList mnuFileMRU(Index).Caption, CLng(Index)
	End If
End Sub

Private Sub AddMRUItem(NewItem As String)
   Dim result As Long

   ' Call sub to check for duplicates
   result = CheckForDuplicateMRU(NewItem)

   ' Handle case if duplicate found
   If result <> NotFound Then
	  ' Call sub to reorder MRU list
	  ReorderMRUList NewItem, result
   Else
	  ' Call sub to add new item to MRU menu
	  AddMenuElement NewItem
   End If
End Sub

Private Function CheckForDuplicateMRU(ByVal NewItem As String) As Long
   Dim i As Long

   ' Uppercase newitem for string comparisons
   NewItem = UCase$(NewItem)

   ' Check all existing MRUs for duplicate
   For i = 0 To MRUCount
	  If UCase$(Me.mnuFileMRU(i).Caption) = NewItem Then
		 ' Duplicate found, return the location of the duplicate
		 CheckForDuplicateMRU = i

		 ' Stop searching
		 Exit Function
	  End If
   Next i

   ' No duplicate found, so return -1
   CheckForDuplicateMRU = -1
End Function

Private Sub AddMenuElement(NewItem As String)
   Dim i As Long

   ' Check that we will not exceed maximum MRUs
   If (MRUCount < (MaxMRU - 1)) Or (MaxMRU = -1) Then
	  'Increment the menu count
	  MRUCount = MRUCount + 1

	  ' Check if this is the first item
	  If MRUCount <> 0 Then
		 ' Add a new element to the menu
		 Load mnuFileMRU(MRUCount)
	  End If

	  ' Make new element visible
	  mnuFileMRU(MRUCount).Visible = True
   End If

   ' Shift items to maintain most recent to least recent
   For i = (MRUCount) To 1 Step -1
	  ' Set the captions
	  mnuFileMRU(i).Caption = mnuFileMRU(i - 1).Caption
   Next i

   ' Set caption for new item
   mnuFileMRU(0).Caption = NewItem
End Sub

Private Sub ReorderMRUList(DuplicateMRU As String, DuplicateLocation As Long)
   Dim i As Long

   ' Move entries previously "more recent" than the
   ' duplicate down one in the MRU list
   For i = DuplicateLocation To 1 Step -1
	  mnuFileMRU(i).Caption = mnuFileMRU(i - 1).Caption
   Next i

   ' Set caption of newitem
   mnuFileMRU(0).Caption = DuplicateMRU
End Sub

Private Sub GetMRUFileList()
   On Error Resume Next

   Dim i As Long           'Loop control variable
   Dim result As String    'Name of MRU from registry

   ' Loop through all entries
   Do
	  ' Retrieve entry from registry
	  result = GetSetting(App.Title, "MRUFiles", Trim$(CStr(i)), "")
	  'MsgBox "GetMRUFileList: Result = " & result, vbOKOnly 'DELETE ME!
	  ' Check if a value was returned
	  If result <> "" Then
		 ' Call sub to additem to MRU list
		 AddMRUItem result
	  End If

	  ' Increment counter
	  i = i + 1
   Loop Until (result = "")
End Sub

Private Sub SaveMRUFileList()
   Dim i As Long           ' Loop control variable

   ' Loop through all MRU
   For i = 0 To MRUCount
	  ' Write MRU to registry with key as it's position in list
	  SaveSetting App.Title, "MRUFiles", Trim$(CStr(MRUCount - i)), mnuFileMRU(i).Caption
   Next i
End Sub

Private Sub NewLanguage()
	On Error Resume Next

	Dim sNewFile As String
	MsgBox "Starting a new PAWS language project." & vbCrLf & _
		"You'll be asked for the language name and abbreviation." & vbCrLf & _
		"Then you'll be asked to enter font information." & vbCrLf & _
		"After that, you will be asked to save the newly created answers file.", _
		vbOKOnly Or vbInformation, "PAWS Starter Kit - Beginning a new language"
	ctlPAWSCtl.bFileNew
	' Save it so they can create the new file.
	sNewFile = App.Path & "\" & ctlPAWSCtl.LangAbbreviation & "PAWSStarterKit.paw"
	ctlPAWSCtl.AnswerFileName = sNewFile
	mnuFileSaveAs_Click
End Sub
