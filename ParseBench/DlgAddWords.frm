VERSION 5.00
Begin VB.Form DlgAddWords
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Add words..."
   ClientHeight    =   3585
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   5565
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3585
   ScaleWidth      =   5565
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox sWords
	  Height          =   2295
	  Left            =   240
	  MultiLine       =   -1  'True
	  ScrollBars      =   2  'Vertical
	  TabIndex        =   0
	  Text            =   "DlgAddWords.frx":0000
	  Top             =   480
	  Width           =   5055
   End
   Begin VB.CommandButton btnCancel
	  Cancel          =   -1  'True
	  Caption         =   "&Cancel"
	  Height          =   375
	  Left            =   4080
	  TabIndex        =   2
	  Top             =   3000
	  Width           =   1215
   End
   Begin VB.CommandButton btnOK
	  Caption         =   "&OK"
	  Default         =   -1  'True
	  Height          =   375
	  Left            =   2640
	  TabIndex        =   1
	  Top             =   3000
	  Width           =   1215
   End
   Begin VB.Label Label1
	  Caption         =   "Enter new words here, seperated by spaces."
	  Height          =   255
	  Left            =   240
	  TabIndex        =   3
	  Top             =   120
	  Width           =   3855
   End
End
Attribute VB_Name = "DlgAddWords"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public m_bOK As Boolean
' if the user accepts the dialogue, then this will contain a Path to a file containing the new words in XML format.
Public m_sNewWordsPath As String
Private Sub Form_Load()
	m_bOK = False
	updateButtons
End Sub


Private Sub btnCancel_Click()
	m_bOK = False
	Me.Hide
End Sub


Private Sub btnOK_Click()
	 m_bOK = True
	Me.Hide

	Dim fs As New FileSystemObject
	Dim f As TextStream
	Dim tempFolder As Scripting.Folder
	Set tempFolder = fs.GetSpecialFolder(2) 'temp directory

	m_sNewWordsPath = tempFolder.Path + "\pb-newWords.xml"
	Set f = fs.CreateTextFile(m_sNewWordsPath)
	f.WriteLine "<wfi>"
	Dim s As String
	Dim n As Integer
	While sWords <> ""
		s = ""
		n = Strings.InStr(1, sWords, " ")
		If n > 0 Then
			s = Strings.Left(sWords, n - 1)
			sWords = Strings.Mid(sWords, n + 1) ' strip off this word from the list
	   Else
			s = sWords ' the last word
			sWords = ""
		End If
		s = Strings.Trim(s) ' note, this only train spaces, not tabs or returns!
		If s <> "" Then
			f.WriteLine "<wfic id=""" + s + """ form=""" + s + """></wfic>"
		End If

	Wend
	f.WriteLine "</wfi>"

	f.Close
End Sub


Private Sub sWords_Change()
	updateButtons
End Sub

Private Sub updateButtons()
	btnOK.Enabled = (sWords <> "")
End Sub
