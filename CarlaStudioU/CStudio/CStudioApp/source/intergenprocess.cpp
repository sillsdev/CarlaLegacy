// Change History
// april 14-1999 jdh added textOut parameter to enable multi-byte chars
//				to be accounted for correctly by Intergen.
// jdh 6/8/99 Add post-intergen cleanup step to remove unwanted markers
// 9/1/99 jdh changed to use the special intergen-only version of outtxt.ctl which contains the \scl s (stamp doesn't want them)
// 2.0.4 19-Jan-2000 hab Fix getBatchName so it allows for more than 9 processes
// 2.1.5 28-Mar-2000 hab Added apply output changes as a boolean

#include "stdafx.h"
#include <strstrea.h>
#include <fstream.h>
#include "CWProcess.h"
#include "AnalysisProcesses.h"
#include "SFMFile.h"
#include "DlgEditIntergenProcess.h"
#include "processOutput.h"
#include "processStatus.h"
#include "parsestream.h"
#include "logwindow.h"
#include "ModelFilesSet.h"
#include "cleaner.h"

static CString emptyString;

// the following is to increase readability of the code
#define INPUTFILE status.sANAPath

#ifndef rde270
// make these defines typesafe, so I don't screw up the unicode switch.
// this one doesn't appear to be used!
#else   // rde270
#define outputIfNotEmpty(f,m,s) if(!s.IsEmpty()) f << "\\" << m << ' '<< s << "\n";
#endif  // rde270

void CIntergenProcess::writeToStream(ostream& fout) const
{
	USES_CONVERSION_U8;
	fout << "\\+Process "<< ID() << PROC_ENABLED_STATUS << "\n";
	outputStr(fout, "DecompChar", m_sDecompChar);
	outputInt(fout, "MaxLineLength", m_iMaxLineLength);
	outputBool(fout, "UseSFMarkers", m_bUseSFMarkers);
	outputBool(fout, "AllDecompAmbig", m_bAllDecompAmgiguities);
#ifndef hab215
	outputBool(fout, "ApplyOutputChanges", m_bApplyOutputChanges);
#endif // hab215

	for(int i=0; i< m_markers.GetSize(); i++)
	{
		fout << "\\Marker " << m_markers[i]->m_cCode << ' ';
		fout << ((m_markers[i]->m_bEnabled)?"1 ":"0 ");
		fout << T2CU8(m_markers[i]->m_sMarker) << '\n';
		// don't save the description, since that is static
	}

	fout << "\\-Process "<< ID() << "\n";
}

IMPLEMENT_DYNCREATE(CIntergenProcess, CDOSProcess);

void CIntergenProcess::readParametersFromSFMFile(SFMFile *f)
{
// already called by constructor	setDefaultValues();
	CString sMarker, sField;
	BOOL bEnabled;	// not really used here
	BOOL bDummyForOldField;
	int nNumMarkersRead=0;

	while(f->getField(sMarker, sField, &bEnabled))
	{
		if(sMarker==_T("-Process"))
			break;
		else checkAndReadBool("UseSFMarkers", m_bUseSFMarkers)
#ifndef hab215
		else checkAndReadBool("ApplyOutputChanges", m_bApplyOutputChanges)
#endif // hab215
		else checkAndReadBool("AllDecompAmbig", m_bAllDecompAmgiguities)
		else checkAndReadChar("DecompChar", m_sDecompChar)
		else checkAndReadInt("MaxLineLength", m_iMaxLineLength)
		else checkAndReadBool("IncludeAnalysis", bDummyForOldField)
		else checkAndReadBool("IncludeCategory", bDummyForOldField)
		else checkAndReadBool("IncludeDecomp", bDummyForOldField)
		else checkAndReadBool("IncludeFeature", bDummyForOldField)
		else checkAndReadBool("IncludeOriginalWord", bDummyForOldField)
		else checkAndReadBool("IncludeProperty", bDummyForOldField)
		else checkAndReadBool("IncludeUForm", bDummyForOldField)

		else if(sMarker== _T("Marker"))
		{
			// Parse the field
			// \\Marker code enabled marker

			CString sMarker;
			CString s;
			TCHAR cCode;
			int x;

			CParseStream stream(sField, '|');
			stream.word(s, FALSE);
			cCode = s.GetAt(0);
			stream.integer(&x);
			BOOL bEnabled = x==1;
			stream.word(sMarker, FALSE);

			//find the matching marker in our array
			for(int nCurrent=0; nCurrent<m_markers.GetSize(); nCurrent++)
				if(cCode == m_markers[nCurrent]->m_cCode)
					break;

			if(nCurrent>=m_markers.GetSize()) // never found a matching marker
				f->throwParseFailure(_T("INTERGENProcess"), sMarker, sField);

			// set its fields
			m_markers[nCurrent]->m_bEnabled = bEnabled;
			m_markers[nCurrent]->m_sMarker = sMarker;

			// set the order
			CIntergenMarker* pMatchItem = m_markers[nCurrent];
			CIntergenMarker* pMoveItem = m_markers[nNumMarkersRead];

			// swap this one with the one that is in its place
			if(nNumMarkersRead != nCurrent)
			{
				m_markers[nNumMarkersRead] = pMatchItem;
				m_markers[nCurrent] = pMoveItem;
			}
			++nNumMarkersRead;
		}


		else
		{
			f->throwParseFailure(_T("INTERGENProcess"), sMarker, sField);
		}
	}
}

CIntergenProcess::CIntergenProcess()
:CDOSProcess()
{
	setDefaultValues();
}

void CIntergenProcess::setDefaultValues()
{
	m_sDecompChar = _T("-");
	m_bAllDecompAmgiguities = TRUE;
#ifndef hab215
	m_bApplyOutputChanges = FALSE;
#endif // hab215
	m_iMaxLineLength = 70;
	m_bUseSFMarkers = TRUE;

	m_markers.Add(new CIntergenMarker('w', _T("wrd"), _T("Original word"),  TRUE));
	m_markers.Add(new CIntergenMarker('d', _T("dcm"), _T("Morpheme decomposition"), TRUE));
	m_markers.Add(new CIntergenMarker('a', _T("ana"),_T("Analysis (morphnames)"),  TRUE));
	m_markers.Add(new CIntergenMarker('u', _T("ulf"),_T("Underlying form"), TRUE));
	m_markers.Add(new CIntergenMarker('p', _T("pro"), _T("Properties"),  TRUE));
	m_markers.Add(new CIntergenMarker('c', _T("cat"), _T("Category"), TRUE));
	m_markers.Add(new CIntergenMarker('f', _T("ftd"), _T("Features (for XAmple & PC-PATR)"),  TRUE));

}
CIntergenProcess::~CIntergenProcess()
{
	for( int i=0; i< m_markers.GetSize(); i++)
	{
		delete m_markers[i];
	}

}

BOOL CIntergenProcess::doEditDialog(int iFunctionCode)
{
	CDlgEditIntergenProcess dlg(this);

	// Load in all our settings
	dlg.m_sDecompChar = m_sDecompChar ;
	dlg.m_iMaxLineLength = m_iMaxLineLength;
	dlg.m_bUseSFMarkers = m_bUseSFMarkers ;
	dlg.m_bAllDecompAmbiguities = m_bAllDecompAmgiguities;
#ifndef hab215
	dlg.m_bApplyOutputChanges = m_bApplyOutputChanges;
#endif // hab215

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_sDecompChar = dlg.m_sDecompChar ;
	m_iMaxLineLength = dlg.m_iMaxLineLength;
	m_bUseSFMarkers = dlg.m_bUseSFMarkers ;
	m_bAllDecompAmgiguities = dlg.m_bAllDecompAmbiguities;
#ifndef hab215
	m_bApplyOutputChanges = dlg.m_bApplyOutputChanges;
#endif // hab215
	return TRUE;
}


LPCTSTR CIntergenProcess::getToolPath()
{
	return _T("INTERGEN32");
}

CString CIntergenProcess::getBatchName(CProcessStatus& status)
{
	CString sBatchFile;
#ifndef hab204
	sBatchFile.Format(_T("%s intergen%d"),
			  (LPCTSTR)status.getInputMFS()->getAbrev(),
			  status.m_iProcNumber);
#else // hab204
	sBatchFile.Format(_T("%s intergen"),
			status.getInputMFS()->getAbrev());
	sBatchFile+='0' + status.m_iProcNumber;
#endif // hab204
	return sBatchFile;
}


CString CIntergenProcess::getCommandLine(CProcessStatus& status)
{
	// note: the default directory will be set the dir containing the source file
	//       so that doesn't need to be specified

	strstream sout;
	//ASSERTX(m_pOwningSequence);
	//CCarlaLanguage *pLang = m_pOwningSequence->getSrcLang();
	//ASSERTX(status.getInputLang());

	sout << "-a "; // align words  NOTICE: not under user control

	USES_CONVERSION_U8;
	if('|' != status.getInputMFS()->getCommentChar())
		sout << "-c " << status.getInputMFS()->getCommentChar() << " ";
	sout << "-d " << T2CU8(m_sDecompChar) << ' ';
	if(m_bUseSFMarkers)
		sout << "-f ";
	sout << "-i " << T2CA(status.sANAPath.getQuotedPath());
	sout << " -o " << T2CA(m_sITXPath) << " ";
	sout << " -w " << m_iMaxLineLength << ' ';
	if(m_bAllDecompAmgiguities)
		sout << " -e "; // tells it to produce every decomposition, instead of just the first, we don't give user a way to control this

	// april 14-1999 jdh added to enable multi-byte chars to be accounted for correctly
	//sout << "-t " << '"'  << status.getInputMFS()->getCtrlFilePath("outtx.ctl") << '"' << ' ';
	// 9/1/99 jdh changed to use the special intergen-only version of outtxt.ctl which contains the \scl s (stamp doesn't want them)
#ifndef hab215
	if (m_bApplyOutputChanges)
	  sout << "-t " << '"'  << T2CA(status.getInputMFS()->getCtrlFilePath(_T("outit.ctl"))) << '"' << ' ';
#else // hab215
	sout << "-t " << '"'  << status.getInputMFS()->getCtrlFilePath("outit.ctl") << '"' << ' ';
#endif // hab215

	BOOL bSomeEnabled = FALSE;
	for( int i=0; i< m_markers.GetSize(); i++)
	{
		if(m_markers[i]->m_bEnabled)
		{
			bSomeEnabled=TRUE;
			break;
		}
	}
	if(	bSomeEnabled)	// OUTPUT THE DESIRED ORDER OF THE FIELDS
	{
		sout << "-s ";
		for( i=0; i< m_markers.GetSize(); i++)
		{
			if(m_markers[i]->m_bEnabled)
				sout << m_markers[i]->m_cCode;
		}
		sout << ' ';
	}
	// OUTPUT THE DESIRED MARKERS TO USE
	for( i=0; i< m_markers.GetSize(); i++)
	{
		if(m_markers[i]->m_bEnabled && !m_markers[i]->m_sMarker.IsEmpty())
			sout << "-g " <<  m_markers[i]->m_cCode << T2CU8(m_markers[i]->m_sMarker) << ' ';
	}

	if(INPUTFILE.getShortPath().IsEmpty())
		throw(CProcessFailure(this, _T("Huh?  There was no ANA file path given to the intergen process.  You should look into the log of the previous processor (ample or sentrans) and look for errors, then report this as a bug.")));

// INTERGEN CURRENT CAN'T BE REDIRECTED
			//sout << " >> " <<  m_sLOGPath;

	//TO DO: add textout file
	//sout << " -t " << m_sInputFileNa me << ".itx ";

	//sout << " >> " <<  m_sInputFileName << ".out";
#ifndef rde270
	// I'm just not sure if sout.str is going to be null terminated, so do it the long way.
	int nLen = sout.pcount();
	char* pSout = (char*)alloca(nLen + 1);
	strncpy(pSout, sout.str(), nLen);
	pSout[nLen] = '\0';
	CString s(U82CT(pSout));
#else   // rde270
	CString s(sout.str(), sout.pcount());
#endif  // rde270
	sout.rdbuf()->freeze(0); // else get a memory leak

	// !!!!!!!!!! TO DO: make sure the string is going to be short enough (under 128?)
	return s;
}



// EXCEPTIONS: CProcessFailure
// TO DO:	clean up error reporting
//			use dialog to say we're busy and give a cancel button
void CIntergenProcess::processANAFile(CProcessStatus& status)
{
	try
	{
		m_sITXPath = status.makeTempPathShort(status.m_sFileNameRoot,_T(".itx"));
	// INTERGEN CURRENT CAN'T BE REDIRECTED
		//m_sLOGPath = status.makeTempPathShort(INPUTFILE.getFileName(),_T(".int"));
		DeleteFile(m_sITXPath);	// don't care if it is found or not
		if(!executeTool(status))
		{
			throw(CProcessFailure(this, _T("Failed to interlinearize the file")));
		}

		CPathDescriptor x(m_sITXPath);
		waitForCompletion(&status, &x);

		// jdh 6/8/99 Add post-intergen cleanup step to remove unwanted markers
		//			needed for csBridge stripping.
		// CHook sets this marker before beginning processing.  We do this here rather than
		//	after processing, in the CHook, because by then the version of the file
		//	that this produces will already be loaded into the input doc.  So we
		//	need to do it here, before registering the output file.
		if(!m_sPostIntergenStripMarker.IsEmpty())
		{
			CSCleaner cleaner;
			cleaner.stripLeftOverMarker(m_sITXPath,
										m_sPostIntergenStripMarker);
			m_sPostIntergenStripMarker = _T(""); // clear it so that it won't be set if the use processes from within CStudio
		}

		// register itx output so the user can view it
		CResultStreamFile* itxStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
												_T("Interlinear"), //short description
												_T("Interlinear Text"), // long description
												_T("Interlinear") // tab label
											),
					m_sITXPath,
					status.getInputLang());

		status.registerResultStream(itxStream);

		// register log output so the user can view it
/*		// INTERGEN CURRENT CAN'T BE REDIRECTED
		CResultStreamFile* logStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(_T("Log of the Intergen processor"),
												_T("INTERGEN"), // process name
												INTERGENID,// process ID
												_T("INTERGEN LOG"), // LABEL
												_T("LOG") // TYPEID
											),
					m_sLOGPath);
		status.registerResultStream(logStream);
*/

		//	CloseHandle(m_hConsoleApp);
		status.sInterlinearPath = m_sITXPath;
	}
	catch(LPCTSTR sError)
	{
		throw(CProcessFailure(this, sError));
	}
	catch(CString sError)
	{
		throw(CProcessFailure(this, sError));
	}
}

// used to feed the csclean.exe for deinterlinearizing
/*void CIntergenProcess::getMarkers(CString &sWordMrk, CString& sAnalysisMarkers)
{
	sWordMrk = _T("???");
	sAnalysisMarkers = _T("");
	for(int i=0; i< m_markers.GetSize(); i++)
	{
		if(m_markers[i]->m_cCode == 'w')
			sWordMrk = m_markers[i]->m_sMarker;
		else
			sAnalysisMarkers += ' ' + m_markers[i]->m_sMarker;
	}
}

void CIntergenProcess::getMarkers(CString &sWordMrk, CStringArray &analysisMarkers)
{
	sWordMrk = _T("???");
	analysisMarkers.RemoveAll();
	for(int i=0; i< m_markers.GetSize(); i++)
	{
		if(m_markers[i]->m_cCode == 'w')
			sWordMrk = m_markers[i]->m_sMarker;
		else
			analysisMarkers.Add(m_markers[i]->m_sMarker);
	}
}
*/

CString CIntergenProcess::getWordMarker()
{
	for(int i=0; i< m_markers.GetSize(); i++)
	{
		if(m_markers[i]->m_cCode == 'w')
			return m_markers[i]->m_sMarker;
	}
	return _T("");
}

void CIntergenProcess::getAnalysisMarkers(CStringArray &analysisMarkers)
{
	analysisMarkers.RemoveAll();
	for(int i=0; i< m_markers.GetSize(); i++)
	{
		if(m_markers[i]->m_cCode == 'w')
			; // skip it
		else  if(m_markers[i]->m_bEnabled)
			analysisMarkers.Add(m_markers[i]->m_sMarker);
	}
}

// space delimeted
CString CIntergenProcess::getAnalysisMarkers()
{
	CString s;
	for(int i=0; i< m_markers.GetSize(); i++)
	{
		if(m_markers[i]->m_cCode == 'w')
			; // skip it
		else if(m_markers[i]->m_bEnabled)
			s += m_markers[i]->m_sMarker + ' ';

	}
	s.TrimRight();
	return s;
}
