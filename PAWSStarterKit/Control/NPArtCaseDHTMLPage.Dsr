VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPArtCaseDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6780
   _ExtentX        =   11959
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\NPArtCase.htm"
   BuildFile       =   "..\Control\NPArtCase.htm"
   BuildMode       =   0
   TypeLibCookie   =   35
   AsyncLoad       =   0   'False
   id              =   "NPArtCaseDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPArtCaseDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//np/@artCase")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		NPArtCaseNo.Checked = True
	Else
		NPArtCaseYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artCaseType")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "nomAcc") Then
		NPArtCaseNomAcc.Checked = True
	Else
		NPArtCaseErg.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPArtCaseNo_onclick() As Boolean
	NPArtCaseNo.Checked = True
	DisplayHidden
	NPArtCaseNo_onclick = True
End Function
Private Function NPArtCaseNoPrompt_onclick() As Boolean
	NPArtCaseNo_onclick
	NPArtCaseNoPrompt_onclick = True
End Function

Private Function NPArtCaseYes_onclick() As Boolean
	NPArtCaseYes.Checked = True
	DisplayHidden
	NPArtCaseYes_onclick = True
End Function
Private Function NPArtCaseYesPrompt_onclick() As Boolean
	NPArtCaseYes_onclick
	NPArtCaseYesPrompt_onclick = True
End Function

Private Function NPArtCaseNomAcc_onclick() As Boolean
	NPArtCaseNomAcc.Checked = True
	DisplayHidden
	NPArtCaseNomAcc_onclick = True
End Function
Private Function NPArtCaseNomAccPrompt_onclick() As Boolean
	NPArtCaseNomAcc_onclick
	NPArtCaseNomAccPrompt_onclick = True
End Function

Private Function NPArtCaseErg_onclick() As Boolean
	NPArtCaseErg.Checked = True
	DisplayHidden
	NPArtCaseErg_onclick = True
End Function
Private Function NPArtCaseErgPrompt_onclick() As Boolean
	NPArtCaseErg_onclick
	NPArtCaseErgPrompt_onclick = True
End Function

Private Function NPArtCaseOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//np/@artCase")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPArtCaseNo.Checked) Then sTemp = "no"
	If (NPArtCaseYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artCaseType")
	'TODO: figure what to do if any of these are missing!
	sTemp = "nomAcc" ' default if all else fails...
	If (NPArtCaseNomAcc.Checked) Then sTemp = "nomAcc"
	If (NPArtCaseErg.Checked) Then sTemp = "erg"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	NPArtCaseOK_onclick = True

	BaseWindow.navigate "NPArtAgreement.htm"
End Function

Private Function NPArtCaseCancel_onclick() As Boolean
	NPArtCaseCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (NPArtCaseNo.Checked) Then
		NPArtCaseTypeTable.Style.display = "none"
		NPArtCaseNomAccInstruction.Style.display = "none"
		NPArtCaseErgInstruction.Style.display = "none"
	Else
		NPArtCaseTypeTable.Style.display = ""
		If (NPArtCaseNomAcc.Checked) Then
			NPArtCaseNomAccInstruction.Style.display = ""
			NPArtCaseErgInstruction.Style.display = "none"
		Else
			NPArtCaseNomAccInstruction.Style.display = "none"
			NPArtCaseErgInstruction.Style.display = ""
		End If
	End If
End Sub
