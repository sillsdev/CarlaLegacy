// Focuser.cpp: implementation of the CFocuser class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Focuser.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
static UINT NEAR WM_SANTA_FE_FOCUS = RegisterWindowMessage("SantaFeFocus");

CFocuser::CFocuser()
{

}

CFocuser::~CFocuser()
{

}

void CFocuser::focusShbxOnWord(LPCTSTR lpszWord)
{
	//CString s;
	//s.Format("Sorry, Jumping isn't implemented yet. (%s)", lpszWord);
	//AfxMessageBox(s);

	CString sData;
	//sData.Format("%s\n%s\n%s", lpszWord, "surface", "Default");
	sData.Format("%s\n%s", lpszWord, "surface");

	long lReturn = ::RegSetValue(HKEY_CURRENT_USER,
								"Software\\SantaFe\\Focus\\Word",
								REG_SZ,
								sData,
								sData.GetLength());
	if ( lReturn != ERROR_SUCCESS )
		AfxMessageBox("There was an error while putting this word into the registry");

	// added april 19 1999 jdh because I forgot it before!
	int iType = 4; // word focus, from Nathan's VB focus code

	PostMessage(HWND_BROADCAST, WM_SANTA_FE_FOCUS,
		iType, 0);
}

#ifdef nono
//2. Here's where Shoebox breaks up the registry value into three parts
//(the second and third are optional). This indicates how you can construct the appropriate value
//to set in the registry (before sending the message).

if ( strlen(pszWordFocusRef) == 0 )
	return;

// A word focus reference consists of up to three parts.
// Use newline to separate the parts.
// 1. Word form, e.g. akka
// 2. Type, i.e. surface or lemma
// 3. Language encoding, e.g. Chulupi
	const char* psz = pszWordFocusRef;
	size_t len = strcspn(psz, "\n");
	CString sWord(psz, len);
	psz += len;
	if ( *psz == '\n' )
		psz++;
	len = strcspn(psz, "\n");
	CString sType(psz, len);
	psz += len;
	if ( *psz == '\n' )
		psz++;
	len = strcspn(psz, "\n");
	CString sLanguageEncodingRef(psz, len);


//2. Getting a message number (once per session).

// 1998-10-20 MRP: See Technical Note #6 in MFCNotes.hlp
static UINT NEAR WM_SANTA_FE_FOCUS = RegisterWindowMessage("SantaFeFocus");


//3. Here's where Shoebox receives the message. You'll want to send the corresponding message
//and set the registry value (see #3).

LRESULT CMainFrame::OnSantaFeFocus(WPARAM wParam, LPARAM lParam)
{
	if ( wParam != 4 )  // 1998-10-20 MRP: Word focus
		return 0;

	const int maxlenBuffer = 256;
	char pszBuffer[maxlenBuffer];
	long len = maxlenBuffer;
	long lReturn = ::RegQueryValue(HKEY_CURRENT_USER,
		"Software\\SantaFe\\Focus\\Word", pszBuffer, &len);
	if ( lReturn != ERROR_SUCCESS )
		return 0;

	Shw_papp()->FocusUpdated(pszBuffer);

	return 0;
}


4. The end user needs to designate one or more windows as "word focus targets".
There isn't any way to do this through the visual user interface yet.
For testing --this is still very much a test feature-- they must edit
the Shoebox .prj project file.
Always exit Shoebox before editing any of its project files!

a. Insert the line

\FocusTarget

in the properties of the appropriate window(s).

If you need more details about the contents of Shoebox .prj files, let me know.

b. If the language encoding is specified (by the program that initiated the focus change), focus target windows in Shoebox will compare it to the language encoding of their primary sorting marker. If it doesn't match, they disregard the focus change.

c. The focus change uses the window's options for the Database Search operation (e.g. Match whole word or not). If there are multiple matches, Shoebox displays a dialog box for choosing. If there's no match, Shoebox doesn't display any feedback.


-Mark P.
#endif
