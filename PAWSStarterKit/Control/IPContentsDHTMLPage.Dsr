VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} IPContentsDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   _ExtentX        =   11906
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\IPContents.htm"
   BuildFile       =   "..\Control\IPContents.htm"
   BuildMode       =   0
   TypeLibCookie   =   126
   AsyncLoad       =   0   'False
   id              =   "IPContentsDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "IPContentsDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Private Function IPContentsOverviewStatus_onclick() As Boolean
	ToggleCheckedOffStatus "1"
	IPContentsOverviewStatus_onclick = True
End Function

Private Function IPContentsFeaturesStatus_onclick() As Boolean
	ToggleCheckedOffStatus "2"
	IPContentsFeaturesStatus_onclick = True
End Function

Private Function IPContentsProDropStatus_onclick() As Boolean
	ToggleCheckedOffStatus "3"
	IPContentsProDropStatus_onclick = True
End Function

Private Function IPContentsAuxStatus_onclick() As Boolean
	ToggleCheckedOffStatus "4"
	IPContentsAuxStatus_onclick = True
End Function

Private Function IPContentsIntransStatus_onclick() As Boolean
	ToggleCheckedOffStatus "5"
	IPContentsIntransStatus_onclick = True
End Function

Private Function IPContentsTransStatus_onclick() As Boolean
	ToggleCheckedOffStatus "6"
	IPContentsTransStatus_onclick = True
End Function

Private Function IPContentsPassiveStatus_onclick() As Boolean
	ToggleCheckedOffStatus "7"
	IPContentsPassiveStatus_onclick = True
End Function

Private Function IPContentsTestingStatus_onclick() As Boolean
	ToggleCheckedOffStatus "8"
	IPContentsTestingStatus_onclick = True
End Function

Private Sub DHTMLPage_Load()
		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	DisplayCheckedOffStatus "1", "IPContentsOverviewStatus"
	DisplayCheckedOffStatus "2", "IPContentsFeaturesStatus"
	DisplayCheckedOffStatus "3", "IPContentsProDropStatus"
	DisplayCheckedOffStatus "4", "IPContentsAuxStatus"
	DisplayCheckedOffStatus "5", "IPContentsIntransStatus"
	DisplayCheckedOffStatus "6", "IPContentsTransStatus"
	DisplayCheckedOffStatus "7", "IPContentsPassiveStatus"
	DisplayCheckedOffStatus "8", "IPContentsTestingStatus"
	BaseWindow.focus
End Sub

Private Sub DisplayCheckedOffStatus(sElement As String, sId As String)
	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//ip/ipContents" & sElement & "/@checkedOff")
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
	Set attr = gxmlDom.selectSingleNode("//ip/ipContents" & sElement & "/@checkedOff")
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
