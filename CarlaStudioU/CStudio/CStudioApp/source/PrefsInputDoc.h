// PrefsInputDoc.h: interface for the CPrefsInputDoc class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_PREFSINPUTDOC_H__12363D21_3BF0_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_PREFSINPUTDOC_H__12363D21_3BF0_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
class CResultStreamDescriptor;
class SFMFile;
class ostream;
class CResultStreamDescriptor;
class ostream;
class SFMFile;
//#include "CWProcess.h"
#include "processoutput.h"

class CPrefsInputDocDisplay : public CObject
{
public:
	void includeDescriptor(CResultStreamDescriptor* pRSD);
	CResultStreamDescriptor* getNthVisibleDescriptor(int index) ;
	int getExpectedVisibleDescriptorCount() const;
	// construction destruction
	CPrefsInputDocDisplay(SFMFile* f);
	CPrefsInputDocDisplay();
	virtual ~CPrefsInputDocDisplay();
	void writeToFile(ostream& fout)  ;

	static LPCTSTR getBeginMarker() {return _T("+PrefsInputDocDisplay");}
	BOOL getShowPanel(CResultStreamDescriptor* pRSD) ;
	BOOL doEditDialog(CTypedPtrArray<CPtrArray, CResultStream*>  *pResultStreams=NULL);
	CResultDescriptorArray m_outputDescriptors;
protected:
	CResultStreamDescriptor* findDescriptor(CResultStreamDescriptor* pRSD) ;
};

#endif // !defined(AFX_PREFSINPUTDOC_H__12363D21_3BF0_11D2_A09E_E12649467D2F__INCLUDED_)
