VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} QPOrdinalDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5790
   _ExtentX        =   10213
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\QPOrdinal.htm"
   BuildFile       =   "..\Control\QPOrdinal.htm"
   BuildMode       =   0
   TypeLibCookie   =   144
   AsyncLoad       =   0   'False
   id              =   "QPOrdinalDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "QPOrdinalDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private Sub DHTMLPage_Load()
	Dim elem As IXMLDOMNode
	Dim attr As IXMLDOMNode
	Dim sPos As String
	Dim sForm As String
	Dim eSpecPos As geSpecPos
	Set elem = gxmlDom.selectSingleNode("//qp/ordinalExample")
	If (elem.baseName <> "") Then
		QPOrdinalExample.Value = elem.Text
	Else
		QPOrdinalExample.Value = ""
	End If
	Set attr = gxmlDom.selectSingleNode("//qp/@ordinalPos")
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
		QPOrdinalBefore.Checked = True
	Else
		QPOrdinalBefore.Checked = False
	End If
	If (sPos = "after") Then
		QPOrdinalAfter.Checked = True
	Else
		QPOrdinalAfter.Checked = False
	End If
	If (sPos = "either") Then
		QPOrdinalEitherSide.Checked = True
	Else
		QPOrdinalEitherSide.Checked = False
	End If
	Set attr = gxmlDom.selectSingleNode("//qp/@ordinalFormation")
	If (attr.baseName = "") Then
		'todo: create one
	End If
	If (attr.Text = "affix") Then
		QPOrdinalAffix.Checked = True
		QPOrdinalIndependent.Checked = False
		QPOrdinalAffixInstruction.Style.display = ""
		QPOrdinalIndependentInstruction.Style.display = "none"

	Else
		QPOrdinalAffix.Checked = False
		QPOrdinalIndependent.Checked = True
		QPOrdinalAffixInstruction.Style.display = "none"
		QPOrdinalIndependentInstruction.Style.display = ""
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus

End Sub

Private Function QPOrdinalAffix_onclick() As Boolean
	QPOrdinalAffix_onclick = True
	QPOrdinalAffix.Checked = True

	QPOrdinalAffixInstruction.Style.display = ""
	QPOrdinalIndependentInstruction.Style.display = "none"
End Function

Private Function QPOrdinalAffixPrompt_onclick() As Boolean
	QPOrdinalAffix.Checked = True
	QPOrdinalAffixPrompt_onclick = True
End Function

Private Function QPOrdinalAfterPrompt_onclick() As Boolean
	QPOrdinalAfter.Checked = True
	QPOrdinalAfterPrompt_onclick = True
End Function

Private Function QPOrdinalBeforePrompt_onclick() As Boolean
	QPOrdinalBefore.Checked = True
	QPOrdinalBeforePrompt_onclick = True
End Function

Private Function QPOrdinalCancel_onclick() As Boolean
	QPOrdinalCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Function QPOrdinalEitherSidePrompt_onclick() As Boolean
	QPOrdinalEitherSide.Checked = True
	QPOrdinalEitherSidePrompt_onclick = True
End Function

Private Function QPOrdinalIndependent_onclick() As Boolean
	QPOrdinalIndependent_onclick = True
	QPOrdinalIndependent.Checked = True

	QPOrdinalAffixInstruction.Style.display = "none"
	QPOrdinalIndependentInstruction.Style.display = ""

End Function

Private Function QPOrdinalIndependentPrompt_onclick() As Boolean
	QPOrdinalIndependent.Checked = True
	QPOrdinalIndependentPrompt_onclick = True
End Function

Private Function QPOrdinalOK_onclick() As Boolean
	Dim elem As IXMLDOMNode
	Dim attr As IXMLDOMNode
	Dim sPos As String
	Dim sForm As String
	Set elem = gxmlDom.selectSingleNode("//qp/ordinalExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = QPOrdinalExample.Value
	Set attr = gxmlDom.selectSingleNode("//qp/@ordinalFormation")
	sForm = "affix" ' default if all else fails...
	If (QPOrdinalAffix.Checked) Then sForm = "affix"
	If (QPOrdinalIndependent.Checked) Then sForm = "independent"
	attr.Text = sForm
	Set attr = gxmlDom.selectSingleNode("//qp/@ordinalPos")
	sPos = "before" ' default if all else fails...
	If (QPOrdinalBefore.Checked) Then sPos = "before"
	If (QPOrdinalAfter.Checked) Then sPos = "after"
	If (QPOrdinalEitherSide.Checked) Then sPos = "either"
	attr.Text = sPos

	gbDirty = True  ' mark it as having changed

	QPOrdinalOK_onclick = True

	BaseWindow.navigate "QPTesting.htm"

End Function
