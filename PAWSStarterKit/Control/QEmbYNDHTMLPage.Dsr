VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} QEmbYNDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   _ExtentX        =   11906
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\QEmbYN.htm"
   BuildFile       =   "..\Control\QEmbYN.htm"
   BuildMode       =   0
   TypeLibCookie   =   41
   AsyncLoad       =   0   'False
   id              =   "QEmbYNDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "QEmbYNDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//q/@embYN")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		QEmbYNYes.Checked = True
	ElseIf (attr.Text = "noAux") Then
		QEmbYNNoAux.Checked = True
	Else
		QEmbYNNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embYNWord")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QEmbYNWordNo.Checked = True
	Else
		QEmbYNWordYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embYNPos")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	sPos = gGetPositionBasedOnHead(attr.Text)
	If (sPos = "before") Then
		QEmbYNPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		QEmbYNPosAfter.Checked = True
	Else
		QEmbYNPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embYNEither")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		QEmbYNEitherYes.Checked = True
	Else
		QEmbYNEitherNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embYNBoth")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QEmbYNBothNo.Checked = True
	ElseIf (attr.Text = "yesBoth") Then
		QEmbYNBothYesBoth.Checked = True
	ElseIf (attr.Text = "yesInitial") Then
		QEmbYNBothYesInitial.Checked = True
	Else
		QEmbYNBothYesFinal.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embYNBothInitialFinal")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QEmbYNBothInitialFinalNo.Checked = True
	Else
		QEmbYNBothInitialFinalYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embYNBothFinalInitial")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QEmbYNBothFinalInitialNo.Checked = True
	Else
		QEmbYNBothFinalInitialYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embYNAuxPos")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	sPos = gGetPositionBasedOnHead(attr.Text)
	If (sPos = "before") Then
		QEmbYNAuxPosBefore.Checked = True
	Else
		QEmbYNAuxPosAfter.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function QEmbYNYes_onclick() As Boolean
	QEmbYNYes.Checked = True
	DisplayHidden
	QEmbYNYes_onclick = True
End Function
Private Function QEmbYNYesPrompt_onclick() As Boolean
	QEmbYNYes_onclick
	QEmbYNYesPrompt_onclick = True
End Function

Private Function QEmbYNWordNo_onclick() As Boolean
	QEmbYNWordNo.Checked = True
	DisplayHidden
	QEmbYNWordNo_onclick = True
End Function
Private Function QEmbYNWordNoPrompt_onclick() As Boolean
	QEmbYNWordNo_onclick
	QEmbYNWordNoPrompt_onclick = True
End Function

Private Function QEmbYNWordYes_onclick() As Boolean
	QEmbYNWordYes.Checked = True
	DisplayHidden
	QEmbYNWordYes_onclick = True
End Function
Private Function QEmbYNWordYesPrompt_onclick() As Boolean
	QEmbYNWordYes_onclick
	QEmbYNWordYesPrompt_onclick = True
End Function

Private Function QEmbYNPosBefore_onclick() As Boolean
	QEmbYNPosBefore.Checked = True
	DisplayHidden
	QEmbYNPosBefore_onclick = True
End Function
Private Function QEmbYNPosBeforePrompt_onclick() As Boolean
	QEmbYNPosBefore_onclick
	QEmbYNPosBeforePrompt_onclick = True
End Function

Private Function QEmbYNPosAfter_onclick() As Boolean
	QEmbYNPosAfter.Checked = True
	DisplayHidden
	QEmbYNPosAfter_onclick = True
End Function
Private Function QEmbYNPosAfterPrompt_onclick() As Boolean
	QEmbYNPosAfter_onclick
	QEmbYNPosAfterPrompt_onclick = True
End Function

Private Function QEmbYNPosEitherSide_onclick() As Boolean
	QEmbYNPosEitherSide.Checked = True
	DisplayHidden
	QEmbYNPosEitherSide_onclick = True
End Function
Private Function QEmbYNPosEitherSidePrompt_onclick() As Boolean
	QEmbYNPosEitherSide_onclick
	QEmbYNPosEitherSidePrompt_onclick = True
End Function

Private Function QEmbYNEitherYes_onclick() As Boolean
	QEmbYNEitherYes.Checked = True
	DisplayHidden
	QEmbYNEitherYes_onclick = True
End Function
Private Function QEmbYNEitherYesPrompt_onclick() As Boolean
	QEmbYNEitherYes_onclick
	QEmbYNEitherYesPrompt_onclick = True
End Function

Private Function QEmbYNEitherNo_onclick() As Boolean
	QEmbYNEitherNo.Checked = True
	DisplayHidden
	QEmbYNEitherNo_onclick = True
End Function
Private Function QEmbYNEitherNoPrompt_onclick() As Boolean
	QEmbYNEitherNo_onclick
	QEmbYNEitherNoPrompt_onclick = True
End Function

Private Function QEmbYNBothNo_onclick() As Boolean
	QEmbYNBothNo.Checked = True
	DisplayHidden
	QEmbYNBothNo_onclick = True
End Function
Private Function QEmbYNBothNoPrompt_onclick() As Boolean
	QEmbYNBothNo_onclick
	QEmbYNBothNoPrompt_onclick = True
End Function

Private Function QEmbYNBothYesBoth_onclick() As Boolean
	QEmbYNBothYesBoth.Checked = True
	DisplayHidden
	QEmbYNBothYesBoth_onclick = True
End Function
Private Function QEmbYNBothYesBothPrompt_onclick() As Boolean
	QEmbYNBothYesBoth_onclick
	QEmbYNBothYesBothPrompt_onclick = True
End Function

Private Function QEmbYNBothYesInitial_onclick() As Boolean
	QEmbYNBothYesInitial.Checked = True
	DisplayHidden
	QEmbYNBothYesInitial_onclick = True
End Function
Private Function QEmbYNBothYesInitialPrompt_onclick() As Boolean
	QEmbYNBothYesInitial_onclick
	QEmbYNBothYesInitialPrompt_onclick = True
End Function

Private Function QEmbYNBothInitialFinalNo_onclick() As Boolean
	QEmbYNBothInitialFinalNo.Checked = True
	DisplayHidden
	QEmbYNBothInitialFinalNo_onclick = True
End Function
Private Function QEmbYNBothInitialFinalNoPrompt_onclick() As Boolean
	QEmbYNBothInitialFinalNo_onclick
	QEmbYNBothInitialFinalNoPrompt_onclick = True
End Function

Private Function QEmbYNBothInitialFinalYes_onclick() As Boolean
	QEmbYNBothInitialFinalYes.Checked = True
	DisplayHidden
	QEmbYNBothInitialFinalYes_onclick = True
End Function
Private Function QEmbYNBothInitialFinalYesPrompt_onclick() As Boolean
	QEmbYNBothInitialFinalYes_onclick
	QEmbYNBothInitialFinalYesPrompt_onclick = True
End Function

Private Function QEmbYNBothYesFinal_onclick() As Boolean
	QEmbYNBothYesFinal.Checked = True
	DisplayHidden
	QEmbYNBothYesFinal_onclick = True
End Function
Private Function QEmbYNBothYesFinalPrompt_onclick() As Boolean
	QEmbYNBothYesFinal_onclick
	QEmbYNBothYesFinalPrompt_onclick = True
End Function

Private Function QEmbYNBothFinalInitialNo_onclick() As Boolean
	QEmbYNBothFinalInitialNo.Checked = True
	DisplayHidden
	QEmbYNBothFinalInitialNo_onclick = True
End Function
Private Function QEmbYNBothFinalInitialNoPrompt_onclick() As Boolean
	QEmbYNBothFinalInitialNo_onclick
	QEmbYNBothFinalInitialNoPrompt_onclick = True
End Function

Private Function QEmbYNBothFinalInitialYes_onclick() As Boolean
	QEmbYNBothFinalInitialYes.Checked = True
	DisplayHidden
	QEmbYNBothFinalInitialYes_onclick = True
End Function
Private Function QEmbYNBothFinalInitialYesPrompt_onclick() As Boolean
	QEmbYNBothFinalInitialYes_onclick
	QEmbYNBothFinalInitialYesPrompt_onclick = True
End Function

Private Function QEmbYNNoAux_onclick() As Boolean
	QEmbYNNoAux.Checked = True
	DisplayHidden
	QEmbYNNoAux_onclick = True
End Function
Private Function QEmbYNNoAuxPrompt_onclick() As Boolean
	QEmbYNNoAux_onclick
	QEmbYNNoAuxPrompt_onclick = True
End Function

Private Function QEmbYNAuxPosBefore_onclick() As Boolean
	QEmbYNAuxPosBefore.Checked = True
	DisplayHidden
	QEmbYNAuxPosBefore_onclick = True
End Function
Private Function QEmbYNAuxPosBeforePrompt_onclick() As Boolean
	QEmbYNAuxPosBefore_onclick
	QEmbYNAuxPosBeforePrompt_onclick = True
End Function

Private Function QEmbYNAuxPosAfter_onclick() As Boolean
	QEmbYNAuxPosAfter.Checked = True
	DisplayHidden
	QEmbYNAuxPosAfter_onclick = True
End Function
Private Function QEmbYNAuxPosAfterPrompt_onclick() As Boolean
	QEmbYNAuxPosAfter_onclick
	QEmbYNAuxPosAfterPrompt_onclick = True
End Function

Private Function QEmbYNNo_onclick() As Boolean
	QEmbYNNo.Checked = True
	DisplayHidden
	QEmbYNNo_onclick = True
End Function
Private Function QEmbYNNoPrompt_onclick() As Boolean
	QEmbYNNo_onclick
	QEmbYNNoPrompt_onclick = True
End Function

Private Function QEmbYNOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//q/@embYN")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QEmbYNYes.Checked) Then sTemp = "yes"
	If (QEmbYNNoAux.Checked) Then sTemp = "noAux"
	If (QEmbYNNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embYNWord")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QEmbYNWordNo.Checked) Then sTemp = "no"
	If (QEmbYNWordYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embYNPos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (QEmbYNPosBefore.Checked) Then sTemp = "before"
	If (QEmbYNPosAfter.Checked) Then sTemp = "after"
	If (QEmbYNPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embYNEither")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QEmbYNEitherYes.Checked) Then sTemp = "yes"
	If (QEmbYNEitherNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embYNBoth")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QEmbYNBothNo.Checked) Then sTemp = "no"
	If (QEmbYNBothYesBoth.Checked) Then sTemp = "yesBoth"
	If (QEmbYNBothYesInitial.Checked) Then sTemp = "yesInitial"
	If (QEmbYNBothYesFinal.Checked) Then sTemp = "yesFinal"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embYNBothInitialFinal")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QEmbYNBothInitialFinalNo.Checked) Then sTemp = "no"
	If (QEmbYNBothInitialFinalYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embYNBothFinalInitial")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QEmbYNBothFinalInitialNo.Checked) Then sTemp = "no"
	If (QEmbYNBothFinalInitialYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embYNAuxPos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (QEmbYNAuxPosBefore.Checked) Then sTemp = "before"
	If (QEmbYNAuxPosAfter.Checked) Then sTemp = "after"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	QEmbYNOK_onclick = True

	BaseWindow.navigate "QCont.htm"
End Function

Private Function QEmbYNCancel_onclick() As Boolean
	QEmbYNCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (QEmbYNNo.Checked) Then
		QEmbYNWordTable.Style.display = "none"
		QEmbYNPosTable.Style.display = "none"
		QEmbYNEitherTable.Style.display = "none"
		QEmbYNBothTable.Style.display = "none"
		QEmbYNBothInitialFinalTable.Style.display = "none"
		QEmbYNBothFinalInitialTable.Style.display = "none"
		QEmbYNAuxPosTable.Style.display = "none"
		QEmbYNWordNoInstruction.Style.display = "none"
		QEmbYNWordYesInstruction.Style.display = "none"
		QEmbYNEitherNoInstruction.Style.display = "none"
	ElseIf (QEmbYNNoAux.Checked) Then
		QEmbYNWordTable.Style.display = "none"
		QEmbYNPosTable.Style.display = "none"
		QEmbYNEitherTable.Style.display = "none"
		QEmbYNBothTable.Style.display = "none"
		QEmbYNBothInitialFinalTable.Style.display = "none"
		QEmbYNBothFinalInitialTable.Style.display = "none"
		QEmbYNAuxPosTable.Style.display = ""
		QEmbYNWordNoInstruction.Style.display = "none"
		QEmbYNWordYesInstruction.Style.display = "none"
		QEmbYNEitherNoInstruction.Style.display = "none"
	Else
		QEmbYNWordTable.Style.display = ""
		QEmbYNPosTable.Style.display = ""
		QEmbYNBothTable.Style.display = ""
		QEmbYNEitherNoInstruction.Style.display = "none" ' assume it won't show
		QEmbYNAuxPosTable.Style.display = "none"
		If (QEmbYNWordYes.Checked) Then
			QEmbYNWordNoInstruction.Style.display = "none"
			QEmbYNWordYesInstruction.Style.display = ""
		Else
			QEmbYNWordNoInstruction.Style.display = ""
			QEmbYNWordYesInstruction.Style.display = "none"
		End If
		If (QEmbYNPosEitherSide.Checked) Then
			QEmbYNEitherTable.Style.display = ""
			If (QEmbYNEitherNo.Checked) Then
				QEmbYNEitherNoInstruction.Style.display = "" ' assumption was wrong, so show it
			End If
			QEmbYNBothTable.Style.display = ""
			If (QEmbYNBothYesInitial.Checked) Then
				QEmbYNBothInitialFinalTable.Style.display = ""
			Else
				QEmbYNBothInitialFinalTable.Style.display = "none"
			End If
			If (QEmbYNBothYesFinal.Checked) Then
				QEmbYNBothFinalInitialTable.Style.display = ""
			Else
				QEmbYNBothFinalInitialTable.Style.display = "none"
			End If
		Else
			QEmbYNEitherTable.Style.display = "none"
			QEmbYNBothTable.Style.display = "none"
			QEmbYNBothInitialFinalTable.Style.display = "none"
			QEmbYNBothFinalInitialTable.Style.display = "none"
		End If
	End If
End Sub
