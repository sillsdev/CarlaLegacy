VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} QPCardinalDHTMLPage
   ClientHeight    =   6990
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8145
   _ExtentX        =   14367
   _ExtentY        =   12330
   SourceFile      =   "..\HTMs\QPCardinal.htm"
   BuildFile       =   "..\Control\QPCardinal.htm"
   BuildMode       =   0
   TypeLibCookie   =   74
   AsyncLoad       =   0   'False
   id              =   "QPCardinalDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "QPCardinalDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()
	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//qp/cardinalExample")
	If (elem.baseName <> "") Then
		QPCardinalExample.Value = elem.Text
	Else
		QPCardinalExample.Value = ""
	End If
	Set elem = gxmlDom.selectSingleNode("//qp/cardinalCompoundExample")
	If (elem.baseName <> "") Then
		QPCardinalCompoundExample.Value = elem.Text
	Else
		QPCardinalCompoundExample.Value = ""
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function QPCardinalExamplesCancel_onclick() As Boolean
	QPCardinalExamplesCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next
End Function

Private Function QPCardinalExamplesOK_onclick() As Boolean
	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//qp/cardinalExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = QPCardinalExample.Value
	Set elem = gxmlDom.selectSingleNode("//qp/cardinalCompoundExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = QPCardinalCompoundExample.Value

	gbDirty = True  ' mark it as having changed

	QPCardinalExamplesOK_onclick = True

	BaseWindow.navigate "QPOrdinal.htm"
End Function
