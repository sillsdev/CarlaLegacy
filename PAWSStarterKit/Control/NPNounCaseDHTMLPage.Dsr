VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPNounCaseDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6615
   _ExtentX        =   11668
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\NPNounCase.htm"
   BuildFile       =   "..\Control\NPNounCase.htm"
   BuildMode       =   0
   TypeLibCookie   =   77
   AsyncLoad       =   0   'False
   id              =   "NPNounCaseDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPNounCaseDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//np/@nounCase")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		NPCaseNo.Checked = True
	ElseIf (attr.Text = "yes") Then
		NPCaseYes.Checked = True
	Else  ' is unknown, so use artCase
		Set attr = gxmlDom.selectSingleNode("//np/@artCase")
		If (IsEmpty(attr)) Then
			' TODO: figure out how to catch a failure here and then fix it
		End If
		If (attr.Text = "no") Then
			NPCaseNo.Checked = True
		Else
			NPCaseYes.Checked = True
		End If
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@nounCaseType")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "nomAcc") Then
		NPCaseTypeNomAcc.Checked = True
	ElseIf (attr.Text = "erg") Then
		NPCaseTypeErg.Checked = True
	Else  ' is unknown, so use artCaseType
		Set attr = gxmlDom.selectSingleNode("//np/@artCaseType")
		If (IsEmpty(attr)) Then
			' TODO: figure out how to catch a failure here and then fix it
		End If
		If (attr.Text = "nomAcc") Then
			NPCaseTypeNomAcc.Checked = True
		ElseIf (attr.Text = "erg") Then
			NPCaseTypeErg.Checked = True
		End If
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPCaseNo_onclick() As Boolean
	NPCaseNo.Checked = True
	DisplayHidden
	NPCaseNo_onclick = True
End Function
Private Function NPCaseNoPrompt_onclick() As Boolean
	NPCaseNo_onclick
	NPCaseNoPrompt_onclick = True
End Function

Private Function NPCaseYes_onclick() As Boolean
	NPCaseYes.Checked = True
	DisplayHidden
	NPCaseYes_onclick = True
End Function
Private Function NPCaseYesPrompt_onclick() As Boolean
	NPCaseYes_onclick
	NPCaseYesPrompt_onclick = True
End Function

Private Function NPCaseTypeNomAcc_onclick() As Boolean
	NPCaseTypeNomAcc.Checked = True
	DisplayHidden
	NPCaseTypeNomAcc_onclick = True
End Function
Private Function NPCaseTypeNomAccPrompt_onclick() As Boolean
	NPCaseTypeNomAcc_onclick
	NPCaseTypeNomAccPrompt_onclick = True
End Function

Private Function NPCaseTypeErg_onclick() As Boolean
	NPCaseTypeErg.Checked = True
	DisplayHidden
	NPCaseTypeErg_onclick = True
End Function
Private Function NPCaseTypeErgPrompt_onclick() As Boolean
	NPCaseTypeErg_onclick
	NPCaseTypeErgPrompt_onclick = True
End Function

Private Function NPCaseOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//np/@nounCase")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPCaseNo.Checked) Then sTemp = "no"
	If (NPCaseYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@nounCaseType")
	'TODO: figure what to do if any of these are missing!
	sTemp = "nomAcc" ' default if all else fails...
	If (NPCaseTypeNomAcc.Checked) Then sTemp = "nomAcc"
	If (NPCaseTypeErg.Checked) Then sTemp = "erg"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	NPCaseOK_onclick = True

	BaseWindow.navigate "NPContents.htm"
End Function

Private Function NPCaseCancel_onclick() As Boolean
	NPCaseCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (NPCaseYes.Checked) Then
		NPCaseYesTable.Style.display = ""
		If (NPCaseTypeNomAcc.Checked) Then
			NPCaseTypeNomAccInstruction.Style.display = ""
			NPCaseTypeErgInstruction.Style.display = "none"
		Else
			NPCaseTypeNomAccInstruction.Style.display = "none"
			NPCaseTypeErgInstruction.Style.display = ""
		End If
	Else
		NPCaseYesTable.Style.display = "none"
		NPCaseTypeNomAccInstruction.Style.display = "none"
		NPCaseTypeErgInstruction.Style.display = "none"
	End If

End Sub
