#pragma once
class CCarlaLanguage;
class CLangModelsDoc;
class SFMFile;
class ostream;
class CPageSrcTextProcessing;
class CPageAnaProcessing;

class CProcessingPrefs : public CObject
{
public:
	void setInputLang(CCarlaLanguage* pLang);
	DWORD m_dwFlags;
	void setGoal(int iGoal);
	// What does the user want to produce with this text document?
	enum {	kSourceAna,		// analysis and auto disambiguation
			kGlossedInterlinear, // perform sentrans "adjustment"
			kAutoSynthCheck,		 // analyze, synthesis, and compare
			kTargetANA,
			kTargetText,
			kPreprocessDicts};	// jdh 3/13/2000 added this one. Can't put it first without messing up existing user's prefs

	// processing flags
	enum { kOutputItxToSameDir=1,	// output to same dir as the input file
			kLeaveNonGoalsInTemp=2,
			kTrace=4// next is 4, then 8, etc.
		};

	// constructors & file i/o
	CProcessingPrefs(CCarlaLanguage *pInputLang=NULL,
								   CCarlaLanguage *pTargetLang=NULL,
								   int iGoal=kTargetText);
	CProcessingPrefs(SFMFile* f);
	CProcessingPrefs(CProcessingPrefs* pCopy);
	~CProcessingPrefs();
	void finishCreate();
	void writeToFile(ostream& fout) const;

	// accessors
	void setSrcLangDoc(CLangModelsDoc* pDoc);
	void setTarLangDoc(CLangModelsDoc* pDoc);
	void setSrcLang(CCarlaLanguage* pLang);
	void setTarLang(CCarlaLanguage* pLang);
	CLangModelsDoc* getSrcLangDoc() const ;
	CLangModelsDoc* getTarLangDoc() const ;

	CCarlaLanguage* getInputLang() const ;
	CCarlaLanguage* getSrcLang() const ;
	CCarlaLanguage* getTarLang() const ;
	int getGoal() const {return m_iGoal;}
	virtual BOOL getDoAnalysis() const = 0;
	BOOL getDoAutoSynth() const ;
	BOOL getDoInterlinearize() const {return m_iGoal==kGlossedInterlinear;}
	BOOL getDoTransfer() const ;
	BOOL getDoSynthesis() const ;
	int  getVerbosity()	const {return  m_iVerbosity;}

	// dialog i/o
	virtual void customizePropertySheet(CPropertySheet& dlg, BOOL bShowDefaultButton)=0;
	virtual void readPropertySheet(CPropertySheet& dlg)=0;
	virtual void propertySheetClosed(CPropertySheet& dlg)=0;


protected:
	// settings
	int m_iVerbosity;
	int m_iGoal;
	CCarlaLanguage* m_pTargetLang;
	CCarlaLanguage* m_pInputLang;
	CString m_sTempInputLangID;	// used to cache the id until finishCreate() is called
	CString m_sTempTargetLangID;	// used to cache the id until finishCreate() is called
	// FOR SOME BIZARRE REASON THE LINKER REFUSES TO SEE THE SRCTEXTPROCESSINGPREFS OVERRIDE OF THIS
		virtual CString getEndMarker() const =0;
	virtual CString getBeginMarker() const =0;
};


class CSrcTextProcessingPrefs : public CProcessingPrefs
{
public:
	static LPCTSTR BEGIN_MARKER() {return "+SrcProcessingPrefs";}
	CSrcTextProcessingPrefs(CCarlaLanguage *pInputLang=NULL,
								   CCarlaLanguage *pTargetLang=NULL,
								   int iGoal=kGlossedInterlinear)
								   :m_pProcPrefsPage(), CProcessingPrefs(pInputLang, pTargetLang, iGoal) {}
	CSrcTextProcessingPrefs(SFMFile* f) :m_pProcPrefsPage(NULL), CProcessingPrefs(f) {}
	CSrcTextProcessingPrefs(CProcessingPrefs* pCopy):m_pProcPrefsPage(NULL), CProcessingPrefs(pCopy) {}

	virtual void customizePropertySheet(CPropertySheet& dlg, BOOL bShowDefaultButton);
	virtual void readPropertySheet(CPropertySheet& dlg);
	virtual void propertySheetClosed(CPropertySheet& dlg);
protected:
	// !!!! if you add any params here that should be copied, need to override
	// the base-clase copy and file-reading members
	CPageSrcTextProcessing* m_pProcPrefsPage;
	virtual CString getEndMarker() const {return "-SrcProcessingPrefs";}
	virtual CString getBeginMarker() const {return BEGIN_MARKER();}

	virtual BOOL getDoAnalysis() const {return TRUE;}
};


class CAnaProcessingPrefs : public CProcessingPrefs
{
public:
	static LPCTSTR BEGIN_MARKER() {return "+AnaProcessingPrefs";}
	CAnaProcessingPrefs()	:m_pProcPrefsPage(NULL), CProcessingPrefs() {}
	CAnaProcessingPrefs(SFMFile* f) :m_pProcPrefsPage(NULL), CProcessingPrefs(f) {}
	CAnaProcessingPrefs(CProcessingPrefs* pCopy):m_pProcPrefsPage(NULL), CProcessingPrefs(pCopy) {}

	virtual void customizePropertySheet(CPropertySheet& dlg, BOOL bShowDefaultButton);
	virtual void readPropertySheet(CPropertySheet& dlg);
	virtual void propertySheetClosed(CPropertySheet& dlg);
protected:
	// !!!! if you add any params here that should be copied, need to override
	// the base-clase copy and file-reading members
	CPageAnaProcessing* m_pProcPrefsPage;
	virtual CString getEndMarker() const {return "-AnaProcessingPrefs";}
	virtual CString getBeginMarker() const {return BEGIN_MARKER();}

	virtual BOOL getDoAnalysis() const {return TRUE;}
};