VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form SenTransCOM
   Caption         =   "SenTrans COM Test"
   ClientHeight    =   5415
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10185
   LinkTopic       =   "Form1"
   ScaleHeight     =   5415
   ScaleWidth      =   10185
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox OtherPunctuation
	  Height          =   285
	  Left            =   6240
	  TabIndex        =   23
	  Text            =   "-,'/"""
	  Top             =   4680
	  Width           =   1815
   End
   Begin VB.TextBox BeginningPunctuation
	  Height          =   285
	  Left            =   6240
	  TabIndex        =   21
	  Text            =   "'"""
	  Top             =   4200
	  Width           =   1815
   End
   Begin VB.TextBox SentenceTerminators
	  Height          =   285
	  Left            =   6240
	  TabIndex        =   19
	  Text            =   ".?!:;"
	  Top             =   3600
	  Width           =   1815
   End
   Begin VB.CheckBox DumpClasses
	  Caption         =   "Dump class info to log file"
	  Height          =   255
	  Left            =   240
	  TabIndex        =   17
	  Top             =   5040
	  Width           =   3135
   End
   Begin VB.CheckBox IgnoreCats
	  Caption         =   "Ignore categories"
	  Height          =   375
	  Left            =   240
	  TabIndex        =   16
	  Top             =   4440
	  Width           =   3015
   End
   Begin VB.CheckBox Trace
	  Caption         =   "Trace rule application"
	  Height          =   375
	  Left            =   240
	  TabIndex        =   15
	  Top             =   3960
	  Width           =   2775
   End
   Begin VB.CommandButton RuleFileName
	  Caption         =   "Bro&wse"
	  Height          =   375
	  Left            =   9240
	  TabIndex        =   14
	  Top             =   1920
	  Width           =   855
   End
   Begin VB.TextBox CommentChar
	  Height          =   285
	  Left            =   3240
	  TabIndex        =   11
	  Text            =   "|"
	  Top             =   3600
	  Width           =   300
   End
   Begin VB.CommandButton LogFileName
	  Caption         =   "Br&owse"
	  Height          =   375
	  Left            =   9240
	  TabIndex        =   9
	  Top             =   1320
	  Width           =   855
   End
   Begin MSComDlg.CommonDialog Cmd
	  Left            =   9600
	  Top             =   4920
	  _ExtentX        =   847
	  _ExtentY        =   847
	  _Version        =   393216
   End
   Begin VB.CommandButton ApplyRules
	  Caption         =   "&Apply the rules"
	  Height          =   495
	  Left            =   2040
	  TabIndex        =   4
	  Top             =   2760
	  Width           =   1935
   End
   Begin VB.CommandButton OutputFileName
	  Caption         =   "B&rowse"
	  Height          =   375
	  Left            =   9240
	  TabIndex        =   3
	  Top             =   720
	  Width           =   855
   End
   Begin VB.CommandButton InputFileName
	  Caption         =   "&Browse"
	  Height          =   375
	  Left            =   9240
	  TabIndex        =   1
	  Top             =   120
	  Width           =   855
   End
   Begin VB.Label Label8
	  Caption         =   "Other punctuation:"
	  Height          =   255
	  Left            =   4200
	  TabIndex        =   22
	  Top             =   4800
	  Width           =   1815
   End
   Begin VB.Label Label7
	  Caption         =   "Beginning punctuation:"
	  Height          =   255
	  Left            =   4200
	  TabIndex        =   20
	  Top             =   4200
	  Width           =   1695
   End
   Begin VB.Label Label6
	  Caption         =   "Sentence Terminators:"
	  Height          =   255
	  Left            =   4200
	  TabIndex        =   18
	  Top             =   3600
	  Width           =   1695
   End
   Begin VB.Label RulesLabel
	  Caption         =   "RulesLabel"
	  Height          =   255
	  Left            =   1800
	  TabIndex        =   13
	  Top             =   2040
	  Width           =   7335
   End
   Begin VB.Label Label5
	  Caption         =   "Rules File Name:"
	  Height          =   255
	  Left            =   240
	  TabIndex        =   12
	  Top             =   2040
	  Width           =   1335
   End
   Begin VB.Label Label4
	  Caption         =   "Comment character:"
	  Height          =   255
	  Left            =   240
	  TabIndex        =   10
	  Top             =   3600
	  Width           =   2415
   End
   Begin VB.Label LogLabel
	  Caption         =   "LogLabel"
	  Height          =   255
	  Left            =   1800
	  TabIndex        =   8
	  Top             =   1440
	  Width           =   7215
   End
   Begin VB.Label Label3
	  Caption         =   "Log File Name:"
	  Height          =   255
	  Left            =   240
	  TabIndex        =   7
	  Top             =   1440
	  Width           =   1335
   End
   Begin VB.Label OutputLabel
	  Caption         =   "OutputLabel"
	  Height          =   255
	  Left            =   1800
	  TabIndex        =   6
	  Top             =   840
	  Width           =   7335
   End
   Begin VB.Label InputLabel
	  Caption         =   "InputLabel"
	  Height          =   255
	  Left            =   1800
	  TabIndex        =   5
	  Top             =   240
	  Width           =   7215
   End
   Begin VB.Label Label2
	  Caption         =   "Output File Name:"
	  Height          =   255
	  Left            =   240
	  TabIndex        =   2
	  Top             =   840
	  Width           =   1335
   End
   Begin VB.Label Label1
	  Caption         =   "Input File name:"
	  Height          =   255
	  Left            =   240
	  TabIndex        =   0
	  Top             =   240
	  Width           =   1215
   End
End
Attribute VB_Name = "SenTransCOM"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim sRulesFile As String
Dim sInputFile As String
Dim sOutputFile As String
Dim sLogFile As String

Private Sub ApplyRules_Click()

If (sRulesFile = "") Then
	MsgBox "Need a rule file name!"
	Exit Sub
	End If
If (sInputFile = "") Then
	MsgBox "Need an input file name!"
	Exit Sub
	End If
If (sOutputFile = "") Then
	MsgBox "Need an output file name!"
	Exit Sub
	End If
If (sLogFile = "") Then
	MsgBox "Need a log file name!"
	Exit Sub
	End If
Dim obj
Dim hResult As Integer
Set obj = CreateObject("SenTransCOM.SenTrans.1")

If Not (sLogFileName = "") Then
	obj.LogFileName = sLogFileName
	End If
obj.CommentChar = CommentChar.Text
obj.bEchoClassContentsInLogFile = DumpClasses
obj.bIgnoreCatField = IgnoreCats
obj.bTraceRuleApplication = Trace
obj.SentenceTerminators = SentenceTerminators
obj.BeginningPunctuation = BeginningPunctuation
obj.OtherPunctuation = OtherPunctuation

hResult = obj.ApplyRulesToFile(sRulesFile, sInputFile, sOutputFile, sLogFile)
If (hResult = 0) Then
	MsgBox "Application succeeded"
Else
	msg = "Error in application! Code was "
	msg = msg + hResult
	MsgBox msg
	End If

End Sub

Private Sub InputFileName_Click()
On Error Resume Next
With Cmd
	.Filter = "ANA files (*.an*)|*.an*|All files (*.*)|*.*"
	.Flags = cdlOFNHideReadOnly + cdlOFNFileMustExist + cdlOFNLongNames
	.DialogTitle = "Input file name"
	.DefaultExt = "*.ana"
	.ShowOpen
	If .FileName = "" Then Exit Sub
	sInputFile = .FileName
	sDir = .FileName
End With
InputLabel.Caption = sInputFile
End Sub

Private Sub LogFileName_Click()
On Error Resume Next
With Cmd
	.Filter = "Log files (*.log)|*.log|All files (*.*)|*.*"
	.Flags = cdlOFNHideReadOnly + cdlOFNLongNames
	.DialogTitle = "Log file name"
	.DefaultExt = ".log"
	.FileName = Left(sInputFile, Len(sInputFile) - 3) + "log"
	.ShowOpen
	If .FileName = "" Then Exit Sub
	sLogFile = .FileName
End With
LogLabel.Caption = sLogFile

End Sub

Private Sub OutputFileName_Click()
On Error Resume Next
With Cmd
	.Filter = "ANA files (*.new)|*.new|All files (*.*)|*.*"
	.Flags = cdlOFNHideReadOnly + cdlOFNLongNames
	.DialogTitle = "Output file name"
	.DefaultExt = "new"
	.FileName = Left(sInputFile, Len(sInputFile) - 3) + "new"
	.ShowOpen
	If .FileName = "" Then Exit Sub
	sOutputFile = .FileName
End With
OutputLabel.Caption = sOutputFile

End Sub

Private Sub RuleFileName_Click()
On Error Resume Next
With Cmd
	.Filter = "SEN files (*.rul)|*.rul|All files (*.*)|*.*"
	.Flags = cdlOFNHideReadOnly + cdlOFNLongNames
	.DialogTitle = "SenTrans Rules file name"
	.DefaultExt = "*.rul"
	.FileName = Left(sInputFile, Len(sInputFile) - 3) + "rul"
	.ShowOpen
	If .FileName = "" Then Exit Sub
	sRulesFile = .FileName
End With
RulesLabel.Caption = sRulesFile

End Sub
