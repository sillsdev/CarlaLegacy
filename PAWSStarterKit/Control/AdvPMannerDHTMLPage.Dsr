VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} AdvPMannerDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5790
   _ExtentX        =   10213
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\AdvPManner.htm"
   BuildFile       =   "..\Control\AdvPManner.htm"
   BuildMode       =   0
   TypeLibCookie   =   25
   AsyncLoad       =   0   'False
   id              =   "AdvPMannerDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "AdvPMannerDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//advp/mannerExample")
	If (elem.baseName <> "") Then
		AdvPMannerExample.Value = elem.Text
	Else
		AdvPMannerExample.Value = ""
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function AdvPMannerExamplesOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//advp/mannerExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = AdvPMannerExample.Value

	gbDirty = True  ' mark it as having changed
	AdvPMannerExamplesOK_onclick = True

	BaseWindow.navigate "AdvPReason.htm"
End Function

Private Function AdvPMannerExamplesCancel_onclick() As Boolean
	AdvPMannerExamplesCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
