VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} AdvPTestingDHTMLPage
   ClientHeight    =   4275
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6525
   _ExtentX        =   11509
   _ExtentY        =   7541
   SourceFile      =   "..\HTMs\AdvPTesting.htm"
   BuildFile       =   "..\Control\AdvPTesting.htm"
   BuildMode       =   0
   TypeLibCookie   =   92
   AsyncLoad       =   0   'False
   id              =   "AdvPTestingDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "AdvPTestingDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()
	AdvPTestingFile.innerText = gsLangAbbr & "AdvPTest.txt"

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function AdvPTestingOK_onclick() As Boolean
	AdvPTestingOK_onclick = True
	BaseWindow.navigate "Contents.htm"
End Function

Private Function AdvPTestingCancel_onclick() As Boolean
	AdvPTestingCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
