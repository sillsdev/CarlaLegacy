VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPAdjP2DHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6615
   _ExtentX        =   11668
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\NPAdjP2.htm"
   BuildFile       =   "..\Control\NPAdjP2.htm"
   BuildMode       =   0
   TypeLibCookie   =   84
   AsyncLoad       =   0   'False
   id              =   "NPAdjP2DHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPAdjP2DHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//np/@adjpPos")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	sPos = gGetPositionBasedOnSpecifier(attr.Text)
	If (sPos = "before") Then
		NPAdjPPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		NPAdjPPosAfter.Checked = True
	Else
		NPAdjPPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@adjpEither")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		NPAdjPPosEitherSideEitherYes.Checked = True
	Else
		NPAdjPPosEitherSideEitherNo.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPAdjPPosBefore_onclick() As Boolean
	NPAdjPPosBefore.Checked = True
	DisplayHidden
	NPAdjPPosBefore_onclick = True
End Function
Private Function NPAdjPPosBeforePrompt_onclick() As Boolean
	NPAdjPPosBefore_onclick
	NPAdjPPosBeforePrompt_onclick = True
End Function

Private Function NPAdjPPosAfter_onclick() As Boolean
	NPAdjPPosAfter.Checked = True
	DisplayHidden
	NPAdjPPosAfter_onclick = True
End Function
Private Function NPAdjPPosAfterPrompt_onclick() As Boolean
	NPAdjPPosAfter_onclick
	NPAdjPPosAfterPrompt_onclick = True
End Function

Private Function NPAdjPPosEitherSide_onclick() As Boolean
	NPAdjPPosEitherSide.Checked = True
	DisplayHidden
	NPAdjPPosEitherSide_onclick = True
End Function
Private Function NPAdjPPosEitherSidePrompt_onclick() As Boolean
	NPAdjPPosEitherSide_onclick
	NPAdjPPosEitherSidePrompt_onclick = True
End Function

Private Function NPAdjPPosEitherSideEitherYes_onclick() As Boolean
	NPAdjPPosEitherSideEitherYes.Checked = True
	DisplayHidden
	NPAdjPPosEitherSideEitherYes_onclick = True
End Function
Private Function NPAdjPPosEitherSideEitherYesPrompt_onclick() As Boolean
	NPAdjPPosEitherSideEitherYes_onclick
	NPAdjPPosEitherSideEitherYesPrompt_onclick = True
End Function

Private Function NPAdjPPosEitherSideEitherNo_onclick() As Boolean
	NPAdjPPosEitherSideEitherNo.Checked = True
	DisplayHidden
	NPAdjPPosEitherSideEitherNo_onclick = True
End Function
Private Function NPAdjPPosEitherSideEitherNoPrompt_onclick() As Boolean
	NPAdjPPosEitherSideEitherNo_onclick
	NPAdjPPosEitherSideEitherNoPrompt_onclick = True
End Function

Private Function NPAdjp2OK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//np/@adjpPos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (NPAdjPPosBefore.Checked) Then sTemp = "before"
	If (NPAdjPPosAfter.Checked) Then sTemp = "after"
	If (NPAdjPPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@adjpEither")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPAdjPPosEitherSideEitherYes.Checked) Then sTemp = "yes"
	If (NPAdjPPosEitherSideEitherNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	NPAdjp2OK_onclick = True

	BaseWindow.navigate "NPContents.htm"
End Function

Private Function NPAdjp2Cancel_onclick() As Boolean
	NPAdjp2Cancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (NPAdjPPosEitherSide.Checked) Then
		NPAdjPPosEitherSideTable.Style.display = ""
		If (NPAdjPPosEitherSideEitherNo.Checked) Then
			NPAdjPPosEitherSideEitherNoInstruction.Style.display = ""
		Else
			NPAdjPPosEitherSideEitherNoInstruction.Style.display = "none"
		End If
	Else
		NPAdjPPosEitherSideTable.Style.display = "none"
		NPAdjPPosEitherSideEitherNoInstruction.Style.display = "none"
	End If

End Sub
