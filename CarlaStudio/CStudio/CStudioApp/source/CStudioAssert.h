#pragma once

void handleFailedAssert(LPCSTR lpszFileName, int iLine, LPCSTR lpszDate);

#undef ASSERT

#define ASSERT(f) ASSERTX(f)

// i'm wondering why the vc++ macro for assert dependins on the THIS_FILE,
// which is define for each file
// I'll try just using __FILE__, since it only defines THIS_FILE in DEBUG
// releases

#define ASSERTX(f) \
	do \
	{ \
	if (!(f) ) \
			handleFailedAssert(__FILE__, __LINE__, __DATE__); \
	} while (0) \
