VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} AdvPDegreeDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   _ExtentX        =   11906
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\AdvPDegree.htm"
   BuildFile       =   "..\Control\AdvPDegree.htm"
   BuildMode       =   0
   TypeLibCookie   =   278
   AsyncLoad       =   0   'False
   id              =   "AdvPDegreeDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "AdvPDegreeDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private Function AdvPDegreeAfter_onclick() As Boolean
	AdvPDegreeAfter.Checked = True
	DisplayEitherSide (False)
	AdvPDegreeAfter_onclick = True
End Function

Private Function AdvPDegreeBefore_onclick() As Boolean
	AdvPDegreeBefore.Checked = True
	DisplayEitherSide (False)
	AdvPDegreeBefore_onclick = True
End Function

Private Function AdvPDegreeEitherNo_onclick() As Boolean
	AdvPDegreeEitherNo.Checked = True
	DisplayEitherSide (True)
	AdvPDegreeEitherNo_onclick = True
End Function

Private Function AdvPDegreeEitherSide_onclick() As Boolean
	AdvPDegreeEitherSide.Checked = True
	DisplayEitherSide (True)
	AdvPDegreeEitherSide_onclick = True
End Function

Private Function AdvPDegreeEitherYes_onclick() As Boolean
	AdvPDegreeEitherYes.Checked = True
	DisplayEitherSide (True)
	AdvPDegreeEitherYes_onclick = True
End Function

Private Function AdvPDegreeNo_onclick() As Boolean
	AdvPDegreeNo.Checked = True
	AdvPDegreeYes.Checked = False
	DisplayPosition (False)

	AdvPDegreeNo_onclick = True
End Function

Private Function AdvPDegreeYes_onclick() As Boolean
	AdvPDegreeYes.Checked = True
	AdvPDegreeNo.Checked = False
	DisplayPosition (True)

	AdvPDegreeYes_onclick = True
End Function

Private Function AdvPSetAlmost_onclick() As Boolean
	AdvPSetAlmost.Checked = True
	DisplayEitherSide (True)
	AdvPSetAlmost_onclick = True
End Function

Private Function AdvPSetNo_onclick() As Boolean
	AdvPSetNo.Checked = True
	DisplayEitherSide (True)
	AdvPSetNo_onclick = True
End Function

Private Function AdvPSetYes_onclick() As Boolean
	AdvPSetYes.Checked = True
	DisplayEitherSide (True)
	AdvPSetYes_onclick = True
End Function

Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//advp/@degree")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		AdvPDegreeNo.Checked = False
		AdvPDegreeYes.Checked = True
		DisplayPosition (True)
	Else
		AdvPDegreeNo.Checked = True
		AdvPDegreeYes.Checked = False
		DisplayPosition (False)
	End If

		' TODO: Following is grayed out unless the either button is checked
	Set attr = gxmlDom.selectSingleNode("//advp/@degreeEither")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		AdvPDegreeEitherYes.Checked = True
		AdvPDegreeEitherNo.Checked = False
	Else
		AdvPDegreeEitherYes.Checked = False
		AdvPDegreeEitherNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//advp/@degreeSet")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		AdvPSetYes.Checked = True
		AdvPSetAlmost.Checked = False
		AdvPSetNo.Checked = False
	ElseIf (attr.Text = "no") Then
		AdvPSetYes.Checked = False
		AdvPSetAlmost.Checked = False
		AdvPSetNo.Checked = True
	Else
		AdvPSetYes.Checked = False
		AdvPSetAlmost.Checked = True
		AdvPSetNo.Checked = False
	End If

	Set attr = gxmlDom.selectSingleNode("//advp/@degreePos")
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
		AdvPDegreeBefore.Checked = True
	Else
		AdvPDegreeBefore.Checked = False
	End If
	If (sPos = "after") Then
		AdvPDegreeAfter.Checked = True
	Else
		AdvPDegreeAfter.Checked = False
	End If
	If (sPos = "either") Then
		DisplayEitherSide (True)
		AdvPDegreeEitherSide.Checked = True
	Else
		DisplayEitherSide (False)
		AdvPDegreeEitherSide.Checked = False
	End If

		' TODO: End of grayed out section
				' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function AdvPDegreeNoPrompt_onclick() As Boolean
	AdvPDegreeNo_onclick
	DisplayPosition (False)
	AdvPDegreeNoPrompt_onclick = True
End Function

Private Function AdvPDegreeYesPrompt_onclick() As Boolean
	AdvPDegreeYes_onclick
	DisplayPosition (True)
	AdvPDegreeYesPrompt_onclick = True
End Function

Private Function AdvPDegreeBeforePrompt_onclick() As Boolean
	AdvPDegreeBefore_onclick
	DisplayEitherSide (False)
	AdvPDegreeBeforePrompt_onclick = True
End Function

		' TODO: Before is Spec-initial default; is Spec-internal default.
Private Function AdvPDegreeAfterPrompt_onclick() As Boolean
	AdvPDegreeAfter_onclick
	DisplayEitherSide (False)
	AdvPDegreeAfterPrompt_onclick = True
End Function

		' TODO: After is Spec-final default.
Private Function AdvPDegreeEitherSidePrompt_onclick() As Boolean
	AdvPDegreeEitherSide_onclick
	DisplayEitherSide (True)
	AdvPDegreeEitherSidePrompt_onclick = True
End Function

		' TODO: Following is grayed out unless the either button is checked
Private Function AdvPDegreeEitherYesPrompt_onclick() As Boolean
	AdvPDegreeEitherYes.Checked = True
	DisplayEitherSide (True)
	AdvPDegreeEitherYesPrompt_onclick = True
End Function

Private Function AdvPDegreeEitherNoPrompt_onclick() As Boolean
	AdvPDegreeEitherNo.Checked = True
	DisplayEitherSide (True)
	AdvPDegreeEitherNoPrompt_onclick = True
End Function

Private Function AdvPSetYesPrompt_onclick() As Boolean
	AdvPSetYes_onclick
	DisplayEitherSide (True)
	AdvPSetYesPrompt_onclick = True
End Function

Private Function AdvPSetAlmostPrompt_onclick() As Boolean
	AdvPSetAlmost_onclick
	DisplayEitherSide (True)
	AdvPSetAlmostPrompt_onclick = True
End Function

Private Function AdvPSetNoPrompt_onclick() As Boolean
	AdvPSetNo_onclick
	DisplayEitherSide (True)
	AdvPSetNoPrompt_onclick = True
End Function

		' TODO: Show appropriate instruction, depending on how they answered
		' TODO: Yes
		' TODO: almost:
		' TODO: no:
		' TODO: End of grayed out section
Private Function AdvPDegreeOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//advp/@degree")
	'TODO: figure what to do if any of these are missing!
	sTemp = "yes" ' default if all else fails...
	If (AdvPDegreeNo.Checked) Then sTemp = "no"
	If (AdvPDegreeYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//advp/@degreePos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "before" ' default if all else fails...
	If (AdvPDegreeBefore.Checked) Then sTemp = "before"
	If (AdvPDegreeAfter.Checked) Then sTemp = "after"
	If (AdvPDegreeEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

		' TODO: Before is Spec-initial default; is Spec-internal default.
		' TODO: After is Spec-final default.
		' TODO: Following is grayed out unless the either button is checked
	Set attr = gxmlDom.selectSingleNode("//advp/@degreeEither")
	'TODO: figure what to do if any of these are missing!
	sTemp = "yes" ' default if all else fails...
	If (AdvPDegreeEitherYes.Checked) Then sTemp = "yes"
	If (AdvPDegreeEitherNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//advp/@degreeSet")
	'TODO: figure what to do if any of these are missing!
	sTemp = "yes" ' default if all else fails...
	If (AdvPSetYes.Checked) Then sTemp = "yes"
	If (AdvPSetAlmost.Checked) Then sTemp = "almost"
	If (AdvPSetNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

		' TODO: Show appropriate instruction, depending on how they answered
		' TODO: Yes
		' TODO: almost:
		' TODO: no:
		' TODO: End of grayed out section
	gbDirty = True  ' mark it as having changed

	AdvPDegreeOK_onclick = True

	BaseWindow.navigate "AdvPTesting.htm"
End Function

Private Function AdvPDegreeCancel_onclick() As Boolean
	AdvPDegreeCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayEitherSide(bYes As Boolean)
	Dim sValue As String
	If (bYes) Then
		sValue = ""
	Else
		sValue = "none"
	End If
	AdvPDegreeEitherSideTable1.Style.display = sValue
	AdvPDegreeEitherSideTable2.Style.display = sValue
	If (bYes) Then
		If (AdvPDegreeEitherSide.Checked And AdvPDegreeEitherNo.Checked) Then
			AdvPDegreeEitherNoInstuction.Style.display = ""
		Else
			AdvPDegreeEitherNoInstuction.Style.display = "none"
		End If
		If (AdvPSetYes.Checked = True) Then
			AdvPSetYesInstruction.Style.display = ""
			AdvPSetAlmostInstruction.Style.display = "none"
			AdvPSetNoInstruction.Style.display = "none"
		ElseIf (AdvPSetAlmost.Checked = True) Then
			AdvPSetYesInstruction.Style.display = "none"
			AdvPSetAlmostInstruction.Style.display = ""
			AdvPSetNoInstruction.Style.display = "none"
		Else
			AdvPSetYesInstruction.Style.display = "none"
			AdvPSetAlmostInstruction.Style.display = "none"
			AdvPSetNoInstruction.Style.display = ""
		End If
	Else
		AdvPSetYesInstruction.Style.display = sValue
		AdvPSetAlmostInstruction.Style.display = sValue
		AdvPSetNoInstruction.Style.display = sValue
		AdvPDegreeEitherNoInstuction.Style.display = "none"
	End If
End Sub
Private Sub DisplayPosition(bYes As Boolean)
	Dim sValue As String
	If (bYes) Then
		sValue = ""
	Else
		sValue = "none"
	End If
	AdvPDegreeYesTable.Style.display = sValue
End Sub
