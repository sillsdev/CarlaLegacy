VERSION 5.00
Begin VB.Form frmDisplayOptions
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Display Options"
   ClientHeight    =   1875
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5250
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1875
   ScaleWidth      =   5250
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Tag             =   "Options"
   Begin VB.ComboBox comboWordsPerPage
	  Height          =   315
	  ItemData        =   "frmDisplayOptions.frx":0000
	  Left            =   1920
	  List            =   "frmDisplayOptions.frx":0019
	  TabIndex        =   8
	  Text            =   "Combo1"
	  Top             =   360
	  Width           =   2655
   End
   Begin VB.CommandButton cmdOK
	  Caption         =   "&OK"
	  Default         =   -1  'True
	  Height          =   375
	  Left            =   2640
	  TabIndex        =   0
	  Tag             =   "OK"
	  Top             =   1200
	  Width           =   1095
   End
   Begin VB.CommandButton cmdCancel
	  Cancel          =   -1  'True
	  Caption         =   "&Cancel"
	  Height          =   375
	  Left            =   3840
	  TabIndex        =   1
	  Tag             =   "Cancel"
	  Top             =   1215
	  Width           =   1095
   End
   Begin VB.PictureBox picOptions
	  BorderStyle     =   0  'None
	  Height          =   3780
	  Index           =   3
	  Left            =   -20000
	  ScaleHeight     =   3840.968
	  ScaleMode       =   0  'User
	  ScaleWidth      =   5745.64
	  TabIndex        =   3
	  TabStop         =   0   'False
	  Top             =   480
	  Width           =   5685
	  Begin VB.Frame fraSample4
		 Caption         =   "Sample 4"
		 Height          =   2022
		 Left            =   505
		 TabIndex        =   7
		 Tag             =   "Sample 4"
		 Top             =   502
		 Width           =   2033
	  End
   End
   Begin VB.PictureBox picOptions
	  BorderStyle     =   0  'None
	  Height          =   3780
	  Index           =   2
	  Left            =   -20000
	  ScaleHeight     =   3840.968
	  ScaleMode       =   0  'User
	  ScaleWidth      =   5745.64
	  TabIndex        =   5
	  TabStop         =   0   'False
	  Top             =   480
	  Width           =   5685
	  Begin VB.Frame fraSample3
		 Caption         =   "Sample 3"
		 Height          =   2022
		 Left            =   406
		 TabIndex        =   6
		 Tag             =   "Sample 3"
		 Top             =   403
		 Width           =   2033
	  End
   End
   Begin VB.PictureBox picOptions
	  BorderStyle     =   0  'None
	  Height          =   3780
	  Index           =   1
	  Left            =   -20000
	  ScaleHeight     =   3840.968
	  ScaleMode       =   0  'User
	  ScaleWidth      =   5745.64
	  TabIndex        =   2
	  TabStop         =   0   'False
	  Top             =   480
	  Width           =   5685
	  Begin VB.Frame fraSample2
		 Caption         =   "Sample 2"
		 Height          =   2022
		 Left            =   307
		 TabIndex        =   4
		 Tag             =   "Sample 2"
		 Top             =   305
		 Width           =   2033
	  End
   End
   Begin VB.Label Label1
	  Caption         =   "Words Per Page:"
	  Height          =   375
	  Left            =   360
	  TabIndex        =   9
	  Top             =   360
	  Width           =   1335
   End
End
Attribute VB_Name = "frmDisplayOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public m_nWordsPerPage As Integer
Public m_bOK As Boolean


Private Sub cmdCancel_Click()
	m_bOK = False
	Unload Me
End Sub


Private Sub cmdOK_Click()
	m_nWordsPerPage = comboWordsPerPage.Text
	If m_nWordsPerPage = 0 Then
		m_nWordsPerPage = 200
	End If
	m_bOK = True
	Unload Me
End Sub




Private Sub Form_Load()
	m_bOK = False
	If m_nWordsPerPage = 0 Then
		m_nWordsPerPage = 200
	End If
	comboWordsPerPage.Text = Str(m_nWordsPerPage)
End Sub
