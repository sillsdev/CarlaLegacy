VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PBProject"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Public LangID As String
Public LangAbrev As String
Public LangName As String
Private m_sWFIPath As String
Public WFIDOM As MSXML2.DOMDocument30
Attribute WFIDOM.VB_VarUserMemId = 0
Public FiltersPath As String
Private m_bReady As Boolean
Public m_bWFIModified As Boolean
Public sSentransRuleOutputPath As String
Public DoWriteSentransRules As Boolean
Public m_display As PBDisplayOptions
Public m_sCarlaStudioControlFilesPath As String


Public Property Get Ready() As Boolean
	Ready = m_bReady
End Property
Public Property Get Path() As String
	'Dim fs As New FileSystemObject
	'Dim sPath As String
	'sPath = Strings.Mid(WFIDOM.URL, 9)
   'sPath = Strings.Replace(sPath, "%20", " ")
	'Path = sPath
	Path = m_sWFIPath
End Property
Public Property Let Path(sPath As String)
	Set WFIDOM = Nothing
	m_bReady = False
	m_bWFIModified = False
	m_sWFIPath = sPath
End Property
Private Sub loadExtraStuffIntoWFIDOM()

	Dim nWFIRoot As MSXML2.IXMLDOMNode
	Set nWFIRoot = WFIDOM.selectSingleNode("wfi")

	setXMLNodeAttribute WFIDOM, nWFIRoot, "creator", "ParseBench"
	setXMLNodeAttribute WFIDOM, nWFIRoot, "creatorVersion", Str(App.Major) & "." & Str(App.Minor)

	' write to CarlaStudio language parameters
	Dim nLang As MSXML2.IXMLDOMNode
	Set nLang = WFIDOM.selectSingleNode("wfi/language")
	If nLang Is Nothing Then
		Set nLang = WFIDOM.createElement("language")
		Call nWFIRoot.appendChild(nLang)
	End If

	setXMLNodeAttribute WFIDOM, nLang, "id", LangID
	setXMLNodeAttribute WFIDOM, nLang, "name", LangName
	setXMLNodeAttribute WFIDOM, nLang, "abrev", LangAbrev

	' write the SENTRANS rules options
	Dim nOpt As MSXML2.IXMLDOMNode
	Set nOpt = WFIDOM.selectSingleNode("wfi/stRuleOptions")
	If nOpt Is Nothing Then
		Set nOpt = WFIDOM.createElement("stRuleOptions")
		Call nWFIRoot.appendChild(nOpt)
	End If

	setXMLNodeAttribute WFIDOM, nOpt, "stRuleOutputPath", sSentransRuleOutputPath
	Dim sb As String
	sb = DoWriteSentransRules
	setXMLNodeAttribute WFIDOM, nOpt, "alwaysWriteSTRulesWhenSaving", sb

	' write the display options
   ' Dim nOpt As MSXML2.IXMLDOMNode
	Set nOpt = getOrMakeXMLNode(WFIDOM, nWFIRoot, "display")
	m_display.populateDisplayNode WFIDOM, nOpt


	' write other options
	Set nOpt = getOrMakeXMLNode(WFIDOM, nWFIRoot, "paths")
	setXMLNodeAttribute WFIDOM, nOpt, "filterFilePath", FiltersPath
	setXMLNodeAttribute WFIDOM, nOpt, "CarlaStudioControlFilesPath", m_sCarlaStudioControlFilesPath

End Sub
Public Function Save() As Boolean
	Save = False

	If Path = "" Then Exit Function

	Dim fs As New FileSystemObject
	Dim sPath As String
	sPath = Path
	On Error Resume Next ' it is okay if this file is not found
	 fs.CopyFile sPath, sPath + ".bak"

	On Error GoTo catcherror
	loadExtraStuffIntoWFIDOM ' that the parameters of this object into the DOM so they will be saved as XML
  '  WFIDOM.preserveWhiteSpace = True
	WFIDOM.Save sPath
 '   WFIDOM.Save sPath
	m_bWFIModified = False
	Save = True
	Exit Function

catcherror:
	Save = False
	MsgBox Err.Description, vbCritical
	On Error GoTo 0
End Function

Private Sub Class_Initialize()
	m_bReady = False
	m_bWFIModified = False
	FiltersPath = App.Path + "\pb-xsl\samplefilters.xml"
	Set WFIDOM = Nothing
	Set m_display = New PBDisplayOptions

	DoWriteSentransRules = False
End Sub

' here, and is a node produced by CarlaStudio in the function CParseCSImpl::get_LangInfoXML(BSTR *pVal)
Public Sub InitFromXMLNode(n As IXMLDOMNode)
	LangID = getXMLNodeAttribute(n, "id")
	LangAbrev = getXMLNodeAttribute(n, "abrev")
	LangName = getXMLNodeAttribute(n, "name")
	m_sCarlaStudioControlFilesPath = getXMLNodeAttribute(n, "ctrlFilesDir")
	sSentransRuleOutputPath = m_sCarlaStudioControlFilesPath + "ParseBench.sen"

	' create a new XML document in memory
	 Set WFIDOM = New MSXML2.DOMDocument30
	' give this new document a single node OF <wfi/>
	WFIDOM.appendChild WFIDOM.createElement("wfi")


End Sub

Public Sub Load(stat As StatusBar)
	m_bReady = False
	stat.SimpleText = "Loading " + m_sWFIPath + "..."

	Set WFIDOM = New MSXML2.DOMDocument30
	WFIDOM.async = False
	If Not WFIDOM.Load(m_sWFIPath) Then
		MsgBox "There was a problem loading " + m_sWFIPath + ". " + vbCrLf + WFIDOM.parseError.reason + ": " + WFIDOM.parseError.srcText + vbCrLf + "If this file has become corrupted, you may need to replace it with one of the backups that ParseBench creates."
		Set WFIDOM = Nothing
	Else
		Dim nLang As IXMLDOMNode
		Set nLang = WFIDOM.selectSingleNode("wfi/language")
		If nLang Is Nothing Then
			If Strings.InStr(1, m_sWFIPath, "bukyip") > 0 Then
				' assume that this is Bob Conrad's old version. Upgrade it.
				LangID = "Bukiyip-BUK"
				LangName = "Bukiyip"
				LangAbrev = "BUK"
				sSentransRuleOutputPath = "c:\bukiyip\bukcarla dict cs\buk control files\parsebench.sen"
			Else
				MsgBox "The <lang> element is missing from this file."
			End If
		Else
				LangID = getXMLNodeAttribute(nLang, "id")
				LangName = getXMLNodeAttribute(nLang, "name")
				LangAbrev = getXMLNodeAttribute(nLang, "abrev")
		End If

		' load in the SENTRANS rules options
		Dim nSTOptions As IXMLDOMNode
		Set nSTOptions = WFIDOM.selectSingleNode("wfi/stRuleOptions")
		If nSTOptions Is Nothing Then
			MsgBox "The <stOptions> element is missing from this file.  Defaults will be used for Sentrans rues."
		Else
			   Dim s As String
			   s = getXMLNodeAttribute(nSTOptions, "alwaysWriteSTRulesWhenSaving")
			   If s = "true" Or s = "false" Then DoWriteSentransRules = s

				sSentransRuleOutputPath = getXMLNodeAttribute(nSTOptions, "stRuleOutputPath")
		End If

		' load in the display options
		Dim nDisplay As IXMLDOMNode

		Set nDisplay = WFIDOM.selectSingleNode("wfi/display")
		If nDisplay Is Nothing Then
		   MsgBox "The <display> element is missing from this file.  Defaults will be used."
		Else
			m_display.ReadDisplayNode nDisplay
		End If
		Call m_display.writeStyleSheet(styleSheetPath())

		 ' load in other paths
		Dim nPaths As IXMLDOMNode
		Set nPaths = WFIDOM.selectSingleNode("wfi/paths")
		If nPaths Is Nothing Then
		   MsgBox "The <paths> element is missing from this file.  Defaults will be used. Make sure to check the path field in the filters options dialog box."
		Else
			FiltersPath = getXMLNodeAttribute(nPaths, "filterFilePath")
			m_sCarlaStudioControlFilesPath = getXMLNodeAttribute(nPaths, "CarlaStudioControlFilesPath")
		End If
		If FiltersPath = "" Then
			FiltersPath = App.Path + "\pb-xsl\sampleFilters.xml"
		End If

	  m_bReady = True
	   m_bWFIModified = False

	End If
End Sub

'Public Sub WriteEmptyWFI(sTheID As String, sTheAbrev As String, sTheName As String)
'    Dim fs As New FileSystemObject
'    Dim f As TextStream
'    Set f = fs.CreateTextFile(m_sWFIPath)
''    f.WriteLine "<?xml version=""1.0"" ?>"
'    f.WriteLine "<wfi creator='ParseBench' creatorVersion='" + Str(App.Major) + "." + Str(App.Minor) + "'>"
'    f.WriteLine "<language abrev='" + sTheAbrev + "' name='" + sTheName + "' id='" + sTheID + "' />"
'
'    m_display.WriteToFile f
'
'    f.WriteLine "<stRuleOptions stRuleOutputPath='' alwaysWriteSTRulesWhenSaving='false' />"
'    f.WriteLine "</wfi>"
'    f.Close
'End Sub
' returns the path to the temporary css styleSheet to use
Public Function styleSheetPath() As String
   Dim fs As New FileSystemObject

	Dim tempFolder As Scripting.Folder
	Set tempFolder = fs.GetSpecialFolder(2) 'temp directory
	styleSheetPath = tempFolder.Path + "\pb-" + LangID + ".css"

End Function

Public Function DefaultFilterPath() As String
   DefaultFilterPath = m_sCarlaStudioControlFilesPath + "parsebench filters.xml"
End Function
