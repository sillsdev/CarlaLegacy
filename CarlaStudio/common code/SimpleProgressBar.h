/////////////////////////////////////////////////////////////////
// CSimpleProgresBar.h
// (c) 1997, Klaus Gütterclass
// jdh: I got this from www.codeguru.com, where the class was CLongOperation

class CSimpleProgressBar : public CObject
{
public:	// IDS_PLEASE_WAIT is a string resource ID for the default text,
	int m_nPercentage;
	// e.g. "Please wait..."
//	CSimpleProgressBar(UINT nIDText = CG_IDS_PROGRESS_CAPTION, bool bStart = true);
	CSimpleProgressBar(LPCTSTR lpszText, bool bStart = true);
	~CSimpleProgressBar();
	void Start();
	void Stop();
	void Step(int nPercentage = -1);
	void SetText(LPCTSTR lpszText);
	void SetTextEx(char* fmt, ...);
protected:
	CString m_strText;
	bool m_bStarted;
	HWND m_hwndProgress;
	void CreateProgressControl();
};

extern CSimpleProgressBar* gpProgressBar; // defined in ProjectDoc.cpp
#define PROGRESSX ASSERTX(gpProgressBar);gpProgressBar->SetTextEx
#define PROGRESS ASSERTX(gpProgressBar);gpProgressBar->SetText
