VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} IPPassiveDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   _ExtentX        =   11906
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\IPPassive.htm"
   BuildFile       =   "..\Control\IPPassive.htm"
   BuildMode       =   0
   TypeLibCookie   =   43
   AsyncLoad       =   0   'False
   id              =   "IPPassiveDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "IPPassiveDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//ip/passiveExample")
	If (elem.baseName <> "") Then
		IPPassiveExample.Value = elem.Text
	Else
		IPPassiveExample.Value = ""
	End If

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//ip/@passive")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		IPPassiveNo.Checked = True
	Else
		IPPassiveYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//ip/@passiveAgent")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		IPPassiveAgentNo.Checked = True
	Else
		IPPassiveAgentYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//ip/@passiveAgentCat")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "pp") Then
		IPPassiveAgentCatPP.Checked = True
	Else
		IPPassiveAgentCatDP.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//ip/@passiveAux")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		IPPassiveAuxNo.Checked = True
	Else
		IPPassiveAuxYes.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function IPPassiveNo_onclick() As Boolean
	IPPassiveNo.Checked = True
	DisplayHidden
	IPPassiveNo_onclick = True
End Function
Private Function IPPassiveNoPrompt_onclick() As Boolean
	IPPassiveNo_onclick
	IPPassiveNoPrompt_onclick = True
End Function

Private Function IPPassiveYes_onclick() As Boolean
	IPPassiveYes.Checked = True
	DisplayHidden
	IPPassiveYes_onclick = True
End Function
Private Function IPPassiveYesPrompt_onclick() As Boolean
	IPPassiveYes_onclick
	IPPassiveYesPrompt_onclick = True
End Function

Private Function IPPassiveAgentNo_onclick() As Boolean
	IPPassiveAgentNo.Checked = True
	DisplayHidden
	IPPassiveAgentNo_onclick = True
End Function
Private Function IPPassiveAgentNoPrompt_onclick() As Boolean
	IPPassiveAgentNo_onclick
	IPPassiveAgentNoPrompt_onclick = True
End Function

Private Function IPPassiveAgentYes_onclick() As Boolean
	IPPassiveAgentYes.Checked = True
	DisplayHidden
	IPPassiveAgentYes_onclick = True
End Function
Private Function IPPassiveAgentYesPrompt_onclick() As Boolean
	IPPassiveAgentYes_onclick
	IPPassiveAgentYesPrompt_onclick = True
End Function

Private Function IPPassiveAgentCatPP_onclick() As Boolean
	IPPassiveAgentCatPP.Checked = True
	DisplayHidden
	IPPassiveAgentCatPP_onclick = True
End Function
Private Function IPPassiveAgentCatPPPrompt_onclick() As Boolean
	IPPassiveAgentCatPP_onclick
	IPPassiveAgentCatPPPrompt_onclick = True
End Function

Private Function IPPassiveAgentCatDP_onclick() As Boolean
	IPPassiveAgentCatDP.Checked = True
	DisplayHidden
	IPPassiveAgentCatDP_onclick = True
End Function
Private Function IPPassiveAgentCatDPPrompt_onclick() As Boolean
	IPPassiveAgentCatDP_onclick
	IPPassiveAgentCatDPPrompt_onclick = True
End Function

Private Function IPPassiveAuxNo_onclick() As Boolean
	IPPassiveAuxNo.Checked = True
	DisplayHidden
	IPPassiveAuxNo_onclick = True
End Function
Private Function IPPassiveAuxNoPrompt_onclick() As Boolean
	IPPassiveAuxNo_onclick
	IPPassiveAuxNoPrompt_onclick = True
End Function

Private Function IPPassiveAuxYes_onclick() As Boolean
	IPPassiveAuxYes.Checked = True
	DisplayHidden
	IPPassiveAuxYes_onclick = True
End Function
Private Function IPPassiveAuxYesPrompt_onclick() As Boolean
	IPPassiveAuxYes_onclick
	IPPassiveAuxYesPrompt_onclick = True
End Function

Private Function IPPassiveOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//ip/passiveExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = IPPassiveExample.Value

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//ip/@passive")
	'TODO: figure what to do if any of these are missing!
	sTemp = "yes" ' default if all else fails...
	If (IPPassiveNo.Checked) Then sTemp = "no"
	If (IPPassiveYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//ip/@passiveAgent")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (IPPassiveAgentNo.Checked) Then sTemp = "no"
	If (IPPassiveAgentYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//ip/@passiveAgentCat")
	'TODO: figure what to do if any of these are missing!
	sTemp = "dp" ' default if all else fails...
	If (IPPassiveAgentCatPP.Checked) Then sTemp = "pp"
	If (IPPassiveAgentCatDP.Checked) Then sTemp = "dp"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//ip/@passiveAux")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (IPPassiveAuxNo.Checked) Then sTemp = "no"
	If (IPPassiveAuxYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	IPPassiveOK_onclick = True

	BaseWindow.navigate "IPContents.htm"
End Function

Private Function IPPassiveCancel_onclick() As Boolean
	IPPassiveCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (IPPassiveNo.Checked) Then
		IPPassiveAgentTable.Style.display = "none"
		IPPassiveAgentCatTable.Style.display = "none"
		IPPassiveInstruction.Style.display = "none"
	Else
		IPPassiveAgentTable.Style.display = ""
		IPPassiveInstruction.Style.display = ""
		If (IPPassiveAgentNo.Checked) Then
			IPPassiveAgentCatTable.Style.display = "none"
		Else
			IPPassiveAgentCatTable.Style.display = ""
		End If
	End If
End Sub
