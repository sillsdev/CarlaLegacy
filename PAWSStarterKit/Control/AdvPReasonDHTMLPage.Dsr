VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} AdvPReasonDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5790
   _ExtentX        =   10213
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\AdvPReason.htm"
   BuildFile       =   "..\Control\AdvPReason.htm"
   BuildMode       =   0
   TypeLibCookie   =   25
   AsyncLoad       =   0   'False
   id              =   "AdvPReasonDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "AdvPReasonDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//advp/reasonExample")
	If (elem.baseName <> "") Then
		AdvPReasonExample.Value = elem.Text
	Else
		AdvPReasonExample.Value = ""
	End If

			' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
BaseWindow.focus
End Sub

Private Function AdvPReasonExamplesOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//advp/reasonExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = AdvPReasonExample.Value

	gbDirty = True  ' mark it as having changed
	AdvPReasonExamplesOK_onclick = True

	BaseWindow.navigate "AdvPDegree.htm"
End Function

Private Function AdvPReasonExamplesCancel_onclick() As Boolean
	AdvPReasonExamplesCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
