Attribute VB_Name = "PAWSModule"
Option Explicit
	'XML DOM objects
Public gxmlDom As DOMDocument30 ' XML Document Object Model, holding the contents of the xml answer file
Public gxsltExampleDom As DOMDocument30 ' Example XSLT DOM
Public gxsltGrammarDom As DOMDocument30 ' Grammar XSLT DOM
Public gtrTransformer As XSLTemplate30 ' Transformer
Public gprcProcessor As IXSLProcessor ' Processor
Public gtrExampleTransformer As XSLTemplate30 ' Example files Transformer
Public gprcExampleProcessor As IXSLProcessor ' Example files Processor
Public gtrGrammarTransformer As XSLTemplate30 ' Grammar Transformer
Public gprcGrammarProcessor As IXSLProcessor ' Grammar files Processor
	'XML answer file globals
Public gsAnswerFileName As String ' full path name of the xml answer file
Public gsAnswerFilePath As String ' just the path portion of the xml answer file
Public gbDirty As Boolean ' has the file changed?
Public gsLangName As String ' name of the language being processed
Public gsLangAbbr As String ' abbreviation of the language being processed
Public gsTextSFM As String ' SFM code to use for text fields in examples

Public Enum geSpecPos
	iInitial = 1
	iInternal = 2
	iFinal = 3
	IUnknown = 4
End Enum
Public Enum geHeadPos
	iInitial = 1
	iFinal = 2
End Enum


Public Function GetSpecifierPos()
	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//typology/@wordOrder")
	If (attr.baseName = "") Then
		'TODO: figure out how to add one!
		GetSpecifierPos = geSpecPos.iInitial
	Else
		If (attr.Text = "SVO" Or attr.Text = "SOV") Then
			GetSpecifierPos = geSpecPos.iInitial
		ElseIf (attr.Text = "VSO" Or attr.Text = "OSV") Then
			GetSpecifierPos = geSpecPos.iInternal
		Else
			GetSpecifierPos = geSpecPos.iFinal
		End If
	End If
End Function
Public Function GetHeadPos()
	Dim attr As IXMLDOMNode
	Set attr = gxmlDom.selectSingleNode("//typology/@wordOrder")
	If (attr.baseName = "") Then
		'TODO: figure out how to add one!
		GetHeadPos = geHeadPos.iInitial
	Else
		If (attr.Text = "SVO" Or attr.Text = "VSO" Or attr.Text = "VOS") Then
			GetHeadPos = geHeadPos.iInitial
		Else
			GetHeadPos = geHeadPos.iFinal
		End If
	End If
End Function

Public Sub gXmlLoadError(ByRef xmlDom As DOMDocument30)
	' create the error message
	Dim sErrMsg
	sErrMsg = "Invalid XML file!" & vbCrLf _
			& "File URL:      " & xmlDom.parseError.url & vbCrLf _
			& "Line No.:      " & xmlDom.parseError.Line & vbCrLf _
			& "Character:     " & xmlDom.parseError.linepos & vbCrLf _
			& "File Position: " & xmlDom.parseError.filepos & vbCrLf _
			& "Source Text:   " & xmlDom.parseError.srcText & vbCrLf _
			& "Error Code:    " & xmlDom.parseError.errorCode & vbCrLf _
			& "Description:   " & xmlDom.parseError.reason & vbCrLf & vbCrLf _
			& "Contact a PAWS Consultant for help!"
	MsgBox sErrMsg, vbCritical ' display error message
End Sub

Public Function gGetPositionBasedOnSpecifier(sAttr As String)
	Dim eSpecPos As geSpecPos
	If (sAttr = "unknown") Then
		' set default
		eSpecPos = GetSpecifierPos()
		If (eSpecPos = geSpecPos.iInitial Or eSpecPos = geSpecPos.iInternal) Then
			gGetPositionBasedOnSpecifier = "before"
		Else
			gGetPositionBasedOnSpecifier = "after"
		End If
	Else
		gGetPositionBasedOnSpecifier = sAttr
	End If
End Function
Public Function gGetPositionBasedOnHead(sAttr As String, Optional bSame As Boolean = True)
	Dim eHeadPos As geHeadPos
	If (sAttr = "unknown") Then
		' set default
		eHeadPos = GetHeadPos()
		If (eHeadPos = geHeadPos.iInitial) Then
			If (bSame) Then
				gGetPositionBasedOnHead = "before"
			Else
				gGetPositionBasedOnHead = "after"
			End If
		Else
			If (bSame) Then
				gGetPositionBasedOnHead = "after"
			Else
				gGetPositionBasedOnHead = "before"
			End If
		End If
	Else
		gGetPositionBasedOnHead = sAttr
	End If
End Function
