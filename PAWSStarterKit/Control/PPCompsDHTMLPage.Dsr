VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} PPCompsDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   _ExtentX        =   11906
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\PPComps.htm"
   BuildFile       =   "..\Control\PPComps.htm"
   BuildMode       =   0
   TypeLibCookie   =   11
   AsyncLoad       =   0   'False
   id              =   "PPCompsDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "PPCompsDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//pp/ppExample")
	If (elem.baseName <> "") Then
		PPCompsStandAlone.Value = elem.Text
	Else
		PPCompsStandAlone.Value = ""
	End If

	Set elem = gxmlDom.selectSingleNode("//pp/locExample")
	If (elem.baseName <> "") Then
		PPCompsLocExample.Value = elem.Text
	Else
		PPCompsLocExample.Value = ""
	End If

	Set elem = gxmlDom.selectSingleNode("//pp/sentExample")
	If (elem.baseName <> "") Then
		PPCompsSentExample.Value = elem.Text
	Else
		PPCompsSentExample.Value = ""
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function PPCompOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//pp/ppExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = PPCompsStandAlone.Value

	Set elem = gxmlDom.selectSingleNode("//pp/locExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = PPCompsLocExample.Value

	Set elem = gxmlDom.selectSingleNode("//pp/sentExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = PPCompsSentExample.Value

	gbDirty = True  ' mark it as having changed

	PPCompOK_onclick = True

	BaseWindow.navigate "PPAlone.htm"
End Function

Private Function PPCompCancel_onclick() As Boolean
	PPCompCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
