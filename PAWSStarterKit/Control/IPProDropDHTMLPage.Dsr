VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} IPProDropDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   _ExtentX        =   11906
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\IPProDrop.htm"
   BuildFile       =   "..\Control\IPProDrop.htm"
   BuildMode       =   0
   TypeLibCookie   =   62
   AsyncLoad       =   0   'False
   id              =   "IPProDropDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "IPProDropDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Dim bType4 As Boolean

Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//ip/proDropExample")
	If (elem.baseName <> "") Then
		IPExamplesProDropExample.Value = elem.Text
	Else
		IPExamplesProDropExample.Value = ""
	End If

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//ip/@proDrop4")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		IPProDrop4No.Checked = True
	ElseIf (attr.Text = "noImpv") Then
		IPProDrop4NoImpv.Checked = True
	Else
		IPProDrop4Yes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//ip/@proDrop2")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "notReally") Then
		IPProDrop2NotReally.Checked = True
	ElseIf (attr.Text = "no") Then
		IPProDrop2No.Checked = True
	ElseIf (attr.Text = "noImpv") Then
		IPProDrop2NoImpv.Checked = True
	Else
		IPProDrop2Yes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//typology/@wordOrder")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "VSO" Or attr.Text = "OSV") Then
		bType4 = False
	Else
		bType4 = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function IPProDrop4No_onclick() As Boolean
	IPProDrop4No.Checked = True
	DisplayHidden
	IPProDrop4No_onclick = True
End Function
Private Function IPProDrop4NoPrompt_onclick() As Boolean
	IPProDrop4No_onclick
	IPProDrop4NoPrompt_onclick = True
End Function

Private Function IPProDrop4NoImpv_onclick() As Boolean
	IPProDrop4NoImpv.Checked = True
	DisplayHidden
	IPProDrop4NoImpv_onclick = True
End Function
Private Function IPProDrop4NoImpvPrompt_onclick() As Boolean
	IPProDrop4NoImpv_onclick
	IPProDrop4NoImpvPrompt_onclick = True
End Function

Private Function IPProDrop4Yes_onclick() As Boolean
	IPProDrop4Yes.Checked = True
	DisplayHidden
	IPProDrop4Yes_onclick = True
End Function
Private Function IPProDrop4YesPrompt_onclick() As Boolean
	IPProDrop4Yes_onclick
	IPProDrop4YesPrompt_onclick = True
End Function

Private Function IPProDrop2NotReally_onclick() As Boolean
	IPProDrop2NotReally.Checked = True
	DisplayHidden
	IPProDrop2NotReally_onclick = True
End Function
Private Function IPProDrop2NotReallyPrompt_onclick() As Boolean
	IPProDrop2NotReally_onclick
	IPProDrop2NotReallyPrompt_onclick = True
End Function

Private Function IPProDrop2No_onclick() As Boolean
	IPProDrop2No.Checked = True
	DisplayHidden
	IPProDrop2No_onclick = True
End Function
Private Function IPProDrop2NoPrompt_onclick() As Boolean
	IPProDrop2No_onclick
	IPProDrop2NoPrompt_onclick = True
End Function

Private Function IPProDrop2NoImpv_onclick() As Boolean
	IPProDrop2NoImpv.Checked = True
	DisplayHidden
	IPProDrop2NoImpv_onclick = True
End Function
Private Function IPProDrop2NoImpvPrompt_onclick() As Boolean
	IPProDrop2NoImpv_onclick
	IPProDrop2NoImpvPrompt_onclick = True
End Function

Private Function IPProDrop2Yes_onclick() As Boolean
	IPProDrop2Yes.Checked = True
	DisplayHidden
	IPProDrop2Yes_onclick = True
End Function
Private Function IPProDrop2YesPrompt_onclick() As Boolean
	IPProDrop2Yes_onclick
	IPProDrop2YesPrompt_onclick = True
End Function

Private Function IPProDropOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//ip/proDropExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = IPExamplesProDropExample.Value

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//ip/@proDrop4")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (IPProDrop4No.Checked) Then sTemp = "no"
	If (IPProDrop4NoImpv.Checked) Then sTemp = "noImpv"
	If (IPProDrop4Yes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//ip/@proDrop2")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (IPProDrop2NotReally.Checked) Then sTemp = "notReally"
	If (IPProDrop2No.Checked) Then sTemp = "no"
	If (IPProDrop2NoImpv.Checked) Then sTemp = "noImpv"
	If (IPProDrop2Yes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	IPProDropOK_onclick = True

	BaseWindow.navigate "IPContents.htm"
End Function

Private Function IPProDropCancel_onclick() As Boolean
	IPProDropCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	If (bType4) Then
		IPProDrop4.Style.display = ""
		IPProDrop2.Style.display = "none"
		IPProDrop2NotReallyInstruction.Style.display = "none"
		IPProDrop2NoImpvInstruction.Style.display = "none"
		If (IPProDrop4NoImpv.Checked) Then
			IPProDrop4NoImpvInstruction.Style.display = ""
		Else
			IPProDrop4NoImpvInstruction.Style.display = "none"
		End If
	Else
		IPProDrop4.Style.display = "none"
		IPProDrop4NoImpvInstruction.Style.display = "none"
		IPProDrop2.Style.display = ""
		If (IPProDrop2NotReally.Checked) Then
			IPProDrop2NotReallyInstruction.Style.display = ""
		Else
			IPProDrop2NotReallyInstruction.Style.display = "none"
		End If
		If (IPProDrop2NoImpv.Checked) Then
			IPProDrop2NoImpvInstruction.Style.display = ""
		Else
			IPProDrop2NoImpvInstruction.Style.display = "none"
		End If
	End If

End Sub
