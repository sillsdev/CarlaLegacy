Attribute VB_Name = "Module1"
Const LISTVIEW_MODE0 = "View Large Icons"
Global Const LISTVIEW_MODE1 = "View Small Icons"
Global Const LISTVIEW_MODE2 = "View List"
Global Const LISTVIEW_MODE3 = "View Details"
Public fMainForm As frmMain


Sub Main()
	frmSplash.Show
	frmSplash.Refresh
	Set fMainForm = New frmMain
	Load fMainForm
	Unload frmSplash


	fMainForm.Show
End Sub
