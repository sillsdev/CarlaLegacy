
#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "SFMFile.h"
//#include "WizNewFromFiles.h"
#include "WizNewFromCarla.h"
//#include "ProcessSequence.h"
#include "LangModelsDoc.h"
#include "ProjectDoc.h"
#include "ParseStream.h"
#include "CarlaLanguage.h"
#include "PathDescriptor.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

// these are also used in LangModelsDoc.cpp.  They are needed because
// I need to pass these parameters to NewDocument, but can't
// call it directly, and thus can't override it to add the parameters

CString gsNewLangAbrev;
CString gsDirContainingCarlaSet;

// called by the CPageCMenu::OnWizardNext() after the page where the user chooses
//	the carla.set file so that subsequent page can show some of the information
//	(e.g. abbreviation) we'll read in that file
BOOL CProjectDoc::readCarlaMenuSettings(CString& sPath, CString& sSrcAbrev, CString& sTargAbrev, char& cCommentChar)
{
	const char* lpzPath = LPCTSTR(sPath);
	SFMFile f(lpzPath, '*'); // comment won't be found in this kind of file

	if(!f.isOpen())
	{
		CString s("Couldn't open CARLAMenu File named:");
		s += sPath;
		MessageBox( NULL, s, NULL, MB_OK);
		return FALSE;
	}

	CString sMarker, sField;
	BOOL bEnabled;

	// note that we currently don't store the abreviations or control directories
	// instead, we store paths to each file relative to the project file

	while(f.getField(sMarker, sField, &bEnabled))
	{
		try
		{	// note: within CStudio we don't really have a set
			// source and target languages; we just have languages
			// that are at any one time assigned to be the source
			// or the target during processing.
			// The following make the languages found here be the
			// source or target initially,
			// according to how they were in the CARLAMenu settings file.
			if(sMarker == "src")
			{
				sSrcAbrev = sField;
			}
			else if(sMarker == "trg")
			{
				sTargAbrev = sField;
			}
			else if(sMarker == "comm")	// notice, it's part of the whole cmenu project, not each lang as you would expect
			{
				sField.TrimLeft();
				if(sField.GetLength())
					cCommentChar = sField[0];
			}
			else if(sMarker == "lang")	// FIELD example: \lang xyz c:\srcinfo
			{							// we need to figure out if this is the src or trg lang
				CString sLang, sDir;	// and set the corresponding directory variable
				CParseStream stream(sField);
				THROW_STR_IF_NOT(stream.word(sLang, FALSE), sField);

				// for some reason, some \lang fields aren't the src or the target (see Cline:anufo).
				// I don't know what these are in there for or what to do with them

				if(sLang != sSrcAbrev && sLang != sTargAbrev)
				{
					//f.logSkip("CarlaMenu-Import",sMarker,sField, "Was neither the source nor target.");
				}
				else
				{

					if(!stream.word(sDir, FALSE))
					{								 // if the path isn't specified,
						sDir = getDirectory(lpzPath);// then expect the path to the langauge.set file to be the same as the carla.set file
					}
					// make sure the directory ends in a slash (CARLAMenu allows both ways)
					if(sDir[sDir.GetLength()-1] != '\\')	// look at last character
						sDir += "\\";

					/**** when I tried to make the langdoc this way, I get a failed assert
						  like the views weren't being setup correctly.
						CLangModelsDoc* pLangDoc = new CLangModelsDoc(sLang, sDir);
						// since we didn't do a new or open, need to create the window
						CFrameWnd* pf = ((CCarlaStudioApp*)AfxGetApp())->getLangDocTemplate()
								->CreateNewFrame( pLangDoc, NULL);
						pf->ActivateFrame();
					***/
					gsNewLangAbrev = sLang;
					gsDirContainingCarlaSet = sDir;
					CDocTemplate* pT = theApp.getDocTemplate(CLangModelsDoc::getRegFileTypeID());

					CLangModelsDoc* pLangDoc = (CLangModelsDoc*) pT->CreateNewDocument();
					ASSERTX(pLangDoc);
					gsNewLangAbrev = "";
					gsDirContainingCarlaSet = "";

					// during that previous construction the lang registered itself with this project
					if(sLang == sSrcAbrev)
						setSourceLangDoc(pLangDoc);
					else if(sLang == sTargAbrev)
						setTargetLangDoc(pLangDoc);
					else
						ASSERTX(FALSE);	// get this if a lang appeared that didn't have a corresponding \src or \trg
				}
			}

			else
				; //TRACE("CARLAMENU Skipping Field [%s]\n", sMarker);
		}
		catch(CString sError)
		{
			CString s("loadCarlaMenuFile() Couldn't parse: ");
			s += sError;
			MessageBox( NULL, s, NULL, MB_OK);
		}
	}


	return TRUE;
}

// called by OnNewDocument()
// returns FALSE if the user cancels the dialog
BOOL CProjectDoc::doNewFromCarlaMenu(CString& sProjectPath)
{
	CWizNewFromCarla dlg(this);

	// stick in CCarlaLanguages's default font
	//getSourceLang()->getFont()->GetLogFont(&dlg.m_srcLangDisplayPage.m_logFont);

	if(IDOK != dlg.DoModal())
		return FALSE;

	// note that during the wizard we parsed in the carla.set file

	sProjectPath = dlg.m_projectPage.m_sProjectPath;
	SetDirectory(sProjectPath); // make this the working directory

	if(!getSourceLang() || !getSourceLang()->getAbrev().GetLength())
	{
		MessageBox( NULL, "This does not appear to be a valid CARLA.SET file (no \\src sMarker found)\n", NULL, MB_OK);
		return FALSE;
	}

	CCarlaLanguage* pLang = m_pLangDocs[0]->getLang();
	ASSERTX(pLang);
	//pLang->setAbrev(dlg.m_srcLangDisplayPage.m_sAbrev);
	//pLang->setName(dlg.m_srcLangDisplayPage.m_sName);
	//pLang->setFont(&dlg.m_srcLangDisplayPage.m_logFont);
	pLang->readLangDisplayPage(dlg.m_srcLangDisplayPage);

	pLang->readCARLAMenuLangFile(dlg.m_cmenuPage.m_cCommentChar);

	if(m_pLangDocs.GetSize()==2)	// if there was a target lang specified
	{
		pLang = m_pLangDocs[1]->getLang();
		ASSERTX(pLang);
	//	pLang->readCARLAMenuLangFile(dlg.m_cmenuPage.m_cCommentChar);
	//	pLang->setAbrev(dlg.m_tarLangDisplayPage.m_sAbrev);
	//	pLang->setName(dlg.m_tarLangDisplayPage.m_sName);
		//pLang->setFont(&dlg.m_tarLangDisplayPage.m_logFont);
		pLang->readLangDisplayPage(dlg.m_tarLangDisplayPage);
		pLang->readCARLAMenuLangFile(dlg.m_cmenuPage.m_cCommentChar);

		// if there were two languages, tell the first one (the source) to copy in the
		// control files for transfering to the other language.  We skip asking to got
		// the other direction to, out of the lack of expecation that those files exist.
		// It might not do any harm to try, though, if someone comes up with a reason.
		m_pLangDocs[0]->getLang()->setConversionTargetLang(m_pLangDocs[1]->getLang());
	}



/*	getSourceLang()->setAbrev(dlg.m_srcLangDisplayPage.m_sAbrev);
	getSourceLang()->setName(dlg.m_srcLangDisplayPage.m_sName);
	getSourceLang()->setFont(&dlg.m_srcLangDisplayPage.m_logFont);
	getSourceLang()->readCARLAMenuLangFile();

	if(getTargetLang())
	{
		getTargetLang()->readCARLAMenuLangFile();
		getTargetLang()->setAbrev(dlg.m_tarLangDisplayPage.m_sAbrev);
		getTargetLang()->setName(dlg.m_tarLangDisplayPage.m_sName);
		getTargetLang()->setFont(&dlg.m_tarLangDisplayPage.m_logFont);

		// won't find any files because carlamenu is one-way transfer only,
		//		so leave this one out
		//			getTargetLang()->setConversionTargetLang(m_pSource);
		getSourceLang()->setConversionTargetLang(getTargetLang());
	}
*/
	return TRUE;
}
