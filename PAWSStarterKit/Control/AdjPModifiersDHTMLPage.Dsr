VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} AdjPModifiersDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6780
   _ExtentX        =   11959
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\AdjPModifiers.htm"
   BuildFile       =   "..\Control\AdjPModifiers.htm"
   BuildMode       =   0
   TypeLibCookie   =   127
   AsyncLoad       =   0   'False
   id              =   "AdjPModifiersDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "AdjPModifiersDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private Function AdjPDegreeAfter_onclick() As Boolean
	AdjPDegreeAfter.Checked = True
	DisplayDegreePosition (True)
	AdjPDegreeAfter_onclick = True
End Function

Private Function AdjPDegreeBefore_onclick() As Boolean
	AdjPDegreeBefore.Checked = True
	DisplayDegreePosition (True)
	AdjPDegreeBefore_onclick = True
End Function

Private Function AdjPDegreeEitherSide_onclick() As Boolean
	AdjPDegreeEitherSide.Checked = True
	DisplayDegreePosition (True)
	AdjPDegreeEitherSide_onclick = True
End Function

Private Function AdjPDegreeEitherSideNo_onclick() As Boolean
	AdjPDegreeEitherSideNo.Checked = True
	DisplayDegreePosition (True)
	AdjPDegreeEitherSideNo_onclick = True
End Function

Private Function AdjPDegreeEitherSideYes_onclick() As Boolean
	AdjPDegreeEitherSideYes.Checked = True
	DisplayDegreePosition (True)
	AdjPDegreeEitherSideYes_onclick = True
End Function

Private Function AdjPMannerAfter_onclick() As Boolean
	AdjPMannerAfter.Checked = True
	DisplayMannerPosition (True)
	AdjPMannerAfter_onclick = True
End Function

Private Function AdjPMannerBefore_onclick() As Boolean
	AdjPMannerBefore.Checked = True
	DisplayMannerPosition (True)
	AdjPMannerBefore_onclick = True
End Function

Private Function AdjPMannerEitherSide_onclick() As Boolean
	AdjPMannerEitherSide.Checked = True
	DisplayMannerPosition (True)
	AdjPMannerEitherSide_onclick = True
End Function

Private Function AdjPMannerEitherSideNo_onclick() As Boolean
	AdjPMannerEitherSideNo.Checked = True
	DisplayMannerPosition (True)
	AdjPMannerEitherSideNo_onclick = True
End Function

Private Function AdjPMannerEitherSideYes_onclick() As Boolean
	AdjPMannerEitherSideYes.Checked = True
	DisplayMannerPosition (True)
	AdjPMannerEitherSideYes_onclick = True
End Function

Private Function AdjPModifiersNo_onclick() As Boolean
	AdjPModifiersNo.Checked = True
	DisplayDegreePosition (False)
	DisplayMannerPosition (False)
	AdjPModifiersNo_onclick = True
End Function

Private Function AdjPModifiersYesDegree_onclick() As Boolean
	AdjPModifiersYesDegree.Checked = True
	DisplayDegreePosition (True)
	AdjPModifiersYesDegree_onclick = True
End Function

Private Function AdjPModifiersYesManner_onclick() As Boolean
	AdjPModifiersYesManner.Checked = True
	DisplayMannerPosition (True)
	AdjPModifiersYesManner_onclick = True
End Function

Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//adjp/example")
	If (elem.baseName <> "") Then
		AdjPExamples.Value = elem.Text
	Else
		AdjPExamples.Value = ""
	End If

		' TODO: Spec-initial and spec-internal default
		' TODO: spec-final default
	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//adjp/@degreeEither")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		AdjPDegreeEitherSideYes.Checked = True
		AdjPDegreeEitherSideNo.Checked = False
	Else
		AdjPDegreeEitherSideYes.Checked = False
		AdjPDegreeEitherSideNo.Checked = True
	End If

		' TODO: Spec-initial and spec-internal default
		' TODO: spec-final default
	Set attr = gxmlDom.selectSingleNode("//adjp/@mannerEither")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		AdjPMannerEitherSideYes.Checked = True
		AdjPMannerEitherSideNo.Checked = False
	Else
		AdjPMannerEitherSideYes.Checked = False
		AdjPMannerEitherSideNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//adjp/@degreePos")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	Dim sPos As String
	Dim eSpecPos As geSpecPos
	If (attr.Text = "unknown") Then
		' set default
		eSpecPos = GetSpecifierPos()
		If (eSpecPos = geSpecPos.iInitial Or eSpecPos = geSpecPos.iInternal) Then
			sPos = "before"
		Else
			sPos = "after"
		End If
	Else
		sPos = attr.Text
	End If
	If (sPos = "before") Then
		AdjPDegreeBefore.Checked = True
	Else
		AdjPDegreeBefore.Checked = False
	End If
	If (sPos = "after") Then
		AdjPDegreeAfter.Checked = True
	Else
		AdjPDegreeAfter.Checked = False
	End If
	If (sPos = "either") Then
		AdjPDegreeEitherSide.Checked = True
	Else
		AdjPDegreeEitherSide.Checked = False
	End If

	Set attr = gxmlDom.selectSingleNode("//adjp/@mannerPos")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "unknown") Then
		' set default
		eSpecPos = GetSpecifierPos()
		If (eSpecPos = geSpecPos.iInitial Or eSpecPos = geSpecPos.iInternal) Then
			sPos = "before"
		Else
			sPos = "after"
		End If
	Else
		sPos = attr.Text
	End If
	If (sPos = "before") Then
		AdjPMannerBefore.Checked = True
	Else
		AdjPMannerBefore.Checked = False
	End If
	If (sPos = "after") Then
		AdjPMannerAfter.Checked = True
	Else
		AdjPMannerAfter.Checked = False
	End If
	If (sPos = "either") Then
		AdjPMannerEitherSide.Checked = True
	Else
		AdjPMannerEitherSide.Checked = False
	End If

	Set attr = gxmlDom.selectSingleNode("//adjp/@modifiers")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		AdjPModifiersNo.Checked = True
		AdjPModifiersYesDegree.Checked = False
		AdjPModifiersYesManner.Checked = False
		DisplayDegreePosition (False)
		DisplayMannerPosition (False)
	ElseIf (attr.Text = "yesDegree") Then
		AdjPModifiersNo.Checked = False
		AdjPModifiersYesDegree.Checked = True
		AdjPModifiersYesManner.Checked = False
		DisplayDegreePosition (True)
		DisplayMannerPosition (False)
	Else
		AdjPModifiersNo.Checked = False
		AdjPModifiersYesDegree.Checked = False
		AdjPModifiersYesManner.Checked = True
		DisplayDegreePosition (False)
		DisplayMannerPosition (True)
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function AdjPModifiersNoPrompt_onclick() As Boolean
	AdjPModifiersNo_onclick
	AdjPModifiersNoPrompt_onclick = True
End Function

Private Function AdjPModifiersYesDegreePrompt_onclick() As Boolean
	AdjPModifiersYesDegree_onclick
	AdjPModifiersYesDegreePrompt_onclick = True
End Function

Private Function AdjPDegreeBeforePrompt_onclick() As Boolean
	AdjPDegreeBefore_onclick
	AdjPDegreeBeforePrompt_onclick = True
End Function

		' TODO: Spec-initial and spec-internal default
Private Function AdjPDegreeAfterPrompt_onclick() As Boolean
	AdjPDegreeAfter_onclick
	AdjPDegreeAfterPrompt_onclick = True
End Function

		' TODO: spec-final default
Private Function AdjPDegreeEitherSidePrompt_onclick() As Boolean
	AdjPDegreeEitherSide_onclick
	AdjPDegreeEitherSidePrompt_onclick = True
End Function

Private Function AdjPDegreeEitherSideYesPrompt_onclick() As Boolean
	AdjPDegreeEitherSideYes_onclick
	AdjPDegreeEitherSideYesPrompt_onclick = True
End Function

Private Function AdjPDegreeEitherSideNoPrompt_onclick() As Boolean
	AdjPDegreeEitherSideNo_onclick
	AdjPDegreeEitherSideNoPrompt_onclick = True
End Function

Private Function AdjPModifiersYesMannerPrompt_onclick() As Boolean
	AdjPModifiersYesManner_onclick
	AdjPModifiersYesMannerPrompt_onclick = True
End Function

Private Function AdjPMannerBeforePrompt_onclick() As Boolean
	AdjPMannerBefore_onclick
	AdjPMannerBeforePrompt_onclick = True
End Function

		' TODO: Spec-initial and spec-internal default
Private Function AdjPMannerAfterPrompt_onclick() As Boolean
	AdjPMannerAfter_onclick
	AdjPMannerAfterPrompt_onclick = True
End Function

		' TODO: spec-final default
Private Function AdjPMannerEitherSidePrompt_onclick() As Boolean
	AdjPMannerEitherSide_onclick
	AdjPMannerEitherSidePrompt_onclick = True
End Function

Private Function AdjPMannerEitherSideYesPrompt_onclick() As Boolean
	AdjPMannerEitherSideYes_onclick
	AdjPMannerEitherSideYesPrompt_onclick = True
End Function

Private Function AdjPMannerEitherSideNoPrompt_onclick() As Boolean
	AdjPMannerEitherSideNo_onclick
	AdjPMannerEitherSideNoPrompt_onclick = True
End Function

Private Function AdjPModifiersOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//adjp/example")
	'TODO: figure what to do if any of these are missing!
	elem.Text = AdjPExamples.Value

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//adjp/@modifiers")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (AdjPModifiersNo.Checked) Then sTemp = "no"
	If (AdjPModifiersYesDegree.Checked) Then sTemp = "yesDegree"
	If (AdjPModifiersYesManner.Checked) Then sTemp = "yesManner"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//adjp/@degreePos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (AdjPDegreeBefore.Checked) Then sTemp = "before"
	If (AdjPDegreeAfter.Checked) Then sTemp = "after"
	If (AdjPDegreeEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

		' TODO: Spec-initial and spec-internal default
		' TODO: spec-final default
	Set attr = gxmlDom.selectSingleNode("//adjp/@degreeEither")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (AdjPDegreeEitherSideYes.Checked) Then sTemp = "yes"
	If (AdjPDegreeEitherSideNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//adjp/@mannerPos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (AdjPMannerBefore.Checked) Then sTemp = "before"
	If (AdjPMannerAfter.Checked) Then sTemp = "after"
	If (AdjPMannerEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

		' TODO: Spec-initial and spec-internal default
		' TODO: spec-final default
	Set attr = gxmlDom.selectSingleNode("//adjp/@mannerEither")
	'TODO: figure what to do if any of these are missing!
	sTemp = "yes" ' default if all else fails...
	If (AdjPMannerEitherSideYes.Checked) Then sTemp = "yes"
	If (AdjPMannerEitherSideNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	AdjPModifiersOK_onclick = True

	BaseWindow.navigate "AdjPAgreement.htm"
End Function

Private Function AdjPModifiersCancel_onclick() As Boolean
	AdjPModifiersCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayDegreeEitherSide(bYes As Boolean)
	Dim sValue As String
	If (bYes) Then
		sValue = ""
	Else
		sValue = "none"
	End If
	AdjPModifiersYesDegreeEitherSideTable.Style.display = sValue
	If (bYes) Then
		If (AdjPDegreeEitherSideYes.Checked = True) Then
			AdjPDegreeEitherSideNoInstruction.Style.display = "none"
		Else
			AdjPDegreeEitherSideNoInstruction.Style.display = ""
		End If
	Else
		AdjPDegreeEitherSideNoInstruction.Style.display = "none"
	End If
End Sub
Private Sub DisplayDegreePosition(bYes As Boolean)
	Dim sValue As String
	If (bYes) Then
		sValue = ""
	Else
		sValue = "none"
	End If
	AdjPModifiersYesDegreeTable.Style.display = sValue
	AdjPModifiersYesDegreeInstruction.Style.display = sValue
	AdjPModifiersYesMannerEitherSideTable.Style.display = "none"
	AdjPModifiersYesMannerInstruction.Style.display = "none"
	AdjPMannerEitherSideNoInstruction.Style.display = "none"
	DisplayMannerEitherSide (False)
	DisplayDegreeEitherSide (AdjPDegreeEitherSide.Checked)
End Sub

Private Sub DisplayMannerEitherSide(bYes As Boolean)
	Dim sValue As String
	If (bYes) Then
		sValue = ""
	Else
		sValue = "none"
	End If
	AdjPModifiersYesMannerEitherSideTable.Style.display = sValue
	If (bYes) Then
		If (AdjPMannerEitherSideYes.Checked = True) Then
			AdjPMannerEitherSideNoInstruction.Style.display = "none"
		Else
			AdjPMannerEitherSideNoInstruction.Style.display = ""
		End If
	Else
		AdjPMannerEitherSideNoInstruction.Style.display = "none"
	End If
End Sub
Private Sub DisplayMannerPosition(bYes As Boolean)
	Dim sValue As String
	If (bYes) Then
		sValue = ""
	Else
		sValue = "none"
	End If
	AdjPModifiersYesMannerTable.Style.display = sValue
	AdjPModifiersYesMannerInstruction.Style.display = sValue
	AdjPModifiersYesDegreeEitherSideTable.Style.display = "none"
	AdjPModifiersYesDegreeInstruction.Style.display = "none"
	AdjPDegreeEitherSideNoInstruction.Style.display = "none"
	DisplayMannerEitherSide (AdjPMannerEitherSide.Checked)
	DisplayDegreeEitherSide (False)
End Sub
