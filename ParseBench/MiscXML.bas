Attribute VB_Name = "MiscXML"
Option Explicit
 Public Sub setXMLNodeAttribute(xDoc As msxml2.DOMDocument30, nNode As IXMLDOMNode, sAttr As String, sValue As String)
	' not needed nNode.Attributes.removeNamedItem (sAttr) ' we don't care if this fails
	Dim a As msxml2.IXMLDOMNode
	Set a = xDoc.createAttribute(sAttr)
	a.Text = sValue
	nNode.Attributes.setNamedItem a
End Sub
Public Function getOrMakeXMLNode(WFIDOM As msxml2.DOMDocument30, nParentNode As IXMLDOMNode, sTag As String) As IXMLDOMNode
   Dim n As IXMLDOMNode
   Set n = nParentNode.selectSingleNode(sTag)
	If n Is Nothing Then
		Set n = WFIDOM.createElement(sTag)
		Call nParentNode.appendChild(n)
	End If
	Set getOrMakeXMLNode = n
End Function
Public Function getXMLNodeAttribute(nNode As IXMLDOMNode, sAttr As String) As String
	Dim a As msxml2.IXMLDOMNode
	Set a = nNode.Attributes.getNamedItem(sAttr)
	If a Is Nothing Then
		getXMLNodeAttribute = ""
	Else
		getXMLNodeAttribute = a.Text
	End If
End Function

' this attribute, "pos", is used to efficiently select a word without having to to a search with XSL,
'which is slow when the word form inventory gets large.
' there is a position() function in xsl, but I have only been able to get it to give me the position
' with in the <xsl:for-each> statement, not its position in the document being transformed.

Public Sub SetAllWordPositionAttrs(xWFIDOM As msxml2.DOMDocument30, stat As StatusBar)
	stat.SimpleText = "Setting word positions..."

	Dim words As IXMLDOMNodeList
	Set words = xWFIDOM.selectNodes("wfi/wfic")
	Dim w As IXMLDOMNode
	Dim nCount As Long
	nCount = 0
	For Each w In words
		nCount = nCount + 1
		setXMLNodeAttribute xWFIDOM, w, "pos", Trim(Str(nCount))
	Next w
End Sub

' this will sort the wordforms by frequency and then replace the wfi in the project with the assorted version
Public Sub SortWFIByFreq(proj As PBProject, stat As StatusBar)

  stat.SimpleText = "Sorting..."

  Dim xWFIDOM As msxml2.DOMDocument30
   Set xWFIDOM = proj.WFIDOM

	'load in the style sheet which makes a table
	Dim styleSheet As New msxml2.FreeThreadedDOMDocument30 ' DOMDocument30

	styleSheet.async = False
	styleSheet.Load App.Path + "\pb-xsl\freqsort.xsl"
	 If styleSheet.parseError.errorCode <> 0 Then
		MsgBox styleSheet.parseError.reason
		Exit Sub
	End If

	'create an XSL processor

	Dim t As New msxml2.XSLTemplate30
	Set t.styleSheet = styleSheet
	Dim xslproc ' as ???
	 Set xslproc = t.createProcessor
	xslproc.input = xWFIDOM
	Dim newwfi As New msxml2.DOMDocument30
	xslproc.output = newwfi

	' process the wfi
	xslproc.Transform

	Set proj.WFIDOM = Nothing
	Set proj.WFIDOM = newwfi
End Sub
