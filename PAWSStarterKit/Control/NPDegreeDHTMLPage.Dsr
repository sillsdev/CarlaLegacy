VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPDegreeDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6780
   _ExtentX        =   11959
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\NPDegree.htm"
   BuildFile       =   "..\Control\NPDegree.htm"
   BuildMode       =   0
   TypeLibCookie   =   89
   AsyncLoad       =   0   'False
   id              =   "NPDegreeDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPDegreeDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//np/@degree")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		NPDegreeNo.Checked = True
	Else
		NPDegreeYes.Checked = True
	End If

		' TODO: skip to articles and demonstratives
	Set attr = gxmlDom.selectSingleNode("//np/@degreePos")
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
		NPDegreeBefore.Checked = True
	ElseIf (sPos = "after") Then
		NPDegreeAfter.Checked = True
	Else
		NPDegreeEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@degreeEither")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		NPDegreeEitherSideYes.Checked = True
	Else
		NPDegreeEitherSideNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@degreeBoth")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		NPDegreeBothNo.Checked = True
	ElseIf (attr.Text = "yesBoth") Then
		NPDegreeBothYesBoth.Checked = True
	ElseIf (attr.Text = "yesInitial") Then
		NPDegreeBothYesOnlyInitial.Checked = True
	Else
		NPDegreeBothYesOnlyFinal.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@degreeInitialFinal")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		NPDegreeBothYesOnlyInitialFinalNo.Checked = True
	Else
		NPDegreeBothYesOnlyInitialFinalYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@degreeFinalInitial")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		NPDegreeBothYesOnlyFinalInitialNo.Checked = True
	Else
		NPDegreeBothYesOnlyFinalInitialYes.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPDegreeAfter_onclick() As Boolean
	NPDegreeAfter.Checked = True
	DisplayHidden
	NPDegreeAfter_onclick = True
End Function

Private Function NPDegreeBefore_onclick() As Boolean
	NPDegreeBefore.Checked = True
	DisplayHidden
	NPDegreeBefore_onclick = True
End Function

Private Function NPDegreeBothNo_onclick() As Boolean
	NPDegreeBothNo.Checked = True
	DisplayHidden
	NPDegreeBothNo_onclick = True
End Function

Private Function NPDegreeBothYesBoth_onclick() As Boolean
	NPDegreeBothYesBoth.Checked = True
	DisplayHidden
	NPDegreeBothYesBoth_onclick = True
End Function

Private Function NPDegreeBothYesOnlyFinal_onclick() As Boolean
	NPDegreeBothYesOnlyFinal.Checked = True
	DisplayHidden
	NPDegreeBothYesOnlyFinal_onclick = True
End Function

Private Function NPDegreeBothYesOnlyFinalInitialNo_onclick() As Boolean
	NPDegreeBothYesOnlyFinalInitialNo.Checked = True
	DisplayHidden
	NPDegreeBothYesOnlyFinalInitialNo_onclick = True
End Function

Private Function NPDegreeBothYesOnlyFinalInitialYes_onclick() As Boolean
	NPDegreeBothYesOnlyFinalInitialYes.Checked = True
	DisplayHidden
	NPDegreeBothYesOnlyFinalInitialYes_onclick = True
End Function

Private Function NPDegreeBothYesOnlyInitial_onclick() As Boolean
	NPDegreeBothYesOnlyInitial.Checked = True
	DisplayHidden
	NPDegreeBothYesOnlyInitial_onclick = True
End Function

Private Function NPDegreeBothYesOnlyInitialFinalNo_onclick() As Boolean
	NPDegreeBothYesOnlyInitialFinalNo.Checked = True
	DisplayHidden
	NPDegreeBothYesOnlyInitialFinalNo_onclick = True
End Function

Private Function NPDegreeBothYesOnlyInitialFinalYes_onclick() As Boolean
	NPDegreeBothYesOnlyInitialFinalYes.Checked = True
	DisplayHidden
	NPDegreeBothYesOnlyInitialFinalYes_onclick = True
End Function

Private Function NPDegreeEitherSide_onclick() As Boolean
	NPDegreeEitherSide.Checked = True
	DisplayHidden
	NPDegreeEitherSide_onclick = True
End Function

Private Function NPDegreeEitherSideNo_onclick() As Boolean
	NPDegreeEitherSideNo.Checked = True
	DisplayHidden
	NPDegreeEitherSideNo_onclick = True
End Function

Private Function NPDegreeEitherSideYes_onclick() As Boolean
	NPDegreeEitherSideYes.Checked = True
	DisplayHidden
	NPDegreeEitherSideYes_onclick = True
End Function

Private Function NPDegreeNo_onclick() As Boolean
	NPDegreeNo.Checked = True
	DisplayHidden
	NPDegreeNo_onclick = True
End Function

Private Function NPDegreeNoPrompt_onclick() As Boolean
	NPDegreeNo_onclick
	NPDegreeNoPrompt_onclick = True
End Function

Private Function NPDegreeYes_onclick() As Boolean
	NPDegreeYes.Checked = True
	DisplayHidden
	NPDegreeYes_onclick = True
End Function

		' TODO: skip to articles and demonstratives
Private Function NPDegreeYesPrompt_onclick() As Boolean
	NPDegreeYes_onclick
	NPDegreeYesPrompt_onclick = True
End Function

Private Function NPDegreeBeforePrompt_onclick() As Boolean
	NPDegreeBefore_onclick
	NPDegreeBeforePrompt_onclick = True
End Function

Private Function NPDegreeAfterPrompt_onclick() As Boolean
	NPDegreeAfter_onclick
	NPDegreeAfterPrompt_onclick = True
End Function

Private Function NPDegreeEitherSidePrompt_onclick() As Boolean
	NPDegreeEitherSide_onclick
	NPDegreeEitherSidePrompt_onclick = True
End Function

Private Function NPDegreeEitherSideYesPrompt_onclick() As Boolean
	NPDegreeEitherSideYes_onclick
	NPDegreeEitherSideYesPrompt_onclick = True
End Function

Private Function NPDegreeEitherSideNoPrompt_onclick() As Boolean
	NPDegreeEitherSideNo_onclick
	NPDegreeEitherSideNoPrompt_onclick = True
End Function

Private Function NPDegreeBothNoPrompt_onclick() As Boolean
	NPDegreeBothNo_onclick
	NPDegreeBothNoPrompt_onclick = True
End Function

Private Function NPDegreeBothYesBothPrompt_onclick() As Boolean
	NPDegreeBothYesBoth_onclick
	NPDegreeBothYesBothPrompt_onclick = True
End Function

Private Function NPDegreeBothYesOnlyInitialPrompt_onclick() As Boolean
	NPDegreeBothYesOnlyInitial_onclick
	NPDegreeBothYesOnlyInitialPrompt_onclick = True
End Function

Private Function NPDegreeBothYesOnlyInitialFinalNoPrompt_onclick() As Boolean
	NPDegreeBothYesOnlyInitialFinalNo_onclick
	NPDegreeBothYesOnlyInitialFinalNoPrompt_onclick = True
End Function

Private Function NPDegreeBothYesOnlyInitialFinalYesPrompt_onclick() As Boolean
	NPDegreeBothYesOnlyInitialFinalYes_onclick
	NPDegreeBothYesOnlyInitialFinalYesPrompt_onclick = True
End Function

Private Function NPDegreeBothYesOnlyFinalPrompt_onclick() As Boolean
	NPDegreeBothYesOnlyFinal_onclick
	NPDegreeBothYesOnlyFinalPrompt_onclick = True
End Function

Private Function NPDegreeBothYesOnlyFinalInitialNoPrompt_onclick() As Boolean
	NPDegreeBothYesOnlyFinalInitialNo_onclick
	NPDegreeBothYesOnlyFinalInitialNoPrompt_onclick = True
End Function

Private Function NPDegreeBothYesOnlyFinalInitialYesPrompt_onclick() As Boolean
	NPDegreeBothYesOnlyFinalInitialYes_onclick
	NPDegreeBothYesOnlyFinalInitialYesPrompt_onclick = True
End Function

Private Function NPDegreeOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//np/@degree")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPDegreeNo.Checked) Then sTemp = "no"
	If (NPDegreeYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

		' TODO: skip to articles and demonstratives
	Set attr = gxmlDom.selectSingleNode("//np/@degreePos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (NPDegreeBefore.Checked) Then sTemp = "before"
	If (NPDegreeAfter.Checked) Then sTemp = "after"
	If (NPDegreeEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@degreeEither")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPDegreeEitherSideYes.Checked) Then sTemp = "yes"
	If (NPDegreeEitherSideNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@degreeBoth")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPDegreeBothNo.Checked) Then sTemp = "no"
	If (NPDegreeBothYesBoth.Checked) Then sTemp = "yesBoth"
	If (NPDegreeBothYesOnlyInitial.Checked) Then sTemp = "yesInitial"
	If (NPDegreeBothYesOnlyFinal.Checked) Then sTemp = "yesFinal"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@degreeInitialFinal")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPDegreeBothYesOnlyInitialFinalNo.Checked) Then sTemp = "no"
	If (NPDegreeBothYesOnlyInitialFinalYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@degreeFinalInitial")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPDegreeBothYesOnlyFinalInitialNo.Checked) Then sTemp = "no"
	If (NPDegreeBothYesOnlyFinalInitialYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	NPDegreeOK_onclick = True

	BaseWindow.navigate "NPContents.htm"
End Function

Private Function NPDegreeCancel_onclick() As Boolean
	NPDegreeCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (NPDegreeYes.Checked) Then
		NPDegreePosTable.Style.display = ""
		DisplayEitherSide
	Else
		NPDegreePosTable.Style.display = "none"
		NPDegreeEitherSideNoInstruction.Style.display = "none"
	End If
End Sub
Private Sub DisplayEitherSide()
	If (NPDegreeEitherSide.Checked) Then
		NPDegreeEitherTable.Style.display = ""
		DisplayEitherSideNo
	Else
		NPDegreeEitherTable.Style.display = "none"
		NPDegreeEitherSideNoInstruction.Style.display = "none"
	End If
End Sub
Private Sub DisplayEitherSideNo()
	NPDegreeEitherSideNoTable.Style.display = ""
	If (NPDegreeEitherSideNo.Checked) Then
		NPDegreeEitherSideNoInstruction.Style.display = ""
	Else
		NPDegreeEitherSideNoInstruction.Style.display = "none"
	End If
	DisplayEitherSideBoth
End Sub
Private Sub DisplayEitherSideBoth()
	If (NPDegreeBothYesOnlyInitial.Checked) Then
		NPDegreeBothYesOnlyInitialTable.Style.display = ""
		NPDegreeBothYesOnlyFinalTable.Style.display = "none"
	Else
		NPDegreeBothYesOnlyInitialTable.Style.display = "none"
		If (NPDegreeBothYesOnlyFinal.Checked) Then
			NPDegreeBothYesOnlyFinalTable.Style.display = ""
		Else
			NPDegreeBothYesOnlyFinalTable.Style.display = "none"
		End If
	End If
End Sub
