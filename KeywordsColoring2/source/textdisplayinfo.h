// TextDisplayInfo.h: interface for the CTextDisplayInfo class.
//
//////////////////////////////////////////////////////////////////////
// 1.5a5 24-Sep-1999 hab allow user the ability to show properties in language font
// 1.5a7 20-Oct-1999 hab allow user the ability to show user tests, string and morpheme class names in language font
//	jdh Nov8-99 Added m_bDisableFontAssociation for displaying correctly in Korean Windows
//				Added m_wFlags for future use

#if !defined(AFX_TEXTDISPLAYINFO_H__7E740003_2E92_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_TEXTDISPLAYINFO_H__7E740003_2E92_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
class ofstream;

// this class is nothing more than a font at this time
// but later, it will allow us to share more information
// with classes that display text, WITHOUT THEM HAVING
// TO KNOW ABOUT CCARLALANGUAGE.

// Probably, this will be switched to some SanteFe
// language descriptor in the future.

class CTextDisplayInfo
{
public:
	BOOL m_bShowMorphnamesInLangFont;
	BOOL m_bShowCommentsInLangFont; // future use
#ifndef hab15a5
	BOOL	m_bShowPropertiesInLangFont;
#endif // hab15a5
#ifndef hab15a7
	BOOL	m_bShowStringClassesInLangFont;
	BOOL	m_bShowMorphemeClassesInLangFont;
	BOOL	m_bShowUserTestsInLangFont;
#endif // hab15a7
	BOOL m_bShowMECsInLangFont; // future use
	BOOL m_bDisableFontAssociation; // for Korean Windows
	DWORD m_wFlags; // future use

	void setFontFromLogFont(LOGFONT* plogFont);
	static LPCTSTR getOldSFMMarker() {return "TextDisplayInfo";}
	static LPCTSTR getSFMMarker() {return "TextDisplayInfoX";}
	CTextDisplayInfo();
	virtual ~CTextDisplayInfo();
	CFont* getFont() const {return const_cast<CFont*>(&m_font);}
	void setToCopy(const CFont* pTempFont);
	void write(ofstream& fout) const;
	void read(CString& sField);
	void readOld(CString& sField);

protected:
	CFont m_font;
};

#endif // !defined(AFX_TEXTDISPLAYINFO_H__7E740003_2E92_11D2_A09E_E12649467D2F__INCLUDED_)
