VERSION 5.00
Begin VB.Form frmSplash
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   4710
   ClientLeft      =   45
   ClientTop       =   45
   ClientWidth     =   7455
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4710
   ScaleWidth      =   7455
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.Frame fraMainFrame
	  Height          =   4590
	  Left            =   120
	  TabIndex        =   0
	  Top             =   0
	  Width           =   7380
	  Begin VB.PictureBox picLogo
		 Height          =   540
		 Left            =   480
		 Picture         =   "frmSplash.frx":0000
		 ScaleHeight     =   480
		 ScaleWidth      =   480
		 TabIndex        =   1
		 Top             =   855
		 Width           =   540
	  End
	  Begin VB.Label lblProductName
		 AutoSize        =   -1  'True
		 Caption         =   "ParseBench"
		 BeginProperty Font
			Name            =   "MS Sans Serif"
			Size            =   29.25
			Charset         =   0
			Weight          =   700
			Underline       =   0   'False
			Italic          =   0   'False
			Strikethrough   =   0   'False
		 EndProperty
		 Height          =   720
		 Left            =   2670
		 TabIndex        =   6
		 Tag             =   "Product"
		 Top             =   1200
		 Width           =   3495
	  End
	  Begin VB.Label lblCompanyProduct
		 AutoSize        =   -1  'True
		 Caption         =   "SIL"
		 BeginProperty Font
			Name            =   "MS Sans Serif"
			Size            =   18
			Charset         =   0
			Weight          =   700
			Underline       =   0   'False
			Italic          =   0   'False
			Strikethrough   =   0   'False
		 EndProperty
		 Height          =   435
		 Left            =   2505
		 TabIndex        =   5
		 Tag             =   "CompanyProduct"
		 Top             =   765
		 Width           =   585
	  End
	  Begin VB.Label lblVersion
		 Alignment       =   1  'Right Justify
		 AutoSize        =   -1  'True
		 Caption         =   "Version 0.0"
		 BeginProperty Font
			Name            =   "MS Sans Serif"
			Size            =   12
			Charset         =   0
			Weight          =   700
			Underline       =   0   'False
			Italic          =   0   'False
			Strikethrough   =   0   'False
		 EndProperty
		 Height          =   300
		 Left            =   4680
		 TabIndex        =   4
		 Tag             =   "Version"
		 Top             =   2760
		 Width           =   1380
	  End
	  Begin VB.Label lblCompany
		 Caption         =   "SIL"
		 Height          =   255
		 Left            =   4710
		 TabIndex        =   3
		 Tag             =   "Company"
		 Top             =   3330
		 Width           =   2415
	  End
	  Begin VB.Label lblCopyright
		 Caption         =   "Copyright 2000"
		 Height          =   255
		 Left            =   4710
		 TabIndex        =   2
		 Tag             =   "Copyright"
		 Top             =   3120
		 Width           =   2415
	  End
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
	lblVersion.Caption = "Version " & App.Major & "." & App.Minor & "." & App.Revision
	lblProductName.Caption = App.Title
End Sub
