VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPQPDHTMLPage
   ClientHeight    =   7110
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8010
   _ExtentX        =   14129
   _ExtentY        =   12541
   SourceFile      =   "..\HTMs\NPQP.htm"
   BuildFile       =   "..\Control\NPQP.htm"
   BuildMode       =   0
   TypeLibCookie   =   86
   AsyncLoad       =   0   'False
   id              =   "NPQPDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPQPDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//np/qpExample")
	If (elem.baseName <> "") Then
		NPQPExample.Value = elem.Text
	Else
		NPQPExample.Value = ""
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPQPOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//np/qpExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = NPQPExample.Value

	gbDirty = True  ' mark it as having changed

	NPQPOK_onclick = True

	BaseWindow.navigate "NPQP2.htm"
End Function

Private Function NPQPCancel_onclick() As Boolean
	NPQPCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
