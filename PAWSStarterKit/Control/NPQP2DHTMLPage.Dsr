VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPQP2DHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5580
   _ExtentX        =   9843
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\NPQP2.htm"
   BuildFile       =   "..\Control\NPQP2.htm"
   BuildMode       =   0
   TypeLibCookie   =   61
   AsyncLoad       =   0   'False
   id              =   "NPQP2DHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPQP2DHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//np/@qpPos")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	sPos = gGetPositionBasedOnSpecifier(attr.Text)
	If (sPos = "before") Then
		NPQPPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		NPQPPosAfter.Checked = True
	Else
		NPQPPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@qpEither")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		NPQPPosEitherSideEitherYes.Checked = True
	Else
		NPQPPosEitherSideEitherNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@qpBoth")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		NPQPPosEitherSideBothNo.Checked = True
	ElseIf (attr.Text = "yesBoth") Then
		NPQPPosEitherSideBothYesBoth.Checked = True
	ElseIf (attr.Text = "yesInitial") Then
		NPQPPosEitherSideBothYesInitial.Checked = True
	Else
		NPQPPosEitherSideBothYesFinal.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@qpBothAfter")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		NPQPPosEitherSideBothYesInitialNo.Checked = True
	Else
		NPQPPosEitherSideBothYesInitialYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@qpBothAfter")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		NPQPPosEitherSideBothYesFinalNo.Checked = True
	Else
		NPQPPosEitherSideBothYesFinalYes.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPQPPosBefore_onclick() As Boolean
	NPQPPosBefore.Checked = True
	DisplayHidden
	NPQPPosBefore_onclick = True
End Function
Private Function NPQPPosBeforePrompt_onclick() As Boolean
	NPQPPosBefore_onclick
	NPQPPosBeforePrompt_onclick = True
End Function

Private Function NPQPPosAfter_onclick() As Boolean
	NPQPPosAfter.Checked = True
	DisplayHidden
	NPQPPosAfter_onclick = True
End Function
Private Function NPQPPosAfterPrompt_onclick() As Boolean
	NPQPPosAfter_onclick
	NPQPPosAfterPrompt_onclick = True
End Function

Private Function NPQPPosEitherSide_onclick() As Boolean
	NPQPPosEitherSide.Checked = True
	DisplayHidden
	NPQPPosEitherSide_onclick = True
End Function
Private Function NPQPPosEitherSidePrompt_onclick() As Boolean
	NPQPPosEitherSide_onclick
	NPQPPosEitherSidePrompt_onclick = True
End Function

Private Function NPQPPosEitherSideEitherYes_onclick() As Boolean
	NPQPPosEitherSideEitherYes.Checked = True
	DisplayHidden
	NPQPPosEitherSideEitherYes_onclick = True
End Function
Private Function NPQPPosEitherSideEitherYesPrompt_onclick() As Boolean
	NPQPPosEitherSideEitherYes_onclick
	NPQPPosEitherSideEitherYesPrompt_onclick = True
End Function

Private Function NPQPPosEitherSideEitherNo_onclick() As Boolean
	NPQPPosEitherSideEitherNo.Checked = True
	DisplayHidden
	NPQPPosEitherSideEitherNo_onclick = True
End Function
Private Function NPQPPosEitherSideEitherNoPrompt_onclick() As Boolean
	NPQPPosEitherSideEitherNo_onclick
	NPQPPosEitherSideEitherNoPrompt_onclick = True
End Function

Private Function NPQPPosEitherSideBothNo_onclick() As Boolean
	NPQPPosEitherSideBothNo.Checked = True
	DisplayHidden
	NPQPPosEitherSideBothNo_onclick = True
End Function
Private Function NPQPPosEitherSideBothNoPrompt_onclick() As Boolean
	NPQPPosEitherSideBothNo_onclick
	NPQPPosEitherSideBothNoPrompt_onclick = True
End Function

Private Function NPQPPosEitherSideBothYesBoth_onclick() As Boolean
	NPQPPosEitherSideBothYesBoth.Checked = True
	DisplayHidden
	NPQPPosEitherSideBothYesBoth_onclick = True
End Function
Private Function NPQPPosEitherSideBothYesBothPrompt_onclick() As Boolean
	NPQPPosEitherSideBothYesBoth_onclick
	NPQPPosEitherSideBothYesBothPrompt_onclick = True
End Function

Private Function NPQPPosEitherSideBothYesInitial_onclick() As Boolean
	NPQPPosEitherSideBothYesInitial.Checked = True
	DisplayHidden
	NPQPPosEitherSideBothYesInitial_onclick = True
End Function
Private Function NPQPPosEitherSideBothYesInitialPrompt_onclick() As Boolean
	NPQPPosEitherSideBothYesInitial_onclick
	NPQPPosEitherSideBothYesInitialPrompt_onclick = True
End Function

Private Function NPQPPosEitherSideBothYesInitialNo_onclick() As Boolean
	NPQPPosEitherSideBothYesInitialNo.Checked = True
	DisplayHidden
	NPQPPosEitherSideBothYesInitialNo_onclick = True
End Function
Private Function NPQPPosEitherSideBothYesInitialNoPrompt_onclick() As Boolean
	NPQPPosEitherSideBothYesInitialNo_onclick
	NPQPPosEitherSideBothYesInitialNoPrompt_onclick = True
End Function

Private Function NPQPPosEitherSideBothYesInitialYes_onclick() As Boolean
	NPQPPosEitherSideBothYesInitialYes.Checked = True
	DisplayHidden
	NPQPPosEitherSideBothYesInitialYes_onclick = True
End Function
Private Function NPQPPosEitherSideBothYesInitialYesPrompt_onclick() As Boolean
	NPQPPosEitherSideBothYesInitialYes_onclick
	NPQPPosEitherSideBothYesInitialYesPrompt_onclick = True
End Function

Private Function NPQPPosEitherSideBothYesFinal_onclick() As Boolean
	NPQPPosEitherSideBothYesFinal.Checked = True
	DisplayHidden
	NPQPPosEitherSideBothYesFinal_onclick = True
End Function
Private Function NPQPPosEitherSideBothYesFinalPrompt_onclick() As Boolean
	NPQPPosEitherSideBothYesFinal_onclick
	NPQPPosEitherSideBothYesFinalPrompt_onclick = True
End Function

Private Function NPQPPosEitherSideBothYesFinalNo_onclick() As Boolean
	NPQPPosEitherSideBothYesFinalNo.Checked = True
	DisplayHidden
	NPQPPosEitherSideBothYesFinalNo_onclick = True
End Function
Private Function NPQPPosEitherSideBothYesFinalNoPrompt_onclick() As Boolean
	NPQPPosEitherSideBothYesFinalNo_onclick
	NPQPPosEitherSideBothYesFinalNoPrompt_onclick = True
End Function

Private Function NPQPPosEitherSideBothYesFinalYes_onclick() As Boolean
	NPQPPosEitherSideBothYesFinalYes.Checked = True
	DisplayHidden
	NPQPPosEitherSideBothYesFinalYes_onclick = True
End Function
Private Function NPQPPosEitherSideBothYesFinalYesPrompt_onclick() As Boolean
	NPQPPosEitherSideBothYesFinalYes_onclick
	NPQPPosEitherSideBothYesFinalYesPrompt_onclick = True
End Function

Private Function NPQP2OK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//np/@qpPos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (NPQPPosBefore.Checked) Then sTemp = "before"
	If (NPQPPosAfter.Checked) Then sTemp = "after"
	If (NPQPPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@qpEither")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPQPPosEitherSideEitherYes.Checked) Then sTemp = "yes"
	If (NPQPPosEitherSideEitherNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@qpBoth")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPQPPosEitherSideBothNo.Checked) Then sTemp = "no"
	If (NPQPPosEitherSideBothYesBoth.Checked) Then sTemp = "yesBoth"
	If (NPQPPosEitherSideBothYesInitial.Checked) Then sTemp = "yesInitial"
	If (NPQPPosEitherSideBothYesFinal.Checked) Then sTemp = "yesFinal"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@qpBothAfter")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPQPPosEitherSideBothYesInitialNo.Checked) Then sTemp = "no"
	If (NPQPPosEitherSideBothYesInitialYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@qpBothAfter")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPQPPosEitherSideBothYesFinalNo.Checked) Then sTemp = "no"
	If (NPQPPosEitherSideBothYesFinalYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	NPQP2OK_onclick = True

	BaseWindow.navigate "NPContents.htm"
End Function

Private Function NPQP2Cancel_onclick() As Boolean
	NPQP2Cancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (NPQPPosEitherSide.Checked) Then
		NPQPPosEitherSideEitherTable.Style.display = ""
		NPQPPosEitherSideBothTable.Style.display = ""
		If (NPQPPosEitherSideBothYesInitial.Checked) Then
			NPQPPosEitherSideBothYesInitialTable.Style.display = ""
		Else
			NPQPPosEitherSideBothYesInitialTable.Style.display = "none"
		End If
		If (NPQPPosEitherSideBothYesFinal.Checked) Then
			NPQPPosEitherSideBothYesFinalTable.Style.display = ""
		Else
			NPQPPosEitherSideBothYesFinalTable.Style.display = "none"
		End If
		If (NPQPPosEitherSideEitherNo.Checked) Then
			NPQPPosEitherSideEitherNoInstruction.Style.display = ""
		Else
			NPQPPosEitherSideEitherNoInstruction.Style.display = "none"
		End If
	Else
		NPQPPosEitherSideEitherTable.Style.display = "none"
		NPQPPosEitherSideBothTable.Style.display = "none"
		NPQPPosEitherSideBothYesInitialTable.Style.display = "none"
		NPQPPosEitherSideBothYesFinalTable.Style.display = "none"
		NPQPPosEitherSideEitherNoInstruction.Style.display = "none"
	End If

End Sub
