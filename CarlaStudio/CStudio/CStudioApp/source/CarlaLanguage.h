// jdh 11/9/99 added m_wDisplayFlags
//     02-Dec-1999 hab removed ctrl-Ms at end of lines
// 1.7a1 07-Dec-1999 hab Added use of interlinear and stamp dict code tables.

#pragma once

#include <fstream.h>
#include "CWAmpleModels.h"
#include "ModelFilesSet.h"
#include "SentransModel.h"
#include "StampModel.h"
#include "PhonruleModel.h"

#include "TextDisplayInfo.h"
#include "CodeTable.h"

class CWizNewFromFiles;
//class CProcessSequence;
class CAnalysisProcessSequence;
class CSynthesisProcessSequence;
class CLangModelsDoc;
class CTransferProcessSequence;
class CCarlaLanguage;
class SFMFile;
class CTransferModelSet;
class CInterlinearProcessSequence;
class CAmpleDLLWrapper;
class CPageLangDisplay;

class CCarlaLanguage : public CObject
{
public:
	enum DisplayFlags {kLocateTransferWithTarget = 1};

	void removeRefsToLanguage(CCarlaLanguage* pLang);
	//DWORD m_dwOutputFlags;
	//BOOL m_bLeaveNonGoalsInTempDir;
	//BOOL m_bCopyInterlinearToSrcDir;
	void readLangDisplayPage(CPageLangDisplay& pPage);
	CAmpleDLLWrapper* getAmpleDLLWrapper();
	void addDefaultListOfProcessors();
	BOOL OnEditInterlinearSeq();
	void prepareMFSForProcessors();
	void populateWithDefaults();
	BOOL getUsingDictOrtho() const;
	void updateInterface();	// jdh 11/9/99
	void setLanguagePath(LPCTSTR lpszProjectDir);
	CModelFilesSet* getMFS();
	void notifyLanguageAddedToProject(CCarlaLanguage* pLang);
	void finishCreate();
	void setConversionTargetLang(CCarlaLanguage* pTargetLang);
	void loadTransferControlFiles(CCarlaLanguage* pTargetLang);
	CTransferModelSet* addTransferSet(CCarlaLanguage* pTargetLang);
//	void importTransferSet(CCarlaLanguage* pTargetLang);
	CLangModelsDoc* getLangDoc();
	void setFont(LOGFONT* pLogFont);
	CString m_sDirContainingCarlaSet;
	BOOL OnEditAnalysisSeq();
	BOOL OnEditSynthesisSeq();
	BOOL OnEditTransferSequence(int iSeq);
	 ~CCarlaLanguage();
	BOOL OnEditProperties(BOOL bProjectCreation);
	void setName(LPCSTR lpszName) {m_sName = lpszName;}
	void setAbrev(LPCSTR lpszAbrev);
	char getCommentChar();
	BOOL writeControlFiles();
	CCarlaLanguage(CLangModelsDoc *pDoc, LPCTSTR lpszAbrev=NULL);

	BOOL notifyIfNotConsistent();
	BOOL loadControlFiles(BOOL bFirstLoadAfterCarlaMenuImport=FALSE, BOOL bFirstLoadAfterFilesImport=FALSE);
	BOOL readCARLAMenuLangFile(char cCommentChar);//LPCTSTR lpszDirOfCMenuLang);
	BOOL save(LPCTSTR lpszProjectDirectory);
	BOOL open(LPCTSTR lpszPathName);

	CFont* getFont() const {return m_displayInfo.getFont();}
	const CTextDisplayInfo* getDisplayInfo() const {return &m_displayInfo;}
	const CTextDisplayInfo& getDisplayInfoRef() const {return m_displayInfo;}
	CString getName() const {return m_sName;}
	BOOL getHavePrefixes() const;
	BOOL getHaveInfixes() const;
	BOOL getHaveSuffixes() const;
	CString getConsistencyMsg();
//	BOOL getUsingUnifiedDicts();
	CTypedPtrArray<CPtrArray, CTransferModelSet*>& getTransferModels() {return m_pTransferModelSets;}

	CModelFilesSet* getCopyOfModelFilesSet();	// called by CProcessSequence

	CString getUniqueID();
	CString getLanguageDirectory(LPCTSTR lpszProjectDirectory, BOOL okToCreate = TRUE);
	CString getAbrev() {return m_sAbrev;}

	CAnalysisProcessSequence* getAnalysisSequence() { return m_pAnalysisSequence; }
	CTransferProcessSequence* getTransferSequence(CCarlaLanguage* pTarget);

	CSynthesisProcessSequence* getSynthesisSequence() { return m_pSynthesisSequence; }
	CInterlinearProcessSequence* getInterlinearSequence() { return m_pInterlinearSequence; }
	CWCommonModel& getCommonModel() { return m_commonModel; }
	CWAnalysisModel& getAnalysisModel() { return m_analysisModel; }
	CSentransDisambigModel& getSentransDisambigModel() {return m_sentransDisambigModel; }
	CSentransTransferModel& getSentransGlossAdjustmentModel() {return m_sentransGlossAdjustmentModel; }

	// JDH 6/2/99Add Sentrans Adjust Rules Set for analysis
	CSentransTransferModel& getSentransAnaAdjustmentModel() {return m_sentransAnaAdjustmentModel; }

	CWTextInModel& getTextInModel() { return m_textInModel; }
	CWTextOutModel& getTextOutModel() { return m_textOutModel;}
	CPhonruleModel& getPhonruleModel() { return m_phonruleModel; }
	CWDictOrthoModel& getDictOrthoModel() {return m_dictOrthoModel;}
	CStampSynthesisModel& getStampSynthesisModel() {return m_stampSynthesisModel;}
	//	CWJoinCompModel& getJoinCompModel() { return m_joinCompModel;}
	CWCodeTable& getCodeTable() { return m_codeTable;}
#ifndef hab17a1
	CWCodeTable& getInterCodeTable() { return m_interCodeTable;}
	CWCodeTable& getSynthCodeTable() { return m_synthCodeTable;}
#endif //hab17a1

	CString getFilePath(LPCTSTR lpszPath=NULL);

	CWizNewFromFiles* m_pFilesWiz;
	CProjectDoc* getProject();
	DWORD m_wDisplayFlags; // jdh 11/9/99

protected:
	CAmpleDLLWrapper* m_pAmpleDLLWrapper;
	CLangModelsDoc* m_pDoc;
	//CFont m_font;
	CTextDisplayInfo m_displayInfo;

	void copyFile(CString& sFromDir, CString& sToDir,
					CString& sFileName, LPCTSTR lpszToFileName=NULL);
	void copyFile(CString& sFromPath, CString& sToDir);
	CString m_sName;
	CWCommonModel m_commonModel;
	CWTextInModel m_textInModel;
	CWTextOutModel m_textOutModel;
	CWDictOrthoModel m_dictOrthoModel;
	CPhonruleModel m_phonruleModel;
	CWCodeTable m_codeTable;
#ifndef hab17a1
	CWCodeTable m_interCodeTable;
	CWCodeTable m_synthCodeTable;
#endif // hab17a1
	CWAnalysisModel m_analysisModel;
	CSentransDisambigModel m_sentransDisambigModel;
	// this is availible for use when doing glossing
	CSentransTransferModel m_sentransGlossAdjustmentModel;
	// this is availible for use when doing analysis (for steve white)
	CSentransTransferModel m_sentransAnaAdjustmentModel;

	CStampSynthesisModel m_stampSynthesisModel;
	CTypedPtrArray<CPtrArray, CTransferModelSet*> m_pTransferModelSets;

	// these are only used during import into CARLAStudio
	CString m_sTempConvertFromDirectory;
	CCarlaLanguage* m_pTempConversionTargetLang;

	CModelFilesSet m_mfs;
	CString m_sAbrev;

	CInterlinearProcessSequence* m_pInterlinearSequence;
	CAnalysisProcessSequence* m_pAnalysisSequence;
	CSynthesisProcessSequence* m_pSynthesisSequence;
	CTypedPtrArray<CPtrArray, CTransferProcessSequence*> m_pTransferSequences;


	void copyCtrlFile(LPCTSTR lpszDir, LPCTSTR lpszSuffix);
#ifndef hab17a1
	void copyCtrlFile(LPCTSTR lpszDir, LPCTSTR lpszFromSuffix, LPCTSTR lpszToSuffix);
#endif // hab17a1
	void convertFromFiles();
	void convertFromCarla();
//	void writeFont(ofstream& fout, CFont &rFont);
//	void readFont(CFont &rFont, CString& sField);
};
