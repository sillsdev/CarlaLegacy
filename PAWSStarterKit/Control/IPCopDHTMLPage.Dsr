VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} IPCopDHTMLPage
   ClientHeight    =   6990
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8955
   _ExtentX        =   15796
   _ExtentY        =   12330
   SourceFile      =   "..\HTMs\IPCop.htm"
   BuildFile       =   "..\Control\IPCop.htm"
   BuildMode       =   0
   TypeLibCookie   =   43
   AsyncLoad       =   0   'False
   id              =   "IPCopDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "IPCopDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//ip/intransExample")
	If (elem.baseName <> "") Then
		IPExamplesIntranExample.Value = elem.Text
	Else
		IPExamplesIntranExample.Value = ""
	End If

	Set elem = gxmlDom.selectSingleNode("//ip/copularExample")
	If (elem.baseName <> "") Then
		IPExamplesCopularExample.Value = elem.Text
	Else
		IPExamplesCopularExample.Value = ""
	End If

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//ip/@copular")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		IPCopVerbNo.Checked = True
	ElseIf (attr.Text = "yesNeither") Then
		IPCopVerbYesNeither.Checked = True
	Else
		IPCopVerbYesAux.Checked = True
	End If

	If (GetHeadPos = geHeadPos.iInitial) Then
		IPCopFollow.Style.display = ""
		IPCopPrecede.Style.display = "none"
	Else
		IPCopFollow.Style.display = "none"
		IPCopPrecede.Style.display = ""
	End If
		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function IPCopVerbNo_onclick() As Boolean
	IPCopVerbNo.Checked = True
	IPCopVerbNo_onclick = True
End Function
Private Function IPCopVerbNoPrompt_onclick() As Boolean
	IPCopVerbNo_onclick
	IPCopVerbNoPrompt_onclick = True
End Function

Private Function IPCopVerbYesNeither_onclick() As Boolean
	IPCopVerbYesNeither.Checked = True
	IPCopVerbYesNeither_onclick = True
End Function
Private Function IPCopVerbYesNeitherPrompt_onclick() As Boolean
	IPCopVerbYesNeither_onclick
	IPCopVerbYesNeitherPrompt_onclick = True
End Function

Private Function IPCopVerbYesAux_onclick() As Boolean
	IPCopVerbYesAux.Checked = True
	IPCopVerbYesAux_onclick = True
End Function
Private Function IPCopVerbYesAuxPrompt_onclick() As Boolean
	IPCopVerbYesAux_onclick
	IPCopVerbYesAuxPrompt_onclick = True
End Function

Private Function IPCopOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//ip/intransExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = IPExamplesIntranExample.Value

	Set elem = gxmlDom.selectSingleNode("//ip/copularExample")
	'TODO: figure what to do if any of these are missing!
	elem.Text = IPExamplesCopularExample.Value

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//ip/@copular")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (IPCopVerbNo.Checked) Then sTemp = "no"
	If (IPCopVerbYesNeither.Checked) Then sTemp = "yesNeither"
	If (IPCopVerbYesAux.Checked) Then sTemp = "yesAux"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	IPCopOK_onclick = True

	BaseWindow.navigate "IPContents.htm"
End Function

Private Function IPCopCancel_onclick() As Boolean
	IPCopCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
