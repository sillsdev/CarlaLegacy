VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} PPAloneDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   _ExtentX        =   11906
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\PPAlone.htm"
   BuildFile       =   "..\Control\PPAlone.htm"
   BuildMode       =   0
   TypeLibCookie   =   31
   AsyncLoad       =   0   'False
   id              =   "PPAloneDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "PPAloneDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//pp/@alone")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		PPAloneNo.Checked = True
	Else
		PPAloneYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//pp/@sentComp")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		PPSentCompNo.Checked = True
	Else
		PPSentCompYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//pp/@prePost")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	sPos = gGetPositionBasedOnHead(attr.Text)
	If (sPos = "before") Then
		PPPrePostPre.Checked = True
	ElseIf (sPos = "after") Then
		PPPrePostPost.Checked = True
	Else
		PPPrePostBoth.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function PPAloneNo_onclick() As Boolean
	PPAloneNo.Checked = True
	DisplayHidden
	PPAloneNo_onclick = True
End Function
Private Function PPAloneNoPrompt_onclick() As Boolean
	PPAloneNo_onclick
	PPAloneNoPrompt_onclick = True
End Function

Private Function PPAloneYes_onclick() As Boolean
	PPAloneYes.Checked = True
	DisplayHidden
	PPAloneYes_onclick = True
End Function
Private Function PPAloneYesPrompt_onclick() As Boolean
	PPAloneYes_onclick
	PPAloneYesPrompt_onclick = True
End Function

Private Function PPSentCompNo_onclick() As Boolean
	PPSentCompNo.Checked = True
	DisplayHidden
	PPSentCompNo_onclick = True
End Function
Private Function PPSentCompNoPrompt_onclick() As Boolean
	PPSentCompNo_onclick
	PPSentCompNoPrompt_onclick = True
End Function

Private Function PPSentCompYes_onclick() As Boolean
	PPSentCompYes.Checked = True
	DisplayHidden
	PPSentCompYes_onclick = True
End Function
Private Function PPSentCompYesPrompt_onclick() As Boolean
	PPSentCompYes_onclick
	PPSentCompYesPrompt_onclick = True
End Function

Private Function PPPrePostPre_onclick() As Boolean
	PPPrePostPre.Checked = True
	DisplayHidden
	PPPrePostPre_onclick = True
End Function
Private Function PPPrePostPrePrompt_onclick() As Boolean
	PPPrePostPre_onclick
	PPPrePostPrePrompt_onclick = True
End Function

Private Function PPPrePostPost_onclick() As Boolean
	PPPrePostPost.Checked = True
	DisplayHidden
	PPPrePostPost_onclick = True
End Function
Private Function PPPrePostPostPrompt_onclick() As Boolean
	PPPrePostPost_onclick
	PPPrePostPostPrompt_onclick = True
End Function

Private Function PPPrePostBoth_onclick() As Boolean
	PPPrePostBoth.Checked = True
	DisplayHidden
	PPPrePostBoth_onclick = True
End Function
Private Function PPPrePostBothPrompt_onclick() As Boolean
	PPPrePostBoth_onclick
	PPPrePostBothPrompt_onclick = True
End Function

Private Function PPAloneOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//pp/@alone")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (PPAloneNo.Checked) Then sTemp = "no"
	If (PPAloneYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//pp/@sentComp")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (PPSentCompNo.Checked) Then sTemp = "no"
	If (PPSentCompYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//pp/@prePost")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (PPPrePostPre.Checked) Then sTemp = "pre"
	If (PPPrePostPost.Checked) Then sTemp = "post"
	If (PPPrePostBoth.Checked) Then sTemp = "both"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	PPAloneOK_onclick = True

	BaseWindow.navigate "PPCat.htm"
End Function

Private Function PPAloneCancel_onclick() As Boolean
	PPAloneCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (PPPrePostBoth.Checked) Then
		PPPrePostBothInstruction.Style.display = ""
	Else
		PPPrePostBothInstruction.Style.display = "none"
	End If

End Sub
