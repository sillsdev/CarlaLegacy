VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} QMainContDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   _ExtentX        =   11906
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\QMainCont.htm"
   BuildFile       =   "..\Control\QMainCont.htm"
   BuildMode       =   0
   TypeLibCookie   =   88
   AsyncLoad       =   0   'False
   id              =   "QMainContDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "QMainContDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//q/@contFront")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "unknown") Then
		If (GetHeadPos() = geHeadPos.iInitial) Then
			QContFrontYes.Checked = True
		Else
			QContFrontNo.Checked = True
		End If
	ElseIf (attr.Text = "yes") Then
		QContFrontYes.Checked = True
	Else
		QContFrontNo.Checked = True
	End If

	sPos = gGetPositionBasedOnHead(attr.Text)
	If (sPos = "before") Then
		QMainContPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		QMainContPosAfter.Checked = True
	Else
		QMainContPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainCont")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yesSame") Then
		QMainContYesSame.Checked = True
	ElseIf (attr.Text = "yesDiff") Then
		QMainContYesDiff.Checked = True
	ElseIf (attr.Text = "noAux") Then
		QMainContNoAux.Checked = True
	Else
		QMainContNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainContWord")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QMainContWordNo.Checked = True
	Else
		QMainContWordYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainContBefore")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QMainContBeforeNo.Checked = True
	ElseIf (attr.Text = "yes") Then
		QMainContBeforeYes.Checked = True
	Else
		QMainContBeforeYesSome.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainContBeforeAux")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		QMainContBeforeAuxYes.Checked = True
	Else
		QMainContBeforeAuxNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainContSame")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		QMainContSameYes.Checked = True
	Else
		QMainContSameNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainContPos")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	sPos = gGetPositionBasedOnHead(attr.Text)
	If (sPos = "before") Then
		QMainContPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		QMainContPosAfter.Checked = True
	Else
		QMainContPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainContEither")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		QMainContEitherYes.Checked = True
	Else
		QMainContEitherNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainContBoth")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QMainContBothNo.Checked = True
	ElseIf (attr.Text = "yesBoth") Then
		QMainContBothYesBoth.Checked = True
	ElseIf (attr.Text = "yesInitial") Then
		QMainContBothYesInitial.Checked = True
	Else
		QMainContBothYesFinal.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainContBothInitialFinal")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QMainContBothInitialFinalNo.Checked = True
	Else
		QMainContBothInitialFinalYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainContBothFinalInitial")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		QMainContBothFinalInitialNo.Checked = True
	Else
		QMainContBothFinalInitialYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainContRequired")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		QMainContRequiredYes.Checked = True
	Else
		QMainContRequiredNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//q/@mainContAux")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		QMainContAuxYes.Checked = True
	Else
		QMainContAuxNo.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function QContFrontYes_onclick() As Boolean
	QContFrontYes.Checked = True
	DisplayHidden
	QContFrontYes_onclick = True
End Function
Private Function QContFrontYesPrompt_onclick() As Boolean
	QContFrontYes_onclick
	QContFrontYesPrompt_onclick = True
End Function

Private Function QContFrontNo_onclick() As Boolean
	QContFrontNo.Checked = True
	DisplayHidden
	QContFrontNo_onclick = True
End Function
Private Function QContFrontNoPrompt_onclick() As Boolean
	QContFrontNo_onclick
	QContFrontNoPrompt_onclick = True
End Function

Private Function QMainContYesSame_onclick() As Boolean
	QMainContYesSame.Checked = True
	DisplayHidden
	QMainContYesSame_onclick = True
End Function
Private Function QMainContYesSamePrompt_onclick() As Boolean
	QMainContYesSame_onclick
	QMainContYesSamePrompt_onclick = True
End Function

Private Function QMainContYesDiff_onclick() As Boolean
	QMainContYesDiff.Checked = True
	DisplayHidden
	QMainContYesDiff_onclick = True
End Function
Private Function QMainContYesDiffPrompt_onclick() As Boolean
	QMainContYesDiff_onclick
	QMainContYesDiffPrompt_onclick = True
End Function

Private Function QMainContWordNo_onclick() As Boolean
	QMainContWordNo.Checked = True
	DisplayHidden
	QMainContWordNo_onclick = True
End Function
Private Function QMainContWordNoPrompt_onclick() As Boolean
	QMainContWordNo_onclick
	QMainContWordNoPrompt_onclick = True
End Function

Private Function QMainContWordYes_onclick() As Boolean
	QMainContWordYes.Checked = True
	DisplayHidden
	QMainContWordYes_onclick = True
End Function
Private Function QMainContWordYesPrompt_onclick() As Boolean
	QMainContWordYes_onclick
	QMainContWordYesPrompt_onclick = True
End Function

Private Function QMainContBeforeNo_onclick() As Boolean
	QMainContBeforeNo.Checked = True
	DisplayHidden
	QMainContBeforeNo_onclick = True
End Function
Private Function QMainContBeforeNoPrompt_onclick() As Boolean
	QMainContBeforeNo_onclick
	QMainContBeforeNoPrompt_onclick = True
End Function

Private Function QMainContBeforeYes_onclick() As Boolean
	QMainContBeforeYes.Checked = True
	DisplayHidden
	QMainContBeforeYes_onclick = True
End Function
Private Function QMainContBeforeYesPrompt_onclick() As Boolean
	QMainContBeforeYes_onclick
	QMainContBeforeYesPrompt_onclick = True
End Function

Private Function QMainContBeforeAuxYes_onclick() As Boolean
	QMainContBeforeAuxYes.Checked = True
	DisplayHidden
	QMainContBeforeAuxYes_onclick = True
End Function
Private Function QMainContBeforeAuxYesPrompt_onclick() As Boolean
	QMainContBeforeAuxYes_onclick
	QMainContBeforeAuxYesPrompt_onclick = True
End Function

Private Function QMainContBeforeAuxNo_onclick() As Boolean
	QMainContBeforeAuxNo.Checked = True
	DisplayHidden
	QMainContBeforeAuxNo_onclick = True
End Function
Private Function QMainContBeforeAuxNoPrompt_onclick() As Boolean
	QMainContBeforeAuxNo_onclick
	QMainContBeforeAuxNoPrompt_onclick = True
End Function

Private Function QMainContBeforeYesSome_onclick() As Boolean
	QMainContBeforeYesSome.Checked = True
	DisplayHidden
	QMainContBeforeYesSome_onclick = True
End Function
Private Function QMainContBeforeYesSomePrompt_onclick() As Boolean
	QMainContBeforeYesSome_onclick
	QMainContBeforeYesSomePrompt_onclick = True
End Function

Private Function QMainContSameYes_onclick() As Boolean
	QMainContSameYes.Checked = True
	DisplayHidden
	QMainContSameYes_onclick = True
End Function
Private Function QMainContSameYesPrompt_onclick() As Boolean
	QMainContSameYes_onclick
	QMainContSameYesPrompt_onclick = True
End Function

Private Function QMainContSameNo_onclick() As Boolean
	QMainContSameNo.Checked = True
	DisplayHidden
	QMainContSameNo_onclick = True
End Function
Private Function QMainContSameNoPrompt_onclick() As Boolean
	QMainContSameNo_onclick
	QMainContSameNoPrompt_onclick = True
End Function

Private Function QMainContPosBefore_onclick() As Boolean
	QMainContPosBefore.Checked = True
	DisplayHidden
	QMainContPosBefore_onclick = True
End Function
Private Function QMainContPosBeforePrompt_onclick() As Boolean
	QMainContPosBefore_onclick
	QMainContPosBeforePrompt_onclick = True
End Function

Private Function QMainContPosAfter_onclick() As Boolean
	QMainContPosAfter.Checked = True
	DisplayHidden
	QMainContPosAfter_onclick = True
End Function
Private Function QMainContPosAfterPrompt_onclick() As Boolean
	QMainContPosAfter_onclick
	QMainContPosAfterPrompt_onclick = True
End Function

Private Function QMainContPosEitherSide_onclick() As Boolean
	QMainContPosEitherSide.Checked = True
	DisplayHidden
	QMainContPosEitherSide_onclick = True
End Function
Private Function QMainContPosEitherSidePrompt_onclick() As Boolean
	QMainContPosEitherSide_onclick
	QMainContPosEitherSidePrompt_onclick = True
End Function

Private Function QMainContEitherYes_onclick() As Boolean
	QMainContEitherYes.Checked = True
	DisplayHidden
	QMainContEitherYes_onclick = True
End Function
Private Function QMainContEitherYesPrompt_onclick() As Boolean
	QMainContEitherYes_onclick
	QMainContEitherYesPrompt_onclick = True
End Function

Private Function QMainContEitherNo_onclick() As Boolean
	QMainContEitherNo.Checked = True
	DisplayHidden
	QMainContEitherNo_onclick = True
End Function
Private Function QMainContEitherNoPrompt_onclick() As Boolean
	QMainContEitherNo_onclick
	QMainContEitherNoPrompt_onclick = True
End Function

Private Function QMainContBothNo_onclick() As Boolean
	QMainContBothNo.Checked = True
	DisplayHidden
	QMainContBothNo_onclick = True
End Function
Private Function QMainContBothNoPrompt_onclick() As Boolean
	QMainContBothNo_onclick
	QMainContBothNoPrompt_onclick = True
End Function

Private Function QMainContBothYesBoth_onclick() As Boolean
	QMainContBothYesBoth.Checked = True
	DisplayHidden
	QMainContBothYesBoth_onclick = True
End Function
Private Function QMainContBothYesBothPrompt_onclick() As Boolean
	QMainContBothYesBoth_onclick
	QMainContBothYesBothPrompt_onclick = True
End Function

Private Function QMainContBothYesInitial_onclick() As Boolean
	QMainContBothYesInitial.Checked = True
	DisplayHidden
	QMainContBothYesInitial_onclick = True
End Function
Private Function QMainContBothYesInitialPrompt_onclick() As Boolean
	QMainContBothYesInitial_onclick
	QMainContBothYesInitialPrompt_onclick = True
End Function

Private Function QMainContBothInitialFinalNo_onclick() As Boolean
	QMainContBothInitialFinalNo.Checked = True
	DisplayHidden
	QMainContBothInitialFinalNo_onclick = True
End Function
Private Function QMainContBothInitialFinalNoPrompt_onclick() As Boolean
	QMainContBothInitialFinalNo_onclick
	QMainContBothInitialFinalNoPrompt_onclick = True
End Function

Private Function QMainContBothInitialFinalYes_onclick() As Boolean
	QMainContBothInitialFinalYes.Checked = True
	DisplayHidden
	QMainContBothInitialFinalYes_onclick = True
End Function
Private Function QMainContBothInitialFinalYesPrompt_onclick() As Boolean
	QMainContBothInitialFinalYes_onclick
	QMainContBothInitialFinalYesPrompt_onclick = True
End Function

Private Function QMainContBothYesFinal_onclick() As Boolean
	QMainContBothYesFinal.Checked = True
	DisplayHidden
	QMainContBothYesFinal_onclick = True
End Function
Private Function QMainContBothYesFinalPrompt_onclick() As Boolean
	QMainContBothYesFinal_onclick
	QMainContBothYesFinalPrompt_onclick = True
End Function

Private Function QMainContBothFinalInitialNo_onclick() As Boolean
	QMainContBothFinalInitialNo.Checked = True
	DisplayHidden
	QMainContBothFinalInitialNo_onclick = True
End Function
Private Function QMainContBothFinalInitialNoPrompt_onclick() As Boolean
	QMainContBothFinalInitialNo_onclick
	QMainContBothFinalInitialNoPrompt_onclick = True
End Function

Private Function QMainContBothFinalInitialYes_onclick() As Boolean
	QMainContBothFinalInitialYes.Checked = True
	DisplayHidden
	QMainContBothFinalInitialYes_onclick = True
End Function
Private Function QMainContBothFinalInitialYesPrompt_onclick() As Boolean
	QMainContBothFinalInitialYes_onclick
	QMainContBothFinalInitialYesPrompt_onclick = True
End Function

Private Function QMainContRequiredYes_onclick() As Boolean
	QMainContRequiredYes.Checked = True
	DisplayHidden
	QMainContRequiredYes_onclick = True
End Function
Private Function QMainContRequiredYesPrompt_onclick() As Boolean
	QMainContRequiredYes_onclick
	QMainContRequiredYesPrompt_onclick = True
End Function

Private Function QMainContRequiredNo_onclick() As Boolean
	QMainContRequiredNo.Checked = True
	DisplayHidden
	QMainContRequiredNo_onclick = True
End Function
Private Function QMainContRequiredNoPrompt_onclick() As Boolean
	QMainContRequiredNo_onclick
	QMainContRequiredNoPrompt_onclick = True
End Function

Private Function QMainContNoAux_onclick() As Boolean
	QMainContNoAux.Checked = True
	DisplayHidden
	QMainContNoAux_onclick = True
End Function
Private Function QMainContNoAuxPrompt_onclick() As Boolean
	QMainContNoAux_onclick
	QMainContNoAuxPrompt_onclick = True
End Function

Private Function QMainContAuxYes_onclick() As Boolean
	QMainContAuxYes.Checked = True
	DisplayHidden
	QMainContAuxYes_onclick = True
End Function
Private Function QMainContAuxYesPrompt_onclick() As Boolean
	QMainContAuxYes_onclick
	QMainContAuxYesPrompt_onclick = True
End Function

Private Function QMainContAuxNo_onclick() As Boolean
	QMainContAuxNo.Checked = True
	DisplayHidden
	QMainContAuxNo_onclick = True
End Function
Private Function QMainContAuxNoPrompt_onclick() As Boolean
	QMainContAuxNo_onclick
	QMainContAuxNoPrompt_onclick = True
End Function

Private Function QMainContNo_onclick() As Boolean
	QMainContNo.Checked = True
	DisplayHidden
	QMainContNo_onclick = True
End Function
Private Function QMainContNoPrompt_onclick() As Boolean
	QMainContNo_onclick
	QMainContNoPrompt_onclick = True
End Function

Private Function QCont2OK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//q/@contFront")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QContFrontYes.Checked) Then sTemp = "yes"
	If (QContFrontNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainCont")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainContYesSame.Checked) Then sTemp = "yesSame"
	If (QMainContYesDiff.Checked) Then sTemp = "yesDiff"
	If (QMainContNoAux.Checked) Then sTemp = "noAux"
	If (QMainContNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainContWord")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainContWordNo.Checked) Then sTemp = "no"
	If (QMainContWordYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainContBefore")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainContBeforeNo.Checked) Then sTemp = "no"
	If (QMainContBeforeYes.Checked) Then sTemp = "yes"
	If (QMainContBeforeYesSome.Checked) Then sTemp = "yesSome"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainContBeforeAux")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainContBeforeAuxYes.Checked) Then sTemp = "yes"
	If (QMainContBeforeAuxNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainContSame")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainContSameYes.Checked) Then sTemp = "yes"
	If (QMainContSameNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainContPos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (QMainContPosBefore.Checked) Then sTemp = "before"
	If (QMainContPosAfter.Checked) Then sTemp = "after"
	If (QMainContPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainContEither")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainContEitherYes.Checked) Then sTemp = "yes"
	If (QMainContEitherNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainContBoth")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainContBothNo.Checked) Then sTemp = "no"
	If (QMainContBothYesBoth.Checked) Then sTemp = "yesBoth"
	If (QMainContBothYesInitial.Checked) Then sTemp = "yesInitial"
	If (QMainContBothYesFinal.Checked) Then sTemp = "yesFinal"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainContBothInitialFinal")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainContBothInitialFinalNo.Checked) Then sTemp = "no"
	If (QMainContBothInitialFinalYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainContBothFinalInitial")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainContBothFinalInitialNo.Checked) Then sTemp = "no"
	If (QMainContBothFinalInitialYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainContRequired")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainContRequiredYes.Checked) Then sTemp = "yes"
	If (QMainContRequiredNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//q/@mainContAux")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (QMainContAuxYes.Checked) Then sTemp = "yes"
	If (QMainContAuxNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	QCont2OK_onclick = True

	BaseWindow.navigate "QEmbCont.htm"
End Function

Private Function QCont2Cancel_onclick() As Boolean
	QCont2Cancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (QMainContNo.Checked) Then
		QMainContWordTable.Style.display = "none"
		QMainContBeforeTable.Style.display = "none"
		QMainContBeforeAuxTable.Style.display = "none"
		QMainContSameTable.Style.display = "none"
		QMainContPosTable.Style.display = "none"
		QMainContEitherTable.Style.display = "none"
		QMainContBothTable.Style.display = "none"
		QMainContBothInitialFinalTable.Style.display = "none"
		QMainContBothFinalInitialTable.Style.display = "none"
		QMainContRequiredTable.Style.display = "none"
		QMainContAuxTable.Style.display = "none"
		QMainContWordNoInstruction.Style.display = "none"
		QMainContWordYesInstruction.Style.display = "none"
		QMainContBeforeYesInstruction.Style.display = "none"
		QMainContBeforeYesSomeInstruction.Style.display = "none"
		QMainContEitherNoInstruction.Style.display = "none"
		QMainContSameFronting.Style.display = "none"
		QMainContSameNoFronting.Style.display = "none"
		QMainContPosNoFronting.Style.display = "none"
	ElseIf (QMainContNoAux.Checked) Then
		QMainContWordTable.Style.display = "none"
		QMainContBeforeTable.Style.display = "none"
		QMainContBeforeAuxTable.Style.display = "none"
		QMainContSameTable.Style.display = "none"
		QMainContPosTable.Style.display = "none"
		QMainContEitherTable.Style.display = "none"
		QMainContBothTable.Style.display = "none"
		QMainContBothInitialFinalTable.Style.display = "none"
		QMainContBothFinalInitialTable.Style.display = "none"
		QMainContRequiredTable.Style.display = "none"
		QMainContWordNoInstruction.Style.display = "none"
		QMainContWordYesInstruction.Style.display = "none"
		QMainContBeforeYesInstruction.Style.display = "none"
		QMainContBeforeYesSomeInstruction.Style.display = "none"
		QMainContEitherNoInstruction.Style.display = "none"
		QMainContSameFronting.Style.display = "none"
		QMainContSameNoFronting.Style.display = "none"
		QMainContPosNoFronting.Style.display = "none"
		QMainContAuxTable.Style.display = ""
	Else
		If (QMainContYesSame.Checked) Then
			QMainContWordTable.Style.display = "none"
			QMainContWordYesInstruction.Style.display = "none"
			QMainContWordNoInstruction.Style.display = "none"
		Else
			QMainContWordTable.Style.display = ""
			If (QMainContWordNo.Checked) Then
				QMainContWordNoInstruction.Style.display = ""
				QMainContWordYesInstruction.Style.display = "none"
			Else
				QMainContWordNoInstruction.Style.display = "none"
				QMainContWordYesInstruction.Style.display = ""
			End If
		End If
		If (QContFrontYes.Checked) Then
			QMainContBeforeTable.Style.display = ""
			QMainContSameFronting.Style.display = ""
			QMainContSameNoFronting.Style.display = "none"
			QMainContPosNoFronting.Style.display = "none"
			If (QMainContBeforeYes.Checked) Then
				QMainContBeforeAuxTable.Style.display = "none" ' 2001.04.05 turning off for now - do not expect it to happen
				QMainContBeforeYesInstruction.Style.display = ""
				QMainContSameTable.Style.display = "none"
				QMainContPosTable.Style.display = "none"
				QMainContEitherTable.Style.display = "none"
				QMainContBothTable.Style.display = "none"
				QMainContBothInitialFinalTable.Style.display = "none"
				QMainContBothFinalInitialTable.Style.display = "none"
				QMainContRequiredTable.Style.display = "none"
				QMainContWordNoInstruction.Style.display = "none"
				QMainContWordYesInstruction.Style.display = "none"
				QMainContBeforeYesSomeInstruction.Style.display = "none"
				QMainContEitherNoInstruction.Style.display = "none"
				If (QMainContBeforeAuxYes.Checked) Then
					QMainContAuxTable.Style.display = "none" ' 2001.04.05 turning off; do not expect to happen
				Else
					QMainContAuxTable.Style.display = "none"
				End If
			Else
				QMainContBeforeAuxTable.Style.display = "none"
				QMainContBeforeYesInstruction.Style.display = "none"
			End If
			If (QMainContBeforeYesSome.Checked) Then
				QMainContBeforeYesSomeInstruction.Style.display = ""
			Else
				QMainContBeforeYesSomeInstruction.Style.display = "none"
			End If
		Else
			QMainContBeforeTable.Style.display = "none"
			QMainContSameFronting.Style.display = "none"
			QMainContSameNoFronting.Style.display = ""
			QMainContPosNoFronting.Style.display = ""
		End If
		QMainContSameTable.Style.display = ""
		If (QMainContSameYes.Checked) Then
			QMainContPosTable.Style.display = "none"
			QMainContEitherTable.Style.display = "none"
			QMainContBothTable.Style.display = "none"
			QMainContBothInitialFinalTable.Style.display = "none"
			QMainContBothFinalInitialTable.Style.display = "none"
		Else
			QMainContPosTable.Style.display = ""
			If (QMainContPosEitherSide.Checked) Then
				QMainContEitherTable.Style.display = ""
				If (QMainContEitherNo.Checked) Then
					QMainContEitherNoInstruction.Style.display = ""
				Else
					QMainContEitherNoInstruction.Style.display = "none"
				End If
				QMainContBothTable.Style.display = ""
				If (QMainContBothYesInitial.Checked) Then
					QMainContBothInitialFinalTable.Style.display = ""
				Else
					QMainContBothInitialFinalTable.Style.display = "none"
				End If
				If (QMainContBothYesFinal.Checked) Then
					QMainContBothFinalInitialTable.Style.display = ""
				Else
					QMainContBothFinalInitialTable.Style.display = "none"
				End If
			Else
				QMainContEitherTable.Style.display = "none"
				QMainContEitherNoInstruction.Style.display = "none"
				QMainContBothTable.Style.display = "none"
				QMainContBothInitialFinalTable.Style.display = "none"
				QMainContBothFinalInitialTable.Style.display = "none"
			End If
			QMainContRequiredTable.Style.display = ""
		End If
	End If

End Sub
