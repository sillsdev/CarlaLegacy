// LearnDLL.cpp : Defines the entry point for the DLL application.
//

#include "stdafx.h"
#include <stdio.h>
#include "LearnDLL.h"


#ifdef _MANAGED
#pragma managed(push, off)
#endif

BOOL APIENTRY DllMain( HMODULE hModule,
					   DWORD  ul_reason_for_call,
					   LPVOID lpReserved
					 )
{
	return TRUE;
}

#ifdef _MANAGED
#pragma managed(pop)
#endif

// Export Point One
DllExport const char * exportPointOne(void)
{
	return ("Export Point One\n");

}

// Export Point Two
DllExport const char * exportPointTwo(void)
{
	return ("Export Point Two\n");
}

// Export Point Three
DllExport const char * exportPointThree(void)
{
	return ("Export Point Three\n");
}