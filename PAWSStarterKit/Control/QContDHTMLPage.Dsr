VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} QContDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   _ExtentX        =   11906
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\QCont.htm"
   BuildFile       =   "..\Control\QCont.htm"
   BuildMode       =   0
   TypeLibCookie   =   15
   AsyncLoad       =   0   'False
   id              =   "QContDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "QContDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//q/whWords")
	If (elem.baseName <> "") Then
		QWhWords.Value = elem.Text
	Else
		QWhWords.Value = ""
	End If

	Set elem = gxmlDom.selectSingleNode("//q/contentExample")
	If (elem.baseName <> "") Then
		QContExample.Value = elem.Text
	Else
		QContExample.Value = ""
	End If

	Set elem = gxmlDom.selectSingleNode("//q/embContentExample")
	If (elem.baseName <> "") Then
		QEmbContentExample.Value = elem.Text
	Else
		QEmbContentExample.Value = ""
	End If

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function QContOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//q/whWords")
	'TODO: figure what to do if any of these are missing!
	elem.Text = QWhWords.Value

	Set elem = gxmlDom.selectSingleNode("//q/contentExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = QContExample.Value

	Set elem = gxmlDom.selectSingleNode("//q/embContentExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = QEmbContentExample.Value

	gbDirty = True  ' mark it as having changed

	QContOK_onclick = True

	BaseWindow.navigate "QMainCont.htm"
End Function

Private Function QContCancel_onclick() As Boolean
	QContCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
