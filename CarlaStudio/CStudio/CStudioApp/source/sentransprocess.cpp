// JDH 6/2/99	Add Sentrans Adjust Rules Set for analysis changed kAdjustSrcGlossing to kAdjustSrcGlossingGlossing
// jdh 11/10/99 watch the Status prefs for turning on tracing temporarily
// 1.7a1 09-Dec-1999 hab Move location of transfer files from source to target
//                       control file directory
// jdh 15June2000 added "OtherRuleFile" function to support ParseBench (or any other external rule filed generator)

#include "stdafx.h"
#include <strstrea.h>
#include <fstream.h>
#include "Process.h"
#include "ModelFilesSet.h"
#include "SFMFile.h"
#include "SentransProcess.h"
#include "DlgEditSentransProcess.h"
#include "ProcessingPrefs.h"
#include "processoutput.h"
#include "logwindow.h"
#include "processStatus.h"

// override
// Bit of a hack here to ensure a reasonable function for the sentrans
// process, based on what sequence its in.  If we're in a transfer
// sequence, then that must be the goal.
CProcess* CSentransProcessTemplate::createProcess(int iSeqFunctionCode, SFMFile* pInputFile)
{
	CProcess* p = CProcessTemplate::createProcess(iSeqFunctionCode, pInputFile);
	ASSERTX(p->IsKindOf(RUNTIME_CLASS(CSentransProcess)));
	if(-1 != iSeqFunctionCode)
	{
		switch(iSeqFunctionCode)
		{
			case CProcess::kAnalysis:
				// note that the user can change this to kAdjustSrcAnalysis. THis
				// is just the default.
				((CSentransProcess*)p)->m_iFunction = CSentransProcess::kDisambig;
				break;
			case CProcess::kInterlinear:
				((CSentransProcess*)p)->m_iFunction = CSentransProcess::kAdjustSrcGlossing;
				break;
			case CProcess::kTransfer:
				((CSentransProcess*)p)->m_iFunction = CSentransProcess::kTransfer;
				break;
			default: ASSERTX(FALSE);
		}
		// else leave it to the default
	}
	return p;
}

IMPLEMENT_DYNCREATE(CSentransProcess, CDOSProcess);


CSentransProcess::CSentransProcess(int iFunction)
:CDOSProcess()
{
	setDefaultValues();
	 m_iFunction = iFunction; // must be *after* setDefaultValues

}


// called by CProcess constructor
// even if the values will be read in, we need this in case some values are
// missing (as will happen when the user is upgrading to a new version)
void CSentransProcess::setDefaultValues()
{
	 m_bMonitorAmbiguities = FALSE;
	 m_bMonitorRulesApplied = FALSE;
	 m_bTraceRules = FALSE;
	 m_bOutputClassContents = FALSE;
	 m_iFunction = kDisambig;
}

void CSentransProcess::readParametersFromSFMFile(SFMFile *f)
{
	setDefaultValues();
	CString sMarker, sField;
	while(f->getField(sMarker, sField))
	{
		if(sMarker=="-Process")
			break;
		else checkAndReadBool( "MonitorAmbiguities", m_bMonitorAmbiguities)
		else checkAndReadBool( "MonitorRulesApplied", m_bMonitorRulesApplied)
		else checkAndReadBool( "OutputClassContents", m_bOutputClassContents)
		else checkAndReadBool( "TraceRules", m_bTraceRules)
		else checkAndReadInt( "Function", m_iFunction)
		else checkAndReadString("OtherRuleFile", m_sOtherRuleFilePath)
		else f->throwParseFailure("SENTRANSProcess", sMarker, sField);
	}
}

void CSentransProcess::writeToStream(ostream& fout) const
{
	fout << "\\+Process " << getProcessorID() << PROC_ENABLED_STATUS << "\n";
	outputInt(fout, "Function",m_iFunction);
	outputBool(fout, "MonitorAmbiguities",m_bMonitorAmbiguities);
	outputBool(fout, "MonitorRulesApplied",m_bMonitorRulesApplied);
	outputBool(fout, "OutputClassContents",m_bOutputClassContents);
	outputBool(fout, "TraceRules",m_bTraceRules);
	if(m_iFunction == kOtherRuleFile)
		fout << "\\OtherRuleFile " << m_sOtherRuleFilePath << "\n";

	fout << "\\-Process " << getProcessorID() << "\n";
}

const char* CSentransProcess::getToolPath()
{
	return "SENTRANS32";
}

CString CSentransProcess::getCommandLine(CProcessStatus& status)
{
	strstream sout;
	CModelFilesSet* pSourceMFS = status.getInputMFS();
	ASSERTX(pSourceMFS);
	CModelFilesSet* pTargetMFS = status.getOutputMFS(); // may be null


	if('|' != status.getInputMFS()->getCommentChar())
		sout << " -c " << status.getInputMFS()->getCommentChar() << " ";

/*	 m_bMonitorAmbiguities = FALSE;
	 m_bMonitorRulesApplied = FALSE;
	 m_bTraceRules = FALSE;
	 m_bOutputClassContents = FALSE;
*/
	if(m_bMonitorAmbiguities)
		sout << "-a ";
	if(m_bMonitorRulesApplied)
		sout << "-m ";

	// jdh 11/10/99
	if(status.m_pProcPrefs->m_dwFlags & CProcessingPrefs::kTrace)		// jdh 11/10/99
		sout << "-t ";
	else if(m_bTraceRules)
		sout << "-t ";

	if(m_bOutputClassContents)
		sout << "-v ";

	sout << "-i " << m_sInPath.getQuotedPath(); //.getShortPath();
	sout << " -r ";

	switch(m_iFunction)
	{
		case kDisambig:
			sout << pSourceMFS->getShortCtrlFilePath("disam.sen");
			break;

		case kAdjustSrcGlossing:
			ASSERTX(!status.getOutputMFS());
			// "adj" is now a bad name ("adj-gloss" would be better,
			// but to change it would break everyone
			sout << pSourceMFS->getShortCtrlFilePath("adj.sen");
			break;

		// jdh 15June2000
		case kOtherRuleFile:
			sout << m_sOtherRuleFilePath.getShortPath() << " ";
			break;


		// JDH 6/2/99Add Sentrans Adjust Rules Set for analysis
		case kAdjustAnalysis:
			sout << pSourceMFS->getShortCtrlFilePath("ana.sen");
			break;

		case kTransfer:
			ASSERTX(status.getOutputMFS());
			ASSERTX(pTargetMFS);
#ifndef hab17a1
			sout << ::shortenPath(pTargetMFS->getSentransTransferPath(pSourceMFS->getAbrev(), pTargetMFS->getAbrev()));
#else // hab17a1
			sout << ::shortenPath(pSourceMFS->getSentransTransferPath(pTargetMFS->getAbrev()));
#endif // hab17a1
			break;
		default: ASSERTX(FALSE); break;
	}
// I removed the short paths here just because we haven't
	// yet implemented the artificial creation of files to get
	// short paths if the file doesn't exist

//	sout << " -o " << m_sOutPath.getShortPath() << " ";
	sout << " -o " << m_sOutPath.getQuotedPath() << " ";

	//sout << " >> " <<  m_sLOGPath.getShortPath();
	sout << " > " <<  m_sLOGPath.getQuotedPath();

	CString s(sout.str(), sout.pcount());
	sout.rdbuf()->freeze(0); // else get a memory leak


	// !!!!!!!!!! TO DO: make sure the string is going to be short enough (under 128?)
	return s;
}

// EXCEPTIONS: CProcessFailure
// TO DO:	clean up error reporting
//			use dialog to say we're busy and give a cancel button
#include "CarlaLanguage.h"

void CSentransProcess::processANAFile(CProcessStatus& status)
{

// (jdh 6/99) i think this is now defunct; an impossible condition
// if((m_iFunction == kAdjustSrcGlossing)
//		&& (status.m_pProcPrefs->getGoal() != CProcessingPrefs::kGlossedInterlinear))
//		return;

	// skip this process if there is nothing to do
	switch(m_iFunction)
	{
		case kDisambig:
			if(status.getInputLang()->getSentransDisambigModel().m_rules.getSize() ==0)
				return;
			break;
		case kAdjustSrcGlossing:
			if(status.getInputLang()->getSentransGlossAdjustmentModel().m_rules.getSize() ==0)
				return;
			break;

		// JDH 6/2/99 Added Sentrans Adjust Rules Set for analysis
		case kAdjustAnalysis:
			if(status.getInputLang()->getSentransAnaAdjustmentModel().m_rules.getSize() ==0)
				return;
			break;

		case kOtherRuleFile:	// jdh 15June2000
			if(!m_sOtherRuleFilePath.fileExists())
			{
				CString sMsg;
				sMsg.Format("The external SENTRANS rule file could not be found.\n\"%s\"", LPCTSTR(m_sOtherRuleFilePath));
				AfxMessageBox(sMsg);
				return;
			}
			break;

		//case kTransfer:
			// haven't handled this because we would have to travers the transfer models (just a little more work, probabl)
	}

	// remember, we could be operating on ana from any process, including another sentrans process

	try
	{
		CString sBase = getTempFileNameBase(status);
		m_sOutPath = status.makeTempPath(sBase,	".ana" );
		m_sLOGPath = status.makeTempPath(sBase,	".log" );

		m_sInPath = status.sANAPath;
		m_sOutPath.deleteFile();
		m_sLOGPath.deleteFile();

		if(!executeTool(status))
		{		throw(CProcessFailure(this, "SentransProccess failed"));
		}

		waitForCompletion(&status, &m_sLOGPath, &m_sOutPath);

		// register ana output so the user can view it
		CString sShortDesc, sLongDesc, sTabLabel;
		CCarlaLanguage *pOutANALang=NULL;
		switch(m_iFunction)
		{
			case kDisambig:
				sShortDesc = "Disambiguated ANA";
				sLongDesc = "ANA of the source-language file, after filtering through Sentrans disambiguation rules.";
				sTabLabel = "ST-Disamb ANA";
				pOutANALang = status.getInputLang();
				break;
			case kAdjustSrcGlossing: sShortDesc = "Gloss Adjusted ANA";
				sLongDesc = "ANA of the source-language file, after performing 'adjustment' transfer for glossing purposes.";
				sTabLabel = "ST-Gloss-Adj ANA";
				pOutANALang = status.getInputLang();
				break;

			// JDH 6/2/99 Added Sentrans Adjust Rules Set for analysis
			case kAdjustAnalysis: sShortDesc = "Analysis Adjusted ANA";
				sLongDesc = "ANA of the source-language file, after performing 'adjustment' transfer for analysis purposes.";
				sTabLabel = "ST-Anal-Adj ANA";
				pOutANALang = status.getInputLang();
				break;

			// jdh 15June2000
			case kOtherRuleFile: sShortDesc = "Other Rule File ANA";
				sLongDesc.Format("ANA of the source-language file, after running through Sentrans using the file: %s",LPCTSTR(m_sOtherRuleFilePath));
				sTabLabel = "ST-Anal-Other ANA";
				pOutANALang = status.getInputLang();
				break;

			case kTransfer: sShortDesc = "Transfered ANA";
				sLongDesc = "ANA of the target-language file, after performing Sentrans transfer.";
				sTabLabel = "ST-Trans ANA";
				pOutANALang = status.getOutputLang();
				break;
			default: ASSERTX(FALSE); break;
		}
		CResultStreamFile* anaStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
												sShortDesc, //short description
												sLongDesc, // long description
												sTabLabel // tab label
											),
					m_sOutPath.getFullPath(),
					pOutANALang);
		status.registerResultStream(anaStream);

		// when we're doing transfer, the log could reasonably be in either language font,
		// but what to do?
		registerLog(status, m_sLOGPath, status.getInputLang());
		status.sANAPath = m_sOutPath;
	}
	catch(CProcessFailure failure)
	{
		registerLog(status, m_sLOGPath);
		throw(failure);
	}
	catch(CString sError)
	{
		registerLog(status, m_sLOGPath);
		throw(CProcessFailure(this, sError));
	}
}

LPCTSTR  CSentransProcess::getDisplayName() const
{
	switch(m_iFunction)
	{
		case kDisambig: return "SENT Disambig"; break;
		case kAdjustSrcGlossing: return "SENT Adjust Glossing"; break;
		case kAdjustAnalysis: return "SENT Adjust Analysis"; break;
		case kTransfer: return "SENT Transfer"; break;
		case kOtherRuleFile: return "SENT Other Rule File"; break;
		default: ASSERTX(FALSE); return "CSentransProcess getDisplayName ERROR"; break;
	}
}

CString CSentransProcess::getBatchName(CProcessStatus& status)
{
	return getTempFileNameBase(status) ;
}

BOOL CSentransProcess::doEditDialog(int iFunctionCode)
{
	CDlgEditSentransProcess dlg;

	// Load in all our settings
	dlg.m_bMonitorAmbiguities = m_bMonitorAmbiguities;
	dlg.m_bMonitorRulesApplied = m_bMonitorRulesApplied;
	dlg.m_bTraceRules = m_bTraceRules;
	dlg.m_bOutputClassContents =m_bOutputClassContents;
	dlg.m_iFunction = m_iFunction;
	// hack hack hack
	dlg.m_bInTransferSeq = (iFunctionCode == CProcess::kTransfer);
	dlg.m_bInInterlinearSeq = (iFunctionCode == CProcess::kInterlinear);

	if(m_iFunction == kOtherRuleFile)					// jdh 15June2000
		dlg.m_sRuleFilePath = m_sOtherRuleFilePath;	// jdh 15June2000

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_bMonitorAmbiguities=		dlg.m_bMonitorAmbiguities;
	m_bMonitorRulesApplied=		dlg.m_bMonitorRulesApplied;
	m_bTraceRules=		dlg.m_bTraceRules;
	m_bOutputClassContents=	dlg.m_bOutputClassContents;
	m_iFunction = dlg.m_iFunction;
	if(m_iFunction == kOtherRuleFile)					// jdh 15June2000
		m_sOtherRuleFilePath = dlg.m_sRuleFilePath;		// jdh 15June2000


	return TRUE;
}

// virtual override
CString CSentransProcess::getInputTypeDisplayName()
{
	// i'm not sure about this one; if you run lextrans before this,
	// then the input is a target ana already; well it's in proces
	// of becoming a target ana.
	return "ANA";// "Source ANA";
}

// virtual override
CString CSentransProcess::getOutputTypeDisplayName()
{
	switch(m_iFunction)
	{
		case kDisambig: return "Disambiguated Src ANA"; break;
		case kAdjustSrcGlossing: return "Adjusted (gloss) Src ANA"; break;
		case kAdjustAnalysis: return "Adjusted (analysis) Src ANA"; break;
		case kTransfer: return "Target ANA"; break;
		case kOtherRuleFile: return "Disambiguated ANA (Other)"; break;
		default: return "ERROR"; break;
	}
}

// STATIC
CProcessTemplate* CSentransProcess::getTemplate()
{
	return new CSentransProcessTemplate();
}

CSentransProcessTemplate::CSentransProcessTemplate()
: CProcessTemplate(
		RUNTIME_CLASS(CSentransProcess),
		"Sentrans",
		CSentransProcess::INPUT_TYPE_DISPLAY(),
		CSentransProcess::OUTPUT_TYPE_DISPLAY(),
		CSentransProcess::ID(),
		CProcess::kAnalysis | CProcess::kTransfer | CProcess::kInterlinear,
		0)
{

}

CString CSentransProcess::getTempFileNameBase(CProcessStatus& status)
{
	CString s;
	switch(m_iFunction)
	{
		case kDisambig: s.Format("%s-%s-sent-disambig",
									status.m_sFileNameRoot,
									status.getInputMFS()->getAbrev());
			 break;
		case kAdjustSrcGlossing: s.Format("%s-%s-sent-adj-gloss", //jdh 6/2/99 renamed
									status.m_sFileNameRoot,
									status.getInputMFS()->getAbrev());
			break;

		// jdh 15June2000 the
		case kOtherRuleFile: s.Format("%s-%s-sent-other-ana",
									status.m_sFileNameRoot,
									status.getInputMFS()->getAbrev());
			break;

		// JDH 6/2/99 Added Sentrans Adjust Rules Set for analysis
		case kAdjustAnalysis: s.Format("%s-%s-sent-adj-ana",
									status.m_sFileNameRoot,
									status.getInputMFS()->getAbrev());
			break;

		case kTransfer: s.Format("%s-%s-%s-sent-xfer",
									status.m_sFileNameRoot,
									status.getInputMFS()->getAbrev(),
									status.getOutputMFS()->getAbrev()
									);
			break;
		default: ASSERTX(FALSE); return "sent-ERROR"; break;
	}
	return s;

//	return "sent";
}
