// QuickParseView.cpp : implementation file
//
//	jdh 11/11/99 changed to use the TEMP environment variable instead of assuming it's in the windows dir (per Randy Regnier)
// 2.1.2 14-Mar-2000 jdh Various additions to support using dictionary preprocessors w/ quickparse
// 2.1.3 20-Mar-2000 hab "moveTo" would move the original source if there was no dict preprocessing
// 2.1.7 12-Apr-2000 hab Force temporary dictionary files to be writable
//                       (so can delete them next time around if the original
//                        dict file was write-protected - as Mark Bean does
//                        while using mini-ample in LinguaLinks)
// 2.1.8 26-May-2000 hab Add manual parse to QP
// 2.3.2 19-Sep-2000 hab Have manual parse apply input text changes to string

#include "stdafx.h"
#include "CarlaStudioApp.h"
#include "QuickParseView.h"
#include "QuickParseDoc.h"
#include "LogWindow.h"
#include <strstrea.h>
#include "ProjectDoc.h"
#include "ProcessStatus.h"

#include "AmpleDLLProcess.h"
#include "ProcessingPrefs.h"
#include "CarlaLanguage.h"
#include "AmpleResult.h"
#include "ProcessSequence.h"

#ifndef hab218
#include "DlgManualParseChoice.h"
#endif // hab218

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CQuickParseView

IMPLEMENT_DYNCREATE(CQuickParseView, CFormView)

CQuickParseView::CQuickParseView()
	: CFormView(CQuickParseView::IDD),
#ifndef hab218
	  m_pAlloResult(0),
	  m_pAlloChosen(0),
	  m_sResult(_T("")),
#endif // hab218
	m_pAmpleProcess(NULL)
{
	//{{AFX_DATA_INIT(CQuickParseView)
	m_bTrace = FALSE;
	m_sInput = _T("");
	m_sOutput = _T("");
	m_sTraceMorphs = _T("");
	m_bManualParse = FALSE;
	//}}AFX_DATA_INIT
}

CQuickParseView::~CQuickParseView()
{
	if(m_pAmpleProcess)
		delete m_pAmpleProcess;
#ifndef hab218
	if (m_pAlloResult != NULL)
	  {
		delete m_pAlloResult;
	  }
#endif // hab218
}

void CQuickParseView::DoDataExchange(CDataExchange* pDX)
{
	CFormView::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CQuickParseView)
	DDX_Check(pDX, IDC_CHECKTrace, m_bTrace);
	DDX_Text(pDX, IDC_EDITInput, m_sInput);
	DDX_Text(pDX, IDC_EDITAmpleOutput, m_sOutput);
	DDX_Text(pDX, IDC_EDITTraceMorphs, m_sTraceMorphs);
	DDX_Check(pDX, IDC_CHECKManualParse, m_bManualParse);
	//}}AFX_DATA_MAP

	if(!pDX->m_bSaveAndValidate)
	{
		CEdit* pE = (	CEdit*)GetDlgItem(IDC_EDITTraceMorphs);
		if(pE)
			pE->EnableWindow(m_bTrace);
#ifndef hab218
		CButton* pB = (CButton*)GetDlgItem(IDC_CHECKManualParse);
		if (pB)
			pB->EnableWindow(m_bTrace);
		CStatic* pS = (CStatic*)GetDlgItem(IDC_STATICManualParse);
		if (pS)
			pS->EnableWindow(m_bTrace);
#endif // hab218
	}
		// i removed the button because opening a window with this text
	// will take some more work

	if(!pDX->m_bSaveAndValidate && m_pAmpleProcess)
	{
		//CWnd* pButton = GetDlgItem(IDC_Errors);
		CWnd* pMessage = GetDlgItem(IDC_ErrorStatic);
		CWnd* pMessageNoTrace = GetDlgItem(IDC_ErrorStatic2);
		CWnd* pIcon = GetDlgItem(IDC_ErrorIcon);
		CWnd* pMessageRefreshed = GetDlgItem(IDC_RefreshNotice);


		// jdh 3/14/2000
		if(m_bDidRefresh)
			pMessageRefreshed->ModifyStyle(NULL, WS_VISIBLE);
		else
			pMessageRefreshed->ModifyStyle(WS_VISIBLE,NULL);
		pMessageRefreshed->Invalidate();


		if(/*pButton &&*/ pIcon && m_pAmpleProcess->getLastRunHadError())
		{
			//pButton->ModifyStyle(NULL, WS_VISIBLE);
			pMessage->ModifyStyle(NULL, WS_VISIBLE);
			pMessage->Invalidate();
			if(!m_bTrace)
			{
				pMessageNoTrace->ModifyStyle(NULL, WS_VISIBLE);
				pMessageNoTrace->Invalidate();
			}
			else // trace is on
			{
				pMessageNoTrace->ModifyStyle(WS_VISIBLE, NULL);
				pMessageNoTrace->Invalidate();
			}

			pIcon->ModifyStyle(NULL, WS_VISIBLE);
			pIcon->Invalidate();
		}
		else if(/*pButton &&*/ pIcon)
		{
			//pButton->ModifyStyle(WS_VISIBLE, NULL);
			pMessage->ModifyStyle(WS_VISIBLE, NULL);
			pMessage->Invalidate();
			pMessageNoTrace->ModifyStyle(WS_VISIBLE, NULL);
			pMessageNoTrace->Invalidate();
			pIcon->ModifyStyle(WS_VISIBLE, NULL);
			pIcon->Invalidate();
		}
		this->Invalidate();
	}
}


BEGIN_MESSAGE_MAP(CQuickParseView, CFormView)
	//{{AFX_MSG_MAP(CQuickParseView)
	ON_COMMAND(ID_EDIT_PASTE, OnEditPaste)
	ON_UPDATE_COMMAND_UI(ID_EDIT_PASTE, OnUpdateEditPaste)
	ON_COMMAND(ID_EDIT_COPY, OnEditCopy)
	ON_UPDATE_COMMAND_UI(ID_EDIT_COPY, OnUpdateEditCopy)
	ON_COMMAND(ID_QuickParseGo, OnQuickParseGo)
	ON_UPDATE_COMMAND_UI(ID_QuickParseGo, OnUpdateQuickParseGo)
	ON_WM_SIZE()
	ON_COMMAND(ID_Edit_Delete, OnEditDelete)
	ON_BN_CLICKED(IDC_CHECKTrace, OnCHECKTrace)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CQuickParseView diagnostics

#ifdef _DEBUG
void CQuickParseView::AssertValid() const
{
	CFormView::AssertValid();
}

void CQuickParseView::Dump(CDumpContext& dc) const
{
	CFormView::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CQuickParseView message handlers
#include "PhraseParser.h"

void CQuickParseView::OnQuickParseGo()
{

	CWaitCursor wc;

	//---- BRING THE CONTROL FILES UP TO DATE ON THE DISK (added feb 8, 99)
	theApp.getProject()->synchronizeExternals();


	CQuickParseDoc* pDoc = (CQuickParseDoc*)GetDocument();
	UpdateData(TRUE); // get data out of form and into our members
	m_sInput.TrimLeft();
	if(m_sInput.IsEmpty())
		return;

	try
	{
//		sndPlaySound("QuickParse", SND_ASYNC );

		CCarlaLanguage* pSourceLang = pDoc->m_pSourceLang;
		ASSERTX(pSourceLang);
		pSourceLang->prepareMFSForProcessors(); // among other things, get the comment character into the MFS

		CSrcTextProcessingPrefs procPrefs(pSourceLang,
									NULL,
									CProcessingPrefs::kSourceAna);


		CProcessStatus status(	&procPrefs,
								m_sInput,
								pSourceLang,
								pSourceLang->getMFS(),
								NULL,	// output lang
								NULL); // output mfs

		// jdh 3/14/2000 changed to this from some custom code
		if (!status.setupTempDir(pSourceLang->getName()))
			return;	// assumes the user has already been informed

	// added jdh 3/13/2000
		m_bDidRefresh = FALSE; // will be set to TRUE if we refresh
		BOOL bDidGetPreprocessedDicts = status.loadPreprocessedSrcDictsArrayFromLang();
		if(!bDidGetPreprocessedDicts || m_bManualRefreshPending || getNeedDictPreprocessing(status))
			if(!this->preprocessDicts(&status))
				return;

		prepareAmpleProcess();
		loadAmpleOptions();
		m_sOutput = ""; // in case of an exception
		CString sTraceOutput;


		CString sPath;
		sPath.Format("%s\\QP-Ample-Trace.log", status.getTempDirectory());


#ifndef hab218
		if (m_bTrace && m_bManualParse)
		  {
			m_sTraceMorphs = "";
			loadAmpleOptions();
			getManualParse(status, sPath, pSourceLang);
			status.m_sRAWString = m_sInput;
			loadAmpleOptions();
		  }
#endif // hab218
	// DO THE PARSING
		if(!m_bTrace)
		{	// !!! this path is needed if we want to check for errors
			m_pAmpleProcess->processRAWTextString(status, sPath);
		}
		else
		{
			m_pAmpleProcess->processRAWTextString(status, sPath);
		//	m_sOutput = status.m_sRAWString;

			TRY
			{
				CFile log(sPath, CFile::modeRead);
				DWORD sz = log.GetLength();
				if(sz)
				{
					char* buf = new char[sz+2];
					ASSERTX(buf);
					int iReadBytes = log.Read(buf, sz);
					buf[iReadBytes] = '\0'; //terminate it
					sTraceOutput = buf;
					delete buf;
				}
				log.Close();
			}
			CATCH( CFileException, e )
			{
#ifdef Before1_04
				checkForFileError(PATH);
#else  // hab 1.04
				checkForFileError(sPath);
#endif // Before1_04
			}
			END_CATCH
		}

		// build the parse part of the answer
		CAmpleResult* pAResult = CAmpleResult::buildResult(status.m_sRAWString);
		if(pAResult)
		{
#ifndef hab218
			m_sOutput += pAResult->getStringRepresentation();
#else //hab218
			m_sOutput = pAResult->getStringRepresentation();
#endif // hab218
			delete pAResult;
		}
		else
			m_sOutput.Format ("You have encountered a bug in either CarlaStudio or the Ample DLL.  CarlaStudio could not understand the Ample DLL's answer, which was: %s", status.m_sRAWString);

		// add the trace part of the answer
		if(m_bTrace)
			m_sOutput += sTraceOutput;

		// do we need to truncate the result?
		TRACE("m_sOutput.GetLength() =%d", m_sOutput.GetLength());
		if(m_sOutput.GetLength() > 30000)
		{
			m_sOutput = m_sOutput.Left(30000);
			m_sOutput += "\r\n--Ample's output is too long to fit here.  It has been truncated. ";
		}

		// jdh 3/14/2000 store this set of dictionaries.  we do it only now in so that an error in processing them will be in the user's face
		status.storePreprocessedSrcDictsArrayInLang();

	}
	catch (CProcessFailure failure)
	{
		strstream sout;
		if(failure.m_pProcess)	// will be null if not thrown by a process
			sout << "The process \"" << failure.m_pProcess->getDisplayName() << "\"";
		else
			sout << "Processing ";
		sout << " was not completed.\n";
		sout << failure.getReason();
		CString str(sout.str(), sout.pcount());
		sout.rdbuf()->freeze(0); // else get a memory leak
		AfxMessageBox(str);
		return;
	}

	UpdateData(FALSE); // load data into dialog
}

#ifndef hab218
void CQuickParseView::getManualParse(CProcessStatus &status, CString &sPath, CCarlaLanguage* pSourceLang)
{
	  // Do the parsing by hand
  int cDecompSepChar = pSourceLang->getCommonModel().m_cDecompSepChar;
  CString sInput = m_sInput;
  CString sReturn = "\r\n";
  CString sAllos  = "";
  CString sMNames = "";
  m_sTraceMorphs = "";
  CString sState = "BOW";
#ifndef hab232
  CString sChoices;

  sChoices = m_pAmpleProcess->getAllAllomorphs(status, sState, sPath);
  sInput = status.m_sRAWString;
  CString sResult = getUserChoice(sChoices, sInput);
#else // hab232
  m_pAmpleProcess->getAllAllomorphs(status, sState, sPath);
  CString sResult = getUserChoice(status.m_sRAWString, sInput);
#endif // hab232
  if (m_pAlloChosen == NULL)
	m_sOutput = m_sResult;	// catch any error message
  while (m_pAlloChosen != NULL)
	{
	  int iAlloLen = 0;
				// adjust state value if infix
	  if (m_pAlloChosen->m_sType == "IFX")
	{
	  if (sState == "BOW" || sState == "PFX")
		sState = "PFX";
	  else
		sState = "SFX";
	}
	  else
	sState = m_pAlloChosen->m_sType;
	  if (sState == "SFX")
	{
	  sAllos  += TCHAR(cDecompSepChar);
	  sMNames += TCHAR(cDecompSepChar);
	}
	  sAllos += m_pAlloChosen->m_sShape;
	  sMNames += m_pAlloChosen->m_sMorphName;
				// use just the morphnames (if we also use
				// the allos, then any morpheme with a matching
				// allo will be included in the trace)
	  m_sTraceMorphs +=  m_pAlloChosen->m_sMorphName + " ";
	  if (sState == "PFX")
	{
	  sAllos  += TCHAR(cDecompSepChar);
	  sMNames += TCHAR(cDecompSepChar);
	}
				// get next allomorph
				// adjust input string
	  if (m_pAlloChosen->m_sShape == "0")
	iAlloLen = 0;	// adjust for nulls
	  else
	iAlloLen = m_pAlloChosen->m_sShape.GetLength();
	  if (m_pAlloChosen->m_sType == "IFX")
	{
	  int iInfixLoc = m_pAlloChosen->m_sInfixContext.Find(kcDelim);
	  sInput = sInput.Left(iInfixLoc) +
			   sInput.Right(sInput.GetLength() -
							(iInfixLoc + m_pAlloChosen->m_sShape.GetLength()));
	}
	  else
	sInput = sInput.Right(sInput.GetLength() - iAlloLen);
	  status.m_sRAWString = sInput;
				// reflect most recent selection in dialog
	  m_sOutput = sAllos + sReturn + sMNames + sReturn + sReturn;
	  UpdateData(FALSE);
				// get next set of possibilities
#ifndef hab232
	  sChoices = m_pAmpleProcess->getAllAllomorphs(status, sState, sPath);
	  sResult = getUserChoice(sChoices, sInput);
#else
	  m_pAmpleProcess->getAllAllomorphs(status, sState, sPath);
	  sResult = getUserChoice(status.m_sRAWString, sInput);
#endif // hab232
	}
}

CString &CQuickParseView::getUserChoice(CString &sAlloResults, CString &sInput)
{

  if (m_pAlloResult != NULL)
	{
	  delete m_pAlloResult;	// delete last one used
	  m_pAlloResult = NULL;
	}

  m_pAlloChosen = NULL;		// initialize for this go round
  m_sResult = "";

  // build the parse part of the answer
  m_pAlloResult = CAlloResult::buildResult(sAlloResults);
  if(m_pAlloResult)
	{
	  int iSize = m_pAlloResult->getSizeOfResults();
	  m_sResult = m_pAlloResult->getStringRepresentation(sInput);
	  if (iSize == 0 &&
		   sInput.GetLength() == 0)
	m_pAlloChosen = NULL;	// we're all done
	  else if (iSize == 1 &&
		   m_sResult.SpanExcluding(" ") != "0")
	{			// there's only one non-null item;
				// so select it automatically
	  m_pAlloChosen = (CAllo *)m_pAlloResult->getResult(0);
	}
	  else
	{
	  if (iSize == 0)
		AfxMessageBox("No more allomorphs were found in the dictionaries.", MB_OK);
	  else
		{
		  CQuickParseDoc* pDoc = (CQuickParseDoc*)GetDocument();
		  CDlgManualParseChoice dlg(pDoc->m_pSourceLang->getDisplayInfo(),
					NULL);

		  dlg.m_pAlloResult = m_pAlloResult;

		  BOOL bDlgOk = dlg.DoModal();
		  if(IDOK == bDlgOk && iSize > 1)
		{
		  int i = dlg.m_iChoice;
		  if (i != LB_ERR)
			m_pAlloChosen = (CAllo *)m_pAlloResult->getResult(i);
		  else
			m_pAlloChosen = NULL;
		}
		  else if (IDCANCEL == bDlgOk)
		m_sResult = "";
		}
	}
	}
  else
	m_sResult.Format ("You have encountered a bug in either CarlaStudio or the Ample DLL.  CarlaStudio could not understand the Ample DLL's answer, which was: %s", sAlloResults);

  return m_sResult;
}
#endif // hab218

void CQuickParseView::prepareAmpleProcess()
{
	if(m_pAmpleProcess)
	{
		return;
	}

	//LOG2("CQuickParseView creating ample process", "\r\n");
	m_pAmpleProcess = new CAmpleDLLProcess();
}

void CQuickParseView::loadAmpleOptions()
{
	ASSERTX(m_pAmpleProcess);
	m_pAmpleProcess->setTrace(m_bTrace, m_sTraceMorphs);
	m_pAmpleProcess->setReloadOptions();
#ifndef hab241
	m_pAmpleProcess->setMaxMorphnameLength(60); // ignore morphname length issues in QP - we're focusing on the trace
				// NOTE: ideally we'd get the value from the
				// AmpleDLLProcess in the anallysis sequence
				//  (assuming there is one...)
#endif // hab241
}

void CQuickParseView::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	// THIS NEVER GETS CALLED. i WANT TO DO A PARSE WHEN THE USER HITS ENTER

	CFormView::OnKeyDown(nChar, nRepCnt, nFlags);
}

void CQuickParseView::OnEditPaste()
{
	CEdit *pE= (CEdit*) GetFocus();
//	CEdit *pE= (CEdit*) GetDlgItem(IDC_EDITInput);
	ASSERTX(pE);
	pE->Paste();
}

void CQuickParseView::OnUpdateEditPaste(CCmdUI* pCmdUI)
{
	CEdit *pE= (CEdit*) GetFocus();
	//if(pE && pE->IsKindOf(RUNTIME_CLASS(CEdit))) // always fails!
	// the above would be correct, but doesn't work.  So we check for the ones we know about.
	if( pE == GetDlgItem(IDC_EDITInput) ||
		pE == GetDlgItem(IDC_EDITTraceMorphs) ||
		pE == GetDlgItem(IDC_EDITAmpleOutput))
			pCmdUI->Enable(TRUE);
	else
		pCmdUI->Enable(FALSE);
}

void CQuickParseView::OnEditCopy()
{
	CEdit *pE= (CEdit*) GetFocus();
	//if(pE && pE->IsKindOf(RUNTIME_CLASS(CEdit))) // always fails!
	// the above would be correct, but doesn't work.  So we check for the ones we know about.
	if( pE == GetDlgItem(IDC_EDITInput) ||
		pE == GetDlgItem(IDC_EDITTraceMorphs) ||
		pE == GetDlgItem(IDC_EDITAmpleOutput))
		pE->Copy();
}


void CQuickParseView::OnUpdateEditCopy(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(TRUE);
}

BOOL CQuickParseView::OnNotify(WPARAM wParam, LPARAM lParam, LRESULT* pResult)
{
	// TODO: Add your specialized code here and/or call the base class

	return CFormView::OnNotify(wParam, lParam, pResult);
}


void CQuickParseView::OnUpdateQuickParseGo(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(TRUE);
}

// called when the user changes the language
void CQuickParseView::languageChanged()
{
	if(m_pAmpleProcess)
		delete m_pAmpleProcess;

	m_pAmpleProcess = NULL;
	setFonts();
}

void CQuickParseView::OnInitialUpdate()
{
	CFormView::OnInitialUpdate();

	CQuickParseDoc* pDoc = (CQuickParseDoc*)GetDocument();
	pDoc->setView(this);
	setFonts();
}

void CQuickParseView::setFonts()
{
	CQuickParseDoc* pDoc = (CQuickParseDoc*)GetDocument();
	CFont* pFont = pDoc->m_pSourceLang->getDisplayInfoRef().getFont();
	CEdit *pE= (CEdit*) GetDlgItem(IDC_EDITInput);
	pE->SetFont(pFont);
	pE= (CEdit*) GetDlgItem(IDC_EDITTraceMorphs);
	pE->SetFont(pFont);
	pE= (CEdit*) GetDlgItem(IDC_EDITAmpleOutput);
	pE->SetFont(pFont);
}

void CQuickParseView::OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint)
{
	setFonts();

}

void CQuickParseView::OnSize(UINT nType, int cx, int cy)
{
	CFormView::OnSize(nType, cx, cy);

	CEdit *pE= (CEdit*) GetDlgItem(IDC_EDITAmpleOutput);
	if(pE && pE->m_hWnd)
	{
		CRect r;
		pE->GetWindowRect(&r);
		ScreenToClient(&r);
		r.right = cx - 5;
		r.bottom = cy - 5;
		pE->MoveWindow(r.left, r.top, r.Width(), r.Height());
	}
}

void CQuickParseView::OnEditDelete()
{
	CEdit *pE= (CEdit*) GetFocus();
	//if(pE && pE->IsKindOf(RUNTIME_CLASS(CEdit))) // always fails!
	// the above would be correct, but doesn't work.  So we check for the ones we know about.
	if( pE == GetDlgItem(IDC_EDITInput) ||
		pE == GetDlgItem(IDC_EDITTraceMorphs) ||
		pE == GetDlgItem(IDC_EDITAmpleOutput))
		pE->Clear();
}


// not currently used
void CQuickParseView::OnViewErrors()
{
	AfxMessageBox("View Errors");
}

void CQuickParseView::OnCHECKTrace()
{
	CButton* pB = (CButton*)GetDlgItem(IDC_CHECKTrace);
	CEdit* pE = (	CEdit*)GetDlgItem(IDC_EDITTraceMorphs);
	if(pB && pE)
		pE->EnableWindow(pB->GetCheck());
#ifndef hab218
	CButton* pBMP = (CButton*)GetDlgItem(IDC_CHECKManualParse);
	if(pB && pBMP)
		pBMP->EnableWindow(pB->GetCheck());
	CStatic* pS = (CStatic*)GetDlgItem(IDC_STATICManualParse);
	if (pB && pS)
	  pS->EnableWindow(pB->GetCheck());
#endif // hab218
}

// 3/13/2000 JDH Added this method
BOOL CQuickParseView::preprocessDicts(CProcessStatus* pStatus)
{
	CQuickParseDoc* pDoc = (CQuickParseDoc*)GetDocument();
	CCarlaLanguage* pSourceLang = pDoc->m_pSourceLang;
	ASSERTX(pSourceLang);

	CProcessSequence* pAnalysisSequence = pSourceLang->getAnalysisSequence();
	const CProcessingPrefs* pOuterPrefs = pStatus->getProcPrefs();
	CSrcTextProcessingPrefs prefs(pSourceLang,NULL, CProcessingPrefs::kPreprocessDicts);
	pStatus->m_pProcPrefs = &prefs;

/*	CProcessStatus* pStatus =
			 new CProcessStatus("NO-SRC-FILE",	// the src file path, which we don't have
								&prefs,
								pSourceLang,
								pSourceLang->getMFS(),
								NULL, // target lang
								NULL); // target mfs

*/	pStatus->setCurrentSequenceFunction(pAnalysisSequence->getFunctionCode());
	pStatus->setInputLang(pSourceLang);
	pStatus->setOutputLang(NULL);

	// this is already done when a new status is created, but is needed if it has been around and loaded with preprocessed dictionaries
	pStatus->loadOriginalDictsArrayFromLang();

	//----- ask Shoebox, if it is running, to do a save all
	// note: if this was invoked by a call from CSRemote, then the send will hang us forever
	// thus, we have this bRemoteCall flag to prevent that.  If we are called from
	// Shoebox, it will have saved everything anyways as part of its batch file command

	::SendMessage(HWND_BROADCAST, wm_RemoteSaveAll, NULL, NULL);


	// done by our caller if (!pStatus->setupTempDir(pSourceLang->getName()))
	//	return FALSE;

	pSourceLang->prepareMFSForProcessors();


	//---- SETUP PROGRESS BAR
	//!!! this is wrong since we'll be skipping non-dict ones, but it's only for a progress bar
	pStatus->expectSequenceWithCount(pAnalysisSequence->getProcessorCount());


	//---- BRING THE CONTROL FILES UP TO DATE ON THE DISK
	theApp.getProject()->synchronizeExternals();


	// do the processing; the kPreprocessDicts goal will cause this to skip non-dictionary processors

	BOOL bOK = pAnalysisSequence->continueProcessing(pStatus);

	if(!bOK)
		AfxMessageBox("There was a problem refreshing the dictionaries.  You'll need to open a source document and parse it to see what the problem is.");
	else	// move the dicts to a safe folder so they'll be around
	{
		CString sDictTempDir;
		sDictTempDir.Format("%s\\CSTUDIO\\Preprocessed Dicts", getenv("TEMP"));
//add error checking!!!
		BOOL bDidDeleteFiles=FALSE;
		::nukeDirectory(sDictTempDir,&bDidDeleteFiles);
		CreateDirectory(sDictTempDir, NULL); // in case it wasn't there already

		for(int i=0; i<pStatus->m_pSrcDicts.GetSize(); i++)
		{
			CString s;
			s.Format("%s\\%s", sDictTempDir, pStatus->m_pSrcDicts[i]->getFileFullName());
#ifndef hab213
			pStatus->m_pSrcDicts[i]->copyTo(s,FALSE);
			*pStatus->m_pSrcDicts[i] = (LPCTSTR)s; // change descriptor
#ifndef hab217
			pStatus->m_pSrcDicts[i]->forceFileWritable(); // make copy be writable, no matter what the source was
#endif //hab217
#else // hab213
			pStatus->m_pSrcDicts[i]->moveTo(s,FALSE, TRUE);	// this moves the original source if there is no dict preprocessing!!!
#endif // hab213
		}
	}
	pStatus->m_pProcPrefs = pOuterPrefs; // change it back

	m_bDidRefresh = TRUE;
	m_bManualRefreshPending = FALSE;
	m_lastPreprocessTime= CTime::GetCurrentTime();
	return bOK;
}

//we need to preprocess the dicts if the dicts  or certain control files have been modified
// we don't have a way of knowing which control files, so if any have been then we redo the dictionaries
BOOL CQuickParseView::getNeedDictPreprocessing(CProcessStatus& status)
{
	//check if the src dicts in the mfs's list have been modified

	// to do: currently, each qp window handles its own m_lastPreprocessTime, which
	//  is overly conservative, since they share the preprocessed list of the language (actually its mfs)

	if( status.getInputLang()->getMFS()->getRootDicList()
		->m_paths.getAnyModifiedSince(m_lastPreprocessTime))
		return TRUE;

	//check to make sure the status's files still exist
	if( status.m_pSrcDicts.getAnyDontExist())
		return TRUE;

	//check the control files to see if they have been modified

	// note we only check phonrule at this time.  Others could be added.

	CPathDescriptor pd;

	pd = status.getInputMFS()->getPhonrulePath();
	if(pd.getModifiedSince(m_lastPreprocessTime))
		return TRUE;

	return FALSE;
}
