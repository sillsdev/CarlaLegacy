VERSION 5.00
Begin VB.Form DlgSentrans
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Sentrans Rules Options..."
   ClientHeight    =   2100
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6765
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2100
   ScaleWidth      =   6765
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnBrowse
	  Caption         =   "&Browse..."
	  Height          =   375
	  Left            =   5280
	  TabIndex        =   2
	  Top             =   720
	  Width           =   1215
   End
   Begin VB.TextBox sRulesPath
	  BackColor       =   &H8000000B&
	  Height          =   375
	  Left            =   1320
	  TabIndex        =   1
	  Text            =   "Text1"
	  Top             =   720
	  Width           =   3855
   End
   Begin VB.CheckBox bOutputSentransRules
	  Caption         =   "Output &Sentrans disambiguation rules"
	  Height          =   375
	  Left            =   240
	  TabIndex        =   0
	  Top             =   120
	  Width           =   3255
   End
   Begin VB.CommandButton cmdCancel
	  Cancel          =   -1  'True
	  Caption         =   "&Cancel"
	  Height          =   375
	  Left            =   5280
	  TabIndex        =   4
	  Top             =   1560
	  Width           =   1215
   End
   Begin VB.CommandButton cmdOK
	  Caption         =   "&OK"
	  Default         =   -1  'True
	  Height          =   375
	  Left            =   3840
	  TabIndex        =   3
	  Top             =   1560
	  Width           =   1215
   End
   Begin VB.Label Label1
	  Caption         =   "Save rules in:"
	  Height          =   255
	  Left            =   240
	  TabIndex        =   5
	  Top             =   720
	  Width           =   1095
   End
End
Attribute VB_Name = "DlgSentrans"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public m_bOK As Boolean

Private Sub bOutputSentransRules_Click()
	UpdateEnabledFlags
End Sub

Private Sub btnBrowse_Click()
	MsgBox "Sorry, for now you must enter the path yourself.  "
End Sub
Private Sub UpdateEnabledFlags()
	sRulesPath.Enabled = bOutputSentransRules
	If bOutputSentransRules Then
		sRulesPath.BackColor = &H80000005
	Else
		  sRulesPath.BackColor = &H8000000B
	End If
End Sub

Private Sub Form_Load()
	m_bOK = False
	UpdateEnabledFlags
End Sub


Private Sub cmdCancel_Click()
	m_bOK = False
	Unload Me
End Sub


Private Sub cmdOK_Click()
	 m_bOK = True
	Unload Me
End Sub
