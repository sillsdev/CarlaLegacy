// LextransDLL.cpp : Defines the initialization routines for the DLL.
//
//       11-Jul-2002 hab Unicode version

#include "stdafx.h"
#include <afxdllx.h>
#include "LextransProcessor.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#include "LextransProcessor.h"

static AFX_EXTENSION_MODULE LextransDLL = { NULL, NULL };

extern "C" int APIENTRY
DllMain(HINSTANCE hInstance, DWORD dwReason, LPVOID lpReserved)
{
	// Remove this if you use lpReserved
	UNREFERENCED_PARAMETER(lpReserved);

	if (dwReason == DLL_PROCESS_ATTACH)
	{
		TRACE0("LEXTRANS.DLL Initializing.\n");

		// Extension DLL one-time initialization
		if (!AfxInitExtensionModule(LextransDLL, hInstance))
			return 0;

		// Insert this DLL into the resource chain
		// NOTE: If this Extension DLL is being implicitly linked to by
		//  an MFC Regular DLL (such as an ActiveX Control)
		//  instead of an MFC application, then you will want to
		//  remove this line from DllMain and put it in a separate
		//  function exported from this Extension DLL.  The Regular DLL
		//  that uses this Extension DLL should then explicitly call that
		//  function to initialize this Extension DLL.  Otherwise,
		//  the CDynLinkLibrary object will not be attached to the
		//  Regular DLL's resource chain, and serious problems will
		//  result.

		new CDynLinkLibrary(LextransDLL);
	}
	else if (dwReason == DLL_PROCESS_DETACH)
	{
		TRACE0("LEXTRANS.DLL Terminating.\n");
		// Terminate the library before destructors are called
		AfxTermExtensionModule(LextransDLL);
	}
	return 1;   // ok
}




// everything above this was provided by MFC Visual C++
// These two methods are the only ones a DLL must provide
//  currently to CSTUDIO PROC
CString*  GetProcessorDisplayName()
{
	return new CString(LEXTRANSDISPLAYNAME);
}

// The process template is a class that will create
// instances of the processor.
#ifndef hab270
#ifdef _UNICODE
__declspec(dllexport) CProcessTemplate* GetProcessTemplateU()
#else  // _UNICODE
__declspec(dllexport) CProcessTemplate* GetProcessTemplate()
#endif // _UNICODE
#else  // hab270
CProcessTemplate* GetProcessTemplate()
#endif // hab270
{
	USES_CONVERSION;
	return new CProcessTemplate(
		RUNTIME_CLASS(CLextransProcessor),
		A2CT(LEXTRANSDISPLAYNAME),
		CLextransProcessor::INPUT_TYPE_DISPLAY(),
		CLextransProcessor::OUTPUT_TYPE_DISPLAY(),
		A2CT(CLextransProcessor::ID()),
		CProcess::kTransfer | CProcess::kInterlinear,
		0);	// to do: figure out what the version number really should mean
}
