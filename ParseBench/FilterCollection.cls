VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "FilterCollection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"Filter"
Attribute VB_Ext_KEY = "Member0" ,"Filter"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
' this is a thin wrapper around the collection class, used to hold filters
Option Explicit
Private mCol As Collection
Public m_bModified As Boolean
Public m_sLoadedFromPath As String

Public Property Get NeedSaving(sPath As String) As Boolean
	NeedSaving = m_bModified Or (sPath <> m_sLoadedFromPath)
End Property

' returns True if the file was successfully read
Public Function LoadFromXMLFile(sPath As String) As Boolean
	Dim y As New MSXML2.DOMDocument30
	y.async = False
	y.Load sPath
	 If y.parseError.errorCode <> 0 Then
		MsgBox "There was a problem parsing in " + sPath + vbCrLf + y.parseError.reason + vbCrLf + sPath, vbExclamation
		LoadFromXMLFile = False
		Exit Function
	End If

	Set mCol = New Collection
	Dim nodes As IXMLDOMNodeList
	Set nodes = y.selectNodes("filters/filter")

	Dim n As MSXML2.IXMLDOMNode
	Dim f As Filter
	For Each n In nodes
		Set f = New Filter
		f.InitFromXMLNode n
		f.Key = "key" & Strings.Trim(Str(mCol.Count))
		mCol.Add f, f.Key
	Next
	m_sLoadedFromPath = sPath
	m_bModified = False
	LoadFromXMLFile = True
End Function
Public Sub Add(f As Filter)
	f.Key = "key" & Strings.Trim(Str(mCol.Count))
	mCol.Add f, f.Key
	m_bModified = True
End Sub
Public Sub Remove(f As Filter)
	mCol.Remove f.Key
	m_bModified = True
End Sub

Public Property Get Item(vntIndexKey As Variant) As Filter
Attribute Item.VB_UserMemId = 0
  Set Item = mCol(vntIndexKey)
End Property



Public Property Get Count() As Long
	Count = mCol.Count
End Property



Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
	Set NewEnum = mCol.[_NewEnum]
End Property


Private Sub Class_Initialize()
	Set mCol = New Collection
	m_bModified = False
End Sub


Private Sub Class_Terminate()
	'destroys collection when this class is terminated
	Set mCol = Nothing
End Sub

Public Sub Save(sPath As String)
	Dim fs As New FileSystemObject
	Dim fout As TextStream
	Set fout = fs.CreateTextFile(sPath)
	fout.WriteLine "<filters>"
	Dim f As Filter
	For Each f In mCol
		f.WriteToXMLFile fout
	Next f
	fout.WriteLine "</filters>"


	fout.Close
	m_bModified = False
End Sub
