// TransferModelSet.cpp: implementation of the CTransferModelSet class.
//
//////////////////////////////////////////////////////////////////////
// 1.7a1 10-Dec-1999 hab Move location of transfer files from source to target
//                       control file directory

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "TransferModelSet.h"
#include "ModelFilesSet.h"
#include "CarlaLanguage.h"
//#include "DlgProgress.h"
#include "SimpleProgressBar.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

//CTransferModelSet::CTransferModelSet(SFMFile* f)
//{

//}

CTransferModelSet::~CTransferModelSet()
{

}

//void CTransferModelSet::write(ostream& fout) const
//{
/* ITS NOT CLEAR THAT WE WILL REALLY NEED TO READ/WRITE ANYTHING
	INSTEAD, WE COULD TAKE OUR QUEUE FROM THE EXISTENCE OF THE TRANSFER
	PROCESSSEQUENCES

	  fout << "\\+TransferModelSet " << m_pTargetLang->getUniqueID() << "\n";
	fout << "\\-TransferModelSet\n";
*/
//}

BOOL CTransferModelSet::writeControlFiles(CModelFilesSet* pMFS, CWCommonModel& rCommonModel)
{
#ifndef hab17a1
				// put Sentrans file in target language's
			//  control file directory
	CString sPath = m_pTargetLang->getMFS()->getSentransTransferPath(pMFS->getAbrev(), m_pTargetLang->getAbrev());
			// save it in target directory
	if(!m_sentransTransferModel.writeFile(sPath, rCommonModel))
		return FALSE;
			// Now see if it also exists in source directory
	CFile fTestForExistence;
	sPath = pMFS->getSentransTransferPath(pMFS->getAbrev(), m_pTargetLang->getAbrev());
	if (fTestForExistence.Open(sPath, CFile::modeReadWrite))
	  {
				// It exists in source directory.  It's no
				// longer needed, so delete it.
		fTestForExistence.Close(); // close it so we can delete it
		CFile::Remove(sPath);
	  }
	else
	  ::SetLastError(0);	// It's OK if it's not there.
			// put Stamp file in target language's
			// control file directory
	sPath = m_pTargetLang->getMFS()->getStampTransferPath(pMFS->getAbrev(), m_pTargetLang->getAbrev());
			// save it in target directory
	if(!m_stampTransferModel.writeFile(sPath, rCommonModel))
		return FALSE;
			// Now see if it also exists in source directory
	sPath = pMFS->getStampTransferPath(pMFS->getAbrev(), m_pTargetLang->getAbrev());
	if (fTestForExistence.Open(sPath, CFile::modeReadWrite))
	  {
				// It exists in source directory.  It's no
				// longer needed, so delete it.
		fTestForExistence.Close(); // close it so we can delete it
		CFile::Remove(sPath);
	  }
	else
	  ::SetLastError(0);	// It's OK if it's not there.
#else // hab17a1
	CString sPath = pMFS->getSentransTransferPath(m_pTargetLang->getAbrev());
	if(!m_sentransTransferModel.writeFile(sPath, rCommonModel))
		return FALSE;

	sPath = pMFS->getStampTransferPath(m_pTargetLang->getAbrev());
	if(!m_stampTransferModel.writeFile(sPath, rCommonModel))
		return FALSE;
#endif // hab17a1

	return TRUE;
}

void CTransferModelSet::loadControlFiles(CModelFilesSet* pMFS,
										 CWCommonModel& commonModel)
{
	// we don't want to complain when there are missing files after converting
	// from carlamenu if we shouldn't expect those file to be there anyhow
//	BOOL bWasCMenuSource = theApp.getProject()->getSourceLang() == this;
	BOOL bLogFlagForSrc = FALSE; //!bFirstLoadAfterCarlaMenuImport && bWasCMenuSource;

	CSimpleProgressBar progress(_T(""));
#ifndef hab17a1
			// try reading file in target language's control file directory (new method)
	CString sPath = m_pTargetLang->getMFS()->getSentransTransferPath(pMFS->getAbrev(), m_pTargetLang->getAbrev());
	CFile fTestForExistence;
				// see if it exists in target directory
	if (!fTestForExistence.Open(sPath, CFile::modeReadWrite))
	  {
				// couldn't find it; assume that are upgrading
				// to target directory and use source directory
				// as in previous versions of CS (loading only)
		sPath = pMFS->getSentransTransferPath(pMFS->getAbrev(), m_pTargetLang->getAbrev());
	  }
	else
	  fTestForExistence.Close(); // can close it now; will be opened in loadFromFile() below
#else // hab17a1
	CString sPath = pMFS->getSentransTransferPath(m_pTargetLang->getAbrev());
#endif // hab17a1
	progress.SetTextEx(_T("%s%s-->%s"), _T("Loading SENTRANS Transfer "), pMFS->getAbrev(),
		 m_pTargetLang->getAbrev());
	m_sentransTransferModel.loadFromFile(sPath, commonModel, bLogFlagForSrc);

	progress.SetTextEx(_T("%s%s-->%s"), _T("Loading Stamp Transfer "), pMFS->getAbrev(),
		 m_pTargetLang->getAbrev());
#ifndef hab17a1
			// try reading file in target language's control file directory (new method)
	sPath = m_pTargetLang->getMFS()->getStampTransferPath(pMFS->getAbrev(), m_pTargetLang->getAbrev());
	fTestForExistence;
				// see if it exists in target directory
	if (!fTestForExistence.Open(sPath, CFile::modeReadWrite))
	  {
				// couldn't find it; assume that are upgrading
				// to target directory and use source directory
				// as in previous versions of CS (loading only)
		sPath = pMFS->getStampTransferPath(pMFS->getAbrev(), m_pTargetLang->getAbrev());
	  }
	else
	  fTestForExistence.Close();		// can close it now; will be opened in loadFromFile() below
#else // hab17a1
	sPath = pMFS->getStampTransferPath(m_pTargetLang->getAbrev());
#endif // hab17a1
	m_stampTransferModel.loadFromFile(sPath, commonModel, bLogFlagForSrc);
}

/*void CTransferModelSet::importCarlaMenu(CModelFilesSet * pMFS)
{
	copyCtrlFile(m_sTempConvertFromDirectory, _T("disam.sen"));

}
*/

CStampTransferModel* CTransferModelSet::getStampTransferModel()
{
	return &m_stampTransferModel;
}
