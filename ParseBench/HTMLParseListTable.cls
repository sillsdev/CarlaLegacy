VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "HTMLParseListTable"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Dim WithEvents tb As HTMLTable
Attribute tb.VB_VarHelpID = -1
'Public selectedID As String
Event AnalysisGoodnessChanged(sWordID As String, sParseID As String)

Public Sub HTMLParseListTable_setTable(t As Object)
	Set tb = t
End Sub


Public Property Get scrollTop() As Integer
	scrollTop = tb.parentElement.scrollTop
End Property

Public Property Let scrollTop(nScrollTop As Integer)
	tb.parentElement.scrollTop = nScrollTop
End Property
Private Sub tb_onpropertychange()

	If tb.EventWordID = "" Or tb.EventParseID = "" Then Exit Sub
   Dim sParseID As String
	sParseID = tb.EventParseID
	RaiseEvent AnalysisGoodnessChanged(tb.EventWordID, sParseID)
' ********* to do: rewrite this to use word positions, rather than word IDs.
End Sub
