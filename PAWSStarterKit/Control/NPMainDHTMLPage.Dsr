VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPMainDHTMLPage
   ClientHeight    =   7110
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9210
   _ExtentX        =   16245
   _ExtentY        =   12541
   SourceFile      =   "..\HTMs\NPMain.htm"
   BuildFile       =   "..\Control\NPMain.htm"
   BuildMode       =   0
   TypeLibCookie   =   87
   AsyncLoad       =   0   'False
   id              =   "NPMainDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPMainDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPMainOK_onclick() As Boolean

	gbDirty = True  ' mark it as having changed

	NPMainOK_onclick = True

	BaseWindow.navigate "NPContents.htm"
End Function

Private Function NPMainCancel_onclick() As Boolean
	NPMainCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
