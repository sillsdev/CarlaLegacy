VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} ContentsDHTMLPage
   ClientHeight    =   4275
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6525
   _ExtentX        =   11509
   _ExtentY        =   7541
   SourceFile      =   "..\HTMs\Contents.htm"
   BuildFile       =   "..\Control\Contents.htm"
   BuildMode       =   0
   TypeLibCookie   =   500
   AsyncLoad       =   0   'False
   id              =   "ContentsDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "ContentsDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private Function ContentsAdjectivesStatus_onclick() As Boolean
	ToggleCheckedOffStatus "adjp"
	ContentsAdjectivesStatus_onclick = True
End Function

Private Function ContentsAdvClsStatus_onclick() As Boolean
	ToggleCheckedOffStatus "advcl"
	ContentsAdvClsStatus_onclick = True
End Function

Private Function ContentsAdverbsStatus_onclick() As Boolean
	ToggleCheckedOffStatus "advp"
	ContentsAdverbsStatus_onclick = True
End Function

Private Function ContentsCompsStatus_onclick() As Boolean
	ToggleCheckedOffStatus "comp"
	ContentsCompsStatus_onclick = True
End Function

Private Function ContentsCoordStatus_onclick() As Boolean
	ToggleCheckedOffStatus "coord"
	ContentsCoordStatus_onclick = True
End Function

Private Function ContentsFocusStatus_onclick() As Boolean
	ToggleCheckedOffStatus "focus"
	ContentsFocusStatus_onclick = True
End Function

Private Function ContentsFullNPsStatus_onclick() As Boolean
	ToggleCheckedOffStatus "fullnp"
	ContentsFullNPsStatus_onclick = True
End Function

Private Function ContentsNegativeStatus_onclick() As Boolean
	ToggleCheckedOffStatus "neg"
	ContentsNegativeStatus_onclick = True
End Function

Private Function ContentsOverallTypologyQuestionsStatus_onclick() As Boolean
	ToggleCheckedOffStatus "typology"
	ContentsOverallTypologyQuestionsStatus_onclick = True
End Function

Private Function ContentsPrepositionsStatus_onclick() As Boolean
	ToggleCheckedOffStatus "pp"
	ContentsPrepositionsStatus_onclick = True
End Function

Private Function ContentsPronounsStatus_onclick() As Boolean
	ToggleCheckedOffStatus "pron"
	ContentsPronounsStatus_onclick = True
End Function

Private Function ContentsQuantifiersStatus_onclick() As Boolean
	ToggleCheckedOffStatus "qp"
	ContentsQuantifiersStatus_onclick = True
End Function

Private Function ContentsQuestionsStatus_onclick() As Boolean
	ToggleCheckedOffStatus "q"
	ContentsQuestionsStatus_onclick = True
End Function

Private Function ContentsRelClStatus_onclick() As Boolean
	ToggleCheckedOffStatus "relcl"
	ContentsRelClStatus_onclick = True
End Function

Private Function ContentsSimpleNPStatus_onclick() As Boolean
	ToggleCheckedOffStatus "np"
	ContentsSimpleNPStatus_onclick = True
End Function

Private Function ContentsSingleClausesStatus_onclick() As Boolean
	ToggleCheckedOffStatus "ip"
	ContentsSingleClausesStatus_onclick = True
End Function

Private Sub DHTMLPage_Load()
	On Error Resume Next
		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	DisplayCheckedOffStatus "typology", "ContentsOverallTypologyQuestionsStatus"
	DisplayCheckedOffStatus "qp", "ContentsQuantifiersStatus"
	DisplayCheckedOffStatus "advp", "ContentsAdverbsStatus"
	DisplayCheckedOffStatus "adjp", "ContentsAdjectivesStatus"
	DisplayCheckedOffStatus "np", "ContentsSimpleNPStatus"
	DisplayCheckedOffStatus "pron", "ContentsPronounsStatus"
	DisplayCheckedOffStatus "pp", "ContentsPrepositionsStatus"
	DisplayCheckedOffStatus "ip", "ContentsSingleClausesStatus"
	DisplayCheckedOffStatus "q", "ContentsQuestionsStatus"
	DisplayCheckedOffStatus "focus", "ContentsFocusStatus"
	DisplayCheckedOffStatus "neg", "ContentsNegativeStatus"
	DisplayCheckedOffStatus "comp", "ContentsCompsStatus"
	DisplayCheckedOffStatus "advcl", "ContentsAdvClsStatus"
	DisplayCheckedOffStatus "relcl", "ContentsRelClStatus"
	DisplayCheckedOffStatus "fullnp", "ContentsFullNPsStatus"
	DisplayCheckedOffStatus "coord", "ContentsCoordStatus"
	BaseWindow.focus
End Sub

Private Sub DisplayCheckedOffStatus(sElement As String, sId As String)
	On Error Resume Next

	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//" & sElement & "/@checkedOff")
	'TODO: figure what to do if any of these are missing!
		' display the checked off image
	Dim sImg As String
	sImg = "&nbsp;&nbsp;<img src='"
	If (attr.Text = "yes") Then
		sImg = sImg + "CheckedOff.GIF'>"
	Else
		sImg = sImg + "UnCheckedOff.GIF'>"
	End If
	DHTMLPage.Document.getElementById(sId).innerHTML = sImg

End Sub
Private Sub ToggleCheckedOffStatus(sElement As String)
	On Error Resume Next

	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//" & sElement & "/@checkedOff")
	'TODO: figure what to do if any of these are missing!
	Dim sImg As String
	sImg = "&nbsp;&nbsp;<img src='"
		' toggle the checked off image and value
	If (attr.Text = "yes") Then
		sImg = sImg + "UnCheckedOff.GIF'>"
		attr.Text = "no"
	Else
		sImg = sImg + "CheckedOff.GIF'>"
		attr.Text = "yes"
	End If
	DHTMLPage.Document.activeElement.innerHTML = sImg
	gbDirty = True ' Data has changed

End Sub
