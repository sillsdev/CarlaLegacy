VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "SHDOCVW.DLL"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmMain
   Caption         =   "ParseBench"
   ClientHeight    =   8130
   ClientLeft      =   60
   ClientTop       =   735
   ClientWidth     =   9345
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   8130
   ScaleWidth      =   9345
   Begin VB.CommandButton btnPreviousPage
	  Caption         =   "Back"
	  Height          =   375
	  Left            =   6960
	  TabIndex        =   11
	  Top             =   540
	  Width           =   735
   End
   Begin VB.CommandButton btnNextPage
	  Caption         =   "Next"
	  Height          =   375
	  Left            =   7800
	  TabIndex        =   8
	  Top             =   540
	  Width           =   615
   End
   Begin VB.CommandButton btnFirstPage
	  Caption         =   "First Page"
	  Height          =   375
	  Left            =   5880
	  TabIndex        =   7
	  Top             =   540
	  Width           =   975
   End
   Begin MSComctlLib.ImageList TreeImageList
	  Left            =   7920
	  Top             =   6240
	  _ExtentX        =   1005
	  _ExtentY        =   1005
	  BackColor       =   -2147483643
	  ImageWidth      =   12
	  ImageHeight     =   12
	  MaskColor       =   12632256
	  _Version        =   393216
	  BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628}
		 NumListImages   =   1
		 BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "frmMain.frx":0442
			Key             =   ""
		 EndProperty
	  EndProperty
   End
   Begin VB.Timer WordBrowserPageLoadedTimer
	  Enabled         =   0   'False
	  Interval        =   10
	  Left            =   5520
	  Top             =   6240
   End
   Begin VB.Timer LoadProjectTimer
	  Enabled         =   0   'False
	  Interval        =   20
	  Left            =   8520
	  Top             =   7200
   End
   Begin VB.Timer WordSelectTimer
	  Enabled         =   0   'False
	  Interval        =   20
	  Left            =   6120
	  Top             =   6840
   End
   Begin VB.Timer LoadCheckTimer
	  Enabled         =   0   'False
	  Left            =   5640
	  Top             =   5400
   End
   Begin VB.PictureBox picWordBrowserSplitter
	  BackColor       =   &H00808080&
	  BorderStyle     =   0  'None
	  FillColor       =   &H00808080&
	  Height          =   135
	  Left            =   3000
	  ScaleHeight     =   58.785
	  ScaleMode       =   0  'User
	  ScaleWidth      =   34476
	  TabIndex        =   6
	  Top             =   4080
	  Visible         =   0   'False
	  Width           =   3315
   End
   Begin SHDocVwCtl.WebBrowser wordBrowser
	  Height          =   1455
	  Left            =   120
	  TabIndex        =   5
	  Top             =   4200
	  Width           =   5295
	  ExtentX         =   9340
	  ExtentY         =   2566
	  ViewMode        =   0
	  Offline         =   0
	  Silent          =   0
	  RegisterAsBrowser=   0
	  RegisterAsDropTarget=   1
	  AutoArrange     =   0   'False
	  NoClientEdge    =   0   'False
	  AlignLeft       =   0   'False
	  ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
	  Location        =   "res://C:\WINNT\system32\shdoclc.dll/dnserror.htm#http:///"
   End
   Begin SHDocVwCtl.WebBrowser setBrowser
	  Height          =   2295
	  Left            =   2280
	  TabIndex        =   4
	  Top             =   1200
	  Width           =   3015
	  ExtentX         =   5318
	  ExtentY         =   4048
	  ViewMode        =   0
	  Offline         =   0
	  Silent          =   0
	  RegisterAsBrowser=   0
	  RegisterAsDropTarget=   1
	  AutoArrange     =   0   'False
	  NoClientEdge    =   0   'False
	  AlignLeft       =   0   'False
	  ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
	  Location        =   "res://C:\WINNT\system32\shdoclc.dll/dnserror.htm#http:///"
   End
   Begin VB.PictureBox picSplitter
	  BackColor       =   &H00808080&
	  BorderStyle     =   0  'None
	  FillColor       =   &H00808080&
	  Height          =   3240
	  Left            =   2160
	  ScaleHeight     =   1410.835
	  ScaleMode       =   0  'User
	  ScaleWidth      =   780
	  TabIndex        =   3
	  Top             =   720
	  Visible         =   0   'False
	  Width           =   72
   End
   Begin MSComctlLib.Toolbar tbToolBar
	  Align           =   1  'Align Top
	  Height          =   420
	  Left            =   0
	  TabIndex        =   1
	  Top             =   0
	  Width           =   9345
	  _ExtentX        =   16484
	  _ExtentY        =   741
	  ButtonWidth     =   609
	  ButtonHeight    =   582
	  Appearance      =   1
	  ImageList       =   "imlToolbarIcons"
	  _Version        =   393216
	  BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628}
		 NumButtons      =   9
		 BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Key             =   "Open"
			Object.ToolTipText     =   "Open"
			ImageIndex      =   1
		 EndProperty
		 BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Key             =   "Save"
			Object.ToolTipText     =   "Save"
			ImageIndex      =   2
		 EndProperty
		 BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Enabled         =   0   'False
			ImageIndex      =   3
			Style           =   3
		 EndProperty
		 BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Enabled         =   0   'False
			Key             =   "Find"
			Object.ToolTipText     =   "Find"
			ImageIndex      =   3
		 EndProperty
		 BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Enabled         =   0   'False
			Key             =   "Parse"
			ImageIndex      =   4
		 EndProperty
		 BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Key             =   "ParseSet"
			Object.ToolTipText     =   "Parse Current Set"
			ImageIndex      =   5
		 EndProperty
		 BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Enabled         =   0   'False
			Style           =   3
		 EndProperty
		 BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Key             =   "View"
			Object.ToolTipText     =   "Select View Mode"
			ImageIndex      =   6
			Style           =   5
			BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628}
			   NumButtonMenus  =   2
			   BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628}
				  Key             =   "Stats"
				  Text            =   "Statistics"
			   EndProperty
			   BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628}
				  Key             =   "Words"
				  Text            =   "Words"
			   EndProperty
			EndProperty
		 EndProperty
		 BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628}
			Key             =   "Refresh"
			Object.ToolTipText     =   "Refresh View window"
			ImageIndex      =   8
		 EndProperty
	  EndProperty
   End
   Begin MSComctlLib.StatusBar sbStatusBar
	  Align           =   2  'Align Bottom
	  Height          =   270
	  Left            =   0
	  TabIndex        =   0
	  Top             =   7860
	  Width           =   9345
	  _ExtentX        =   16484
	  _ExtentY        =   476
	  _Version        =   393216
	  BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628}
		 NumPanels       =   3
		 BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628}
			AutoSize        =   1
			Object.Width           =   10848
			Text            =   "Status"
			TextSave        =   "Status"
		 EndProperty
		 BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628}
			Style           =   6
			AutoSize        =   2
			TextSave        =   "27/09/00"
		 EndProperty
		 BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628}
			Style           =   5
			AutoSize        =   2
			TextSave        =   "2:58 PM"
		 EndProperty
	  EndProperty
   End
   Begin MSComDlg.CommonDialog dlgCommonDialog
	  Left            =   6720
	  Top             =   6360
	  _ExtentX        =   847
	  _ExtentY        =   847
	  _Version        =   393216
   End
   Begin MSComctlLib.ImageList imlToolbarIcons
	  Left            =   7320
	  Top             =   6720
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
			Picture         =   "frmMain.frx":07AB
			Key             =   "Open"
		 EndProperty
		 BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "frmMain.frx":08BD
			Key             =   "Save"
		 EndProperty
		 BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "frmMain.frx":09CF
			Key             =   "Find"
		 EndProperty
		 BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "frmMain.frx":0AE1
			Key             =   "Parse"
		 EndProperty
		 BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "frmMain.frx":0F33
			Key             =   "ParseSet"
		 EndProperty
		 BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "frmMain.frx":12C2
			Key             =   "Stats"
		 EndProperty
		 BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "frmMain.frx":13D4
			Key             =   "Words"
		 EndProperty
		 BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628}
			Picture         =   "frmMain.frx":14E6
			Key             =   ""
		 EndProperty
	  EndProperty
   End
   Begin MSComctlLib.TreeView tvFilters
	  Height          =   3000
	  Left            =   0
	  TabIndex        =   2
	  Top             =   1080
	  Width           =   2010
	  _ExtentX        =   3545
	  _ExtentY        =   5292
	  _Version        =   393217
	  HideSelection   =   0   'False
	  Indentation     =   998
	  Style           =   3
	  ImageList       =   "TreeImageList"
	  Appearance      =   1
   End
   Begin VB.Image picHeader
	  BorderStyle     =   1  'Fixed Single
	  Height          =   495
	  Left            =   0
	  Top             =   480
	  Width           =   8655
   End
   Begin VB.Label Label1
	  Caption         =   "Filters"
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   9.75
		 Charset         =   0
		 Weight          =   700
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  Height          =   255
	  Left            =   120
	  TabIndex        =   10
	  Top             =   600
	  Width           =   1815
   End
   Begin VB.Label lblHeader
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   9.75
		 Charset         =   0
		 Weight          =   400
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  Height          =   255
	  Left            =   2400
	  TabIndex        =   9
	  Top             =   600
	  Width           =   2415
   End
   Begin VB.Image imgWordBrowserSplitter
	  Height          =   105
	  Left            =   120
	  MousePointer    =   7  'Size N S
	  Top             =   4080
	  Width           =   4095
   End
   Begin VB.Image imgSplitter
	  Height          =   3225
	  Left            =   1965
	  MousePointer    =   9  'Size W E
	  Top             =   705
	  Width           =   150
   End
   Begin VB.Menu mnuFile
	  Caption         =   "&File"
	  Begin VB.Menu mnuFileOpen
		 Caption         =   "&Open Wordform Inventory..."
	  End
	  Begin VB.Menu mnuFileAddWords
		 Caption         =   "&Import word list..."
	  End
	  Begin VB.Menu mnuFileBar0
		 Caption         =   "-"
	  End
	  Begin VB.Menu mnuFileNew
		 Caption         =   "&New Wordform Inventory"
		 Shortcut        =   ^N
	  End
	  Begin VB.Menu mnuFileBar1
		 Caption         =   "-"
	  End
	  Begin VB.Menu mnuFileSave
		 Caption         =   "&Save Wordform Inventory"
		 Shortcut        =   ^S
	  End
	  Begin VB.Menu mnuFileBar2
		 Caption         =   "-"
	  End
	  Begin VB.Menu mnuFileMRU
		 Caption         =   ""
		 Index           =   1
		 Visible         =   0   'False
	  End
	  Begin VB.Menu mnuFileMRU
		 Caption         =   ""
		 Index           =   2
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
   Begin VB.Menu mnuEditFilters
	  Caption         =   "&Edit"
	  Begin VB.Menu mnuFilterNew
		 Caption         =   "&New Filter..."
	  End
	  Begin VB.Menu mnuFilterEdit
		 Caption         =   "&Edit Filter..."
	  End
	  Begin VB.Menu mnuFilterDelete
		 Caption         =   "&Delete Filter"
		 Shortcut        =   {DEL}
	  End
   End
   Begin VB.Menu mnuview
	  Caption         =   "&View"
	  Begin VB.Menu mnuViewRefresh
		 Caption         =   "&Refresh"
		 Shortcut        =   {F5}
	  End
	  Begin VB.Menu mnuviewdivider
		 Caption         =   "-"
	  End
	  Begin VB.Menu mnuViewWordList
		 Caption         =   "Show &Word List"
	  End
	  Begin VB.Menu mnuViewStatistics
		 Caption         =   "Show &Statistics"
	  End
   End
   Begin VB.Menu mnuOptions
	  Caption         =   "&Options"
	  Begin VB.Menu mnuOptionsDisplay
		 Caption         =   "&Display..."
		 Index           =   1
	  End
	  Begin VB.Menu mnuOptionsSentransRules
		 Caption         =   "&Sentrans Rules..."
		 Index           =   2
	  End
	  Begin VB.Menu mnuOptionsFilters
		 Caption         =   "&Filters..."
		 Index           =   3
	  End
   End
   Begin VB.Menu mnuWords
	  Caption         =   "&Words"
	  Begin VB.Menu mnuWordsAdd
		 Caption         =   "&Add new words..."
	  End
   End
   Begin VB.Menu mnuHelp
	  Caption         =   "&Help"
	  Begin VB.Menu mnuHelpBar0
		 Caption         =   "-"
	  End
	  Begin VB.Menu mnuHelpAbout
		 Caption         =   "&About "
	  End
   End
   Begin VB.Menu mnuLoading
	  Caption         =   "Loading..."
	  Begin VB.Menu mnuCancelLoading
		 Caption         =   "&Cancel Loading"
	  End
   End
   Begin VB.Menu mnuParsing
	  Caption         =   "Parsing..."
	  Begin VB.Menu mnuCancelParsing
		 Caption         =   "&Cancel Parsing"
	  End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private WithEvents m_wordListTable As HTMLListTable
Attribute m_wordListTable.VB_VarHelpID = -1
Private WithEvents m_parseListTable As HTMLParseListTable
Attribute m_parseListTable.VB_VarHelpID = -1

Private m_bSplitterMoving As Boolean
Private m_proj As New PBProject

Public m_filters As New FilterCollection
Private m_currentFilter As Filter

Private m_nSelectedWordPos As Long
Private m_nWordsPerPage As Long
Private m_nLastProgress As Integer
Private m_nScrollParseListTop As Integer
Private m_sDisplayMode As String

Const sglHorizSplitLimit = 500
Const sglVertSplitLimit = 500
Private Sub DisplayOptions(Index As Integer)
'this sub will display our options form with the correct tab showing
  Dim dlg As New DlgAllOptions

	Set dlg.m_project = m_proj
	dlg.m_nWordsPerPage = m_nWordsPerPage

	If m_proj.DoWriteSentransRules Then
		dlg.bOutputSentransRules.Value = 1
	End If

	dlg.sRulesPath = m_proj.sSentransRuleOutputPath

	Select Case Index
		Case 1
			dlg.tabOptions.Tab = 3      'display tab
		Case 2
			dlg.tabOptions.Tab = 2      'sentram tab
		Case 3
			dlg.tabOptions.Tab = 1      'filter tab
		Case 4
			dlg.tabOptions.Tab = 0      'stats tab
	End Select

	dlg.Show vbModal
	If dlg.m_bOK Then
		If dlg.sSaveAsFiltersPath <> "" Then
			m_filters.Save (dlg.sSaveAsFiltersPath)
		End If
		If dlg.sUseFiltersPath <> "" Then
			If Not m_filters.LoadFromXMLFile(dlg.sUseFiltersPath) Then
				Exit Sub ' exit without changing the Path
			End If
			UpdateFilterList
		End If
		m_proj.FiltersPath = dlg.sFilterFilePath

		setModified True
		m_proj.DoWriteSentransRules = dlg.bOutputSentransRules
		m_proj.sSentransRuleOutputPath = dlg.sRulesPath
		m_nWordsPerPage = dlg.m_nWordsPerPage
		useFilter False, m_currentFilter ' specify the filter so that we get a complete reset
	End If

End Sub



Private Sub ParseCurrentSet()

	If m_proj.Ready Then
		Dim fs As New FileSystemObject

		If m_proj.m_bWFIModified Then mnuFileSave_Click

		MousePointer = vbHourglass
		Dim sUpdateWFIPath As String
	   Call ParseSet(m_proj, fs.GetParentFolderName(m_proj.Path), sbStatusBar, m_currentFilter.XPathString) ' parse the words in this set
		setModified True
		sbStatusBar.SimpleText = ""
		sbStatusBar.Style = sbrNormal
		useFilter True 'refresh the display
		MousePointer = vbNormal
	End If
End Sub
Private Sub useDefaultFilter()
   If m_filters.Count > 0 Then
		useFilter False, m_filters.Item(1)
	Else
		MsgBox "There are no filters in this project (and that's bad).", vbCritical
	End If
End Sub
Private Sub setModified(b As Boolean)
	m_proj.m_bWFIModified = b

	refreshCaption
End Sub
Private Sub refreshCaption()
	 If m_proj.Ready Then
		Me.Caption = "ParseBench - " + m_proj.Path
		If m_proj.m_bWFIModified Then Me.Caption = Me.Caption + "*"
	Else
		Me.Caption = "ParseBench - No Wordform Inventory Loaded"
	End If
End Sub
'bRefreshOnly=true prevents prompting the user on filters with prompts
Private Sub useFilter(bRefreshOnly As Boolean, Optional f As Filter)
	If f Is Nothing Then
		Set f = m_currentFilter
	Else
		f.GotoFirstPage ' if a filter was explicitly specified, then we want to show the first page
	End If

	Set m_currentFilter = f
	Set tvFilters.SelectedItem = tvFilters.nodes(f.Key)
	f.m_nWordsPerPage = m_nWordsPerPage

	If m_proj.Ready Then
		refreshCaption
		If m_wordListTable Is Nothing Then
			Set m_wordListTable = New HTMLListTable
		End If
		m_wordListTable.HTMLListTable_clear

	 MousePointer = vbHourglass
	   mnuLoading.Visible = True
		wordBrowser.Navigate App.Path + "\pb-html\emptyWordView.htm"
		sbStatusBar.SimpleText = "Filtering words..."

		Dim nTotalWordCount As Long
		'nMaxWords = kMaxShowableWords
		Dim sPagePath As String
		If m_sDisplayMode = "wordlist" Then
			sPagePath = f.writeFilterViewPage(m_proj, m_wordListTable, nTotalWordCount, bRefreshOnly)
			Dim n As Long
			n = m_currentFilter.LastWordNumber
			If n > nTotalWordCount Then
				n = nTotalWordCount
			End If
			lblHeader = Str(m_currentFilter.FirstWordNumber) + "-" + Str(n) + " of " + Str(nTotalWordCount) + " words"
			updateButtons nTotalWordCount
		Else
			sPagePath = f.writeStatisticsPage(m_proj, nTotalWordCount, bRefreshOnly)
			lblHeader = "" ' not implemented yet Str(nTotalWordCount) + " words"
			updateButtons -1
		End If
		If sPagePath = "" Then
			MousePointer = vbNormal
			Exit Sub ' will happen when???
		End If
		sbStatusBar.SimpleText = "Loading table..."
		setBrowser.Navigate2 sPagePath
		 MousePointer = vbNormal
	End If
End Sub

Private Sub btnFirstPage_Click()
	m_currentFilter.GotoFirstPage
	useFilter False
End Sub

Private Sub btnNextPage_Click()
	m_currentFilter.GotoNextPage
	useFilter False
End Sub

Private Sub btnPreviousPage_Click()
	m_currentFilter.GotoPreviousPage
	useFilter False
End Sub
' this should be called with an argument of -1 if the button should be hidden
 Private Sub updateButtons(nTotalWords As Long)
	btnFirstPage.Visible = (nTotalWords > -1)
	btnPreviousPage.Visible = btnFirstPage.Visible
	btnNextPage.Visible = btnFirstPage.Visible

	 btnFirstPage.Enabled = (m_currentFilter.Page > 0)
	btnPreviousPage.Enabled = btnFirstPage.Enabled
	btnNextPage.Enabled = (m_currentFilter.Page < (m_currentFilter.PageCount(nTotalWords) - 1))

End Sub

'this action is on a timer so that the window can be presented to the user before this long operation,
' so they don't stare at the splash screen for several minutes.
Private Sub LoadProjectTimer_timer()
	LoadProjectTimer.Enabled = False
	'm_proj.Load sbStatusBar
	LoadProject
End Sub

Private Sub mnuFileExit_Click()

	  Unload Me     'goodbye.
End Sub

Private Sub mnuFileSave_Click()
   Me.MousePointer = vbHourglass

   If m_filters.NeedSaving(m_proj.FiltersPath) Then
		sbStatusBar.SimpleText = "Saving Filters..."
		m_filters.Save (m_proj.FiltersPath)
   End If

	If m_proj.m_bWFIModified Then
	   sbStatusBar.SimpleText = "Saving Project..."
	   setModified Not m_proj.Save

	End If

		 If m_proj.DoWriteSentransRules Then
			sbStatusBar.SimpleText = "Writing Sentrans rules..."
			WriteSTRuleFile m_proj.WFIDOM, m_proj.sSentransRuleOutputPath
		End If

	sbStatusBar.SimpleText = ""
	sbStatusBar.Style = sbrNormal

	Me.MousePointer = vbNormal
End Sub

Private Sub mnuFilterDelete_Click()
   If tvFilters.SelectedItem Is Nothing Then
		Exit Sub
	End If
	Dim f As Filter
	Set f = m_filters.Item(tvFilters.SelectedItem.Key)
	m_filters.Remove f
	UpdateFilterList
End Sub

Private Sub mnuFilterEdit_Click()
	Dim tmpBool As Boolean

	If tvFilters.SelectedItem Is Nothing Then
		Exit Sub
	End If
	Dim f As Filter
	Set f = m_filters.Item(tvFilters.SelectedItem.Key)
	tmpBool = f.Edit
	If tmpBool Then
		 m_filters.m_bModified = True
	End If
	tvFilters.SelectedItem.Text = f.Label
End Sub

Private Sub mnuFilterNew_Click()
	Dim f As New Filter
	If f.InitFromEditDlg Then
		m_filters.Add f
		UpdateFilterList
	End If
End Sub

Private Sub mnuOptionsDisplay_Click(Index As Integer)
	'Dim dlg As New frmDisplayOptions
	DisplayOptions (Index)

End Sub

Private Sub mnuOptionsFilters_Click(Index As Integer)
'    Dim dlg As New DlgFiltersOptions
'    Set dlg.m_project = m_proj
'    dlg.Show vbModal
'    If dlg.m_bOK Then
'        If dlg.sSaveAsFiltersPath <> "" Then
'            m_filters.Save (dlg.sSaveAsFiltersPath)
'        End If
'        If dlg.sUseFiltersPath <> "" Then
'            If Not m_filters.LoadFromXMLFile(dlg.sUseFiltersPath) Then
'                Exit Sub ' exit without changing the Path
'            End If
'            UpdateFilterList
'        End If
'        m_proj.FiltersPath = dlg.sFilterFilePath
'    End If

  DisplayOptions (Index)

End Sub

Private Sub mnuOptionsSentransRules_Click(Index As Integer)
'    Dim dlg As New DlgSentrans
'    dlg.bOutputSentransRules = m_proj.DoWriteSentransRules
'    dlg.sRulesPath = m_proj.sSentransRuleOutputPath
'    dlg.Show vbModal
'    If dlg.m_bOK Then
'        setModified True
'        m_proj.DoWriteSentransRules = dlg.bOutputSentransRules
'        m_proj.sSentransRuleOutputPath = dlg.sRulesPath
'    End If

	DisplayOptions (Index)
End Sub


Private Sub mnuViewStatistics_Click()
	m_sDisplayMode = "stats"
	updateMenus
	tbToolBar.Buttons(8).Image = 7
	SizeControls imgSplitter.Left, imgWordBrowserSplitter.Top
	useFilter True
End Sub
Private Sub mnuViewWordList_Click()
	m_sDisplayMode = "wordlist"
	updateMenus
	tbToolBar.Buttons(8).Image = 6
	SizeControls imgSplitter.Left, imgWordBrowserSplitter.Top
	useFilter True
End Sub
Private Sub updateMenus()
	mnuViewWordList.Checked = (m_sDisplayMode = "wordlist")
	mnuViewStatistics.Checked = Not mnuViewWordList.Checked
End Sub


Private Sub setBrowser__GotFocus()
	mnuEdit.Visible = True
	mnuEditFilters.Visible = False
End Sub

Private Sub mnuWordsAdd_Click()
	Dim dlg As New DlgAddWords
	dlg.Show vbModal
	 If dlg.m_bOK Then
		setModified True
		updateWFI m_proj, dlg.m_sNewWordsPath, Me.sbStatusBar, True
		useFilter False ' show the new words
	End If
   Unload dlg
End Sub

Private Sub tbToolBar_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
	Select Case ButtonMenu.Key
		Case "stats"
			Call mnuViewStatistics_Click

		Case "wordlist"
			Call mnuViewWordList_Click

	End Select

End Sub

Private Sub tvFilters_AfterLabelEdit(nCancel As Integer, sNewLabel As String)
	If nCancel = 1 Then
		Exit Sub
	End If
	Dim f As Filter
	Set f = m_filters.Item(tvFilters.SelectedItem.Key)
	f.Label = sNewLabel
End Sub

Private Sub wordBrowser_GotFocus()
	mnuEdit.Visible = True
	mnuEditFilters.Visible = False
End Sub
Private Sub tvFilters_GotFocus()
	mnuEdit.Visible = False
	mnuEditFilters.Visible = True
End Sub

Private Sub tvFilters_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)

   If Button = 2 Then   ' Check if right mouse button was clicked.
	  PopupMenu mnuEditFilters
   End If

End Sub

Private Sub wordBrowser_NavigateComplete2(ByVal pDisp As Object, URL As Variant)
   ' we do not want to start this timer if we have only loaded a static page, rather than the list of parses
   ' we checked this by seeing if they URL contains the path to the place that we store our static pages.

	If Strings.InStr(1, URL, "PB-HTML") = 0 Then
		WordBrowserPageLoadedTimer.Enabled = True
	End If
End Sub

Private Sub WordBrowserPageLoadedTimer_Timer()
	If wordBrowser.Busy Then Exit Sub
		 WordBrowserPageLoadedTimer.Enabled = False
		 Dim t As HTMLTable
		Set t = wordBrowser.Document.All("ParseListTable")
		If t Is Nothing Then
		   ' we will get this when the navigation was to some page other than a parse list
		   'MsgBox "the parse list table object was not found"
		Else
			WordBrowserPageLoadedTimer.Enabled = False
			Set m_parseListTable = New HTMLParseListTable
			m_parseListTable.HTMLParseListTable_setTable t
			m_parseListTable.scrollTop = m_nScrollParseListTop
			m_nScrollParseListTop = 0

		End If
End Sub

Private Sub m_wordListTable_ColumnClicked()
	m_currentFilter.GotoFirstPage ' we will have a new sort order now,
								'so it doesn't make sense to leave and add some arbitrary page
	useFilter False
End Sub

'this action is on a timer so that the window can be presented to the user before this long operation,
' so that the word they clicked on will highlight immediately
Private Sub WordSelectTimer_timer()
	 WordSelectTimer.Enabled = False
	' wordBrowser.Navigate2 App.Path + "\pb-html\loadingword.htm" 'would this show, even on a slow machine?
	MousePointer = vbHourglass
	Dim sPath As String
	sPath = writeWordPage(m_proj, m_nSelectedWordPos)
	MousePointer = vbNormal

  wordBrowser.Navigate2 sPath
End Sub

'this is needed because the Web browser loads the page asynchronously, and the various events that it gets back our unreliable
Private Sub LoadCheckTimer_Timer()
	If Not wordBrowser.Busy Then
		mnuLoading.Visible = False
		LoadCheckTimer.Enabled = False

		Dim t As HTMLTable
		Set t = setBrowser.Document.All("wordListTable")
		If t Is Nothing Then
		   ' MsgBox "the list table object was not found"
		Else
		 m_wordListTable.HTMLListTable_setTable t
		 'lblHeader = Str(m_wordListTable.countRows()) + " Words"
		 End If
	End If
End Sub

Private Sub mnuCancelLoading_Click()
		mnuLoading.Visible = False
		setBrowser.Stop
		useDefaultFilter
End Sub

Private Sub setBrowser_ProgressChange(ByVal Progress As Long, ByVal ProgressMax As Long)
	Me.sbStatusBar.Style = sbrSimple
	If Progress < 10 Then
		m_nLastProgress = 0
	End If

	If (ProgressMax > 0) Then
		If (Progress / ProgressMax) - m_nLastProgress > 1 Then ' only show something for every percentage change
			m_nLastProgress = (Progress / ProgressMax)
			Me.sbStatusBar.SimpleText = "Loading " + m_proj.Path + "  " + Str((Progress / ProgressMax) * 100) + "%"
		End If
	Else
		Me.sbStatusBar.Style = sbrNormal
	End If
End Sub

Private Sub tvFilters_Click()
	If tvFilters.SelectedItem Is Nothing Then
		Exit Sub
	End If
	useFilter False, m_filters.Item(tvFilters.SelectedItem.Key)
End Sub

Private Sub m_wordListTable_RowSelected(nWordPos As Long)
	Set m_parseListTable = Nothing
	m_nSelectedWordPos = nWordPos
	WordSelectTimer.Enabled = True
End Sub
Private Sub setBrowser_NavigateComplete2(ByVal pDisp As Object, URL As Variant)
	If Not m_proj.Ready Then
		Exit Sub
	End If
	LoadCheckTimer.Interval = 100
	LoadCheckTimer.Enabled = True
End Sub

Private Sub Form_Load()

	 m_sDisplayMode = "wordlist" '"stats"
	 updateMenus
	 mnuLoading.Visible = False
	 mnuParsing.Visible = False

	wordBrowser.Offline = True

	setBrowser.Offline = True

	Me.Left = GetSetting(App.Title, "Settings", "MainLeft", 1000)
	Me.Top = GetSetting(App.Title, "Settings", "MainTop", 1000)
	Me.Width = GetSetting(App.Title, "Settings", "MainWidth", 6500)
	Me.Height = GetSetting(App.Title, "Settings", "MainHeight", 6500)
	imgSplitter.Left = GetSetting(App.Title, "Settings", "horizSplitter", 2000)
	imgWordBrowserSplitter.Top = GetSetting(App.Title, "Settings", "vertSplitter", 4000)
	m_nWordsPerPage = GetSetting(App.Title, "Settings", "WordsPerPage", 200)

	m_proj.Path = GetSetting(App.Title, "Settings", "WFIPath", "")


	If m_proj.Path <> "" Then
		Dim fs As New FileSystemObject
		If Not fs.FileExists(m_proj.Path) Then
			MsgBox "the Wordform Inventory that you last used with ParseBench," + m_proj.Path + ", has been moved or removed."
			m_proj.Path = ""
		End If
	End If

	If m_proj.Path = "" Then
		setBrowser.Navigate2 App.Path + "\pb-html\emptywordview.htm"
		wordBrowser.Navigate2 App.Path + "\pb-html\emptywordview.Htm"
	Else
		LoadProjectTimer.Enabled = True
		setBrowser.Navigate2 App.Path + "\pb-html\loadingwfi.htm"
		wordBrowser.Navigate2 App.Path + "\pb-html\splash.Htm"
	End If


End Sub
Private Sub UpdateFilterList()
	Dim f As Filter
	With tvFilters.nodes
		.Clear
		For Each f In m_filters
			If Not f.Hidden Then
				.Add , , f.Key, f.Label
				.Item(f.Key).Image = 1
			End If
		Next f
	End With
End Sub



Private Sub Form_Unload(Cancel As Integer)

	Dim intResult As Integer

	  If m_proj.m_bWFIModified Or m_filters.m_bModified Then     'anything modified?
		intResult = MsgBox("Save changes?", vbYesNo + vbQuestion, "SAVE?")  'save changes?
		If intResult = vbYes Then   'save
			Call mnuFileSave_Click  'call save
		End If
	  End If

	  Dim i As Integer

	'close all sub forms
	For i = Forms.Count - 1 To 1 Step -1
		Unload Forms(i)
	Next
	If Me.WindowState <> vbMinimized Then
		SaveSetting App.Title, "Settings", "MainLeft", Me.Left
		SaveSetting App.Title, "Settings", "MainTop", Me.Top
		SaveSetting App.Title, "Settings", "MainWidth", Me.Width
		SaveSetting App.Title, "Settings", "MainHeight", Me.Height
		SaveSetting App.Title, "settings", "horizSplitter", imgSplitter.Left
		SaveSetting App.Title, "settings", "vertSplitter", imgWordBrowserSplitter.Top
	End If
	SaveSetting App.Title, "Settings", "WFIPath", m_proj.Path
	SaveSetting App.Title, "Settings", "WordsPerPage", m_nWordsPerPage
End Sub



Private Sub Form_Resize()
	On Error Resume Next
	If Me.Width < 3000 Then Me.Width = 3000
	SizeControls imgSplitter.Left, imgWordBrowserSplitter.Top
End Sub
Private Sub imgWordBrowserSplitter_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
	With imgWordBrowserSplitter
		picWordBrowserSplitter.Move .Left, .Top, .Width - 20, .Height \ 2
	End With
	picWordBrowserSplitter.Visible = True
	m_bSplitterMoving = True
End Sub


Private Sub imgWordBrowserSplitter_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
	Dim sglPos As Single


	If m_bSplitterMoving Then
		sglPos = y + imgWordBrowserSplitter.Top
		If sglPos < sglVertSplitLimit Then
			picWordBrowserSplitter.Top = sglVertSplitLimit
		ElseIf sglPos > Me.Height - sglVertSplitLimit Then
			picWordBrowserSplitter.Top = Me.Height - sglVertSplitLimit
		Else
			picWordBrowserSplitter.Top = sglPos
		End If
	End If
End Sub


Private Sub imgWordBrowserSplitter_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
		SizeControls picSplitter.Left, picWordBrowserSplitter.Top
	picWordBrowserSplitter.Visible = False
	m_bSplitterMoving = False
End Sub

Private Sub imgSplitter_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
	With imgSplitter
		picSplitter.Move .Left, .Top, .Width \ 2, .Height - 20
	End With
	picSplitter.Visible = True
	m_bSplitterMoving = True
End Sub


Private Sub imgSplitter_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
	Dim sglPos As Single


	If m_bSplitterMoving Then
		sglPos = x + imgSplitter.Left
		If sglPos < sglHorizSplitLimit Then
			picSplitter.Left = sglHorizSplitLimit
		ElseIf sglPos > Me.Width - sglHorizSplitLimit Then
			picSplitter.Left = Me.Width - sglHorizSplitLimit
		Else
			picSplitter.Left = sglPos
		End If
	End If
End Sub


Private Sub imgSplitter_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
	SizeControls picSplitter.Left, picWordBrowserSplitter.Top
	picSplitter.Visible = False
	m_bSplitterMoving = False
End Sub


Private Sub TreeView1_DragDrop(Source As Control, x As Single, y As Single)
	If Source = imgSplitter Then
		SizeControls x, y
	End If
End Sub


Sub SizeControls(x As Single, y As Single)
	On Error Resume Next

	picHeader.Width = Me.Width


	'set the width
	If x < 1500 Then x = 1500
	If x > (Me.Width - 1500) Then x = Me.Width - 1500
	tvFilters.Width = x
	imgSplitter.Left = x
	setBrowser.Left = x + 40
	setBrowser.Width = Me.Width - (tvFilters.Width + 140)


	wordBrowser.Left = Me.ScaleLeft

	wordBrowser.Width = Me.ScaleWidth

	'set the top


	If tbToolBar.Visible Then
		tvFilters.Top = tbToolBar.Height + picHeader.Height
	Else
		tvFilters.Top = picHeader.Height
	End If



 '   wordBrowser.Top = Me.ScaleHeight - (wordBrowser.Height + sbStatusBar.Height)

	 'set the height of the wordBrowser
	If y < 1500 Then y = 1500
	If y > (Me.Height - 1500) Then y = Me.Height - 1500
	wordBrowser.Top = y + imgWordBrowserSplitter.Height

	wordBrowser.Height = Me.ScaleHeight - (wordBrowser.Top + sbStatusBar.Height - 20)
	 imgWordBrowserSplitter.Top = y
	imgWordBrowserSplitter.Width = wordBrowser.Width

	'set the height
	If sbStatusBar.Visible Then
		tvFilters.Height = Me.ScaleHeight - (wordBrowser.Height + picHeader.Top + picHeader.Height + sbStatusBar.Height)
	Else
		tvFilters.Height = Me.ScaleHeight - (wordBrowser.Height + picHeader.Top + picHeader.Height)
	End If

	setBrowser.Height = tvFilters.Height
   setBrowser.Top = tvFilters.Top

	If Not (m_sDisplayMode = "wordlist") Then
		wordBrowser.Visible = False
		setBrowser.Height = tvFilters.Height + wordBrowser.Height
	Else
		wordBrowser.Visible = True
	End If

	imgSplitter.Top = tvFilters.Top
	imgSplitter.Height = tvFilters.Height

	' arrange the paging buttons
'    Dim bShowPageButtons As Boolean
'    bShowPageButtons = True
'    btnMostFreq.Visible = bShowPageButtons
'    btnNextPage.Visible = bShowPageButtons
'    If bShowPageButtons Then
		btnNextPage.Left = (picHeader.Left + picHeader.Width) - (btnNextPage.Width + 250)
		btnPreviousPage.Left = btnNextPage.Left - (btnPreviousPage.Width + 100)
		btnFirstPage.Left = btnPreviousPage.Left - (btnFirstPage.Width + 100)

'    End If
End Sub



Private Sub tbToolBar_ButtonClick(ByVal Button As MSComctlLib.Button)
	'On Error Resume Next

	Select Case Button.Key
		Case "Open"
			mnuFileOpen_Click
		Case "Save"
			mnuFileSave_Click
		Case "Find"
			'ToDo: Add 'Find' button code.
			MsgBox "Sorry, Find has not been implemented yet. "
		Case "ParseSet"
			ParseCurrentSet
		Case "View"
			If Button.Image = 7 Then
				Call mnuViewWordList_Click
			Else
				Call mnuViewStatistics_Click
			End If
		Case "Refresh"
			mnuViewRefresh_Click


	End Select
End Sub

Private Sub mnuHelpAbout_Click()
	frmAbout.Show vbModal, Me
End Sub



Private Sub mnuViewWebBrowser_Click()
	Dim frmB As New frmBrowser
	frmB.StartingAddress = ""
	frmB.Show
End Sub


Private Sub mnuViewRefresh_Click()
'    If Me.ActiveControl Is wordBrowser Then
		'To Do
 '   ElseIf Me.ActiveControl Is setBrowser Then
		useFilter True
  '  End If
End Sub


Private Sub mnuEditPaste_Click()
	'ToDo: Add 'mnuEditPaste_Click' code.
	MsgBox "Add 'mnuEditPaste_Click' code."
End Sub

Private Sub mnuEditCopy_Click()
	'ToDo: Add 'mnuEditCopy_Click' code.
	MsgBox "Add 'mnuEditCopy_Click' code."
End Sub

Private Sub mnuEditCut_Click()
	'ToDo: Add 'mnuEditCut_Click' code.
	MsgBox "Add 'mnuEditCut_Click' code."
End Sub

Private Sub mnuEditUndo_Click()
	'ToDo: Add 'mnuEditUndo_Click' code.
	MsgBox "Add 'mnuEditUndo_Click' code."
End Sub

Private Sub mnuFileClose_Click()
	mnuFileExit_Click
	'unload the form
	'Unload Me

End Sub

Private Sub mnuFileNew_Click()
	Dim dlg As New DlgNewWFI
	dlg.Show vbModal, Me
	If Not dlg.bHaveAllInfo Then Exit Sub 'they cancelled

	Dim sFile As String
	With dlgCommonDialog
		.DialogTitle = "New WFI"
		.CancelError = False
		'ToDo: set the flags and attributes of the common dialog control
		.Filter = "WFI (*.xml)|*.xml"
		.ShowSave
		If Len(.FileName) = 0 Then
			Exit Sub
		End If
		sFile = .FileName
		If .CancelError Then Exit Sub
	End With
	mnuFileSave_Click

	Set m_proj = Nothing
	Set m_proj = New PBProject
	m_proj.Path = sFile
	m_proj.InitFromXMLNode dlg.SelectedLangXMLNode

	' set up the filters XML file in the CarlaStudio control file folder
	m_proj.FiltersPath = m_proj.DefaultFilterPath
	' to do: need to see if this file is already existing and give the user a choice.
	m_filters.Save m_proj.FiltersPath
	m_proj.Save

	LoadProject
End Sub

Private Sub mnuFileOpen_Click()
	Dim sFile As String


	With dlgCommonDialog
		.DialogTitle = "Open WFI"
		.CancelError = False
		'ToDo: set the flags and attributes of the common dialog control
		.Filter = "WFI (*.xml)|*.xml"
		.ShowOpen
		If Len(.FileName) = 0 Then
			Exit Sub
		End If
		If .CancelError Then Exit Sub
		sFile = .FileName
	End With
	 m_proj.Path = sFile
	LoadProject
End Sub


Private Sub mnuFileAddWords_Click()
   Dim sWordListFile As String

	If Not m_proj.Ready Then Exit Sub

	With dlgCommonDialog
		.DialogTitle = "Import Tab delimeted wordlist"
		.CancelError = False
		.FileName = ""
		'ToDo: set the flags and attributes of the common dialog control
		.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
		.ShowOpen
		If Len(.FileName) = 0 Then
			Exit Sub
		End If
		If .CancelError Then Exit Sub
		sWordListFile = .FileName
	End With

	Dim newWordsWFI As String
	newWordsWFI = m_proj.Path + ".new"
	Dim fs As New FileSystemObject
	Dim fInput As TextStream
	Set fInput = fs.OpenTextFile(sWordListFile)
	Dim fOutput As TextStream
	Set fOutput = fs.CreateTextFile(newWordsWFI)

	fOutput.WriteLine "<wfi>"
	Dim s As String
	Dim sFreq As String
	Dim sWord As String
	Dim n As Integer
	While Not fInput.AtEndOfStream
		sWord = ""
		sFreq = ""
		s = fInput.ReadLine
		n = Strings.InStr(1, s, vbTab)
		If n > 0 Then
			sFreq = Strings.Left(s, n - 1)
			sFreq = Strings.Trim(sFreq)
			s = Strings.Mid(s, n + 1)
			n = Strings.InStr(1, s, vbTab)
			If n > 0 Then
				sWord = Strings.Left(s, n - 1)
			Else
				sWord = s
			End If
			sWord = Strings.Trim(sWord)
			If sWord <> "" Then
				fOutput.WriteLine "<wfic id=""" + sWord + """ form=""" + sWord + """ freq=""" + sFreq + """></wfic>"
			End If
		End If
	Wend
	fOutput.WriteLine "</wfi>"
	fInput.Close
	fOutput.Close

	 ' now merged in these words

	updateWFI m_proj, newWordsWFI, sbStatusBar, True ' merge this run file with the main wfi
	setModified True
	sbStatusBar.SimpleText = ""
	sbStatusBar.Style = sbrNormal
	useFilter False 'refresh the display

End Sub


Private Sub m_parseListTable_AnalysisGoodnessChanged(sWordID As String, sParseID As String)
	'MsgBox " word " + sWordID + " NUM " + nAnalysisNumber + " good " + sGoodness

	setModified True
	Dim bRedraw As Boolean
	bRedraw = toggleGoodness(m_proj.WFIDOM, sWordID, sParseID)
	If bRedraw Then
		m_nScrollParseListTop = m_parseListTable.scrollTop
		WordSelectTimer.Enabled = True  ' cause it to be redrawn in a moment
	End If

End Sub

Private Sub LoadProject(Optional f As Filter = Nothing)



	Call m_proj.Load(sbStatusBar)
	If m_proj.Ready Then
		Set m_filters = New FilterCollection
		If Not m_filters.LoadFromXMLFile(m_proj.FiltersPath) Then
			MsgBox "Since there was a problem loading the filters file, the default filters will be used.  You will not be able to make changes to this file.  You have to options.  Either you can fix the filter file: " + m_proj.FiltersPath + ", or you can save this default set of filters somewhere else. Either way, use the Filters Options command.", vbExclamation
			m_proj.FiltersPath = App.Path + "\pb-xsl\samplefilters.xml"
			If Not m_filters.LoadFromXMLFile(m_proj.FiltersPath) Then
				MsgBox "Something may be with your installation, since the default filters file, " + m_proj.FiltersPath + ", could not be loaded.  Please reinstall ParseBench.  ", vbCritical
				Unload Me
			End If
		End If
		UpdateFilterList

		SetAllWordPositionAttrs m_proj.WFIDOM, sbStatusBar
		setModified False
		If f Is Nothing Then
			useDefaultFilter
		Else
			useFilter False, f
		End If
	End If


	sbStatusBar.SimpleText = ""
End Sub
