VERSION 5.00
Begin {90290CCD-F27D-11D0-8031-00C04FB6C701} IPInflFeaturesDHTMLPage
   ClientHeight    =   4395
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6750
   _ExtentX        =   11906
   _ExtentY        =   7752
   SourceFile      =   "..\HTMs\IPInflFeatures.htm"
   BuildFile       =   "..\Control\IPInflFeatures.htm"
   BuildMode       =   0
   TypeLibCookie   =   108
   AsyncLoad       =   0   'False
   id              =   "IPInflFeaturesDHTMLPage"
   ShowBorder      =   -1  'True
   ShowDetail      =   0   'False
   AbsPos          =   -1  'True
End
Attribute VB_Name = "IPInflFeaturesDHTMLPage"
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

Private Function IPInflFeaturesOK_onclick() As Boolean

	gbDirty = True  ' mark it as having changed

	IPInflFeaturesOK_onclick = True

	BaseWindow.navigate "IPAgrFeatures.htm"
End Function

Private Function IPInflFeaturesCancel_onclick() As Boolean
	IPInflFeaturesCancel_onclick = True
	On Error GoTo noDocInHistory
	BaseWindow.history.back
	Exit Function
noDocInHistory:
   Resume Next

End Function
