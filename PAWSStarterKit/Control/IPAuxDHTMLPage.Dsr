VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} IPAuxDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   _ExtentX        =   11906
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\IPAux.htm"
   BuildFile       =   "..\Control\IPAux.htm"
   BuildMode       =   0
   TypeLibCookie   =   47
   AsyncLoad       =   0   'False
   id              =   "IPAuxDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "IPAuxDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Dim sOrder As String

Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//ip/auxExample")
	If (elem.baseName <> "") Then
		IPExamplesAuxExample.Value = elem.Text
	Else
		IPExamplesAuxExample.Value = ""
	End If

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//ip/@aux")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		IPAuxNo.Checked = True
	Else
		IPAuxYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//ip/@auxRequired")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		IPAuxRequiredNo.Checked = True
	Else
		IPAuxRequiredYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//ip/@auxMany")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		IPAuxManyNo.Checked = True
	Else
		IPAuxManyYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//ip/@auxOrder")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		IPAuxOrderYes.Checked = True
	Else
		IPAuxOrderNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//typology/@wordOrder")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	sOrder = attr.Text

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function IPAuxNo_onclick() As Boolean
	IPAuxNo.Checked = True
	DisplayHidden
	IPAuxNo_onclick = True
End Function
Private Function IPAuxNoPrompt_onclick() As Boolean
	IPAuxNo_onclick
	IPAuxNoPrompt_onclick = True
End Function

Private Function IPAuxYes_onclick() As Boolean
	IPAuxYes.Checked = True
	DisplayHidden
	IPAuxYes_onclick = True
End Function
Private Function IPAuxYesPrompt_onclick() As Boolean
	IPAuxYes_onclick
	IPAuxYesPrompt_onclick = True
End Function

Private Function IPAuxRequiredNo_onclick() As Boolean
	IPAuxRequiredNo.Checked = True
	DisplayHidden
	IPAuxRequiredNo_onclick = True
End Function
Private Function IPAuxRequiredNoPrompt_onclick() As Boolean
	IPAuxRequiredNo_onclick
	IPAuxRequiredNoPrompt_onclick = True
End Function

Private Function IPAuxRequiredYes_onclick() As Boolean
	IPAuxRequiredYes.Checked = True
	DisplayHidden
	IPAuxRequiredYes_onclick = True
End Function
Private Function IPAuxRequiredYesPrompt_onclick() As Boolean
	IPAuxRequiredYes_onclick
	IPAuxRequiredYesPrompt_onclick = True
End Function

Private Function IPAuxManyNo_onclick() As Boolean
	IPAuxManyNo.Checked = True
	DisplayHidden
	IPAuxManyNo_onclick = True
End Function
Private Function IPAuxManyNoPrompt_onclick() As Boolean
	IPAuxManyNo_onclick
	IPAuxManyNoPrompt_onclick = True
End Function

Private Function IPAuxManyYes_onclick() As Boolean
	IPAuxManyYes.Checked = True
	DisplayHidden
	IPAuxManyYes_onclick = True
End Function
Private Function IPAuxManyYesPrompt_onclick() As Boolean
	IPAuxManyYes_onclick
	IPAuxManyYesPrompt_onclick = True
End Function

Private Function IPAuxOrderYes_onclick() As Boolean
	IPAuxOrderYes.Checked = True
	DisplayHidden
	IPAuxOrderYes_onclick = True
End Function
Private Function IPAuxOrderYesPrompt_onclick() As Boolean
	IPAuxOrderYes_onclick
	IPAuxOrderYesPrompt_onclick = True
End Function

Private Function IPAuxOrderNo_onclick() As Boolean
	IPAuxOrderNo.Checked = True
	DisplayHidden
	IPAuxOrderNo_onclick = True
End Function
Private Function IPAuxOrderNoPrompt_onclick() As Boolean
	IPAuxOrderNo_onclick
	IPAuxOrderNoPrompt_onclick = True
End Function

Private Function IPAuxOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//ip/auxExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = IPExamplesAuxExample.Value

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//ip/@aux")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (IPAuxNo.Checked) Then sTemp = "no"
	If (IPAuxYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//ip/@auxRequired")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (IPAuxRequiredNo.Checked) Then sTemp = "no"
	If (IPAuxRequiredYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//ip/@auxMany")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (IPAuxManyNo.Checked) Then sTemp = "no"
	If (IPAuxManyYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//ip/@auxOrder")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (IPAuxOrderYes.Checked) Then sTemp = "yes"
	If (IPAuxOrderNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	IPAuxOK_onclick = True

	BaseWindow.navigate "IPContents.htm"
End Function

Private Function IPAuxCancel_onclick() As Boolean
	IPAuxCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (IPAuxNo.Checked) Then
		IPAuxRequiredTable.Style.display = "none"
		IPAuxManyTable.Style.display = "none"
		IPAuxOrderTable.Style.display = "none"
		IPAuxYesInstruction.Style.display = "none"
		IPAuxOrderPromptVSO.Style.display = "none"
		IPAuxOrderPromptOSV.Style.display = "none"
		IPAuxOrderYesVSOPrompt.Style.display = "none"
		IPAuxOrderYesOSVPrompt.Style.display = "none"
		IPAuxOrderNoVSOPrompt.Style.display = "none"
		IPAuxOrderNoOSVPrompt.Style.display = "none"
	Else
		IPAuxRequiredTable.Style.display = ""
		IPAuxManyTable.Style.display = ""
		IPAuxYesInstruction.Style.display = ""
		If (sOrder = "VSO" Or sOrder = "OSV") Then
			IPAuxOrderTable.Style.display = ""
			If (sOrder = "VSO") Then
				IPAuxOrderPromptVSO.Style.display = ""
				IPAuxOrderPromptOSV.Style.display = "none"
				IPAuxOrderYesVSOPrompt.Style.display = ""
				IPAuxOrderYesOSVPrompt.Style.display = "none"
				IPAuxOrderNoVSOPrompt.Style.display = ""
				IPAuxOrderNoOSVPrompt.Style.display = "none"
			Else
				IPAuxOrderPromptVSO.Style.display = "none"
				IPAuxOrderPromptOSV.Style.display = ""
				IPAuxOrderYesVSOPrompt.Style.display = "none"
				IPAuxOrderYesOSVPrompt.Style.display = ""
				IPAuxOrderNoVSOPrompt.Style.display = "none"
				IPAuxOrderNoOSVPrompt.Style.display = ""
			End If
		Else
			IPAuxOrderTable.Style.display = "none"
			IPAuxOrderPromptVSO.Style.display = "none"
			IPAuxOrderPromptOSV.Style.display = "none"
			IPAuxOrderYesVSOPrompt.Style.display = "none"
			IPAuxOrderYesOSVPrompt.Style.display = "none"
			IPAuxOrderNoVSOPrompt.Style.display = "none"
			IPAuxOrderNoOSVPrompt.Style.display = "none"
		End If
	End If
End Sub
