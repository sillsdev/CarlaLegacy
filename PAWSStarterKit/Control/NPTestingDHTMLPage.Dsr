VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPTestingDHTMLPage
   ClientHeight    =   4275
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6525
   _ExtentX        =   11509
   _ExtentY        =   7541
   SourceFile      =   "..\HTMs\NPTesting.htm"
   BuildFile       =   "..\Control\NPTesting.htm"
   BuildMode       =   0
   TypeLibCookie   =   81
   AsyncLoad       =   0   'False
   id              =   "NPTestingDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPTestingDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True

Private Sub DHTMLPage_Load()
		' change name of test file
	NPTestingFile.innerText = gsLangAbbr & "NPTest.txt"

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPTestingOK_onclick() As Boolean

	gbDirty = True  ' mark it as having changed

	NPTestingOK_onclick = True

	BaseWindow.navigate "NPContents.htm"
End Function

Private Function NPTestingCancel_onclick() As Boolean
	NPTestingCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
