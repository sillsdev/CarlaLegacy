VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPPossessorAgrDHTMLPage
   ClientHeight    =   6990
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8145
   _ExtentX        =   14367
   _ExtentY        =   12330
   SourceFile      =   "..\HTMs\NPPossessorAgr.htm"
   BuildFile       =   "..\Control\NPPossessorAgr.htm"
   BuildMode       =   0
   TypeLibCookie   =   165
   AsyncLoad       =   0   'False
   id              =   "NPPossessorAgrDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPPossessorAgrDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim attr As IXMLDOMNode
	Dim sPos As String

	Set attr = gxmlDom.selectSingleNode("//np/@possAgr")
	If (IsEmpty(attr)) Then
		' TODO: figure out how to catch a failure here and then fix it
	End If
	If (attr.Text = "no") Then
		NPPossAgrNo.Checked = True
	Else
		NPPossAgrYes.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPPossAgrNo_onclick() As Boolean
	NPPossAgrNo.Checked = True
	DisplayHidden
	NPPossAgrNo_onclick = True
End Function
Private Function NPPossAgrNoPrompt_onclick() As Boolean
	NPPossAgrNo_onclick
	NPPossAgrNoPrompt_onclick = True
End Function

Private Function NPPossAgrYes_onclick() As Boolean
	NPPossAgrYes.Checked = True
	DisplayHidden
	NPPossAgrYes_onclick = True
End Function
Private Function NPPossAgrYesPrompt_onclick() As Boolean
	NPPossAgrYes_onclick
	NPPossAgrYesPrompt_onclick = True
End Function

Private Function NPPossAgrOK_onclick() As Boolean

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//np/@possAgr")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPPossAgrNo.Checked) Then sTemp = "no"
	If (NPPossAgrYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	NPPossAgrOK_onclick = True

	BaseWindow.navigate "NPContents.htm"
End Function

Private Function NPPossAgrCancel_onclick() As Boolean
	NPPossAgrCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	NPPossAgrTable.Style.display = ""
	If (NPPossAgrYes.Checked) Then
		NPPossAgrYesInstruction.Style.display = ""
		NPPossAgr2Instruction.Style.display = ""
	Else
		NPPossAgrYesInstruction.Style.display = "none"
		NPPossAgr2Instruction.Style.display = "none"
	End If

End Sub
