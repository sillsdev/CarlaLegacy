VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form Form1
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "CarlaStudio Bridge"
   ClientHeight    =   5355
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7950
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5355
   ScaleWidth      =   7950
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.CheckBox m_chkLeaveRunning
	  Caption         =   "Lea&ve this dialog running"
	  Height          =   255
	  Left            =   360
	  TabIndex        =   24
	  Top             =   4920
	  Width           =   2295
   End
   Begin MSComDlg.CommonDialog CommonDialog
	  Left            =   0
	  Top             =   0
	  _ExtentX        =   847
	  _ExtentY        =   847
	  _Version        =   393216
   End
   Begin VB.CommandButton Command5
	  Caption         =   "&Help"
	  Enabled         =   0   'False
	  Height          =   375
	  Left            =   5880
	  TabIndex        =   10
	  Top             =   4800
	  Width           =   1215
   End
   Begin VB.CommandButton Cancel
	  Cancel          =   -1  'True
	  Caption         =   "&Cancel"
	  Height          =   375
	  Left            =   4560
	  TabIndex        =   9
	  Top             =   4800
	  Width           =   1095
   End
   Begin VB.CommandButton Go
	  Caption         =   "&Go"
	  Default         =   -1  'True
	  Height          =   375
	  Left            =   3240
	  TabIndex        =   2
	  Top             =   4800
	  Width           =   1215
   End
   Begin TabDlg.SSTab SSTab
	  Height          =   4215
	  Left            =   120
	  TabIndex        =   0
	  Top             =   120
	  Width           =   7695
	  _ExtentX        =   13573
	  _ExtentY        =   7435
	  _Version        =   393216
	  Tabs            =   5
	  TabsPerRow      =   5
	  TabHeight       =   520
	  TabCaption(0)   =   "&Input"
	  TabPicture(0)   =   "Form1.frx":0000
	  Tab(0).ControlEnabled=   -1  'True
	  Tab(0).Control(0)=   "Label1"
	  Tab(0).Control(0).Enabled=   0   'False
	  Tab(0).Control(1)=   "Label2"
	  Tab(0).Control(1).Enabled=   0   'False
	  Tab(0).Control(2)=   "btnBrowseInputPath"
	  Tab(0).Control(2).Enabled=   0   'False
	  Tab(0).Control(3)=   "m_sInputPath"
	  Tab(0).Control(3).Enabled=   0   'False
	  Tab(0).Control(4)=   "m_sSrcLanguageCombo"
	  Tab(0).Control(4).Enabled=   0   'False
	  Tab(0).Control(5)=   "m_bAlreadyInterlinearized"
	  Tab(0).Control(5).Enabled=   0   'False
	  Tab(0).ControlCount=   6
	  TabCaption(1)   =   "&Processing Goal"
	  TabPicture(1)   =   "Form1.frx":001C
	  Tab(1).ControlEnabled=   0   'False
	  Tab(1).Control(0)=   "Frame1"
	  Tab(1).Control(1)=   "m_sTargetLanguageCombo"
	  Tab(1).ControlCount=   2
	  TabCaption(2)   =   "&Output Location"
	  TabPicture(2)   =   "Form1.frx":0038
	  Tab(2).ControlEnabled=   0   'False
	  Tab(2).Control(0)=   "btnBrowseOutputPath"
	  Tab(2).Control(1)=   "m_sDesiredOutputPath"
	  Tab(2).Control(2)=   "Frame2"
	  Tab(2).Control(3)=   "Label6"
	  Tab(2).ControlCount=   4
	  TabCaption(3)   =   "I&TX Format"
	  TabPicture(3)   =   "Form1.frx":0054
	  Tab(3).ControlEnabled=   0   'False
	  Tab(3).Control(0)=   "label"
	  Tab(3).Control(1)=   "Label7"
	  Tab(3).Control(2)=   "Label9"
	  Tab(3).Control(3)=   "m_sAnalysisMarkers"
	  Tab(3).Control(4)=   "m_sInterlinearWordMarker"
	  Tab(3).Control(5)=   "RetrieveIntergen"
	  Tab(3).ControlCount=   6
	  TabCaption(4)   =   "&Text Format"
	  TabPicture(4)   =   "Form1.frx":0070
	  Tab(4).ControlEnabled=   0   'False
	  Tab(4).Control(0)=   "m_bIncludeTheseMarkers(0)"
	  Tab(4).Control(1)=   "m_sTextMarkers"
	  Tab(4).Control(2)=   "m_bIncludeTheseMarkers(1)"
	  Tab(4).Control(3)=   "RetrieveTextIn"
	  Tab(4).Control(4)=   "Label5"
	  Tab(4).Control(5)=   "Label4"
	  Tab(4).Control(6)=   "Label3"
	  Tab(4).ControlCount=   7
	  Begin VB.CommandButton RetrieveIntergen
		 Caption         =   "Load From Current CarlaStudio Settings"
		 Height          =   495
		 Left            =   -70440
		 TabIndex        =   35
		 Top             =   3480
		 Width           =   1695
	  End
	  Begin VB.TextBox m_sInterlinearWordMarker
		 Height          =   375
		 Left            =   -69840
		 TabIndex        =   33
		 Text            =   "Text1"
		 Top             =   1200
		 Width           =   1095
	  End
	  Begin VB.OptionButton m_bIncludeTheseMarkers
		 Caption         =   "begin &with"
		 Height          =   375
		 Index           =   0
		 Left            =   -73320
		 TabIndex        =   29
		 Top             =   1080
		 Width           =   2295
	  End
	  Begin VB.TextBox m_sTextMarkers
		 Height          =   375
		 Left            =   -73320
		 TabIndex        =   28
		 Text            =   "Text2"
		 Top             =   2160
		 Width           =   3135
	  End
	  Begin VB.OptionButton m_bIncludeTheseMarkers
		 Caption         =   "&do not begin with"
		 Height          =   375
		 Index           =   1
		 Left            =   -73320
		 TabIndex        =   27
		 Top             =   1440
		 Width           =   2295
	  End
	  Begin VB.CommandButton RetrieveTextIn
		 Caption         =   "Load From Current CarlaStudio Settings"
		 Height          =   495
		 Left            =   -69840
		 TabIndex        =   26
		 Top             =   2160
		 Width           =   1695
	  End
	  Begin VB.CheckBox m_bAlreadyInterlinearized
		 Caption         =   "This file is alread&y interlinearized"
		 Height          =   255
		 Left            =   480
		 TabIndex        =   25
		 Top             =   2040
		 Width           =   2775
	  End
	  Begin VB.ComboBox m_sSrcLanguageCombo
		 Height          =   315
		 Left            =   1920
		 TabIndex        =   15
		 Text            =   "Combo1"
		 Top             =   1440
		 Width           =   3255
	  End
	  Begin VB.TextBox m_sAnalysisMarkers
		 Height          =   375
		 Left            =   -74280
		 TabIndex        =   14
		 Text            =   "Text3"
		 Top             =   2280
		 Width           =   5535
	  End
	  Begin VB.ComboBox m_sTargetLanguageCombo
		 Height          =   315
		 ItemData        =   "Form1.frx":008C
		 Left            =   -71760
		 List            =   "Form1.frx":008E
		 TabIndex        =   11
		 Text            =   "Combo1"
		 Top             =   2040
		 Width           =   2775
	  End
	  Begin VB.CommandButton btnBrowseOutputPath
		 Caption         =   "B&rowse..."
		 Enabled         =   0   'False
		 Height          =   375
		 Left            =   -70080
		 TabIndex        =   8
		 Top             =   2820
		 Width           =   1215
	  End
	  Begin VB.TextBox m_sDesiredOutputPath
		 Enabled         =   0   'False
		 Height          =   375
		 Left            =   -73080
		 TabIndex        =   7
		 Text            =   "Text2"
		 Top             =   2820
		 Width           =   2775
	  End
	  Begin VB.TextBox m_sInputPath
		 Height          =   315
		 Left            =   1920
		 TabIndex        =   3
		 Text            =   "Text1"
		 Top             =   900
		 Width           =   3255
	  End
	  Begin VB.CommandButton btnBrowseInputPath
		 Caption         =   "&Browse..."
		 Height          =   375
		 Left            =   5280
		 TabIndex        =   1
		 Top             =   900
		 Width           =   1215
	  End
	  Begin VB.Frame Frame1
		 Caption         =   "What do you want to produce?"
		 Height          =   1335
		 Left            =   -74640
		 TabIndex        =   12
		 Top             =   1200
		 Width           =   6135
		 Begin VB.OptionButton m_nGoal
			Caption         =   "A te&xt in this language"
			Height          =   255
			Index           =   2
			Left            =   360
			TabIndex        =   18
			Top             =   840
			Width           =   2055
		 End
		 Begin VB.OptionButton m_nGoal
			Caption         =   "A gloss&ed interlinear file"
			Height          =   255
			Index           =   1
			Left            =   360
			TabIndex        =   17
			Top             =   480
			Width           =   2055
		 End
	  End
	  Begin VB.Frame Frame2
		 Caption         =   "Where do you want CarlaStudio to place the resulting file?"
		 Height          =   2895
		 Left            =   -74640
		 TabIndex        =   19
		 Top             =   960
		 Width           =   6135
		 Begin VB.OptionButton m_nOutputOption
			Caption         =   "Rep&lace the input file (re-interlinearization)"
			Height          =   255
			Index           =   1
			Left            =   600
			TabIndex        =   22
			Top             =   600
			Width           =   3735
		 End
		 Begin VB.OptionButton m_nOutputOption
			Caption         =   "I&n the same folder as the input"
			Height          =   255
			Index           =   2
			Left            =   600
			TabIndex        =   21
			Top             =   960
			Width           =   3255
		 End
		 Begin VB.OptionButton m_nOutputOption
			Caption         =   "In &a file at this path:"
			Height          =   375
			Index           =   3
			Left            =   600
			TabIndex        =   20
			Top             =   1320
			Width           =   1695
		 End
		 Begin VB.Label Label8
			Caption         =   "Example: C:\documents\foo.txt"
			Height          =   255
			Left            =   1920
			TabIndex        =   23
			Top             =   2280
			Width           =   2655
		 End
	  End
	  Begin VB.Label Label9
		 Caption         =   "Marker of the word line, containing text that will be parsed:"
		 Height          =   255
		 Left            =   -74280
		 TabIndex        =   34
		 Top             =   1200
		 Width           =   4335
	  End
	  Begin VB.Label Label5
		 Caption         =   "Separate with spaces, include backslashes."
		 Height          =   255
		 Left            =   -73320
		 TabIndex        =   32
		 Top             =   2760
		 Width           =   3135
	  End
	  Begin VB.Label Label4
		 Caption         =   "Lines that should be parsed"
		 Height          =   255
		 Left            =   -74640
		 TabIndex        =   31
		 Top             =   840
		 Width           =   2055
	  End
	  Begin VB.Label Label3
		 Caption         =   "these markers:"
		 Height          =   255
		 Left            =   -73320
		 TabIndex        =   30
		 Top             =   1800
		 Width           =   1215
	  End
	  Begin VB.Label Label7
		 Caption         =   "Separate with spaces, omit back slashes."
		 Height          =   255
		 Left            =   -71880
		 TabIndex        =   16
		 Top             =   2640
		 Width           =   3135
	  End
	  Begin VB.Label label
		 Caption         =   "Markers of existing analysis lines that will be removed or replaced:"
		 Height          =   255
		 Left            =   -74280
		 TabIndex        =   13
		 Top             =   1920
		 Width           =   5895
	  End
	  Begin VB.Label Label6
		 Caption         =   "Where do you want CarlaStudio to put the files it outputs?"
		 Height          =   375
		 Left            =   -74520
		 TabIndex        =   6
		 Top             =   1020
		 Width           =   5415
	  End
	  Begin VB.Label Label2
		 Caption         =   "Language:"
		 Height          =   375
		 Left            =   600
		 TabIndex        =   5
		 Top             =   1500
		 Width           =   1215
	  End
	  Begin VB.Label Label1
		 Caption         =   "Input File:"
		 Height          =   375
		 Left            =   600
		 TabIndex        =   4
		 Top             =   900
		 Width           =   1455
	  End
   End
   Begin VB.Label m_sMessage
	  ForeColor       =   &H8000000D&
	  Height          =   285
	  Left            =   360
	  TabIndex        =   36
	  Top             =   4440
	  Width           =   7095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Revision History
'   May 199 JDH Created
'   Additional files: CStudio.exe, CSAutomationLib
'               TABCTL32.OCX in System or System32 directory
' This project relies on the COM Object CSAutomationlib.taskImpl, which is
' written in C++.
' A Task provides two services:
'   1) it holds our settings (various buttons and paths) in-between runs
'           it is saved in a "task file" whose name is a functions of the
'           input file name, so we can retrieve the settings the user had
'           for a given file.  Also, the last used task file is used if
'           the user doesn't supply a path to the input file.  THus, this
'           app remembers all the settings for the last time you used it.
'  2) A task com object serves as our connection to CarlaStudio.  When
'        it is created a task object finds carlastudio and launches it if
'       it's not already running

' To do:
'   Make work with paratext (input param and output location)
'   Make use last settings as default when making a new task

Public m_Task As CSAUTOMATIONLib.TaskImpl
Public m_sTaskPath As String    ' where this m_Task is saved for future use

Private Sub inputPathChanged()
	Dim fs As New FileSystemObject
	If Not fs.FileExists(cmd) Then
		m_sMessage = "File Not Found"
		Go.Enabled = False
		Exit Sub
	Else
		m_sMessage = ""
	End If

	If InStr(m_sInputPath, ".itx") Then
		 m_bAlreadyInterlinearized = 1
		 m_nGoal(1) = True ' interlinearize rather than transfer
		 m_nOutputOption(1) = True 'csReplaceInput
	Else
		m_bAlreadyInterlinearized = 0
		m_nOutputOption(2) = True   'in same folder
	End If
	updateEnabledStates
End Sub
Private Sub btnBrowseInputPath_Click()
	With Me.CommonDialog
		.FileName = Me.m_sInputPath
		.Filter = "Text & Interlinear Files(*.txt, *.itx)|*.txt;*.itx|All Files(*.*)|*.*"
		.Flags = cdlOFNFileMustExist Or cdlOFNHideReadOnly
		.DialogTitle = "Choose the file to process"
		.CancelError = True
		On Error GoTo finish
		.ShowOpen
		Me.m_sInputPath = .FileName

		inputPathChanged
	End With
finish:
	On Error GoTo 0 ' restore normal error handling
End Sub


Private Sub btnBrowseOutputPath_Click()
	With Me.CommonDialog
		.FileName = Me.m_sDesiredOutputPath
		.Filter = "Text Files(*.txt)|*.txt|Interlinear Files(*.itx)|*.itx|All Files(*.*)|*.*"
		.Flags = cdlOFNHideReadOnly
		.DialogTitle = "Choose the file to process"
		.CancelError = True
		On Error GoTo theEnd
		.ShowOpen
		Me.m_sDesiredOutputPath = .FileName
	End With
theEnd:
	On Error GoTo 0 ' restore normal error handling
End Sub

Private Sub Form_Load()
	SSTab.Tab = 0
	m_chkLeaveRunning = GetSetting(App.Title, "Settings", "LeaveRunning")


	Dim sTaskPath As String
	m_sInputPath = ""

	' FIRST, TRY TO GET THE INPUT PATH FROM THE COMMMAND-LINE
	Dim cmd As String
	cmd = Command()
	Trim (cmd)
	If Len(cmd) > 0 Then

		Dim fs As New FileSystemObject

		' this is a hack to try to stip off quotes
		' I haven't figured out how to make vb let me express a quote mark
		If Not fs.FileExists(cmd) Then
			s = Mid(cmd, 2, Len(cmd) - 2)
		Else
			s = cmd
		End If

		If fs.FileExists(s) Then
			m_sInputPath = s
			sTaskPath = InputPathToTaskPath(m_sInputPath)
			' do we have a task file for this input file?
			If Not fs.FileExists(sTaskPath) Then
				sTaskPath = ""  ' clear it
			Else
				inputPathChanged
			End If
		Else
			MsgBox ("Couldn't find the file " & cmd)
		End If
	End If

	' IF THAT DIDN'T WORK, TRY GETTING THE PATH TO THE TASK FILE FROM THE REGISTRY

	If 0 = Len(m_sInputPath) Then
		sTaskPath = GetSetting(App.Title, "Settings", "LastTaskPath")
	End If

	If Len(sTaskPath) Then
		LoadTaskFile (sTaskPath)
	Else    ' IF WE STILL DON'T KNOW WHAT WE'RE DOING, MAKE A BLANK TASK
		MakeNewTask (m_sInputPath) 'path may be empty
	End If

  ' make sure we're in front
  AppActivate App.Title
End Sub
' assumes that if sInputPath is given, then the caller has verified that
'   that file exists.
Private Sub MakeNewTask(Optional sInputPath As String)
On Error GoTo failedNew
	Set Me.m_Task = New TaskImpl
	On Error GoTo 0
	If Len(sInputPath) > 0 Then
		m_Task.InputPath = sInputPath
	End If
	'setup defaults
	LoadFromTask    ' have to get the list of languages b4 we can retrieve any defaults
	FillInTask      ' now put in the default language choices
	m_Task.RetrieveIntergenSettings 'so we can call this
	m_Task.RetrieveTextInSettings
	LoadFromTask    ' now show these values in the dialog
	On Error GoTo 0
	Exit Sub
failedNew:
	Call MsgBox("There was a problem connecting to CarlaStudio." & vbCrLf & Err.Description, vbExclamation)
	On Error GoTo 0 ' cancel error handling
	Unload Me
End Sub
Private Sub LoadTaskFile(sPath As String)
	On Error GoTo failedNew

	' this can cause cstudio to run
	Set Me.m_Task = New TaskImpl
	' this will make us front-most again
	AppActivate App.Title

	On Error GoTo failedLoad
	Me.m_Task.Load (sPath)
	LoadFromTask
	m_sTaskPath = sPath
	On Error GoTo 0 ' cancel error handling

	Exit Sub
failedNew:
	Call MsgBox("There was a problem connecting to CarlaStudio." & vbCrLf & Err.Description, vbExclamation)
	On Error GoTo 0 ' cancel error handling
	Unload Me
failedLoad:
	Call MsgBox("There was a problem opening the settings for this file. This can happen if they were saved under an older version of csBridge.", vbExclamation)
	MakeNewTask
	On Error GoTo 0 ' cancel error handling
End Sub
Private Sub LoadLanguageCombo(sChoiceList As String, combo As ComboBox, sCurrentValue As String)
   Dim sc As String
   Dim start As Integer
   Dim nextLoc As Integer
   Dim i As Integer

   combo.Clear

   start = 1
   For i = 1 To 20

	   nextLoc = InStr(start, sChoiceList, ",")
	   If nextLoc > 0 Then
		   sc = Mid(sChoiceList, start, nextLoc - start)
	   Else
		   sc = Mid(sChoiceList, start, Len(sChoiceList))
	   End If
	   start = nextLoc + 1
	   combo.AddItem (sc)
	   If sc = sCurrentValue Then
		   combo.ListIndex = i - 1 'list is 0-based
	   End If
	   If nextLoc = 0 Then
		   Exit For
	   End If
   Next

   ' if a match was not found, use the first language
   If (combo.ListIndex = -1) Then
	combo.ListIndex = 0
   End If
End Sub
' Fill in our dialog with values from the task object
Private Sub LoadFromTask()
	With Me.m_Task
		m_sInputPath = .InputPath
		m_sDesiredOutputPath = .DesiredOutputPath
		m_sAnalysisMarkers = .AnalysisMarkers
		m_sInterlinearWordMarker = .InterlinearWordMarker
		m_sTextMarkers = .MarkersToIncludeOrExclude
		m_bAlreadyInterlinearized = .InputIsInterlinear

		Dim sCodes As String
		sCodes = .LangCodesString
		Call LoadLanguageCombo(sCodes, m_sSrcLanguageCombo, .SourceLangCode)
		Call LoadLanguageCombo(sCodes, m_sTargetLanguageCombo, .TargetLangCode)

		Select Case .Goal
			Case csGlossedInterlinear
				Me.m_nGoal(1) = True
			Case csTargetText
				Me.m_nGoal(2) = True
			Case Else
				Me.m_nGoal(1) = True
		End Select

		Select Case .OutputLocation
			Case csReplaceInput
				Me.m_nOutputOption(1) = True
			Case csSameFolderAsInput
				Me.m_nOutputOption(2) = True
			Case csSpecifiedPath
				Me.m_nOutputOption(3) = True
		End Select

		If .IncludeLinesWithSpecifiedMarkers Then
			Me.m_bIncludeTheseMarkers(0) = True
		Else
			Me.m_bIncludeTheseMarkers(1) = True
		End If
	End With

	updateEnabledStates
End Sub

' Fill in the task object with values from our dialog
Private Sub FillInTask()
	With Me.m_Task
		.InputPath = m_sInputPath
		.DesiredOutputPath = m_sDesiredOutputPath
		.AnalysisMarkers = m_sAnalysisMarkers
		.InterlinearWordMarker = m_sInterlinearWordMarker
		.MarkersToIncludeOrExclude = m_sTextMarkers
		.SourceLangCode = Me.m_sSrcLanguageCombo
		.TargetLangCode = Me.m_sTargetLanguageCombo
		If m_nGoal(1) Then
			.Goal = csGlossedInterlinear
		Else
			.Goal = csTargetText
		End If

		If m_nOutputOption(1) Then
			.OutputLocation = csReplaceInput
		ElseIf m_nOutputOption(2) Then
			.OutputLocation = csSameFolderAsInput
		ElseIf m_nOutputOption(3) Then
			.OutputLocation = csSpecifiedPath
		End If

		.InputIsInterlinear = m_bAlreadyInterlinearized

		' this is true if the first radio button is on, else false
		.IncludeLinesWithSpecifiedMarkers = Me.m_bIncludeTheseMarkers(0)
	End With
End Sub

Private Sub SaveTask()
On Error GoTo Catch
FillInTask
	If Len(m_sInputPath) > 0 Then
		m_sTaskPath = InputPathToTaskPath(m_sInputPath)
		m_Task.Save (m_sTaskPath)
		SaveSetting App.Title, "Settings", "LastTaskPath", m_sTaskPath
	End If
Catch:
	DoCatch
End Sub
Private Function InputPathToTaskPath(sInputPath As String) As String
	'nb: any change to this algorithm must be duplicated in the CPP code of DOS bridge
	InputPathToTaskPath = sInputPath & ".csb"
End Function
Private Sub Cancel_Click()
	Unload Me
End Sub


Private Sub Form_Unload(Cancel As Integer)
  SaveSetting App.Title, "Settings", "LeaveRunning", m_chkLeaveRunning
End Sub

Private Sub Go_Click()

	SaveTask

   ' only exit if there were no errors
	Dim sOldCaption As String
	sOldCaption = Me.Caption
	Me.Caption = sOldCaption & " CarlaStudio is working..."
	On Error Resume Next

   m_Task.Perform

	' this will make us front-most again
	AppActivate App.Title

	Me.Caption = sOldCaption
	If Err = 0 Then
		If m_chkLeaveRunning = 0 Then
			 Unload Me
			Exit Sub
		End If
		m_sMessage = "CarlaStudio produced the file: " & m_Task.ActualOutputPath
	Else
		Call MsgBox("CarlaStudio had a problem.  It said '" & Err.Description & "'", vbExclamation)
	End If
  On Error GoTo 0 ' restore normal handling
End Sub

Private Sub m_bAlreadyInterlinearized_Click()
	updateEnabledStates
End Sub

' should be called whenever something may need to be greyed-out
Private Sub updateEnabledStates()
	'Are we ready to 'go'?
	m_sMessage = ""

	Dim bReady As Boolean
	bReady = True

	If Len(m_sInputPath) = 0 Then
		bReady = False
		m_sMessage = "Supply the path to the file you want to process"
	End If

	If m_bAlreadyInterlinearized And _
		(Len(m_sInterlinearWordMarker) = 0 Or _
			Len(m_sAnalysisMarkers) = 0 _
		) Then
		bReady = False
		m_sMessage = "Fill in the fields under the ITX Format tab"
	End If

	If (Not m_bAlreadyInterlinearized) And Len(m_sTextMarkers) = 0 Then
		bReady = False
		m_sMessage = "Fill in the fields under the Text Format tab"
	End If

	Go.Enabled = bReady

	If m_bAlreadyInterlinearized Then
		Me.SSTab.TabEnabled(3) = True
		Me.SSTab.TabEnabled(4) = False
		m_nOutputOption(1).Enabled = True
	Else
		Me.SSTab.TabEnabled(3) = False
		Me.SSTab.TabEnabled(4) = True
		m_nOutputOption(1).Enabled = False
	End If

	m_sAnalysisMarkers.Enabled = m_bAlreadyInterlinearized
	RetrieveIntergen.Enabled = m_bAlreadyInterlinearized

	If m_nOutputOption(3) Then
		m_sDesiredOutputPath.Enabled = True
		btnBrowseOutputPath.Enabled = True
		m_sDesiredOutputPath.BackColor = &H80000005
	Else
		m_sDesiredOutputPath.Enabled = False
		btnBrowseOutputPath.Enabled = False
		m_sDesiredOutputPath.BackColor = &H80000016
	End If
	If m_bAlreadyInterlinearized Then
	   m_sAnalysisMarkers.BackColor = &H80000005
	Else
	   m_sAnalysisMarkers.BackColor = &H80000016
	End If
End Sub

Private Sub m_nOutputOption_Click(Index As Integer)
	updateEnabledStates
End Sub

Private Sub m_sAnalysisMarkers_Change()
	updateEnabledStates
End Sub

Private Sub m_sInputPath_Change()
	inputPathChanged
End Sub

Private Sub m_sInterlinearWordMarker_Change()
	updateEnabledStates
End Sub

Private Sub m_sTextMarkers_Change()
	updateEnabledStates
End Sub

Private Sub RetrieveIntergen_Click()
 On Error GoTo Catch
	FillInTask
	m_Task.RetrieveIntergenSettings
	LoadFromTask
Catch:
	DoCatch
	updateEnabledStates
End Sub

Private Sub RetrieveTextIn_Click()
On Error GoTo Catch
	FillInTask
	m_Task.RetrieveTextInSettings
	LoadFromTask
Catch:
	DoCatch
	updateEnabledStates
End Sub

'can safely be called even if there is no error
Private Sub DoCatch()
	If Err.Number = 0 Then
		On Error GoTo 0
		Exit Sub
	End If

	MsgBox (Err.Description)
	On Error GoTo 0
End Sub
