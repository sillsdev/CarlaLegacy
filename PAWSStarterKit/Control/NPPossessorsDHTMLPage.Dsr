VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPPossessorsDHTMLPage
   ClientHeight    =   7110
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8415
   _ExtentX        =   14843
   _ExtentY        =   12541
   SourceFile      =   "..\HTMs\NPPossessors.htm"
   BuildFile       =   "..\Control\NPPossessors.htm"
   BuildMode       =   0
   TypeLibCookie   =   71
   AsyncLoad       =   0   'False
   id              =   "NPPossessorsDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPPossessorsDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//np/embeddedExample")
	If (elem.baseName <> "") Then
		NPPossEmbeddedExample.Value = elem.Text
	Else
		NPPossEmbeddedExample.Value = ""
	End If

	Set elem = gxmlDom.selectSingleNode("//np/ppExample")
	If (elem.baseName <> "") Then
		NPPossPPExample.Value = elem.Text
	Else
		NPPossPPExample.Value = ""
	End If

	Set elem = gxmlDom.selectSingleNode("//np/relClExample")
	If (elem.baseName <> "") Then
		NPPossRelClExample.Value = elem.Text
	Else
		NPPossRelClExample.Value = ""
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPPossOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//np/embeddedExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = NPPossEmbeddedExample.Value

	Set elem = gxmlDom.selectSingleNode("//np/ppExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = NPPossPPExample.Value

	Set elem = gxmlDom.selectSingleNode("//np/relClExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = NPPossRelClExample.Value

	gbDirty = True  ' mark it as having changed

	NPPossOK_onclick = True

	BaseWindow.navigate "NPPossessors2.htm"
End Function

Private Function NPPossCancel_onclick() As Boolean
	NPPossCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
