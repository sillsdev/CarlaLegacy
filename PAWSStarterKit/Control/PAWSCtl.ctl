VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "SHDOCVW.dll"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.UserControl PAWSCtl
   Alignable       =   -1  'True
   ClientHeight    =   5190
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8100
   ScaleHeight     =   5190
   ScaleWidth      =   8100
   Begin MSComDlg.CommonDialog dlgCommonDialog
	  Left            =   5520
	  Top             =   3000
	  _ExtentX        =   847
	  _ExtentY        =   847
	  _Version        =   393216
   End
   Begin SHDocVwCtl.WebBrowser wbrWebBrowser
	  Height          =   5175
	  Left            =   0
	  TabIndex        =   0
	  Top             =   0
	  Width           =   8175
	  ExtentX         =   14420
	  ExtentY         =   9128
	  ViewMode        =   0
	  Offline         =   0
	  Silent          =   0
	  RegisterAsBrowser=   0
	  RegisterAsDropTarget=   1
	  AutoArrange     =   0   'False
	  NoClientEdge    =   0   'False
	  AlignLeft       =   0   'False
	  NoWebView       =   0   'False
	  HideFileNames   =   0   'False
	  SingleClick     =   0   'False
	  SingleSelection =   0   'False
	  NoFolders       =   0   'False
	  Transparent     =   0   'False
	  ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
	  Location        =   ""
   End
End
Attribute VB_Name = "PAWSCtl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
	' Start HTML page
Dim gsContents As Variant

Const gsStarterKitDefaultFileName As String = "StarterKit.paw"
Public Event PAWSDataModified()

Public Event PAWSTitleChange(sTitle As String)

Public Property Get AnswerFileName() As String
	AnswerFileName = gsAnswerFileName
End Property

Public Property Let AnswerFileName(ByVal vNewValue As String)
	gsAnswerFileName = vNewValue
	PropertyChanged "AnswerFileName"
End Property

Private Sub UserControl_Initialize()

	gsContents = App.Path & "\contents.htm"
	wbrWebBrowser.navigate gsContents

	Set gxmlDom = CreateObject("MSXML2.DOMDocument.3.0")
	Set gtrExampleTransformer = CreateObject("MSXML2.XSLTemplate")
	Set gtrGrammarTransformer = CreateObject("MSXML2.XSLTemplate")
	Set gxsltExampleDom = CreateObject("MSXML2.FreeThreadedDOMDocument.3.0")
	Set gxsltGrammarDom = CreateObject("MSXML2.FreeThreadedDOMDocument.3.0")
	gxsltExampleDom.async = False
	gxsltExampleDom.Load (App.Path & "\..\Templates\ParameterizedExample.xsl")
	If (gxsltExampleDom.parseError.errorCode <> 0) Then
		gXmlLoadError (gxsltExampleDom)
	End If
	Set gtrExampleTransformer.styleSheet = gxsltExampleDom
	Set gprcExampleProcessor = gtrExampleTransformer.createProcessor()
	gxsltGrammarDom.Load (App.Path & "\..\Templates\PAWSSKGrammarTextMapper.xsl")
	If (gxsltGrammarDom.parseError.errorCode <> 0) Then
		gXmlLoadError (gxsltGrammarDom)
	End If
	Set gtrGrammarTransformer.styleSheet = gxsltGrammarDom
	Set gprcGrammarProcessor = gtrGrammarTransformer.createProcessor()

End Sub

Public Sub SizeControls(lWidth As Long, lScaleHeight As Long, lStatusBarHeight As Long, bStatusBarVisible As Boolean, lToolBarHeight As Long, bToolBarVisible As Boolean)

'Adjust the web browser
	'set the width
	wbrWebBrowser.Left = 20
	wbrWebBrowser.Width = lWidth - 140

	'set the top
	wbrWebBrowser.Top = 0

	'set the height
	wbrWebBrowser.Height = lScaleHeight
	If bStatusBarVisible Then
		 wbrWebBrowser.Height = wbrWebBrowser.Height - lStatusBarHeight
	End If
	If bToolBarVisible Then
		 wbrWebBrowser.Height = wbrWebBrowser.Height - lToolBarHeight
	End If

'Adjust the form of the control
	Width = lWidth
''OPTION    Top = 0
	Height = lScaleHeight
	If bStatusBarVisible Then
		Height = Height - lStatusBarHeight
	End If
	If bToolBarVisible Then
		Height = Height - lToolBarHeight
	End If
End Sub


Public Sub BrowserRefresh()
	wbrWebBrowser.Refresh
End Sub

Public Sub BrowserBack()
	On Error GoTo noDocInHistory
	wbrWebBrowser.GoBack
	Exit Sub
noDocInHistory:
   Resume Next
End Sub
Public Sub BrowserForward()
	On Error GoTo noDocInHistory
	wbrWebBrowser.GoForward
	Exit Sub
noDocInHistory:
   Resume Next
End Sub

Public Function bFileLoad(sFileName As String) As Boolean
	On Error Resume Next

	Dim fso As FileSystemObject

	Set fso = CreateObject("Scripting.FileSystemObject")
	If (fso.FileExists(sFileName)) Then
			'TODO: need to check to see if any existing data in gxmlDOM needs to be saved first
	Else
		' ask user
		With dlgCommonDialog
			.DialogTitle = "Open"
			.CancelError = False
			.Filter = "PAWSStarterKit Files (*.paw)|*.paw|All Files (*.*)|*.*"
			.FileName = sFileName
			.Flags = cdlOFNHideReadOnly Or cdlOFNNoReadOnlyReturn
			.ShowOpen
			If Len(.FileName) = 0 Then
				Exit Function
			End If
			sFileName = .FileName
		End With
	End If
	bFileLoad = bXmlDOMLoad(sFileName)
	wbrWebBrowser.navigate gsContents
End Function
Private Function bXmlDOMLoad(sFileName As String)
	On Error GoTo LoadFailure
	gxmlDom.Load (sFileName)
	If (gxmlDom.parseError.errorCode = 0) Then
		' all is OK
		bXmlDOMLoad = True
		gsAnswerFileName = sFileName
		Dim langName As IXMLDOMNode
		Dim langAbbr As IXMLDOMNode
		Dim textSFM As IXMLDOMNode
		Set langName = gxmlDom.selectSingleNode("//language/langName")
		Set langAbbr = gxmlDom.selectSingleNode("//language/langAbbr")
		Set textSFM = gxmlDom.selectSingleNode("//language/textSFM")
		gsLangName = langName.Text
		gsLangAbbr = langAbbr.Text
		gsTextSFM = textSFM.Text
	End If
	Exit Function
LoadFailure:
	On Error Resume Next
	gXmlLoadError (gxmlDom)
	bXmlDOMLoad = False
	gsLangName = "Error!!"
End Function


Public Sub SaveFileIfNeeded()
	If (gbDirty) Then
		Dim sMsg As String
		If (gsAnswerFileName = "") Then
			gsAnswerFileName = gsAnswerFilePath & gsLangAbbr & gsStarterKitDefaultFileName
		End If
		sMsg = "Changes have been made to " + gsAnswerFileName + ".  Do you want to save them?"
		If (vbYes = MsgBox(sMsg, vbYesNo, "Save your work?")) Then
			If (Not bFileSave(gsAnswerFileName)) Then
				'TODO: what do if cannot save file??
			End If
		End If
	End If
End Sub

Public Function bFileSave(sTitle As String) As Boolean
	On Error Resume Next
	If (gsAnswerFileName = "" Or sTitle = "Save As") Then
		With dlgCommonDialog
			.DialogTitle = sTitle
'        .CancelError = False
			.Filter = "PAWSStarterKit Files (*.paw)|*.paw|All Files (*.*)|*.*"
			.Flags = cdlOFNHideReadOnly Or cdlOFNNoReadOnlyReturn
			If (gsAnswerFileName = "") Then
				gsAnswerFileName = gsLangAbbr & gsStarterKitDefaultFileName
			End If
			.FileName = gsAnswerFileName
			.ShowSave
			If Len(.FileName) = 0 Then
				Exit Function
			End If
			gsAnswerFileName = .FileName
		End With
	End If
		' get path of user file
	Dim i As Integer
	i = InStrRev(gsAnswerFileName, "\")
	If (i > 0) Then
		gsAnswerFilePath = Left(gsAnswerFileName, i)
	Else
		gsAnswerFilePath = ".\"
	End If
	Call DoFileSave
	bFileSave = True
	RaiseEvent PAWSDataModified
End Function
Private Sub DoFileSave()

	gxmlDom.save (gsAnswerFileName)
	'TODO: check for error
		'update file date time
	gbDirty = False ' no longer needs to be saved
	' create example files
		' set up
	gprcExampleProcessor.input = gxmlDom
	gprcGrammarProcessor.input = gxmlDom
	Call SaveExampleFiles
	Call CreateGrammarFile
	AppendCategoryMapperFile
End Sub
Private Sub SaveExampleFiles()
		' process each one in turn
	Call CreateExampleFile("Typology")
	Call CreateExampleFile("QP")
	Call CreateExampleFile("AdvP")
	Call CreateExampleFile("AdjP")
	Call CreateExampleFile("NP")
	Call CreateExampleFile("PP")
	Call CreateExampleFile("Pron")
	Call CreateExampleFile("IP")
	Call CreateExampleFile("Q")
	Call CreateExampleFile("Focus")
	Call CreateExampleFile("Neg")
	Call CreateExampleFile("Comp")
	Call CreateExampleFile("AdvCl")
	Call CreateExampleFile("RelCl")
	Call CreateExampleFile("FullNp")
	Call CreateExampleFile("Coord")
End Sub
Private Sub CreateExampleFile(sType As String)

	Dim sExamplePath As String
	Dim fso As FileSystemObject
	Dim fil As File
	Dim ts As TextStream

		' get examples from xml file
	gprcExampleProcessor.addParameter "prmIdTitle", sType
	gprcExampleProcessor.addParameter "prmTextSFM", gsTextSFM
	gprcExampleProcessor.Transform
		' write the examples to the file
	sExamplePath = gsAnswerFilePath & gsLangAbbr & sType & "Test.txt"
	Set fso = CreateObject("Scripting.FileSystemObject")
	fso.CreateTextFile (sExamplePath)
	Set fil = fso.GetFile(sExamplePath)
	Set ts = fil.OpenAsTextStream(ForWriting)
	ts.Write (gprcExampleProcessor.output)
	ts.Close
End Sub
Private Sub CreateGrammarFile()

	Dim sGrammarPath As String
	Dim fso As FileSystemObject
	Dim fil As File
	Dim ts As TextStream

	gprcGrammarProcessor.Transform
		' write the Grammar to the file
	sGrammarPath = gsAnswerFilePath & gsLangAbbr & "Patr.grm"
	Set fso = CreateObject("Scripting.FileSystemObject")
	fso.CreateTextFile (sGrammarPath)
	Set fil = fso.GetFile(sGrammarPath)
	Set ts = fil.OpenAsTextStream(ForWriting)
	ts.Write (gprcGrammarProcessor.output)
	ts.Close
End Sub
Private Sub AppendCategoryMapperFile()
	Dim sGrammarPath As String
	Dim sCatMapperPath As String
	Dim fso As FileSystemObject
	Dim fil As File
	Dim ts As TextStream

	sGrammarPath = gsAnswerFilePath & gsLangAbbr & "Patr.grm"
	sCatMapperPath = gsAnswerFilePath & gsLangAbbr & "CatMap.txt"
	Dim sGrammar As String
	Dim sCatMappings As String

	Set fso = CreateObject("Scripting.FileSystemObject")
		' read the Grammar file
	Set fil = fso.GetFile(sGrammarPath)
	Set ts = fil.OpenAsTextStream(ForReading)
	sGrammar = ts.ReadAll
	ts.Close
		' read the Category Mappings file
	Set fil = fso.GetFile(sCatMapperPath)
	Set ts = fil.OpenAsTextStream(ForReading)
	sCatMappings = ts.ReadAll
	ts.Close
		' reopen grammar for writing
	Set ts = fso.CreateTextFile(sGrammarPath, True)
		' write the grammar file contents
	ts.Write (sGrammar)
		' now write the category mappings
	ts.Write (sCatMappings)
	ts.Close
End Sub

Public Function bFileOpen() As Boolean
	With dlgCommonDialog
		.DialogTitle = "Open"
		.CancelError = False
		.Filter = "PAWSStarterKit Files (*.paw)|*.paw|All Files (*.*)|*.*"
		.Flags = cdlOFNFileMustExist Or cdlOFNHideReadOnly Or cdlOFNNoReadOnlyReturn
		.ShowOpen
		If Len(.FileName) = 0 Then
			Exit Function
		End If
		SaveFileIfNeeded
		gsAnswerFileName = .FileName
		bFileOpen = bXmlDOMLoad(gsAnswerFileName)
		wbrWebBrowser.navigate gsContents
		gbDirty = False ' this file has not yet been changed
		Exit Function
	End With
	bFileOpen = False
End Function

Public Function bFileNew() As Boolean
	Dim sNewFile As String
	sNewFile = App.Path & "\..\Data\PAWSStarterKitNew.paw"
	bFileNew = bXmlDOMLoad(sNewFile)
	wbrWebBrowser.navigate gsContents
	gsAnswerFileName = ""  ' force name to null so user will save it
	gbDirty = True ' consider it dirty (needs to be saved)
	bFileNew = True
	DialogLangName  ' make sure they create a language name for it
	LanguageFont 'make sure they have an opportunity to set the font
End Function

Public Sub LanguageFont()

	Dim fontName As IXMLDOMNode
	Dim fontSize As IXMLDOMNode
	Dim fontColor As IXMLDOMNode
	Dim bold As IXMLDOMNode
	Dim italic As IXMLDOMNode
	Dim underline As IXMLDOMNode
	Dim strikethrough As IXMLDOMNode

	' assume DOM is loaded
	   ' Get font-related elements and attributes
	Set fontName = gxmlDom.selectSingleNode("//language/fontName")
	Set fontSize = gxmlDom.selectSingleNode("//language/fontSize")
	Set fontColor = gxmlDom.selectSingleNode("//language/fontColor")
	Set bold = gxmlDom.selectSingleNode("//language/@bold")
	Set italic = gxmlDom.selectSingleNode("//language/@italic")
	Set underline = gxmlDom.selectSingleNode("//language/@under")
	Set strikethrough = gxmlDom.selectSingleNode("//language/@strike")

	With dlgCommonDialog
		' set values in dialog
		.fontName = fontName.Text
		.fontSize = fontSize.Text
		.Color = CLng("&H" & fontColor.Text)
		.FontBold = bold.Text
		.FontItalic = italic.Text
		.FontUnderline = underline.Text
		.FontStrikethru = strikethrough.Text
		.CancelError = False
		.Flags = cdlCFScreenFonts Or cdlCFEffects
		.ShowFont
		If Len(.fontName) = 0 Then
			Exit Sub
		End If
		' set font-related elements and attributes from dialog
		fontName.Text = .fontName
		fontSize.Text = .fontSize
		fontColor.Text = Hex(.Color)
		bold.Text = .FontBold
		italic.Text = .FontItalic
		underline.Text = .FontUnderline
		strikethrough.Text = .FontStrikethru
		Call UpdateStyleSheet(dlgCommonDialog)
		Call BrowserRefresh
	End With
End Sub
Private Sub UpdateStyleSheet(dlgFont As CommonDialog)
	Dim fso As FileSystemObject
	Dim fil As File
	Dim ts As TextStream
	Dim sCSS As String
	Dim sAll As String

	Set fso = CreateObject("Scripting.FileSystemObject")
		' read the master file
	sCSS = App.Path & "/../Styles/PAWSStarterKitMaster.css"
	Set fil = fso.GetFile(sCSS)
	Set ts = fil.OpenAsTextStream(ForReading)
	sAll = ts.ReadAll
	ts.Close
		' open real one for writing
	sCSS = App.Path & "/../Styles/" & gsLangAbbr & "PAWSStarterKit.css"
	Set ts = fso.CreateTextFile(sCSS, True)
		' write the master file contents
	ts.Write (sAll)
		' now write the vernacular info
	ts.WriteLine (".vernacular {")
	ts.Write ("font-family: ")
	ts.Write (dlgFont.fontName)
	ts.WriteLine (";")
	ts.Write ("font-size: ")
	ts.Write (dlgFont.fontSize)
	ts.WriteLine ("pt;")
	ts.Write ("color: #")
	'Dim s As String
	ts.Write (Hex(dlgFont.Color))
	'ts.Write (s)
		' add any needed padding (doesn't seem to match...)
	'If (dlgFont.Color < 256) Then
	'    ts.Write ("0000")
	'ElseIf (dlgFont.Color < 65536) Then
	'        ts.Write ("00")
	'End If
	ts.WriteLine (";")
	If (dlgFont.FontBold) Then
		ts.WriteLine ("font-weight: bold;")
	End If
	If (dlgFont.FontItalic) Then
		ts.WriteLine ("font-style: italic;")
	End If
	If (dlgFont.FontUnderline Or dlgFont.FontStrikethru) Then
		ts.Write ("text-decoration: ")
		If (dlgFont.FontUnderline) Then
			ts.Write ("underline ")
		End If
		If (dlgFont.FontStrikethru) Then
			ts.Write ("line-through")
		End If
		ts.WriteLine (";")
	End If
	ts.WriteLine ("}")
	ts.Close
End Sub

Private Sub wbrWebBrowser_DownloadComplete()
	RaiseEvent PAWSDataModified
	If (wbrWebBrowser.LocationURL <> "") Then
		RaiseEvent PAWSTitleChange(wbrWebBrowser.Document.Title)
	End If
End Sub

Public Property Get Dirty() As Boolean
	Dirty = gbDirty
End Property

Public Property Let Dirty(ByVal vNewValue As Boolean)
	gbDirty = vNewValue
	PropertyChanged "Dirty"
End Property

Public Sub DialogLangName()
	On Error Resume Next

	Dim langName As IXMLDOMNode
	Dim langAbbr As IXMLDOMNode
	Dim bAbbrLengthWrong As Boolean

	' assume DOM is loaded
	   ' Get font-related elements and attributes
	Set langName = gxmlDom.selectSingleNode("//language/langName")
	Set langAbbr = gxmlDom.selectSingleNode("//language/langAbbr")

	bAbbrLengthWrong = True ' assume it is wrong so can go through at least once
	Do While (bAbbrLengthWrong)
		With dlgLangName
			' set values in dialog
			.txtLangName = langName.Text
			.txtLangAbbr = langAbbr.Text
			.Show vbModal, Me
			If (.txtLangName = "-1") Then ' user hit the cancel button
				Exit Sub
			End If
			If (Len(.txtLangAbbr) < 1 Or Len(.txtLangAbbr) > 3) Then
				MsgBox "Abbreviation must be between one and three characters long", vbExclamation Or vbOKOnly
			Else
				bAbbrLengthWrong = False ' it's OK now
			End If
		End With
	Loop
	' user hit OK and data is correct, so set values
	langName.Text = dlgLangName.txtLangName
	gsLangName = langName.Text
	langAbbr.Text = dlgLangName.txtLangAbbr
	gsLangAbbr = langAbbr.Text
	gbDirty = True
	RaiseEvent PAWSDataModified ' notify container that data has changed
End Sub
Public Sub DialogTextSfm()
	On Error Resume Next

	Dim textSFM As IXMLDOMNode

	' assume DOM is loaded
	   ' Get font-related elements and attributes
	Set textSFM = gxmlDom.selectSingleNode("//language/textSFM")

	With dlgTextSFM
		' set values in dialog
		.txtTextSFM = textSFM.Text
		.Show vbModal, Me
		If (.txtTextSFM = "-1") Then ' user hit the cancel button
			Exit Sub
		End If
	End With
	' user hit OK and data is correct, so set values
	textSFM.Text = dlgTextSFM.txtTextSFM
	gsTextSFM = textSFM.Text
	gbDirty = True
	RaiseEvent PAWSDataModified ' notify container that data has changed
End Sub

Public Property Get langName() As Variant
	langName = gsLangName
End Property

Public Property Let langName(ByVal vNewValue As Variant)
	gsLangName = vNewValue
	PropertyChanged "LangName"
End Property

Public Property Get LangAbbreviation() As Variant
	LangAbbreviation = gsLangAbbr
End Property

Public Property Let LangAbbreviation(ByVal vNewValue As Variant)
	gsLangAbbr = vNewValue
	PropertyChanged "LangAbbreviation"
End Property

Public Property Get textSFM() As Variant
	textSFM = gsTextSFM
End Property

Public Property Let textSFM(ByVal vNewValue As Variant)
	gsTextSFM = vNewValue
	PropertyChanged "TextSFM"
End Property
