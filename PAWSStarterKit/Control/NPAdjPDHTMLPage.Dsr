VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPAdjPDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6615
   _ExtentX        =   11668
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\NPAdjP.htm"
   BuildFile       =   "..\Control\NPAdjP.htm"
   BuildMode       =   0
   TypeLibCookie   =   52
   AsyncLoad       =   0   'False
   id              =   "NPAdjPDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPAdjPDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//np/adjpExample")
	If (elem.baseName <> "") Then
		NPAdjpExample.Value = elem.Text
	Else
		NPAdjpExample.Value = ""
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPAdjPOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//np/adjpExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = NPAdjpExample.Value

	gbDirty = True  ' mark it as having changed

	NPAdjPOK_onclick = True

	BaseWindow.navigate "NPAdjP2.htm"
End Function

Private Function NPAdjPCancel_onclick() As Boolean
	NPAdjPCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
