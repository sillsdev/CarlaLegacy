
// The following ifdef block is the standard way of creating macros which make exporting
// from a DLL simpler. All files within this DLL are compiled with the CSUTILDLL_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see
// CSUTILDLL_API functions as being imported from a DLL, wheras this DLL sees symbols
// defined with this macro as being exported.
#ifdef CSUTILDLL_EXPORTS
#define CSUTILDLL_API __declspec(dllexport)
#else
#define CSUTILDLL_API __declspec(dllimport)
#endif

// This class is exported from the CSUtilDLL.dll
class CSUTILDLL_API CSCleaner
{
public:
	CSCleaner(void);


	// this is handy after calling stripITXANalysis, then ample, then intergen to remove
	// unwanted, empty lines left by intergen
	void stripLeftOverMarker(LPCTSTR lpszPath, LPCTSTR lpszMarker);

	// this version requires a list of the fields to strip
	void stripITXAnalysis(ostream& fout, LPCTSTR lpszPath, LPCTSTR lpszTextMarker, CStringArray& stripFields);

	// this version requires a list of the fields to strip and tries to recreate the pre-interlinearize form
	void cleanITX(ostream& fout, LPCTSTR lpszPath, LPCTSTR lpszTextMarker, CStringArray& stripFields);

	// this version strips everything from the word line to the next blank line
	void cleanITXBlanks(ostream& fout, LPCTSTR lpszPath, LPCTSTR lpszTextMarker);

protected:
	BOOL getField(ifstream& fin, CString& marker, CString& contents, BOOL bOneLinePerField);
	void outputAccumulated(ostream& fout, CString &sAccumulate);
	void reportError(LPCTSTR lpszError);
};

//extern CSUTILDLL_API int nCSUtilDLL;

//CSUTILDLL_API int fnCSUtilDLL(void);
