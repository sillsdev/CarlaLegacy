// TextDisplayInfo.cpp: implementation of the CTextDisplayInfo class.
//

//////////////////////////////////////////////////////////////////////
// 1.5a5 24-Sep-1999 hab allow user the ability to show properties in language font
// 1.5a7 20-Oct-1999 hab allow user the ability to show user tests, string and morpheme class names in language font
//	jdh Nov8-99 Added m_bDisableFontAssociation for displaying correctly in Korean Windows
//				Added m_wFlags for future use

#include "stdafx.h"
#include "TextDisplayInfo.h"
#include "fstream.h"
#include "strstrea.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CTextDisplayInfo::CTextDisplayInfo()
:	m_bShowMorphnamesInLangFont(FALSE),
	m_bShowCommentsInLangFont(FALSE), // future use
#ifndef hab15a5
	m_bShowPropertiesInLangFont(FALSE),
#endif // hab15a5
#ifndef hab15a7
	m_bShowStringClassesInLangFont(FALSE),
	m_bShowMorphemeClassesInLangFont(FALSE),
	m_bShowUserTestsInLangFont(FALSE),
#endif // hab15a7
	m_bShowMECsInLangFont(FALSE), // future use
	m_bDisableFontAssociation(FALSE),
	m_wFlags(NULL)
{
	m_font.CreateFont(10, 0, 0, 0,
						0, //lWeight,
						0, //lItalic
						0, 0, DEFAULT_CHARSET, 0, 0, 0, 0,
						_T("Courier"));
}

CTextDisplayInfo::~CTextDisplayInfo()
{

}


void CTextDisplayInfo::setToCopy(const CFont* pTempFont)
{
	ASSERTX(pTempFont);
	LOGFONT logFont;
	const_cast<CFont*>(pTempFont)->GetLogFont(&logFont);
	m_font.Detach();

	//nov 11-99 jdh for Korean Windows Not clear if this is needed; documentation is sparse on this
	if(m_bDisableFontAssociation)
		logFont.lfClipPrecision |= 0x40;

	m_font.CreateFontIndirect (&logFont); // copy it
}

#define outputBool(SOUT, VALUE) SOUT<<(VALUE?1:0)<<' ';
#define kCurrentFormatVersion 5

void CTextDisplayInfo::write(ofstream& fout) const
{
	USES_CONVERSION_U8;
	fout << "\\" << T2CU8(getSFMMarker()) << " ";

	// this block is new with beta 1 (text display format version 2)
	fout << int(kCurrentFormatVersion)<< ' '; // version
	outputBool(fout, m_bShowMorphnamesInLangFont);
	outputBool(fout, m_bShowCommentsInLangFont);	// future use
	// end version 2 stuff
#ifndef hab15a5
	outputBool(fout, m_bShowPropertiesInLangFont);
#endif // hab15a5
	// end version 3 stuff
#ifndef hab15a7
	outputBool(fout, m_bShowStringClassesInLangFont);
	outputBool(fout, m_bShowMorphemeClassesInLangFont);
	outputBool(fout, m_bShowUserTestsInLangFont);
#endif // hab15a7
	outputBool(fout, m_bShowMECsInLangFont);	// future use
	// end version 4 stuff

	// these added in TextDisplayInfo Format version 5
	outputBool(fout, m_bDisableFontAssociation );	// for Korean Windows
	fout << m_wFlags << "\t";	// future use
	// end version 5 stuff


	LOGFONT lf;
	const_cast<CFont&>(m_font).GetLogFont( &lf );

	//	fout.write((unsigned char*)&lf, sizeof(LOGFONT));
	int iItalic=lf.lfItalic;	// raw BYTEs seem to come out as a binary value, and a FALSE is thus '\0';
	int iCharSet = lf.lfCharSet;

	fout	<< T2CA(lf.lfFaceName) << "\t"
		<< lf.lfHeight << "\t"
		<< lf.lfWeight << "\t"
		<<  iItalic << "\t"
		<< iCharSet << "\n";
}


// read in versions created before beta 1, which lacked a version # and some other params
void CTextDisplayInfo::readOld(CString& sField)
{
	// TO DO:	When you finish with the CFont object created by
	//the CreateFont function, first select the font out of the device context, then delete the CFont object.
		strstream xin;
#ifndef rde270
		USES_CONVERSION;
		xin << T2CA(sField);
#else   // rde270
		xin << LPCTSTR(sField);
#endif  // rde270
		xin.seekg(0, ios::beg);	// rewind
		CString sFaceName;
		LONG lHeight, lWeight;
		int lItalic;	// really a BYTE, but BYTEs seem to be output incorrectly
		int iCharSet;	// really BYTE, " "  "

		char name[LF_FACESIZE+1];
		xin.get(name, LF_FACESIZE, '\t');	// read up to the tab, no more than max size of a name
		xin >> lHeight >> lWeight >> lItalic >> iCharSet;
		m_font.Detach();// needed to avoid an assert on the next line
#ifndef rde270
		m_font.CreateFont(lHeight, 0, 0, 0, lWeight, lItalic, 0, 0, iCharSet, 0, 0, 0, 0, A2CT(name));
#else   // rde270
		m_font.CreateFont(lHeight, 0, 0, 0, lWeight, lItalic, 0, 0, iCharSet, 0, 0, 0, 0, name);
#endif  // rde270
}

#define READBOOL(FIN, VALUE)	{int nb; FIN>>nb; VALUE = (nb==1);}

// read in version 2 and above. Version two (CS b1) introduced a version number for this class
void CTextDisplayInfo::read(CString& sField)
{
	// TO DO:	When you finish with the CFont object created by
	//the CreateFont function, first select the font out of the device context, then delete the CFont object.
		strstream xin;
#ifndef rde270
		USES_CONVERSION;
		xin << T2CA(sField);
#else
		xin << LPCTSTR(sField);
#endif
		xin.seekg(0, ios::beg);	// rewind
		int nVersion;
		xin >> nVersion;
		if (nVersion > kCurrentFormatVersion)
		{
			AfxMessageBox(_T("It appears that the font information in this file was created with a more recent version of CarlaStudio.  Font settings will be lost."));
			return;
		}
		READBOOL(xin, m_bShowMorphnamesInLangFont);
		READBOOL(xin, m_bShowCommentsInLangFont);	// future use
#ifndef hab15a5
		if (nVersion > 2)
		  READBOOL(xin, m_bShowPropertiesInLangFont);
#endif // hab15a5
#ifndef hab15a7
		if (nVersion > 3)
		  {
			READBOOL(xin, m_bShowStringClassesInLangFont);
			READBOOL(xin, m_bShowMorphemeClassesInLangFont);
			READBOOL(xin, m_bShowUserTestsInLangFont);
		  }
#endif // hab15a7
		READBOOL(xin, m_bShowMECsInLangFont);		// future use
		if(nVersion >= 4)
		{
			READBOOL(xin, m_bDisableFontAssociation); // for Korean Windows
			xin >> m_wFlags;
		}

		CString sFaceName;
		LONG lHeight, lWeight;
		int lItalic;	// really a BYTE, but BYTEs seem to be output incorrectly
		int iCharSet;	// really BYTE, " "  "

		char name[LF_FACESIZE+1];
		xin.eatwhite();
		xin.get(name, LF_FACESIZE, '\t');	// read up to the tab, no more than max size of a name
		xin >> lHeight >> lWeight >> lItalic >> iCharSet;
		m_font.Detach();// needed to avoid an assert on the next line

		// jdh nov11 added 0x40 option per Tim Erickson
#ifndef rde270
		m_font.CreateFont(lHeight, 0, 0, 0, lWeight, lItalic, 0, 0, iCharSet, 0,
							(m_bDisableFontAssociation)?0x40:0, // <-- nClipPrecision
							0, 0, A2CT(name));
#else
		m_font.CreateFont(lHeight, 0, 0, 0, lWeight, lItalic, 0, 0, iCharSet, 0,
							(m_bDisableFontAssociation)?0x40:0, // <-- nClipPrecision
							0, 0, name);
#endif
}

void CTextDisplayInfo::setFontFromLogFont(LOGFONT * plogFont)
{
	m_font.Detach();// needed to avoid an assert on the next line

	//nov 11-99 jdh for Korean Windows Not clear if this is needed; documentation is sparse on this
	if(m_bDisableFontAssociation)
		plogFont->lfClipPrecision |= 0x40;

	m_font.CreateFontIndirect(plogFont);
}
