VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} QPMainDHTMLPage
   ClientHeight    =   7110
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8220
   _ExtentX        =   14499
   _ExtentY        =   12541
   SourceFile      =   "..\HTMs\QPMain.htm"
   BuildFile       =   "..\Control\QPMain.htm"
   BuildMode       =   0
   TypeLibCookie   =   424
   AsyncLoad       =   0   'False
   id              =   "QPMainDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "QPMainDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//qp/example")
	If (elem.baseName <> "") Then
		QPExample.Value = elem.Text
	Else
		QPExample.Value = ""
	End If
		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If

	BaseWindow.focus
End Sub

Private Function QPExamplesCancel_onclick() As Boolean

	BaseWindow.navigate "QPMain.htm"

End Function

Private Function QPExamplesOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//qp/example")
	'TODO: figure what to do if any of these are missing!
	elem.Text = QPExample.Value
	gbDirty = True  ' mark it as having changed

	QPExamplesOK_onclick = True

	BaseWindow.navigate "QPDegree.htm"

End Function
