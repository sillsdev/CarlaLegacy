VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} PronNPDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6720
   _ExtentX        =   11853
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\PronNP.htm"
   BuildFile       =   "..\Control\PronNP.htm"
   BuildMode       =   0
   TypeLibCookie   =   21
   AsyncLoad       =   0   'False
   id              =   "PronNPDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "PronNPDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//pron/standAloneNPExample")
	If (elem.baseName <> "") Then
		PronNPStandAloneExample.Value = elem.Text
	Else
		PronNPStandAloneExample.Value = ""
	End If

	Set elem = gxmlDom.selectSingleNode("//pron/pronRelClExample")
	If (elem.baseName <> "") Then
		PronNPRelCl.Value = elem.Text
	Else
		PronNPRelCl.Value = ""
	End If

	Set elem = gxmlDom.selectSingleNode("//pron/partitiveExample")
	If (elem.baseName <> "") Then
		PronNPPartitiveExample.Value = elem.Text
	Else
		PronNPPartitiveExample.Value = ""
	End If

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//pron/@partitive")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	sPos = gGetPositionBasedOnHead(attr.Text, False)
	If (sPos = "before") Then
		PronNPPartBefore.Checked = True
	Else
		PronNPPartAfter.Checked = True
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function PronNPPartBefore_onclick() As Boolean
	PronNPPartBefore.Checked = True
	PronNPPartBefore_onclick = True
End Function
Private Function PronNPPartBeforePrompt_onclick() As Boolean
	PronNPPartBefore_onclick
	PronNPPartBeforePrompt_onclick = True
End Function

Private Function PronNPPartAfter_onclick() As Boolean
	PronNPPartAfter.Checked = True
	PronNPPartAfter_onclick = True
End Function
Private Function PronNPPartAfterPrompt_onclick() As Boolean
	PronNPPartAfter_onclick
	PronNPPartAfterPrompt_onclick = True
End Function

Private Function PronNPOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//pron/standAloneNPExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = PronNPStandAloneExample.Value

	Set elem = gxmlDom.selectSingleNode("//pron/pronRelClExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = PronNPRelCl.Value

	Set elem = gxmlDom.selectSingleNode("//pron/partitiveExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = PronNPPartitiveExample.Value

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//pron/@partitive")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (PronNPPartBefore.Checked) Then sTemp = "before"
	If (PronNPPartAfter.Checked) Then sTemp = "after"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	PronNPOK_onclick = True

	BaseWindow.navigate "PronCat.htm"
End Function

Private Function PronNPCancel_onclick() As Boolean
	PronNPCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
