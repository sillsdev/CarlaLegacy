// TestEditModel.h: interface for the CTestEditModel class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_TESTEDITMODEL_H__9BD1382B_1587_4680_9420_CD3561B51072__INCLUDED_)
#define AFX_TESTEDITMODEL_H__9BD1382B_1587_4680_9420_CD3561B51072__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CTestEditModel : public CObject
{

	public:

		// text background
		BOOL m_bUseSystemColorBkg;
		COLORREF m_colorBkg;

		// font size
		CString m_strFontSize;

		// WordWrap
		BOOL m_bWordWrap;

		// default
		COLORREF m_DefaultColor;
		BOOL m_bDefaultBold,m_bDefaultItalic,
			m_bDefaultUnderline,m_bDefaultStrikeout;

		// operators
		COLORREF m_OPEColor;
		BOOL m_bOPEBold,m_bOPEItalic,m_bOPEUnderline,m_bOPEStrikeout;

		// forop
		COLORREF m_FOROPColor;
		BOOL m_bFOROPBold,m_bFOROPItalic,m_bFOROPUnderline,m_bFOROPStrikeout;

		// location
		COLORREF m_LOCColor;
		BOOL m_bLOCBold,m_bLOCItalic,m_bLOCUnderline,m_bLOCStrikeout;

		// keywords
		COLORREF m_KEYWColor;
		BOOL m_bKEYWBold,m_bKEYWItalic,m_bKEYWUnderline,m_bKEYWStrikeout;

		// connectors
		COLORREF m_CONColor;
		BOOL m_bCONBold,m_bCONItalic,m_bCONUnderline,m_bCONStrikeout;

		// types
		COLORREF m_TYPColor;
		BOOL m_bTYPBold,m_bTYPItalic,m_bTYPUnderline,m_bTYPStrikeout;

		// identif
		COLORREF m_IDENTIFColor;
		BOOL m_bIDENTIFBold,m_bIDENTIFItalic,m_bIDENTIFUnderline,m_bIDENTIFStrikeout;

		// nombre
		COLORREF m_NBRColor;
		BOOL m_bNBRBold,m_bNBRItalic,m_bNBRUnderline,m_bNBRStrikeout;

		// comment
		COLORREF m_COMColor;
		BOOL m_bCOMBold,m_bCOMItalic,m_bCOMUnderline,m_bCOMStrikeout;

		// errors
		COLORREF m_ERRORColor;
		BOOL m_bERRORBold,m_bERRORItalic,m_bERRORUnderline,m_bERRORStrikeout;

public:
	CTestEditModel();
	virtual ~CTestEditModel();

};

#endif // !defined(AFX_TESTEDITMODEL_H__9BD1382B_1587_4680_9420_CD3561B51072__INCLUDED_)
