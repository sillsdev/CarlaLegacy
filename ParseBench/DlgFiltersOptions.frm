VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form DlgFiltersOptions
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Filter Options..."
   ClientHeight    =   1530
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   7680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1530
   ScaleWidth      =   7680
   ShowInTaskbar   =   0   'False
   Begin MSComDlg.CommonDialog dlgCommonDialog
	  Left            =   3480
	  Top             =   120
	  _ExtentX        =   847
	  _ExtentY        =   847
	  _Version        =   393216
   End
   Begin VB.CommandButton btnUseFilters
	  Caption         =   "&Use Filters..."
	  Height          =   375
	  Left            =   1560
	  TabIndex        =   1
	  Top             =   240
	  Width           =   1455
   End
   Begin VB.CommandButton btnSaveAs
	  Caption         =   "&Save Filters As..."
	  Height          =   375
	  Left            =   120
	  TabIndex        =   0
	  Top             =   240
	  Width           =   1335
   End
   Begin VB.TextBox sFilterFilePath
	  BackColor       =   &H8000000F&
	  Enabled         =   0   'False
	  Height          =   375
	  Left            =   1440
	  TabIndex        =   4
	  Text            =   "Text1"
	  Top             =   780
	  Width           =   4575
   End
   Begin VB.CommandButton cmdCancel
	  Cancel          =   -1  'True
	  Caption         =   "&Cancel"
	  Height          =   375
	  Left            =   6240
	  TabIndex        =   3
	  Top             =   720
	  Width           =   1215
   End
   Begin VB.CommandButton cmdOK
	  Caption         =   "&OK"
	  Default         =   -1  'True
	  Height          =   375
	  Left            =   6240
	  TabIndex        =   2
	  Top             =   240
	  Width           =   1215
   End
   Begin VB.Label Label1
	  Caption         =   "Current Filter File:"
	  Height          =   255
	  Left            =   120
	  TabIndex        =   5
	  Top             =   840
	  Width           =   1335
   End
End
Attribute VB_Name = "DlgFiltersOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public m_bOK As Boolean
Public m_project As PBProject
' upon returning, if this has a Path then the caller should save the current filters file to this Path
Public sSaveAsFiltersPath As String
' upon returning, if this path is not empty and the caller should load his filters file.
Public sUseFiltersPath As String



Private Sub btnDefaultFilterPath_Click()
	sFilterFilePath = m_project.DefaultFilterPath ' App.Path + "\pb-xsl\samplefilters.xml"
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

Private Sub Form_Load()
	sFilterFilePath = m_project.FiltersPath
	m_bOK = False
End Sub


Private Sub cmdCancel_Click()
	m_bOK = False
	Me.Hide
End Sub


Private Sub cmdOK_Click()
	 m_bOK = True
	Me.Hide
End Sub
