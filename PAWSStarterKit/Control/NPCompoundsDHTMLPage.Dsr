VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPCompoundsDHTMLPage
   ClientHeight    =   6990
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8145
   _ExtentX        =   14367
   _ExtentY        =   12330
   SourceFile      =   "..\HTMs\NPCompounds.htm"
   BuildFile       =   "..\Control\NPCompounds.htm"
   BuildMode       =   0
   TypeLibCookie   =   87
   AsyncLoad       =   0   'False
   id              =   "NPCompoundsDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPCompoundsDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//np/compExample")
	If (elem.baseName <> "") Then
		NPCompExample.Value = elem.Text
	Else
		NPCompExample.Value = ""
	End If

	Set elem = gxmlDom.selectSingleNode("//np/compPPExample")
	If (elem.baseName <> "") Then
		NPCompPPExample.Value = elem.Text
	Else
		NPCompPPExample.Value = ""
	End If

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//np/@compHead")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "") Then
		NPCompHeadLeft.Checked = True
	Else
		NPCompHeadRight.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@compHeadPPPos")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	sPos = gGetPositionBasedOnHead(attr.Text, False)
	If (sPos = "before") Then
		NPCompHeadPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		NPCompHeadPosAfter.Checked = True
	Else
		NPCompHeadPosEither.Checked = True
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPCompHeadLeft_onclick() As Boolean
	NPCompHeadLeft.Checked = True
	NPCompHeadLeft_onclick = True
End Function
Private Function NPCompHeadLeftPrompt_onclick() As Boolean
	NPCompHeadLeft_onclick
	NPCompHeadLeftPrompt_onclick = True
End Function

Private Function NPCompHeadRight_onclick() As Boolean
	NPCompHeadRight.Checked = True
	NPCompHeadRight_onclick = True
End Function
Private Function NPCompHeadRightPrompt_onclick() As Boolean
	NPCompHeadRight_onclick
	NPCompHeadRightPrompt_onclick = True
End Function

Private Function NPCompHeadPosBefore_onclick() As Boolean
	NPCompHeadPosBefore.Checked = True
	NPCompHeadPosBefore_onclick = True
End Function
Private Function NPCompHeadPosBeforePrompt_onclick() As Boolean
	NPCompHeadPosBefore_onclick
	NPCompHeadPosBeforePrompt_onclick = True
End Function

Private Function NPCompHeadPosAfter_onclick() As Boolean
	NPCompHeadPosAfter.Checked = True
	NPCompHeadPosAfter_onclick = True
End Function
Private Function NPCompHeadPosAfterPrompt_onclick() As Boolean
	NPCompHeadPosAfter_onclick
	NPCompHeadPosAfterPrompt_onclick = True
End Function

Private Function NPCompHeadPosEither_onclick() As Boolean
	NPCompHeadPosEither.Checked = True
	NPCompHeadPosEither_onclick = True
End Function
Private Function NPCompHeadPosEitherPrompt_onclick() As Boolean
	NPCompHeadPosEither_onclick
	NPCompHeadPosEitherPrompt_onclick = True
End Function

Private Function NPCompOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//np/compExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = NPCompExample.Value

	Set elem = gxmlDom.selectSingleNode("//np/compPPExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = NPCompPPExample.Value

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//np/@compHead")
	'TODO: figure what to do if any of these are missing!
	sTemp = "right" ' default if all else fails...
	If (NPCompHeadLeft.Checked) Then sTemp = "left"
	If (NPCompHeadRight.Checked) Then sTemp = "right"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@compHeadPPPos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (NPCompHeadPosBefore.Checked) Then sTemp = "before"
	If (NPCompHeadPosAfter.Checked) Then sTemp = "after"
	If (NPCompHeadPosEither.Checked) Then sTemp = "either"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	NPCompOK_onclick = True

	BaseWindow.navigate "NPContents.htm"
End Function

Private Function NPCompCancel_onclick() As Boolean
	NPCompCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
