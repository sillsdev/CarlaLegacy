VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} PPModifiersDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6720
   _ExtentX        =   11853
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\PPModifiers.htm"
   BuildFile       =   "..\Control\PPModifiers.htm"
   BuildMode       =   0
   TypeLibCookie   =   46
   AsyncLoad       =   0   'False
   id              =   "PPModifiersDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "PPModifiersDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//pp/@degree")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		PPModifiersDegreeNo.Checked = True
	Else
		PPModifiersDegreeYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//pp/@manner")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		PPModifiersMannerNo.Checked = True
	Else
		PPModifiersMannerYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//pp/@mannerPos")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	sPos = gGetPositionBasedOnSpecifier(attr.Text)
	If (sPos = "before") Then
		PPModifiersMannerPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		PPModifiersMannerPosAfter.Checked = True
	Else
		PPModifiersMannerPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//pp/@degreePos")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	sPos = gGetPositionBasedOnSpecifier(attr.Text)
	If (sPos = "before") Then
		PPModifiersDegreePosBefore.Checked = True
	ElseIf (sPos = "after") Then
		PPModifiersDegreePosAfter.Checked = True
	Else
		PPModifiersDegreePosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//pp/@degreeEither")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		PPModifierDegreePosEitherSideYes.Checked = True
	Else
		PPModifierDegreePosEitherSideNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//pp/@degreeMannerPos")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	sPos = gGetPositionBasedOnSpecifier(attr.Text)
	If (sPos = "bothBefore" Or sPos = "before") Then
		PPModifiersDegreeMannerPosBothBefore.Checked = True
	ElseIf (sPos = "bothAfter" Or sPos = "after") Then
		PPModifiersDegreeMannerPosBothAfter.Checked = True
	ElseIf (sPos = "degreeManner") Then
		PPModifiersDegreeMannerPosDegreeManner.Checked = True
	ElseIf (sPos = "mannerDegree") Then
		PPModifiersDegreeMannerPosMannerDegree.Checked = True
	Else
		PPModifiersDegreeMannerPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//pp/@degreeEither2")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		PPModifierDegreeMannerPosEitherSideYes.Checked = True
	Else
		PPModifierDegreeMannerPosEitherSideNo.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function PPModifiersDegreeNo_onclick() As Boolean
	PPModifiersDegreeNo.Checked = True
	DisplayHidden
	PPModifiersDegreeNo_onclick = True
End Function
Private Function PPModifiersDegreeNoPrompt_onclick() As Boolean
	PPModifiersDegreeNo_onclick
	PPModifiersDegreeNoPrompt_onclick = True
End Function

Private Function PPModifiersDegreeYes_onclick() As Boolean
	PPModifiersDegreeYes.Checked = True
	DisplayHidden
	PPModifiersDegreeYes_onclick = True
End Function
Private Function PPModifiersDegreeYesPrompt_onclick() As Boolean
	PPModifiersDegreeYes_onclick
	PPModifiersDegreeYesPrompt_onclick = True
End Function

Private Function PPModifiersMannerNo_onclick() As Boolean
	PPModifiersMannerNo.Checked = True
	DisplayHidden
	PPModifiersMannerNo_onclick = True
End Function
Private Function PPModifiersMannerNoPrompt_onclick() As Boolean
	PPModifiersMannerNo_onclick
	PPModifiersMannerNoPrompt_onclick = True
End Function

Private Function PPModifiersMannerYes_onclick() As Boolean
	PPModifiersMannerYes.Checked = True
	DisplayHidden
	PPModifiersMannerYes_onclick = True
End Function
Private Function PPModifiersMannerYesPrompt_onclick() As Boolean
	PPModifiersMannerYes_onclick
	PPModifiersMannerYesPrompt_onclick = True
End Function

Private Function PPModifiersMannerPosBefore_onclick() As Boolean
	PPModifiersMannerPosBefore.Checked = True
	DisplayHidden
	PPModifiersMannerPosBefore_onclick = True
End Function
Private Function PPModifiersMannerPosBeforePrompt_onclick() As Boolean
	PPModifiersMannerPosBefore_onclick
	PPModifiersMannerPosBeforePrompt_onclick = True
End Function

Private Function PPModifiersMannerPosAfter_onclick() As Boolean
	PPModifiersMannerPosAfter.Checked = True
	DisplayHidden
	PPModifiersMannerPosAfter_onclick = True
End Function
Private Function PPModifiersMannerPosAfterPrompt_onclick() As Boolean
	PPModifiersMannerPosAfter_onclick
	PPModifiersMannerPosAfterPrompt_onclick = True
End Function

Private Function PPModifiersMannerPosEitherSide_onclick() As Boolean
	PPModifiersMannerPosEitherSide.Checked = True
	DisplayHidden
	PPModifiersMannerPosEitherSide_onclick = True
End Function
Private Function PPModifiersMannerPosEitherSidePrompt_onclick() As Boolean
	PPModifiersMannerPosEitherSide_onclick
	PPModifiersMannerPosEitherSidePrompt_onclick = True
End Function

Private Function PPModifiersDegreePosBefore_onclick() As Boolean
	PPModifiersDegreePosBefore.Checked = True
	DisplayHidden
	PPModifiersDegreePosBefore_onclick = True
End Function
Private Function PPModifiersDegreePosBeforePrompt_onclick() As Boolean
	PPModifiersDegreePosBefore_onclick
	PPModifiersDegreePosBeforePrompt_onclick = True
End Function

Private Function PPModifiersDegreePosAfter_onclick() As Boolean
	PPModifiersDegreePosAfter.Checked = True
	DisplayHidden
	PPModifiersDegreePosAfter_onclick = True
End Function
Private Function PPModifiersDegreePosAfterPrompt_onclick() As Boolean
	PPModifiersDegreePosAfter_onclick
	PPModifiersDegreePosAfterPrompt_onclick = True
End Function

Private Function PPModifiersDegreePosEitherSide_onclick() As Boolean
	PPModifiersDegreePosEitherSide.Checked = True
	DisplayHidden
	PPModifiersDegreePosEitherSide_onclick = True
End Function
Private Function PPModifiersDegreePosEitherSidePrompt_onclick() As Boolean
	PPModifiersDegreePosEitherSide_onclick
	PPModifiersDegreePosEitherSidePrompt_onclick = True
End Function

Private Function PPModifierDegreePosEitherSideYes_onclick() As Boolean
	PPModifierDegreePosEitherSideYes.Checked = True
	DisplayHidden
	PPModifierDegreePosEitherSideYes_onclick = True
End Function
Private Function PPModifierDegreePosEitherSideYesPrompt_onclick() As Boolean
	PPModifierDegreePosEitherSideYes_onclick
	PPModifierDegreePosEitherSideYesPrompt_onclick = True
End Function

Private Function PPModifierDegreePosEitherSideNo_onclick() As Boolean
	PPModifierDegreePosEitherSideNo.Checked = True
	DisplayHidden
	PPModifierDegreePosEitherSideNo_onclick = True
End Function
Private Function PPModifierDegreePosEitherSideNoPrompt_onclick() As Boolean
	PPModifierDegreePosEitherSideNo_onclick
	PPModifierDegreePosEitherSideNoPrompt_onclick = True
End Function

Private Function PPModifiersDegreeMannerPosBothBefore_onclick() As Boolean
	PPModifiersDegreeMannerPosBothBefore.Checked = True
	DisplayHidden
	PPModifiersDegreeMannerPosBothBefore_onclick = True
End Function
Private Function PPModifiersDegreeMannerPosBothBeforePrompt_onclick() As Boolean
	PPModifiersDegreeMannerPosBothBefore_onclick
	PPModifiersDegreeMannerPosBothBeforePrompt_onclick = True
End Function

Private Function PPModifiersDegreeMannerPosBothAfter_onclick() As Boolean
	PPModifiersDegreeMannerPosBothAfter.Checked = True
	DisplayHidden
	PPModifiersDegreeMannerPosBothAfter_onclick = True
End Function
Private Function PPModifiersDegreeMannerPosBothAfterPrompt_onclick() As Boolean
	PPModifiersDegreeMannerPosBothAfter_onclick
	PPModifiersDegreeMannerPosBothAfterPrompt_onclick = True
End Function

Private Function PPModifiersDegreeMannerPosDegreeManner_onclick() As Boolean
	PPModifiersDegreeMannerPosDegreeManner.Checked = True
	DisplayHidden
	PPModifiersDegreeMannerPosDegreeManner_onclick = True
End Function
Private Function PPModifiersDegreeMannerPosDegreeMannerPrompt_onclick() As Boolean
	PPModifiersDegreeMannerPosDegreeManner_onclick
	PPModifiersDegreeMannerPosDegreeMannerPrompt_onclick = True
End Function

Private Function PPModifiersDegreeMannerPosMannerDegree_onclick() As Boolean
	PPModifiersDegreeMannerPosMannerDegree.Checked = True
	DisplayHidden
	PPModifiersDegreeMannerPosMannerDegree_onclick = True
End Function
Private Function PPModifiersDegreeMannerPosMannerDegreePrompt_onclick() As Boolean
	PPModifiersDegreeMannerPosMannerDegree_onclick
	PPModifiersDegreeMannerPosMannerDegreePrompt_onclick = True
End Function

Private Function PPModifiersDegreeMannerPosEitherSide_onclick() As Boolean
	PPModifiersDegreeMannerPosEitherSide.Checked = True
	DisplayHidden
	PPModifiersDegreeMannerPosEitherSide_onclick = True
End Function
Private Function PPModifiersDegreeMannerPosEitherSidePrompt_onclick() As Boolean
	PPModifiersDegreeMannerPosEitherSide_onclick
	PPModifiersDegreeMannerPosEitherSidePrompt_onclick = True
End Function

Private Function PPModifierDegreeMannerPosEitherSideYes_onclick() As Boolean
	PPModifierDegreeMannerPosEitherSideYes.Checked = True
	DisplayHidden
	PPModifierDegreeMannerPosEitherSideYes_onclick = True
End Function
Private Function PPModifierDegreeMannerPosEitherSideYesPrompt_onclick() As Boolean
	PPModifierDegreeMannerPosEitherSideYes_onclick
	PPModifierDegreeMannerPosEitherSideYesPrompt_onclick = True
End Function

Private Function PPModifierDegreeMannerPosEitherSideNo_onclick() As Boolean
	PPModifierDegreeMannerPosEitherSideNo.Checked = True
	DisplayHidden
	PPModifierDegreeMannerPosEitherSideNo_onclick = True
End Function
Private Function PPModifierDegreeMannerPosEitherSideNoPrompt_onclick() As Boolean
	PPModifierDegreeMannerPosEitherSideNo_onclick
	PPModifierDegreeMannerPosEitherSideNoPrompt_onclick = True
End Function

Private Function PPModifiersOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//pp/@degree")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (PPModifiersDegreeNo.Checked) Then sTemp = "no"
	If (PPModifiersDegreeYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//pp/@manner")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (PPModifiersMannerNo.Checked) Then sTemp = "no"
	If (PPModifiersMannerYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//pp/@mannerPos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (PPModifiersMannerPosBefore.Checked) Then sTemp = "before"
	If (PPModifiersMannerPosAfter.Checked) Then sTemp = "after"
	If (PPModifiersMannerPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//pp/@degreePos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (PPModifiersDegreePosBefore.Checked) Then sTemp = "before"
	If (PPModifiersDegreePosAfter.Checked) Then sTemp = "after"
	If (PPModifiersDegreePosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//pp/@degreeEither")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (PPModifierDegreePosEitherSideYes.Checked) Then sTemp = "yes"
	If (PPModifierDegreePosEitherSideNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//pp/@degreeMannerPos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (PPModifiersDegreeMannerPosBothBefore.Checked) Then sTemp = "bothBefore"
	If (PPModifiersDegreeMannerPosBothAfter.Checked) Then sTemp = "bothAfter"
	If (PPModifiersDegreeMannerPosDegreeManner.Checked) Then sTemp = "degreeManner"
	If (PPModifiersDegreeMannerPosMannerDegree.Checked) Then sTemp = "mannerDegree"
	If (PPModifiersDegreeMannerPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//pp/@degreeEither2")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (PPModifierDegreeMannerPosEitherSideYes.Checked) Then sTemp = "yes"
	If (PPModifierDegreeMannerPosEitherSideNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	PPModifiersOK_onclick = True

	BaseWindow.navigate "PPComps.htm"
End Function

Private Function PPModifiersCancel_onclick() As Boolean
	PPModifiersCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (PPModifiersDegreeNo.Checked) Then
		PPModifierDegreePosTable.Style.display = "none"
		PPModifierDegreePosEitherSideTable.Style.display = "none"
		PPModifierDegreeMannerPosTable.Style.display = "none"
		PPModifierDegreeMannerPosEitherSideTable.Style.display = "none"
		PPModifiersDegreeYesInstruction.Style.display = "none"
		PPModifiersEitherSideInstruction.Style.display = "none"
		PPModifiersMannerTable.Style.display = ""
		PPModifierMannerPrompt.Style.display = "none"
		If (PPModifiersMannerNo.Checked) Then
			PPModifierMannerPosTable.Style.display = "none"
		Else
			PPModifierMannerPosTable.Style.display = ""
		End If
	Else
		PPModifiersMannerTable.Style.display = ""
		PPModifierMannerPrompt.Style.display = ""
		PPModifiersDegreeYesInstruction.Style.display = ""
		If (PPModifiersMannerNo.Checked) Then
			PPModifierDegreeMannerPosTable.Style.display = "none"
			PPModifierDegreeMannerPosEitherSideTable.Style.display = "none"
			PPModifierDegreePosTable.Style.display = ""
			If (PPModifiersDegreePosEitherSide.Checked) Then
				PPModifierDegreePosEitherSideTable.Style.display = ""
				If (PPModifierDegreePosEitherSideNo.Checked) Then
					PPModifiersEitherSideInstruction.Style.display = ""
				Else
					PPModifiersEitherSideInstruction.Style.display = "none"
				End If
			Else
				PPModifierDegreePosEitherSideTable.Style.display = "none"
				PPModifiersEitherSideInstruction.Style.display = "none"
			End If
		Else
			PPModifierDegreePosTable.Style.display = "none"
			PPModifierDegreePosEitherSideTable.Style.display = "none"
			PPModifierDegreeMannerPosTable.Style.display = ""
			If (PPModifiersDegreeMannerPosEitherSide.Checked) Then
				PPModifierDegreeMannerPosEitherSideTable.Style.display = ""
				If (PPModifierDegreeMannerPosEitherSideNo.Checked) Then
					PPModifiersEitherSideInstruction.Style.display = ""
				Else
					PPModifiersEitherSideInstruction.Style.display = "none"
				End If
			Else
				PPModifierDegreeMannerPosEitherSideTable.Style.display = "none"
				PPModifiersEitherSideInstruction.Style.display = "none"
			End If
		End If
	End If
End Sub
