//////
// 1.7a1 09-Dec-1999 hab Move location of transfer files from source to target
//                       control file directory
// 2.1.2 14-Mar-2000 jdh Various additions to support using dictionary preprocessors w/ quickparse

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "ModelFilesSet.h"
#include "SFMFile.h"
#include <strstrea.h>
#include  "PathDescriptor.h"
#include <io.h>
//#include "WizNewFromFiles.h"	// should remove PageDictionaries from this

// copy contstuctor
CModelFilesSet::CModelFilesSet(const CModelFilesSet& mfs)
:	m_sDictFilesDirectory(mfs.m_sDictFilesDirectory), // this will be retired soon
	//m_sPrefixDictName(mfs.m_sPrefixDictName),
	//m_sInfixDictName(mfs.m_sInfixDictName),
	//m_sSuffixDictName(mfs.m_sSuffixDictName),
	m_pathPrefixDict(mfs.m_pathPrefixDict),
	m_pathSuffixDict(mfs.m_pathSuffixDict),
	m_pathInfixDict(mfs.m_pathInfixDict),
	m_sAdctlFileDirectory(mfs.m_sAdctlFileDirectory),
	m_sAdctlFileName(mfs.m_sAdctlFileName),	// can be different from <abrev>ad.ctl
	m_sCtrlFilesDirectory(mfs.m_sCtrlFilesDirectory),
	m_sAbrev(mfs.m_sAbrev),
	m_rootDicts(mfs.m_rootDicts),
	m_bUseUnified(mfs.m_bUseUnified),
	m_pPreprocessedDicts(NULL)
{
//	for(int i=0; i< mfs.m_sRootDictNames.GetSize(); i++)
//		m_sRootDictNames.Add(mfs.m_sRootDictNames[i]);
}

CModelFilesSet::CModelFilesSet(LPCSTR lpszAbrev)
:m_sAbrev(lpszAbrev),
m_bUseUnified(TRUE),
	m_pPreprocessedDicts(NULL)

{

}

CModelFilesSet::~CModelFilesSet()
{
	deletePreprocessedDictArray();
}

//	Parameters: lpszSuffix is the end of the control file name, after the path & abreviation prefix
//	Returns: the path to the control file
CString CModelFilesSet::getCtrlFilePath(LPCTSTR lpszSuffix) const
{
	ASSERTX(m_sAbrev.GetLength());
	ASSERTX(m_sCtrlFilesDirectory.GetLength());
	CString sPath(m_sCtrlFilesDirectory);
	::fixDirectory(const_cast<CString&>(m_sCtrlFilesDirectory));

	sPath += getCtrlFileName(lpszSuffix);
	//sPath += m_sAbrev;
	//sPath += lpszSuffix;
	return sPath;
}
// adctl path is special, because CARLAMenu allowed you to define the name
// and location of this file separately.  I will probably do the same for
// this app.  For now, I support it for import purposes.

CString CModelFilesSet::getADCtlPath() const
{
	CString sPath;

	if(m_sAdctlFileDirectory.GetLength()==0)	// if we have a special dir, don't copy it
		sPath = m_sCtrlFilesDirectory;
	else
		sPath = m_sAdctlFileDirectory;

	fixDirectory(sPath);

	ASSERTX(m_sAbrev.GetLength());
	CString sCanonicalADCTLName(m_sAbrev);
	sCanonicalADCTLName += "ad.ctl";

	if(m_sAdctlFileName.GetLength()==0)
	{
		sPath += m_sAbrev;
		sPath += "ad.ctl";
	}
	else
		sPath += m_sAdctlFileName;

	return sPath;
}

void CModelFilesSet::writeToStream(ostream& sout)
{
	//if(m_sDictFilesDirectory.GetLength())
	//	sout << "\\DIRdict " << m_sDictFilesDirectory << "\n";

	if(	!m_bUseUnified)
	{
		if(!m_pathPrefixDict.IsEmpty())
		{
			sout << "\\DICTpfx " << m_pathPrefixDict << "\n";
		}
		if(!m_pathSuffixDict.IsEmpty())
		{
			sout << "\\DICTsfx " << m_pathSuffixDict << "\n";
		}
		if(!m_pathInfixDict.IsEmpty())
		{
			sout << "\\DICTifx " << m_pathInfixDict << "\n";
		}
	}

/*	if(m_sPrefixDictName.GetLength())
		sout << "\\DICTpfx " << m_sPrefixDictName << "\n";
	if(m_sInfixDictName.GetLength())
		sout << "\\DICTifx " << m_sInfixDictName << "\n";
	if(m_sSuffixDictName.GetLength())
		sout << "\\DICTsfx " << m_sSuffixDictName << "\n";
*/
	if(m_sAdctlFileDirectory.GetLength())
		sout << "\\DIRadctl " << m_sAdctlFileDirectory << "\n";
	if(m_sAdctlFileName.GetLength())
		sout << "\\adctl " << m_sAdctlFileName << "\n";

	// note that unified dicts names are found in this m_sRootDictNames
	if(!m_rootDicts.GetSize())	// added to try to find Terry's bug.
	{
		CString s;
		s.Format("Warning: there are no root or unified dictionaries currently listed for language %s.", m_sAbrev);
		AfxMessageBox(s);
	}
	for( int i=0; i< m_rootDicts.GetSize(); i++)
	{
		sout << "\\DICTRootOrUnified " ;
		CString s;
		m_rootDicts[i]->stringSerialize(s, TRUE);	// get a version that encodes enabled/disabled state
		sout << s << "\n";
		if(-1==s.Find('\\'))
		{
			CString sMsg;
			sMsg.Format("CarlaStudio has lost the path leading up to the dictionary %s.  To fix this, go to the Language menu for %s, choose Properties, and Choose the 'Dicts' tab.  Please report this as a bug.", s, m_sAbrev);
			AfxMessageBox(sMsg);
		}
	}

	if(!m_pathDirAnalyzedANA.IsEmpty())
		sout << "\\OutputDirAnalyzedANA " << m_pathDirAnalyzedANA << "\n";
	if(!m_pathDirInterlinear.IsEmpty())
		sout << "\\OutputDirInterlinear " << m_pathDirInterlinear << "\n";
	if(!m_pathDirSynthesized.IsEmpty())
		sout << "\\OutputDirSynthesizedTexts " << m_pathDirSynthesized << "\n";
	if(!m_pathDirTransferedANA.IsEmpty())
		sout << "\\OutputDirTransferedANA " << m_pathDirTransferedANA << "\n";

}

BOOL CModelFilesSet::recognizeField(CString sMarker, CString sField)
{
	if(sMarker.Left(4) == "DICT")
	{
		// see if we need to convert from the  old style, where I only saved the directory once for
		// all dict files, forcing them all to be in one directory
		if(sField.GetLength()>0 && -1 == sField.FindOneOf("/\\"))
		{
			if(m_sDictFilesDirectory.IsEmpty())
				;//AfxMessageBox("Dict didn't have a directory.");
			else
			{
				CString s(m_sDictFilesDirectory);
				s+=sField;
				sField = s;
			}
		}
	}

	if(sMarker == "DIRdict")
	{
		m_sDictFilesDirectory = sField;
	}
	else if(sMarker == "DICTpfx")
	{
		m_pathPrefixDict= sField;
		m_bUseUnified = FALSE;
	}
	else if(sMarker == "DICTifx")
	{
		m_pathInfixDict = sField;
		m_bUseUnified = FALSE;
	}
	else if(sMarker == "DICTsfx")
	{
		m_pathSuffixDict = sField;
		m_bUseUnified = FALSE;
	}
	else if(sMarker == "DICTRootOrUnified")
	{
		if(sField.IsEmpty())
		{
			CString s;
			s.Format("Report this error: when reading DictRootOrUnified field, the path to the dict was empty. Go to the Language menu for language %s, choose the Properties item, and check that all your dictionaries are there.", m_sAbrev);
			AfxMessageBox(s);
		}
		else
		{
			CPathDescriptor* pd = new CPathDescriptor;
			pd->stringSerialize(sField, FALSE);	// read a version that encodes enabled/disabled state
			m_rootDicts.add(pd);
		}

		if(-1==sField.Find('\\'))
		{
			CString s;
			s.Format("CarlaStudio has lost the path leading up to the dictionary %s.  To fix this, go to the Language menu for %s, choose Properties, and Choose the 'Dicts' tab.  Please report this as a bug.", sField, m_sAbrev);
			AfxMessageBox(s);
		}

	}
	else if(sMarker == "DIRadctl")
	{
		m_sAdctlFileDirectory = sField;
	}
	else if(sMarker == "adctl")
	{
		m_sAdctlFileName = sField;
	}
	else if(sMarker == "OutputDirAnalyzedANA")
	{
		m_pathDirAnalyzedANA = sField;
	}
	else if(sMarker == "OutputDirInterlinear")
	{
		m_pathDirInterlinear = sField;
	}
	else if(sMarker == "OutputDirSynthesizedTexts")
	{
		m_pathDirSynthesized = sField;
	}
	else if(sMarker == "OutputDirTransferedANA")
	{
		m_pathDirTransferedANA = sField;
	}
	else return FALSE;

	return TRUE; // was recognized
}

CString CModelFilesSet::getPhonrulePath() const
{
	ASSERTX(m_sAbrev.GetLength());
	return m_sCtrlFilesDirectory + m_sAbrev + "phon.rul";
}

CString CModelFilesSet::getIntxFileFullName() const
{
	ASSERTX(m_sAbrev.GetLength());
	return m_sAbrev + "intx.ctl";
}

CString CModelFilesSet::getIntxShortPath() const
{
	char shortPath[1000];
	CString temp(m_sCtrlFilesDirectory);
	temp += getIntxFileFullName();
	VERIFY(1000 > GetShortPathName( temp, shortPath, 1000));
	return CString(shortPath);
}

CString CModelFilesSet::getIntxFullPath() const
{
	CString temp(m_sCtrlFilesDirectory);
	temp += getIntxFileFullName();
	return temp;
}

CPathDescriptor* CModelFilesSet::getRootDictPath(int i) const
{
	ASSERTX(i < m_rootDicts.GetSize());
	return m_rootDicts.m_paths.GetAt(i);//->getFullPath();
	/*	CString sLongPath(getDictFilesDirectory());
	sLongPath+= m_rootDicts[i];
	return sLongPath;
*/}


// returns the path compressed into 8.3 format called a "short path"
// Exceptions: throws an error CString if the file is not found
CString CModelFilesSet::getRootDictShortPath(int i) const
{
	return m_rootDicts.m_paths[i]->getShortPath();
/*	CString sLongPath(getDictFilesDirectory());
	sLongPath+= m_sRootDictNames[i];
	char shortPath[1000];
	int result = GetShortPathName( sLongPath, shortPath, 1000);
	if(result == 0) // failed
	{
		WIN32_FIND_DATA fileInfo;
		if(INVALID_HANDLE_VALUE == FindFirstFile(sLongPath, &fileInfo))
		{
			CString x("File not found: ");
			x+=sLongPath;
			throw(x);
			//AfxMessageBox( x, MB_OK | MB_ICONEXCLAMATION);
		}
	}
	VERIFY(1000 > result);	// buffer not big enough
	return shortPath;
*/
}

#ifndef hab17a1
CString CModelFilesSet::getSentransTransferPath(LPCTSTR lpszSourceAbrev, LPCTSTR lpszTargetAbrev) const
{
								// flipped target and source languages here so
								// we can write the file in the target lang's
								// file directory
		CString sPath(m_sCtrlFilesDirectory);

	fixDirectory(sPath);

	ASSERTX(lpszSourceAbrev);
	sPath += lpszSourceAbrev;
	ASSERTX(lpszTargetAbrev);
	sPath += lpszTargetAbrev;
	sPath += "tr.sen";

	return sPath;
#else // hab17a1
CString CModelFilesSet::getSentransTransferPath(LPCTSTR lpszTargetAbrev) const
{
/*	CString sPath(m_sCtrlFilesDirectory);

	fixDirectory(sPath);

	ASSERTX(m_sAbrev.GetLength());
	sPath += m_sAbrev;
	ASSERTX(lpszTargetAbrev);
	sPath += lpszTargetAbrev;
	sPath += "tr.sen";

	return sPath;
*/	CString s(lpszTargetAbrev);
	s+="tr.sen";
	return getCtrlFilePath(s);
#endif // hab17a1
}


#ifndef hab17a1
CString CModelFilesSet::getStampTransferPath(LPCTSTR lpszSourceAbrev, LPCTSTR lpszTargetAbrev) const
{
								// flipped target and source languages here so
								// we can write the file in the target lang's
								// file directory
		CString sPath(m_sCtrlFilesDirectory);

	fixDirectory(sPath);

	ASSERTX(lpszSourceAbrev);
	sPath += lpszSourceAbrev;
	ASSERTX(lpszTargetAbrev);
	sPath += lpszTargetAbrev;
	sPath += "tr.chg";

	return sPath;
#else // hab17a1
CString CModelFilesSet::getStampTransferPath(LPCTSTR lpszTargetAbrev) const
{
/*	CString sPath(m_sCtrlFilesDirectory);

	fixDirectory(sPath);

	ASSERTX(m_sAbrev.GetLength());
	sPath += m_sAbrev;
	ASSERTX(lpszTargetAbrev);
	sPath += lpszTargetAbrev;
	sPath += "tr.chg";

	return sPath;
*/
	CString s(lpszTargetAbrev);
	s+="tr.chg";
	return getCtrlFilePath(s);
#endif // hab17a1
}


CString CModelFilesSet::getStampSynthPath() const
{
	return getCtrlFilePath("synt.chg");
}

CString CModelFilesSet::getCtrlFileName(LPCTSTR lpszSuffix) const
{
	ASSERTX(m_sAbrev.GetLength());
	CString s(m_sAbrev);
	s += lpszSuffix;
	return s;
}

CString CModelFilesSet::getShortCtrlFilePath(LPCTSTR lpszSuffix)
{
	CString temp(m_sCtrlFilesDirectory);
	temp += getCtrlFileName(lpszSuffix);
	return shortenPath(temp);
}

// WARNING: this won't work if the file doesn't exist
CString shortenPath(LPCTSTR lpszPath)
{
	if( _access(lpszPath, 0))// ask for existence only
	{
		ASSERTX(FALSE);
		return CString(lpszPath);	// at least this is better than returning junk
	}
	char shortPath[1000];
	ASSERTX(1000 > GetShortPathName( lpszPath, shortPath, 1000));
	return CString(shortPath);
}
/*
// this is called before and after the CPageDictionaries
// property page is shown in the new-lang-from-files wizard
void CModelFilesSet::exchangeWithAnalysisPage(CPageAnalysisFiles* pPage, BOOL bWrite)
{
}

// this is called before and after the CPageDictionaries
// property page is shown in the new-lang-from-files wizard
void CModelFilesSet::exchangeWithTransferPage(CPageTransferFiles* pPage, BOOL bWrite)
{
}

// this is called before and after the CPageDictionaries
// property page is shown in the new-lang-from-files wizard
void CModelFilesSet::exchangeWithSynthesisPage(CPageSynthesisFiles* pPage, BOOL bWrite)
{
}
*/
// this is called before and after the CPageDictionaries
// property page is shown,
// ( 1: when the settings prop page is up and
//	2: when the new from files wizard is shown)
//DEL void CModelFilesSet::exchangeWithDictPage(CPageDictionaries * pPage, BOOL bWrite)
//DEL {
//DEL 	if(bWrite)
//DEL 	{
//DEL /*		if(m_sPrefixDictName.IsEmpty())
//DEL 			pPage->m_sPrefixPath = m_sDictFilesDirectory + m_sPrefixDictName;
//DEL 		if(m_sInfixDictName.IsEmpty())
//DEL 			pPage->m_sInfixPath = m_sDictFilesDirectory + m_sInfixDictName;
//DEL 		if(m_sSuffixDictName.IsEmpty())
//DEL 			pPage->m_sSuffixPath = m_sDictFilesDirectory + m_sSuffixDictName;
//DEL */
//DEL 			pPage->m_sPrefixPath =  m_pathPrefixDict.getFullPath();
//DEL 			pPage->m_sInfixPath =  m_pathInfixDict.getFullPath();
//DEL 			pPage->m_sSuffixPath = m_pathSuffixDict.getFullPath();
//DEL
//DEL 		// the creator of the dict page is responsible for giving it our m_rootDicts
//DEL 		// in its constructor, so we don't have to do anything on that
//DEL
//DEL /*		int max = m_sRootDictNames.GetSize();
//DEL 		if(max > 0)
//DEL 			pPage->m_sRoot1Path = m_sDictFilesDirectory + m_sRootDictNames[0];
//DEL 		if(max > 1)
//DEL 			pPage->m_sRoot2Path = m_sDictFilesDirectory + m_sRootDictNames[1];
//DEL 		if(max > 2)
//DEL 			pPage->m_sRoot3Path = m_sDictFilesDirectory + m_sRootDictNames[2];
//DEL 		if(max > 3)
//DEL 			pPage->m_sRoot4Path = m_sDictFilesDirectory + m_sRootDictNames[3];
//DEL 		if(max > 4)
//DEL 			pPage->m_sRoot5Path = m_sDictFilesDirectory + m_sRootDictNames[4];
//DEL */
//DEL
//DEL
//DEL 	}
//DEL 	else	// we're reading the results of the dialog
//DEL 	{
//DEL 	// Assumption(unchecked): if m_bCopyDicts is FALSE, all dict files are in the same directory
//DEL
//DEL 		//m_sDictFilesDirectory = ::getDirectory(pPage->m_sRoot1Path);
//DEL
//DEL 		m_pathPrefixDict =  ::getFullFileName(pPage->m_sPrefixPath);
//DEL 		m_pathInfixDict = ::getFullFileName(pPage->m_sInfixPath);
//DEL 		m_pathSuffixDict = ::getFullFileName(pPage->m_sSuffixPath);
//DEL
//DEL 		// our root and unified list now goes directly to the page as a CFileList
//DEL
//DEL /*		m_sRootDictNames.RemoveAll();
//DEL 		if(pPage->m_sRoot1Path.GetLength())
//DEL 			 m_sRootDictNames.Add(::getFullFileName(pPage->m_sRoot1Path));
//DEL 		if(pPage->m_sRoot2Path.GetLength())
//DEL 			 m_sRootDictNames.Add(::getFullFileName(pPage->m_sRoot2Path));
//DEL 		if(pPage->m_sRoot3Path.GetLength())
//DEL 			 m_sRootDictNames.Add(::getFullFileName(pPage->m_sRoot3Path));
//DEL 		if(pPage->m_sRoot4Path.GetLength())
//DEL 			 m_sRootDictNames.Add(::getFullFileName(pPage->m_sRoot4Path));
//DEL 		if(pPage->m_sRoot5Path.GetLength())
//DEL 			 m_sRootDictNames.Add(::getFullFileName(pPage->m_sRoot5Path));
//DEL */
//DEL
//DEL 		// the user told us to copy the files to our control files dir.
//DEL 		// this may be disabled except during the initial creation of the lang
//DEL //THIS FEATURE REMOVED DEC 14-98
//DEL /*		if(pPage->m_bCopyDicts)
//DEL 		{
//DEL 			copyFileToCtrlDir(pPage->m_sPrefixPath);
//DEL 			copyFileToCtrlDir(pPage->m_sInfixPath );
//DEL 			copyFileToCtrlDir(pPage->m_sSuffixPath);
//DEL
//DEL 			copyFileToCtrlDir(pPage->m_sRoot1Path);
//DEL 			copyFileToCtrlDir(pPage->m_sRoot2Path);
//DEL 			copyFileToCtrlDir(pPage->m_sRoot3Path);
//DEL 			copyFileToCtrlDir(pPage->m_sRoot4Path);
//DEL 			copyFileToCtrlDir(pPage->m_sRoot5Path);
//DEL 		}
//DEL */	}
//DEL
//DEL }

// Parameters: sFromPath the full path to file to be copied
//				sToDir the directory to copy the file to
void CModelFilesSet::copyFileToCtrlDir(CString & sFromPath)
{
	if(0==sFromPath.GetLength())
		return;	// user didn't specify one, that's ok

	ASSERTX(getCtrlFilesDirectory().GetLength());
	CString sToPath(getCtrlFilesDirectory());
	sToPath += getFullFileName(sFromPath);
	if(!CopyFile(LPCTSTR(sFromPath), LPCTSTR(sToPath), FALSE))
	{	CString s("Couldn't copy the file:");
		s += sFromPath;
		s += " to ";
		s += sToPath;
		MessageBox( NULL, s, NULL, MB_OK | MB_ICONEXCLAMATION);
	}
}


// Currently, this is based on whether there are any affix dicts specified
 BOOL CModelFilesSet::getUsingUnifiedDicts() const
 {
 // to do: use m_bUseUnified
	return m_bUseUnified;

	//return (	m_pathPrefixDict.IsEmpty()
	//		&&	m_pathInfixDict.IsEmpty()
	//		&&	m_pathSuffixDict.IsEmpty()	);
 }

CFileList* CModelFilesSet::getRootDicList()
{
	return &m_rootDicts;
}

const CPathDescriptor& CModelFilesSet::getPrefixDictPathD()
{
	return m_pathPrefixDict;
}

const CPathDescriptor& CModelFilesSet::getSuffixDictPathD()
{
	return m_pathSuffixDict;
}

const CPathDescriptor& CModelFilesSet::getInfixDictPathD()
{
	return m_pathInfixDict;
}

void CModelFilesSet::setPrefixDictPath(const CString &sPath)
{
	m_pathPrefixDict = sPath;
}

void CModelFilesSet::setSuffixDictPath(const CString &sPath)
{
	m_pathSuffixDict = sPath;

}

void CModelFilesSet::setInfixDictPath(const CString &sPath)
{
	m_pathInfixDict = sPath;

}

// called before and after the propertyPage showing affix dictionaries
void CModelFilesSet::exchangeAffixDictPaths(CString &sPrefixPath, CString &sInfixPath, CString &sSuffixPath, BOOL bReadDialog)
{
	if(!bReadDialog)
	{
		sPrefixPath =  m_pathPrefixDict.getFullPath();
		sInfixPath =  m_pathInfixDict.getFullPath();
		sSuffixPath = m_pathSuffixDict.getFullPath();
	}
	else	// we're reading the results of the dialog
	{
		m_pathPrefixDict =  sPrefixPath;
		m_pathInfixDict = sInfixPath;
		m_pathSuffixDict = sSuffixPath;
	}
}

void CModelFilesSet::setUnifiedDictMode(BOOL bUseUnified)
{
	m_bUseUnified = bUseUnified;
}

/////////////////////////////////////////////////////////////////
//	Set various output directories

void CModelFilesSet::setOutputDirSynthesizedText(CPathDescriptor *pDir)
{
	if(pDir)
		m_pathDirSynthesized = *pDir;
	else
		m_pathDirSynthesized = ""; // use default

}

void CModelFilesSet::setOutputDirAnalyzedANA(CPathDescriptor *pDir)
{
	if(pDir)
		m_pathDirAnalyzedANA = *pDir;
	else
		m_pathDirAnalyzedANA = ""; // use default

}

void CModelFilesSet::setOutputDirTransferedANA(CPathDescriptor *pDir)
{
	if(pDir)
		m_pathDirTransferedANA = *pDir;
	else
		m_pathDirTransferedANA = ""; // use default

}

void CModelFilesSet::setOutputDirInterlinear(CPathDescriptor *pDir)
{
	if(pDir)
		m_pathDirInterlinear = *pDir;
	else
		m_pathDirInterlinear = ""; // use default

}


// this default input dir has not been put into use yet, as of Dec 98
void CModelFilesSet::setDefaultInputDir(CPathDescriptor* pDir)
{
	if(pDir)
		m_pathDirDefaultInput = *pDir;
	else
		m_pathDirDefaultInput = ""; // use default
}

/////////////////////////////////////////////////////////////////
//	Get various output directories

CPathDescriptor CModelFilesSet::getOutputDirInterlinear(BOOL bDefaultIfEmpty/*=TRUE*/) const
{
	if(!bDefaultIfEmpty || !m_pathDirInterlinear.IsEmpty())
		return m_pathDirInterlinear;
	else
	{
		CString s = getParentDirectory(m_sCtrlFilesDirectory);
		s+=getAbrev() + " Interlinear Files\\";
		ensureDirExists(s);
		return  (s);
	}
}

CPathDescriptor CModelFilesSet::getOutputDirSynthesizedText(BOOL bDefaultIfEmpty/*=TRUE*/) const
{
	if(!bDefaultIfEmpty ||!m_pathDirSynthesized.IsEmpty())
		return m_pathDirSynthesized;
	else
	{
		CString s = getParentDirectory(m_sCtrlFilesDirectory);
		s+=getAbrev() + " Synthesized Files\\";
		ensureDirExists(s);
		return  (s);
	}

}

CPathDescriptor CModelFilesSet::getOutputDirAnalyzedANA(BOOL bDefaultIfEmpty/*=TRUE*/) const
{
	if(!bDefaultIfEmpty ||!m_pathDirAnalyzedANA.IsEmpty())
		return m_pathDirAnalyzedANA;
	else
	{
		CString s = getParentDirectory(m_sCtrlFilesDirectory);
		s+=getAbrev() + " Analyzed Files\\";
		ensureDirExists(s);
		return  (s);
	}
}

CPathDescriptor CModelFilesSet::getOutputDirTransferedANA(BOOL bDefaultIfEmpty/*=TRUE*/) const
{
	if(!bDefaultIfEmpty ||!m_pathDirTransferedANA.IsEmpty())
		return m_pathDirTransferedANA;
	else
	{
		CString s = getParentDirectory(m_sCtrlFilesDirectory);
		s+=getAbrev() + " Transfered Files\\";
		ensureDirExists(s);
		return  (s);
	}
}

// this default input dir has not been put into use yet, as of Dec 98
CPathDescriptor CModelFilesSet::getDefaultInputDir(BOOL bDefaultIfEmpty/*=TRUE*/) const
{
	if(!bDefaultIfEmpty || !m_pathDirDefaultInput.IsEmpty())
		return m_pathDirDefaultInput;
	else
	{
		// what's a good thing to return here?
		return getParentDirectory(m_sCtrlFilesDirectory);
	}
}

//jdh 3/14/2000
CPathDescArray* CModelFilesSet::getPreprocessedDictArray()
{
	return m_pPreprocessedDicts; // may be NULL
}


//jdh 3/14/2000
void CModelFilesSet::copyInPreprocessedDictArray(CPathDescArray* pDicts)
{
	ASSERTX(pDicts);
	deletePreprocessedDictArray();

	m_pPreprocessedDicts = new CPathDescArray(TRUE);
	for(int i=0; i< pDicts->GetSize(); i++)
	{
		CString s;
		s.Format("copyIn: %s\n",((*pDicts)[i])->getFullPath());
		TRACE(s);
		m_pPreprocessedDicts->Add(new CPathDescriptor(((*pDicts)[i])->getFullPath()));//LPCTSTR((*pDicts)[i])));
	}
}

void CModelFilesSet::deletePreprocessedDictArray()
{
	if (m_pPreprocessedDicts)
	{
/* now done by the destructory of the array itself
		for(int i=0; i< m_pPreprocessedDicts->GetSize(); i++)
			delete m_pPreprocessedDicts->operator[](i);
*/
		delete m_pPreprocessedDicts;
	}

	m_pPreprocessedDicts = 0;
}
