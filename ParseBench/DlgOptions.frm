VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "tabctl32.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form DlgAllOptions
   Caption         =   "Options"
   ClientHeight    =   4500
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7335
   LinkTopic       =   "Form1"
   ScaleHeight     =   4500
   ScaleWidth      =   7335
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdCancel
	  Caption         =   "&Cancel"
	  Height          =   375
	  Left            =   6240
	  TabIndex        =   6
	  Top             =   4080
	  Width           =   975
   End
   Begin VB.CommandButton cmdOK
	  Caption         =   "&OK"
	  Height          =   375
	  Left            =   5160
	  TabIndex        =   5
	  Top             =   4080
	  Width           =   975
   End
   Begin TabDlg.SSTab tabOptions
	  Height          =   3855
	  Left            =   240
	  TabIndex        =   0
	  Top             =   120
	  Width           =   6975
	  _ExtentX        =   12303
	  _ExtentY        =   6800
	  _Version        =   393216
	  Tabs            =   4
	  Tab             =   2
	  TabHeight       =   520
	  TabCaption(0)   =   "Statistics Options"
	  TabPicture(0)   =   "DlgOptions.frx":0000
	  Tab(0).ControlEnabled=   0   'False
	  Tab(0).Control(0)=   "chkShowZeroes"
	  Tab(0).Control(1)=   "udPastHistories"
	  Tab(0).Control(2)=   "txtPastHistories"
	  Tab(0).Control(3)=   "Label1"
	  Tab(0).ControlCount=   4
	  TabCaption(1)   =   "Filter Options"
	  TabPicture(1)   =   "DlgOptions.frx":001C
	  Tab(1).ControlEnabled=   0   'False
	  Tab(1).Control(0)=   "sFilterFilePath"
	  Tab(1).Control(1)=   "btnSaveAs"
	  Tab(1).Control(2)=   "btnUseFilters"
	  Tab(1).Control(3)=   "dlgCommonDialog"
	  Tab(1).Control(4)=   "Label2"
	  Tab(1).ControlCount=   5
	  TabCaption(2)   =   "SenTrans Options"
	  TabPicture(2)   =   "DlgOptions.frx":0038
	  Tab(2).ControlEnabled=   -1  'True
	  Tab(2).Control(0)=   "Label3"
	  Tab(2).Control(0).Enabled=   0   'False
	  Tab(2).Control(1)=   "btnBrowse"
	  Tab(2).Control(1).Enabled=   0   'False
	  Tab(2).Control(2)=   "sRulesPath"
	  Tab(2).Control(2).Enabled=   0   'False
	  Tab(2).Control(3)=   "bOutputSentransRules"
	  Tab(2).Control(3).Enabled=   0   'False
	  Tab(2).ControlCount=   4
	  TabCaption(3)   =   "Display Options"
	  TabPicture(3)   =   "DlgOptions.frx":0054
	  Tab(3).ControlEnabled=   0   'False
	  Tab(3).Control(0)=   "comboWordsPerPage"
	  Tab(3).Control(1)=   "Label4"
	  Tab(3).ControlCount=   2
	  Begin VB.ComboBox comboWordsPerPage
		 Height          =   315
		 ItemData        =   "DlgOptions.frx":0070
		 Left            =   -72720
		 List            =   "DlgOptions.frx":0089
		 TabIndex        =   15
		 Text            =   "Combo1"
		 Top             =   1080
		 Width           =   2655
	  End
	  Begin VB.CheckBox bOutputSentransRules
		 Caption         =   "Output &Sentrans disambiguation rules"
		 Height          =   375
		 Left            =   480
		 TabIndex        =   13
		 Top             =   1080
		 Width           =   3255
	  End
	  Begin VB.TextBox sRulesPath
		 BackColor       =   &H8000000B&
		 Height          =   375
		 Left            =   1560
		 TabIndex        =   12
		 Top             =   2040
		 Width           =   3855
	  End
	  Begin VB.CommandButton btnBrowse
		 Caption         =   "&Browse..."
		 Height          =   375
		 Left            =   5520
		 TabIndex        =   11
		 Top             =   2040
		 Width           =   1215
	  End
	  Begin VB.TextBox sFilterFilePath
		 BackColor       =   &H8000000F&
		 Enabled         =   0   'False
		 Height          =   375
		 Left            =   -73200
		 TabIndex        =   9
		 Top             =   1680
		 Width           =   4575
	  End
	  Begin VB.CommandButton btnSaveAs
		 Caption         =   "&Save Filters As..."
		 Height          =   375
		 Left            =   -74520
		 TabIndex        =   8
		 Top             =   1140
		 Width           =   1335
	  End
	  Begin VB.CommandButton btnUseFilters
		 Caption         =   "&Use Filters..."
		 Height          =   375
		 Left            =   -73080
		 TabIndex        =   7
		 Top             =   1140
		 Width           =   1455
	  End
	  Begin VB.CheckBox chkShowZeroes
		 Caption         =   "Show rows wtih values of zero in Statistics charts"
		 Height          =   255
		 Left            =   -74760
		 TabIndex        =   4
		 Top             =   1260
		 Value           =   1  'Checked
		 Width           =   3975
	  End
	  Begin MSComCtl2.UpDown udPastHistories
		 Height          =   285
		 Left            =   -71099
		 TabIndex        =   3
		 Top             =   900
		 Width           =   195
		 _ExtentX        =   423
		 _ExtentY        =   503
		 _Version        =   393216
		 AutoBuddy       =   -1  'True
		 BuddyControl    =   "txtPastHistories"
		 BuddyDispid     =   196620
		 OrigLeft        =   4200
		 OrigTop         =   600
		 OrigRight       =   4395
		 OrigBottom      =   855
		 Max             =   30
		 SyncBuddy       =   -1  'True
		 BuddyProperty   =   65547
		 Enabled         =   -1  'True
	  End
	  Begin VB.TextBox txtPastHistories
		 Enabled         =   0   'False
		 Height          =   285
		 Left            =   -72360
		 TabIndex        =   2
		 Text            =   "5"
		 Top             =   900
		 Visible         =   0   'False
		 Width           =   1260
	  End
	  Begin MSComDlg.CommonDialog dlgCommonDialog
		 Left            =   -74640
		 Top             =   2940
		 _ExtentX        =   847
		 _ExtentY        =   847
		 _Version        =   393216
	  End
	  Begin VB.Label Label4
		 Caption         =   "Words Per Page:"
		 Height          =   375
		 Left            =   -74280
		 TabIndex        =   16
		 Top             =   1080
		 Width           =   1335
	  End
	  Begin VB.Label Label3
		 Caption         =   "Save rules in:"
		 Height          =   255
		 Left            =   480
		 TabIndex        =   14
		 Top             =   2040
		 Width           =   1095
	  End
	  Begin VB.Label Label2
		 Caption         =   "Current Filter File:"
		 Height          =   255
		 Left            =   -74520
		 TabIndex        =   10
		 Top             =   1740
		 Width           =   1335
	  End
	  Begin VB.Label Label1
		 Caption         =   "Number of Past Histories to show:"
		 Enabled         =   0   'False
		 Height          =   255
		 Left            =   -74760
		 TabIndex        =   1
		 Top             =   900
		 Visible         =   0   'False
		 Width           =   2535
	  End
   End
End
Attribute VB_Name = "DlgAllOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public m_bOK As Boolean
Public m_project As PBProject
Public m_nWordsPerPage As Integer
' upon returning, if this has a Path then the caller should save the current filters file to this Path
Public sSaveAsFiltersPath As String
' upon returning, if this path is not empty and the caller should load his filters file.
Public sUseFiltersPath As String



Private Sub UpdateEnabledFlags()
	sRulesPath.Enabled = bOutputSentransRules
	If bOutputSentransRules Then
		sRulesPath.BackColor = &H80000005
	Else
		  sRulesPath.BackColor = &H8000000B
	End If
End Sub

Private Sub bOutputSentransRules_Click()
		UpdateEnabledFlags
End Sub

Private Sub btnBrowse_Click()
	MsgBox "Sorry, for now you must enter the path yourself.  "
End Sub

Private Sub btnSaveAs_Click()
	With dlgCommonDialog
		.DialogTitle = "Save Filters File As..."
		.CancelError = False
		.FileName = sFilterFilePath
		.Filter = "PB Filters (*.xml)|*.xml"
		.ShowSave
		If Len(.FileName) = 0 Then
			Exit Sub
		End If
		If .CancelError Then Exit Sub
		sFilterFilePath = .FileName
		sSaveAsFiltersPath = .FileName
	End With
End Sub

Private Sub btnUseFilters_Click()
	With dlgCommonDialog
		.DialogTitle = "Open Filters File..."
		.CancelError = False
		.FileName = ""
		.Filter = "PB Filters (*.xml)|*.xml"
		.ShowOpen
		If Len(.FileName) = 0 Then
			Exit Sub
		End If
		If .CancelError Then Exit Sub
		sFilterFilePath = .FileName
		sUseFiltersPath = .FileName
	End With
End Sub



Private Sub cmdApply_Click()
	Dim FileNum As Integer

	FileNum = FreeFile
	Open App.Path + "options.opt" For Output As FileNum

	Print #FileNum, txtPastHistories.Text
	Print #FileNum, chkShowZeroes.Value

	Close #FileNum
	m_nWordsPerPage = comboWordsPerPage.Text
	If m_nWordsPerPage = 0 Then
		m_nWordsPerPage = 200
	End If

	m_bOK = True
End Sub

Private Sub cmdCancel_Click()

	m_bOK = False
	Me.Hide

End Sub

Private Sub cmdOK_Click()
	Dim FileNum As Integer

	FileNum = FreeFile
	Open App.Path + "options.opt" For Output As FileNum

	Print #FileNum, txtPastHistories.Text
	Print #FileNum, chkShowZeroes.Value

	Close #FileNum

	m_nWordsPerPage = comboWordsPerPage.Text
	If m_nWordsPerPage = 0 Then
		m_nWordsPerPage = 200
	End If

	m_bOK = True
	Me.Hide

End Sub

Private Sub Form_Load()
	Dim FileNum As Integer
	Dim strPastHistories As String
	Dim intShowZeroes As Integer

	sFilterFilePath = m_project.FiltersPath
	m_bOK = False

	If m_nWordsPerPage = 0 Then
		m_nWordsPerPage = 200
	End If
	comboWordsPerPage.Text = Str(m_nWordsPerPage)

	FileNum = FreeFile
	If (Dir(App.Path + "options.opt") = "") Then

		Open App.Path + "options.opt" For Output As FileNum

		Print #FileNum, "5"
		Print #FileNum, "1"

		Close #FileNum
	 Else
		Open App.Path + "options.opt" For Input As FileNum
		Input #FileNum, strPastHistories
		Input #FileNum, intShowZeroes
		txtPastHistories.Text = strPastHistories
		chkShowZeroes.Value = intShowZeroes
		Close #FileNum

	End If



	UpdateEnabledFlags
End Sub

Private Sub txtPastHistories_Change()
	If Val(txtPastHistories.Text) < 0 Then
		txtPastHistories.Text = 0
	End If
	If Val(txtPastHistories.Text) > 30 Then
		txtPastHistories.Text = 30
	End If


End Sub
