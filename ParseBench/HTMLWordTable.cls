VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "HTMLWordTable"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Dim WithEvents tb As HTMLTable
Attribute tb.VB_VarHelpID = -1
Public selectedID As String
Event AnalysisGoodnessChanged(sWordID As String, nAnalysisNumber As Integer, bGoodness As Boolean)

Public Sub HTMLWordTable_setTable(t As Object)
	Set tb = t
End Sub



Private Sub tb_onpropertychange()

	If selectedID <> tb.selectedID Then
		selectedID = tb.selectedID
		'MsgBox selectedID
		RaiseEvent AnalysisGoodnessChanged(tb.EventWordID, tb.EventAnalysisNumber, tb.EventGoodness)
	End If
End Sub
