// TestEdit.cpp : implementation file
//

#include "stdafx.h"
#include "TestEdit.h"
#include "resource.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#ifndef mr270
#else // mr270
static const TCHAR szSection [] = _T("Settings\\TestsColor");
#endif // mr270


static const TCHAR szIdentif [] = _T("<identifier>");


/////////////////////////////////////////////////////////////////////////////
// CTestEdit

CTestEdit::CTestEdit()
{

	m_pTYPEList = new CStringArray();
	m_pLOGOPList = new CStringArray();
	m_pPOSITIONList = new CStringArray();
	m_pNEIGHBORList = new CStringArray();
	m_pRELOPList = new CStringArray();
	m_pConstant = new CStringArray();
	m_pKeyword_property = new CStringArray();
	m_pKeyword_morphname = new CStringArray();
	//m_pKeyword_is = new CStringArray();
	m_pIdentifier = new CStringArray();
	m_pKeyword_member = new CStringArray();
	m_pKeyword_position = new CStringArray();
	m_pKeyword_allomorph = new CStringArray();
	//m_pKeyword_matches = new CStringArray();
	m_pKeyword_surface = new CStringArray();
	m_pKeyword_word = new CStringArray();
	m_pKeyword_neighbor = new CStringArray();
	m_pKeyword_fromtocategory = new CStringArray();
	m_pKeyword_capitalized = new CStringArray();
	m_pKeyword_orderclass = new CStringArray();
	m_pKeyword_relop = new CStringArray();
	m_pConst = new CStringArray();
	m_pType = new CStringArray();
	m_pKeyword_type = new CStringArray();
	m_pKeyword_logop = new CStringArray();
	m_pKeyword_for = new CStringArray();
	m_pKeyword_insert = new CStringArray();
	m_pKeyword_report = new CStringArray();
	m_pKeyword_orderclassminmax = new CStringArray();
	m_pKeywordPunctuation = new CStringArray();
	m_pKeyword_afterbefore = new CStringArray();

	m_pAllKeywords = new CStringArray();



}

CTestEdit::~CTestEdit()
{
/*
	delete m_pTYPEList,m_pLOGOPList,m_pPOSITIONList,
			m_pNEIGHBORList,m_pRELOPList,m_pConstant,
			m_pKeyword_property,m_pKeyword_morphname,
			m_pKeyword_is,m_pIdentifier,m_pKeyword_member,
			m_pKeyword_position,m_pKeyword_allomorph,m_pKeyword_matches,
			m_pKeyword_surface,m_pKeyword_word,m_pKeyword_neighbor,
			m_pKeyword_fromtocategory,m_pKeyword_capitalized,m_pKeyword_orderclass,
			m_pKeyword_relop,m_pConst,m_pType,m_pKeyword_type,m_pKeyword_logop,
			m_pKeyword_for,m_pAllKeywords;
*/

	delete  m_pTYPEList, m_pLOGOPList, m_pPOSITIONList, m_pNEIGHBORList,
			m_pRELOPList, m_pAllKeywords, m_pConstant, m_pKeyword_property,
			m_pKeyword_morphname, m_pIdentifier, m_pKeyword_member,
			m_pKeyword_position, m_pKeyword_allomorph,
			m_pKeyword_surface, m_pKeyword_word, m_pKeyword_neighbor,
			m_pKeyword_fromtocategory, m_pKeyword_capitalized, m_pKeyword_orderclass,
			m_pKeyword_relop, m_pConst, m_pType, m_pKeyword_type, m_pKeyword_logop,
			m_pKeyword_for, m_pKeyword_insert, m_pKeyword_posStamp, m_pKeyword_report,
			m_pKeyword_afterbefore,m_pKeyword_orderclassminmax,m_pKeywordPunctuation;

}
#ifndef mr270
void CTestEdit::readTestEditModel()
#else // mr270
void CTestEdit::readRegistry( LPCTSTR lpzSection )
#endif // mr270
{

#ifndef mr270

	// text background color - default color system
	m_clrBackgoundColor = m_pTestEditModel->m_colorBkg;

	// use system Color background - default TRUE
	m_bUseBackgroundSystemColor = m_pTestEditModel->m_bUseSystemColorBkg;

	// font size
	SetFontSize( m_pTestEditModel->m_strFontSize );

	// word wrap
	setWordWrap( m_pTestEditModel->m_bWordWrap );


	// default color
	setColor( m_colorDefault,
				m_pTestEditModel->m_DefaultColor,
				m_pTestEditModel->m_bDefaultBold,
				m_pTestEditModel->m_bDefaultItalic,
				m_pTestEditModel->m_bDefaultUnderline,
				m_pTestEditModel->m_bDefaultStrikeout);

	// operators
	setColor( m_colorOPErators,
				m_pTestEditModel->m_OPEColor,
				m_pTestEditModel->m_bOPEBold,
				m_pTestEditModel->m_bOPEItalic,
				m_pTestEditModel->m_bOPEUnderline,
				m_pTestEditModel->m_bOPEStrikeout);

	// forop
	setColor( m_colorForOPErators,
				m_pTestEditModel->m_FOROPColor,
				m_pTestEditModel->m_bFOROPBold,
				m_pTestEditModel->m_bFOROPItalic,
				m_pTestEditModel->m_bFOROPUnderline,
				m_pTestEditModel->m_bFOROPStrikeout);

	// location
	setColor( m_colorLOCations,
				m_pTestEditModel->m_LOCColor,
				m_pTestEditModel->m_bLOCBold,
				m_pTestEditModel->m_bLOCItalic,
				m_pTestEditModel->m_bLOCUnderline,
				m_pTestEditModel->m_bLOCStrikeout);

	// keywords
	setColor( m_colorKEYWords,
				m_pTestEditModel->m_KEYWColor,
				m_pTestEditModel->m_bKEYWBold,
				m_pTestEditModel->m_bKEYWItalic,
				m_pTestEditModel->m_bKEYWUnderline,
				m_pTestEditModel->m_bKEYWStrikeout);

	// connectors
	setColor( m_colorCONNectors,
				m_pTestEditModel->m_CONColor,
				m_pTestEditModel->m_bCONBold,
				m_pTestEditModel->m_bCONItalic,
				m_pTestEditModel->m_bCONUnderline,
				m_pTestEditModel->m_bCONStrikeout);

	// type
	setColor( m_colorTYPes,
				m_pTestEditModel->m_TYPColor,
				m_pTestEditModel->m_bTYPBold,
				m_pTestEditModel->m_bTYPItalic,
				m_pTestEditModel->m_bTYPUnderline,
				m_pTestEditModel->m_bTYPStrikeout);

	// identifiers
	setColor( m_colorIdentifiers,
				m_pTestEditModel->m_IDENTIFColor,
				m_pTestEditModel->m_bIDENTIFBold,
				m_pTestEditModel->m_bIDENTIFItalic,
				m_pTestEditModel->m_bIDENTIFUnderline,
				m_pTestEditModel->m_bIDENTIFStrikeout);

	// nombres
	setColor( m_colorNBR,
				m_pTestEditModel->m_NBRColor,
				m_pTestEditModel->m_bNBRBold,
				m_pTestEditModel->m_bNBRItalic,
				m_pTestEditModel->m_bNBRUnderline,
				m_pTestEditModel->m_bNBRStrikeout);

	// comment
	setColor( m_colorCOMments,
				m_pTestEditModel->m_COMColor,
				m_pTestEditModel->m_bCOMBold,
				m_pTestEditModel->m_bCOMItalic,
				m_pTestEditModel->m_bCOMUnderline,
				m_pTestEditModel->m_bCOMStrikeout);

	// errors
	setColor( m_colorError,
				m_pTestEditModel->m_ERRORColor,
				m_pTestEditModel->m_bERRORBold,
				m_pTestEditModel->m_bERRORItalic,
				m_pTestEditModel->m_bERRORUnderline,
				m_pTestEditModel->m_bERRORStrikeout);

#else // mr270

	CWinApp* pApp = AfxGetApp ();

	m_clrDefaultColor=pApp->GetProfileInt( lpzSection,"DefaultColor",RGB(0,0,0));

	// background color
	m_bUseBackgroundSystemColor=pApp->GetProfileInt( lpzSection, "UseSystemColorBackground", TRUE);
	m_clrBackgoundColor = GetSysColor(COLOR_WINDOW);

	if( !m_bUseBackgroundSystemColor )
	{
		m_clrBackgoundColor=pApp->GetProfileInt( lpzSection, "ColorBackground", GetSysColor(COLOR_WINDOW));
	}


	setColor( m_colorDefault,
				pApp->GetProfileInt( lpzSection,"Defaultcolor",RGB(0,0,0)),	// color
				pApp->GetProfileInt( lpzSection,"Defaultbold",FALSE),		// bold
				pApp->GetProfileInt( lpzSection,"Defaultitalic",FALSE),		// italic
				pApp->GetProfileInt( lpzSection,"Defaultunderline",FALSE),	// underline
				pApp->GetProfileInt( lpzSection,"Defaultstrikeout",FALSE));	// striketout

	setColor( m_colorOPErators,
				//pApp->GetProfileInt( lpzSection,"OPEcolor",RGB(255,0,0)),
				m_pTestEditModel->getColorDefault(),
				pApp->GetProfileInt( lpzSection,"OPEbold",FALSE),
				pApp->GetProfileInt( lpzSection,"OPEitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"OPEunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"OPESsrikeout",FALSE));

	setColor( m_colorForOPErators,
				pApp->GetProfileInt( lpzSection,"FOROPEcolor",RGB(0,0,255)),
				pApp->GetProfileInt( lpzSection,"FOROPEbold",FALSE),
				pApp->GetProfileInt( lpzSection,"FOROPEitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"FOROPEunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"FOROPEstrikeout",FALSE));

	setColor( m_colorLOCations,
				pApp->GetProfileInt( lpzSection,"LOCcolor",RGB(0,0,255)),
				pApp->GetProfileInt( lpzSection,"LOCbold",TRUE),
				pApp->GetProfileInt( lpzSection,"LOCitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"LOCunderline",TRUE),
				pApp->GetProfileInt( lpzSection,"LOCstrikeout",FALSE));

	setColor( m_colorKEYWords,
				pApp->GetProfileInt( lpzSection,"KEYWcolor",RGB(0,0,0)),
				pApp->GetProfileInt( lpzSection,"KEYWbold",TRUE),
				pApp->GetProfileInt( lpzSection,"KEYWitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"KEYWunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"KEYWstrikeout",FALSE));

	setColor( m_colorCONNectors,
				pApp->GetProfileInt( lpzSection,"CONNcolor",RGB(0,0,0)),
				pApp->GetProfileInt( lpzSection,"CONNbold",FALSE),
				pApp->GetProfileInt( lpzSection,"CONNitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"CONNunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"CONNstrikeout",FALSE));

	setColor( m_colorTYPes,
				pApp->GetProfileInt( lpzSection,"TYPEcolor",RGB(255,0,0)),
				pApp->GetProfileInt( lpzSection,"TYPEbold",FALSE),
				pApp->GetProfileInt( lpzSection,"TYPEitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"TYPEunderline",TRUE),
				pApp->GetProfileInt( lpzSection,"TYPEstrikeout",FALSE));

	setColor( m_colorIdentifiers,
				pApp->GetProfileInt( lpzSection,"IDENTIFcolor",RGB(123,112,230)),
				pApp->GetProfileInt( lpzSection,"IDENTIFbold",TRUE),
				pApp->GetProfileInt( lpzSection,"IDENTIFitalic",TRUE),
				pApp->GetProfileInt( lpzSection,"IDENTIFunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"IDENTIFstrikeout",FALSE));

	setColor( m_colorNBR,
				pApp->GetProfileInt( lpzSection,"NBRcolor",RGB(255,0,255)),
				pApp->GetProfileInt( lpzSection,"NBRbold",FALSE),
				pApp->GetProfileInt( lpzSection,"NBRitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"NBRunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"NBRstrikeout",FALSE));

	setColor( m_colorCOMments,
				pApp->GetProfileInt( lpzSection,"COMcolor",RGB(192,192,192)),
				pApp->GetProfileInt( lpzSection,"COMbold",FALSE),
				pApp->GetProfileInt( lpzSection,"COMitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"COMunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"COMstrikeout",FALSE));

	setColor( m_colorError,
				pApp->GetProfileInt( lpzSection,"ERRORcolor",RGB(128,128,128)),
				pApp->GetProfileInt( lpzSection,"ERRORbold",FALSE),
				pApp->GetProfileInt( lpzSection,"ERRORitalic",FALSE),
				pApp->GetProfileInt( lpzSection,"ERRORunderline",FALSE),
				pApp->GetProfileInt( lpzSection,"ERRORstrikeout",TRUE));


	// font size
	SetFontSize( pApp->GetProfileString( szSection,"FontSize","10"));

	// word wrap
	setWordWrap( pApp->GetProfileInt( lpzSection,"WordWrap",FALSE ));

#endif // mr270

}

void CTestEdit::SetFontSize( LPCTSTR lpzFontSize)
{
	m_lpzFontSize=lpzFontSize;
}
void CTestEdit::Initialize(BOOL bIsAmple,TCHAR szComment,
						   CString strFontFaceName,CTestEditModel *pTestEditModel,
						   BOOL bReadOnly )
{

#ifndef mr270

	SetReadOnly(bReadOnly);

	// TRUE=Ample  FALSE=Stamp
	m_bIsAmple=bIsAmple;

	setTestEditModel(pTestEditModel);

	setFontFaceName(strFontFaceName); // user's font OR courier new
	m_lpzFontSize="10"; // size by default

	// comment char
	SetSLComment(szComment); // user's comment char
	//SetSLComment(_T('|'));
	//SetSLComment(_T("\\co"));
	//m_chComment = 1;

	// quotes
	SetStringQuotes(_T("\""));
	//SetStringQuotes(_T("\'"));
	//SetStringQuotes(_T("."));

	m_bChangeCase = TRUE;
	m_changeType = ctUndo;
	m_crOldSel.cpMin = m_crOldSel.cpMax = 0;


	m_strOPE = " AND IF IFF NOT OR THEN XOR ";
	m_strFOROPE = " FOR_ALL_LEFT FOR_ALL_RIGHT FOR_SOME_LEFT FOR_SOME_RIGHT FOR-ALL-LEFT FOR-ALL-RIGHT FOR-SOME-LEFT FOR-SOME-RIGHT FORALLLEFT FORALLRIGHT FORSOMELEFT FORSOMERIGHT ";
	m_strLOC = " current last left next right FINAL INITIAL LEFT RIGHT ";
	m_strCONN = " is matches member = > >= <= < ~= ";
	m_strTYP = " prefix infix root suffix initial final ";
	m_strNBRE = " 0 1 2 3 4 5 6 7 8 9 ";
	m_strKEYW = " allomorph capitalized fromcategory morphname orderclass property punctuation string surface tocategory type word orderclassmin orderclassmax ";

	// IF Syntehis test, THEN
	// those keywords need to be added to the Keyword list.
	if( !bIsAmple )
	{
		m_strKEYW += " insert before after report ";
	}


	// <type>
	m_pTYPEList->SetSize(0,1);
	m_pTYPEList->Add("prefix");
	m_pTYPEList->Add("infix");
	m_pTYPEList->Add("root");
	m_pTYPEList->Add("suffix");
	m_pTYPEList->Add("initial");
	m_pTYPEList->Add("final");

	// <logop>
	m_pLOGOPList->SetSize(0,1);
	m_pLOGOPList->Add("AND");
	m_pLOGOPList->Add("OR");
	m_pLOGOPList->Add("XOR");
	m_pLOGOPList->Add("IFF");
	m_pLOGOPList->Add("IF");
	m_pLOGOPList->Add("THEN");

	// <position>
	m_pPOSITIONList->SetSize(0,1);
	m_pPOSITIONList->Add("left");
	m_pPOSITIONList->Add("right");
	m_pPOSITIONList->Add("current");
	m_pPOSITIONList->Add("LEFT");
	m_pPOSITIONList->Add("RIGHT");
	m_pPOSITIONList->Add("initial");
	m_pPOSITIONList->Add("final");
	m_pPOSITIONList->Add("INITIAL");
	m_pPOSITIONList->Add("FINAL");

	// IF Syntehis test, THEN
	// those keywords need to be added to the Keyword list.
	if( !bIsAmple )
	{
		m_pPOSITIONList->Add("insert");
		m_pPOSITIONList->Add("before");
		m_pPOSITIONList->Add("after");
		m_pPOSITIONList->Add("report");
	}

	// <neighbor>
	m_pNEIGHBORList->SetSize(0,1);
	m_pNEIGHBORList->Add("last");
	m_pNEIGHBORList->Add("next");

	// <relop>
	m_pRELOPList->SetSize(0,1);
	m_pRELOPList->Add("=");
	m_pRELOPList->Add(">");
	m_pRELOPList->Add(">=");
	m_pRELOPList->Add("<=");
	m_pRELOPList->Add("<");
	m_pRELOPList->Add("~=");

	// <constant>
	m_pConstant->SetSize(0,1);
	m_pConstant->Add("-");
	m_pConstant->Add("0");
	m_pConstant->Add("1");
	m_pConstant->Add("2");
	m_pConstant->Add("3");
	m_pConstant->Add("4");
	m_pConstant->Add("5");
	m_pConstant->Add("6");
	m_pConstant->Add("7");
	m_pConstant->Add("8");
	m_pConstant->Add("9");

	////////////////////////////////////////////////////

	// 'property' may be followed by...
	m_pKeyword_property->SetSize(0,1);
	m_pKeyword_property->Add("is");

	// 'morphname' may be followed by...
	m_pKeyword_morphname->SetSize(0,1);
	m_pKeyword_morphname->Add("is");
	m_pKeyword_morphname->Append(*m_pLOGOPList);
	m_pKeyword_morphname->Append(*m_pPOSITIONList);
	m_pKeyword_morphname->Append(*m_pNEIGHBORList);


	// <identifier> may be followed by...
	m_pIdentifier->SetSize(0,1);
	m_pIdentifier->Append(*m_pLOGOPList);
	m_pIdentifier->Append(*m_pPOSITIONList);
	m_pIdentifier->Append(*m_pNEIGHBORList);

	// member may be followed by...
	m_pKeyword_member->SetSize(0,1);
	m_pKeyword_member->Add(szIdentif);

	// <position> may be followed by...
	m_pKeyword_position->SetSize(0,1);
	m_pKeyword_position->Add("property");
	m_pKeyword_position->Add("morphname");
	m_pKeyword_position->Add("allomorph");
	m_pKeyword_position->Add("surface");
	m_pKeyword_position->Add("string");
	m_pKeyword_position->Add("type");
	m_pKeyword_position->Add("fromcategory");
	m_pKeyword_position->Add("tocategory");
	m_pKeyword_position->Add("orderclass");

	// 'allomorph' may be followed by...
	m_pKeyword_allomorph->SetSize(0,1);
	m_pKeyword_allomorph->Add("is");
	m_pKeyword_allomorph->Add("matches");
	m_pKeyword_allomorph->Append(*m_pLOGOPList);
	m_pKeyword_allomorph->Append(*m_pPOSITIONList);
	m_pKeyword_allomorph->Append(*m_pNEIGHBORList);

	// 'surface/string' may be followed by...
	m_pKeyword_surface->SetSize(0,1);
	m_pKeyword_surface->Add("matches");
	m_pKeyword_surface->Add("is");

	// 'word' may be followed by...
	m_pKeyword_word->SetSize(0,1);
	m_pKeyword_word->Add("is");
	m_pKeyword_word->Add("matches");

	// <neighbor> may be followed by...
	m_pKeyword_neighbor->SetSize(0,1);
	m_pKeyword_neighbor->Add("word");
	m_pKeyword_neighbor->Add("punctuation");

	// '(from/to)category' may be followed by...
	m_pKeyword_fromtocategory->SetSize(0,1);
	m_pKeyword_fromtocategory->Add("is");
	m_pKeyword_fromtocategory->Append(*m_pLOGOPList);
	m_pKeyword_fromtocategory->Append(*m_pPOSITIONList);
	m_pKeyword_fromtocategory->Append(*m_pNEIGHBORList);

	// 'capitalized' may be followed by...
	m_pKeyword_capitalized->SetSize(0,1);
	m_pKeyword_capitalized->Append(*m_pLOGOPList);
	m_pKeyword_capitalized->Append(*m_pPOSITIONList);
	m_pKeyword_capitalized->Append(*m_pNEIGHBORList);

	// 'orderclass' may be followed by...
	m_pKeyword_orderclass->SetSize(0,1);
	m_pKeyword_orderclass->Append(*m_pRELOPList);
	m_pKeyword_orderclass->Append(*m_pLOGOPList);
	m_pKeyword_orderclass->Append(*m_pPOSITIONList);
	m_pKeyword_orderclass->Append(*m_pNEIGHBORList);

	// <relop> may be followed by...
	m_pKeyword_relop->SetSize(0,1);
	//m_pKeyword_relop->Append(*m_pConstant);
	m_pKeyword_relop->Append(*m_pPOSITIONList);
	m_pKeyword_relop->Add("orderclassmin");
	m_pKeyword_relop->Add("orderclassmax");

	// <constant> may be followed by...
	m_pConst->SetSize(0,1);
	m_pConst->Append(*m_pLOGOPList);
	m_pConst->Append(*m_pPOSITIONList);
	m_pConst->Append(*m_pNEIGHBORList);

	// <type> may be followed by...
	m_pType->SetSize(0,1);
	m_pType->Append(*m_pLOGOPList);
	m_pType->Append(*m_pPOSITIONList);
	m_pType->Append(*m_pNEIGHBORList);

	// 'type' may be followed by...
	m_pKeyword_type->SetSize(0,1);
	m_pKeyword_type->Add("is");

	// <logop> may be followed by....
	m_pKeyword_logop->SetSize(0,1);
	m_pKeyword_logop->Append(*m_pPOSITIONList);
	m_pKeyword_logop->Append(*m_pNEIGHBORList);

	// <forleft/forright> may be followed by...
	m_pKeyword_for->SetSize(0,1);
	m_pKeyword_for->Append(*m_pLOGOPList);
	m_pKeyword_for->Append(*m_pPOSITIONList);
	m_pKeyword_for->Append(*m_pNEIGHBORList);

	// 'insert' may be followed by...
	m_pKeyword_insert->SetSize(0,1);
	m_pKeyword_insert->Add(szIdentif);

	// 'report' may be followed by...
	m_pKeyword_report->SetSize(0,1);
	m_pKeyword_report->Add(szIdentif);

	// 'orderclassmin/orderclassmax' may be followed by...
	m_pKeyword_orderclassminmax->SetSize(0,1);
	m_pKeyword_orderclassminmax->Append(*m_pLOGOPList);
	m_pKeyword_orderclassminmax->Append(*m_pPOSITIONList);
	m_pKeyword_orderclassminmax->Append(*m_pNEIGHBORList);

	// punctuation may be followed by ...
	m_pKeywordPunctuation->SetSize(0,1);
	m_pKeywordPunctuation->Add("is");

	// after/before may be followed by ...
	m_pKeyword_afterbefore->Append(*m_pPOSITIONList);


	// all
	m_pAllKeywords->SetSize(0,1);
	m_pAllKeywords->Add("property");
	m_pAllKeywords->Add("is");
	m_pAllKeywords->Add("morphname");
	m_pAllKeywords->Add("member");
	m_pAllKeywords->Add("allomorph");
	m_pAllKeywords->Add("matches");
	m_pAllKeywords->Add("surface");
	m_pAllKeywords->Add("string");
	m_pAllKeywords->Add("word");
	m_pAllKeywords->Add("type");
	m_pAllKeywords->Add("fromcategory");
	m_pAllKeywords->Add("tocategory");
	m_pAllKeywords->Add("capitalized");
	m_pAllKeywords->Add("orderclass");
	m_pAllKeywords->Add("AND");
	m_pAllKeywords->Add("OR");
	m_pAllKeywords->Add("XOR");
	m_pAllKeywords->Add("IFF");
	m_pAllKeywords->Add("IF");
	m_pAllKeywords->Add("FOR_ALL_LEFT");
	m_pAllKeywords->Add("FOR-ALL-LEFT");
	m_pAllKeywords->Add("FORALLLEFT");
	m_pAllKeywords->Add("FOR_SOME_LEFT");
	m_pAllKeywords->Add("FOR-SOME-LEFT");
	m_pAllKeywords->Add("FORSOMELEFT");
	m_pAllKeywords->Add("FOR_ALL_RIGHT");
	m_pAllKeywords->Add("FOR-ALL-RIGHT");
	m_pAllKeywords->Add("FORALLRIGHT");
	m_pAllKeywords->Add("FOR_SOME_RIGHT");
	m_pAllKeywords->Add("FOR-SOME-RIGHT");
	m_pAllKeywords->Add("FORSOMERIGHT");
	m_pAllKeywords->Add("last");
	m_pAllKeywords->Add("next");
	m_pAllKeywords->Add("prefix");
	m_pAllKeywords->Add("infix");
	m_pAllKeywords->Add("root");
	m_pAllKeywords->Add("suffix");
	m_pAllKeywords->Add("initial");
	m_pAllKeywords->Add("final");
	m_pAllKeywords->Add(">");
	m_pAllKeywords->Add(">=");
	m_pAllKeywords->Add("<=");
	m_pAllKeywords->Add("<");
	m_pAllKeywords->Add("~=");
	m_pAllKeywords->Add("left");
	m_pAllKeywords->Add("right");
	m_pAllKeywords->Add("current");
	m_pAllKeywords->Add("LEFT");
	m_pAllKeywords->Add("RIGHT");
	m_pAllKeywords->Add("initial");
	m_pAllKeywords->Add("final");

	readTestEditModel();

#else // mr270
	readRegistry(szSection);
#endif // mr270


	AddKeywords(m_strOPE,m_strOPErators,m_strOPEratorsLower);
	AddKeywords(m_strFOROPE,m_strFOROPerators,m_strFOROPeratorsLower);
	AddKeywords(m_strLOC,m_strLOCations,m_strLOCationsLower);
	AddKeywords(m_strKEYW,m_strKEYWords,m_strKEYWordsLower);
	AddKeywords(m_strCONN,m_strCONNectors,m_strCONNectorsLower);
	AddKeywords(m_strTYP,m_strTYPes,m_strTYPesLower);
	AddKeywords(m_strNBRE,m_strNBR,m_strNBRLower);


	// tab
	PARAFORMAT pf;
	pf.cbSize = sizeof(PARAFORMAT);
	pf.dwMask = PFM_TABSTOPS ;
	pf.cTabCount = MAX_TAB_STOPS;
	for( int itab = 0 ; itab < pf.cTabCount  ; itab++ )
		pf.rgxTabs[itab] =  800;//(itab + 1) * 2000/5;
	SetParaFormat( pf );


	// font
	setDefaultCharFormat( );
	SetEventMask(ENM_CHANGE | ENM_SELCHANGE | ENM_PROTECTED);

	// background
	setBackgroundColor( m_bUseBackgroundSystemColor );

}

void CTestEdit::setDefaultCharFormat( )
{
	CHARFORMAT cfDefault;
	cfDefault.cbSize = sizeof(cfDefault);
	cfDefault.dwEffects = CFE_PROTECTED|CFE_AUTOCOLOR ;
	cfDefault.dwMask = CFM_BOLD | CFM_FACE | CFM_SIZE | CFM_CHARSET | CFM_PROTECTED;

	cfDefault.yHeight = 20*atoi (m_lpzFontSize);
	cfDefault.crTextColor = RGB(0,0,0);

#ifndef mr270
	lstrcpy(cfDefault.szFaceName,(LPTSTR)(LPCTSTR)m_strFontFaceName);
#else // mr270
	strcpy(cfDefault.szFaceName, _T("Verdana"));
#endif // mr270

	SetDefaultCharFormat(cfDefault);
}

void CTestEdit::setSelectionCharFormat( )
{
	HideSelection(TRUE, FALSE);

	CHARFORMAT cf;
	GetSelectionCharFormat( cf );
	cf.dwMask = CFM_BOLD | CFM_FACE | CFM_SIZE | CFM_CHARSET | CFM_PROTECTED;
	cf.yHeight=20*atoi (m_lpzFontSize);

	SetSel( 0,-1);
	SetSelectionCharFormat( cf);
	SetSel( 0,0);

	HideSelection(FALSE, FALSE);
}


void CTestEdit::SetSLComment( TCHAR chComment )
{
	m_chComment = chComment;
}

//void CTestEdit::SetSLComment(LPCTSTR lpszComment)
//{
//	m_strComment = lpszComment;
//}


void CTestEdit::AddKeywords( LPCTSTR lpszKwd,CString &str, CString &strLower )
{
	str = str + lpszKwd;
	strLower = str;
	strLower.MakeLower();
}

void CTestEdit::SetChangeCase(BOOL bChange)
{
	m_bChangeCase = bChange;
}

void CTestEdit::SetStringQuotes(LPCTSTR lpszStrQ)
{
	m_strStringQuotes += lpszStrQ;
}

void CTestEdit::setColor( SymbolColor &color,COLORREF clr,
												BOOL bBold,
												BOOL bItalic,
												BOOL bUnderline,
												BOOL bStrikeout )
{
	color.clrColor = clr;
	color.bBold = bBold;
	color.bItalic = bItalic;
	color.bUnderline = bUnderline;
	color.bStrikeout = bStrikeout;
}

BEGIN_MESSAGE_MAP(CTestEdit, CRichEditCtrl)
	ON_CONTROL_REFLECT(EN_CHANGE, OnChange)
	ON_WM_GETDLGCODE()
	ON_WM_CHAR()
	ON_NOTIFY_REFLECT(EN_PROTECTED, OnProtected)
	ON_NOTIFY_REFLECT(EN_SELCHANGE, OnSelChange)
	ON_MESSAGE(WM_SETTEXT, OnSetText)
	ON_WM_CONTEXTMENU()
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTestEdit message handlers

UINT CTestEdit::OnGetDlgCode()
{
	UINT uCode = CRichEditCtrl::OnGetDlgCode();

	uCode = DLGC_WANTALLKEYS | DLGC_WANTARROWS | DLGC_WANTCHARS | DLGC_WANTMESSAGE | DLGC_WANTTAB;

	return uCode;
}

void CTestEdit::OnChar(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	if (nChar == '\t' && GetKeyState(VK_CONTROL) >= 0) {
		ReplaceSel("\t");
		return;
	}

	CRichEditCtrl::OnChar(nChar, nRepCnt, nFlags);
}


int CTestEdit::searching( LPCTSTR lpszSymbol,CString &strGroup )
{
	CString strSymbol;
/*
	CString temp;
	BOOL bCorrection=FALSE;
	if( lpszSymbol[0]=='(' )
	{
		bCorrection=TRUE;
		int l = strlen(lpszSymbol);
		for(int i=0;i < l ;i++)
		{
			TCHAR c = lpszSymbol[i];

			if( c != '(')
			{
				temp += c;
			}
		}

	}

	if(bCorrection)
		lpszSymbol=temp;

*/
	strSymbol.Format(" %s ", lpszSymbol);
	strSymbol.MakeLower();

	return strGroup.Find(strSymbol);
}

BOOL CTestEdit::IsStringQuote(TCHAR ch)
{
	return (m_strStringQuotes.Find(ch) >= 0);
}


void CTestEdit::SetFormatRange(int nStart, int nEnd, BOOL bBold,
							   BOOL bItalic,BOOL bUnderline,
							   BOOL bStrikeout,COLORREF clr)
{
	if (nStart >= nEnd)
		return;

	SetSel(nStart, nEnd);

	DWORD dwEffects = 0;
	if( bBold )
	{
		dwEffects |= CFE_BOLD;
	}

	if( bItalic )
	{
		dwEffects |= CFE_ITALIC;
	}

	if( bUnderline )
	{
		dwEffects |= CFE_UNDERLINE;
	}

	if( bStrikeout )
	{
		dwEffects |= CFE_STRIKEOUT;
	}

	CHARFORMAT cfm;
	cfm.cbSize = sizeof(cfm);
	GetSelectionCharFormat(cfm);

	cfm.dwEffects = dwEffects;
	cfm.crTextColor = clr;
	cfm.dwMask = CFM_BOLD|CFM_ITALIC|CFM_UNDERLINE|CFM_STRIKEOUT|CFM_COLOR;

	SetSelectionCharFormat(cfm);
}

void CTestEdit::ChangeCase(int nStart, int nEnd, LPCTSTR lpsz)
{
	ASSERT((nEnd - nStart) == (int)_tcslen(lpsz));

	if(( strcmp( lpsz,"left" )==0 ) ||
	   ( strcmp( lpsz,"LEFT" )==0 ) ||
	   ( strcmp( lpsz,"right" )==0 ) ||
	   ( strcmp( lpsz,"RIGHT" )==0 ) ||
	   ( strcmp( lpsz,"initial" )==0 ) ||
	   ( strcmp( lpsz,"INITIAL" )==0 ) ||
	   ( strcmp( lpsz,"final" )==0 ) ||
	   ( strcmp( lpsz,"FINAL" )==0 ) )
	{
		return;
	}

	if( m_bChangeCase )
	{
		SetSel(nStart, nEnd);
		ReplaceSel(lpsz);
	}
}

void CTestEdit::FormatTextRange(int nStart, int nEnd)
{
	if (nStart >= nEnd)
		return;

	CString strLastKeyWord;
	int n_propertyFollowBy=0,n_morphnameFollowBy=0,n_isFollowBy=0,
		n_identifierFollowBy=0,n_memberFollowBy=0,n_position_exprFollowBy=0,
		n_allomorphFollowBy=0,n_matchesFollowBy=0,n_surfaceFollowBy=0,
		n_wordFollowBy=0,n_neighbor_exprFollowBy=0,n_fromtocategoryFollowBy=0,
		n_capitalizedFollowBy=0,n_orderclassFollowBy=0,n_relopFollowBy=0,
		n_constantFollowBy=0,n_Type_exprFollowBy=0,n_typeFollowBy=0,n_logopFollowBy=0,
		n_for_exprFollowBy=0,n_insertFollowBy=0,n_after_beforeFollowBy=0,
		n_reportFollowBy=0,n_orderclassmaxmin=0, n_punctuation=0;

	int n_previous_is=-1;


	BOOL bIdentifier=FALSE,bPosition_expr=FALSE,bNeighbor_expr=FALSE,bFromtocategory=FALSE,
		bRelop=FALSE,bConstant=FALSE,bTypeExpr=FALSE,bLogop=FALSE,bFor_expr=FALSE;


	BOOL bCommentMarker = FALSE;
	BOOL bFound=FALSE;


	CHARRANGE crOldSel;
	GetSel(crOldSel);
	LockWindowUpdate();
	HideSelection(TRUE, FALSE);

	TCHAR *pBuffer = NULL;
	try {
		SetSel(nStart, nEnd);
		pBuffer = new TCHAR[nEnd - nStart + 1];
		long nLen = GetSelText(pBuffer);

		ASSERT(nLen <= nEnd - nStart);

		pBuffer[nLen] = 0;

		TCHAR *pStart, *pPtr;
		pStart = pPtr = pBuffer;

		TCHAR *pSymbolStart = NULL;
		SymbolColor ic = m_colorDefault;

		while (*pPtr != 0)
		{
			TCHAR ch = *pPtr;

			if( strLastKeyWord=="is" )
				n_isFollowBy=2;
			if( strLastKeyWord=="property" )
			{
				n_propertyFollowBy=2;
				n_previous_is=1;
			}
			if( strLastKeyWord=="morphname" )
			{
				n_morphnameFollowBy=2;
				n_previous_is=0;
			}
			if( strLastKeyWord=="allomorph" )
			{
				n_allomorphFollowBy=2;
				n_previous_is=2;
			}
			if( strLastKeyWord=="surface" || strLastKeyWord=="string" )
			{
				n_surfaceFollowBy=2;
				n_previous_is=3;
			}
			if( strLastKeyWord=="word" )
			{
				n_wordFollowBy=2;
				n_previous_is=4;
			}


			if(bFromtocategory)
			{
				n_fromtocategoryFollowBy=2;
				n_previous_is=5;
			}

			if( strLastKeyWord=="type" )
			{
				n_typeFollowBy=2;
				n_previous_is=6;
			}

			if(strLastKeyWord=="punctuation")
			{
				n_punctuation=2;
				n_previous_is=7;
			}


			if( strLastKeyWord=="member" )
				n_memberFollowBy=2;
			if( strLastKeyWord=="matches" )
				n_matchesFollowBy=2;






			if(bPosition_expr)
				n_position_exprFollowBy=2;
			if(bNeighbor_expr)
				n_neighbor_exprFollowBy=2;
			if(bFor_expr)
				n_for_exprFollowBy=2;
			if(bIdentifier)
				n_identifierFollowBy=2;

			if(strLastKeyWord=="capitalized")
				n_capitalizedFollowBy=2;
			if(strLastKeyWord=="orderclass")
				n_orderclassFollowBy=2;
			if(bRelop)
				n_relopFollowBy=2;
			if(bConstant)
				n_constantFollowBy=2;
			if(bTypeExpr)
				n_Type_exprFollowBy=2;
			if(bLogop)
				n_logopFollowBy=2;
			if(strLastKeyWord=="insert")
				n_insertFollowBy=2;
			if(strLastKeyWord=="after" || strLastKeyWord=="before")
				n_after_beforeFollowBy=2;
			if(strLastKeyWord=="report")
				n_reportFollowBy=2;
			if(strLastKeyWord=="orderclassmin" || strLastKeyWord=="orderclassmax")
				n_orderclassmaxmin=2;


			// //////////////////
			// Process comment |
			// //////////////////
			if (ch == m_chComment )
			{
				pSymbolStart = pPtr;
				do
				{
					ch = *(++pPtr);
				}	while (ch != 0 && ch != '\r');
				ic = m_colorCOMments;
			}

			// only for Stamp keyword report "<string>"
			//else if ( IsStringQuote(ch) && !m_bIsAmple && n_reportFollowBy==2 )
			else if( !m_bIsAmple && n_reportFollowBy==2 )
			{
				int nCountQuoteMarks=2;
				BOOL bOK=FALSE;
				pSymbolStart = pPtr;

				do
				{
					ch = *(pPtr++);

					if(ch=='\"')
					{
						nCountQuoteMarks--;
						if(nCountQuoteMarks==0)
						{
							bOK=TRUE;
							break;
						}
					}
				}	while ( !iscntrl(ch) );

			if(bOK)
				ic = m_colorIdentifiers;
			else
				ic = m_colorError;

			n_reportFollowBy=0;
			strLastKeyWord.Empty();
			}


			// //////////////////////////////////////////////////////////
			// Process keywords: OPErators POSitions TYPes TRM NBR ACT
			// //////////////////////////////////////////////////////////

			else if ( isalnum (ch )
									|| ch == '_'
									|| ch == '!'
									|| ch == '@'
									|| ch == '#'
									|| ch == '$'
									|| ch == '%'
									|| ch == '^'
									|| ch == '*'
								//	|| ch == '('
								//	|| ch == ')'
									|| ch == '{'
									|| ch == '}'
									|| ch == '['
									|| ch == ']'
									|| ch == '+'
									|| ch == ':'
									|| ch == ','
									|| ch == '/'
									|| ch == '?'
									|| ch == '`'
									|| ch == '|'
									|| ch == '='
									|| ch == '>'
									|| ch == '<'
									|| ch == '-'
									|| ch == '~'
									|| ch == '\\'
									|| ch == '&'
									|| ch == ';'
									|| ch == '.'
									|| ch == '\"'
									|| ch == '\'' )
			{



				pSymbolStart = pPtr;
				do {
					ch = *(++pPtr);
				} while (isalnum(ch) || ch == '_'
									 || ch == '='

									|| ch == '!'
									|| ch == '@'
									|| ch == '#'
									|| ch == '$'
									|| ch == '%'
									|| ch == '^'
									|| ch == '*'

								//	|| ch == '('
								//	|| ch == ')'

									|| ch == '{'
									|| ch == '}'
									|| ch == '['
									|| ch == ']'
									|| ch == '+'
									|| ch == ':'
									|| ch == ','
									|| ch == '/'
									|| ch == '?'
									|| ch == '`'
									|| ch == '|'
									|| ch == '>'
									|| ch == '<'
									|| ch == '~'
									|| ch == '&'
									|| ch == ';'
									|| ch == '-'
									|| ch == '\\'
									|| ch == '.'
									|| ch == '\"'
									|| ch == '\'' );


					// ///////////////////
					// logical operators
					// ///////////////////

					*pPtr = 0;
					int nPos = searching( pSymbolStart,m_strOPEratorsLower );
					if (nPos >= 0 && !bFound )
					{
						ChangeCase(nStart + pSymbolStart - pBuffer, nStart + pPtr - pBuffer,
									m_strOPErators.Mid(nPos+1, pPtr - pSymbolStart));
						ic = m_colorOPErators;
						bFound = TRUE;
						strLastKeyWord = pSymbolStart;

						if( strLastKeyWord=="AND" ||
							strLastKeyWord=="OR" ||
							strLastKeyWord=="XOR" ||
							strLastKeyWord=="IFF")
						{
							bLogop=TRUE;
						}



					}

					// ///////////////////
					// FOR operators
					// ///////////////////

					*pPtr = 0;
					nPos = searching( pSymbolStart,m_strFOROPeratorsLower );
					if (nPos >= 0 && !bFound )
					{
						ChangeCase(nStart + pSymbolStart - pBuffer, nStart + pPtr - pBuffer,
									m_strFOROPerators.Mid(nPos+1, pPtr - pSymbolStart));
						ic = m_colorForOPErators;
						bFound = TRUE;
						strLastKeyWord = pSymbolStart;
						bFor_expr=TRUE;
					}

					// ///////////////////
					// locators
					// ///////////////////

					*pPtr = 0;
					nPos = searching( pSymbolStart,m_strLOCationsLower );
					if (nPos >= 0 && !bFound )
					{
						ChangeCase(nStart + pSymbolStart - pBuffer, nStart + pPtr - pBuffer,
									m_strLOCations.Mid(nPos+1, pPtr - pSymbolStart));
						ic = m_colorLOCations;
						bFound = TRUE;
						strLastKeyWord = pSymbolStart;

						if(strLastKeyWord=="left" ||
							strLastKeyWord=="right" ||
							strLastKeyWord=="current" ||
							strLastKeyWord=="LEFT" ||
							strLastKeyWord=="RIGHT" ||
							strLastKeyWord=="INITIAL" ||
							strLastKeyWord=="FINAL" ||
							strLastKeyWord=="initial" ||
							strLastKeyWord=="final")
						{
							bPosition_expr=TRUE;
						}

						if(strLastKeyWord=="last" || strLastKeyWord=="next" )
							bNeighbor_expr=TRUE;
					}

					// ///////////////////
					// item keywords
					// ///////////////////

					*pPtr = 0;
					nPos = searching( pSymbolStart,m_strKEYWordsLower );
					if (nPos >= 0 && !bFound )
					{
						ChangeCase(nStart + pSymbolStart - pBuffer, nStart + pPtr - pBuffer,
									m_strKEYWords.Mid(nPos+1, pPtr - pSymbolStart));
						ic = m_colorKEYWords;
						bFound = TRUE;
						strLastKeyWord = pSymbolStart;

						if(strLastKeyWord=="fromcategory" || strLastKeyWord=="tocategory")
							bFromtocategory=TRUE;
					}

					// ///////////////////
					// connectors
					// ///////////////////

					*pPtr = 0;
					nPos = searching( pSymbolStart,m_strCONNectorsLower );
					if (nPos >= 0 && !bFound )
					{
						ChangeCase(nStart + pSymbolStart - pBuffer, nStart + pPtr - pBuffer,
									m_strCONNectors.Mid(nPos+1, pPtr - pSymbolStart));
						ic = m_colorCONNectors;
						bFound = TRUE;

						strLastKeyWord=pSymbolStart;


						for(int i=0;i<m_pRELOPList->GetSize();i++)
						{
							if(strLastKeyWord.Compare(m_pRELOPList->GetAt(i))==0)
							{
								bRelop=TRUE;
								break;
							}
						}





						strLastKeyWord = pSymbolStart;
					}


					// /////////
					// TYPes
					// /////////

					nPos = searching( pSymbolStart,m_strTYPesLower );
					if (nPos >= 0 && !bFound )
					{
						ChangeCase(nStart + pSymbolStart - pBuffer, nStart + pPtr - pBuffer,
										m_strTYPes.Mid(nPos+1, pPtr - pSymbolStart));
						ic = m_colorTYPes;
						bFound = TRUE;
						strLastKeyWord = pSymbolStart;
						bTypeExpr=TRUE;
					}


					if(!bFound) {
						bIdentifier=TRUE;
						strLastKeyWord=pSymbolStart;
					}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////

					BOOL bFlag=FALSE;

					if(n_isFollowBy==2)
					{
						BOOL bIdentifierAllowed=FALSE;
						CStringArray *pstrTemp = new CStringArray();
						switch(n_previous_is)
						{
						case 0: // morphname is ....
							pstrTemp->Add(szIdentif);
							pstrTemp->Add("member");
							pstrTemp->Append(*m_pPOSITIONList);
							bIdentifierAllowed=TRUE;
							break;
						case 1: // property is ...
							pstrTemp->Add(szIdentif);
							bIdentifierAllowed=TRUE;
							break;
						case 2: // allomorph is ...
							pstrTemp->Add(szIdentif);
							pstrTemp->Add("member");
							pstrTemp->Append(*m_pPOSITIONList);
							pstrTemp->Add("capitalized");
							bIdentifierAllowed=TRUE;
							break;
						case 3: // surface/string is ...
							pstrTemp->Add(szIdentif);
							pstrTemp->Add("member");
							pstrTemp->Append(*m_pPOSITIONList);
							bIdentifierAllowed=TRUE;
							break;
						case 4: // word is ...
							pstrTemp->Add(szIdentif);
							pstrTemp->Add("member");
							pstrTemp->Add("capitalized");
							bIdentifierAllowed=TRUE;
							break;
						case 5: // from/tocategory is ...
							pstrTemp->Append(*m_pPOSITIONList);
							pstrTemp->Add("member");
							pstrTemp->Add(szIdentif);
							bIdentifierAllowed=TRUE;
							break;
						case 6: // type is ...
							pstrTemp->Append(*m_pTYPEList);
							break;
						case 7:
							pstrTemp->Add(szIdentif);
							pstrTemp->Add("member");
							bIdentifierAllowed=TRUE;
							break;
						default:
							break;
						}


						int n = checkNextWord(pstrTemp,m_pAllKeywords,strLastKeyWord,bIdentifierAllowed,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}

						delete pstrTemp;
						n_isFollowBy=0;
						n_previous_is=-1;
						bFlag=TRUE;
					}


					if(n_matchesFollowBy==2)
					{

						BOOL bIdentifierAllowed=FALSE;
						CStringArray *pstrTemp = new CStringArray();
						switch(n_previous_is)
						{
						case 2: // allomorph matches ....
							pstrTemp->Append(*m_pPOSITIONList);
							pstrTemp->Add("member");
							pstrTemp->Add(szIdentif);
							bIdentifierAllowed=TRUE;
							break;
						case 3: // surface/string matches ....
							pstrTemp->Append(*m_pPOSITIONList);
							pstrTemp->Add("member");
							pstrTemp->Add(szIdentif);
							bIdentifierAllowed=TRUE;
							break;
						case 4: // word matches ....
							pstrTemp->Add("member");
							pstrTemp->Add(szIdentif);
							bIdentifierAllowed=TRUE;
							break;
						default:
							break;
						}


						int n = checkNextWord(pstrTemp,m_pAllKeywords,strLastKeyWord,bIdentifierAllowed,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}

						n_matchesFollowBy=0;
						bFlag=TRUE;
						n_previous_is=-1;
						delete pstrTemp;
					}




					if(n_memberFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_member,m_pAllKeywords,strLastKeyWord,TRUE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_memberFollowBy=0;
						bFlag=TRUE;
					}


					if(n_morphnameFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_morphname,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_morphnameFollowBy=0;
						bFlag=TRUE;
					}

					if(n_allomorphFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_allomorph,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_allomorphFollowBy=0;
						bFlag=TRUE;
					}

					if(n_surfaceFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_surface,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_surfaceFollowBy=0;
						bFlag=TRUE;
					}

					if(n_wordFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_word,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_wordFollowBy=0;
						bFlag=TRUE;
					}

					if(n_typeFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_type,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_typeFollowBy=0;
						bFlag=TRUE;
					}

					if(n_position_exprFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_position,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_position_exprFollowBy=0;
						bPosition_expr=FALSE;
						bFlag=TRUE;
					}

					if(n_neighbor_exprFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_neighbor,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_neighbor_exprFollowBy=0;
						bNeighbor_expr=FALSE;
						bFlag=TRUE;
					}

					if(n_for_exprFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_for,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_for_exprFollowBy=0;
						bFor_expr=FALSE;
						bFlag=TRUE;
					}


					if(n_identifierFollowBy==2)
					{
						int n = checkNextWord(m_pIdentifier,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_identifierFollowBy=0;
						bIdentifier=FALSE;
						bFlag=TRUE;
					}

					if(n_propertyFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_property,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_propertyFollowBy=0;
						bFlag=TRUE;
					}

					if(n_fromtocategoryFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_fromtocategory,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_fromtocategoryFollowBy=0;
						bFromtocategory=FALSE;
						bFlag=TRUE;
					}

					if(n_capitalizedFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_capitalized,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_capitalizedFollowBy=0;
						bFlag=TRUE;
					}

					if(n_orderclassFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_orderclass,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_orderclassFollowBy=0;
						bFlag=TRUE;
					}

					if(n_relopFollowBy==2)
					{
						int n=0;
						if(bFound) // <relop> is followed by a kewyword; check if it belongs to the <position> group
						{
							n = checkNextWord(m_pKeyword_relop,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
							// color ????????
						}


						if(n != 0 || !bFound) // <relop> is followed by a non-keyword; let's check if it is a valid number.
						{

							if(checkConstant(m_pConstant,strLastKeyWord))
							{
								ic = m_colorIdentifiers;
								bConstant=TRUE;
							}
							else
								ic = m_colorError;
						}

						n_relopFollowBy=0;
						bRelop=FALSE;
						bFlag=TRUE;
					}

					if(n_constantFollowBy==2)
					{
						int n = checkNextWord(m_pConst,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_constantFollowBy=0;
						bConstant=FALSE;
						bFlag=TRUE;
					}

					if(n_Type_exprFollowBy==2)
					{
						int n = checkNextWord(m_pType,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_Type_exprFollowBy=0;
						bTypeExpr=FALSE;
						bFlag=TRUE;
					}

					if(n_logopFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_logop,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_logopFollowBy=0;
						bLogop=FALSE;
						bFlag=TRUE;
					}

					if(n_insertFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_insert,m_pAllKeywords,strLastKeyWord,TRUE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_insertFollowBy=0;
						bFlag=TRUE;
					}

					if(!bFound && !bFlag){
						ic = m_colorError;}

					// does the line begin with the marker \co ?
					if( strspn( pSymbolStart, "\\co" ) == 3 )
					{
						bCommentMarker=TRUE;
					}

					if(n_after_beforeFollowBy==2)
					{
						int n = checkNextWord(m_pKeyword_afterbefore,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_after_beforeFollowBy=0;
						bFlag=TRUE;
					}

					if(n_orderclassmaxmin==2)
					{
						int n = checkNextWord(m_pKeyword_orderclassminmax,m_pAllKeywords,strLastKeyWord,FALSE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_orderclassmaxmin=0;
						bFlag=TRUE;
					}

					if(n_punctuation==2)
					{
						int n = checkNextWord(m_pKeywordPunctuation,m_pAllKeywords,strLastKeyWord,TRUE,bIdentifier);
						switch(n)
						{
						case 1:
							ic = m_colorError;
							break;
						case 2:
							ic = m_colorIdentifiers;
							break;
						}
						n_punctuation=0;
						bFlag=TRUE;
					}

				bFound=FALSE;
				*pPtr = ch;
			}
			else
			{
				pPtr++;
			}


			if (pSymbolStart != NULL)
			{
				ASSERT(pSymbolStart < pPtr);

				SetFormatRange(nStart + pStart - pBuffer,
					nStart + pSymbolStart - pBuffer,
					FALSE, FALSE, FALSE, FALSE,
					m_colorDefault.clrColor);

				// line begins with the marker \co
				if( bCommentMarker )
				{
					ic = m_colorCOMments;
				}

				SetFormatRange(nStart + pSymbolStart - pBuffer,
					nStart + pPtr - pBuffer,
					ic.bBold,ic.bItalic,ic.bUnderline,ic.bStrikeout,
					ic.clrColor);


				pStart = pPtr;
				pSymbolStart = 0;
			}
			else if (*pPtr == 0)
			{
				SetFormatRange(nStart + pStart - pBuffer,
					nStart + pPtr - pBuffer,
					FALSE,FALSE,FALSE,FALSE,
					m_colorDefault.clrColor);
			}
		}

		} // while 1



	catch(...){}

	delete [] pBuffer;

	SetSel(crOldSel);
	HideSelection(FALSE, FALSE);
	UnlockWindowUpdate();

}


void CTestEdit::FormatTextLines(int nLineStart, int nLineEnd)
{
	long nStart = LineIndex(LineFromChar(nLineStart));
	long nEnd = LineIndex(LineFromChar(nLineEnd));
	nEnd += LineLength(nLineEnd);

	FormatTextRange(nStart, nEnd);
}


void CTestEdit::FormatAll()
{
	FormatTextRange(0, GetTextLength());
}

LRESULT CTestEdit::OnSetText(WPARAM wParam, LPARAM lParam)
{
	LRESULT res = Default();
	FormatAll();
	return res;
}

void CTestEdit::OnChange()
{
	CHARRANGE crCurSel;
	GetSel(crCurSel);

	if (m_changeType == ctMove && crCurSel.cpMin == crCurSel.cpMax)
	{
		m_changeType = ctPaste;
	}

	switch(m_changeType) {
	case ctReplSel:
	case ctPaste:
		FormatTextLines(m_crOldSel.cpMin, crCurSel.cpMax);
		break;
	case ctDelete:
	case ctBack:
	case ctCut:
		FormatTextLines(crCurSel.cpMin, crCurSel.cpMax);
		break;
	case ctUndo:
		FormatTextLines(crCurSel.cpMin, crCurSel.cpMax);
		break;
	case ctMove:
		FormatTextLines(crCurSel.cpMin, crCurSel.cpMax);
		if (crCurSel.cpMin > m_crOldSel.cpMin) // move after
			FormatTextLines(m_crOldSel.cpMin, m_crOldSel.cpMin);
		else // move before
			FormatTextLines(m_crOldSel.cpMax, m_crOldSel.cpMax);
		break;
	default:
		//FormatAll();
		break;
	}

	// undo action does not call OnProtected, so make it default
	m_changeType = ctUndo;
}

void CTestEdit::OnProtected(NMHDR* pNMHDR, LRESULT* pResult)
{
	ENPROTECTED* pEP = (ENPROTECTED*)pNMHDR;


	switch (pEP->msg)
	{
		case WM_KEYDOWN:
			switch (pEP->wParam)
			{
			case VK_DELETE:
				m_changeType = ctDelete;
				break;
			case VK_BACK:
				m_changeType = ctBack;
				break;
			default:
				m_changeType = ctUnknown;
				break;
			}
		break;
	case EM_REPLACESEL:
	case WM_CHAR:
		m_changeType = ctReplSel;
		break;
	case WM_PASTE:
		m_changeType = (m_changeType == ctCut)?ctMove:ctPaste;
		break;
	case WM_CUT:
		m_changeType = ctCut;
		break;
	default:
		m_changeType = ctUnknown;
		break;
	};

	if (pEP->msg != EM_SETCHARFORMAT && m_changeType != ctMove)
		m_crOldSel = pEP->chrg;

	*pResult = FALSE;
}

void CTestEdit::OnSelChange(NMHDR* pNMHDR, LRESULT* pResult)
{
	SELCHANGE* pSC = (SELCHANGE*)pNMHDR;

	*pResult = 0;
}

void CTestEdit::setWordWrap( BOOL bFlag )
{
	// 0 = ON	1 = OFF

	int nFlag = 1;

	if( bFlag )
		nFlag=0;


	SetTargetDevice(NULL,nFlag);
}

void CTestEdit::setBackgroundColor( BOOL bUseSystemColor )
{

	SetBackgroundColor( bUseSystemColor,m_clrBackgoundColor );
}
#ifndef mr270
void CTestEdit::setFontFaceName(CString lpstrFontName)
{
	m_strFontFaceName=lpstrFontName;
}
#endif // mr270

int CTestEdit::checkNextWord(CStringArray *pstrAuthorized,
							 CStringArray *pstrAall,
							 CString &pstrLastKeyWord,
							 BOOL bIdentifierAuthorized,
							 BOOL bIsIdentifier )
{

	CString temp;
	BOOL bFound=FALSE;
	BOOL nReturn=2; // 0=authorized  1=non-authorized 2=identifier

	if(bIdentifierAuthorized && bIsIdentifier )
	{
		return nReturn;
	}

	for(int i=0;i<pstrAuthorized->GetSize();i++)
	{
		temp=pstrAuthorized->GetAt(i);
		// Found
		if(temp.Collate(pstrLastKeyWord)==0)
		{
			bFound=TRUE;
			nReturn=0;
			break;
		}
	}
	// pas trouve, cherche si est un autre keyword sinon est un <identifier>
	if(!bFound)
	{
		nReturn=2; // force identifier

		for(int i=0;i<pstrAall->GetSize();i++)
		{
			temp=pstrAall->GetAt(i);
			if(temp.Collate(pstrLastKeyWord)==0)
			{
				nReturn=1;
				break;
			}
		}


	}


	if(!bIdentifierAuthorized && nReturn==2)
		nReturn=1;


	return nReturn;
}

BOOL CTestEdit::checkConstant(CStringArray *pstrConstant,
							 CString &pstrLastKeyWord )
{
	BOOL bResult=TRUE;

		for(int ii=0;ii<pstrLastKeyWord.GetLength();ii++)
		{
			BOOL bFound=FALSE;
			for(int i=0;i<pstrConstant->GetSize();i++)
			{
				if(pstrLastKeyWord.GetAt(ii)==pstrConstant->GetAt(i))
				{
					bFound=TRUE;
					break;
				}
			}
			if(!bFound)
			{
				bResult=FALSE;
				break;
			}
		}


	// test limit number
	if(bResult)
	{
		int nV = atoi (pstrLastKeyWord);
		if(nV>32767 || nV<-32767)
			bResult=FALSE;
	}


	if(!bResult)
	{
		return bResult;
	}

	// test if minus is present
	else if(bResult)
	{
		// search for minus and test its place
		BOOL bMinusPresent=FALSE;
		int nCountMinus=0;
		for(ii=0;ii<pstrLastKeyWord.GetLength();ii++)
		{
			if(pstrLastKeyWord.GetAt(ii)=='-')
			{
				if(ii==0)
				{
					bMinusPresent=TRUE;
					nCountMinus++;
				}
				else
					nCountMinus++;
			}
		}


		// --9999 is not allowed
		if(bMinusPresent && nCountMinus >1)
			bResult=FALSE;

		// 9-999 is not allowed
		if(!bMinusPresent && nCountMinus >0)
			bResult=FALSE;

		// -0 is not allowed
		if(pstrLastKeyWord=="-0")
			bResult=FALSE;
		}

	return bResult;
}
