Attribute VB_Name = "MergeWFIs"
Public Sub mergeCarlaStudioResultWord(proj As PBProject, nCStudio As MSXML2.IXMLDOMNode, nWFI As MSXML2.IXMLDOMNode)
	'Debug.Print "cs node= " & getXMLNodeAttribute(nCStudio, "form") & " wfi=" & getXMLNodeAttribute(nWFI, "form")
	If getXMLNodeAttribute(nCStudio, "id") <> getXMLNodeAttribute(nWFI, "id") Then
		Debug.Print "Mismatch: cs node= " & getXMLNodeAttribute(nCStudio, "id") & " wfi=" & getXMLNodeAttribute(nWFI, "id")
		MsgBox "There is was a merging error. Notify ParseBench support."
	End If
	mergeWFICs proj.WFIDOM, nWFI, nCStudio
End Sub

'This is used now only for importing new words; mergeCarlaStudioResultWord() is used when parsing
Public Function updateWFI(proj As PBProject, sUpdateWFIPath As String, stat As StatusBar, bAllowNewWords As Boolean)

   stat.Style = sbrSimple

	stat.SimpleText = "loading " + sUpdateWFIPath + "..."
	'load in the input word form inventory XML file
	Dim y As New MSXML2.DOMDocument30 'MSXML2.XMLDocument
	y.async = False
	y.Load sUpdateWFIPath
	 If y.parseError.errorCode <> 0 Then
		MsgBox y.parseError.reason + vbCrLf + sUpdateWFIPath
		Exit Function
	End If


	stat.SimpleText = "Merging..."

	nCount = 0
   '  Dim targetNodes As IXMLDOMNodeList
	' Set targetNodes = proj.WFIDOM.selectNodes("wfi/wfic")
	Dim updateNodes As IXMLDOMNodeList
	Set updateNodes = y.selectNodes("wfi/wfic")

	Dim nWFIRoot As MSXML2.IXMLDOMNode
	Set nWFIRoot = proj.WFIDOM.selectSingleNode("wfi")

	Dim bCheckForDuplicates As Boolean
	If bAllowNewWords And (nWFIRoot.childNodes.length = 0) Then
		bCheckForDuplicates = False
	Else
		bCheckForDuplicates = True
	End If

	nTotal = updateNodes.length

	Dim sWarning As String
	Dim nUpdateNode As MSXML2.IXMLDOMNode
	For Each nUpdateNode In updateNodes
		nCount = nCount + 1
		If Math.Round(nCount / 10) * 10 = nCount Then
			stat.SimpleText = "Merging " + Str(nCount) + " of " + Str(nTotal)
		End If
		sID = nUpdateNode.Attributes.getNamedItem("id").Text
		Dim nTargetNode As IXMLDOMNode
		If bCheckForDuplicates Then
			Set nTargetNode = proj.WFIDOM.selectSingleNode("wfi/wfic[@id='" + sID + "']")
		End If

		If nTargetNode Is Nothing Then
			 If bAllowNewWords = True Then
				Dim nNew As MSXML2.IXMLDOMNode
				'Set nNew = proj.WFIDOM.createElement("wfic")
				Set nNew = nUpdateNode.cloneNode(True)

				Set nNew = nWFIRoot.appendChild(nNew)

			Else
				sWarning = sWarning + "'" + sID + "' not found in wfi." + vbCrLf
			End If
		 Else
			mergeWFICs proj.WFIDOM, nTargetNode, nUpdateNode
		End If
	Next

	' write now the resulting wfi file on top of the original one.
	Dim fs As New FileSystemObject
	Dim z As Date

	Dim d As Date
	d = Now

 '   sTime = Str(Hour(d)) + "-" + Str(Minute(d)) + "-" + Str(Day(d)) + "-" + Str(Month(d))
 '   fs.CopyFile sWFIPath, sWFIPath + "." + sTime + ".bak"
 '   proj.WFIDOM.save (sWFIPath)


	'SortWFIByFreq proj, stat

	SetAllWordPositionAttrs proj.WFIDOM, stat


	If sWarning <> "" Then
		MsgBox sWarning
	End If
End Function

Private Sub mergeWFICs(xWFIDOM As MSXML2.IXMLDOMDocument, nTargetWFIC As IXMLDOMNode, nUpdateWFIC As IXMLDOMNode)
   ' first, clear all of the "found" attributes of the analyses of the target node to "n",
	' these will be set to "y" if they were indeed returned by this most recent parse.

	Dim targetParses As IXMLDOMNodeList
	Set targetParses = nTargetWFIC.selectNodes("parses/parse")
	Dim yParse As MSXML2.IXMLDOMNode
	For Each yParse In targetParses
		setXMLNodeAttribute xWFIDOM, yParse, "found", "n"
	Next

   Dim updateParses As IXMLDOMNodeList
	 Set updateParses = nUpdateWFIC.selectNodes("parses/parse")

	For Each yParse In updateParses
		' find the matching parse in the wfi.  If it is there, leave it.
		Dim nMatch As IXMLDOMNode
		Set nMatch = findParse(nTargetWFIC, yParse)
		If Not nMatch Is Nothing Then
		   setXMLNodeAttribute xWFIDOM, nMatch, "found", "y"
		Else
			'If it is not, add it, with a goodness attribute of "?"
			Dim nParses As MSXML2.IXMLDOMNode
			Set nParses = nTargetWFIC.selectSingleNode("parses")
			If nParses Is Nothing Then
				' create one
				'Set nParses = xWFIDOM.createNode(msxml2.NODE_ELEMENT, "parses", "")
				Set nParses = xWFIDOM.createElement("parses")
				Set nParses = nTargetWFIC.appendChild(nParses)
			End If
			scheck = nTargetWFIC.xml

			'now add the analysis
		   ' Dim nParse As MSXML2.IXMLDOMNode
			Set nA = yParse.cloneNode(True)
			nParses.appendChild (nA)     'nParses.appendChild (nParse)
			Dim nParse As MSXML2.IXMLDOMNode
			Set nParse = nA

			setXMLNodeAttribute xWFIDOM, nParse, "found", "y"
		End If
	Next

	 ' now remove any analyses which were not found and which have a goodness of "?"
   For Each yParse In targetParses
		If yParse.Attributes.getNamedItem("found").Text = "n" Then
			Dim attr As IXMLDOMNode
			Set attr = yParse.Attributes.getNamedItem("goodness")
			If attr Is Nothing Then
				yParse.parentNode.removeChild yParse
			ElseIf attr.Text = "?" Then
				yParse.parentNode.removeChild yParse
			End If
		End If
	Next
End Sub

Private Function findParse(nWFI As IXMLDOMNode, nParse As IXMLDOMNode) As IXMLDOMNode
	' get a list of the analyses with matching category progressions and morpheme breakdowns
	Dim matchingParses As IXMLDOMNodeList
	Dim s As String
 '   s = "@catProgression='" + nParse.Attributes.getNamedItem("catProgression").Text + "'"
 '   s = s + "and @morphsID='" + nParse.Attributes.getNamedItem("morphsID").Text + "'"
	 s = "@parseID='" + nParse.Attributes.getNamedItem("parseID").Text + "'"

   Set matchingParses = nWFI.selectNodes("parses/parse[" + s + "]")
	If matchingParses.length = 0 Then
		Set findParse = Nothing
		Exit Function
	 ElseIf matchingParses.length > 1 Then
		s = nWFI.Attributes.getNamedItem("form").Text
		MsgBox "Warning: more than one parse of " + s + " has the same parseID, which should be unique"
	End If

	Set findParse = matchingParses.Item(0)
End Function
