// TestEditModel.cpp: implementation of the CTestEditModel class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "TestEditModel.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CTestEditModel::CTestEditModel()
{


	m_bUseSystemColorBkg=TRUE;
	m_colorBkg=GetSysColor(COLOR_WINDOW);

	// font size
	m_strFontSize="10";

	// WordWrap
	m_bWordWrap=FALSE;

	// default
	m_DefaultColor=RGB(0,0,0);
	m_bDefaultBold=FALSE;
	m_bDefaultItalic=FALSE;
	m_bDefaultUnderline=FALSE;
	m_bDefaultStrikeout=FALSE;

	// operators
	m_OPEColor=RGB(255,0,0);
	m_bOPEBold=FALSE;
	m_bOPEItalic=FALSE;
	m_bOPEUnderline=FALSE;
	m_bOPEStrikeout=FALSE;

	// forop
	m_FOROPColor=RGB(0,0,255);
	m_bFOROPBold=FALSE;
	m_bFOROPItalic=FALSE;
	m_bFOROPUnderline=FALSE;
	m_bFOROPStrikeout=FALSE;

	// location
	m_LOCColor=RGB(0,0,255);
	m_bLOCBold=TRUE;
	m_bLOCItalic=FALSE;
	m_bLOCUnderline=TRUE;
	m_bLOCStrikeout=FALSE;

	// keywords
	m_KEYWColor=RGB(0,0,0);
	m_bKEYWBold=TRUE;
	m_bKEYWItalic=FALSE;
	m_bKEYWUnderline=FALSE;
	m_bKEYWStrikeout=FALSE;

	// connectors
	m_CONColor=RGB(0,0,0);
	m_bCONBold=FALSE;
	m_bCONItalic=FALSE;
	m_bCONUnderline=FALSE;
	m_bCONStrikeout=FALSE;

	// types
	m_TYPColor=RGB(255,0,0);
	m_bTYPBold=FALSE;
	m_bTYPItalic=FALSE;
	m_bTYPUnderline=TRUE;
	m_bTYPStrikeout=FALSE;

	// identif
	m_IDENTIFColor=RGB(123,112,230);
	m_bIDENTIFBold=TRUE;
	m_bIDENTIFItalic=TRUE;
	m_bIDENTIFUnderline=FALSE;
	m_bIDENTIFStrikeout=FALSE;

	// nombre
	m_NBRColor=RGB(255,0,255);
	m_bNBRBold=FALSE;
	m_bNBRItalic=FALSE;
	m_bNBRUnderline=FALSE;
	m_bNBRStrikeout=FALSE;

	// comment
	m_COMColor=RGB(192,192,192);
	m_bCOMBold=FALSE;
	m_bCOMItalic=FALSE;
	m_bCOMUnderline=FALSE;
	m_bCOMStrikeout=FALSE;

	// errors
	m_ERRORColor=RGB(128,128,128);
	m_bERRORBold=FALSE;
	m_bERRORItalic=FALSE;
	m_bERRORUnderline=FALSE;
	m_bERRORStrikeout=TRUE;
}

CTestEditModel::~CTestEditModel()
{

}
