VERSION 5.00
Begin VB.Form dlgLangName
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Language Name"
   ClientHeight    =   2205
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6960
   Icon            =   "dlgLangName.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2205
   ScaleWidth      =   6960
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtLangAbbr
	  Height          =   375
	  Left            =   2160
	  TabIndex        =   3
	  Text            =   "abbr"
	  Top             =   960
	  Width           =   475
   End
   Begin VB.TextBox txtLangName
	  Height          =   375
	  Left            =   2160
	  TabIndex        =   0
	  Text            =   "Language Name"
	  Top             =   360
	  Width           =   4575
   End
   Begin VB.CommandButton CancelButton
	  Cancel          =   -1  'True
	  Caption         =   "Cancel"
	  Height          =   375
	  Left            =   5640
	  TabIndex        =   6
	  Top             =   1680
	  Width           =   1215
   End
   Begin VB.CommandButton OKButton
	  Caption         =   "OK"
	  Default         =   -1  'True
	  Height          =   375
	  Left            =   4320
	  TabIndex        =   5
	  Top             =   1680
	  Width           =   1215
   End
   Begin VB.Label Label3
	  Caption         =   "(Up to three letters)"
	  Height          =   255
	  Left            =   2900
	  TabIndex        =   4
	  Top             =   960
	  Width           =   2055
   End
   Begin VB.Label Label2
	  Caption         =   "Language &Abbreviation:"
	  Height          =   255
	  Left            =   120
	  TabIndex        =   2
	  Top             =   960
	  Width           =   1695
   End
   Begin VB.Label Label1
	  Caption         =   "Language &Name:"
	  Height          =   255
	  Left            =   120
	  TabIndex        =   1
	  Top             =   360
	  Width           =   1575
   End
End
Attribute VB_Name = "dlgLangName"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub CancelButton_Click()
	Me.txtLangName = "-1"
	'Unload Me
	Me.Hide
End Sub

Private Sub OKButton_Click()
	'Unload Me
	Me.Hide
End Sub
