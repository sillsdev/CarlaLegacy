// Change History
// 4/14/99 jdh added some missing elements to the textout file:
//					\format, \wfc, and \wfcs
// JDH 5/26/99 8:48:57 AM Added List Comment Capability (\co)
// jdh 8/27/99 Added Andy's preserve word-medial-caps fix
// jdh 9/1/99 writeFile() added bIncludeSCL parameter to support intergen-only version of outtxt.ctl (outit.ctl)
// 1.7a1 03-Dec-1999 hab Removed ctrl-Ms at end of lines.
//                       Allow \cm for comments as well as \co
//                       Allow \td test data lines
// 2.1.1 09-Mar-2000 hab Add CS-specific begin and end codes in data files in
//                       order to keep full line comments and test data in
//                       the correct list.
// 2.1.7 11-Apr-2000 hab Move \\ambig write to textin

#include "stdafx.h"
#include "CWModel.h"
#include "CWAmpleModels.h"
#include "Parsestream.h"
#include "SFMFile.h"
#include "CARLAStudioApp.h"
#include "PathDescriptor.h"
#include "ListComment.h"
#ifndef hab17a1
#include "ListTestData.h"
#endif //hab17a1


////////////////////////////////////////////////////
CWTextOutModel::CWTextOutModel(const CTextDisplayInfo *pTDI)
: m_orthoChanges(pTDI),
	CWModel("TextOut")
{

}

BOOL CWTextOutModel::loadFromFile(LPCTSTR lpszPathName, CWCommonModel& commonModel, BOOL bLogIfMissing)
{
	ASSERTX(lpszPathName);
	SFMFile f(lpszPathName, commonModel.m_cCommentChar);
	if(!f.ensureOpen("TextOut File", bLogIfMissing))
		return FALSE;

	// TO DO: need a superclass of everyting that can take an addDisabledEnvironment,
	//			set previousEntry to that.
	//			also should clear previousEntry after some other type entry is found, so
	//			that we throw an error if it is encountered out of place.

	CWOrthoChange* previousEntry=0;
#ifndef hab17a1
	CTestDataCollector testDataCollector;
#endif //hab17a1
	CString sMarker, sField;
	BOOL bEnabled;
	try
	{
	while(f.getField(sMarker, sField, &bEnabled))
		{
			try
			{
				if(sMarker == "ch")
				{
					CWOrthoChange* entry = new CWOrthoChange(sField, bEnabled, commonModel.m_cCommentChar);
					m_orthoChanges.addItem(entry);
					previousEntry = entry;
				}
				// JDH 5/26/99 8:38:45 AM Added List Comment Capability (\co)
#ifndef hab17a1
				else if(sMarker == "co" || sMarker == "cm")
#else // hab17a1
				else if(sMarker == "co")
#endif // hab17a1
				{
					CListEntryComment *com = new CListEntryComment(sField);
					m_orthoChanges.addItem(com);
				}
				else if(sMarker == "format")
				{
					// note: this may over-write what was read in by textin parser
					sField.TrimLeft();
					if(sField.GetLength())
						commonModel.m_cPrimaryFormatChar.setData(sField[0]);
				}
				else if(sMarker == "luwfc")
				{
					// note: this may over-write what was read in by textin parser
					if(sField.GetLength())
					{	sField = getNRStringFromNString(sField);
						commonModel.m_sLUWFC.setData(sField);
					}
				}
				else if(sMarker == "luwfcs") // multibyte
				{
					// note: this may over-write what was read in by textin parser
					if(sField.GetLength())
					{	sField = getNRStringFromNString(sField);
						commonModel.m_sLUWFCS.setData(sField);
					}
				}
				else if(sMarker == "wfc")
				{
					// note: this may over-write what was read in by textin parser
					sField = getNRStringFromNString(sField);
					commonModel.m_sWFC.setData(sField);
				}
				else if(sMarker == "wfcs")
				{
					// note: this may over-write what was read in by textin parser
					sField = getNRStringFromNString(sField);
					commonModel.m_sWFCS.setData(sField);
				}
				else if(sMarker == "ENV")
				{
					if(!previousEntry)
						f.throwParseFailure("Textout Parser", sMarker, sField, "found \\dis when it wasn't expected.");
					previousEntry->addDisabledEnvironment(sField, commonModel.m_cCommentChar);
				}
				else if(sMarker == "dsc")
				{
					if(sField.GetLength())
						commonModel.m_cDecompSepChar.setData(sField[0]);
				}
				else if(sMarker == "scl")
				{
					// don't read them in here in addition to the ad.ctl
					// because then I'd have
					// to have duplicate-checking function which I
					// don't have.
				}
				else if(sMarker == "ambig")
				{
					// note: this may over-write what was read in by textin parser
					if(sField.GetLength())
						commonModel.m_cAmbigDelimiter.setData(sField[0]);
				}
				else if(sMarker == "id")
				{}
				else if(sMarker == "_sh")	// shoebox
				{}	// skip it
#ifndef hab17a1
				else if(sMarker == "td") // 1.7a1 hab test data
				{
				  testDataCollector.add(sField);
				}
#endif //hab17a1
#ifndef hab211
				else if(sMarker == "CSbegch")
				{
				  // there's only one list, so can ignore this
				}
				else if(sMarker == "CSend") // CS-specific section end marker
				{
				  // there's only one list, so can ignore this
				}
#endif //hab211
				else
					f.logSkip("Textout", sMarker, sField);
				//	TRACE("Parsing Textout file: Skipping field [%s]  [%s]\n", sMarker, sField);
			}
			catch(CString sProblemStr)	// these ones we can keep going
			{
				f.logParseFailure("Textout Parser", sMarker, sField);
			}
		}
	}
	catch(CString sProblemStr)// this one catches problems encountered by getField(); we don't try to keep going
	{
		MessageBox( NULL, sProblemStr, "Parsing Error", MB_OK);
		return FALSE;
	}
	return TRUE;
}

// 4/14/99 jdh added \wfc, \wfcs, and \format; before these were only output for textIn
// jdh 9/1/99 added bIncludeSCL parameter to support intergen-only version of outtxt.ctl (outit.ctl)

BOOL CWTextOutModel::writeFile(CString & sPath, CWCommonModel& commonModel, BOOL bIncludeSCL)
{
	ofstream fout(sPath);
	DWORD error = ::checkForFileError(sPath);
	if(error)
		return FALSE;

	// jdh 9/1/99 add this for intergen-specific version
	if(bIncludeSCL)
	{
		fout << "\\co This is an Intergen-only version of outtxt.ctl.\n";
		fout << "\\co It differs only in that it includes the string class declarations, which STAMP does not want to find in the outtxt.ctl file.\n";
		fout  << "\\co Any changes you make to this file will be ignored and lost the next time CarlaStudio does a save.\n\n";
	}

	if(!commonModel.m_cPrimaryFormatChar.isEmpty())
		fout << "\\format " << commonModel.m_cPrimaryFormatChar << "\n";


	if(!commonModel.m_cAmbigDelimiter.isEmpty() && (commonModel.m_cAmbigDelimiter!=DEFAULT_AMBIG_CHAR))
		fout << "\\ambig " << commonModel.m_cAmbigDelimiter  << "\n";

	if(!commonModel.m_cDecompSepChar.isEmpty() && (commonModel.m_cDecompSepChar!=DEFAULT_DECOMP_SEP_CHAR))
		fout << "\\dsc " << commonModel.m_cDecompSepChar  << "\n";

	if(!commonModel.m_sLUWFC.isEmpty())
		fout << "\\luwfc " << commonModel.m_sLUWFC << "\n";

	if(!commonModel.m_sLUWFCS.isEmpty())
		fout << "\\luwfcs " << commonModel.m_sLUWFCS << "\n";


	// word formation characters
	if(!commonModel.m_sWFC.isEmpty())
		fout << "\\wfc " << commonModel.m_sWFC << "\n";

	if(!commonModel.m_sWFCS.isEmpty())// multibyte
		fout << "\\wfcs " << commonModel.m_sWFCS << "\n";

	// jdh 9/1/99 add this for intergen-specific version
	if(bIncludeSCL)
	{
#ifndef hab211
		commonModel.stringClasses.write(fout, commonModel.m_cCommentChar, "scl");
#else // hab211
		commonModel.stringClasses.write(fout, commonModel.m_cCommentChar);
#endif // hab211
		fout << "\n";
	}

#ifndef hab211
	m_orthoChanges.write(fout, commonModel.m_cCommentChar, "ch");
#else // hab211
	m_orthoChanges.write(fout, commonModel.m_cCommentChar);
#endif //hab211

	return TRUE;
}

////////////////////////////////////////////////////
CWTextInModel::CWTextInModel(CTextDisplayInfo* pTDI)
:		CWModel("TextIn"),
	m_orthoChanges(pTDI),
	//cMorphBreakChar("Morpheme Break Char", '-'),
	bHasUpperLowerCase("Has Upper && Lower Case", TRUE),
	bPreserveWordMedialCaps("Preserve Word Medial Caps", TRUE), /* hab 1999.06.25 change default to true*/
	rIncludeOrExcludeMarkers(1, "Include only these markers",
							"Exclude these markers"),
	sMarkersToIncludeOrExclude("Markers", "\\id", NULL, TRUE, 100),
	sFormatCodes("Format Codes", "bdefhijmrsuvyz", NULL, FALSE),
//	sFormatCodes("Format Codes", "bdefhijmrsuvyz"),	// barcodes
	iMaxDecap("Max Decap Alternatives", 100)
{
}
//////////////////

BOOL CWTextInModel::loadFromFile(LPCTSTR lpszPathName,
								 CWCommonModel& commonModel,
								 BOOL bLogIfMissing)
{
	ASSERTX(lpszPathName);
	SFMFile f(lpszPathName, commonModel.m_cCommentChar);
	if(!f.ensureOpen("TextIn File", bLogIfMissing))
		return FALSE;

	// TO DO: need a superclass of everyting that can take an addDisabledEnvironment,
	//			set previousEntry to that.

	CWOrthoChange* previousEntry=0;
	CString sMarker, sField;
	BOOL bEnabled;
#ifndef hab17a1
	CTestDataCollector testDataCollector;
#endif //hab17a1
	try
	{
	while(f.getField(sMarker, sField, &bEnabled))
		{
			try
			{
				if(sMarker == "ch")
				{
					CWOrthoChange* entry = new CWOrthoChange(sField, bEnabled, commonModel.m_cCommentChar);
					m_orthoChanges.addItem(entry);
					previousEntry = entry;
				}
				// JDH 5/26/99 8:38:45 AM Added List Comment Capability (\co)
#ifndef hab17a1
				else if(sMarker == "co" || sMarker == "cm")
#else // hab17a1
				else if(sMarker == "co")
#endif // hab17a1
				{
					CListEntryComment *com = new CListEntryComment(sField);
					m_orthoChanges.addItem(com);
				}
				else if(sMarker == "ENV")
				{
					if(!previousEntry)
						f.throwParseFailure("Textin Parser", sMarker, sField, "found \\dis when it wasn't expected.");
					previousEntry->addDisabledEnvironment(sField, commonModel.m_cCommentChar);
				}
				else if(sMarker == "wfc")
				{
					sField = getNRStringFromNString(sField);
					commonModel.m_sWFC.setData(sField);
				}
				else if(sMarker == "wfcs")
				{
					sField = getNRStringFromNString(sField);
					commonModel.m_sWFCS.setData(sField);
				}
				else if(sMarker == "luwfc")
				{
					sField = getNRStringFromNString(sField);
					commonModel.m_sLUWFC.setData(sField);
				}
				else if(sMarker == "luwfcs") // multibyte
				{
					sField = getNRStringFromNString(sField);
					commonModel.m_sLUWFCS.setData(sField);
				}
				else if(sMarker == "scl")
				{
					// don't read them in here in addition to the ad.ctl
					// because then I'd have
					// to have duplicate-checking function which I
					// don't have.
					//CWClass *c = new CWClass(sField, bEnabled, commonModel.m_cCommentChar);
					//commonModel.stringClasses.addItem(c);
				}
				else if(sMarker == "format")
				{
					sField.TrimLeft();
					if(sField.GetLength())
						commonModel.m_cPrimaryFormatChar.setData(sField[0]);
				}
				else if(sMarker == "barchar")
				{
					sField.TrimLeft();
					if(sField.GetLength())
						commonModel.m_cSecondaryFormatChar.setData(sField[0]);
				}
				else if(sMarker == "barcodes" )
				{
					sField = getNRStringFromNString(sField);
					sFormatCodes.setData(sField);
				}
				else if(sMarker == "excl")
				{
					rIncludeOrExcludeMarkers.setData(1);
					sMarkersToIncludeOrExclude.setData(sField);
				}
				else if(sMarker == "incl")
				{
					rIncludeOrExcludeMarkers.setData(0);
					sMarkersToIncludeOrExclude.setData(sField);
				}

				// does this make sense in textin? (hab217 - yes, it does, John.  It's where it belongs, as a matter of fact...
				else if(sMarker == "ambig")
				{
					// note: this may over-write what was read in by textout
					if(sField.GetLength())
						commonModel.m_cAmbigDelimiter.setData(sField[0]);
				}
				// isn't really a textin thing, but that *is* where it goes
				else if(sMarker == "dsc")
				{
					if(sField.GetLength())
						commonModel.m_cDecompSepChar.setData(sField[0]);
				}
				else if(sMarker == "maxdecap")
				{
					iMaxDecap = atoi(sMarker);
				}
				else if (sMarker == "noincap")
				{
					bPreserveWordMedialCaps = FALSE; /* hab 1999.06.25 (was TRUE) */
				}
				else if(sMarker == "nocap")
				{
					bHasUpperLowerCase = FALSE;
				}
				else if(sMarker == "id")
				{}
				else if(sMarker == "_sh")	// shoebox
				{}	// skip it
#ifndef hab17a1
				else if(sMarker == "td") // 1.7a1 hab test data
				{
				  testDataCollector.add(sField);
				}
#endif //hab17a1
#ifndef hab211
				else if(sMarker == "CSbegch")
				{
				  // there's only one list, so can ignore this
				}
				else if(sMarker == "CSend") // CS-specific section end marker
				{
				  // there's only one list, so can ignore this
				}
#endif //hab211
				else
					f.logSkip("TEXTIN", sMarker, sField);
					//TRACE("Parsing TEXTIN file: Skipping field [%s]  [%s]\n", sMarker, sField);
			}
			catch(CString sProblemStr)	// these ones we can keep going
			{
				f.logParseFailure("TextIn Parser", sMarker, sField);
			}
		}
	}
	catch(CString sProblemStr)// this one catches problems encountered by getField(); we don't try to keep going
	{
		MessageBox( NULL, sProblemStr, "Parsing Error", MB_OK);
		return FALSE;
	}

	return TRUE;
}


// Called by CCARLALanguage::writeControlFiles()
BOOL CWTextInModel::writeFile(CString & sPath, CWCommonModel& commonModel)
{
	ofstream fout(sPath);
	DWORD error = ::checkForFileError(sPath);
	if(error)
		return FALSE;

// aren't needed here because they're in the ad.ctl file
	//commonModel.stringClasses.write(fout, commonModel.m_cCommentChar);


	if(!commonModel.m_cPrimaryFormatChar.isEmpty())
		fout << "\\format " << commonModel.m_cPrimaryFormatChar << "\n";

	// according to rbr, outputting '|' will be understood as a comment
	// and thus not set this to what you want.  Since this is the default
	// anyways, the right things to do is to leave out that marker
	if(!commonModel.m_cSecondaryFormatChar.isEmpty() && commonModel.m_cSecondaryFormatChar != '|')
		fout << "\\barchar " << commonModel.m_cSecondaryFormatChar << "\n";

	if(!sFormatCodes.isEmpty())
		fout << "\\barcodes " << sFormatCodes << "\n";


	if(!commonModel.m_cDecompSepChar.isEmpty())
		fout << "\\dsc " << commonModel.m_cDecompSepChar << "\n";

	if (!sMarkersToIncludeOrExclude.isEmpty())
	{
		if(rIncludeOrExcludeMarkers == 0)
			fout << "\\incl ";
		else
			fout << "\\excl ";
		fout << sMarkersToIncludeOrExclude << "\n";
	}

	// lower-upper case mappings
	if(!commonModel.m_sLUWFC.isEmpty())
		fout << "\\luwfc " << commonModel.m_sLUWFC << "\n";

	if(!commonModel.m_sLUWFCS.isEmpty())// multibyte
		fout << "\\luwfcs " << commonModel.m_sLUWFCS << "\n";

	// word formation characters
	if(!commonModel.m_sWFC.isEmpty())
		fout << "\\wfc " << commonModel.m_sWFC << "\n";

	if(!commonModel.m_sWFCS.isEmpty())// multibyte
		fout << "\\wfcs " << commonModel.m_sWFCS << "\n";

	// capitalization
	fout << "\\maxdecap " << iMaxDecap << "\n";

	if(!bHasUpperLowerCase.isTrue())
		fout << "\\nocap\n";

	if(!bPreserveWordMedialCaps.isTrue())
		fout << "\\noincap\n";

#ifndef hab211
	m_orthoChanges.write(fout, commonModel.m_cCommentChar, "ch");
#else //hab211
	m_orthoChanges.write(fout, commonModel.m_cCommentChar);
#endif //hab211

#ifndef hab217			// moved from ad.ctl file
	if(!commonModel.m_cAmbigDelimiter.isEmpty() && (commonModel.m_cAmbigDelimiter!=DEFAULT_AMBIG_CHAR))
		fout << "\\ambig " << commonModel.m_cAmbigDelimiter  << "\n";
#endif //hab217

	return TRUE;
}




////////////////////////////////////////////////////
CWDictOrthoModel::CWDictOrthoModel(const CTextDisplayInfo *pTDI)
: m_orthoChanges(pTDI),
	CWModel("TextOut")
{

}

BOOL CWDictOrthoModel::loadFromFile(LPCTSTR lpszPathName, CWCommonModel& commonModel, BOOL bLogIfMissing)
{
	ASSERTX(lpszPathName);
	SFMFile f(lpszPathName, commonModel.m_cCommentChar);
	if(!f.ensureOpen("Dict Ortho Changes File", bLogIfMissing))
		return FALSE;

	CWOrthoChange* previousEntry=0;
	CString sMarker, sField;
	BOOL bEnabled;
#ifndef hab17a1
	CTestDataCollector testDataCollector;
#endif //hab17a1
	try
	{
	while(f.getField(sMarker, sField, &bEnabled))
		{
			try
			{
				if(sMarker == "ch")
				{
					CWOrthoChange* entry = new CWOrthoChange(sField, bEnabled, commonModel.m_cCommentChar);
					m_orthoChanges.addItem(entry);
					previousEntry = entry;
				}
				else if(sMarker == "ENV")
				{
					if(!previousEntry)
						f.throwParseFailure("Dict-Ortho-Changes Parser", sMarker, sField, "found \\dis when it wasn't expected.");
					else
						previousEntry->addDisabledEnvironment(sField, commonModel.m_cCommentChar);
				}
				else if(sMarker == "scl")
				{}
				else if(sMarker == "id")
				{}
				else if(sMarker == "_sh")	// shoebox
					{}	// skip it
#ifndef hab17a1
				else if(sMarker == "co" || sMarker == "cm")
#else // hab17a1
				else if(sMarker == "co")
#endif // hab17a1
				{
					CListEntryComment *com = new CListEntryComment(sField);
					m_orthoChanges.addItem(com);
				}
#ifndef hab17a1
				else if(sMarker == "td") // 1.7a1 hab test data
				{
				  testDataCollector.add(sField);
				}
#endif //hab17a1
#ifndef hab211
				else if(sMarker == "CSbegch")
				{
				  // there's only one list, so can ignore this
				}
				else if(sMarker == "CSend") // CS-specific section end marker
				{
				  // there's only one list, so can ignore this
				}
#endif //hab211
				else
					f.logSkip("Dict-Ortho-Changes", sMarker, sField);
			}
			catch(CString sProblemStr)	// these ones we can keep going
			{
				f.logParseFailure("Dict-Ortho-Changes Parser", sMarker, sField);
			}
		}
	}
	catch(CString sProblemStr)// this one catches problems encountered by getField(); we don't try to keep going
	{
		MessageBox( NULL, sProblemStr, "Parsing Error", MB_OK);
		return FALSE;
	}
	return TRUE;
}


BOOL CWDictOrthoModel::writeFile(CString & sPath, CWCommonModel& commonModel)
{
	ofstream fout(sPath);
	DWORD error = ::checkForFileError(sPath);
	if(error)
		return FALSE;

//commonModel.stringClasses.write(fout, commonModel.m_cCommentChar);
#ifndef hab211
	m_orthoChanges.write(fout, commonModel.m_cCommentChar, "ch");
#else //hab211
	m_orthoChanges.write(fout, commonModel.m_cCommentChar);
#endif //hab211

	return TRUE;
}

// used to determine whether we should tell ample and stamp to load the
// corresponding file
BOOL CWDictOrthoModel::getInUse() const
{
	return (m_orthoChanges.getSize() > 0);
}
