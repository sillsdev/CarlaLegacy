
// The following ifdef block is the standard way of creating macros which make exporting
// from a DLL simpler. All files within this DLL are compiled with the CSCLEAN_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see
// CSCLEAN_API functions as being imported from a DLL, wheras this DLL sees symbols
// defined with this macro as being exported.
#ifdef CSCLEAN_EXPORTS
#define CSCLEAN_API __declspec(dllexport)
#else
#define CSCLEAN_API __declspec(dllimport)
#endif

// This class is exported from the csClean.dll
class CSCLEAN_API CCsClean {
public:
	CCsClean(void);
	// TODO: add your methods here.
};

extern CSCLEAN_API int nCsClean;

CSCLEAN_API int fnCsClean(void);
