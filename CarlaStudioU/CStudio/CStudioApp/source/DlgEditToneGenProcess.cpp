// DlgEditToneGenProcess.cpp : implementation file
//
// 2.4.1 01-Nov-2000 hab Reworked to handle ToneGen 1.0.0

#include "stdafx.h"
#include "..\resource.h"
#include "DlgEditToneGenProcess.h"
#include "DlgEditToneTracing.h"
#include "tonepars.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditToneGenProcess dialog


CDlgEditToneGenProcess::CDlgEditToneGenProcess(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditToneGenProcess::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEditToneGenProcess)
	m_bMonitorProgress = FALSE;
	m_bVerifyControlFileInformation = FALSE;
	m_bTraceToneProcessing = FALSE;
	m_sControlFilePath = _T("");
	m_nTracingLevel = 0;
	m_bCheckMorphnames = FALSE;
	m_bOutputAllSyntheses = FALSE;
	m_bCheckRootCats = FALSE;
	m_bTraceSynthesis = FALSE;
	//}}AFX_DATA_INIT
}


void CDlgEditToneGenProcess::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditToneGenProcess)
	DDX_Control(pDX, IDC_BUTTONToneGenTraceOptions, m_btnTracingOptions);
	DDX_Control(pDX, IDC_BUTTONToneGenControlFile, m_btnControlPath);
	DDX_Check(pDX, IDC_bMonitorProgressGen, m_bMonitorProgress);
	DDX_Check(pDX, IDC_bVerifyControlFileInformationGen, m_bVerifyControlFileInformation);
	DDX_Check(pDX, IDC_bTraceToneProcessingGen, m_bTraceToneProcessing);
	DDX_Text(pDX, IDC_EDITControlFileGen, m_sControlFilePath);
	DDX_Text(pDX, IDC_EDITTraceLevelGen, m_nTracingLevel);
	DDX_Check(pDX, IDC_CHECKToneGenMoprhnames, m_bCheckMorphnames);
	DDX_Check(pDX, IDC_CHECKToneGenOutputAll, m_bOutputAllSyntheses);
	DDX_Check(pDX, IDC_CHECKToneGenRootCats, m_bCheckRootCats);
	DDX_Check(pDX, IDC_CHECKToneGenTraceSynthesis, m_bTraceSynthesis);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEditToneGenProcess, CDialog)
	//{{AFX_MSG_MAP(CDlgEditToneGenProcess)
	ON_BN_CLICKED(IDC_BUTTONToneGenControlFile, OnBUTTONToneGenControlFile)
	ON_BN_CLICKED(IDC_BUTTONToneGenTraceOptions, OnBUTTONToneGenTraceOptions)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditToneGenProcess message handlers

void CDlgEditToneGenProcess::OnBUTTONToneGenControlFile()
{
  UpdateData(TRUE); // download any ctrl values, because we're going to upload at the end of this method
  CFileDialog	dlg( TRUE,
			 NULL, //ext
			 m_sControlFilePath,
			 OFN_FILEMUSTEXIST | OFN_HIDEREADONLY ,	// flags
			 _T("Control files(*.ctl)|*.ctl||"), // filter
			 NULL ); // parent window

  if(IDOK != dlg.DoModal())
	{
	  m_sControlFilePath = _T("");	// let cancel be the way to clear a file
	}
  else
	m_sControlFilePath = dlg.GetPathName();
  UpdateData(FALSE);
}

void CDlgEditToneGenProcess::OnBUTTONToneGenTraceOptions()
{
  UpdateData(TRUE); // download any ctrl values, because we're going to upload at the end of this method
  CDlgEditToneTracing dlg(NULL);
  dlg.m_bDomains = (m_nTracingLevel & TRACE_DOMAINS) ? TRUE : FALSE;
  dlg.m_bMora = (m_nTracingLevel & TRACE_MORA) ? TRUE : FALSE;
  dlg.m_bSegments = (m_nTracingLevel & TRACE_SEGMENTS) ? TRUE : FALSE;
  dlg.m_bSyllable = (m_nTracingLevel & TRACE_SYLLABLE) ? TRUE : FALSE;
  dlg.m_bTBU = (m_nTracingLevel & TRACE_TBU) ? TRUE : FALSE;
  dlg.m_bLinkAnalysis = (m_nTracingLevel & TRACE_LINK_ANAL) ? TRUE : FALSE;
  dlg.m_bMorpheme = (m_nTracingLevel & TRACE_MORPHEME_TONES) ? TRUE : FALSE;
  dlg.m_bToneTier = (m_nTracingLevel & TRACE_TONE_OLD) ? TRUE : FALSE;
  dlg.m_bToneRule = ((m_nTracingLevel & TRACE_TONE_TIER) ||
			 (m_bTraceToneProcessing)) ? TRUE : FALSE;
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

void CDlgEditToneGenProcess::OnOK()
{
	// TODO: Add extra validation here

	CDialog::OnOK();
}
