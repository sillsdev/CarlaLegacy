VERSION 5.00
Begin VB.Form frmSplash
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   4245
   ClientLeft      =   255
   ClientTop       =   1410
   ClientWidth     =   7380
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "PAWSStarterSplash.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4245
   ScaleWidth      =   7380
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1
	  Height          =   4050
	  Left            =   240
	  TabIndex        =   0
	  Top             =   0
	  Width           =   7080
	  Begin VB.Image imgLogo
		 Height          =   2385
		 Left            =   360
		 Picture         =   "PAWSStarterSplash.frx":000C
		 Stretch         =   -1  'True
		 Top             =   795
		 Width           =   1815
	  End
	  Begin VB.Label lblCopyright
		 Caption         =   "Copyright © 2001"
		 BeginProperty Font
			Name            =   "Arial"
			Size            =   8.25
			Charset         =   0
			Weight          =   400
			Underline       =   0   'False
			Italic          =   0   'False
			Strikethrough   =   0   'False
		 EndProperty
		 Height          =   255
		 Left            =   4560
		 TabIndex        =   4
		 Top             =   3060
		 Width           =   2415
	  End
	  Begin VB.Label lblCompany
		 Caption         =   "SIL International"
		 BeginProperty Font
			Name            =   "Arial"
			Size            =   8.25
			Charset         =   0
			Weight          =   400
			Underline       =   0   'False
			Italic          =   0   'False
			Strikethrough   =   0   'False
		 EndProperty
		 Height          =   255
		 Left            =   4560
		 TabIndex        =   3
		 Top             =   3270
		 Width           =   2415
	  End
	  Begin VB.Label lblWarning
		 BeginProperty Font
			Name            =   "Arial"
			Size            =   8.25
			Charset         =   0
			Weight          =   400
			Underline       =   0   'False
			Italic          =   0   'False
			Strikethrough   =   0   'False
		 EndProperty
		 Height          =   195
		 Left            =   150
		 TabIndex        =   2
		 Top             =   3660
		 Width           =   6855
	  End
	  Begin VB.Label lblVersion
		 Alignment       =   1  'Right Justify
		 AutoSize        =   -1  'True
		 Caption         =   "Version 0.2.4 Alpha"
		 BeginProperty Font
			Name            =   "Arial"
			Size            =   12
			Charset         =   0
			Weight          =   700
			Underline       =   0   'False
			Italic          =   0   'False
			Strikethrough   =   0   'False
		 EndProperty
		 Height          =   285
		 Left            =   4680
		 TabIndex        =   5
		 Top             =   2700
		 Width           =   2190
	  End
	  Begin VB.Label lblPlatform
		 Alignment       =   1  'Right Justify
		 AutoSize        =   -1  'True
		 BeginProperty Font
			Name            =   "Arial"
			Size            =   15.75
			Charset         =   0
			Weight          =   700
			Underline       =   0   'False
			Italic          =   0   'False
			Strikethrough   =   0   'False
		 EndProperty
		 Height          =   360
		 Left            =   6765
		 TabIndex        =   6
		 Top             =   2340
		 Width           =   90
	  End
	  Begin VB.Label lblProductName
		 AutoSize        =   -1  'True
		 Caption         =   "PAWS"
		 BeginProperty Font
			Name            =   "Arial"
			Size            =   32.25
			Charset         =   0
			Weight          =   700
			Underline       =   0   'False
			Italic          =   0   'False
			Strikethrough   =   0   'False
		 EndProperty
		 Height          =   765
		 Left            =   2520
		 TabIndex        =   8
		 Top             =   1140
		 Width           =   1920
	  End
	  Begin VB.Label lblLicenseTo
		 Alignment       =   1  'Right Justify
		 BeginProperty Font
			Name            =   "Arial"
			Size            =   8.25
			Charset         =   0
			Weight          =   400
			Underline       =   0   'False
			Italic          =   0   'False
			Strikethrough   =   0   'False
		 EndProperty
		 Height          =   255
		 Left            =   120
		 TabIndex        =   1
		 Top             =   240
		 Width           =   6855
	  End
	  Begin VB.Label lblCompanyProduct
		 AutoSize        =   -1  'True
		 Caption         =   "Parser and Writer for Syntax"
		 BeginProperty Font
			Name            =   "Arial"
			Size            =   15.75
			Charset         =   0
			Weight          =   700
			Underline       =   0   'False
			Italic          =   0   'False
			Strikethrough   =   0   'False
		 EndProperty
		 Height          =   360
		 Left            =   2355
		 TabIndex        =   7
		 Top             =   705
		 Width           =   4290
	  End
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub Form_KeyPress(KeyAscii As Integer)
	Unload Me
End Sub

Private Sub Form_Load()
	lblVersion.Caption = "Version " & App.Major & "." & App.Minor & "." & App.Revision
	'lblProductName.Caption = App.Title
End Sub

Private Sub Frame1_Click()
	Unload Me
End Sub
