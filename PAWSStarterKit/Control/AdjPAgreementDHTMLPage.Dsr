VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} AdjPAgreementDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6780
   _ExtentX        =   11959
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\AdjPAgreement.htm"
   BuildFile       =   "..\Control\AdjPAgreement.htm"
   BuildMode       =   0
   TypeLibCookie   =   74
   AsyncLoad       =   0   'False
   id              =   "AdjPAgreementDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "AdjPAgreementDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True

Private Function AdjPAgreeNo_onclick() As Boolean
	AdjPAgreeNo.Checked = True
	DisplayInstructions
	AdjPAgreeNo_onclick = True
End Function

Private Function AdjPAgreeYesAnimacy_onclick() As Boolean
	AdjPAgreeYesAnimacy.Checked = True
	DisplayInstructions
	AdjPAgreeYesAnimacy_onclick = True
End Function

Private Function AdjPAgreeYesClass_onclick() As Boolean
	AdjPAgreeYesClass.Checked = True
	DisplayInstructions
	AdjPAgreeYesClass_onclick = True
End Function

Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//adjp/@agree")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		AdjPAgreeNo.Checked = True
	ElseIf (attr.Text = "yesAnimacy") Then
		AdjPAgreeYesAnimacy.Checked = True
	Else
		AdjPAgreeYesClass.Checked = True
	End If

	DisplayInstructions
		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function AdjPAgreeNoPrompt_onclick() As Boolean
	AdjPAgreeNo_onclick
	AdjPAgreeNoPrompt_onclick = True
End Function

Private Function AdjPAgreeYesAnimacyPrompt_onclick() As Boolean
	AdjPAgreeYesAnimacy_onclick
	AdjPAgreeYesAnimacyPrompt_onclick = True
End Function

Private Function AdjPAgreeYesClassPrompt_onclick() As Boolean
	AdjPAgreeYesClass_onclick
	AdjPAgreeYesClassPrompt_onclick = True
End Function

Private Function AdjPAgreeOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//adjp/@agree")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (AdjPAgreeNo.Checked) Then sTemp = "no"
	If (AdjPAgreeYesAnimacy.Checked) Then sTemp = "yesAnimacy"
	If (AdjPAgreeYesClass.Checked) Then sTemp = "yesClass"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	AdjPAgreeOK_onclick = True

	BaseWindow.navigate "AdjPTesting.htm"
End Function

Private Function AdjPAgreeCancel_onclick() As Boolean
	AdjPAgreeCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayInstructions()
	If (AdjPAgreeNo.Checked) Then
		AdjPAgreeYesAnimacyInstruction.Style.display = "none"
		AdjPAgreeYesClassInstruction.Style.display = "none"
	ElseIf (AdjPAgreeYesAnimacy.Checked) Then
		AdjPAgreeYesAnimacyInstruction.Style.display = ""
		AdjPAgreeYesClassInstruction.Style.display = "none"
	Else
		AdjPAgreeYesAnimacyInstruction.Style.display = "none"
		AdjPAgreeYesClassInstruction.Style.display = ""
	End If
End Sub
