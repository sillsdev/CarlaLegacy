VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} AdvPLocativeDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5790
   _ExtentX        =   10213
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\AdvPLocative.htm"
   BuildFile       =   "..\Control\AdvPLocative.htm"
   BuildMode       =   0
   TypeLibCookie   =   25
   AsyncLoad       =   0   'False
   id              =   "AdvPLocativeDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "AdvPLocativeDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//advp/locativeExample")
	If (elem.baseName <> "") Then
		AdvPLocExample.Value = elem.Text
	Else
		AdvPLocExample.Value = ""
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function AdvPLocExamplesOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//advp/locativeExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = AdvPLocExample.Value

	gbDirty = True  ' mark it as having changed
	AdvPLocExamplesOK_onclick = True

	BaseWindow.navigate "AdvPManner.htm"
End Function

Private Function AdvPLocExamplesCancel_onclick() As Boolean
	AdvPLocExamplesCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next
End Function
