// TransferModelSet.h: interface for the CTransferModelSet class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_TRANSFERMODELSET_H__1624AE21_26E3_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_TRANSFERMODELSET_H__1624AE21_26E3_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#include "SentransModel.h"
#include "StampModel.h"

class CModelFilesSet;
class CWCommonModel;
class CCarlaLanguage;

// A CCarlaLanguage will have zero or more CTransferModelSets, one
// for each language that it has been setup to transfer to.
class CTransferModelSet : public CObject
{
	public:
		CStampTransferModel* getStampTransferModel();
//		void importCarlaMenu(CModelFilesSet* pMFS);
		void loadControlFiles(CModelFilesSet* pMFS, CWCommonModel& commonModel);
		BOOL writeControlFiles(CModelFilesSet* pMFS, CWCommonModel& rCommonModel);
		CTransferModelSet(const CTextDisplayInfo* pSrcTDI, CCarlaLanguage *pTargetLang)
				: m_pTargetLang(pTargetLang),
				m_sentransTransferModel(pSrcTDI),
				m_stampTransferModel(pSrcTDI) {}
		//CTransferModelSet(SFMFile* f);
	virtual ~CTransferModelSet();
		//void write(ostream& fout) const;
		CCarlaLanguage* getTargetLang() {ASSERTX(m_pTargetLang); return m_pTargetLang;}
		CSentransTransferModel& getSentransTransferModel() {return m_sentransTransferModel;}
	protected:
		CCarlaLanguage* m_pTargetLang;
		CSentransTransferModel m_sentransTransferModel;
		CStampTransferModel m_stampTransferModel;
};
#endif // !defined(AFX_TRANSFERMODELSET_H__1624AE21_26E3_11D2_A09E_E12649467D2F__INCLUDED_)
