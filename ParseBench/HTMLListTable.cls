VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "HTMLListTable"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Dim WithEvents tb As HTMLTable
Attribute tb.VB_VarHelpID = -1
Public m_selectedWordPos As String
Public sortField1 As String
Public bAscending As Boolean

Event RowSelected(nWordPos As Long)
Event ColumnClicked()

Public Sub HTMLListTable_setTable(t As Object)
	Set tb = t
End Sub
Public Function countRows() As Integer
 countRows = tb.rows.length - 1
End Function
' this is called when the list needs to be redisplayed, and so we will need to get another handle on the table.
 ' note that we do not clear the sorting specifications
Public Sub HTMLListTable_clear()
	Set tb = Nothing
	selectedWordPos = ""
End Sub

' unfortunately, I am using this event for different things, as I have not learned to catch individual scriptlet events
Private Sub tb_onpropertychange()
   If tb.eventType = "RowSelect" Then
		'If m_selectedWordPos <> tb.selectedWordPos Then
			m_selectedWordPos = tb.selectedWordPos
			'MsgBox selectedWordPos
			RaiseEvent RowSelected(Val(m_selectedWordPos))
	   ' End If
   ElseIf tb.eventType = "HeaderClick" Then
		If Me.sortField1 = tb.sortField1 Then ' a second clicked reverses the direction
			bAscending = Not bAscending
		ElseIf tb.sortField1 = "@form" Then
			bAscending = True 'default with A->Z ordering on the form
		Else
			bAscending = False 'default with big->small ordering on all the number fields
		End If
		Me.sortField1 = tb.sortField1
		RaiseEvent ColumnClicked
	End If

End Sub
