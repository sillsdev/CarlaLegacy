VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} QPNoDegreeDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5790
   _ExtentX        =   10213
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\QPNoDegree.htm"
   BuildFile       =   "..\Control\QPNoDegree.htm"
   BuildMode       =   0
   TypeLibCookie   =   67
   AsyncLoad       =   0   'False
   id              =   "QPNoDegreeDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "QPNoDegreeDHTMLPage"
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

Private Function QPNoDegreeCancel_onclick() As Boolean
	QPNoDegreeCancel_onclick = True
	BaseWindow.navigate "QPDegree.htm"
End Function

Private Function QPNoDegreeOK_onclick() As Boolean
	QPNoDegreeOK_onclick = True
	BaseWindow.navigate "QPCardinal.htm"
End Function
