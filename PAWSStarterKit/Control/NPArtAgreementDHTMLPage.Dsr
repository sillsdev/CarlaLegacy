VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPArtAgreementDHTMLPage
   ClientHeight    =   7110
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8895
   _ExtentX        =   15690
   _ExtentY        =   12541
   SourceFile      =   "..\HTMs\NPArtAgreement.htm"
   BuildFile       =   "..\Control\NPArtAgreement.htm"
   BuildMode       =   0
   TypeLibCookie   =   56
   AsyncLoad       =   0   'False
   id              =   "NPArtAgreementDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPArtAgreementDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//np/@artAgr")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		NPArtAgrNo.Checked = True
	ElseIf (attr.Text = "yesNumber") Then
		NPArtAgrYesNumber.Checked = True
	ElseIf (attr.Text = "yesPerson") Then
		NPArtAgrYesPerson.Checked = True
	ElseIf (attr.Text = "yesAnimacy") Then
		NPArtAgrYesAnimacy.Checked = True
	Else
		NPArtAgrYesClass.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPArtAgrNo_onclick() As Boolean
	NPArtAgrNo.Checked = True
	DisplayHidden
	NPArtAgrNo_onclick = True
End Function
Private Function NPArtAgrNoPrompt_onclick() As Boolean
	NPArtAgrNo_onclick
	NPArtAgrNoPrompt_onclick = True
End Function

Private Function NPArtAgrYesNumber_onclick() As Boolean
	NPArtAgrYesNumber.Checked = True
	DisplayHidden
	NPArtAgrYesNumber_onclick = True
End Function
Private Function NPArtAgrYesNumberPrompt_onclick() As Boolean
	NPArtAgrYesNumber_onclick
	NPArtAgrYesNumberPrompt_onclick = True
End Function

Private Function NPArtAgrYesPerson_onclick() As Boolean
	NPArtAgrYesPerson.Checked = True
	DisplayHidden
	NPArtAgrYesPerson_onclick = True
End Function
Private Function NPArtAgrYesPersonPrompt_onclick() As Boolean
	NPArtAgrYesPerson_onclick
	NPArtAgrYesPersonPrompt_onclick = True
End Function

Private Function NPArtAgrYesAnimacy_onclick() As Boolean
	NPArtAgrYesAnimacy.Checked = True
	DisplayHidden
	NPArtAgrYesAnimacy_onclick = True
End Function
Private Function NPArtAgrYesAnimacyPrompt_onclick() As Boolean
	NPArtAgrYesAnimacy_onclick
	NPArtAgrYesAnimacyPrompt_onclick = True
End Function

Private Function NPArtAgrYesClass_onclick() As Boolean
	NPArtAgrYesClass.Checked = True
	DisplayHidden
	NPArtAgrYesClass_onclick = True
End Function
Private Function NPArtAgrYesClassPrompt_onclick() As Boolean
	NPArtAgrYesClass_onclick
	NPArtAgrYesClassPrompt_onclick = True
End Function

Private Function NPArtAgrOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//np/@artAgr")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPArtAgrNo.Checked) Then sTemp = "no"
	If (NPArtAgrYesNumber.Checked) Then sTemp = "yesNumber"
	If (NPArtAgrYesPerson.Checked) Then sTemp = "yesPerson"
	If (NPArtAgrYesAnimacy.Checked) Then sTemp = "yesAnimacy"
	If (NPArtAgrYesClass.Checked) Then sTemp = "yesClass"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	NPArtAgrOK_onclick = True

	BaseWindow.navigate "NPArtPosition.htm"
End Function

Private Function NPArtAgrCancel_onclick() As Boolean
	NPArtAgrCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (NPArtAgrYesNumber.Checked) Then
		NPArtAgrAnimacyInstruction.Style.display = "none"
		NPArtAgrClassInstruction.Style.display = "none"
		NPArtAgrNumberInstruction.Style.display = ""
		NPArtAgrNumberObligatoryInstruction.Style.display = ""
		NPArtAgrNumberOptionalInstruction.Style.display = "none"
		NPArtAgrPersonInstruction.Style.display = "none"
		NPArtAgrGenderInstruction.Style.display = "none"
	ElseIf (NPArtAgrYesPerson.Checked) Then
		NPArtAgrAnimacyInstruction.Style.display = "none"
		NPArtAgrClassInstruction.Style.display = "none"
		NPArtAgrNumberInstruction.Style.display = ""
		NPArtAgrNumberObligatoryInstruction.Style.display = ""
		NPArtAgrNumberOptionalInstruction.Style.display = "none"
		NPArtAgrPersonInstruction.Style.display = ""
		NPArtAgrPersonObligatoryInstruction.Style.display = ""
		NPArtAgrPersonOptionalInstruction.Style.display = "none"
		NPArtAgrGenderInstruction.Style.display = ""
	ElseIf (NPArtAgrYesAnimacy.Checked) Then
		NPArtAgrAnimacyInstruction.Style.display = ""
		NPArtAgrClassInstruction.Style.display = "none"
		NPArtAgrNumberInstruction.Style.display = ""
		NPArtAgrNumberObligatoryInstruction.Style.display = "none"
		NPArtAgrNumberOptionalInstruction.Style.display = ""
		NPArtAgrPersonInstruction.Style.display = ""
		NPArtAgrPersonObligatoryInstruction.Style.display = "none"
		NPArtAgrPersonOptionalInstruction.Style.display = ""
		NPArtAgrGenderInstruction.Style.display = ""
	ElseIf (NPArtAgrYesClass.Checked) Then
		NPArtAgrAnimacyInstruction.Style.display = "none"
		NPArtAgrClassInstruction.Style.display = ""
		NPArtAgrNumberInstruction.Style.display = ""
		NPArtAgrNumberObligatoryInstruction.Style.display = "none"
		NPArtAgrNumberOptionalInstruction.Style.display = ""
		NPArtAgrPersonInstruction.Style.display = ""
		NPArtAgrPersonObligatoryInstruction.Style.display = "none"
		NPArtAgrPersonOptionalInstruction.Style.display = ""
		NPArtAgrGenderInstruction.Style.display = ""
	Else
		NPArtAgrAnimacyInstruction.Style.display = "none"
		NPArtAgrClassInstruction.Style.display = "none"
		NPArtAgrNumberInstruction.Style.display = "none"
		NPArtAgrPersonInstruction.Style.display = "none"
		NPArtAgrGenderInstruction.Style.display = "none"
	End If
End Sub
