VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} QPDegreeDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5115
   _ExtentX        =   9022
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\QPDegree.htm"
   BuildFile       =   "..\Control\QPDegree.htm"
   BuildMode       =   0
   TypeLibCookie   =   57
   AsyncLoad       =   0   'False
   id              =   "QPDegreeDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "QPDegreeDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//qp/@degree")
	If (attr.baseName <> "") Then
		If (attr.Text = "yes") Then
			QPDegreeYes.focus
		Else
			QPDegreeNo.focus
		End If
	Else
		QPDegreeYes.focus
	End If
		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If

End Sub

Private Function QPDegreeNo_onclick() As Boolean
	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//qp/@degree")
	'TODO: figure what to do if any of these are missing!
	attr.Text = "yno"
	QPDegreeNo_onclick = True
	gbDirty = True  ' mark it as having changed
	BaseWindow.navigate "QPNoDegree.htm"

End Function

Private Function QPDegreeYes_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//qp/@degree")
	'TODO: figure what to do if any of these are missing!
	attr.Text = "yes"
	gbDirty = True  ' mark it as having changed

	QPDegreeYes_onclick = True

	BaseWindow.navigate "QPDegree2.htm"

End Function
