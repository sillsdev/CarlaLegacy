VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} PronPN2DHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6615
   _ExtentX        =   11668
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\PronPN2.htm"
   BuildFile       =   "..\Control\PronPN2.htm"
   BuildMode       =   0
   TypeLibCookie   =   37
   AsyncLoad       =   0   'False
   id              =   "PronPN2DHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "PronPN2DHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//pron/@pnCat")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yes") Then
		PronPN2CatYes.Checked = True
	Else
		PronPN2CatNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//pron/@pnCase")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "yesAffix") Then
		PronPN2CaseYesAffix.Checked = True
	ElseIf (attr.Text = "yesArt") Then
		PronPN2CaseYesArt.Checked = True
	ElseIf (attr.Text = "yesNone") Then
		PronPN2CaseYesNone.Checked = True
	Else
		PronPN2CaseNo.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function PronPN2CatYes_onclick() As Boolean
	PronPN2CatYes.Checked = True
	DisplayHidden
	PronPN2CatYes_onclick = True
End Function
Private Function PronPN2CatYesPrompt_onclick() As Boolean
	PronPN2CatYes_onclick
	PronPN2CatYesPrompt_onclick = True
End Function

Private Function PronPN2CatNo_onclick() As Boolean
	PronPN2CatNo.Checked = True
	DisplayHidden
	PronPN2CatNo_onclick = True
End Function
Private Function PronPN2CatNoPrompt_onclick() As Boolean
	PronPN2CatNo_onclick
	PronPN2CatNoPrompt_onclick = True
End Function

Private Function PronPN2CaseYesAffix_onclick() As Boolean
	PronPN2CaseYesAffix.Checked = True
	DisplayHidden
	PronPN2CaseYesAffix_onclick = True
End Function
Private Function PronPN2CaseYesAffixPrompt_onclick() As Boolean
	PronPN2CaseYesAffix_onclick
	PronPN2CaseYesAffixPrompt_onclick = True
End Function

Private Function PronPN2CaseYesArt_onclick() As Boolean
	PronPN2CaseYesArt.Checked = True
	DisplayHidden
	PronPN2CaseYesArt_onclick = True
End Function
Private Function PronPN2CaseYesArtPrompt_onclick() As Boolean
	PronPN2CaseYesArt_onclick
	PronPN2CaseYesArtPrompt_onclick = True
End Function

Private Function PronPN2CaseYesNone_onclick() As Boolean
	PronPN2CaseYesNone.Checked = True
	DisplayHidden
	PronPN2CaseYesNone_onclick = True
End Function
Private Function PronPN2CaseYesNonePrompt_onclick() As Boolean
	PronPN2CaseYesNone_onclick
	PronPN2CaseYesNonePrompt_onclick = True
End Function

Private Function PronPN2CaseNo_onclick() As Boolean
	PronPN2CaseNo.Checked = True
	DisplayHidden
	PronPN2CaseNo_onclick = True
End Function
Private Function PronPN2CaseNoPrompt_onclick() As Boolean
	PronPN2CaseNo_onclick
	PronPN2CaseNoPrompt_onclick = True
End Function

Private Function PronPN2OK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//pron/@pnCat")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (PronPN2CatYes.Checked) Then sTemp = "yes"
	If (PronPN2CatNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//pron/@pnCase")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (PronPN2CaseYesAffix.Checked) Then sTemp = "yesAffix"
	If (PronPN2CaseYesArt.Checked) Then sTemp = "yesArt"
	If (PronPN2CaseYesNone.Checked) Then sTemp = "yesNone"
	If (PronPN2CaseNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	PronPN2OK_onclick = True

	BaseWindow.navigate "PronCase.htm"
End Function

Private Function PronPN2Cancel_onclick() As Boolean
	PronPN2Cancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (PronPN2CatNo.Checked) Then
		PronPN2CatYesInstruction.Style.display = "none"
		PronPN2CatNoInstruction.Style.display = ""
	Else
		PronPN2CatYesInstruction.Style.display = ""
		PronPN2CatNoInstruction.Style.display = "none"
	End If
	If (PronPN2CaseNo.Checked) Then
		PronPN2CaseNoInstruction.Style.display = ""
	Else
		PronPN2CaseNoInstruction.Style.display = "none"
	End If

End Sub
