//
// 1.7a1 09-Dec-1999 hab Move location of transfer files from source to target
//                       control file directory
// 2.1.2 14-Mar-2000 jdh Various additions to support using dictionary preprocessors w/ quickparse


#pragma once
#include "PathDescriptor.h"	// Added by ClassView

#include <fstream.h>

class CCarlaLanguage;
class CPageDictionaries;
class CPageAnalysisFiles;
class CPageTransferFiles;
class CPageSynthesisFiles;

CString shortenPath(LPCTSTR lpszPath);
#include "filelist.h"

class CModelFilesSet : public CObject
{
public:
	//void setPreprocessedDictList(CFileList* pDicts);
	CPathDescriptor getDefaultInputDir(BOOL bDefaultIfEmpty=TRUE) const;
	CPathDescriptor getOutputDirTransferedANA(BOOL bDefaultIfEmpty=TRUE) const;
	CPathDescriptor getOutputDirAnalyzedANA(BOOL bDefaultIfEmpty=TRUE) const;
	CPathDescriptor getOutputDirSynthesizedText(BOOL bDefaultIfEmpty=TRUE) const;
	CPathDescriptor getOutputDirInterlinear(BOOL bDefaultIfEmpty=TRUE) const;
	BOOL getUsingUnifiedDicts() const;
	void setDefaultInputDir(CPathDescriptor* pDir=NULL);
	void setOutputDirInterlinear(CPathDescriptor *pDir=NULL);
	void setOutputDirTransferedANA(CPathDescriptor *pDir=NULL);
	void setOutputDirAnalyzedANA(CPathDescriptor *pDir=NULL);
	void setOutputDirSynthesizedText(CPathDescriptor *pDir=NULL);
	void setUnifiedDictMode(BOOL bUseUnified);
	void exchangeAffixDictPaths(CString& sPrefixPath, CString& sInfixPath, CString& sSuffixPath, BOOL bRead);
	void setInfixDictPath(const CString& sPath);
	void setSuffixDictPath(const CString& sPath);
	void setPrefixDictPath(const CString& sPath);
	const CPathDescriptor& getInfixDictPathD();
	const CPathDescriptor& getSuffixDictPathD();
	const CPathDescriptor& getPrefixDictPathD();

	//int getPreprocessedDictCount() const; //jdh 3/13/2000
	//CPathDescriptor* getPreprocessedDict(int i);
//	CFileList* getPreprocessedDictList(); //jdh 3/13/2000
	CPathDescArray* getPreprocessedDictArray(); //jdh 3/13/2000
	void copyInPreprocessedDictArray(CPathDescArray*);//jdh 3/13/2000

	CFileList* getRootDicList();
	CModelFilesSet(LPCTSTR lpszAbrev);
	CModelFilesSet(const CModelFilesSet& modelFilesSet);	// copy contstuctor
	~CModelFilesSet();

	// Dialog I/O
//	void exchangeWithAnalysisPage(CPageAnalysisFiles* pPage, BOOL bWrite);
	//void exchangeWithTransferPage(CPageTransferFiles* pPage, BOOL bWrite);
	//void exchangeWithSynthesisPage(CPageSynthesisFiles* pPage, BOOL bWrite);

	// File I/O
	void writeToStream(ostream& sout);
	BOOL recognizeField(CString sMarker, CString sField);


	void setAbrev(LPCTSTR lpszAbrev) {m_sAbrev=lpszAbrev;}


	CString getShortCtrlFilePath(LPCTSTR lpszSuffix);
	CString getCtrlFileName(LPCTSTR lpszSuffix) const;
#ifndef hab17a1
	CString getSentransTransferPath(LPCTSTR lpszSourceAbrev, LPCTSTR lpszTargetAbrev) const;
	CString getStampTransferPath(LPCTSTR lpszSourceAbrev, LPCTSTR lpszTargetAbrev) const;
#else // hab17a1
	CString getSentransTransferPath(LPCTSTR lpszTargetAbrev) const;
	CString getStampTransferPath(LPCTSTR lpszTargetAbrev) const;
#endif // hab17a1
	CString getStampSynthPath() const;
	CString getADCtlPath() const;
	CString getCtrlFilePath(LPCTSTR lpszSuffix) const;
	int getRootDictCount() const {return m_rootDicts.GetSize();}
	CPathDescriptor* getRootDictPath(int i) const;
	CString getRootDictShortPath(int i) const;
	CString getIntxFullPath() const;
	CString getIntxShortPath() const;
	CString getIntxFileFullName() const;
	CString getPhonrulePath() const;

	CString getAbrev() const {ASSERTX(m_sAbrev.GetLength()); return m_sAbrev;}
	CString getCtrlFilesDirectory() const {return m_sCtrlFilesDirectory;}
	char	getCommentChar() const {return m_cCommentChar;}

	// these are secondary holders for processes so that they don't have to include
	// ccarlalanguage , CCodetable, etc.  They are set by
	CString m_sRecordMarker;
	CString m_sPropertyMarker;
	CString m_sCategoryMarker;
	BOOL m_bUseUnified; // for future use (not used as of alpha 2)
	char m_cCommentChar; // secondary holder of this info (commonModel is the real location)
						// here so that processes don't have to know about CCarlaLanguages

protected:
	CPathDescriptor m_pathDirDefaultInput;
	CPathDescriptor m_pathPrefixDict;
	CPathDescriptor m_pathSuffixDict;
	CPathDescriptor m_pathInfixDict;

	CPathDescriptor m_pathDirInterlinear;
	CPathDescriptor m_pathDirAnalyzedANA;
	CPathDescriptor m_pathDirSynthesized;
	CPathDescriptor m_pathDirTransferedANA;


	// to do: remove m_sAdctlFileName since we're now forcing adctl files
	//   to have canonical names and be unique between langs
	CString m_sAdctlFileName;	// can be different from <abrev>ad.ctl

	CFileList m_rootDicts;
	CPathDescArray *m_pPreprocessedDicts; // jdh 3/13/2000

	CString m_sAbrev;
	CString m_sDictFilesDirectory;
	CString m_sAdctlFileDirectory;
	CString m_sCtrlFilesDirectory;
	void copyFileToCtrlDir(CString & sFromPath);
	void CModelFilesSet::deletePreprocessedDictArray();

	friend CCarlaLanguage;
};
