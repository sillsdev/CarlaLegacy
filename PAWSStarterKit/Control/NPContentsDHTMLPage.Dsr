VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPContentsDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6615
   _ExtentX        =   11668
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\NPContents.htm"
   BuildFile       =   "..\Control\NPContents.htm"
   BuildMode       =   0
   TypeLibCookie   =   11
   AsyncLoad       =   0   'False
   id              =   "NPContentsDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPContentsDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private Function NPContentsOverviewStatus_onclick() As Boolean
	ToggleCheckedOffStatus "1"
	NPContentsOverviewStatus_onclick = True
End Function

Private Function NPContentsDegreeWordsStatus_onclick() As Boolean
	ToggleCheckedOffStatus "2"
	NPContentsDegreeWordsStatus_onclick = True
End Function

Private Function NPContentsArticleStatus_onclick() As Boolean
	ToggleCheckedOffStatus "3"
	NPContentsArticleStatus_onclick = True
End Function

Private Function NPContentsPossessorsStatus_onclick() As Boolean
	ToggleCheckedOffStatus "4"
	NPContentsPossessorsStatus_onclick = True
End Function

Private Function NPContentsQPStatus_onclick() As Boolean
	ToggleCheckedOffStatus "5"
	NPContentsQPStatus_onclick = True
End Function

Private Function NPContentsAdjPStatus_onclick() As Boolean
	ToggleCheckedOffStatus "6"
	NPContentsAdjPStatus_onclick = True
End Function

Private Function NPContentsNounCaseStatus_onclick() As Boolean
	ToggleCheckedOffStatus "7"
	NPContentsNounCaseStatus_onclick = True
End Function

Private Function NPContentsCompoundsStatus_onclick() As Boolean
	ToggleCheckedOffStatus "8"
	NPContentsCompoundsStatus_onclick = True
End Function

Private Function NPContentsTestingStatus_onclick() As Boolean
	ToggleCheckedOffStatus "9"
	NPContentsTestingStatus_onclick = True
End Function

Private Sub DHTMLPage_Load()
		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	DisplayCheckedOffStatus "1", "NPContentsOverviewStatus"
	DisplayCheckedOffStatus "2", "NPContentsDegreeWordsStatus"
	DisplayCheckedOffStatus "3", "NPContentsArticleStatus"
	DisplayCheckedOffStatus "4", "NPContentsPossessorsStatus"
	DisplayCheckedOffStatus "5", "NPContentsQPStatus"
	DisplayCheckedOffStatus "6", "NPContentsAdjPStatus"
	DisplayCheckedOffStatus "7", "NPContentsNounCaseStatus"
	DisplayCheckedOffStatus "8", "NPContentsCompoundsStatus"
	DisplayCheckedOffStatus "9", "NPContentsTestingStatus"
	BaseWindow.focus
End Sub

Private Sub DisplayCheckedOffStatus(sElement As String, sId As String)
	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//np/npContents" & sElement & "/@checkedOff")
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
	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//np/npContents" & sElement & "/@checkedOff")
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
