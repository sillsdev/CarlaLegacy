VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} PronReciprocalDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6720
   _ExtentX        =   11853
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\PronReciprocal.htm"
   BuildFile       =   "..\Control\PronReciprocal.htm"
   BuildMode       =   0
   TypeLibCookie   =   21
   AsyncLoad       =   0   'False
   id              =   "PronReciprocalDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "PronReciprocalDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//pron/@recip")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		PronRecipNo.Checked = True
	Else
		PronRecipYes.Checked = True
	End If

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//pron/recipExample")
	If (elem.baseName <> "") Then
		PronRecipExample.Value = elem.Text
	Else
		PronRecipExample.Value = ""
	End If

	Set attr = gxmlDom.selectSingleNode("//pron/@recipAffix")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		PronRecipAffixYes.Checked = True
	ElseIf (attr.Text = "noWord") Then
		PronRecipAffixNoWord.Checked = True
	ElseIf (attr.Text = "noNoun") Then
		PronRecipAffixNoNoun.Checked = True
	Else
		PronRecipAffixNoQP.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function PronRecipNo_onclick() As Boolean
	PronRecipNo.Checked = True
	DisplayHidden
	PronRecipNo_onclick = True
End Function
Private Function PronRecipNoPrompt_onclick() As Boolean
	PronRecipNo_onclick
	PronRecipNoPrompt_onclick = True
End Function

Private Function PronRecipYes_onclick() As Boolean
	PronRecipYes.Checked = True
	DisplayHidden
	PronRecipYes_onclick = True
End Function
Private Function PronRecipYesPrompt_onclick() As Boolean
	PronRecipYes_onclick
	PronRecipYesPrompt_onclick = True
End Function

Private Function PronRecipAffixYes_onclick() As Boolean
	PronRecipAffixYes.Checked = True
	DisplayHidden
	PronRecipAffixYes_onclick = True
End Function
Private Function PronRecipAffixYesPrompt_onclick() As Boolean
	PronRecipAffixYes_onclick
	PronRecipAffixYesPrompt_onclick = True
End Function

Private Function PronRecipAffixNoWord_onclick() As Boolean
	PronRecipAffixNoWord.Checked = True
	DisplayHidden
	PronRecipAffixNoWord_onclick = True
End Function
Private Function PronRecipAffixNoWordPrompt_onclick() As Boolean
	PronRecipAffixNoWord_onclick
	PronRecipAffixNoWordPrompt_onclick = True
End Function

Private Function PronRecipAffixNoNoun_onclick() As Boolean
	PronRecipAffixNoNoun.Checked = True
	DisplayHidden
	PronRecipAffixNoNoun_onclick = True
End Function
Private Function PronRecipAffixNoNounPrompt_onclick() As Boolean
	PronRecipAffixNoNoun_onclick
	PronRecipAffixNoNounPrompt_onclick = True
End Function

Private Function PronRecipAffixNoQP_onclick() As Boolean
	PronRecipAffixNoQP.Checked = True
	DisplayHidden
	PronRecipAffixNoQP_onclick = True
End Function
Private Function PronRecipAffixNoQPPrompt_onclick() As Boolean
	PronRecipAffixNoQP_onclick
	PronRecipAffixNoQPPrompt_onclick = True
End Function

Private Function PronRecipOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//pron/@recip")
	'TODO: figure what to do if any of these are missing!
	sTemp = "yes" ' default if all else fails...
	If (PronRecipNo.Checked) Then sTemp = "no"
	If (PronRecipYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//pron/recipExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = PronRecipExample.Value

	Set attr = gxmlDom.selectSingleNode("//pron/@recipAffix")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (PronRecipAffixYes.Checked) Then sTemp = "yes"
	If (PronRecipAffixNoWord.Checked) Then sTemp = "noWord"
	If (PronRecipAffixNoNoun.Checked) Then sTemp = "noNoun"
	If (PronRecipAffixNoQP.Checked) Then sTemp = "noQP"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	PronRecipOK_onclick = True

	BaseWindow.navigate "PronPoss.htm"
End Function

Private Function PronRecipCancel_onclick() As Boolean
	PronRecipCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (PronRecipNo.Checked) Then
		PronRecipYesTable.Style.display = "none"
		PronRecipAffixYesInstruction.Style.display = "none"
		PronRecipAffixNoWordInstruction.Style.display = "none"
		PronRecipAffixNoNounInstruction.Style.display = "none"
		PronRecipAffixNoQPInstruction.Style.display = "none"
		PronRecipExamplePrompt.Style.display = "none"
		PronRecipExample.Style.display = "none"
	Else
		PronRecipYesTable.Style.display = ""
		PronRecipExamplePrompt.Style.display = ""
		PronRecipExample.Style.display = ""
		If (PronRecipAffixYes.Checked) Then
			PronRecipAffixYesInstruction.Style.display = ""
			PronRecipAffixNoWordInstruction.Style.display = "none"
			PronRecipAffixNoNounInstruction.Style.display = "none"
			PronRecipAffixNoQPInstruction.Style.display = "none"
		ElseIf (PronRecipAffixNoWord.Checked) Then
			PronRecipAffixYesInstruction.Style.display = "none"
			PronRecipAffixNoWordInstruction.Style.display = ""
			PronRecipAffixNoNounInstruction.Style.display = "none"
			PronRecipAffixNoQPInstruction.Style.display = "none"
		ElseIf (PronRecipAffixNoNoun.Checked) Then
			PronRecipAffixYesInstruction.Style.display = "none"
			PronRecipAffixNoWordInstruction.Style.display = "none"
			PronRecipAffixNoNounInstruction.Style.display = ""
			PronRecipAffixNoQPInstruction.Style.display = "none"
		Else
			PronRecipAffixYesInstruction.Style.display = "none"
			PronRecipAffixNoWordInstruction.Style.display = "none"
			PronRecipAffixNoNounInstruction.Style.display = "none"
			PronRecipAffixNoQPInstruction.Style.display = ""
		End If
	End If
End Sub
