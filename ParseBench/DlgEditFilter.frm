VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form DlgEditFilter
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Edit Filter..."
   ClientHeight    =   4770
   ClientLeft      =   2745
   ClientTop       =   1725
   ClientWidth     =   7980
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4770
   ScaleWidth      =   7980
   ShowInTaskbar   =   0   'False
   Begin TabDlg.SSTab SSTabFilter
	  Height          =   4455
	  Left            =   240
	  TabIndex        =   0
	  Top             =   120
	  Width           =   7455
	  _ExtentX        =   13150
	  _ExtentY        =   7858
	  _Version        =   393216
	  Tabs            =   2
	  TabHeight       =   520
	  TabCaption(0)   =   "Query Builder"
	  TabPicture(0)   =   "DlgEditFilter.frx":0000
	  Tab(0).ControlEnabled=   -1  'True
	  Tab(0).Control(0)=   "Label6"
	  Tab(0).Control(0).Enabled=   0   'False
	  Tab(0).Control(1)=   "Label7"
	  Tab(0).Control(1).Enabled=   0   'False
	  Tab(0).Control(2)=   "Label8"
	  Tab(0).Control(2).Enabled=   0   'False
	  Tab(0).Control(3)=   "txtStaticFilterComponents"
	  Tab(0).Control(3).Enabled=   0   'False
	  Tab(0).Control(4)=   "UpDown1"
	  Tab(0).Control(4).Enabled=   0   'False
	  Tab(0).Control(5)=   "cmbStaticBinaryOperator(0)"
	  Tab(0).Control(5).Enabled=   0   'False
	  Tab(0).Control(6)=   "cmbStaticField(0)"
	  Tab(0).Control(6).Enabled=   0   'False
	  Tab(0).Control(7)=   "txtStaticData(0)"
	  Tab(0).Control(7).Enabled=   0   'False
	  Tab(0).Control(8)=   "cmbStaticOperator(0)"
	  Tab(0).Control(8).Enabled=   0   'False
	  Tab(0).Control(9)=   "btnBuildQueryOK"
	  Tab(0).Control(9).Enabled=   0   'False
	  Tab(0).Control(10)=   "btnCancelQuery"
	  Tab(0).Control(10).Enabled=   0   'False
	  Tab(0).Control(11)=   "txtStaticLabel"
	  Tab(0).Control(11).Enabled=   0   'False
	  Tab(0).ControlCount=   12
	  TabCaption(1)   =   "Custom Query"
	  TabPicture(1)   =   "DlgEditFilter.frx":001C
	  Tab(1).ControlEnabled=   0   'False
	  Tab(1).Control(0)=   "sPrompt"
	  Tab(1).Control(1)=   "sLabel"
	  Tab(1).Control(2)=   "sQuery"
	  Tab(1).Control(3)=   "btnCancel"
	  Tab(1).Control(4)=   "btnOk"
	  Tab(1).Control(5)=   "Label5"
	  Tab(1).Control(6)=   "Label4"
	  Tab(1).Control(7)=   "Label3"
	  Tab(1).Control(8)=   "Label2"
	  Tab(1).Control(9)=   "Label1"
	  Tab(1).ControlCount=   10
	  Begin VB.TextBox txtStaticLabel
		 Height          =   285
		 Left            =   720
		 TabIndex        =   22
		 Top             =   480
		 Width           =   1095
	  End
	  Begin VB.CommandButton btnCancelQuery
		 Cancel          =   -1  'True
		 Caption         =   "&Cancel"
		 Height          =   375
		 Left            =   5520
		 TabIndex        =   18
		 Top             =   3840
		 Width           =   1215
	  End
	  Begin VB.CommandButton btnBuildQueryOK
		 Caption         =   "&OK"
		 Default         =   -1  'True
		 Height          =   375
		 Left            =   4240
		 TabIndex        =   17
		 Top             =   3840
		 Width           =   1215
	  End
	  Begin VB.TextBox sPrompt
		 Height          =   375
		 Left            =   -73320
		 TabIndex        =   11
		 Text            =   "Text1"
		 Top             =   2400
		 Width           =   4575
	  End
	  Begin VB.TextBox sLabel
		 Height          =   375
		 Left            =   -73320
		 TabIndex        =   10
		 Text            =   "slabel"
		 Top             =   720
		 Width           =   1695
	  End
	  Begin VB.TextBox sQuery
		 Height          =   375
		 Left            =   -73320
		 TabIndex        =   9
		 Text            =   "Text1"
		 Top             =   1320
		 Width           =   4575
	  End
	  Begin VB.CommandButton btnCancel
		 Caption         =   "&Cancel"
		 Height          =   375
		 Left            =   -69480
		 TabIndex        =   8
		 Top             =   3840
		 Width           =   1215
	  End
	  Begin VB.CommandButton btnOk
		 Caption         =   "&OK"
		 Height          =   375
		 Left            =   -70800
		 TabIndex        =   7
		 Top             =   3840
		 Width           =   1215
	  End
	  Begin VB.ComboBox cmbStaticOperator
		 Height          =   315
		 Index           =   0
		 ItemData        =   "DlgEditFilter.frx":0038
		 Left            =   4080
		 List            =   "DlgEditFilter.frx":0054
		 Style           =   2  'Dropdown List
		 TabIndex        =   6
		 Top             =   1200
		 Width           =   1455
	  End
	  Begin VB.TextBox txtStaticData
		 Height          =   285
		 Index           =   0
		 Left            =   5760
		 TabIndex        =   5
		 Top             =   1200
		 Width           =   1575
	  End
	  Begin VB.ComboBox cmbStaticField
		 Height          =   315
		 Index           =   0
		 ItemData        =   "DlgEditFilter.frx":0077
		 Left            =   2280
		 List            =   "DlgEditFilter.frx":0096
		 Style           =   2  'Dropdown List
		 TabIndex        =   4
		 Top             =   1200
		 Width           =   1575
	  End
	  Begin VB.ComboBox cmbStaticBinaryOperator
		 Height          =   315
		 Index           =   0
		 ItemData        =   "DlgEditFilter.frx":0106
		 Left            =   120
		 List            =   "DlgEditFilter.frx":0116
		 Style           =   2  'Dropdown List
		 TabIndex        =   3
		 Top             =   1200
		 Visible         =   0   'False
		 Width           =   2055
	  End
	  Begin MSComCtl2.UpDown UpDown1
		 Height          =   255
		 Left            =   1620
		 TabIndex        =   2
		 Top             =   840
		 Width           =   195
		 _ExtentX        =   344
		 _ExtentY        =   450
		 _Version        =   393216
		 Value           =   1
		 AutoBuddy       =   -1  'True
		 BuddyControl    =   "txtStaticFilterComponents"
		 BuddyDispid     =   196621
		 OrigLeft        =   1200
		 OrigTop         =   600
		 OrigRight       =   1395
		 OrigBottom      =   975
		 Max             =   9
		 Min             =   1
		 SyncBuddy       =   -1  'True
		 BuddyProperty   =   65547
		 Enabled         =   -1  'True
	  End
	  Begin VB.TextBox txtStaticFilterComponents
		 Height          =   285
		 Left            =   1200
		 TabIndex        =   1
		 Text            =   "1"
		 Top             =   840
		 Width           =   420
	  End
	  Begin VB.Label Label8
		 Caption         =   "Label:"
		 Height          =   255
		 Left            =   240
		 TabIndex        =   21
		 Top             =   480
		 Width           =   495
	  End
	  Begin VB.Label Label7
		 Caption         =   "Components:"
		 Height          =   255
		 Left            =   240
		 TabIndex        =   20
		 Top             =   840
		 Width           =   975
	  End
	  Begin VB.Label Label6
		 Caption         =   "Type PARAMETER in the data box to create a filter that will ask you for input every time you run it."
		 Height          =   375
		 Left            =   3360
		 TabIndex        =   19
		 Top             =   600
		 Width           =   3855
	  End
	  Begin VB.Label Label5
		 Caption         =   $"DlgEditFilter.frx":0134
		 Height          =   855
		 Left            =   -73320
		 TabIndex        =   16
		 Top             =   2880
		 Width           =   4575
	  End
	  Begin VB.Label Label4
		 Caption         =   "Prompt"
		 Height          =   375
		 Left            =   -74280
		 TabIndex        =   15
		 Top             =   2400
		 Width           =   735
	  End
	  Begin VB.Label Label3
		 Caption         =   "The actual XPATH that selects wordform is constructed by inserting this query here: /wfi/wfic[ QUERY-GOES-HERE ]"
		 Height          =   495
		 Left            =   -73320
		 TabIndex        =   14
		 Top             =   1800
		 Width           =   4455
	  End
	  Begin VB.Label Label2
		 Caption         =   "Query"
		 Height          =   375
		 Left            =   -74280
		 TabIndex        =   13
		 Top             =   1440
		 Width           =   855
	  End
	  Begin VB.Label Label1
		 Caption         =   "Label"
		 Height          =   255
		 Left            =   -74280
		 TabIndex        =   12
		 Top             =   720
		 Width           =   735
	  End
   End
End
Attribute VB_Name = "DlgEditFilter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public m_bOK As Boolean
Private StaticBinaryOperatorMaxIndex As Integer
Private StaticFieldMaxIndex As Integer
Private StaticOperatorMaxIndex As Integer
Private StaticDataMaxIndex As Integer
Public Sub ParseQuery(XMLQuery As String)
	Dim ComponentCount As Integer
	Dim ANDPosition As Integer
	Dim ORPosition As Integer
	Dim tmpString As String
	Dim tmpPartialString As String
	Dim Question_Pos As Integer
	Dim Paren_Pos As Integer
	Dim Tick_Pos As Integer
	Dim Start_Pos As Integer

	On Error GoTo CustomQuery
	ComponentCount = 0
	tmpString = XMLQuery
	Start_Pos = 1

	While (Len(tmpString) > 0)
		ComponentCount = ComponentCount + 1
		txtStaticFilterComponents.Text = Str$(ComponentCount)

		ANDPosition = InStr(Start_Pos, tmpString, " and ")
		ORPosition = InStr(Start_Pos, tmpString, " or ")

		If (ANDPosition < ORPosition Or (ORPosition = 0 And ANDPosition > 0)) And ANDPosition > 0 Then
			'we have an and, not an or
			tmpPartialString = Left$(tmpString, ANDPosition - 1)
			tmpString = Mid$(tmpString, ANDPosition)
		Else
			If ANDPosition = 0 And ORPosition = 0 Then
				'we have a single string component
				tmpPartialString = tmpString
				tmpString = ""

			Else
				'we have an or, not an and

				tmpPartialString = Left$(tmpString, ORPosition)
				tmpString = Mid$(tmpString, ORPosition)
			End If
		End If


			'which operator was used?
			If InStr(1, tmpPartialString, ">=") > 0 And InStr(1, tmpPartialString, "not") Then
					cmbStaticOperator(ComponentCount - 1).ListIndex = 2
					tmpPartialString = Strings.Replace(tmpPartialString, "not", "")
					tmpPartialString = Strings.Replace(tmpPartialString, ">=", "?")
			Else
				If InStr(1, tmpPartialString, ">") > 0 And InStr(1, tmpPartialString, "not") Then
					cmbStaticOperator(ComponentCount - 1).ListIndex = 4
					tmpPartialString = Strings.Replace(tmpPartialString, "not", "")
					tmpPartialString = Strings.Replace(tmpPartialString, ">", "? ")
				Else
					If InStr(1, tmpPartialString, "!=") > 0 Then
						cmbStaticOperator(ComponentCount - 1).ListIndex = 1
						tmpPartialString = Strings.Replace(tmpPartialString, "!=", "?")
					Else
						If InStr(1, tmpPartialString, ">=") > 0 Then
							cmbStaticOperator(ComponentCount - 1).ListIndex = 5
							tmpPartialString = Strings.Replace(tmpPartialString, ">=", "?")
						Else
							If InStr(1, tmpPartialString, ">") > 0 Then
								cmbStaticOperator(ComponentCount - 1).ListIndex = 3
								tmpPartialString = Strings.Replace(tmpPartialString, ">", "?")
							Else
								If InStr(1, tmpPartialString, "=") > 0 Then
									cmbStaticOperator(ComponentCount - 1).ListIndex = 0
									tmpPartialString = Strings.Replace(tmpPartialString, "=", "?")
								Else
									If InStr(1, tmpPartialString, "$ieq$") > 0 Then
										cmbStaticOperator(ComponentCount - 1).ListIndex = 6
										tmpPartialString = Strings.Replace(tmpPartialString, "$ieq$", "?")
									Else
										If InStr(1, tmpPartialString, "$ine$") > 0 Then
											cmbStaticOperator(ComponentCount - 1).ListIndex = 7
											tmpPartialString = Strings.Replace(tmpPartialString, "$ine$", "?")
										Else
											GoTo CustomQuery
										End If
									End If
								End If
							End If
						End If
					End If
				End If
			End If

		'figure out which binary operator is used and get rid of it
		If InStr(1, tmpPartialString, " and (not") > 0 Then
			cmbStaticBinaryOperator(ComponentCount - 1).ListIndex = 2
			tmpPartialString = Strings.Replace(tmpPartialString, " and (not", "")
		Else
			If InStr(1, tmpPartialString, " or (not") > 0 Then
				cmbStaticBinaryOperator(ComponentCount - 1).ListIndex = 3
				tmpPartialString = Strings.Replace(tmpPartialString, " or (not", "")
			Else
				If InStr(1, tmpPartialString, " or ") > 0 Then
					cmbStaticBinaryOperator(ComponentCount - 1).ListIndex = 1
					tmpPartialString = Strings.Replace(tmpPartialString, " or ", "")
				Else
					If InStr(1, tmpPartialString, " and ") > 0 Then
						cmbStaticBinaryOperator(ComponentCount - 1).ListIndex = 0
						tmpPartialString = Strings.Replace(tmpPartialString, " and ", "")
					End If
				End If
			End If
		End If

		'get rid of parenthesis
		Paren_Pos = InStr(1, tmpPartialString, "(")
		While Paren_Pos > 0
			tmpPartialString = Strings.Replace(tmpPartialString, "(", "")
			Paren_Pos = InStr(1, tmpPartialString, "(")
		Wend

		Paren_Pos = InStr(1, tmpPartialString, ")")
		While Paren_Pos > 0
			tmpPartialString = Strings.Replace(tmpPartialString, ")", "")
			Paren_Pos = InStr(1, tmpPartialString, ")")
		Wend

		'Get rid of tick marks
		Tick_Pos = InStr(1, tmpPartialString, "'")
		While Tick_Pos > 0
			tmpPartialString = Strings.Replace(tmpPartialString, "'", "")
			Tick_Pos = InStr(1, tmpPartialString, "'")
		Wend

		'find our seperator between data and field
		'place data in box and get rid of it
		Question_Pos = InStr(1, tmpPartialString, "?")
		txtStaticData(ComponentCount - 1) = RTrim$(LTrim$(Mid$(tmpPartialString, Question_Pos + 1)))
		tmpPartialString = Left$(tmpPartialString, Question_Pos)

		'figure out which field we're using
		If InStr(1, tmpPartialString, "parses/parse/morph/@id") > 0 Then
			cmbStaticField(ComponentCount - 1).ListIndex = 5
		Else
			If InStr(1, tmpPartialString, "@finalcat") > 0 Then
				cmbStaticField(ComponentCount - 1).ListIndex = 4
			Else
				If InStr(1, tmpPartialString, "@goodness") > 0 Then
					cmbStaticField(ComponentCount - 1).ListIndex = 3
				Else
					If InStr(1, tmpPartialString, "@type") > 0 Then
						cmbStaticField(ComponentCount - 1).ListIndex = 6
					Else
						If InStr(1, tmpPartialString, "@allo") > 0 Then
							cmbStaticField(ComponentCount - 1).ListIndex = 7
						Else
							If InStr(1, tmpPartialString, "@cat") > 0 Then
								cmbStaticField(ComponentCount - 1).ListIndex = 8
							Else
								If InStr(1, tmpPartialString, "@id") > 0 Then
									cmbStaticField(ComponentCount - 1).ListIndex = 0
								Else
									If InStr(1, tmpPartialString, "@form") > 0 Then
										cmbStaticField(ComponentCount - 1).ListIndex = 1
									Else
										If InStr(1, tmpPartialString, "@freq") > 0 Then
											cmbStaticField(ComponentCount - 1).ListIndex = 2
										Else
											GoTo CustomQuery
										End If
									End If
								End If
							End If
						End If
					End If
				End If
			End If
		End If



		'If ANDPosition = 0 Then
		'    tmpPartialString = Left$(tmpString, ORPosition)
		'    tmpString = Mid$(tmpString, ORPosition + 3)
		'Else
		'    tmpPartialString = Left$(tmpString, ANDPosition)
		'    tmpString = Mid$(tmpString, ANDPosition + 3)
		'End If
		'If InStr(1, tmpPartialString, "or") > 0 Then
		'    ComponentCount = ComponentCount + 2
		'Else
		'    ComponentCount = ComponentCount + 1
		'End If

	Start_Pos = 3
	Wend

Exit Sub

CustomQuery:
   MsgBox "I'm sorry, I can't parse this.  You'll need to use custom query to edit this.", vbExclamation
	SSTabFilter.Tab = 1
	SSTabFilter.TabEnabled(0) = False
	sQuery.Text = XMLQuery

End Sub


Function BuildQuery() As String
	Dim i As Integer
	Dim tmpString As String
	Dim FilterString As String
	Dim not_position As Integer
	Dim Not_reversal As Integer

	FilterString = ""
	For i = 0 To Val(txtStaticFilterComponents.Text) - 1 Step 1
		Not_reversal = 0
		not_position = 0
		tmpString = " "
							' Fill in binary ops
		If i > 0 Then
			tmpString = tmpString & cmbStaticBinaryOperator(i).List(cmbStaticBinaryOperator(i).ListIndex) & " "
		End If

		'if we have a not, we need more parens
		not_position = InStr(1, tmpString, "not")
		If not_position > 0 Then
			tmpString = Left$(tmpString, not_position - 1) & "(" & Mid$(tmpString, not_position)
			tmpString = RTrim$(tmpString)
			tmpString = tmpString & "("
		Else
			tmpString = tmpString & " ("
		End If

				'hardcoded path names to the different attributes
				Select Case cmbStaticField(i).ListIndex
					Case 0:
						tmpString = tmpString & "@id "
					Case 1:
						tmpString = tmpString & "@form "
					Case 2:
						tmpString = tmpString & "@freq "
					Case 3:
						tmpString = tmpString & "parses/parse/@goodness "
					Case 4:
						tmpString = tmpString & "parses/parse/@finalcat "
					Case 5:
						tmpString = tmpString & "parses/parse/morph/@id "
					Case 6:
						tmpString = tmpString & "parses/parse/morph/@type "
					Case 7:
						tmpString = tmpString & "parses/parse/morph/@allo "
					Case 8:
						tmpString = tmpString & "parses/parse/morph/@cat "
				End Select

			 'this was to fill in the stuff for less than ops:  uses not > and not >=

			 If cmbStaticOperator(i).ListIndex = 2 Then         'uses not >= to sim. <
			   If i > 0 Then        'do we have an and or or?
				If cmbStaticBinaryOperator(i).ListIndex = 2 Or cmbStaticBinaryOperator(i).ListIndex = 3 Then    'take out a not
					Not_reversal = InStr(1, tmpString, "not")
					tmpString = Left$(tmpString, Not_reversal - 1) & Mid$(tmpString, Not_reversal + 4) & ">="
					Not_reversal = 0
					not_position = 0
				Else
					If cmbStaticBinaryOperator(i).ListIndex = 0 Then        'place a not in
						Not_reversal = InStr(1, tmpString, "and")
					Else
						Not_reversal = InStr(1, tmpString, "or")
					End If
					tmpString = Left$(tmpString, Not_reversal + 3) & "not( " & Mid$(tmpString, Not_reversal + 3)
					tmpString = tmpString & ">="
				End If
			  Else
				tmpString = "not(" & tmpString & ">="
				Not_reversal = 9
			  End If
			 Else
				If cmbStaticOperator(i).ListIndex = 4 Then      'same logic.  Uses not > to sim. <=
				  If i > 0 Then
					If cmbStaticBinaryOperator(i).ListIndex = 2 Or cmbStaticBinaryOperator(i).ListIndex = 3 Then
						Not_reversal = InStr(1, tmpString, "not")
						tmpString = Left$(tmpString, Not_reversal - 1) & Mid$(tmpString, Not_reversal + 4) & ">"
						Not_reversal = 0
						not_position = 0
					Else
						If cmbStaticBinaryOperator(i).ListIndex = 0 Then
							Not_reversal = InStr(1, tmpString, "and")
						Else
							Not_reversal = InStr(1, tmpString, "or")
						End If
						tmpString = Left$(tmpString, Not_reversal + 3) & "not( " & Mid$(tmpString, Not_reversal + 3)
						tmpString = tmpString & ">"
					End If
				  Else
					tmpString = "not(" & tmpString & ">"
					Not_reversal = 9
				  End If
				Else
					tmpString = tmpString & cmbStaticOperator(i).List(cmbStaticOperator(i).ListIndex) & " "
				End If
			 End If

			 'numeric vs. string data
			 If Val(txtStaticData(i).Text) = 0 Then
				tmpString = tmpString & " '" & txtStaticData(i).Text & "'"
			 Else
				tmpString = tmpString & " " & txtStaticData(i).Text
			 End If

			 'final paren for our not
			 If not_position > 0 Then
				tmpString = tmpString & ")"
			 End If

			 'final paren for our less than and less than equal
			 If Not_reversal > 0 Then
				tmpString = tmpString & ")"
			 End If

		FilterString = FilterString & tmpString & ") "
	Next i

   ' MsgBox FilterString         'for testing purposes
	BuildQuery = FilterString
End Function
Private Sub btnBuildQueryOK_Click()
	Dim i As Integer
	Dim okay As Boolean
	Dim FilterString As String
	okay = True
	cmbStaticBinaryOperator(0).ListIndex = 1

	If SSTabFilter.Tab = 1 Then
		btnOK_Click
		Exit Sub
	End If

	If txtStaticLabel.Text = "" Then
		okay = False
	End If



	For i = 0 To Val(txtStaticFilterComponents.Text) - 1 Step 1
		If cmbStaticBinaryOperator(i).ListIndex = -1 Then
			okay = False
			Exit For
	End If
		If cmbStaticField(i).ListIndex = -1 Then
			okay = False
			Exit For
		End If
		If cmbStaticOperator(i).ListIndex = -1 Then
			okay = False
			Exit For
		End If
		If txtStaticData(i).Text = "" Then
			okay = False
			Exit For
		End If
		If cmbStaticField(i).ListIndex = 3 Then
			If txtStaticData(i).Text = "good" Or txtStaticData(i).Text = "bad" Or txtStaticData(i).Text = "?" Then
				okay = True
			Else
				okay = False
				MsgBox "Acceptable data for Goodness = good, bad, ?", vbExclamation
				txtStaticData(i).SelStart = 0
				txtStaticData(i).SelLength = Len(txtStaticData(i).Text)
				txtStaticData(i).SetFocus

			End If
		End If
	Next i
	If okay Then

		m_bOK = True
		FilterString = BuildQuery
		sQuery.Text = FilterString
		sLabel.Text = txtStaticLabel.Text


		Me.Hide

	Else
		m_bOK = False
		MsgBox "Please Fill in All the fields!", vbExclamation
	End If




End Sub

Private Sub btnCancelQuery_Click()
	m_bOK = False
	Me.Hide
End Sub

Private Sub Form_Load()
	m_bOK = False
	updateButtons

End Sub


Private Sub btnCancel_Click()
	m_bOK = False
	Me.Hide
End Sub


Private Sub btnOK_Click()
	 m_bOK = True

	Me.Hide
End Sub


Private Sub sLabel_Change()
	updateButtons
End Sub

Private Sub sQuery_Change()
	updateButtons
End Sub
Private Sub updateButtons()
	btnOK.Enabled = (sLabel <> "") And (sQuery <> "")
End Sub





Private Sub SSTabFilter_Click(PreviousTab As Integer)
	Dim FilterString As String

	If PreviousTab = 0 Then
		FilterString = BuildQuery
		sQuery.Text = FilterString
	End If

End Sub

Private Sub txtStaticFilterComponents_Change()
 'Make a new row of components to add a new part to the query

	Dim tmpBinaryOperatorMax As Integer
	Dim tmpDataMax As Integer
	Dim tmpFieldMax As Integer
	Dim tmpOperatorMax As Integer

If Val(txtStaticFilterComponents.Text) > 9 Then txtStaticFilterComponents.Text = 9

	tmpBinaryOperatorMax = StaticBinaryOperatorMaxIndex
	tmpDataMax = StaticDataMaxIndex
	tmpFieldMax = StaticFieldMaxIndex
	tmpOperatorMax = StaticOperatorMaxIndex

  StaticBinaryOperatorMaxIndex = Val(txtStaticFilterComponents.Text) - 1
  If StaticBinaryOperatorMaxIndex < tmpBinaryOperatorMax Then
	Unload cmbStaticBinaryOperator(tmpBinaryOperatorMax)
  Else
	If StaticBinaryOperatorMaxIndex > tmpBinaryOperatorMax Then
		Load cmbStaticBinaryOperator(StaticBinaryOperatorMaxIndex)
		cmbStaticBinaryOperator(StaticBinaryOperatorMaxIndex).Top = cmbStaticBinaryOperator(StaticBinaryOperatorMaxIndex - 1).Top + 350
		cmbStaticBinaryOperator(StaticBinaryOperatorMaxIndex).Visible = True
		cmbStaticBinaryOperator(StaticBinaryOperatorMaxIndex).AddItem "and"
		cmbStaticBinaryOperator(StaticBinaryOperatorMaxIndex).AddItem "or"
		cmbStaticBinaryOperator(StaticBinaryOperatorMaxIndex).AddItem "and not"
		cmbStaticBinaryOperator(StaticBinaryOperatorMaxIndex).AddItem "or not"
	End If
  End If


  StaticDataMaxIndex = Val(txtStaticFilterComponents.Text) - 1
  If StaticDataMaxIndex < tmpDataMax Then
	Unload txtStaticData(tmpDataMax)
  Else
	If StaticDataMaxIndex > tmpDataMax Then
		Load txtStaticData(StaticDataMaxIndex)
		txtStaticData(StaticDataMaxIndex).Top = txtStaticData(StaticDataMaxIndex - 1).Top + 350
		txtStaticData(StaticDataMaxIndex).Visible = True
		txtStaticData(StaticDataMaxIndex).Text = ""
	End If
  End If



  StaticFieldMaxIndex = Val(txtStaticFilterComponents.Text) - 1
  If StaticFieldMaxIndex < tmpFieldMax Then
	Unload cmbStaticField(tmpFieldMax)
  Else
	If StaticFieldMaxIndex > tmpFieldMax Then
		Load cmbStaticField(StaticFieldMaxIndex)
		cmbStaticField(StaticFieldMaxIndex).Top = cmbStaticField(StaticFieldMaxIndex - 1).Top + 350
		cmbStaticField(StaticFieldMaxIndex).Visible = True
		cmbStaticField(StaticFieldMaxIndex).AddItem "WFIC Id"
		cmbStaticField(StaticFieldMaxIndex).AddItem "WFIC Form"
		cmbStaticField(StaticFieldMaxIndex).AddItem "WFIC Freq"
		cmbStaticField(StaticFieldMaxIndex).AddItem "PARSE Goodness"
		cmbStaticField(StaticFieldMaxIndex).AddItem "PARSE Finalcat"
		cmbStaticField(StaticFieldMaxIndex).AddItem "MORPH Id"
		cmbStaticField(StaticFieldMaxIndex).AddItem "MORPH Type"
		cmbStaticField(StaticFieldMaxIndex).AddItem "MORPH Allo"
		cmbStaticField(StaticFieldMaxIndex).AddItem "MORPH Cat"
	End If
  End If



  StaticOperatorMaxIndex = Val(txtStaticFilterComponents.Text) - 1
  If StaticOperatorMaxIndex < tmpOperatorMax Then
	Unload cmbStaticOperator(tmpOperatorMax)
  Else
	If StaticOperatorMaxIndex > tmpOperatorMax Then
		Load cmbStaticOperator(StaticOperatorMaxIndex)
		cmbStaticOperator(StaticOperatorMaxIndex).Top = cmbStaticOperator(StaticOperatorMaxIndex - 1).Top + 350
		cmbStaticOperator(StaticOperatorMaxIndex).Visible = True
		cmbStaticOperator(StaticOperatorMaxIndex).AddItem "="
		cmbStaticOperator(StaticOperatorMaxIndex).AddItem "!="
		cmbStaticOperator(StaticOperatorMaxIndex).AddItem "<"
		cmbStaticOperator(StaticOperatorMaxIndex).AddItem ">"
		cmbStaticOperator(StaticOperatorMaxIndex).AddItem "<="
		cmbStaticOperator(StaticOperatorMaxIndex).AddItem ">="
		cmbStaticOperator(StaticOperatorMaxIndex).AddItem "$ieq$"
		cmbStaticOperator(StaticOperatorMaxIndex).AddItem "$ine$"
	End If
  End If





End Sub
