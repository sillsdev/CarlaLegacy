VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} QMainYNDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   _ExtentX        =   11906
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\QMainYN.htm"
   BuildFile       =   "..\Control\QMainYN.htm"
   BuildMode       =   0
   TypeLibCookie   =   113
   AsyncLoad       =   0   'False
   id              =   "QMainYNDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "QMainYNDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//q/@mainYN")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		QMainYNYes.Checked = True
	ElseIf (attr.Text = "noAux") Then
		QMainYNNoAux.Checked = True
	Else
		QMainYNNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainYNWord")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QMainYNWordNo.Checked = True
	Else
		QMainYNWordYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainYNPos")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	sPos = gGetPositionBasedOnHead(attr.Text)
	If (sPos = "before") Then
		QMainYNPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		QMainYNPosAfter.Checked = True
	Else
		QMainYNPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainYNEither")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		QMainYNEitherYes.Checked = True
	Else
		QMainYNEitherNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainYNBoth")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QMainYNBothNo.Checked = True
	ElseIf (attr.Text = "yesBoth") Then
		QMainYNBothYesBoth.Checked = True
	ElseIf (attr.Text = "yesInitial") Then
		QMainYNBothYesInitial.Checked = True
	Else
		QMainYNBothYesFinal.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainYNBothInitialFinal")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QMainYNBothInitialFinalNo.Checked = True
	Else
		QMainYNBothInitialFinalYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainYNBothFinalInitial")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QMainYNBothFinalInitialNo.Checked = True
	Else
		QMainYNBothFinalInitialYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainYNAuxPos")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	sPos = gGetPositionBasedOnHead(attr.Text)
	If (sPos = "before") Then
		QMainYNAuxPosBefore.Checked = True
	Else
		QMainYNAuxPosAfter.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function QMainYNYes_onclick() As Boolean
	QMainYNYes.Checked = True
	DisplayHidden
	QMainYNYes_onclick = True
End Function
Private Function QMainYNYesPrompt_onclick() As Boolean
	QMainYNYes_onclick
	QMainYNYesPrompt_onclick = True
End Function

Private Function QMainYNNoAux_onclick() As Boolean
	QMainYNNoAux.Checked = True
	DisplayHidden
	QMainYNNoAux_onclick = True
End Function
Private Function QMainYNNoAuxPrompt_onclick() As Boolean
	QMainYNNoAux_onclick
	QMainYNNoAuxPrompt_onclick = True
End Function

Private Function QMainYNNo_onclick() As Boolean
	QMainYNNo.Checked = True
	DisplayHidden
	QMainYNNo_onclick = True
End Function
Private Function QMainYNNoPrompt_onclick() As Boolean
	QMainYNNo_onclick
	QMainYNNoPrompt_onclick = True
End Function

Private Function QMainYNWordNo_onclick() As Boolean
	QMainYNWordNo.Checked = True
	DisplayHidden
	QMainYNWordNo_onclick = True
End Function
Private Function QMainYNWordNoPrompt_onclick() As Boolean
	QMainYNWordNo_onclick
	QMainYNWordNoPrompt_onclick = True
End Function

Private Function QMainYNWordYes_onclick() As Boolean
	QMainYNWordYes.Checked = True
	DisplayHidden
	QMainYNWordYes_onclick = True
End Function
Private Function QMainYNWordYesPrompt_onclick() As Boolean
	QMainYNWordYes_onclick
	QMainYNWordYesPrompt_onclick = True
End Function

Private Function QMainYNPosBefore_onclick() As Boolean
	QMainYNPosBefore.Checked = True
	DisplayHidden
	QMainYNPosBefore_onclick = True
End Function
Private Function QMainYNPosBeforePrompt_onclick() As Boolean
	QMainYNPosBefore_onclick
	QMainYNPosBeforePrompt_onclick = True
End Function

Private Function QMainYNPosAfter_onclick() As Boolean
	QMainYNPosAfter.Checked = True
	DisplayHidden
	QMainYNPosAfter_onclick = True
End Function
Private Function QMainYNPosAfterPrompt_onclick() As Boolean
	QMainYNPosAfter_onclick
	QMainYNPosAfterPrompt_onclick = True
End Function

Private Function QMainYNPosEitherSide_onclick() As Boolean
	QMainYNPosEitherSide.Checked = True
	DisplayHidden
	QMainYNPosEitherSide_onclick = True
End Function
Private Function QMainYNPosEitherSidePrompt_onclick() As Boolean
	QMainYNPosEitherSide_onclick
	QMainYNPosEitherSidePrompt_onclick = True
End Function

Private Function QMainYNEitherYes_onclick() As Boolean
	QMainYNEitherYes.Checked = True
	DisplayHidden
	QMainYNEitherYes_onclick = True
End Function
Private Function QMainYNEitherYesPrompt_onclick() As Boolean
	QMainYNEitherYes_onclick
	QMainYNEitherYesPrompt_onclick = True
End Function

Private Function QMainYNEitherNo_onclick() As Boolean
	QMainYNEitherNo.Checked = True
	DisplayHidden
	QMainYNEitherNo_onclick = True
End Function
Private Function QMainYNEitherNoPrompt_onclick() As Boolean
	QMainYNEitherNo_onclick
	QMainYNEitherNoPrompt_onclick = True
End Function

Private Function QMainYNBothNo_onclick() As Boolean
	QMainYNBothNo.Checked = True
	DisplayHidden
	QMainYNBothNo_onclick = True
End Function
Private Function QMainYNBothNoPrompt_onclick() As Boolean
	QMainYNBothNo_onclick
	QMainYNBothNoPrompt_onclick = True
End Function

Private Function QMainYNBothYesBoth_onclick() As Boolean
	QMainYNBothYesBoth.Checked = True
	DisplayHidden
	QMainYNBothYesBoth_onclick = True
End Function
Private Function QMainYNBothYesBothPrompt_onclick() As Boolean
	QMainYNBothYesBoth_onclick
	QMainYNBothYesBothPrompt_onclick = True
End Function

Private Function QMainYNBothYesInitial_onclick() As Boolean
	QMainYNBothYesInitial.Checked = True
	DisplayHidden
	QMainYNBothYesInitial_onclick = True
End Function
Private Function QMainYNBothYesInitialPrompt_onclick() As Boolean
	QMainYNBothYesInitial_onclick
	QMainYNBothYesInitialPrompt_onclick = True
End Function

Private Function QMainYNBothYesFinal_onclick() As Boolean
	QMainYNBothYesFinal.Checked = True
	DisplayHidden
	QMainYNBothYesFinal_onclick = True
End Function
Private Function QMainYNBothYesFinalPrompt_onclick() As Boolean
	QMainYNBothYesFinal_onclick
	QMainYNBothYesFinalPrompt_onclick = True
End Function

Private Function QMainYNBothInitialFinalNo_onclick() As Boolean
	QMainYNBothInitialFinalNo.Checked = True
	DisplayHidden
	QMainYNBothInitialFinalNo_onclick = True
End Function
Private Function QMainYNBothInitialFinalNoPrompt_onclick() As Boolean
	QMainYNBothInitialFinalNo_onclick
	QMainYNBothInitialFinalNoPrompt_onclick = True
End Function

Private Function QMainYNBothInitialFinalYes_onclick() As Boolean
	QMainYNBothInitialFinalYes.Checked = True
	DisplayHidden
	QMainYNBothInitialFinalYes_onclick = True
End Function
Private Function QMainYNBothInitialFinalYesPrompt_onclick() As Boolean
	QMainYNBothInitialFinalYes_onclick
	QMainYNBothInitialFinalYesPrompt_onclick = True
End Function

Private Function QMainYNBothFinalInitialNo_onclick() As Boolean
	QMainYNBothFinalInitialNo.Checked = True
	DisplayHidden
	QMainYNBothFinalInitialNo_onclick = True
End Function
Private Function QMainYNBothFinalInitialNoPrompt_onclick() As Boolean
	QMainYNBothFinalInitialNo_onclick
	QMainYNBothFinalInitialNoPrompt_onclick = True
End Function

Private Function QMainYNBothFinalInitialYes_onclick() As Boolean
	QMainYNBothFinalInitialYes.Checked = True
	DisplayHidden
	QMainYNBothFinalInitialYes_onclick = True
End Function
Private Function QMainYNBothFinalInitialYesPrompt_onclick() As Boolean
	QMainYNBothFinalInitialYes_onclick
	QMainYNBothFinalInitialYesPrompt_onclick = True
End Function

Private Function QMainYNAuxPosBefore_onclick() As Boolean
	QMainYNAuxPosBefore.Checked = True
	DisplayHidden
	QMainYNAuxPosBefore_onclick = True
End Function
Private Function QMainYNAuxPosBeforePrompt_onclick() As Boolean
	QMainYNAuxPosBefore_onclick
	QMainYNAuxPosBeforePrompt_onclick = True
End Function

Private Function QMainYNAuxPosAfter_onclick() As Boolean
	QMainYNAuxPosAfter.Checked = True
	DisplayHidden
	QMainYNAuxPosAfter_onclick = True
End Function
Private Function QMainYNAuxPosAfterPrompt_onclick() As Boolean
	QMainYNAuxPosAfter_onclick
	QMainYNAuxPosAfterPrompt_onclick = True
End Function

Private Function QMainYNOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//q/@mainYN")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainYNYes.Checked) Then sTemp = "yes"
	If (QMainYNNoAux.Checked) Then sTemp = "noAux"
	If (QMainYNNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainYNWord")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainYNWordNo.Checked) Then sTemp = "no"
	If (QMainYNWordYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainYNPos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (QMainYNPosBefore.Checked) Then sTemp = "before"
	If (QMainYNPosAfter.Checked) Then sTemp = "after"
	If (QMainYNPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainYNEither")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainYNEitherYes.Checked) Then sTemp = "yes"
	If (QMainYNEitherNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainYNBoth")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainYNBothNo.Checked) Then sTemp = "no"
	If (QMainYNBothYesBoth.Checked) Then sTemp = "yesBoth"
	If (QMainYNBothYesInitial.Checked) Then sTemp = "yesInitial"
	If (QMainYNBothYesFinal.Checked) Then sTemp = "yesFinal"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainYNBothInitialFinal")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainYNBothInitialFinalNo.Checked) Then sTemp = "no"
	If (QMainYNBothInitialFinalYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainYNBothFinalInitial")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainYNBothFinalInitialNo.Checked) Then sTemp = "no"
	If (QMainYNBothFinalInitialYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainYNAuxPos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (QMainYNAuxPosBefore.Checked) Then sTemp = "before"
	If (QMainYNAuxPosAfter.Checked) Then sTemp = "after"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	QMainYNOK_onclick = True

	BaseWindow.navigate "QEmbYN.htm"
End Function

Private Function QMainYNCancel_onclick() As Boolean
	QMainYNCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (QMainYNNo.Checked) Then
		QMainYNWordTable.Style.display = "none"
		QMainYNPosTable.Style.display = "none"
		QMainYNEitherTable.Style.display = "none"
		QMainYNBothTable.Style.display = "none"
		QMainYNBothInitialFinalTable.Style.display = "none"
		QMainYNBothFinalInitialTable.Style.display = "none"
		QMainYNAuxPosTable.Style.display = "none"
		QMainYNWordNoInstruction.Style.display = "none"
		QMainYNWordYesInstruction.Style.display = "none"
		QMainYNEitherNoInstruction.Style.display = "none"
	ElseIf (QMainYNNoAux.Checked) Then
		QMainYNWordTable.Style.display = "none"
		QMainYNPosTable.Style.display = "none"
		QMainYNEitherTable.Style.display = "none"
		QMainYNBothTable.Style.display = "none"
		QMainYNBothInitialFinalTable.Style.display = "none"
		QMainYNBothFinalInitialTable.Style.display = "none"
		QMainYNAuxPosTable.Style.display = ""
		QMainYNWordNoInstruction.Style.display = "none"
		QMainYNWordYesInstruction.Style.display = "none"
		QMainYNEitherNoInstruction.Style.display = "none"
	Else
		QMainYNWordTable.Style.display = ""
		QMainYNPosTable.Style.display = ""
		QMainYNBothTable.Style.display = ""
		QMainYNEitherNoInstruction.Style.display = "none" ' assume it won't show
		QMainYNAuxPosTable.Style.display = "none"
		If (QMainYNWordYes.Checked) Then
			QMainYNWordNoInstruction.Style.display = "none"
			QMainYNWordYesInstruction.Style.display = ""
		Else
			QMainYNWordNoInstruction.Style.display = ""
			QMainYNWordYesInstruction.Style.display = "none"
		End If
		If (QMainYNPosEitherSide.Checked) Then
			QMainYNEitherTable.Style.display = ""
			If (QMainYNEitherNo.Checked) Then
				QMainYNEitherNoInstruction.Style.display = "" ' assumption was wrong, so show it
			End If
			QMainYNBothTable.Style.display = ""
			If (QMainYNBothYesInitial.Checked) Then
				QMainYNBothInitialFinalTable.Style.display = ""
			Else
				QMainYNBothInitialFinalTable.Style.display = "none"
			End If
			If (QMainYNBothYesFinal.Checked) Then
				QMainYNBothFinalInitialTable.Style.display = ""
			Else
				QMainYNBothFinalInitialTable.Style.display = "none"
			End If
		Else
			QMainYNEitherTable.Style.display = "none"
			QMainYNBothTable.Style.display = "none"
			QMainYNBothInitialFinalTable.Style.display = "none"
			QMainYNBothFinalInitialTable.Style.display = "none"
		End If
	End If

End Sub
