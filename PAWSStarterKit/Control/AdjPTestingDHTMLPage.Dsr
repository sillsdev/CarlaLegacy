VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} AdjPTestingDHTMLPage
   ClientHeight    =   4275
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6525
   _ExtentX        =   11509
   _ExtentY        =   7541
   SourceFile      =   "..\HTMs\AdjPTesting.htm"
   BuildFile       =   "..\Control\AdjPTesting.htm"
   BuildMode       =   0
   TypeLibCookie   =   92
   AsyncLoad       =   0   'False
   id              =   "AdjPTestingDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "AdjPTestingDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True

Private Sub DHTMLPage_Load()
		' change name of test file
	AdjPTestingFile.innerText = gsLangAbbr & "AdjPTest.txt"

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function AdjPTestingOK_onclick() As Boolean

	gbDirty = True  ' mark it as having changed

	AdjPTestingOK_onclick = True

	BaseWindow.navigate "Contents.htm"
End Function

Private Function AdjPTestingCancel_onclick() As Boolean
	AdjPTestingCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
