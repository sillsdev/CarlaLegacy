VERSION 5.00
Begin VB.Form Form1
   Caption         =   "Form1"
   ClientHeight    =   8310
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6885
   LinkTopic       =   "Form1"
   ScaleHeight     =   8310
   ScaleWidth      =   6885
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox sWFI
	  Height          =   3375
	  Left            =   120
	  MultiLine       =   -1  'True
	  TabIndex        =   1
	  Text            =   "test.frx":0000
	  Top             =   120
	  Width           =   6495
   End
   Begin VB.TextBox output
	  Height          =   4215
	  Left            =   120
	  MultiLine       =   -1  'True
	  TabIndex        =   0
	  Text            =   "test.frx":0006
	  Top             =   3840
	  Width           =   6495
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
 Dim x As New MSXML2.DOMDocument30 'MSXML2.XMLDocument
 x.async = False
 x.Load ("e:\dev\cs\alphaversion\cstudio\wordbench\wfi.xml")
 sWFI = x.xml
 'MsgBox x.root.tagName
 Dim w As MSXML2.IXMLDOMNode

 output = "" 'x.root.children.Item(0).tagName
 For Each w In x.selectNodes("wfi/WFIC")

	output = output + "\co " + w.Attributes.getNamedItem("form").Text + vbCrLf

	Dim analysis As MSXML2.IXMLDOMNode
	For Each analysis In w.selectNodes("parses/analysis")
		Dim orange As MSXML2.IXMLDOMNode
		Set orange = analysis.Attributes.getNamedItem("good")
		Dim goodness As String
		If orange Is Nothing Then
			goodness = "unknown"
		Else
			goodness = orange.Text
		End If



		If goodness = "false" Then
			output = output + "\rej "

			Dim morph As MSXML2.IXMLDOMNode
			For Each morph In analysis.selectNodes("morph")
				sType = morph.Attributes.getNamedItem("type").Text
				If sType = "s" Or sType = "i" Then
					output = output + "-"
				End If
				output = output + morph.Attributes.getNamedItem("id").Text
				If sType = "p" Or sType = "i" Then
					output = output + "-"
				End If
				output = output + " "
			Next
			output = output + vbCrLf
		End If
	Next
Next
End Sub
