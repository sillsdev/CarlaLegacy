VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} PronReflDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6615
   _ExtentX        =   11668
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\PronRefl.htm"
   BuildFile       =   "..\Control\PronRefl.htm"
   BuildMode       =   0
   TypeLibCookie   =   113
   AsyncLoad       =   0   'False
   id              =   "PronReflDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "PronReflDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//pron/@refl")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		PronReflNo.Checked = True
	Else
		PronReflYes.Checked = True
	End If

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//pron/reflExample")
	If (elem.baseName <> "") Then
		PronReflExample.Value = elem.Text
	Else
		PronReflExample.Value = ""
	End If

	Set attr = gxmlDom.selectSingleNode("//pron/@reflAffix")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		PronReflAffixYes.Checked = True
	ElseIf (attr.Text = "noWord") Then
		PronReflAffixNoWord.Checked = True
	Else
		PronReflAffixNoNoun.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function PronReflNo_onclick() As Boolean
	PronReflNo.Checked = True
	DisplayHidden
	PronReflNo_onclick = True
End Function
Private Function PronReflNoPrompt_onclick() As Boolean
	PronReflNo_onclick
	PronReflNoPrompt_onclick = True
End Function

Private Function PronReflYes_onclick() As Boolean
	PronReflYes.Checked = True
	DisplayHidden
	PronReflYes_onclick = True
End Function
Private Function PronReflYesPrompt_onclick() As Boolean
	PronReflYes_onclick
	PronReflYesPrompt_onclick = True
End Function

Private Function PronReflAffixYes_onclick() As Boolean
	PronReflAffixYes.Checked = True
	DisplayHidden
	PronReflAffixYes_onclick = True
End Function
Private Function PronReflAffixYesPrompt_onclick() As Boolean
	PronReflAffixYes_onclick
	PronReflAffixYesPrompt_onclick = True
End Function

Private Function PronReflAffixNoWord_onclick() As Boolean
	PronReflAffixNoWord.Checked = True
	DisplayHidden
	PronReflAffixNoWord_onclick = True
End Function
Private Function PronReflAffixNoWordPrompt_onclick() As Boolean
	PronReflAffixNoWord_onclick
	PronReflAffixNoWordPrompt_onclick = True
End Function

Private Function PronReflAffixNoNoun_onclick() As Boolean
	PronReflAffixNoNoun.Checked = True
	DisplayHidden
	PronReflAffixNoNoun_onclick = True
End Function
Private Function PronReflAffixNoNounPrompt_onclick() As Boolean
	PronReflAffixNoNoun_onclick
	PronReflAffixNoNounPrompt_onclick = True
End Function

Private Function PronReflOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//pron/@refl")
	'TODO: figure what to do if any of these are missing!
	sTemp = "yes" ' default if all else fails...
	If (PronReflNo.Checked) Then sTemp = "no"
	If (PronReflYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//pron/reflExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = PronReflExample.Value

	Set attr = gxmlDom.selectSingleNode("//pron/@reflAffix")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (PronReflAffixYes.Checked) Then sTemp = "yes"
	If (PronReflAffixNoWord.Checked) Then sTemp = "noWord"
	If (PronReflAffixNoNoun.Checked) Then sTemp = "noNoun"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	PronReflOK_onclick = True

	BaseWindow.navigate "PronReciprocal.htm"
End Function

Private Function PronReflCancel_onclick() As Boolean
	PronReflCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (PronReflNo.Checked) Then
		PronReflYesTable.Style.display = "none"
		PronReflExample.Style.display = "none"
		PronReflAffixNoWordInstruction.Style.display = "none"
		PronReflAffixNoNounInstruction.Style.display = "none"
		PronReflAffixYesInstruction.Style.display = "none"
		PronReflExamplePrompt.Style.display = "none"
	Else
		PronReflYesTable.Style.display = ""
		PronReflExample.Style.display = ""
		PronReflExamplePrompt.Style.display = ""
		If (PronReflAffixNoWord.Checked) Then
			PronReflAffixNoWordInstruction.Style.display = ""
			PronReflAffixNoNounInstruction.Style.display = "none"
			PronReflAffixYesInstruction.Style.display = "none"
		ElseIf (PronReflAffixNoNoun.Checked) Then
			PronReflAffixNoWordInstruction.Style.display = "none"
			PronReflAffixNoNounInstruction.Style.display = ""
			PronReflAffixYesInstruction.Style.display = "none"
		Else
			PronReflAffixNoWordInstruction.Style.display = "none"
			PronReflAffixNoNounInstruction.Style.display = "none"
			PronReflAffixYesInstruction.Style.display = ""
		End If
	End If

End Sub
