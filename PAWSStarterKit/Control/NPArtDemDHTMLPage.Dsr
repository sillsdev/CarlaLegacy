VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPArtDemDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6780
   _ExtentX        =   11959
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\NPArtDem.htm"
   BuildFile       =   "..\Control\NPArtDem.htm"
   BuildMode       =   0
   TypeLibCookie   =   35
   AsyncLoad       =   0   'False
   id              =   "NPArtDemDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPArtDemDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//np/example")
	If (elem.baseName <> "") Then
		NPExample.Value = elem.Text
	Else
		NPExample.Value = ""
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPArtDemOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
		Set elem = gxmlDom.selectSingleNode("//np/example")
	'TODO: figure what to do if any of these are missing!
	elem.Text = NPExample.Value

	gbDirty = True  ' mark it as having changed

	NPArtDemOK_onclick = True

	BaseWindow.navigate "NPArtCase.htm"
End Function

Private Function NPArtDemCancel_onclick() As Boolean
	NPArtDemCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
