// DlgEditToneParseProcess.cpp : implementation file
//
// jdh 2/9/00 added answer file path
// 2.0.5 10-Feb-2000 hab Added -v option to verify control file information
//                       Increased max value for trace level to 8191
// 2.4.1 01-Nov-2000 hab Reworked to handle TonePars 1.0.0

#include "stdafx.h"
#include "..\resource.h"
#include "DlgEditToneParseProcess.h"
#include "DlgEditToneTracing.h"
#ifndef mr270
#include "..\..\pc-parse\TonePGLib\tonepars.h"	// Added by ClassView

#else // mr270
#include "tonepars.h"
#include "..\..\pc-parse\TonePGLib\tonepars.h"	// Added by ClassView

#endif // mr270

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditToneParseProcess dialog


CDlgEditToneParseProcess::CDlgEditToneParseProcess(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditToneParseProcess::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEditToneParseProcess)
	m_bMonitorProgress = FALSE;
	m_bVerifyControlFileInformation = FALSE;
	m_bTraceToneProcessing = FALSE;
	m_sControlFilePath = _T("");
	m_nTracingLevel = 0;
	m_bCheckMorphnames = FALSE;
	//}}AFX_DATA_INIT
}


void CDlgEditToneParseProcess::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditToneParseProcess)
	DDX_Control(pDX, IDC_BUTTONToneParsTraceOptions, m_btnTracingOptions);
	DDX_Control(pDX, IDC_BUTTONToneParsControlFile, m_btnControlPath);
	DDX_Check(pDX, IDC_bMonitorProgress, m_bMonitorProgress);
	DDX_Check(pDX, IDC_bVerifyControlFileInformation, m_bVerifyControlFileInformation);
	DDX_Check(pDX, IDC_bTraceToneProcessing, m_bTraceToneProcessing);
	DDX_Text(pDX, IDC_EDITControlFile, m_sControlFilePath);
	DDX_Text(pDX, IDC_EDITTraceLevelParse, m_nTracingLevel);
	DDX_Check(pDX, IDC_CHECKToneParseMorphnames, m_bCheckMorphnames);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEditToneParseProcess, CDialog)
	//{{AFX_MSG_MAP(CDlgEditToneParseProcess)
	ON_BN_CLICKED(IDC_BUTTONToneParsControlFile, OnBUTTONToneParsControlFile)
	ON_BN_CLICKED(IDC_BUTTONToneParsTraceOptions, OnBUTTONToneParsTraceOptions)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditToneParseProcess message handlers

void CDlgEditToneParseProcess::OnBUTTONToneParsControlFile()
{
  UpdateData(TRUE); // download any ctrl values, because we're going to upload at the end of this method
  CFileDialog	dlg( TRUE,
			 NULL, //ext
			 m_sControlFilePath,
			 OFN_FILEMUSTEXIST | OFN_HIDEREADONLY ,	// flags
			 "Control files(*.ctl)|*.ctl||", // filter
			 NULL ); // parent window

  if(IDOK != dlg.DoModal())
	{
	  m_sControlFilePath = "";	// let cancel be the way to clear a file
	}
  else
	m_sControlFilePath = dlg.GetPathName();
  UpdateData(FALSE);
}

void CDlgEditToneParseProcess::OnBUTTONToneParsTraceOptions()
{
  UpdateData(TRUE); // download any ctrl values, because we're going to upload at the end of this method
  if (m_bTraceToneProcessing)
	m_nTracingLevel |= TRACE_TONE_TIER;
  else
	m_nTracingLevel &= ~TRACE_TONE_TIER;
  CDlgEditToneTracing dlg(NULL);
  dlg.m_bDomains = (m_nTracingLevel & TRACE_DOMAINS) ? TRUE : FALSE;
  dlg.m_bMora = (m_nTracingLevel & TRACE_MORA) ? TRUE : FALSE;
  dlg.m_bSegments = (m_nTracingLevel & TRACE_SEGMENTS) ? TRUE : FALSE;
  dlg.m_bSyllable = (m_nTracingLevel & TRACE_SYLLABLE) ? TRUE : FALSE;
  dlg.m_bTBU = (m_nTracingLevel & TRACE_TBU) ? TRUE : FALSE;
  dlg.m_bLinkAnalysis = (m_nTracingLevel & TRACE_LINK_ANAL) ? TRUE : FALSE;
  dlg.m_bMorpheme = (m_nTracingLevel & TRACE_MORPHEME_TONES) ? TRUE : FALSE;
  dlg.m_bToneTier = (m_nTracingLevel & TRACE_TONE_OLD) ? TRUE : FALSE;
  dlg.m_bToneRule = (m_nTracingLevel & TRACE_TONE_TIER) ? TRUE : FALSE;
  if(IDOK == dlg.DoModal())
	{
	  if (dlg.m_bDomains)
		m_nTracingLevel |= TRACE_DOMAINS;
	  else
		m_nTracingLevel &= ~TRACE_DOMAINS;
	  if (dlg.m_bMora)
		m_nTracingLevel |= TRACE_MORA;
	  else
		m_nTracingLevel &= ~TRACE_MORA;
	  if (dlg.m_bSegments)
		m_nTracingLevel |= TRACE_SEGMENTS;
	  else
		m_nTracingLevel &= ~TRACE_SEGMENTS;
	  if (dlg.m_bSyllable)
		m_nTracingLevel |= TRACE_SYLLABLE;
	  else
		m_nTracingLevel &= ~TRACE_SYLLABLE;
	  if (dlg.m_bTBU)
		m_nTracingLevel |= TRACE_TBU;
	  else
		m_nTracingLevel &= ~TRACE_TBU;
	  if (dlg.m_bLinkAnalysis)
		m_nTracingLevel |= TRACE_LINK_ANAL;
	  else
		m_nTracingLevel &= ~TRACE_LINK_ANAL;
	  if (dlg.m_bMorpheme)
		m_nTracingLevel |= TRACE_MORPHEME_TONES;
	  else
		m_nTracingLevel &= ~TRACE_MORPHEME_TONES;
	  if (dlg.m_bToneTier)
		m_nTracingLevel |= TRACE_TONE_OLD;
	  else
		m_nTracingLevel &= ~TRACE_TONE_OLD;
	  if (dlg.m_bToneRule)
	{
	  m_nTracingLevel |= TRACE_TONE_TIER;
	  m_bTraceToneProcessing = TRUE;
	}
	  else
	{
	  m_nTracingLevel &= ~TRACE_TONE_TIER;
	  m_bTraceToneProcessing = FALSE;
	}
	}

  UpdateData(FALSE);
}
