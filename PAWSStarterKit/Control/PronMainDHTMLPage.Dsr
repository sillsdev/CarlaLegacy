VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} PronMainDHTMLPage
   ClientHeight    =   7110
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9045
   _ExtentX        =   15954
   _ExtentY        =   12541
   SourceFile      =   "..\HTMs\PronMain.htm"
   BuildFile       =   "..\Control\PronMain.htm"
   BuildMode       =   0
   TypeLibCookie   =   44
   AsyncLoad       =   0   'False
   id              =   "PronMainDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "PronMainDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//pron/example")
	If (elem.baseName <> "") Then
		PronPNExample.Value = elem.Text
	Else
		PronPNExample.Value = ""
	End If

	Set elem = gxmlDom.selectSingleNode("//pron/ppExample")
	If (elem.baseName <> "") Then
		PronPNPPExample.Value = elem.Text
	Else
		PronPNPPExample.Value = ""
	End If

	Set elem = gxmlDom.selectSingleNode("//pron/relClExample")
	If (elem.baseName <> "") Then
		PronPNRelClExample.Value = elem.Text
	Else
		PronPNRelClExample.Value = ""
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function PronPNOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//pron/example")
	'TODO: figure what to do if any of these are missing!
	elem.Text = PronPNExample.Value

	Set elem = gxmlDom.selectSingleNode("//pron/ppExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = PronPNPPExample.Value

	Set elem = gxmlDom.selectSingleNode("//pron/relClExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = PronPNRelClExample.Value

	gbDirty = True  ' mark it as having changed

	PronPNOK_onclick = True

	BaseWindow.navigate "PronPN2.htm"
End Function

Private Function PronPNCancel_onclick() As Boolean
	PronPNCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
