VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PBDisplayOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private m_sStyleSheetContents As String
'Public GenericFontName As String
'Public GenericFontSize As String
'Public MorphnameFontName As String

Public LanguageFontName As String

Public Sub populateDisplayNode(WFIDOM As MSXML2.DOMDocument30, n As IXMLDOMNode)
'    Dim nFont As IXMLDOMNode
 '   Set nFont = getOrMakeXMLNode(WFIDOM, n, "font")
  '
   ' setXMLNodeAttribute WFIDOM, nFont, "style", "generic"
   ' setXMLNodeAttribute WFIDOM, nFont, "font", GenericFontName
	'setXMLNodeAttribute WFIDOM, nFont, "size", GenericFontSize

	 Dim nStyles As IXMLDOMNode
	Set nStyles = getOrMakeXMLNode(WFIDOM, n, "styles")
	nStyles.Text = m_sStyleSheetContents

End Sub

Public Sub WriteToFile(f As TextStream)
	f.WriteLine "<display>"
	f.WriteLine "<styles> " + vbCrLf + m_sStyleSheetContents + vbCrLf + " </styles>"
  '  f.WriteLine "  <font style='generic' font='" + GenericFontName + "' size='" + GenericFontSize + "' />"
   ' f.WriteLine "  <font style='morphname' font='arial' size='12' />"
	'f.WriteLine "  <font style='language' font='arial' size='12' />"
	f.WriteLine "</display>"
End Sub

Public Sub ReadDisplayNode(n As IXMLDOMNode)
'    Dim nFonts As IXMLDOMNodeList
 '   Dim nFont As IXMLDOMNode
  '  Set nFont = n.selectSingleNode("font[@style='generic']")
   ' If Not nFont Is Nothing Then
	'    GenericFontName = getXMLNodeAttribute(nFont, "font")
	 '   GenericFontSize = getXMLNodeAttribute(nFont, "size")
	  '    End If

	Dim nStyles As IXMLDOMNode
	Set nStyles = n.selectSingleNode("styles")
	If Not nStyles Is Nothing Then
	  m_sStyleSheetContents = nStyles.Text
	End If
End Sub

Private Sub Class_Initialize()
	'GenericFontName = "Times"
	'GenericFontSize = 18

	' if and when we load a wfi, this will be overridden by the <styles> tag

   ' m_sStyleSheetContents = "span.morphname {color: blue} span.allomorph {color:red; font:times} span.category {color: dardRed}"
	loadDefaults

End Sub

Public Sub writeStyleSheet(sPath As String)
	Dim fs As New FileSystemObject
	Dim f As TextStream
	Set f = fs.CreateTextFile(sPath)
	f.WriteLine m_sStyleSheetContents
	f.Close
End Sub
Public Sub loadDefaults()
	Dim fs As New FileSystemObject
	Dim f As TextStream
	Set f = fs.OpenTextFile(App.Path + "\pb-html\newProjectStyles.css")
	m_sStyleSheetContents = f.ReadAll
	f.Close
End Sub
