VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} IPTransDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   _ExtentX        =   11906
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\IPTrans.htm"
   BuildFile       =   "..\Control\IPTrans.htm"
   BuildMode       =   0
   TypeLibCookie   =   31
   AsyncLoad       =   0   'False
   id              =   "IPTransDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "IPTransDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//ip/example")
	If (elem.baseName <> "") Then
		IPExamplesExample.Value = elem.Text
	Else
		IPExamplesExample.Value = ""
	End If

	Set elem = gxmlDom.selectSingleNode("//ip/diExample")
	If (elem.baseName <> "") Then
		IPExamplesDiExamples.Value = elem.Text
	Else
		IPExamplesDiExamples.Value = ""
	End If

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//ip/@diCat")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "pp") Then
		IPTransDiCatPP.Checked = True
	ElseIf (attr.Text = "dp") Then
		IPTransDiCatDP.Checked = True
	Else
		IPTransDiCatBoth.Checked = True
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function IPTransDiCatPP_onclick() As Boolean
	IPTransDiCatPP.Checked = True
	IPTransDiCatPP_onclick = True
End Function
Private Function IPTransDiCatPPPrompt_onclick() As Boolean
	IPTransDiCatPP_onclick
	IPTransDiCatPPPrompt_onclick = True
End Function

Private Function IPTransDiCatDP_onclick() As Boolean
	IPTransDiCatDP.Checked = True
	IPTransDiCatDP_onclick = True
End Function
Private Function IPTransDiCatDPPrompt_onclick() As Boolean
	IPTransDiCatDP_onclick
	IPTransDiCatDPPrompt_onclick = True
End Function

Private Function IPTransDiCatBoth_onclick() As Boolean
	IPTransDiCatBoth.Checked = True
	IPTransDiCatBoth_onclick = True
End Function
Private Function IPTransDiCatBothPrompt_onclick() As Boolean
	IPTransDiCatBoth_onclick
	IPTransDiCatBothPrompt_onclick = True
End Function

Private Function IPTransOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//ip/example")
	'TODO: figure what to do if any of these are missing!
	elem.Text = IPExamplesExample.Value

	Set elem = gxmlDom.selectSingleNode("//ip/diExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = IPExamplesDiExamples.Value

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//ip/@diCat")
	'TODO: figure what to do if any of these are missing!
	sTemp = "dp" ' default if all else fails...
	If (IPTransDiCatPP.Checked) Then sTemp = "pp"
	If (IPTransDiCatDP.Checked) Then sTemp = "dp"
	If (IPTransDiCatBoth.Checked) Then sTemp = "both"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	IPTransOK_onclick = True

	BaseWindow.navigate "IPContents.htm"
End Function

Private Function IPTransCancel_onclick() As Boolean
	IPTransCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
