Attribute VB_Name = "WFIUserInterface"
Public Sub ShowBadFilterMessage(f As Filter)
	Dim s As String
	s = "It appears that there is a problem with this filter." + vbCrLf + "Filter: " + f.Label + vbCrLf
	s = s + "Query: " + f.XPathString + vbCrLf
	s = s + "Number: " + Str(Err.Number) + vbCrLf + "Description: " + Err.Description

	MsgBox s, vbExclamation
End Sub
Public Sub ShowXSLErrorMessage(styleSheet As MSXML2.FreeThreadedDOMDocument30)
	Dim s As String
   With styleSheet.parseError
   s = "It appears that there is a problem with the ParseBench xsl sheet." + vbCrLf
   s = s + "This may be a problem between your version of IE or xmlParser and this version of Parsebench." + vbCrLf
	s = s + "URL: " + .URL + vbCrLf
  s = s + "Line: " + Str(styleSheet.parseError.Line) + vbCrLf
  s = s + "Position: " + Str(styleSheet.parseError.linepos) + vbCrLf
  s = s + "SourceText: " + styleSheet.parseError.srcText + vbCrLf
   s = s + "Error: " + styleSheet.parseError.reason

	MsgBox s, vbExclamation
	End With
End Sub
Public Sub ShowUnknownError(s As String, e As ErrObject)
	MsgBox s + vbCrLf + "Number: " + Str(e.Number) + vbCrLf + "Description: " + e.Description, vbExclamation
End Sub
Public Function writeStatsPage(proj As PBProject, fFilter As Filter)
   Dim xWFIDOM As MSXML2.DOMDocument30
   Set xWFIDOM = proj.WFIDOM

	Dim varFilter As Variant ' this function requires a variant, not just a string
	varFilter = fFilter.XPathString

	'load in the style sheet which makes a table
	Dim styleSheet As New MSXML2.FreeThreadedDOMDocument30 ' DOMDocument30
	'styleSheet.async = False
	styleSheet.Load App.Path + "\pb-xsl\statsview.xsl"
	 If styleSheet.parseError.errorCode <> 0 Then
		ShowXSLErrorMessage styleSheet
		writeStatsPage = ""
		Exit Function
	End If

	' set the base for hyperlink references within the document, like images
	Dim eBase  As MSXML2.IXMLDOMNode
   Set eBase = styleSheet.selectSingleNode(".//*[@id='headBase']")
	eBase.Attributes.getNamedItem("href").Text = App.Path + "/pb-html/"
	Set eBase = Nothing

	'modify the styleSheet to use our filter string.
	' note that the parameter mechanism did not allow us to replace the string, only the value on the right side of an =

   Dim z  As MSXML2.IXMLDOMNode
   'Set z = styleSheet.selectSingleNode(".//*[@name='selectWords']")
   Set z = styleSheet.selectSingleNode(".//xsl:for-each[@select='wfi/wfic']")

   Dim nSel As MSXML2.IXMLDOMNode
   Set nSel = z.Attributes.getNamedItem("select")
   nSel.Text = fFilter.XPathString

	'create an XSL processor

	Dim t As New MSXML2.XSLTemplate30
	On Error GoTo errorInStyleSheet
	Set t.styleSheet = styleSheet
	On Error GoTo 0



	Set xslproc = t.createProcessor
	xslproc.input = xWFIDOM
	xslproc.Transform
	sOutput = xslproc.output

	Dim fs As New FileSystemObject

	Dim tempFolder As Scripting.Folder
	Set tempFolder = fs.GetSpecialFolder(2) 'temp directory

	Dim sOutputPath As String
	sOutputPath = tempFolder.Path + "\pb-statsView.htm"
	Dim f As TextStream
	Set f = fs.CreateTextFile(sOutputPath)

	' this first styleSheet contains the defaults
   f.WriteLine "<link rel=""stylesheet"" type=""text/css"" href=""" + App.Path + "\pb-html\parseBench.css"">"
   ' the second styleSheet will override the first one, and can be customized for each project.
   f.WriteLine "<link rel=""stylesheet"" type=""text/css"" href=""" + proj.styleSheetPath + """>"

   f.WriteLine "<head> " + sHeaderMessage + "</head>"
	f.Write sOutput

	f.Close

	writeStatsPage = sOutputPath

		Exit Function
errorInStyleSheet:
	If Err.Number = -2147467259 Then
		ShowBadFilterMessage fFilter
	Else
		ShowUnknownError "While loading the xsl stylesheet, got this error:", Err
	End If
End Function

Public Function writeListPage(proj As PBProject, fFilter As Filter, wordListTable As HTMLListTable, ByRef nTotalWords As Long, ByRef bOutListTruncated As Boolean)

	Dim xWFIDOM As MSXML2.DOMDocument30
   Set xWFIDOM = proj.WFIDOM

   ' select the words which will be included in the list
   Dim wficNodes As IXMLDOMNodeList
	Dim varFilter As Variant ' this function requires a variant, not just a string
	varFilter = fFilter.XPathString
	On Error GoTo badFilter
	Set wficNodes = xWFIDOM.selectNodes(varFilter)
	nTotalWords = wficNodes.length
	Set wficNodes = Nothing ' not used past this point
	If nTotalWords > nLastPos Then 'nMaxWords Then
		bOutListTruncated = True
		'nMaxWords = nTotalWords
	   ' Dim sTooBig As String
	  '  sTooBig = "<h2> The filter you have selected came up with " + Str(nTotalWords) + " words. They will not be shown, because it would take too long to draw a table that big.</h2>"
	  '  sTooBig = sTooBig + "<h2>Please select another filter in the area to the left.</h2>"
	  '  writeListPage = writeStatsPage(proj, fFilter.XPathString, sTooBig)
	  '  Exit Function
   Else
	bOutListTruncated = False
   End If

	'load in the style sheet which makes a table
	Dim styleSheet As New MSXML2.FreeThreadedDOMDocument30 ' DOMDocument30


	'styleSheet.async = False
	styleSheet.Load App.Path + "\pb-xsl\listview.xsl"
	 If styleSheet.parseError.errorCode <> 0 Then
		 ShowXSLErrorMessage styleSheet
	End If

	'modify the styleSheet to use our filter string.
	' note that the parameter mechanism did not allow us to replace the string, only the value on the right side of an =

   Dim z  As MSXML2.IXMLDOMNode
   'Set z = styleSheet.selectSingleNode(".//*[@id='selectWords']")
   Set z = styleSheet.selectSingleNode(".//xsl:for-each[@select='wfi/wfic']")
  ' Set z = styleSheet.selectSingleNode(".//xsl:for-each")
	setXMLNodeAttribute styleSheet, z, "select", fFilter.XPathString

	' modify the styleSheet to select the proper range of words in case the list is too long
'    Set z = styleSheet.selectSingleNode(".//*[@id='rangeSelectTest']")
	Set z = styleSheet.selectSingleNode(".//xsl:if")
   setXMLNodeAttribute styleSheet, z, "test", "user:doInclude(" + Str(fFilter.FirstWordNumber) + ", " + Str(fFilter.LastWordNumber) + ")"
	 'modify the styleSheet to use sort field

   If wordListTable.sortField1 <> "" Then
	Set z = styleSheet.selectSingleNode(".//xsl:sort")
'    Set z = styleSheet.selectSingleNode(".//*[@id='sortField1']")
	z.Attributes.getNamedItem("select").Text = wordListTable.sortField1
	If wordListTable.sortField1 = "@form" Then
		z.Attributes.getNamedItem("data-type").Text = "text"
	Else
		z.Attributes.getNamedItem("data-type").Text = "number"
	End If

	' now set the direction
	If wordListTable.bAscending Then
		z.Attributes.getNamedItem("order").Text = "ascending"
	Else
		z.Attributes.getNamedItem("order").Text = "descending"
	End If

  End If

	'create an XSL processor

	Dim t As New MSXML2.XSLTemplate30
	Set t.styleSheet = styleSheet

	 Set xslproc = t.createProcessor
	xslproc.input = xWFIDOM
	xslproc.Transform
	sOutput = xslproc.output

	Dim fs As New FileSystemObject

	Dim tempFolder As Scripting.Folder
	Set tempFolder = fs.GetSpecialFolder(2) 'temp directory

	Dim sOutputPath As String
	sOutputPath = tempFolder.Path + "\listView.htm"
	Dim f As TextStream
	Set f = fs.CreateTextFile(sOutputPath)

	' this first styleSheet contains the defaults
   f.WriteLine "<link rel=""stylesheet"" type=""text/css"" href=""" + App.Path + "\pb-html\parseBench.css"">"
   ' the second styleSheet will override the first one, and can be customized for each project.
   f.WriteLine "<link rel=""stylesheet"" type=""text/css"" href=""" + proj.styleSheetPath + """>"

	f.Write sOutput

   'f.WriteLine ("<htm><body><XML SRC=""" + sWFI + """></XML></body></htm>")

	f.Close

	writeListPage = sOutputPath

	Exit Function
badFilter:
	ShowBadFilterMessage fFilter
End Function
Public Function writeWordPage(proj As PBProject, nWordPosition As Long)

   Dim xWFIDOM As MSXML2.DOMDocument30
   Set xWFIDOM = proj.WFIDOM

	'load in the style sheet which makes a table
	Dim styleSheet As New MSXML2.FreeThreadedDOMDocument30 ' DOMDocument30


	'styleSheet.async = False
	styleSheet.Load App.Path + "\pb-xsl\wordView2.xsl"
	 If styleSheet.parseError.errorCode <> 0 Then
		ShowXSLErrorMessage styleSheet
		writeWordPage = ""
		Exit Function
	End If

  '!!  Remember, <wfic>s are not the only note under <wfi>. We also have <language> and such.
' ideally, there would be a <words> or <wfics> node, but this would break Bob Conrad,
' so we need to wait until we can get at his data to make that change.

   ' Dim nWFIRoot As MSXML2.IXMLDOMNode
	'Set nWFIRoot = xWFIDOM.selectSingleNode("wfi")
	Dim nwfics As IXMLDOMNodeList
	Set nwfics = xWFIDOM.selectNodes("wfi/wfic")
	Dim nWord As IXMLDOMNode
	Set nWord = nwfics.Item(nWordPosition - 1)

	If nWord Is Nothing Then
		MsgBox " there was an error: there was no word in position " + Str(nWordPosition - 1) + " (zero-based)."
		writeWordPage = ""
		Exit Function
	End If

	' set the base for hyperlink references within the document, like images
   Dim eBase  As MSXML2.IXMLDOMNode
   Set eBase = styleSheet.selectSingleNode(".//*[@id='headBase']")
	eBase.Attributes.getNamedItem("href").Text = App.Path + "/pb-html/"
	Set eBase = Nothing


	'create an XSL processor

	Dim t As New MSXML2.XSLTemplate30
	Set t.styleSheet = styleSheet

	Set xslproc = t.createProcessor
   ' Dim varWordID As Variant 'get around a bug in the xslProc library which should accept a string, but does not
  '  varWordID = sWordID
 '   xslProc.addParameter "wordID", varWordID
	' to do: somehow handed this function the proper note, so that the XSL processor
	'   does not have to search to a huge DOM to find a word.  This is very slow!
	xslproc.input = nWord   'xWFIDOM
	xslproc.Transform
	sOutput = xslproc.output

	Dim fs As New FileSystemObject
	Dim tempFolder As Scripting.Folder
	Set tempFolder = fs.GetSpecialFolder(2) 'temp directory
	sOutputPath = tempFolder.Path + "\wordView2.htm"
	Dim f As TextStream
	Set f = fs.CreateTextFile(sOutputPath)
	' this first styleSheet contains the defaults
   f.WriteLine "<link rel=""stylesheet"" type=""text/css"" href=""" + App.Path + "\pb-html\parseBench.css"">"
   ' the second styleSheet will override the first one, and can be customized for each project.
   f.WriteLine "<link rel=""stylesheet"" type=""text/css"" href=""" + proj.styleSheetPath + """>"

	f.Write sOutput

	f.Close
	writeWordPage = sOutputPath
End Function

' returns True if the word needs to be redrawn for the user because of changes this made.

Public Function toggleGoodness(xWFIDOM As MSXML2.DOMDocument30, sWordID As String, sParseID As String) As Boolean
	  Dim bRedraw As Boolean
	  bRedraw = False

	  toggleGoodness = True


	  ' for some reason, the position attributes seems to start with 1, while the lookup starts with zero!
	   nAnalysisNumber = nAnalysisNumber - 1

	   Dim nWord As IXMLDOMNode
		Set nWord = xWFIDOM.selectSingleNode("wfi/wfic[@id='" + sWordID + "']")
		If nWord Is Nothing Then
			MsgBox "'" + sWordID + "' not found in wfi. Something is wrong here... ", vbCritical
		Else

			 Dim n As IXMLDOMNode
			 ' now that we cannot select this by position, because we need to be able to use sort that table
			' and so the position in that table will not reflect the position in the parses of the word in the wfi
			 Set n = nWord.selectSingleNode("parses/parse[@parseID='" + sParseID + "']")

			 Dim sGoodness As String
			sGoodness = getXMLNodeAttribute(n, "goodness")

			  ' note that it is important that we have already retrieved the current goodness before calling prepare4Judgment
			bRedraw = prepareForJudgment(xWFIDOM, nWord)

			' rotate through the three goodness values
			sGoodness = Switch(sGoodness = "", "good", sGoodness = "?", "good", sGoodness = "good", "bad", sGoodness = "bad", "?")

			If n Is Nothing Then
				MsgBox " parse " + sParseID + " of '" + sWordID + "' not found in wfi. Something is wrong here... ", vbCritical
			Else

				' okay, we have the analysis node.  Now set its goodness attribute
				setXMLNodeAttribute xWFIDOM, n, "goodness", sGoodness
				'MsgBox n.xml
			End If
		End If

	  '  toggleGoodness = bRedraw
End Function

' if there are no judgments yet on this parse (all of the goodness attributes are missing = "?"),
'   and one is about to be made,
'   then change all of the parses from unknown to bad.  This will make life easier for the user.

' returns True if the word needs to be redrawn for the user because of changes this made.
Private Function prepareForJudgment(xWFIDOM As MSXML2.DOMDocument30, nWord As MSXML2.IXMLDOMNode) As Boolean
	prepareForJudgment = False
	Dim nParses As MSXML2.IXMLDOMNodeList
	' select all the parses which do not have the goodness of unknown
	Set nParses = nWord.selectNodes("parses/parse[@goodness and @goodness!='?']")
	If nParses Is Nothing Then
		Exit Function ' really, the should be an assert.  We should never get this.
	End If
	If nParses.length > 0 Then ' there is at least one judgments already.
		Exit Function
	End If

	' okay, they are all unknown.  So change them to bad.
	 Dim nParse As MSXML2.IXMLDOMNode
	Set nParses = nWord.selectNodes("parses/parse")
	 For Each nParse In nParses
		setXMLNodeAttribute xWFIDOM, nParse, "goodness", "bad"
	 Next nParse
	 prepareForJudgment = True
End Function
