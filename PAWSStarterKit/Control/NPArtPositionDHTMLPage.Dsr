VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} NPArtPositionDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5985
   _ExtentX        =   10557
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\NPArtPosition.htm"
   BuildFile       =   "..\Control\NPArtPosition.htm"
   BuildMode       =   0
   TypeLibCookie   =   79
   AsyncLoad       =   0   'False
   id              =   "NPArtPositionDHTMLPage"
   ShowBorder      =   0   'False
   ShowDetail      =   -1  'True
   AbsPos          =   -1  'True
End
Attribute VB_Name = "NPArtPositionDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//np/example")
	If (elem.baseName <> "") Then
		NPArtPosExample.Value = elem.Text
	Else
		NPArtPosExample.Value = ""
	End If

	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//np/@artAndDem")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		NPArtAndDemNo.Checked = True
	ElseIf (attr.Text = "article") Then
		NPArtAndDemArt.Checked = True
	ElseIf (attr.Text = "demonstrative") Then
		NPArtAndDemDem.Checked = True
	Else
		NPArtAndDemBoth.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artArtRequired")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		NPArtAndDemArtArtRequiredNo.Checked = True
	Else
		NPArtAndDemArtArtRequiredYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artArtPos1")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	Dim sPos As String
	sPos = gGetPositionBasedOnHead(attr.Text)
	If (sPos = "before") Then
		NPArtAndDemArtArtRequiredNoPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		NPArtAndDemArtArtRequiredNoPosAfter.Checked = True
	Else
		NPArtAndDemArtArtRequiredNoPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artArtEither1")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		NPArtAndDemArtArtRequiredNoPosEitherSideAllYes.Checked = True
	Else
		NPArtAndDemArtArtRequiredNoPosEitherSideAllNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artArtPos2")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	sPos = gGetPositionBasedOnHead(attr.Text)
	If (sPos = "before") Then
		NPArtAndDemArtArtRequiredYesPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		NPArtAndDemArtArtRequiredYesPosAfter.Checked = True
	Else
		NPArtAndDemArtArtRequiredYesPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artArtRequiredBoth")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		NPArtAndDemArtArtRequiredYesPosEitherSideBothYes.Checked = True
	ElseIf (attr.Text = "noBefore") Then
		NPArtAndDemArtArtRequiredYesPosEitherSideBothNoBefore.Checked = True
	Else
		NPArtAndDemArtArtRequiredYesPosEitherSideBothNoAfter.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artArtEither2")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		NPArtAndDemArtArtRequiredYesPosEitherSideAllYes.Checked = True
	Else
		NPArtAndDemArtArtRequiredYesPosEitherSideAllNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artDemRequired")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		NPArtAndDemDemArtRequiredNo.Checked = True
	Else
		NPArtAndDemDemArtRequiredYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artDemPos1")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	sPos = gGetPositionBasedOnHead(attr.Text)
	If (sPos = "before") Then
		NPArtAndDemDemArtRequiredNoPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		NPArtAndDemDemArtRequiredNoPosAfter.Checked = True
	Else
		NPArtAndDemDemArtRequiredNoPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artDemEither1")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		NPArtAndDemDemArtRequiredNoPosEitherSideAllYes.Checked = True
	Else
		NPArtAndDemDemArtRequiredNoPosEitherSideAllNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artDemPos2")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	sPos = gGetPositionBasedOnHead(attr.Text)
	If (sPos = "before") Then
		NPArtAndDemDemArtRequiredYesPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		NPArtAndDemDemArtRequiredYesPosAfter.Checked = True
	Else
		NPArtAndDemDemArtRequiredYesPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artDemRequiredBoth")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		NPArtAndDemDemArtRequiredYesPosEitherSideBothYes.Checked = True
	ElseIf (attr.Text = "noBefore") Then
		NPArtAndDemDemArtRequiredYesPosEitherSideBothNoBefore.Checked = True
	Else
		NPArtAndDemDemArtRequiredYesPosEitherSideBothNoAfter.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artDemEither2")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		NPArtAndDemDemArtRequiredYesPosEitherSideAllYes.Checked = True
	Else
		NPArtAndDemDemArtRequiredYesPosEitherSideAllNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artBothCooccur")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		NPArtAndDemBothCoOccurNo.Checked = True
	Else
		NPArtAndDemBothCoOccurYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artBothRequired1")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		NPArtAndDemBothCoOccurNoArtOrDemRequiredNo.Checked = True
	Else
		NPArtAndDemBothCoOccurNoArtOrDemRequiredYes.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artBothPos1")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	sPos = gGetPositionBasedOnHead(attr.Text)
	If (sPos = "before") Then
		NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosAfter.Checked = True
	Else
		NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artBothEither1")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllYes.Checked = True
	Else
		NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artBothPos2")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	sPos = gGetPositionBasedOnHead(attr.Text)
	If (sPos = "before") Then
		NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosBefore.Checked = True
	ElseIf (sPos = "after") Then
		NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosAfter.Checked = True
	Else
		NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSide.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artBothRequiredBoth")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothYes.Checked = True
	ElseIf (attr.Text = "noBefore") Then
		NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoBefore.Checked = True
	Else
		NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoAfter.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artBothEither2")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllYes.Checked = True
	Else
		NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllNo.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artBothRequired2")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "no") Then
		NPArtAndDemBothCoOccurYesRequiredNo.Checked = True
	ElseIf (attr.Text = "yesArt") Then
		NPArtAndDemBothCoOccurYesRequiredYesArt.Checked = True
	ElseIf (attr.Text = "yesDem") Then
		NPArtAndDemBothCoOccurYesRequiredYesDem.Checked = True
	Else
		NPArtAndDemBothCoOccurYesRequiredYesBoth.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artBothBothPos")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "artDemNoun") Then
		NPArtAndDemBothCoOccurYesRequiredPositionArtDemNoun.Checked = True
	ElseIf (attr.Text = "artNounDem") Then
		NPArtAndDemBothCoOccurYesRequiredPositionArtBeforeDemAfter.Checked = True
	ElseIf (attr.Text = "demArtNoun") Then
		NPArtAndDemBothCoOccurYesRequiredPositionDemArtNoun.Checked = True
	ElseIf (attr.Text = "demNounArt") Then
		NPArtAndDemBothCoOccurYesRequiredPositionArtAfterDemBefore.Checked = True
	ElseIf (attr.Text = "nounArtDem") Then
		NPArtAndDemBothCoOccurYesRequiredPositionNounArtDem.Checked = True
	ElseIf (attr.Text = "nounDemArt") Then
		NPArtAndDemBothCoOccurYesRequiredPositionNounDemArt.Checked = True
	ElseIf (attr.Text = "artDemEither") Then
		NPArtAndDemBothCoOccurYesRequiredPositionArtDemEither.Checked = True
	ElseIf (attr.Text = "demArtEither") Then
		NPArtAndDemBothCoOccurYesRequiredPositionDemArtEither.Checked = True
	ElseIf (attr.Text = "artDemNounDemArt") Then
		NPArtAndDemBothCoOccurYesRequiredPositionArtDemNounDemArt.Checked = True
	Else
		NPArtAndDemBothCoOccurYesRequiredPositionDemArtNounArtDem.Checked = True
	End If

	Set attr = gxmlDom.selectSingleNode("//np/@artBothEither3")
	If (attr.baseName = "") Then
		'TODO: create one
	End If
	If (attr.Text = "yes") Then
		NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllYes.Checked = True
	Else
		NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllNo.Checked = True
	End If

	DisplayHidden

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function NPArtAndDemNo_onclick() As Boolean
	NPArtAndDemNo.Checked = True
	DisplayHidden
	NPArtAndDemNo_onclick = True
End Function
Private Function NPArtAndDemNoPrompt_onclick() As Boolean
	NPArtAndDemNo_onclick
	NPArtAndDemNoPrompt_onclick = True
End Function

Private Function NPArtAndDemArt_onclick() As Boolean
	NPArtAndDemArt.Checked = True
	DisplayHidden
	NPArtAndDemArt_onclick = True
End Function
Private Function NPArtAndDemArtPrompt_onclick() As Boolean
	NPArtAndDemArt_onclick
	NPArtAndDemArtPrompt_onclick = True
End Function

Private Function NPArtAndDemArtArtRequiredNo_onclick() As Boolean
	NPArtAndDemArtArtRequiredNo.Checked = True
	DisplayHidden
	NPArtAndDemArtArtRequiredNo_onclick = True
End Function
Private Function NPArtAndDemArtArtRequiredNoPrompt_onclick() As Boolean
	NPArtAndDemArtArtRequiredNo_onclick
	NPArtAndDemArtArtRequiredNoPrompt_onclick = True
End Function

Private Function NPArtAndDemArtArtRequiredNoPosBefore_onclick() As Boolean
	NPArtAndDemArtArtRequiredNoPosBefore.Checked = True
	DisplayHidden
	NPArtAndDemArtArtRequiredNoPosBefore_onclick = True
End Function
Private Function NPArtAndDemArtArtRequiredNoPosBeforePrompt_onclick() As Boolean
	NPArtAndDemArtArtRequiredNoPosBefore_onclick
	NPArtAndDemArtArtRequiredNoPosBeforePrompt_onclick = True
End Function

Private Function NPArtAndDemArtArtRequiredNoPosAfter_onclick() As Boolean
	NPArtAndDemArtArtRequiredNoPosAfter.Checked = True
	DisplayHidden
	NPArtAndDemArtArtRequiredNoPosAfter_onclick = True
End Function
Private Function NPArtAndDemArtArtRequiredNoPosAfterPrompt_onclick() As Boolean
	NPArtAndDemArtArtRequiredNoPosAfter_onclick
	NPArtAndDemArtArtRequiredNoPosAfterPrompt_onclick = True
End Function

Private Function NPArtAndDemArtArtRequiredNoPosEitherSide_onclick() As Boolean
	NPArtAndDemArtArtRequiredNoPosEitherSide.Checked = True
	DisplayHidden
	NPArtAndDemArtArtRequiredNoPosEitherSide_onclick = True
End Function
Private Function NPArtAndDemArtArtRequiredNoPosEitherSidePrompt_onclick() As Boolean
	NPArtAndDemArtArtRequiredNoPosEitherSide_onclick
	NPArtAndDemArtArtRequiredNoPosEitherSidePrompt_onclick = True
End Function

Private Function NPArtAndDemArtArtRequiredNoPosEitherSideAllYes_onclick() As Boolean
	NPArtAndDemArtArtRequiredNoPosEitherSideAllYes.Checked = True
	DisplayHidden
	NPArtAndDemArtArtRequiredNoPosEitherSideAllYes_onclick = True
End Function
Private Function NPArtAndDemArtArtRequiredNoPosEitherSideAllYesPrompt_onclick() As Boolean
	NPArtAndDemArtArtRequiredNoPosEitherSideAllYes_onclick
	NPArtAndDemArtArtRequiredNoPosEitherSideAllYesPrompt_onclick = True
End Function

Private Function NPArtAndDemArtArtRequiredNoPosEitherSideAllNo_onclick() As Boolean
	NPArtAndDemArtArtRequiredNoPosEitherSideAllNo.Checked = True
	DisplayHidden
	NPArtAndDemArtArtRequiredNoPosEitherSideAllNo_onclick = True
End Function
Private Function NPArtAndDemArtArtRequiredNoPosEitherSideAllNoPrompt_onclick() As Boolean
	NPArtAndDemArtArtRequiredNoPosEitherSideAllNo_onclick
	NPArtAndDemArtArtRequiredNoPosEitherSideAllNoPrompt_onclick = True
End Function

Private Function NPArtAndDemArtArtRequiredYes_onclick() As Boolean
	NPArtAndDemArtArtRequiredYes.Checked = True
	DisplayHidden
	NPArtAndDemArtArtRequiredYes_onclick = True
End Function
Private Function NPArtAndDemArtArtRequiredYesPrompt_onclick() As Boolean
	NPArtAndDemArtArtRequiredYes_onclick
	NPArtAndDemArtArtRequiredYesPrompt_onclick = True
End Function

Private Function NPArtAndDemArtArtRequiredYesPosBefore_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosBefore.Checked = True
	DisplayHidden
	NPArtAndDemArtArtRequiredYesPosBefore_onclick = True
End Function
Private Function NPArtAndDemArtArtRequiredYesPosBeforePrompt_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosBefore_onclick
	NPArtAndDemArtArtRequiredYesPosBeforePrompt_onclick = True
End Function

Private Function NPArtAndDemArtArtRequiredYesPosAfter_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosAfter.Checked = True
	DisplayHidden
	NPArtAndDemArtArtRequiredYesPosAfter_onclick = True
End Function
Private Function NPArtAndDemArtArtRequiredYesPosAfterPrompt_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosAfter_onclick
	NPArtAndDemArtArtRequiredYesPosAfterPrompt_onclick = True
End Function

Private Function NPArtAndDemArtArtRequiredYesPosEitherSide_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosEitherSide.Checked = True
	DisplayHidden
	NPArtAndDemArtArtRequiredYesPosEitherSide_onclick = True
End Function
Private Function NPArtAndDemArtArtRequiredYesPosEitherSidePrompt_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosEitherSide_onclick
	NPArtAndDemArtArtRequiredYesPosEitherSidePrompt_onclick = True
End Function

Private Function NPArtAndDemArtArtRequiredYesPosEitherSideBothYes_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosEitherSideBothYes.Checked = True
	DisplayHidden
	NPArtAndDemArtArtRequiredYesPosEitherSideBothYes_onclick = True
End Function
Private Function NPArtAndDemArtArtRequiredYesPosEitherSideBothYesPrompt_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosEitherSideBothYes_onclick
	NPArtAndDemArtArtRequiredYesPosEitherSideBothYesPrompt_onclick = True
End Function

Private Function NPArtAndDemArtArtRequiredYesPosEitherSideBothNoBefore_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosEitherSideBothNoBefore.Checked = True
	DisplayHidden
	NPArtAndDemArtArtRequiredYesPosEitherSideBothNoBefore_onclick = True
End Function
Private Function NPArtAndDemArtArtRequiredYesPosEitherSideBothNoBeforePrompt_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosEitherSideBothNoBefore_onclick
	NPArtAndDemArtArtRequiredYesPosEitherSideBothNoBeforePrompt_onclick = True
End Function

Private Function NPArtAndDemArtArtRequiredYesPosEitherSideBothNoAfter_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosEitherSideBothNoAfter.Checked = True
	DisplayHidden
	NPArtAndDemArtArtRequiredYesPosEitherSideBothNoAfter_onclick = True
End Function
Private Function NPArtAndDemArtArtRequiredYesPosEitherSideBothNoAfterPrompt_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosEitherSideBothNoAfter_onclick
	NPArtAndDemArtArtRequiredYesPosEitherSideBothNoAfterPrompt_onclick = True
End Function

Private Function NPArtAndDemArtArtRequiredYesPosEitherSideAllYes_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosEitherSideAllYes.Checked = True
	DisplayHidden
	NPArtAndDemArtArtRequiredYesPosEitherSideAllYes_onclick = True
End Function
Private Function NPArtAndDemArtArtRequiredYesPosEitherSideAllYesPrompt_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosEitherSideAllYes_onclick
	NPArtAndDemArtArtRequiredYesPosEitherSideAllYesPrompt_onclick = True
End Function

Private Function NPArtAndDemArtArtRequiredYesPosEitherSideAllNo_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosEitherSideAllNo.Checked = True
	DisplayHidden
	NPArtAndDemArtArtRequiredYesPosEitherSideAllNo_onclick = True
End Function
Private Function NPArtAndDemArtArtRequiredYesPosEitherSideAllNoPrompt_onclick() As Boolean
	NPArtAndDemArtArtRequiredYesPosEitherSideAllNo_onclick
	NPArtAndDemArtArtRequiredYesPosEitherSideAllNoPrompt_onclick = True
End Function

Private Function NPArtAndDemDem_onclick() As Boolean
	NPArtAndDemDem.Checked = True
	DisplayHidden
	NPArtAndDemDem_onclick = True
End Function
Private Function NPArtAndDemDemPrompt_onclick() As Boolean
	NPArtAndDemDem_onclick
	NPArtAndDemDemPrompt_onclick = True
End Function

Private Function NPArtAndDemDemArtRequiredNo_onclick() As Boolean
	NPArtAndDemDemArtRequiredNo.Checked = True
	DisplayHidden
	NPArtAndDemDemArtRequiredNo_onclick = True
End Function
Private Function NPArtAndDemDemArtRequiredNoPrompt_onclick() As Boolean
	NPArtAndDemDemArtRequiredNo_onclick
	NPArtAndDemDemArtRequiredNoPrompt_onclick = True
End Function

Private Function NPArtAndDemDemArtRequiredNoPosBefore_onclick() As Boolean
	NPArtAndDemDemArtRequiredNoPosBefore.Checked = True
	DisplayHidden
	NPArtAndDemDemArtRequiredNoPosBefore_onclick = True
End Function
Private Function NPArtAndDemDemArtRequiredNoPosBeforePrompt_onclick() As Boolean
	NPArtAndDemDemArtRequiredNoPosBefore_onclick
	NPArtAndDemDemArtRequiredNoPosBeforePrompt_onclick = True
End Function

Private Function NPArtAndDemDemArtRequiredNoPosAfter_onclick() As Boolean
	NPArtAndDemDemArtRequiredNoPosAfter.Checked = True
	DisplayHidden
	NPArtAndDemDemArtRequiredNoPosAfter_onclick = True
End Function
Private Function NPArtAndDemDemArtRequiredNoPosAfterPrompt_onclick() As Boolean
	NPArtAndDemDemArtRequiredNoPosAfter_onclick
	NPArtAndDemDemArtRequiredNoPosAfterPrompt_onclick = True
End Function

Private Function NPArtAndDemDemArtRequiredNoPosEitherSide_onclick() As Boolean
	NPArtAndDemDemArtRequiredNoPosEitherSide.Checked = True
	DisplayHidden
	NPArtAndDemDemArtRequiredNoPosEitherSide_onclick = True
End Function
Private Function NPArtAndDemDemArtRequiredNoPosEitherSidePrompt_onclick() As Boolean
	NPArtAndDemDemArtRequiredNoPosEitherSide_onclick
	NPArtAndDemDemArtRequiredNoPosEitherSidePrompt_onclick = True
End Function

Private Function NPArtAndDemDemArtRequiredNoPosEitherSideAllYes_onclick() As Boolean
	NPArtAndDemDemArtRequiredNoPosEitherSideAllYes.Checked = True
	DisplayHidden
	NPArtAndDemDemArtRequiredNoPosEitherSideAllYes_onclick = True
End Function
Private Function NPArtAndDemDemArtRequiredNoPosEitherSideAllYesPrompt_onclick() As Boolean
	NPArtAndDemDemArtRequiredNoPosEitherSideAllYes_onclick
	NPArtAndDemDemArtRequiredNoPosEitherSideAllYesPrompt_onclick = True
End Function

Private Function NPArtAndDemDemArtRequiredNoPosEitherSideAllNo_onclick() As Boolean
	NPArtAndDemDemArtRequiredNoPosEitherSideAllNo.Checked = True
	DisplayHidden
	NPArtAndDemDemArtRequiredNoPosEitherSideAllNo_onclick = True
End Function
Private Function NPArtAndDemDemArtRequiredNoPosEitherSideAllNoPrompt_onclick() As Boolean
	NPArtAndDemDemArtRequiredNoPosEitherSideAllNo_onclick
	NPArtAndDemDemArtRequiredNoPosEitherSideAllNoPrompt_onclick = True
End Function

Private Function NPArtAndDemDemArtRequiredYes_onclick() As Boolean
	NPArtAndDemDemArtRequiredYes.Checked = True
	DisplayHidden
	NPArtAndDemDemArtRequiredYes_onclick = True
End Function
Private Function NPArtAndDemDemArtRequiredYesPrompt_onclick() As Boolean
	NPArtAndDemDemArtRequiredYes_onclick
	NPArtAndDemDemArtRequiredYesPrompt_onclick = True
End Function

Private Function NPArtAndDemDemArtRequiredYesPosBefore_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosBefore.Checked = True
	DisplayHidden
	NPArtAndDemDemArtRequiredYesPosBefore_onclick = True
End Function
Private Function NPArtAndDemDemArtRequiredYesPosBeforePrompt_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosBefore_onclick
	NPArtAndDemDemArtRequiredYesPosBeforePrompt_onclick = True
End Function

Private Function NPArtAndDemDemArtRequiredYesPosAfter_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosAfter.Checked = True
	DisplayHidden
	NPArtAndDemDemArtRequiredYesPosAfter_onclick = True
End Function
Private Function NPArtAndDemDemArtRequiredYesPosAfterPrompt_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosAfter_onclick
	NPArtAndDemDemArtRequiredYesPosAfterPrompt_onclick = True
End Function

Private Function NPArtAndDemDemArtRequiredYesPosEitherSide_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosEitherSide.Checked = True
	DisplayHidden
	NPArtAndDemDemArtRequiredYesPosEitherSide_onclick = True
End Function
Private Function NPArtAndDemDemArtRequiredYesPosEitherSidePrompt_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosEitherSide_onclick
	NPArtAndDemDemArtRequiredYesPosEitherSidePrompt_onclick = True
End Function

Private Function NPArtAndDemDemArtRequiredYesPosEitherSideBothYes_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosEitherSideBothYes.Checked = True
	DisplayHidden
	NPArtAndDemDemArtRequiredYesPosEitherSideBothYes_onclick = True
End Function
Private Function NPArtAndDemDemArtRequiredYesPosEitherSideBothYesPrompt_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosEitherSideBothYes_onclick
	NPArtAndDemDemArtRequiredYesPosEitherSideBothYesPrompt_onclick = True
End Function

Private Function NPArtAndDemDemArtRequiredYesPosEitherSideBothNoBefore_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosEitherSideBothNoBefore.Checked = True
	DisplayHidden
	NPArtAndDemDemArtRequiredYesPosEitherSideBothNoBefore_onclick = True
End Function
Private Function NPArtAndDemDemArtRequiredYesPosEitherSideBothNoBeforePrompt_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosEitherSideBothNoBefore_onclick
	NPArtAndDemDemArtRequiredYesPosEitherSideBothNoBeforePrompt_onclick = True
End Function

Private Function NPArtAndDemDemArtRequiredYesPosEitherSideBothNoAfter_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosEitherSideBothNoAfter.Checked = True
	DisplayHidden
	NPArtAndDemDemArtRequiredYesPosEitherSideBothNoAfter_onclick = True
End Function
Private Function NPArtAndDemDemArtRequiredYesPosEitherSideBothNoAfterPrompt_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosEitherSideBothNoAfter_onclick
	NPArtAndDemDemArtRequiredYesPosEitherSideBothNoAfterPrompt_onclick = True
End Function

Private Function NPArtAndDemDemArtRequiredYesPosEitherSideAllYes_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosEitherSideAllYes.Checked = True
	DisplayHidden
	NPArtAndDemDemArtRequiredYesPosEitherSideAllYes_onclick = True
End Function
Private Function NPArtAndDemDemArtRequiredYesPosEitherSideAllYesPrompt_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosEitherSideAllYes_onclick
	NPArtAndDemDemArtRequiredYesPosEitherSideAllYesPrompt_onclick = True
End Function

Private Function NPArtAndDemDemArtRequiredYesPosEitherSideAllNo_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosEitherSideAllNo.Checked = True
	DisplayHidden
	NPArtAndDemDemArtRequiredYesPosEitherSideAllNo_onclick = True
End Function
Private Function NPArtAndDemDemArtRequiredYesPosEitherSideAllNoPrompt_onclick() As Boolean
	NPArtAndDemDemArtRequiredYesPosEitherSideAllNo_onclick
	NPArtAndDemDemArtRequiredYesPosEitherSideAllNoPrompt_onclick = True
End Function

Private Function NPArtAndDemBoth_onclick() As Boolean
	NPArtAndDemBoth.Checked = True
	DisplayHidden
	NPArtAndDemBoth_onclick = True
End Function
Private Function NPArtAndDemBothPrompt_onclick() As Boolean
	NPArtAndDemBoth_onclick
	NPArtAndDemBothPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNo_onclick() As Boolean
	NPArtAndDemBothCoOccurNo.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNo_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNo_onclick
	NPArtAndDemBothCoOccurNoPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredNo_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNo.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNo_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNo_onclick
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosBefore_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosBefore.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosBefore_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosBeforePrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosBefore_onclick
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosBeforePrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosAfter_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosAfter.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosAfter_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosAfterPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosAfter_onclick
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosAfterPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSide_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSide.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSide_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSidePrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSide_onclick
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSidePrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllYes_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllYes.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllYes_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllYesPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllYes_onclick
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllYesPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllNo_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllNo.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllNo_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllNoPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllNo_onclick
	NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllNoPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYes_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYes.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYes_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYes_onclick
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosBefore_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosBefore.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosBefore_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosBeforePrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosBefore_onclick
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosBeforePrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosAfter_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosAfter.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosAfter_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosAfterPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosAfter_onclick
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosAfterPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSide_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSide.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSide_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSidePrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSide_onclick
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSidePrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothYes_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothYes.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothYes_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothYesPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothYes_onclick
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothYesPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoBefore_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoBefore.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoBefore_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoBeforePrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoBefore_onclick
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoBeforePrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoAfter_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoAfter.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoAfter_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoAfterPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoAfter_onclick
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoAfterPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllYes_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllYes.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllYes_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllYesPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllYes_onclick
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllYesPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllNo_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllNo.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllNo_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllNoPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllNo_onclick
	NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllNoPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYes_onclick() As Boolean
	NPArtAndDemBothCoOccurYes.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYes_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYes_onclick
	NPArtAndDemBothCoOccurYesPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredNo_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredNo.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredNo_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredNoPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredNo_onclick
	NPArtAndDemBothCoOccurYesRequiredNoPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredYesArt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredYesArt.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredYesArt_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredYesArtPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredYesArt_onclick
	NPArtAndDemBothCoOccurYesRequiredYesArtPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredYesDem_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredYesDem.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredYesDem_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredYesDemPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredYesDem_onclick
	NPArtAndDemBothCoOccurYesRequiredYesDemPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredYesBoth_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredYesBoth.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredYesBoth_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredYesBothPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredYesBoth_onclick
	NPArtAndDemBothCoOccurYesRequiredYesBothPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredPositionArtDemNoun_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionArtDemNoun.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredPositionArtDemNoun_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredPositionArtDemNounPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionArtDemNoun_onclick
	NPArtAndDemBothCoOccurYesRequiredPositionArtDemNounPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredPositionArtBeforeDemAfter_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionArtBeforeDemAfter.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredPositionArtBeforeDemAfter_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredPositionArtBeforeDemAfterPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionArtBeforeDemAfter_onclick
	NPArtAndDemBothCoOccurYesRequiredPositionArtBeforeDemAfterPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredPositionDemArtNoun_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionDemArtNoun.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredPositionDemArtNoun_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredPositionDemArtNounPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionDemArtNoun_onclick
	NPArtAndDemBothCoOccurYesRequiredPositionDemArtNounPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredPositionArtAfterDemBefore_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionArtAfterDemBefore.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredPositionArtAfterDemBefore_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredPositionArtAfterDemBeforePrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionArtAfterDemBefore_onclick
	NPArtAndDemBothCoOccurYesRequiredPositionArtAfterDemBeforePrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredPositionNounArtDem_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionNounArtDem.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredPositionNounArtDem_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredPositionNounArtDemPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionNounArtDem_onclick
	NPArtAndDemBothCoOccurYesRequiredPositionNounArtDemPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredPositionNounDemArt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionNounDemArt.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredPositionNounDemArt_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredPositionNounDemArtPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionNounDemArt_onclick
	NPArtAndDemBothCoOccurYesRequiredPositionNounDemArtPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredPositionArtDemEither_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionArtDemEither.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredPositionArtDemEither_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredPositionArtDemEitherPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionArtDemEither_onclick
	NPArtAndDemBothCoOccurYesRequiredPositionArtDemEitherPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredPositionDemArtEither_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionDemArtEither.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredPositionDemArtEither_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredPositionDemArtEitherPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionDemArtEither_onclick
	NPArtAndDemBothCoOccurYesRequiredPositionDemArtEitherPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredPositionArtDemNounDemArt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionArtDemNounDemArt.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredPositionArtDemNounDemArt_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredPositionArtDemNounDemArtPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionArtDemNounDemArt_onclick
	NPArtAndDemBothCoOccurYesRequiredPositionArtDemNounDemArtPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredPositionDemArtNounArtDem_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionDemArtNounArtDem.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredPositionDemArtNounArtDem_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredPositionDemArtNounArtDemPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionDemArtNounArtDem_onclick
	NPArtAndDemBothCoOccurYesRequiredPositionDemArtNounArtDemPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllYes_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllYes.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllYes_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllYesPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllYes_onclick
	NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllYesPrompt_onclick = True
End Function

Private Function NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllNo_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllNo.Checked = True
	DisplayHidden
	NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllNo_onclick = True
End Function
Private Function NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllNoPrompt_onclick() As Boolean
	NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllNo_onclick
	NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllNoPrompt_onclick = True
End Function

Private Function NPArtPosOK_onclick() As Boolean

	Dim elem As IXMLDOMNode
	Set elem = gxmlDom.selectSingleNode("//np/example")
	'TODO: figure what to do if any of these are missing!
	elem.Text = NPArtPosExample.Value

	Dim attr As IXMLDOMNode
	Dim sTemp As String
	Set attr = gxmlDom.selectSingleNode("//np/@artAndDem")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPArtAndDemNo.Checked) Then sTemp = "no"
	If (NPArtAndDemArt.Checked) Then sTemp = "article"
	If (NPArtAndDemDem.Checked) Then sTemp = "demonstrative"
	If (NPArtAndDemBoth.Checked) Then sTemp = "both"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artArtRequired")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPArtAndDemArtArtRequiredNo.Checked) Then sTemp = "no"
	If (NPArtAndDemArtArtRequiredYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artArtPos1")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (NPArtAndDemArtArtRequiredNoPosBefore.Checked) Then sTemp = "before"
	If (NPArtAndDemArtArtRequiredNoPosAfter.Checked) Then sTemp = "after"
	If (NPArtAndDemArtArtRequiredNoPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artArtEither1")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPArtAndDemArtArtRequiredNoPosEitherSideAllYes.Checked) Then sTemp = "yes"
	If (NPArtAndDemArtArtRequiredNoPosEitherSideAllNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artArtPos2")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (NPArtAndDemArtArtRequiredYesPosBefore.Checked) Then sTemp = "before"
	If (NPArtAndDemArtArtRequiredYesPosAfter.Checked) Then sTemp = "after"
	If (NPArtAndDemArtArtRequiredYesPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artArtRequiredBoth")
	'TODO: figure what to do if any of these are missing!
	sTemp = "yes" ' default if all else fails...
	If (NPArtAndDemArtArtRequiredYesPosEitherSideBothYes.Checked) Then sTemp = "yes"
	If (NPArtAndDemArtArtRequiredYesPosEitherSideBothNoBefore.Checked) Then sTemp = "noBefore"
	If (NPArtAndDemArtArtRequiredYesPosEitherSideBothNoAfter.Checked) Then sTemp = "noAfter"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artArtEither2")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPArtAndDemArtArtRequiredYesPosEitherSideAllYes.Checked) Then sTemp = "yes"
	If (NPArtAndDemArtArtRequiredYesPosEitherSideAllNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artDemRequired")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPArtAndDemDemArtRequiredNo.Checked) Then sTemp = "no"
	If (NPArtAndDemDemArtRequiredYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artDemPos1")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (NPArtAndDemDemArtRequiredNoPosBefore.Checked) Then sTemp = "before"
	If (NPArtAndDemDemArtRequiredNoPosAfter.Checked) Then sTemp = "after"
	If (NPArtAndDemDemArtRequiredNoPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artDemEither1")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPArtAndDemDemArtRequiredNoPosEitherSideAllYes.Checked) Then sTemp = "yes"
	If (NPArtAndDemDemArtRequiredNoPosEitherSideAllNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artDemPos2")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (NPArtAndDemDemArtRequiredYesPosBefore.Checked) Then sTemp = "before"
	If (NPArtAndDemDemArtRequiredYesPosAfter.Checked) Then sTemp = "after"
	If (NPArtAndDemDemArtRequiredYesPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artDemRequiredBoth")
	'TODO: figure what to do if any of these are missing!
	sTemp = "yes" ' default if all else fails...
	If (NPArtAndDemDemArtRequiredYesPosEitherSideBothYes.Checked) Then sTemp = "yes"
	If (NPArtAndDemDemArtRequiredYesPosEitherSideBothNoBefore.Checked) Then sTemp = "noBefore"
	If (NPArtAndDemDemArtRequiredYesPosEitherSideBothNoAfter.Checked) Then sTemp = "noafter"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artDemEither2")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPArtAndDemDemArtRequiredYesPosEitherSideAllYes.Checked) Then sTemp = "yes"
	If (NPArtAndDemDemArtRequiredYesPosEitherSideAllNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artBothCooccur")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPArtAndDemBothCoOccurNo.Checked) Then sTemp = "no"
	If (NPArtAndDemBothCoOccurYes.Checked) Then sTemp = "yes"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artBothRequired1")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPArtAndDemBothCoOccurNoArtOrDemRequiredNo.Checked) Then sTemp = "no"
	If (NPArtAndDemBothCoOccurNoArtOrDemRequiredYes.Checked) Then sTemp = "yesOne"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artBothPos1")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosBefore.Checked) Then sTemp = "before"
	If (NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosAfter.Checked) Then sTemp = "after"
	If (NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artBothEither1")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllYes.Checked) Then sTemp = "yes"
	If (NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artBothPos2")
	'TODO: figure what to do if any of these are missing!
	sTemp = "unknown" ' default if all else fails...
	If (NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosBefore.Checked) Then sTemp = "before"
	If (NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosAfter.Checked) Then sTemp = "after"
	If (NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSide.Checked) Then sTemp = "either"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artBothRequiredBoth")
	'TODO: figure what to do if any of these are missing!
	sTemp = "yes" ' default if all else fails...
	If (NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothYes.Checked) Then sTemp = "yes"
	If (NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoBefore.Checked) Then sTemp = "noBefore"
	If (NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideBothNoAfter.Checked) Then sTemp = "noAfter"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artBothEither2")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllYes.Checked) Then sTemp = "yes"
	If (NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artBothRequired2")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPArtAndDemBothCoOccurYesRequiredNo.Checked) Then sTemp = "no"
	If (NPArtAndDemBothCoOccurYesRequiredYesArt.Checked) Then sTemp = "yesArt"
	If (NPArtAndDemBothCoOccurYesRequiredYesDem.Checked) Then sTemp = "yesDem"
	If (NPArtAndDemBothCoOccurYesRequiredYesBoth.Checked) Then sTemp = "yesBoth"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artBothBothPos")
	'TODO: figure what to do if any of these are missing!
	sTemp = "artDemNoun" ' default if all else fails...
	If (NPArtAndDemBothCoOccurYesRequiredPositionArtDemNoun.Checked) Then sTemp = "artDemNoun"
	If (NPArtAndDemBothCoOccurYesRequiredPositionArtBeforeDemAfter.Checked) Then sTemp = "artNounDem"
	If (NPArtAndDemBothCoOccurYesRequiredPositionDemArtNoun.Checked) Then sTemp = "demArtNoun"
	If (NPArtAndDemBothCoOccurYesRequiredPositionArtAfterDemBefore.Checked) Then sTemp = "demNounArt"
	If (NPArtAndDemBothCoOccurYesRequiredPositionNounArtDem.Checked) Then sTemp = "nounArtDem"
	If (NPArtAndDemBothCoOccurYesRequiredPositionNounDemArt.Checked) Then sTemp = "nounDemArt"
	If (NPArtAndDemBothCoOccurYesRequiredPositionArtDemEither.Checked) Then sTemp = "artDemEither"
	If (NPArtAndDemBothCoOccurYesRequiredPositionDemArtEither.Checked) Then sTemp = "demArtEither"
	If (NPArtAndDemBothCoOccurYesRequiredPositionArtDemNounDemArt.Checked) Then sTemp = "artDemNounDemArt"
	If (NPArtAndDemBothCoOccurYesRequiredPositionDemArtNounArtDem.Checked) Then sTemp = "demArtNounArtDem"
	attr.Text = sTemp

	Set attr = gxmlDom.selectSingleNode("//np/@artBothEither3")
	'TODO: figure what to do if any of these are missing!
	sTemp = "no" ' default if all else fails...
	If (NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllYes.Checked) Then sTemp = "yes"
	If (NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllNo.Checked) Then sTemp = "no"
	attr.Text = sTemp

	gbDirty = True  ' mark it as having changed

	NPArtPosOK_onclick = True

	BaseWindow.navigate "NPContents.htm"
End Function

Private Function NPArtPosCancel_onclick() As Boolean
	NPArtPosCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function

Private Sub DisplayHidden()
	NPEitherSideNoInstruction.Style.display = "none" ' assume they won't show
	NPArtEitherSideNoInstruction.Style.display = "none"
	NPDemEitherSideNoInstruction.Style.display = "none"
	NPBothEitherSideNoInstruction.Style.display = "none"
	If (NPArtAndDemNo.Checked) Then ' neither
		NPArtAndDemArtTable.Style.display = "none"
		NPArtAndDemDemTable.Style.display = "none"
		NPArtAndDemBothTable.Style.display = "none"
	ElseIf (NPArtAndDemArt.Checked) Then  ' articles only
		NPArtAndDemArtTable.Style.display = ""
		NPArtAndDemDemTable.Style.display = "none"
		NPArtAndDemBothTable.Style.display = "none"
		If (NPArtAndDemArtArtRequiredNo.Checked) Then
			NPArtAndDemArtArtRequiredNoTable.Style.display = ""
			NPArtAndDemArtArtRequiredYesTable.Style.display = "none"
			If (NPArtAndDemArtArtRequiredNoPosEitherSide.Checked) Then
				NPArtAndDemArtArtRequiredNoPosEitherSideTable.Style.display = ""
				If (NPArtAndDemArtArtRequiredNoPosEitherSideAllNo.Checked) Then
					NPEitherSideNoInstruction.Style.display = ""
					NPArtEitherSideNoInstruction.Style.display = ""
					NPDemEitherSideNoInstruction.Style.display = "none"
					NPBothEitherSideNoInstruction.Style.display = "none"
				End If
			Else
				NPArtAndDemArtArtRequiredNoPosEitherSideTable.Style.display = "none"
			End If
		Else
			NPArtAndDemArtArtRequiredNoTable.Style.display = "none"
			NPArtAndDemArtArtRequiredYesTable.Style.display = ""
			If (NPArtAndDemArtArtRequiredYesPosEitherSide.Checked) Then
				NPArtAndDemArtArtRequiredYesPosEitherSideTable.Style.display = ""
				NPArtAndDemArtArtRequiredYesPosEitherSideAllTable.Style.display = ""
				If (NPArtAndDemArtArtRequiredYesPosEitherSideAllNo.Checked) Then
					NPEitherSideNoInstruction.Style.display = ""
					NPArtEitherSideNoInstruction.Style.display = ""
					NPDemEitherSideNoInstruction.Style.display = "none"
					NPBothEitherSideNoInstruction.Style.display = "none"
				End If
			Else
				NPArtAndDemArtArtRequiredYesPosEitherSideTable.Style.display = "none"
				NPArtAndDemArtArtRequiredYesPosEitherSideAllTable.Style.display = "none"
			End If
		End If
	ElseIf (NPArtAndDemDem.Checked) Then ' demonstratives only
		NPArtAndDemArtTable.Style.display = "none"
		NPArtAndDemDemTable.Style.display = ""
		NPArtAndDemBothTable.Style.display = "none"
		If (NPArtAndDemDemArtRequiredNo.Checked) Then
			NPArtAndDemDemArtRequiredNoTable.Style.display = ""
			NPArtAndDemDemArtRequiredYesTable.Style.display = "none"
			If (NPArtAndDemDemArtRequiredNoPosEitherSide.Checked) Then
				NPArtAndDemDemArtRequiredNoPosEitherSideTable.Style.display = ""
				If (NPArtAndDemDemArtRequiredNoPosEitherSideAllNo.Checked) Then
					NPEitherSideNoInstruction.Style.display = ""
					NPArtEitherSideNoInstruction.Style.display = "none"
					NPDemEitherSideNoInstruction.Style.display = ""
					NPBothEitherSideNoInstruction.Style.display = "none"
				End If
			Else
				NPArtAndDemDemArtRequiredNoPosEitherSideTable.Style.display = "none"
			End If
		Else
			NPArtAndDemDemArtRequiredNoTable.Style.display = "none"
			NPArtAndDemDemArtRequiredYesTable.Style.display = ""
			If (NPArtAndDemDemArtRequiredYesPosEitherSide.Checked) Then
				NPArtAndDemDemArtRequiredYesPosEitherSideTable.Style.display = ""
				NPArtAndDemDemArtRequiredYesPosEitherSideAllTable.Style.display = ""
				If (NPArtAndDemDemArtRequiredYesPosEitherSideAllNo.Checked) Then
					NPEitherSideNoInstruction.Style.display = ""
					NPArtEitherSideNoInstruction.Style.display = "none"
					NPDemEitherSideNoInstruction.Style.display = ""
					NPBothEitherSideNoInstruction.Style.display = "none"
				End If
			Else
				NPArtAndDemDemArtRequiredYesPosEitherSideTable.Style.display = "none"
				NPArtAndDemDemArtRequiredYesPosEitherSideAllTable.Style.display = "none"
			End If
		End If
	Else  ' both
		NPArtAndDemArtTable.Style.display = "none"
		NPArtAndDemDemTable.Style.display = "none"
		NPArtAndDemBothTable.Style.display = ""
		If (NPArtAndDemBothCoOccurNo.Checked) Then
			NPArtAndDemBothCoOccurNoTable.Style.display = ""
			NPArtAndDemBothCoOccurYesTable.Style.display = "none"
			If (NPArtAndDemBothCoOccurNoArtOrDemRequiredNo.Checked) Then
				NPArtAndDemBothCoOccurNoArtOrDemRequiredNoTable.Style.display = ""
				NPArtAndDemBothCoOccurNoArtOrDemRequiredYesTable.Style.display = "none"
				If (NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSide.Checked) Then
					NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideTable.Style.display = ""
					If (NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideAllNo.Checked) Then
						NPEitherSideNoInstruction.Style.display = ""
						NPArtEitherSideNoInstruction.Style.display = "none"
						NPDemEitherSideNoInstruction.Style.display = "none"
						NPBothEitherSideNoInstruction.Style.display = ""
					End If
				Else
					NPArtAndDemBothCoOccurNoArtOrDemRequiredNoPosEitherSideTable.Style.display = "none"
				End If
			Else
				NPArtAndDemBothCoOccurNoArtOrDemRequiredNoTable.Style.display = "none"
				NPArtAndDemBothCoOccurNoArtOrDemRequiredYesTable.Style.display = ""
				If (NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSide.Checked) Then
					NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideTable.Style.display = ""
					NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllTable.Style.display = ""
					If (NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllNo.Checked) Then
						NPEitherSideNoInstruction.Style.display = ""
						NPArtEitherSideNoInstruction.Style.display = "none"
						NPDemEitherSideNoInstruction.Style.display = "none"
						NPBothEitherSideNoInstruction.Style.display = ""
					End If
				Else
					NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideTable.Style.display = "none"
					NPArtAndDemBothCoOccurNoArtOrDemRequiredYesPosEitherSideAllTable.Style.display = "none"
				End If
			End If
		Else
			NPArtAndDemBothCoOccurNoTable.Style.display = "none"
			NPArtAndDemBothCoOccurYesTable.Style.display = ""
			NPArtAndDemBothCoOccurYesRequiredPositionTable.Style.display = ""
			If (NPArtAndDemBothCoOccurYesRequiredPositionArtDemEither.Checked Or _
				NPArtAndDemBothCoOccurYesRequiredPositionDemArtEither.Checked Or _
				NPArtAndDemBothCoOccurYesRequiredPositionArtDemNounDemArt.Checked Or _
				NPArtAndDemBothCoOccurYesRequiredPositionDemArtNounArtDem.Checked) Then
					NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllTable.Style.display = ""
					If (NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllNo.Checked) Then
						NPEitherSideNoInstruction.Style.display = ""
						NPArtEitherSideNoInstruction.Style.display = "none"
						NPDemEitherSideNoInstruction.Style.display = "none"
						NPBothEitherSideNoInstruction.Style.display = ""
					End If
				Else
					NPArtAndDemBothCoOccurYesRequiredPositionEitherSideAllTable.Style.display = "none"
				End If

		End If
	End If

End Sub
