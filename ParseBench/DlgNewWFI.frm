VERSION 5.00
Begin VB.Form DlgNewWFI
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "New WordformInventory Setup"
   ClientHeight    =   5685
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   7575
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   NegotiateMenus  =   0   'False
   ScaleHeight     =   5685
   ScaleWidth      =   7575
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer CheckForCSTimer
	  Left            =   6360
	  Top             =   360
   End
   Begin VB.ComboBox comboLangs
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   12
		 Charset         =   0
		 Weight          =   400
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  Height          =   420
	  Left            =   3480
	  TabIndex        =   5
	  Text            =   "Combo1"
	  Top             =   2160
	  Width           =   3615
   End
   Begin VB.CommandButton CancelButton
	  Cancel          =   -1  'True
	  Caption         =   "&Cancel"
	  Height          =   375
	  Left            =   6120
	  TabIndex        =   1
	  Top             =   5040
	  Width           =   1215
   End
   Begin VB.CommandButton OKButton
	  Caption         =   "&OK"
	  Default         =   -1  'True
	  Height          =   375
	  Left            =   4680
	  TabIndex        =   0
	  Top             =   5040
	  Width           =   1215
   End
   Begin VB.Label Label5
	  Caption         =   $"DlgNewWFI.frx":0000
	  Height          =   855
	  Left            =   1080
	  TabIndex        =   7
	  Top             =   3480
	  Width           =   2775
   End
   Begin VB.Label Label4
	  Caption         =   "4) Import some words from a file of the form:"
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   13.5
		 Charset         =   0
		 Weight          =   400
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  Height          =   375
	  Left            =   360
	  TabIndex        =   6
	  Top             =   3120
	  Width           =   5655
   End
   Begin VB.Label Label3
	  Caption         =   "3) Choose Language:"
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   13.5
		 Charset         =   0
		 Weight          =   400
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  ForeColor       =   &H80000011&
	  Height          =   375
	  Left            =   240
	  TabIndex        =   4
	  Top             =   2160
	  Width           =   2895
   End
   Begin VB.Label Label2
	  Caption         =   "2) Make sure the project containing the language you want work with is open in CarlaStudio"
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   13.5
		 Charset         =   0
		 Weight          =   400
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  Height          =   1095
	  Left            =   240
	  TabIndex        =   3
	  Top             =   840
	  Width           =   5415
   End
   Begin VB.Label Label1
	  Caption         =   "1) Launch CarlaStudio"
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   13.5
		 Charset         =   0
		 Weight          =   400
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  Height          =   375
	  Left            =   240
	  TabIndex        =   2
	  Top             =   240
	  Width           =   5415
   End
End
Attribute VB_Name = "DlgNewWFI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Private m_bCSReady As Boolean
Public sAbrev As String
Public sID As String
Public m_sSelectedLangName As String
Public bHaveAllInfo As Boolean
Private DictAbrevs As New Dictionary
Private DictIDs As New Dictionary
Private DictLangXMLNodes As New Dictionary
Private gCS As Object
Private Sub CancelButton_Click()
	bHaveAllInfo = False
	Me.Hide
End Sub

Private Sub CheckForCSTimer_Timer()
'    On Error GoTo catcherror
	If gCS Is Nothing Then
	 Set gCS = CreateObject("CStudio.ParseCS")
	End If
	Dim x As New MSXML2.DOMDocument30

	Dim s As String
	s = gCS.LangInfoXML  ' just to get an error if gCS isn't loaded

	Set gCS = Nothing
	Set x = Nothing

	m_bCSReady = True
	CheckForCSTimer.Enabled = False
	loadCombo
	OKButton.Enabled = True
	Label3.ForeColor = vbBlack
	On Error GoTo 0
	Exit Sub
catcherror:

	On Error GoTo 0
	m_bCSReady = False
	Exit Sub
updateControls:

End Sub

Private Sub comboLangs_Click()
	m_sSelectedLangName = comboLangs
	sAbrev = DictAbrevs(m_sSelectedLangName)
	sID = DictIDs(m_sSelectedLangName)
End Sub

Private Sub Form_Load()
	bHaveAllInfo = False
	m_bCSReady = False
	comboLangs.Enabled = False
	OKButton.Enabled = False
	Label3.ForeColor = &H80000011 'disabled
	CheckForCSTimer.Enabled = True
	CheckForCSTimer.Interval = 100
End Sub
 Private Sub loadCombo()
	'Dim gCS As Object
	Set gCS = CreateObject("CStudio.ParseCS")
	Dim x As New MSXML2.DOMDocument30
	x.loadXML gCS.LangInfoXML
	Dim langs As MSXML2.IXMLDOMNodeList
	Set langs = x.selectNodes("CSLangs/lang")
	Dim l As IXMLDOMNode
	For Each l In langs
	   Dim sName As String
	   sName = getXMLNodeAttribute(l, "name")
		Dim sID As String
		sID = getXMLNodeAttribute(l, "id")
		comboLangs.AddItem sName
		DictIDs.Add sName, sID
		DictAbrevs.Add sName, getXMLNodeAttribute(l, "abrev")
		DictLangXMLNodes.Add sName, l ' this way we can get at any of the information later
	Next l
	comboLangs.ListIndex = 0
	comboLangs.Enabled = True
	bHaveAllInfo = True
 End Sub

Private Sub Form_Unload(Cancel As Integer)
	Set gCS = Nothing ' release handle to carlastudio
End Sub

Private Sub OKButton_Click()
 Me.Hide
End Sub

Public Property Get SelectedLangXMLNode()
	Set SelectedLangXMLNode = DictLangXMLNodes(m_sSelectedLangName)
End Property
