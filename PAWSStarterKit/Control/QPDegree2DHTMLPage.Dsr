VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} QPDegree2DHTMLPage
   ClientHeight    =   7110
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7485
   _ExtentX        =   13203
   _ExtentY        =   12541
   SourceFile      =   "..\HTMs\QPDegree2.htm"
   BuildFile       =   "..\Control\QPDegree2.htm"
   BuildMode       =   0
   TypeLibCookie   =   422
   AsyncLoad       =   0   'False
   id              =   "QPDegree2DHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "QPDegree2DHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private Sub DHTMLPage_Load()
	Dim elem As IXMLDOMNode
	Dim attr As IXMLDOMNode
	Dim sPos As String
	Dim sEither As String
	Dim eSpecPos As geSpecPos
	Set elem = gxmlDom.selectSingleNode("//qp/degreeExample")
	If (elem.baseName <> "") Then
		QPDegreeExample.Value = elem.Text
	Else
		QPDegreeExample.Value = ""
	End If
	Set attr = gxmlDom.selectSingleNode("//qp/@degreeEither")
	If (attr.baseName = "") Then
		'todo: create one
	End If
	If (attr.Text = "yes") Then
		QPDegreeEitherYes.Checked = True
		QPDegreeEitherNo.Checked = False
	Else
		QPDegreeEitherYes.Checked = False
		QPDegreeEitherNo.Checked = True
	End If
	Set attr = gxmlDom.selectSingleNode("//qp/@degreePos")
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
		QPDegreeBefore.Checked = True
	Else
		QPDegreeBefore.Checked = False
	End If
	If (sPos = "after") Then
		QPDegreeAfter.Checked = True
	Else
		QPDegreeAfter.Checked = False
	End If
	If (sPos = "either") Then
		DisplayEitherSide (True)
		QPDegreeEitherSide.Checked = True
	Else
		DisplayEitherSide (False)
		QPDegreeEitherSide.Checked = False
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function QPDegree2OK_onclick() As Boolean
	Dim elem As IXMLDOMNode
	Dim attr As IXMLDOMNode
	Dim sPos As String
	Dim sEither As String
	Set elem = gxmlDom.selectSingleNode("//qp/degreeExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = QPDegreeExample.Value
	Set attr = gxmlDom.selectSingleNode("//qp/@degreePos")
	sPos = "before" ' default if all else fails...
	If (QPDegreeBefore.Checked) Then sPos = "before"
	If (QPDegreeAfter.Checked) Then sPos = "after"
	If (QPDegreeEitherSide.Checked) Then sPos = "either"
	attr.Text = sPos
	Set attr = gxmlDom.selectSingleNode("//qp/@degreeEither")
	sEither = "no" ' default if all else fails...
	If (QPDegreeEitherYes.Checked) Then sEither = "yes"
	If (QPDegreeEitherNo.Checked) Then sEither = "no"
	attr.Text = sEither

	gbDirty = True  ' mark it as having changed

	QPDegree2OK_onclick = True

	BaseWindow.navigate "QPCardinal.htm"

End Function

Private Function QPDegree2Cancel_onclick() As Boolean
	QPDegree2Cancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next
End Function

Private Function QPDegreeAfter_onclick() As Boolean
	QPDegreeAfter_onclick = True
	QPDegreeAfter.Checked = True

	DisplayEitherSide (False)
End Function

Private Function QPDegreeAfterPrompt_onclick() As Boolean
	QPDegreeAfter_onclick
End Function

Private Function QPDegreeBefore_onclick() As Boolean
	QPDegreeBefore_onclick = True
	QPDegreeBefore.Checked = True

	DisplayEitherSide (False)

End Function

Private Function QPDegreeBeforePrompt_onclick() As Boolean
	QPDegreeBefore_onclick
End Function

Private Function QPDegreeEitherNo_onclick() As Boolean
	QPDegreeEitherNo_onclick = True
	QPDegreeEitherNo.Checked = True

	QPDegreeEitherNoInstruction.Style.display = ""
End Function

Private Function QPDegreeEitherNoPrompt_onclick() As Boolean
	QPDegreeEitherNo_onclick
End Function

Private Function QPDegreeEitherSide_onclick() As Boolean
	QPDegreeEitherSide_onclick = True
	QPDegreeEitherSide.Checked = True

	DisplayEitherSide (True)

End Function

Private Function QPDegreeEitherSidePrompt_onclick() As Boolean
	QPDegreeEitherSide_onclick
End Function

Private Function QPDegreeEitherYes_onclick() As Boolean
	QPDegreeEitherYes_onclick = True
	QPDegreeEitherYes.Checked = True

	QPDegreeEitherNoInstruction.Style.display = "none"

End Function

Private Sub DisplayEitherSide(bYes As Boolean)
	Dim sValue As String
	If (bYes) Then
		sValue = ""
	Else
		sValue = "none"
	End If
	QPDegreeEitherSideTable.Style.display = sValue
	If (bYes) Then
		If (QPDegreeEitherNo.Checked = True) Then
			QPDegreeEitherNoInstruction.Style.display = ""
		Else
			QPDegreeEitherNoInstruction.Style.display = "none"
		End If
	Else
		QPDegreeEitherNoInstruction.Style.display = sValue
	End If
End Sub

Private Function QPDegreeEitherYesPrompt_onclick() As Boolean
	QPDegreeEitherYes_onclick
End Function
