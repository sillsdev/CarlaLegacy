Attribute VB_Name = "ParseWFI"

Public Sub ParseSet(proj As PBProject, sFilesDirectory As String, stat As StatusBar, Optional sWordFilter = "wfi/wfic")
	Dim xWFIDOM As MSXML2.DOMDocument30
	Set xWFIDOM = proj.WFIDOM

	Dim sErrorAction As String
	stat.Style = sbrSimple
	stat.SimpleText = "Contacting CarlaStudio..."
	'xOutput = ""

	'make a connection to CarlaStudio

	  Dim cs As Object
	  On Error Resume Next
	  Set cs = CreateObject("CStudio.ParseCS") 'late bind is better for handling improperly installed cstudio
	 If cs Is Nothing Then
		MsgBox "Parsebench could not make contact with CarlaStudio.  You may need to reinstall the latest version of CarlaStudio.", vbCritical
	  Exit Sub
	End If
	On Error GoTo noCStudio

	 ' Set cs = New CStudioLib.ParseCS
	  s = cs.SourceLangeCode
	  cs.SourceLangeCode = proj.LangID 'we've actually don't know if we are talking to CarlaStudio and tell this line.


	On Error GoTo catcherror
	sErrorAction = "Choosing Words"
	 stat.SimpleText = "Choosing words..."

	Dim wficNodes As IXMLDOMNodeList
	Dim varWordFilter As Variant ' this function requires a variant, not just a string
	varWordFilter = sWordFilter
	Set wficNodes = xWFIDOM.selectNodes(varWordFilter)
	 nTotal = wficNodes.length
	nPerRun = 50
	Dim nSoFar As Integer
	nSoFar = 0

	While nSoFar < nTotal
		Dim nLast As Integer
		nLast = nSoFar + nPerRun
		If nLast > nTotal Then nLast = nTotal
	   ' Dim sUpdateWFIPath As String
	   ' sUpdateWFIPath = ParseSubSet(proj, wficNodes, cs, stat, nSoFar + 1, nLast)
		ParseSubSet proj, wficNodes, cs, stat, nSoFar + 1, nLast
		' merge this run into our wfi in memory
	 '   updateWFI proj, sUpdateWFIPath, stat, False ' merge this run file with the main wfi
		nSoFar = nSoFar + nPerRun
	Wend
	 'free connection to CarlaStudio
	Set cs = Nothing

	SetAllWordPositionAttrs xWFIDOM, stat

	Exit Sub
noCStudio:
	Set cs = Nothing ' free it up
	MsgBox "There was a problem contacting CarlaStudio.  " + vbCrLf + Err.Description + vbCrLf + "Make sure CarlaStudio is running and try again."
   ' ParseSet = ""
	On Error GoTo 0
	Exit Sub


catcherror:
	 Set cs = Nothing ' free it up
	MsgBox "There was a problem while " + sErrorAction + vbCrLf + Err.Description
   ' ParseSet = ""
	On Error GoTo 0
	Exit Sub
 End Sub

 Private Sub ParseSubSet(proj As PBProject, wficNodes As IXMLDOMNodeList, cs As Object, stat As StatusBar, nStart As Integer, nEnd As Integer)
	' create that textfile to put the output in
	sErrorAction = "Creating output file"
	Dim fs As New FileSystemObject
 '   Dim f As TextStream
	sTimeStamp = "" 'to do

	sRunPath = sFilesDirectory + "\" + proj.LangAbrev + "-WB-Parse-Run" + sTimeStamp + ".xml"
'    Set f = fs.CreateTextFile(sRunPath)
'    f.Write "<wfi type=""PARSE-RUN"">" + vbCrLf

	 sErrorAction = "Creating file of words to give to CarlaStudio."
	 stat.SimpleText = "Collecting words..."


	Dim w As MSXML2.IXMLDOMNode

	Dim result As String
	Dim sForms As String
	nCount = 0
	Dim fInput As TextStream
	Dim tempFolder As Scripting.Folder
	Set tempFolder = fs.GetSpecialFolder(2) 'temp directory

	sInputPath = tempFolder.Path + "\pb-parseWords.txt"
	Set fInput = fs.CreateTextFile(sInputPath)
	For Each w In wficNodes
		nCount = nCount + 1 ' had only the words between the range we were given.  nStart to nEnd
		If nCount > nEnd Then
			Exit For
		ElseIf nCount >= nStart Then
			fInput.Write w.Attributes.getNamedItem("form").Text + " " ' note that carriage returns seem to mess up to CarlaStudio is ability to know how long the file is.  For every new line, it will think there is an extra character.
		End If
	Next
	fInput.Close

	Dim sCSOuputPath As String
	sCSOuputPath = tempFolder.Path + "\pb-csOuput.xml"

	stat.SimpleText = "CarlaStudio is working on words " + Str(nStart) + " to " + Str(nEnd) + "..."
	' now parse them all at once
	sErrorAction = "Parsing"
	cs.ParseFile sInputPath, sCSOuputPath, Falses


	' now read in the result.

	  stat.SimpleText = "Processing results..."
	Dim domResult As New MSXML2.DOMDocument30 'MSXML2.XMLDocument
	domResult.async = False
	domResult.Load (sCSOuputPath)
	Dim nodeResult As MSXML2.IXMLDOMNode
	nCount = nStart - 1 ' item() below is base zero
	For Each nodeResult In domResult.selectNodes("AResult/word")
		Set w = wficNodes.Item(nCount)
		nCount = nCount + 1
		mergeCarlaStudioResultWord proj, nodeResult, w
'        sForm = nodeResult.Attributes.getNamedItem("id").Text
'        f.WriteLine ("<wfic id =""" + sForm + """ form =""" + sForm + """ freq =""0"">")
'        f.WriteLine "<parses>"
'        Dim parse As MSXML2.IXMLDOMNode
'        For Each parse In nodeResult.selectNodes("parses/parse")
'            f.WriteLine parse.xml
'        Next
'        f.WriteLine ("</parses></wfic>")
	Next
'    f.WriteLine "</wfi>"
 '   f.Close


   ' ParseSubSet = sRunPath ' returned the path to the XML file we just created
	On Error GoTo 0
  Exit Sub


catcherror:
	 Set cs = Nothing ' free it up
	MsgBox "There was a problem while " + sErrorAction + vbCrLf + Err.Description
  '  ParseSubSet = ""
	On Error GoTo 0
	Exit Sub
End Sub

Private Sub processResult(sResult As String, f As TextStream)
	Dim x As New MSXML2.DOMDocument30 'MSXML2.XMLDocument
	x.async = False
	x.loadXML (sResult)

	f.WriteLine "<parses>"
	Dim parse As MSXML2.IXMLDOMNode
	For Each parse In x.selectNodes("aresult/parses/parse")
		'make a suitable (partial) id for later matching
   '     For Each m In analysis.selectNodes("morph")
   '         s = s + m
   '     Next
   '     Dim attr As New MSXML2.IXMLDOMNode
   '     attr.
   '     analysis.attributes.setNamedItem(attr);

		f.Write parse.xml + vbCrLf
	Next
	f.WriteLine "</parses>"
End Sub
