VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} PronIndefiniteDHTMLPage
   ClientHeight    =   7110
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9150
   _ExtentX        =   16140
   _ExtentY        =   12541
   SourceFile      =   "..\HTMs\PronIndefinite.htm"
   BuildFile       =   "..\Control\PronIndefinite.htm"
   BuildMode       =   0
   TypeLibCookie   =   73
   AsyncLoad       =   0   'False
   id              =   "PronIndefiniteDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "PronIndefiniteDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//pron/@indef")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		PronIndefNo.Checked = True
	Else
		PronIndefYes.Checked = True
	End If

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//pron/indefNPExample")
	If (elem.baseName <> "") Then
		PronIndefNPExample.Value = elem.Text
	Else
		PronIndefNPExample.Value = ""
	End If

	Set elem = gxmlDom.selectSingleNode("//pron/indefExample")
	If (elem.baseName <> "") Then
		PronIndefExample.Value = elem.Text
	Else
		PronIndefExample.Value = ""
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function PronIndefNo_onclick() As Boolean
	PronIndefNo.Checked = True
	DisplayHidden
	PronIndefNo_onclick = True
End Function
Private Function PronIndefNoPrompt_onclick() As Boolean
	PronIndefNo_onclick
	PronIndefNoPrompt_onclick = True
End Function

Private Function PronIndefYes_onclick() As Boolean
	PronIndefYes.Checked = True
	DisplayHidden
	PronIndefYes_onclick = True
End Function
Private Function PronIndefYesPrompt_onclick() As Boolean
	PronIndefYes_onclick
	PronIndefYesPrompt_onclick = True
End Function

Private Function PronIndefOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//pron/@indef")
	'TODO: figure what to do if any of these are missing!
	sTemp = "" ' default if all else fails...
	If (PronIndefNo.Checked) Then sTemp = "no"
	If (PronIndefYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//pron/indefNPExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = PronIndefNPExample.Value

	Set elem = gxmlDom.selectSingleNode("//pron/indefExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = PronIndefExample.Value

	gbDirty = True  ' mark it as having changed

	PronIndefOK_onclick = True

	BaseWindow.navigate "PronNP.htm"
End Function

Private Function PronIndefCancel_onclick() As Boolean
	PronIndefCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (PronIndefNo.Checked) Then
		PronIndefYesInstruction.Style.display = "none"
		PronIndefNPExamplePrompt.Style.display = ""
		PronIndefNPExample.Style.display = ""
		PronIndefExamplePrompt.Style.display = "none"
		PronIndefExample.Style.display = "none"
	Else
		PronIndefYesInstruction.Style.display = ""
		PronIndefNPExamplePrompt.Style.display = "none"
		PronIndefNPExample.Style.display = "none"
		PronIndefExamplePrompt.Style.display = ""
		PronIndefExample.Style.display = ""
	End If

End Sub
