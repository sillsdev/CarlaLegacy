VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} PronCatDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6720
   _ExtentX        =   11853
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\PronCat.htm"
   BuildFile       =   "..\Control\PronCat.htm"
   BuildMode       =   0
   TypeLibCookie   =   11
   AsyncLoad       =   0   'False
   id              =   "PronCatDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "PronCatDHTMLPage"
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

Private Function PronCatOK_onclick() As Boolean

	gbDirty = True  ' mark it as having changed

	PronCatOK_onclick = True

	BaseWindow.navigate "PronTesting.htm"
End Function

Private Function PronCatCancel_onclick() As Boolean
	PronCatCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
