VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} QMainDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   _ExtentX        =   11906
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\QMain.htm"
   BuildFile       =   "..\Control\QMain.htm"
   BuildMode       =   0
   TypeLibCookie   =   27
   AsyncLoad       =   0   'False
   id              =   "QMainDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "QMainDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//q/example")
	If (elem.baseName <> "") Then
		QExample.Value = elem.Text
	Else
		QExample.Value = ""
	End If

	Set elem = gxmlDom.selectSingleNode("//q/embYNExample")
	If (elem.baseName <> "") Then
		QEmbYNExample.Value = elem.Text
	Else
		QEmbYNExample.Value = ""
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function QOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//q/example")
	'TODO: figure what to do if any of these are missing!
	elem.Text = QExample.Value

	Set elem = gxmlDom.selectSingleNode("//q/embYNExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = QEmbYNExample.Value

	gbDirty = True  ' mark it as having changed

	QOK_onclick = True

	BaseWindow.navigate "QMainYN.htm"
End Function

Private Function QCancel_onclick() As Boolean
	QCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
