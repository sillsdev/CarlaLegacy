VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} QEmbContDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   _ExtentX        =   11906
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\QEmbCont.htm"
   BuildFile       =   "..\Control\QEmbCont.htm"
   BuildMode       =   0
   TypeLibCookie   =   51
   AsyncLoad       =   0   'False
   id              =   "QEmbContDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "QEmbContDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//q/@embCont")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yesSameYN") Then
		QEmbContYesSameYN.Checked = True
	ElseIf (attr.Text = "yesSameCont") Then
		QEmbContYesSameCont.Checked = True
	ElseIf (attr.Text = "yesDiff") Then
		QEmbContYesDiff.Checked = True
	ElseIf (attr.Text = "noAux") Then
		QEmbContNoAux.Checked = True
	Else
		QEmbContNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embContWord")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QEmbContWordNo.Checked = True
	Else
		QEmbContWordYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embContPosAsEmbYNPos")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		QEmbContPosAsEmbYNPosYes.Checked = True
	Else
		QEmbContPosAsEmbYNPosNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embContPos")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	sPos = gGetPositionBasedOnHead(attr.Text)
	If (sPos = "before") Then
		QEmbContPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		QEmbContPosAfter.Checked = True
	Else
		QEmbContPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embContEither")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		QEmbContEitherYes.Checked = True
	Else
		QEmbContEitherNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embContBoth")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QEmbContBothNo.Checked = True
	ElseIf (attr.Text = "yesBoth") Then
		QEmbContBothYesBoth.Checked = True
	ElseIf (attr.Text = "yesInitial") Then
		QEmbContBothYesInitial.Checked = True
	Else
		QEmbContBothYesFinal.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embContBothInitialFinal")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QEmbContBothInitialFinalNo.Checked = True
	Else
		QEmbContBothInitialFinalYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embContBothFinalInitial")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QEmbContBothFinalInitialNo.Checked = True
	Else
		QEmbContBothFinalInitialYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embContRequired")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		QEmbContRequiredYes.Checked = True
	Else
		QEmbContRequiredNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@embContAux")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		QEmbContAuxYes.Checked = True
	Else
		QEmbContAuxNo.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function QEmbContYesSameYN_onclick() As Boolean
	QEmbContYesSameYN.Checked = True
	DisplayHidden
	QEmbContYesSameYN_onclick = True
End Function
Private Function QEmbContYesSameYNPrompt_onclick() As Boolean
	QEmbContYesSameYN_onclick
	QEmbContYesSameYNPrompt_onclick = True
End Function

Private Function QEmbContYesSameCont_onclick() As Boolean
	QEmbContYesSameCont.Checked = True
	DisplayHidden
	QEmbContYesSameCont_onclick = True
End Function
Private Function QEmbContYesSameContPrompt_onclick() As Boolean
	QEmbContYesSameCont_onclick
	QEmbContYesSameContPrompt_onclick = True
End Function

Private Function QEmbContYesDiff_onclick() As Boolean
	QEmbContYesDiff.Checked = True
	DisplayHidden
	QEmbContYesDiff_onclick = True
End Function
Private Function QEmbContYesDiffPrompt_onclick() As Boolean
	QEmbContYesDiff_onclick
	QEmbContYesDiffPrompt_onclick = True
End Function

Private Function QEmbContWordNo_onclick() As Boolean
	QEmbContWordNo.Checked = True
	DisplayHidden
	QEmbContWordNo_onclick = True
End Function
Private Function QEmbContWordNoPrompt_onclick() As Boolean
	QEmbContWordNo_onclick
	QEmbContWordNoPrompt_onclick = True
End Function

Private Function QEmbContWordYes_onclick() As Boolean
	QEmbContWordYes.Checked = True
	DisplayHidden
	QEmbContWordYes_onclick = True
End Function
Private Function QEmbContWordYesPrompt_onclick() As Boolean
	QEmbContWordYes_onclick
	QEmbContWordYesPrompt_onclick = True
End Function

Private Function QEmbContPosAsEmbYNPosYes_onclick() As Boolean
	QEmbContPosAsEmbYNPosYes.Checked = True
	DisplayHidden
	QEmbContPosAsEmbYNPosYes_onclick = True
End Function
Private Function QEmbContPosAsEmbYNPosYesPrompt_onclick() As Boolean
	QEmbContPosAsEmbYNPosYes_onclick
	QEmbContPosAsEmbYNPosYesPrompt_onclick = True
End Function

Private Function QEmbContPosAsEmbYNPosNo_onclick() As Boolean
	QEmbContPosAsEmbYNPosNo.Checked = True
	DisplayHidden
	QEmbContPosAsEmbYNPosNo_onclick = True
End Function
Private Function QEmbContPosAsEmbYNPosNoPrompt_onclick() As Boolean
	QEmbContPosAsEmbYNPosNo_onclick
	QEmbContPosAsEmbYNPosNoPrompt_onclick = True
End Function

Private Function QEmbContPosBefore_onclick() As Boolean
	QEmbContPosBefore.Checked = True
	DisplayHidden
	QEmbContPosBefore_onclick = True
End Function
Private Function QEmbContPosBeforePrompt_onclick() As Boolean
	QEmbContPosBefore_onclick
	QEmbContPosBeforePrompt_onclick = True
End Function

Private Function QEmbContPosAfter_onclick() As Boolean
	QEmbContPosAfter.Checked = True
	DisplayHidden
	QEmbContPosAfter_onclick = True
End Function
Private Function QEmbContPosAfterPrompt_onclick() As Boolean
	QEmbContPosAfter_onclick
	QEmbContPosAfterPrompt_onclick = True
End Function

Private Function QEmbContPosEitherSide_onclick() As Boolean
	QEmbContPosEitherSide.Checked = True
	DisplayHidden
	QEmbContPosEitherSide_onclick = True
End Function
Private Function QEmbContPosEitherSidePrompt_onclick() As Boolean
	QEmbContPosEitherSide_onclick
	QEmbContPosEitherSidePrompt_onclick = True
End Function

Private Function QEmbContEitherYes_onclick() As Boolean
	QEmbContEitherYes.Checked = True
	DisplayHidden
	QEmbContEitherYes_onclick = True
End Function
Private Function QEmbContEitherYesPrompt_onclick() As Boolean
	QEmbContEitherYes_onclick
	QEmbContEitherYesPrompt_onclick = True
End Function

Private Function QEmbContEitherNo_onclick() As Boolean
	QEmbContEitherNo.Checked = True
	DisplayHidden
	QEmbContEitherNo_onclick = True
End Function
Private Function QEmbContEitherNoPrompt_onclick() As Boolean
	QEmbContEitherNo_onclick
	QEmbContEitherNoPrompt_onclick = True
End Function

Private Function QEmbContBothNo_onclick() As Boolean
	QEmbContBothNo.Checked = True
	DisplayHidden
	QEmbContBothNo_onclick = True
End Function
Private Function QEmbContBothNoPrompt_onclick() As Boolean
	QEmbContBothNo_onclick
	QEmbContBothNoPrompt_onclick = True
End Function

Private Function QEmbContBothYesBoth_onclick() As Boolean
	QEmbContBothYesBoth.Checked = True
	DisplayHidden
	QEmbContBothYesBoth_onclick = True
End Function
Private Function QEmbContBothYesBothPrompt_onclick() As Boolean
	QEmbContBothYesBoth_onclick
	QEmbContBothYesBothPrompt_onclick = True
End Function

Private Function QEmbContBothYesInitial_onclick() As Boolean
	QEmbContBothYesInitial.Checked = True
	DisplayHidden
	QEmbContBothYesInitial_onclick = True
End Function
Private Function QEmbContBothYesInitialPrompt_onclick() As Boolean
	QEmbContBothYesInitial_onclick
	QEmbContBothYesInitialPrompt_onclick = True
End Function

Private Function QEmbContBothInitialFinalNo_onclick() As Boolean
	QEmbContBothInitialFinalNo.Checked = True
	DisplayHidden
	QEmbContBothInitialFinalNo_onclick = True
End Function
Private Function QEmbContBothInitialFinalNoPrompt_onclick() As Boolean
	QEmbContBothInitialFinalNo_onclick
	QEmbContBothInitialFinalNoPrompt_onclick = True
End Function

Private Function QEmbContBothInitialFinalYes_onclick() As Boolean
	QEmbContBothInitialFinalYes.Checked = True
	DisplayHidden
	QEmbContBothInitialFinalYes_onclick = True
End Function
Private Function QEmbContBothInitialFinalYesPrompt_onclick() As Boolean
	QEmbContBothInitialFinalYes_onclick
	QEmbContBothInitialFinalYesPrompt_onclick = True
End Function

Private Function QEmbContBothYesFinal_onclick() As Boolean
	QEmbContBothYesFinal.Checked = True
	DisplayHidden
	QEmbContBothYesFinal_onclick = True
End Function
Private Function QEmbContBothYesFinalPrompt_onclick() As Boolean
	QEmbContBothYesFinal_onclick
	QEmbContBothYesFinalPrompt_onclick = True
End Function

Private Function QEmbContBothFinalInitialNo_onclick() As Boolean
	QEmbContBothFinalInitialNo.Checked = True
	DisplayHidden
	QEmbContBothFinalInitialNo_onclick = True
End Function
Private Function QEmbContBothFinalInitialNoPrompt_onclick() As Boolean
	QEmbContBothFinalInitialNo_onclick
	QEmbContBothFinalInitialNoPrompt_onclick = True
End Function

Private Function QEmbContBothFinalInitialYes_onclick() As Boolean
	QEmbContBothFinalInitialYes.Checked = True
	DisplayHidden
	QEmbContBothFinalInitialYes_onclick = True
End Function
Private Function QEmbContBothFinalInitialYesPrompt_onclick() As Boolean
	QEmbContBothFinalInitialYes_onclick
	QEmbContBothFinalInitialYesPrompt_onclick = True
End Function

Private Function QEmbContRequiredYes_onclick() As Boolean
	QEmbContRequiredYes.Checked = True
	DisplayHidden
	QEmbContRequiredYes_onclick = True
End Function
Private Function QEmbContRequiredYesPrompt_onclick() As Boolean
	QEmbContRequiredYes_onclick
	QEmbContRequiredYesPrompt_onclick = True
End Function

Private Function QEmbContRequiredNo_onclick() As Boolean
	QEmbContRequiredNo.Checked = True
	DisplayHidden
	QEmbContRequiredNo_onclick = True
End Function
Private Function QEmbContRequiredNoPrompt_onclick() As Boolean
	QEmbContRequiredNo_onclick
	QEmbContRequiredNoPrompt_onclick = True
End Function

Private Function QEmbContNoAux_onclick() As Boolean
	QEmbContNoAux.Checked = True
	DisplayHidden
	QEmbContNoAux_onclick = True
End Function
Private Function QEmbContNoAuxPrompt_onclick() As Boolean
	QEmbContNoAux_onclick
	QEmbContNoAuxPrompt_onclick = True
End Function

Private Function QEmbContAuxYes_onclick() As Boolean
	QEmbContAuxYes.Checked = True
	DisplayHidden
	QEmbContAuxYes_onclick = True
End Function
Private Function QEmbContAuxYesPrompt_onclick() As Boolean
	QEmbContAuxYes_onclick
	QEmbContAuxYesPrompt_onclick = True
End Function

Private Function QEmbContAuxNo_onclick() As Boolean
	QEmbContAuxNo.Checked = True
	DisplayHidden
	QEmbContAuxNo_onclick = True
End Function
Private Function QEmbContAuxNoPrompt_onclick() As Boolean
	QEmbContAuxNo_onclick
	QEmbContAuxNoPrompt_onclick = True
End Function

Private Function QEmbContNo_onclick() As Boolean
	QEmbContNo.Checked = True
	DisplayHidden
	QEmbContNo_onclick = True
End Function
Private Function QEmbContNoPrompt_onclick() As Boolean
	QEmbContNo_onclick
	QEmbContNoPrompt_onclick = True
End Function

Private Function QEmbContOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//q/@embCont")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QEmbContYesSameYN.Checked) Then sTemp = "yesSameYN"
	If (QEmbContYesSameCont.Checked) Then sTemp = "yesSameCont"
	If (QEmbContYesDiff.Checked) Then sTemp = "yesDiff"
	If (QEmbContNoAux.Checked) Then sTemp = "noAux"
	If (QEmbContNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embContWord")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QEmbContWordNo.Checked) Then sTemp = "no"
	If (QEmbContWordYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embContPosAsEmbYNPos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QEmbContPosAsEmbYNPosYes.Checked) Then sTemp = "yes"
	If (QEmbContPosAsEmbYNPosNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embContPos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (QEmbContPosBefore.Checked) Then sTemp = "before"
	If (QEmbContPosAfter.Checked) Then sTemp = "after"
	If (QEmbContPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embContEither")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QEmbContEitherYes.Checked) Then sTemp = "yes"
	If (QEmbContEitherNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embContBoth")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QEmbContBothNo.Checked) Then sTemp = "no"
	If (QEmbContBothYesBoth.Checked) Then sTemp = "yesBoth"
	If (QEmbContBothYesInitial.Checked) Then sTemp = "yesInitial"
	If (QEmbContBothYesFinal.Checked) Then sTemp = "yesFinal"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embContBothInitialFinal")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QEmbContBothInitialFinalNo.Checked) Then sTemp = "no"
	If (QEmbContBothInitialFinalYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embContBothFinalInitial")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QEmbContBothFinalInitialNo.Checked) Then sTemp = "no"
	If (QEmbContBothFinalInitialYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embContRequired")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QEmbContRequiredYes.Checked) Then sTemp = "yes"
	If (QEmbContRequiredNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@embContAux")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QEmbContAuxYes.Checked) Then sTemp = "yes"
	If (QEmbContAuxNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	QEmbContOK_onclick = True

	BaseWindow.navigate "QTesting.htm"
End Function

Private Function QEmbContCancel_onclick() As Boolean
	QEmbContCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (QEmbContNo.Checked Or QEmbContNoAux.Checked) Then
		QEmbContWordTable.Style.display = "none"
		QEmbContPosAsEmbYNPosTable.Style.display = "none"
		QEmbContPosTable.Style.display = "none"
		QEmbContEitherTable.Style.display = "none"
		QEmbContBothTable.Style.display = "none"
		QEmbContBothInitialFinalTable.Style.display = "none"
		QEmbContBothFinalInitialTable.Style.display = "none"
		QEmbContRequiredTable.Style.display = "none"
		QEmbContWordNoInstruction.Style.display = "none"
		QEmbContWordYesInstruction.Style.display = "none"
		QEmbContEitherNoInstruction.Style.display = "none"
		If (QEmbContNoAux.Checked) Then
			QEmbContAuxTable.Style.display = ""
		Else
			QEmbContAuxTable.Style.display = "none"
		End If
	Else
		QEmbContAuxTable.Style.display = "none"
		If (QEmbContYesDiff.Checked) Then
			QEmbContWordTable.Style.display = ""
			If (QEmbContWordNo.Checked) Then
				QEmbContWordNoInstruction.Style.display = ""
				QEmbContWordYesInstruction.Style.display = "none"
			Else
				QEmbContWordNoInstruction.Style.display = "none"
				QEmbContWordYesInstruction.Style.display = ""
			End If
		Else
			QEmbContWordTable.Style.display = "none"
			QEmbContWordNoInstruction.Style.display = "none"
			QEmbContWordYesInstruction.Style.display = "none"
		End If
		QEmbContPosAsEmbYNPosTable.Style.display = ""
		QEmbContEitherNoInstruction.Style.display = "none"
		If (QEmbContPosAsEmbYNPosYes.Checked) Then
			QEmbContPosTable.Style.display = "none"
			QEmbContEitherTable.Style.display = "none"
			QEmbContBothTable.Style.display = "none"
			QEmbContBothInitialFinalTable.Style.display = "none"
			QEmbContBothFinalInitialTable.Style.display = "none"
			QEmbContRequiredTable.Style.display = ""
		Else
			QEmbContPosTable.Style.display = ""
			QEmbContRequiredTable.Style.display = ""
			If (QEmbContPosEitherSide.Checked) Then
				QEmbContEitherTable.Style.display = ""
				If (QEmbContEitherNo.Checked) Then
					QEmbContEitherNoInstruction.Style.display = ""
				End If
				QEmbContBothTable.Style.display = ""
				If (QEmbContBothYesInitial.Checked) Then
					QEmbContBothInitialFinalTable.Style.display = ""
				Else
					QEmbContBothInitialFinalTable.Style.display = "none"
				End If
				If (QEmbContBothYesFinal.Checked) Then
					QEmbContBothFinalInitialTable.Style.display = ""
				Else
					QEmbContBothFinalInitialTable.Style.display = "none"
				End If
			Else
				QEmbContEitherTable.Style.display = "none"
				QEmbContBothTable.Style.display = "none"
				QEmbContBothInitialFinalTable.Style.display = "none"
				QEmbContBothFinalInitialTable.Style.display = "none"
			End If
		End If
	End If
End Sub
