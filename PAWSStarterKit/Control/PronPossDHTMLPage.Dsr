VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} PronPossDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6720
   _ExtentX        =   11853
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\PronPoss.htm"
   BuildFile       =   "..\Control\PronPoss.htm"
   BuildMode       =   0
   TypeLibCookie   =   48
   AsyncLoad       =   0   'False
   id              =   "PronPossDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "PronPossDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//pron/@poss")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		PronPossNo.Checked = True
	Else
		PronPossYes.Checked = True
	End If

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//pron/possExample")
	If (elem.baseName <> "") Then
		PronPossExample.Value = elem.Text
	Else
		PronPossExample.Value = ""
	End If

	Set attr = gxmlDom.selectSingleNode("//pron/@possAffix")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		PronPossAffixNo.Checked = True
	Else
		PronPossAffixYes.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function PronPossNo_onclick() As Boolean
	PronPossNo.Checked = True
	DisplayHidden
	PronPossNo_onclick = True
End Function
Private Function PronPossNoPrompt_onclick() As Boolean
	PronPossNo_onclick
	PronPossNoPrompt_onclick = True
End Function

Private Function PronPossYes_onclick() As Boolean
	PronPossYes.Checked = True
	DisplayHidden
	PronPossYes_onclick = True
End Function
Private Function PronPossYesPrompt_onclick() As Boolean
	PronPossYes_onclick
	PronPossYesPrompt_onclick = True
End Function

Private Function PronPossAffixNo_onclick() As Boolean
	PronPossAffixNo.Checked = True
	DisplayHidden
	PronPossAffixNo_onclick = True
End Function
Private Function PronPossAffixNoPrompt_onclick() As Boolean
	PronPossAffixNo_onclick
	PronPossAffixNoPrompt_onclick = True
End Function

Private Function PronPossAffixYes_onclick() As Boolean
	PronPossAffixYes.Checked = True
	DisplayHidden
	PronPossAffixYes_onclick = True
End Function
Private Function PronPossAffixYesPrompt_onclick() As Boolean
	PronPossAffixYes_onclick
	PronPossAffixYesPrompt_onclick = True
End Function

Private Function PronPossOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//pron/@poss")
	'TODO: figure what to do if any of these are missing!
	sTemp = "yes" ' default if all else fails...
	If (PronPossNo.Checked) Then sTemp = "no"
	If (PronPossYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//pron/possExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = PronPossExample.Value

	Set attr = gxmlDom.selectSingleNode("//pron/@possAffix")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (PronPossAffixNo.Checked) Then sTemp = "no"
	If (PronPossAffixYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	PronPossOK_onclick = True

	BaseWindow.navigate "PronIndefinite.htm"
End Function

Private Function PronPossCancel_onclick() As Boolean
	PronPossCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (PronPossNo.Checked) Then
		PronPossAffix.Style.display = "none"
		PronPossAffixNoInstruction.Style.display = "none"
		PronPossAffixYesInstruction.Style.display = "none"
		PronPossExamplePrompt.Style.display = "none"
		PronPossExample.Style.display = "none"
	Else
		PronPossAffix.Style.display = ""
		PronPossExamplePrompt.Style.display = ""
		PronPossExample.Style.display = ""
		If (PronPossAffixNo.Checked) Then
			PronPossAffixNoInstruction.Style.display = ""
			PronPossAffixYesInstruction.Style.display = "none"
		Else
			PronPossAffixNoInstruction.Style.display = "none"
			PronPossAffixYesInstruction.Style.display = ""
		End If
	End If
End Sub
