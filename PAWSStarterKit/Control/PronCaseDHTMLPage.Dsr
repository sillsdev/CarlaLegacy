VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} PronCaseDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6615
   _ExtentX        =   11668
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\PronCase.htm"
   BuildFile       =   "..\Control\PronCase.htm"
   BuildMode       =   0
   TypeLibCookie   =   31
   AsyncLoad       =   0   'False
   id              =   "PronCaseDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "PronCaseDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//pron/@pronCase")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		PronCaseNo.Checked = True
	ElseIf (attr.Text = "yes") Then
		PronCaseYes.Checked = True
	Else  ' is unknown, so use nounCase
		Set attr = gxmlDom.selectSingleNode("//np/@nounCase")
		If (IsEmpty(attr)) Then
			' TODO: figure out how to catch a failure here and then fix it
		End If
		If (attr.Text = "no") Then
			PronCaseNo.Checked = True
		Else
			PronCaseYes.Checked = True
		End If
	End If


	Set attr = gxmlDom.selectSingleNode("//pron/@pronCaseType")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "nomAcc") Then
		PronCaseTypeNomAcc.Checked = True
	ElseIf (attr.Text = "erg") Then
		PronCaseTypeErg.Checked = True
	Else  ' is unknown, so use artCaseType
		Set attr = gxmlDom.selectSingleNode("//np/@nounCaseType")
		If (IsEmpty(attr)) Then
			' TODO: figure out how to catch a failure here and then fix it
		End If
		If (attr.Text = "nomAcc") Then
			PronCaseTypeNomAcc.Checked = True
		ElseIf (attr.Text = "erg") Then
			PronCaseTypeErg.Checked = True
		End If
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function PronCaseNo_onclick() As Boolean
	PronCaseNo.Checked = True
	DisplayHidden
	PronCaseNo_onclick = True
End Function
Private Function PronCaseNoPrompt_onclick() As Boolean
	PronCaseNo_onclick
	PronCaseNoPrompt_onclick = True
End Function

Private Function PronCaseYes_onclick() As Boolean
	PronCaseYes.Checked = True
	DisplayHidden
	PronCaseYes_onclick = True
End Function
Private Function PronCaseYesPrompt_onclick() As Boolean
	PronCaseYes_onclick
	PronCaseYesPrompt_onclick = True
End Function

Private Function PronCaseTypeNomAcc_onclick() As Boolean
	PronCaseTypeNomAcc.Checked = True
	DisplayHidden
	PronCaseTypeNomAcc_onclick = True
End Function
Private Function PronCaseTypeNomAccPrompt_onclick() As Boolean
	PronCaseTypeNomAcc_onclick
	PronCaseTypeNomAccPrompt_onclick = True
End Function

Private Function PronCaseTypeErg_onclick() As Boolean
	PronCaseTypeErg.Checked = True
	DisplayHidden
	PronCaseTypeErg_onclick = True
End Function
Private Function PronCaseTypeErgPrompt_onclick() As Boolean
	PronCaseTypeErg_onclick
	PronCaseTypeErgPrompt_onclick = True
End Function

Private Function PronCaseOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//pron/@pronCase")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (PronCaseNo.Checked) Then sTemp = "no"
	If (PronCaseYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//pron/@pronCaseType")
	'TODO: figure what to do if any of these are missing!
	sTemp = "nomAcc" ' default if all else fails...
	If (PronCaseTypeNomAcc.Checked) Then sTemp = "nomAcc"
	If (PronCaseTypeErg.Checked) Then sTemp = "erg"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	PronCaseOK_onclick = True

	BaseWindow.navigate "PronAgr.htm"
End Function

Private Function PronCaseCancel_onclick() As Boolean
	PronCaseCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (PronCaseNo.Checked) Then
		PronCaseYesTable.Style.display = "none"
		PronCaseTypeNomAccInstruction.Style.display = "none"
		PronCaseTypeErgInstruction.Style.display = "none"
	Else
		PronCaseYesTable.Style.display = ""
		If (PronCaseTypeNomAcc.Checked) Then
			PronCaseTypeNomAccInstruction.Style.display = ""
			PronCaseTypeErgInstruction.Style.display = "none"
		Else
			PronCaseTypeNomAccInstruction.Style.display = "none"
			PronCaseTypeErgInstruction.Style.display = ""
		End If
	End If

End Sub
