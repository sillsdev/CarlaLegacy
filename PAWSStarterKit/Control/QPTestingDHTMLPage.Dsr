VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} QPTestingDHTMLPage
   ClientHeight    =   4275
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6525
   _ExtentX        =   11509
   _ExtentY        =   7541
   SourceFile      =   "..\HTMs\QPTesting.htm"
   BuildFile       =   "..\Control\QPTesting.htm"
   BuildMode       =   0
   TypeLibCookie   =   107
   AsyncLoad       =   0   'False
   id              =   "QPTestingDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "QPTestingDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private Sub DHTMLPage_Load()
		' change name of test file
	QPTestingFile.innerText = gsLangAbbr & "QPTest.txt"

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function QPTestingCancel_onclick() As Boolean
	QPTestingCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Function QPTestingOK_onclick() As Boolean
	QPTestingOK_onclick = True
	BaseWindow.navigate "Contents.htm"
End Function
