VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPPossessors2DHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5985
   _ExtentX        =   10557
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\NPPossessors2.htm"
   BuildFile       =   "..\Control\NPPossessors2.htm"
   BuildMode       =   0
   TypeLibCookie   =   147
   AsyncLoad       =   0   'False
   id              =   "NPPossessors2DHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPPossessors2DHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//np/@possMarked")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		NPPossMarkedNo.Checked = True
	ElseIf (attr.Text = "yesAffix") Then
		NPPossMarkedYesAffix.Checked = True
	Else
		NPPossMarkedYesClitic.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@possNounPos1")
	If (IsEmpty(attr)) Then
		'TODO: create one
	End If
	sPos = gGetPositionBasedOnSpecifier(attr.Text)
	If (sPos = "before") Then
		NPPossMarkedNoPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		NPPossMarkedNoPosAfter.Checked = True
	Else
		NPPossMarkedNoPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@possNounPos2")
	If (IsEmpty(attr)) Then
		'TODO: create one
	End If
	sPos = gGetPositionBasedOnSpecifier(attr.Text)
	If (sPos = "before") Then
		NPPossMarkedYesAffixPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		NPPossMarkedYesAffixPosAfter.Checked = True
	Else
		NPPossMarkedYesAffixPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@possCliticWord")
	If (IsEmpty(attr)) Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		NPPossMarkedYesCliticWordNo.Checked = True
	Else
		NPPossMarkedYesCliticWordYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@possCliticRequired")
	If (IsEmpty(attr)) Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		NPPossMarkedYesCliticRequiredNo.Checked = True
	Else
		NPPossMarkedYesCliticRequiredYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@possCliticPossPos")
	If (IsEmpty(attr)) Then
		'TODO: create one
	End If
	If (attr.Text = "before") Then
		NPPossMarkedYesCliticRequiredPossPosBefore.Checked = True
	Else
		NPPossMarkedYesCliticRequiredPossPosAfter.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@possNounPos3")
	If (IsEmpty(attr)) Then
		'TODO: create one
	End If
	sPos = gGetPositionBasedOnSpecifier(attr.Text)
	If (sPos = "before") Then
		NPPossMarkedYesCliticRequiredNounPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		NPPossMarkedYesCliticRequiredNounPosAfter.Checked = True
	Else
		NPPossMarkedYesCliticRequiredNounPosEitherSide.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPPossMarkedNo_onclick() As Boolean
	NPPossMarkedNo.Checked = True
	DisplayHidden
	NPPossMarkedNo_onclick = True
End Function
Private Function NPPossMarkedNoPrompt_onclick() As Boolean
	NPPossMarkedNo_onclick
	NPPossMarkedNoPrompt_onclick = True
End Function

Private Function NPPossMarkedNoPosBefore_onclick() As Boolean
	NPPossMarkedNoPosBefore.Checked = True
	DisplayHidden
	NPPossMarkedNoPosBefore_onclick = True
End Function
Private Function NPPossMarkedNoPosBeforePrompt_onclick() As Boolean
	NPPossMarkedNoPosBefore_onclick
	NPPossMarkedNoPosBeforePrompt_onclick = True
End Function

Private Function NPPossMarkedNoPosAfter_onclick() As Boolean
	NPPossMarkedNoPosAfter.Checked = True
	DisplayHidden
	NPPossMarkedNoPosAfter_onclick = True
End Function
Private Function NPPossMarkedNoPosAfterPrompt_onclick() As Boolean
	NPPossMarkedNoPosAfter_onclick
	NPPossMarkedNoPosAfterPrompt_onclick = True
End Function

Private Function NPPossMarkedNoPosEitherSide_onclick() As Boolean
	NPPossMarkedNoPosEitherSide.Checked = True
	DisplayHidden
	NPPossMarkedNoPosEitherSide_onclick = True
End Function
Private Function NPPossMarkedNoPosEitherSidePrompt_onclick() As Boolean
	NPPossMarkedNoPosEitherSide_onclick
	NPPossMarkedNoPosEitherSidePrompt_onclick = True
End Function

Private Function NPPossMarkedYesAffix_onclick() As Boolean
	NPPossMarkedYesAffix.Checked = True
	DisplayHidden
	NPPossMarkedYesAffix_onclick = True
End Function
Private Function NPPossMarkedYesAffixPrompt_onclick() As Boolean
	NPPossMarkedYesAffix_onclick
	NPPossMarkedYesAffixPrompt_onclick = True
End Function

Private Function NPPossMarkedYesAffixPosBefore_onclick() As Boolean
	NPPossMarkedYesAffixPosBefore.Checked = True
	DisplayHidden
	NPPossMarkedYesAffixPosBefore_onclick = True
End Function
Private Function NPPossMarkedYesAffixPosBeforePrompt_onclick() As Boolean
	NPPossMarkedYesAffixPosBefore_onclick
	NPPossMarkedYesAffixPosBeforePrompt_onclick = True
End Function

Private Function NPPossMarkedYesAffixPosAfter_onclick() As Boolean
	NPPossMarkedYesAffixPosAfter.Checked = True
	DisplayHidden
	NPPossMarkedYesAffixPosAfter_onclick = True
End Function
Private Function NPPossMarkedYesAffixPosAfterPrompt_onclick() As Boolean
	NPPossMarkedYesAffixPosAfter_onclick
	NPPossMarkedYesAffixPosAfterPrompt_onclick = True
End Function

Private Function NPPossMarkedYesAffixPosEitherSide_onclick() As Boolean
	NPPossMarkedYesAffixPosEitherSide.Checked = True
	DisplayHidden
	NPPossMarkedYesAffixPosEitherSide_onclick = True
End Function
Private Function NPPossMarkedYesAffixPosEitherSidePrompt_onclick() As Boolean
	NPPossMarkedYesAffixPosEitherSide_onclick
	NPPossMarkedYesAffixPosEitherSidePrompt_onclick = True
End Function

Private Function NPPossMarkedYesClitic_onclick() As Boolean
	NPPossMarkedYesClitic.Checked = True
	DisplayHidden
	NPPossMarkedYesClitic_onclick = True
End Function
Private Function NPPossMarkedYesCliticPrompt_onclick() As Boolean
	NPPossMarkedYesClitic_onclick
	NPPossMarkedYesCliticPrompt_onclick = True
End Function

Private Function NPPossMarkedYesCliticWordNo_onclick() As Boolean
	NPPossMarkedYesCliticWordNo.Checked = True
	DisplayHidden
	NPPossMarkedYesCliticWordNo_onclick = True
End Function
Private Function NPPossMarkedYesCliticWordNoPrompt_onclick() As Boolean
	NPPossMarkedYesCliticWordNo_onclick
	NPPossMarkedYesCliticWordNoPrompt_onclick = True
End Function

Private Function NPPossMarkedYesCliticWordYes_onclick() As Boolean
	NPPossMarkedYesCliticWordYes.Checked = True
	DisplayHidden
	NPPossMarkedYesCliticWordYes_onclick = True
End Function
Private Function NPPossMarkedYesCliticWordYesPrompt_onclick() As Boolean
	NPPossMarkedYesCliticWordYes_onclick
	NPPossMarkedYesCliticWordYesPrompt_onclick = True
End Function

Private Function NPPossMarkedYesCliticRequiredNo_onclick() As Boolean
	NPPossMarkedYesCliticRequiredNo.Checked = True
	DisplayHidden
	NPPossMarkedYesCliticRequiredNo_onclick = True
End Function
Private Function NPPossMarkedYesCliticRequiredNoPrompt_onclick() As Boolean
	NPPossMarkedYesCliticRequiredNo_onclick
	NPPossMarkedYesCliticRequiredNoPrompt_onclick = True
End Function

Private Function NPPossMarkedYesCliticRequiredYes_onclick() As Boolean
	NPPossMarkedYesCliticRequiredYes.Checked = True
	DisplayHidden
	NPPossMarkedYesCliticRequiredYes_onclick = True
End Function
Private Function NPPossMarkedYesCliticRequiredYesPrompt_onclick() As Boolean
	NPPossMarkedYesCliticRequiredYes_onclick
	NPPossMarkedYesCliticRequiredYesPrompt_onclick = True
End Function

Private Function NPPossMarkedYesCliticRequiredPossPosBefore_onclick() As Boolean
	NPPossMarkedYesCliticRequiredPossPosBefore.Checked = True
	DisplayHidden
	NPPossMarkedYesCliticRequiredPossPosBefore_onclick = True
End Function
Private Function NPPossMarkedYesCliticRequiredPossPosBeforePrompt_onclick() As Boolean
	NPPossMarkedYesCliticRequiredPossPosBefore_onclick
	NPPossMarkedYesCliticRequiredPossPosBeforePrompt_onclick = True
End Function

Private Function NPPossMarkedYesCliticRequiredPossPosAfter_onclick() As Boolean
	NPPossMarkedYesCliticRequiredPossPosAfter.Checked = True
	DisplayHidden
	NPPossMarkedYesCliticRequiredPossPosAfter_onclick = True
End Function
Private Function NPPossMarkedYesCliticRequiredPossPosAfterPrompt_onclick() As Boolean
	NPPossMarkedYesCliticRequiredPossPosAfter_onclick
	NPPossMarkedYesCliticRequiredPossPosAfterPrompt_onclick = True
End Function

Private Function NPPossMarkedYesCliticRequiredNounPosBefore_onclick() As Boolean
	NPPossMarkedYesCliticRequiredNounPosBefore.Checked = True
	DisplayHidden
	NPPossMarkedYesCliticRequiredNounPosBefore_onclick = True
End Function
Private Function NPPossMarkedYesCliticRequiredNounPosBeforePrompt_onclick() As Boolean
	NPPossMarkedYesCliticRequiredNounPosBefore_onclick
	NPPossMarkedYesCliticRequiredNounPosBeforePrompt_onclick = True
End Function

Private Function NPPossMarkedYesCliticRequiredNounPosAfter_onclick() As Boolean
	NPPossMarkedYesCliticRequiredNounPosAfter.Checked = True
	DisplayHidden
	NPPossMarkedYesCliticRequiredNounPosAfter_onclick = True
End Function
Private Function NPPossMarkedYesCliticRequiredNounPosAfterPrompt_onclick() As Boolean
	NPPossMarkedYesCliticRequiredNounPosAfter_onclick
	NPPossMarkedYesCliticRequiredNounPosAfterPrompt_onclick = True
End Function

Private Function NPPossMarkedYesCliticRequiredNounPosEitherSide_onclick() As Boolean
	NPPossMarkedYesCliticRequiredNounPosEitherSide.Checked = True
	DisplayHidden
	NPPossMarkedYesCliticRequiredNounPosEitherSide_onclick = True
End Function
Private Function NPPossMarkedYesCliticRequiredNounPosEitherSidePrompt_onclick() As Boolean
	NPPossMarkedYesCliticRequiredNounPosEitherSide_onclick
	NPPossMarkedYesCliticRequiredNounPosEitherSidePrompt_onclick = True
End Function

Private Function NPPoss2OK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//np/@possMarked")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPPossMarkedNo.Checked) Then sTemp = "no"
	If (NPPossMarkedYesAffix.Checked) Then sTemp = "yesAffix"
	If (NPPossMarkedYesClitic.Checked) Then sTemp = "yesClitic"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@possNounPos1")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (NPPossMarkedNoPosBefore.Checked) Then sTemp = "before"
	If (NPPossMarkedNoPosAfter.Checked) Then sTemp = "after"
	If (NPPossMarkedNoPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@possNounPos2")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (NPPossMarkedYesAffixPosBefore.Checked) Then sTemp = "before"
	If (NPPossMarkedYesAffixPosAfter.Checked) Then sTemp = "after"
	If (NPPossMarkedYesAffixPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@possCliticWord")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPPossMarkedYesCliticWordNo.Checked) Then sTemp = "no"
	If (NPPossMarkedYesCliticWordYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@possCliticRequired")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPPossMarkedYesCliticRequiredNo.Checked) Then sTemp = "no"
	If (NPPossMarkedYesCliticRequiredYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@possCliticPossPos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "before" ' default if all else fails...
	If (NPPossMarkedYesCliticRequiredPossPosBefore.Checked) Then sTemp = "before"
	If (NPPossMarkedYesCliticRequiredPossPosAfter.Checked) Then sTemp = "after"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@possNounPos3")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (NPPossMarkedYesCliticRequiredNounPosBefore.Checked) Then sTemp = "before"
	If (NPPossMarkedYesCliticRequiredNounPosAfter.Checked) Then sTemp = "after"
	If (NPPossMarkedYesCliticRequiredNounPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	NPPoss2OK_onclick = True

	BaseWindow.navigate "NPPossessorAgr.htm"
End Function

Private Function NPPoss2Cancel_onclick() As Boolean
	NPPoss2Cancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (NPPossMarkedNo.Checked) Then
		NPPossMarkedNoTable.Style.display = ""
		NPPossMarkedYesAffixTable.Style.display = "none"
		NPPossMarkedYesCliticTable.Style.display = "none"
		NPPossMarkedYesCliticRequiredTable.Style.display = "none"
		NPPossMarkedYesCliticRequiredPosTable.Style.display = "none"
		NPPossMarkedYesCliticRequiredNounPosTable.Style.display = "none"
		NPPossMarkedYesAffixInstruction.Style.display = "none"
		NPPossMarkedYesCliticWordNoInstruction.Style.display = "none"
		NPPossMarkedYesCliticWordYesInstruction.Style.display = "none"
	ElseIf (NPPossMarkedYesAffix.Checked) Then
		NPPossMarkedNoTable.Style.display = "none"
		NPPossMarkedYesAffixTable.Style.display = ""
		NPPossMarkedYesCliticTable.Style.display = "none"
		NPPossMarkedYesCliticRequiredTable.Style.display = "none"
		NPPossMarkedYesCliticRequiredPosTable.Style.display = "none"
		NPPossMarkedYesCliticRequiredNounPosTable.Style.display = "none"
		NPPossMarkedYesAffixInstruction.Style.display = ""
		NPPossMarkedYesCliticWordNoInstruction.Style.display = "none"
		NPPossMarkedYesCliticWordYesInstruction.Style.display = "none"
	Else
		NPPossMarkedNoTable.Style.display = "none"
		NPPossMarkedYesAffixTable.Style.display = "none"
		NPPossMarkedYesCliticTable.Style.display = ""
		NPPossMarkedYesCliticRequiredTable.Style.display = ""
		NPPossMarkedYesCliticRequiredPosTable.Style.display = ""
		NPPossMarkedYesCliticRequiredNounPosTable.Style.display = ""
		NPPossMarkedYesAffixInstruction.Style.display = "none"
		If (NPPossMarkedYesCliticWordNo.Checked) Then
			NPPossMarkedYesCliticWordNoInstruction.Style.display = ""
			NPPossMarkedYesCliticWordYesInstruction.Style.display = "none"
		Else
			NPPossMarkedYesCliticWordNoInstruction.Style.display = "none"
			NPPossMarkedYesCliticWordYesInstruction.Style.display = ""
		End If
	End If
End Sub
