VERSION 5.00
Begin VB.Form dlgTextSFM
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Text SFM Marker to Use in Examples"
   ClientHeight    =   3195
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6030
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   6030
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtTextSFM
	  Height          =   375
	  Left            =   2400
	  TabIndex        =   2
	  Text            =   "\t"
	  Top             =   1200
	  Width           =   1335
   End
   Begin VB.CommandButton CancelButton
	  Caption         =   "Cancel"
	  Height          =   375
	  Left            =   4680
	  TabIndex        =   1
	  Top             =   600
	  Width           =   1215
   End
   Begin VB.CommandButton OKButton
	  Caption         =   "OK"
	  Height          =   375
	  Left            =   4680
	  TabIndex        =   0
	  Top             =   120
	  Width           =   1215
   End
   Begin VB.Label Label1
	  Caption         =   "Enter the field code to use (include the backslash):"
	  Height          =   375
	  Left            =   240
	  TabIndex        =   3
	  Top             =   1200
	  Width           =   1935
   End
End
Attribute VB_Name = "dlgTextSFM"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Private Sub CancelButton_Click()
	Me.txtTextSFM = "-1"
	'Unload Me
	Me.Hide
End Sub

Private Sub OKButton_Click()
	'Unload Me
	Me.Hide
End Sub
