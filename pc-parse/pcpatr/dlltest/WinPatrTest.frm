VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form Form1
   Caption         =   "IPatrParser Tester"
   ClientHeight    =   10980
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   13575
   LinkTopic       =   "Form1"
   ScaleHeight     =   10980
   ScaleWidth      =   13575
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox CodePage
	  Height          =   285
	  Left            =   11640
	  TabIndex        =   48
	  Top             =   3360
	  Width           =   735
   End
   Begin VB.TextBox MaxAmbiguity
	  Height          =   285
	  Left            =   11640
	  TabIndex        =   46
	  Top             =   3000
	  Width           =   735
   End
   Begin MSComDlg.CommonDialog ParDlg
	  Left            =   17640
	  Top             =   3360
	  _ExtentX        =   847
	  _ExtentY        =   847
	  _Version        =   393216
   End
   Begin MSComDlg.CommonDialog SenDlg
	  Left            =   17640
	  Top             =   2640
	  _ExtentX        =   847
	  _ExtentY        =   847
	  _Version        =   393216
   End
   Begin MSComDlg.CommonDialog LexDlg
	  Left            =   17640
	  Top             =   1200
	  _ExtentX        =   847
	  _ExtentY        =   847
	  _Version        =   393216
   End
   Begin MSComDlg.CommonDialog GrmDlg
	  Left            =   17640
	  Top             =   480
	  _ExtentX        =   847
	  _ExtentY        =   847
	  _Version        =   393216
   End
   Begin VB.CheckBox EnableGlosses
	  Caption         =   "Enable Display of Glosses"
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
	  Left            =   10320
	  TabIndex        =   45
	  Top             =   1440
	  Width           =   3135
   End
   Begin VB.TextBox DebugLevel
	  Height          =   285
	  Left            =   11640
	  TabIndex        =   44
	  Top             =   2640
	  Width           =   735
   End
   Begin VB.TextBox TimeLimit
	  Height          =   285
	  Left            =   11640
	  TabIndex        =   42
	  Top             =   2280
	  Width           =   735
   End
   Begin VB.TextBox CommentChar
	  Height          =   285
	  Left            =   11640
	  MaxLength       =   1
	  TabIndex        =   40
	  Top             =   1920
	  Width           =   255
   End
   Begin VB.Frame Frame2
	  Height          =   1575
	  Left            =   2520
	  TabIndex        =   33
	  Top             =   0
	  Width           =   1575
	  Begin VB.OptionButton ParseTreeXML
		 Caption         =   "XML"
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
		 TabIndex        =   38
		 Top             =   1200
		 Width           =   855
	  End
	  Begin VB.OptionButton ParseTreeIndented
		 Caption         =   "Indented"
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
		 TabIndex        =   37
		 Top             =   960
		 Width           =   1335
	  End
	  Begin VB.OptionButton ParseTreeFlat
		 Caption         =   "Flat"
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
		 TabIndex        =   36
		 Top             =   720
		 Width           =   735
	  End
	  Begin VB.OptionButton ParseTreeFull
		 Caption         =   "Full"
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
		 TabIndex        =   35
		 Top             =   480
		 Width           =   735
	  End
	  Begin VB.OptionButton ParseDisplayOff
		 Caption         =   "Off"
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
		 TabIndex        =   34
		 Top             =   240
		 Width           =   735
	  End
   End
   Begin VB.CheckBox TopDownFilter
	  Caption         =   "Enable Top Down Filtering"
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
	  Left            =   10320
	  TabIndex        =   31
	  Top             =   1080
	  Width           =   3135
   End
   Begin VB.CheckBox EnableUnification
	  Caption         =   "Enable Unification"
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
	  Left            =   10320
	  TabIndex        =   30
	  Top             =   720
	  Width           =   3135
   End
   Begin VB.CheckBox PartialResults
	  Caption         =   "Partial Results for Failures"
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
	  Left            =   10320
	  TabIndex        =   29
	  Top             =   0
	  Width           =   3135
   End
   Begin VB.CheckBox CheckCycles
	  Caption         =   "Check Features for Cycles"
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
	  Left            =   10320
	  TabIndex        =   28
	  Top             =   360
	  Width           =   3135
   End
   Begin VB.CheckBox TrimEmptyFeatures
	  Caption         =   "Trim Empty Features"
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   9.75
		 Charset         =   0
		 Weight          =   700
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  Height          =   375
	  Left            =   7440
	  TabIndex        =   27
	  Top             =   840
	  Width           =   2535
   End
   Begin VB.CheckBox FlatFeatures
	  Caption         =   "Flat Feature Format"
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   9.75
		 Charset         =   0
		 Weight          =   700
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  Height          =   375
	  Left            =   7440
	  TabIndex        =   26
	  Top             =   480
	  Width           =   2535
   End
   Begin VB.CheckBox TopFeatureOnly
	  Caption         =   "Top Feature Only"
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   9.75
		 Charset         =   0
		 Weight          =   700
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  Height          =   375
	  Left            =   7440
	  TabIndex        =   25
	  Top             =   120
	  Width           =   2535
   End
   Begin VB.Frame Frame1
	  Height          =   1335
	  Left            =   6360
	  TabIndex        =   22
	  Top             =   0
	  Width           =   3735
	  Begin VB.OptionButton FeaturesOn
		 Caption         =   "On"
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
		 TabIndex        =   24
		 Top             =   240
		 Width           =   735
	  End
	  Begin VB.OptionButton FeaturesOff
		 Caption         =   "Off"
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
		 TabIndex        =   23
		 Top             =   600
		 Width           =   735
	  End
   End
   Begin VB.TextBox FeatureMarker
	  Height          =   285
	  Left            =   8400
	  TabIndex        =   20
	  Top             =   2520
	  Width           =   735
   End
   Begin VB.TextBox CategoryMarker
	  Height          =   285
	  Left            =   6480
	  TabIndex        =   18
	  Top             =   2520
	  Width           =   735
   End
   Begin VB.TextBox GlossMarker
	  Height          =   285
	  Left            =   4440
	  TabIndex        =   16
	  Top             =   2520
	  Width           =   735
   End
   Begin VB.TextBox WordMarker
	  Height          =   285
	  Left            =   2760
	  TabIndex        =   15
	  Top             =   2520
	  Width           =   735
   End
   Begin VB.TextBox RecordMarker
	  Height          =   285
	  Left            =   1080
	  TabIndex        =   14
	  Top             =   2520
	  Width           =   735
   End
   Begin VB.TextBox LogFile
	  Enabled         =   0   'False
	  Height          =   285
	  Left            =   1680
	  TabIndex        =   11
	  Top             =   3000
	  Width           =   7455
   End
   Begin VB.TextBox LexiconFile
	  Enabled         =   0   'False
	  Height          =   285
	  Left            =   1680
	  TabIndex        =   9
	  Top             =   2160
	  Width           =   7455
   End
   Begin VB.TextBox GrammarFile
	  Enabled         =   0   'False
	  Height          =   285
	  Left            =   1680
	  TabIndex        =   7
	  Top             =   1680
	  Width           =   7455
   End
   Begin VB.CommandButton ParseButton
	  Caption         =   "Parse"
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   13.5
		 Charset         =   0
		 Weight          =   400
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  Height          =   675
	  Left            =   12120
	  TabIndex        =   4
	  Top             =   3840
	  Width           =   1335
   End
   Begin RichTextLib.RichTextBox SentenceParse
	  Height          =   6015
	  Left            =   120
	  TabIndex        =   3
	  Top             =   4800
	  Width           =   13335
	  _ExtentX        =   23521
	  _ExtentY        =   10610
	  _Version        =   393217
	  ReadOnly        =   -1  'True
	  ScrollBars      =   2
	  TextRTF         =   $"WinPatrTest.frx":0000
	  BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851}
		 Name            =   "Fixedsys"
		 Size            =   9
		 Charset         =   0
		 Weight          =   400
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
   End
   Begin VB.TextBox Sentence
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   12
		 Charset         =   0
		 Weight          =   400
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  Height          =   525
	  Left            =   120
	  TabIndex        =   0
	  Top             =   3840
	  Width           =   11775
   End
   Begin MSComDlg.CommonDialog LogDlg
	  Left            =   17640
	  Top             =   1920
	  _ExtentX        =   847
	  _ExtentY        =   847
	  _Version        =   393216
   End
   Begin VB.Label Label19
	  Alignment       =   1  'Right Justify
	  Caption         =   "Code Page"
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
	  Left            =   9480
	  TabIndex        =   49
	  Top             =   3360
	  Width           =   2055
   End
   Begin VB.Label Label18
	  Alignment       =   1  'Right Justify
	  Caption         =   "Maximum Ambiguity"
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
	  Left            =   9480
	  TabIndex        =   47
	  Top             =   3000
	  Width           =   2055
   End
   Begin VB.Label Label17
	  Alignment       =   1  'Right Justify
	  Caption         =   "Debugging Level"
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
	  Left            =   9480
	  TabIndex        =   43
	  Top             =   2640
	  Width           =   2055
   End
   Begin VB.Label Label16
	  Alignment       =   1  'Right Justify
	  Caption         =   "Parse Time Limit"
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
	  Left            =   9480
	  TabIndex        =   41
	  Top             =   2280
	  Width           =   2055
   End
   Begin VB.Label Label14
	  Alignment       =   1  'Right Justify
	  Caption         =   "Comment Character"
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
	  Left            =   9480
	  TabIndex        =   39
	  Top             =   1920
	  Width           =   2055
   End
   Begin VB.Label Label12
	  Caption         =   "Parse Tree Display"
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   12
		 Charset         =   0
		 Weight          =   700
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  Height          =   375
	  Left            =   120
	  TabIndex        =   32
	  Top             =   120
	  Width           =   2295
   End
   Begin VB.Label Label11
	  Caption         =   "Feature Display"
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   12
		 Charset         =   0
		 Weight          =   700
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  Height          =   375
	  Left            =   4320
	  TabIndex        =   21
	  Top             =   120
	  Width           =   1935
   End
   Begin VB.Label Label10
	  Caption         =   "Feature"
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
	  Left            =   7440
	  TabIndex        =   19
	  Top             =   2520
	  Width           =   855
   End
   Begin VB.Label Label9
	  Caption         =   "Category"
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
	  Left            =   5400
	  TabIndex        =   17
	  Top             =   2520
	  Width           =   975
   End
   Begin VB.Label Label8
	  Caption         =   "Gloss"
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
	  Left            =   3720
	  TabIndex        =   13
	  Top             =   2520
	  Width           =   615
   End
   Begin VB.Label Label7
	  Caption         =   "Word"
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
	  Left            =   2040
	  TabIndex        =   12
	  Top             =   2520
	  Width           =   615
   End
   Begin VB.Label Label6
	  Caption         =   "Log File"
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
	  Top             =   3000
	  Width           =   1575
   End
   Begin VB.Label Label5
	  Caption         =   "Lexicon File"
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
	  TabIndex        =   8
	  Top             =   2160
	  Width           =   1575
   End
   Begin VB.Label Label4
	  Caption         =   "Grammar File"
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
	  TabIndex        =   6
	  Top             =   1680
	  Width           =   1575
   End
   Begin VB.Label Label2
	  Caption         =   "Record"
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
	  TabIndex        =   5
	  Top             =   2520
	  Width           =   855
   End
   Begin VB.Label Label3
	  Caption         =   "Parse Output"
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   12
		 Charset         =   0
		 Weight          =   700
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  Height          =   375
	  Left            =   240
	  TabIndex        =   2
	  Top             =   4440
	  Width           =   1815
   End
   Begin VB.Label Label1
	  Caption         =   "Sentence"
	  BeginProperty Font
		 Name            =   "MS Sans Serif"
		 Size            =   12
		 Charset         =   0
		 Weight          =   700
		 Underline       =   0   'False
		 Italic          =   0   'False
		 Strikethrough   =   0   'False
	  EndProperty
	  Height          =   375
	  Left            =   240
	  TabIndex        =   1
	  Top             =   3480
	  Width           =   1335
   End
   Begin VB.Menu FileMenu
	  Caption         =   "&File"
	  Begin VB.Menu LoadGrammarCmd
		 Caption         =   "Load &Grammar..."
	  End
	  Begin VB.Menu LoadLexiconCmd
		 Caption         =   "Load &Lexicon..."
	  End
	  Begin VB.Menu ParseFileCmd
		 Caption         =   "&Parse File..."
	  End
	  Begin VB.Menu OpenLogCmd
		 Caption         =   "&Open Log"
	  End
	  Begin VB.Menu CloseLogCmd
		 Caption         =   "&Close Log"
	  End
	  Begin VB.Menu sep1
		 Caption         =   "-"
	  End
	  Begin VB.Menu ClearCmd
		 Caption         =   "Clear"
	  End
	  Begin VB.Menu ExitCmd
		 Caption         =   "E&xit"
		 Shortcut        =   ^X
	  End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim m_patr As PatrParser

Private Sub FeaturesOn_Click()
	If FeaturesOn.Value Then
		Call EnableFeatureSettings
	Else
		Call DisableFeatureSettings
	End If
End Sub

Private Sub FeaturesOff_Click()
	If FeaturesOff.Value Then
		Call DisableFeatureSettings
	Else
		Call EnableFeatureSettings
	End If
End Sub

Private Sub Form_Load()
	On Error GoTo Failed
	If m_patr Is Nothing Then
		Set m_patr = New PatrParser
	End If
	Call resetdialogbox
	GrmDlg.Filter = "PC-PATR Grammar Files|*.grm"
	GrmDlg.CancelError = True
	LexDlg.Filter = "PC-PATR Lexicon Files|*.lex"
	LexDlg.CancelError = True
	LogDlg.Filter = "PC-PATR Log Files|*.log"
	LogDlg.CancelError = True
	SenDlg.Filter = "Sentence files|*.sen"
	SenDlg.CancelError = True
	ParDlg.Filter = "Parse output files|*.par"
	ParDlg.CancelError = True
	Exit Sub

Failed:
	MsgBox "Unexpected error while initializing"
	Exit Sub
End Sub

Private Sub Label4_Click()
	Call LoadGrammarCmd_Click
End Sub

Private Sub Label5_Click()
	Call LoadLexiconCmd_Click
End Sub

Private Sub Label6_Click()
	Call OpenLogCmd_Click
End Sub

Private Sub LoadGrammarCmd_Click()
	If Not DoSettings Then
		Exit Sub
	End If
	On Error GoTo Cancelled
	GrmDlg.ShowOpen

	On Error GoTo Failed
	m_patr.LoadGrammarFile GrmDlg.FileName
	GrammarFile.Text = GrmDlg.FileName
	Exit Sub

Failed:
	MsgBox "Loading " & GrmDlg.FileName & " Failed"
	Exit Sub

Cancelled:
	Exit Sub
End Sub

Private Sub LoadLexiconCmd_Click()
	If Not SetLexMarkers Then
		Exit Sub
	End If
	If Not DoSettings Then
		Exit Sub
	End If
	On Error GoTo Cancelled
	LexDlg.ShowOpen

	On Error GoTo Failed
	m_patr.LoadLexiconFile LexDlg.FileName, False
	LexiconFile.Text = LexDlg.FileName
	Exit Sub

Failed:
	MsgBox "Loading " & LexDlg.FileName & " Failed"
	Exit Sub

Cancelled:
	Exit Sub
End Sub

Private Sub ClearCmd_Click()
	On Error GoTo Failed
	m_patr.Clear
	Call resetdialogbox
	Exit Sub

Failed:
	MsgBox "Clear Failed"
	Exit Sub
End Sub

Private Sub OpenLogCmd_Click()
	On Error GoTo Cancelled
	LogDlg.ShowOpen

	On Error GoTo Failed
	m_patr.OpenLog LogDlg.FileName
	LogFile.Text = LogDlg.FileName
	Exit Sub

Failed:
	MsgBox "Opening Log File " & LogDlg.FileName & " Failed"
	Exit Sub

Cancelled:
	Exit Sub
End Sub

Private Sub CloseLogCmd_Click()
	On Error GoTo Failed
	m_patr.CloseLog
	LogFile.Text = ""
	Exit Sub

Failed:
	MsgBox "Closing Log File Failed"
	Exit Sub
End Sub

Private Sub ParseButton_Click()
	If Not IsReadyToParse Then
		Exit Sub
	End If
	If Not DoSettings Then
		Exit Sub
	End If
	If Sentence.Text = "" Then
		MsgBox "Must enter sentence before parsing it!"
		Exit Sub
	End If

	On Error GoTo Failed
	SentenceParse.Text = m_patr.ParseString(Sentence.Text)
	Exit Sub

Failed:
	MsgBox "Parsing sentence failed"
	Exit Sub
End Sub

Private Sub ParseFileCmd_Click()
	If Not IsReadyToParse Then
		Exit Sub
	End If
	If Not DoSettings Then
		Exit Sub
	End If

	On Error GoTo Cancelled
	SenDlg.ShowOpen
	ParDlg.ShowOpen

	On Error GoTo Failed
	m_patr.ParseFile SenDlg.FileName, ParDlg.FileName
	MsgBox "Done parsing " & SenDlg.FileName
	Exit Sub

Failed:
	MsgBox "Parsing " & SenDlg.FileName & " into " & ParDlg.FileName & " Failed"
	Exit Sub

Cancelled:
	Exit Sub
End Sub

Private Sub ExitCmd_Click()
	Unload Form1
	End
End Sub

Private Sub resetdialogbox()
	Dim f As Boolean
	GrammarFile.Text = m_patr.GrammarFile
	LexiconFile.Text = m_patr.LexiconFile(0)
	RecordMarker.Text = m_patr.LexRecordMarker
	WordMarker.Text = m_patr.LexWordMarker
	GlossMarker.Text = m_patr.LexGlossMarker
	CategoryMarker.Text = m_patr.LexCategoryMarker
	FeatureMarker.Text = m_patr.LexFeaturesMarker
	LogFile.Text = m_patr.LogFile
	Sentence.Text = ""
	SentenceParse.Text = ""

	Select Case m_patr.TreeDisplay
		Case 0
			ParseDisplayOff.Value = True
		Case 1
			ParseTreeFlat.Value = True
		Case 2
			ParseTreeFull.Value = True
		Case 3
			ParseTreeIndented.Value = True
		Case 4
			ParseTreeXML.Value = True
		Case Else
			' actually an error, but ...
			ParseTreeFull.Value = True
			m_patr.TreeDisplay = 2
	End Select

	FlatFeatures.Value = m_patr.FlatFeatureDisplay
	f = m_patr.TopFeatureOnly
	If f Then
		TopFeatureOnly.Value = 1
	Else
		TopFeatureOnly.Value = 0
	End If
	f = m_patr.TrimEmptyFeatures
	If f Then
		TrimEmptyFeatures.Value = 1
	Else
		TrimEmptyFeatures.Value = 0
	End If
	If m_patr.DisplayFeatures Then
		FeaturesOn.Value = True
		EnableFeatureSettings
	Else
		FeaturesOff.Value = True
		DisableFeatureSettings
	End If
	PartialResults.Value = m_patr.Failures
	CheckCycles.Value = m_patr.CheckCycles
	EnableUnification.Value = m_patr.Unification
	TopDownFilter.Value = m_patr.TopDownFilter
	EnableGlosses.Value = m_patr.Gloss

	CommentChar.Text = Chr(m_patr.CommentChar)
	Dim limit As Integer
	limit = m_patr.TimeLimit
	If limit = 0 Then
		TimeLimit.Text = "(no limit)"
	Else
		TimeLimit.Text = limit
	End If
	DebugLevel.Text = m_patr.DebuggingLevel
	MaxAmbiguity.Text = m_patr.MaxAmbiguity
	Select Case m_patr.CodePage
		Case 0
			CodePage.Text = "ANSI"
		Case 1
			CodePage.Text = "OEM"
		Case 2
			CodePage.Text = "MAC"
		Case 42
			CodePage.Text = "SYMBOL"
		Case 65000
			CodePage.Text = "UTF7"
		Case 65001
			CodePage.Text = "UTF8"
		Case Else
			CodePage.Text = m_patr.CodePage
	End Select
	Exit Sub
End Sub

Private Function SetLexMarkers() As Boolean
	On Error GoTo Failed
	SetLexMarkers = False
	If (RecordMarker.Text = "") Or (RecordMarker.Text = "\") Then
		MsgBox "The Record marker must be set before loading the lexicon"
		Exit Function
	End If
	If (WordMarker.Text = "") Or (WordMarker.Text = "\") Then
		MsgBox "The Word marker must be set before loading the lexicon"
		Exit Function
	End If
	If (GlossMarker.Text = "") Or (GlossMarker.Text = "\") Then
		MsgBox "The Gloss marker must be set before loading the lexicon"
		Exit Function
	End If
	If (CategoryMarker.Text = "") Or (CategoryMarker.Text = "\") Then
		MsgBox "The Category marker must be set before loading the lexicon"
		Exit Function
	End If
	If (FeatureMarker.Text = "") Or (FeatureMarker.Text = "\") Then
		MsgBox "The Feature marker must be set before loading the lexicon"
		Exit Function
	End If
	SetLexMarkers = True
	m_patr.LexRecordMarker = RecordMarker.Text
	m_patr.LexWordMarker = WordMarker.Text
	m_patr.LexGlossMarker = GlossMarker.Text
	m_patr.LexCategoryMarker = CategoryMarker.Text
	m_patr.LexFeaturesMarker = FeatureMarker.Text
	Exit Function

Failed:
	SetLexMarkers = False
	Exit Function
End Function

Private Function IsReadyToParse() As Boolean
	On Error GoTo Failed
	IsReadyToParse = False
	If (GrammarFile.Text = "") Then
		MsgBox "Must load grammar before parsing"
		Exit Function
	End If
	If (LexiconFile.Text = "") Then
		MsgBox "Must load lexicon before parsing"
		Exit Function
	End If
	IsReadyToParse = True
	Exit Function
Failed:
	IsReadyToParse = False
	Exit Function
End Function

Private Function DoSettings() As Boolean
	DoSettings = True
	On Error GoTo Failed

	If ParseDisplayOff.Value Then
		m_patr.TreeDisplay = 0
	ElseIf ParseTreeFlat.Value Then
		m_patr.TreeDisplay = 1
	ElseIf ParseTreeFull.Value Then
		m_patr.TreeDisplay = 2
	ElseIf ParseTreeIndented.Value Then
		m_patr.TreeDisplay = 3
	ElseIf ParseTreeXML.Value Then
		m_patr.TreeDisplay = 4
	Else
		' should never happen
		m_patr.TreeDisplay = 2
	End If

	m_patr.DisplayFeatures = FeaturesOn.Value
	m_patr.FlatFeatureDisplay = FlatFeatures.Value
	m_patr.TopFeatureOnly = TopFeatureOnly.Value
	m_patr.TrimEmptyFeatures = TrimEmptyFeatures.Value

	m_patr.Failures = PartialResults.Value
	m_patr.CheckCycles = CheckCycles.Value
	m_patr.Unification = EnableUnification.Value
	m_patr.TopDownFilter = TopDownFilter.Value
	m_patr.Gloss = EnableGlosses.Value

	m_patr.CommentChar = Asc(CommentChar.Text)
	If TimeLimit.Text = "(no limit)" Then
		m_patr.TimeLimit = 0
	Else
		m_patr.TimeLimit = TimeLimit.Text
	End If
	m_patr.DebuggingLevel = DebugLevel.Text
	m_patr.MaxAmbiguity = MaxAmbiguity.Text
	If CodePage.Text = "ANSI" Then
		m_patr.CodePage = 0
	ElseIf CodePage.Text = "OEM" Then
		m_patr.CodePage = 1
	ElseIf CodePage.Text = "MAC" Then
		m_patr.CodePage = 2
	ElseIf CodePage.Text = "SYMBOL" Then
		m_patr.CodePage = 42
	ElseIf CodePage.Text = "UTF7" Then
		m_patr.CodePage = 65000
	ElseIf CodePage.Text = "UTF8" Then
		m_patr.CodePage = 65001
	Else
		m_patr.CodePage = CodePage.Text
	End If
	Exit Function

Failed:
	DoSettings = False
	Exit Function
End Function

Private Sub EnableFeatureSettings()
	FlatFeatures.Enabled = True
	TopFeatureOnly.Enabled = True
	TrimEmptyFeatures.Enabled = True
End Sub

Private Sub DisableFeatureSettings()
	FlatFeatures.Enabled = False
	TopFeatureOnly.Enabled = False
	TrimEmptyFeatures.Enabled = False
End Sub
