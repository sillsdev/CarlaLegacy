VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Filter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private m_sLabel As String
Private m_sKey As String
Private m_sFilterString As String
Private m_sFilterPrompt As String
Private m_sParamQuery As String
Private m_sPrompt As String
Private m_sQueryCore As String
Private m_nPage As Integer
Public m_nWordsPerPage As Long
Public m_sGroup As String

Public Function FirstWordNumber() As Long
	FirstWordNumber = 1 + m_nPage * m_nWordsPerPage
End Function
Public Function LastWordNumber() As Long
	LastWordNumber = (1 + m_nPage) * m_nWordsPerPage
End Function

' this is called when the user selects the filter, but before we ask it for its filter string.
' this gives the filter a chance to put up a dialogue if it needs to get information from the user.
Public Function BeforeSelection() As Boolean
	If m_sPrompt = "" Then
		BeforeSelection = True
		Exit Function
	End If

	Dim sValue As String
	sValue = InputBox(m_sPrompt, m_sLabel)
	If sValue = "" Then
		BeforeSelection = False
		m_sQueryCore = "PARAM_MISSING"
	Else

		m_sQueryCore = Strings.Replace(m_sParamQuery, "PARAMETER", sValue)
		BeforeSelection = True
	End If
End Function
' generate the XPath string that will be handed to the xsl styleSheet to select a set of words
Public Property Get XPathString() As String
	Dim s As String

	If Label = "All" Then
		 m_sFilterString = "/wfi/wfic"
	ElseIf m_sPrompt <> "" Then
		' in this case m_sQueryCore has already been set by BeforeSelection()
		 m_sFilterString = "/wfi/wfic[" + m_sQueryCore + "]"
	Else
		 m_sFilterString = "/wfi/wfic[" + m_sQueryCore + "]"
	End If
	XPathString = m_sFilterString
End Property

' create the HTML page displaying the items selected by this filter
'bRefreshOnly=true prevents prompting the user on filters with prompts
Public Function writeFilterViewPage(proj As PBProject, wordListTable As HTMLListTable, ByRef nTotalWords As Long, bRefreshOnly As Boolean)
	If Not bRefreshOnly Then
		BeforeSelection
	End If
	Dim bListWasTruncated As Boolean
	writeFilterViewPage = writeListPage(proj, Me, wordListTable, nTotalWords, bListWasTruncated)

End Function
'nTotalWords not implemented yet
'bRefreshOnly=true prevents prompting the user on filters with prompts
Public Function writeStatisticsPage(proj As PBProject, ByRef nTotalWords As Long, bRefreshOnly As Boolean)
	nTotalWords = 0 'nTotalWords not implemented yet
	If Not bRefreshOnly Then
		BeforeSelection
	End If
	writeStatisticsPage = writeStatsPage(proj, Me)
End Function
Public Property Let Key(ByVal vData As String)
	m_sKey = vData
End Property

Public Property Get Key() As String
	If m_sKey = "" Then
		MsgBox "You have encountered a bug in this application.  The key for this filter was not set."
		Key = Str(Rnd) ' maybe we can limp along.
	End If
	Key = m_sKey
End Property

Public Property Let Label(ByVal vData As String)
	m_sLabel = vData
End Property

Public Property Get Label() As String
	Label = m_sLabel
End Property

Public Sub InitFromXMLNode(n As IXMLDOMNode)
	m_sPrompt = getXMLNodeAttribute(n, "prompt")
	m_sLabel = getXMLNodeAttribute(n, "label")
	m_sQueryCore = getXMLNodeAttribute(n, "query")
	m_sGroup = getXMLNodeAttribute(n, "group")
	If m_sQueryCore = "" Or m_sLabel = "" Then
		MsgBox "This filter could not be read in correctly: " + n.xml
	End If

	' does this query contain a parameter that is filled in at runtime?
	If Strings.InStr(1, m_sQueryCore, "PARAMETER") > 0 Then
		m_sParamQuery = m_sQueryCore
	End If

	' makeup the key by concatenating our label and our query core
   ' m_sKey = Strings.Replace(m_sLabel + m_sQueryCore, " ", "")
End Sub

' initialize from an XML strings like <filter label='blah' query='foo' />
Public Sub InitFromXMLString(sXML As String)
	Dim doc As New MSXML2.DOMDocument30
	doc.loadXML sXML
	InitFromXMLNode doc.childNodes(0)
	Set doc = Nothing
End Sub
' returns True unless the user canceled the edit dialog box
Public Function Edit() As Boolean
	Dim dlg As New DlgEditFilter
	dlg.sLabel = m_sLabel
	dlg.sQuery = m_sQueryCore
	dlg.sPrompt = m_sPrompt
	dlg.txtStaticLabel = m_sLabel


	dlg.ParseQuery (m_sQueryCore)

	dlg.Show vbModal
	If dlg.m_bOK Then
		m_sLabel = dlg.sLabel
		m_sQueryCore = dlg.sQuery
		m_sPrompt = dlg.sPrompt
	End If
	Edit = dlg.m_bOK
	Unload dlg
End Function
' returns True unless the user canceled the edit dialog box
Public Function InitFromEditDlg() As Boolean
	InitFromEditDlg = Edit
End Function
' this must be followed by a call to InitFromXMLNode or InitFromXMLString
Private Sub Class_Initialize()
	m_nPage = 0
	m_nWordsPerPage = 50
End Sub

' this will normally be followed by a call to writeFilterViewPage()
Public Sub GotoNextPage()
	m_nPage = m_nPage + 1
End Sub

' this will normally be followed by a call to writeFilterViewPage()
Public Sub GotoPreviousPage()
	If m_nPage > 0 Then
		m_nPage = m_nPage - 1
	End If
End Sub
Public Sub GotoFirstPage()
	m_nPage = 0
End Sub

Public Property Get Page() As Integer
	Page = m_nPage
End Property
Public Function PageCount(ByVal nTotalWords As Integer) As Integer
	If nTotalWords < m_nWordsPerPage Then
		PageCount = 1
	Else
		PageCount = Math.Round(nTotalWords / m_nWordsPerPage)
	End If
End Function

Public Sub WriteToXMLFile(fout As TextStream)
	fout.Write "<filter label=""" + m_sLabel + """ query=""" + m_sQueryCore + """ "
	If m_sPrompt <> "" Then
		fout.Write "prompt=""" + m_sPrompt + """ "
	End If
   If m_sGroup <> "" Then
		fout.Write "group=""" + m_sGroup + """ "
	End If
	fout.WriteLine " />"

End Sub
Public Property Get Hidden() As Boolean
	Hidden = m_sGroup = "hide"
End Property
