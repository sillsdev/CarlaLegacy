VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} QTestingDHTMLPage
   ClientHeight    =   7110
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9180
   _ExtentX        =   16193
   _ExtentY        =   12541
   SourceFile      =   "..\HTMs\QTesting.htm"
   BuildFile       =   "..\Control\QTesting.htm"
   BuildMode       =   0
   TypeLibCookie   =   116
   AsyncLoad       =   0   'False
   id              =   "QTestingDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "QTestingDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Private Sub DHTMLPage_Load()
		' change name of test file
	QTestingFile.innerText = gsLangAbbr & "QTest.txt"

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function QTestingCancel_onclick() As Boolean
	QTestingCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Function QTestingOK_onclick() As Boolean
	QTestingOK_onclick = True
	BaseWindow.navigate "Contents.htm"
End Function
