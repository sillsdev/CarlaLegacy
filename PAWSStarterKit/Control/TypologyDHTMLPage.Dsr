VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} TypologyDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5115
   _ExtentX        =   9022
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\OverallTypologyQuestions.htm"
   BuildFile       =   "..\Control\OverallTypologyQuestions.htm"
   BuildMode       =   0
   TypeLibCookie   =   516
   AsyncLoad       =   0   'False
   id              =   "TypologyDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "TypologyDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private Sub DHTMLPage_Load()
	Dim wordOrder As IXMLDOMNode
	Dim typologyEx As IXMLDOMNode
	Dim sWO As String
	Set typologyEx = gxmlDom.selectSingleNode("//typology/example")
	If (typologyEx.baseName <> "") Then
		TypologyExample.Value = typologyEx.Text
	Else
		TypologyExample.Value = ""
	End If
	Set wordOrder = gxmlDom.selectSingleNode("//typology/@wordOrder")
	If (wordOrder.baseName = "") Then
		'TODO: create one
	End If
	sWO = wordOrder.Text
	If (sWO = "SVO") Then
		TypologySVO.Checked = True
	Else
		TypologySVO.Checked = False
	End If
	If (sWO = "SOV") Then
		TypologySOV.Checked = True
	Else
		TypologySOV.Checked = False
	End If
	If (sWO = "VSO") Then
		TypologyVSO.Checked = True
	Else
		TypologyVSO.Checked = False
	End If
	If (sWO = "VOS") Then
		TypologyVOS.Checked = True
	Else
		TypologyVOS.Checked = False
	End If
	If (sWO = "OVS") Then
		TypologyOVS.Checked = True
	Else
		TypologyOVS.Checked = False
	End If
	If (sWO = "OSV") Then
		TypologyOSV.Checked = True
	Else
		TypologyOSV.Checked = False
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus    ' ensure the window has focus
End Sub

Private Function TypologyCancel_onclick() As Boolean
	TypologyCancel_onclick = True
	BaseWindow.navigate "Contents.htm"

End Function

Private Function TypologyOK_onclick() As Boolean

	Dim wordOrder As IXMLDOMNode
	Dim typologyEx As IXMLDOMNode
	Dim sWO As String
	Set typologyEx = gxmlDom.selectSingleNode("//typology/example")
	If (typologyEx.baseName = "") Then
		' need to add one
		' TODO: figure out how to really do this
		Set typologyEx = gxmlDom.createElement("//typology/example")
	End If

	typologyEx.Text = TypologyExample.Value
	Set wordOrder = gxmlDom.selectSingleNode("//typology/@wordOrder")
	If (wordOrder.baseName = "") Then
		'TODO: add one
	End If
	sWO = "SVO" ' default if all else fails...
	If (TypologySVO.Checked) Then sWO = "SVO"
	If (TypologySOV.Checked) Then sWO = "SOV"
	If (TypologyVSO.Checked) Then sWO = "VSO"
	If (TypologyVOS.Checked) Then sWO = "VOS"
	If (TypologyOVS.Checked) Then sWO = "OVS"
	If (TypologyOSV.Checked) Then sWO = "OSV"
	wordOrder.Text = sWO
	gbDirty = True  ' mark it as having changed
	TypologyOK_onclick = True
	BaseWindow.navigate "Contents.htm"
End Function

Private Function TypologyOSVPrompt_onclick() As Boolean
	TypologyOSV.Checked = True
	TypologyOSVPrompt_onclick = True
End Function

Private Function TypologyOVSPrompt_onclick() As Boolean
	TypologyOVS.Checked = True
	TypologyOVSPrompt_onclick = True
End Function

Private Function TypologySOVPrompt_onclick() As Boolean
	TypologySOV.Checked = True
	TypologySOVPrompt_onclick = True
End Function

Private Function TypologySVOPrompt_onclick() As Boolean
	TypologySVO.Checked = True
	TypologySVOPrompt_onclick = True
End Function

Private Function TypologyVOSPrompt_onclick() As Boolean
	TypologyVOS.Checked = True
	TypologyVOSPrompt_onclick = True
End Function

Private Function TypologyVSOPrompt_onclick() As Boolean
	TypologyVSO.Checked = True
	TypologyVSOPrompt_onclick = True
End Function
