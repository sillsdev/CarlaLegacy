VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} IPAgrFeaturesDHTMLPage
   ClientHeight    =   4365
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7080
   _ExtentX        =   12488
   _ExtentY        =   7699
   SourceFile      =   "..\HTMs\IPAgrFeatures.htm"
   BuildFile       =   "..\Control\IPAgrFeatures.htm"
   BuildMode       =   0
   TypeLibCookie   =   56
   AsyncLoad       =   0   'False
   id              =   "IPAgrFeaturesDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "IPAgrFeaturesDHTMLPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Sub DHTMLPage_Load()

		' Use language-specific stylesheet
	If (DHTMLPage.Document.styleSheets.length >= 1) Then
		DHTMLPage.Document.styleSheets(0).href = "../styles/" & gsLangAbbr & "PAWSStarterKit.css"
	End If
	BaseWindow.focus
End Sub

Private Function IPAgrFeaturesOK_onclick() As Boolean

	gbDirty = True  ' mark it as having changed

	IPAgrFeaturesOK_onclick = True

	BaseWindow.navigate "IPContents.htm"
End Function

Private Function IPAgrFeaturesCancel_onclick() As Boolean
	IPAgrFeaturesCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
