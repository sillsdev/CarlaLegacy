// Change History
// 4/14/99 jdh moved some members from CWTextIn to CWCommonModel, as they are
//				needed for TextOut as well: m_cPrimaryFormatChar, m_cSecondaryFormatChar (actually not output to textout),
//				m_sWFC, m_WFCS
// 8/27/99 jdh added andy's punction class support
// 9/1/99 jdh writeFile() added bIncludeSCL parameter to support intergen-only version of outtxt.ctl (outit.ctl)
// 2.1.0 07-Mar-2000 hab Added string check characters

#ifndef __CWModel__
#define __CWModel__

#include "CWAtomicTypes.h"
#include "CWList.h"
#include "Monad.h"

#define DEFAULT_AMBIG_CHAR '%'
#define DEFAULT_DECOMP_SEP_CHAR '-'

class CTextDisplayInfo;
class CWModel : public CObject
{
public:
	DECLARE_DYNAMIC(CWModel);
	CWModel(const char *pLabel) : m_bModified(FALSE), m_sLabel(pLabel) {};
	void setModifiedFlag(BOOL bFlag = TRUE) {m_bModified=bFlag;}
	BOOL getModified() const {return m_bModified;}
protected:
	CString m_sLabel;	// UNNEEDED!!
	BOOL m_bModified;	// used to determine whether we need to be written out to disk
};

class CPageFinalCatTest;

class CWCommonModel : public CWModel
{
public:
	CWCommonModel(CTextDisplayInfo* pTDI);
	void readWizPages(CPageFinalCatTest* pPageFinalCatTest);

	//CWString categories, morphemeProperties, allomorphProperties;
	CWMonadList m_categories, m_morphemeProperties, m_allomorphProperties;

	CWClassList morphemeClasses;
	CWClassList categoryClasses;
	CWClassList stringClasses;

	CWClassList punctuationClasses;	/* 1.06 hab added */

	CWChar m_cCommentChar;
	CWChar m_cDecompSepChar; //\dsc
	CWChar m_cAmbigDelimiter;
#ifndef hab210
	CWString m_sStringCheck;	//\strcheck
#endif //hab210
	CWString m_sLUWFC;	//luwfc
	CWString m_sLUWFCS;	//luwfcs multibyte
	CWChar m_cPrimaryFormatChar, m_cSecondaryFormatChar;
	CWString m_sWFC;	//wfc
	CWString m_sWFCS;	//wfcs multibyte
};



class CWTextOutModel : public CWModel
{
public:
	CWTextOutModel(const CTextDisplayInfo *pTDI);

	BOOL loadFromFile(LPCTSTR lpszPathName, CWCommonModel& common, BOOL bLogIfMissing);
	BOOL writeFile(CString & sPath, CWCommonModel& commonModel, BOOL bIncludeSCL/* for intergen-specific version*/);

	CWOrthoChangeList	m_orthoChanges;
};


class CWDictOrthoModel : public CWModel
{
public:
	BOOL getInUse() const;
	CWDictOrthoModel(const CTextDisplayInfo *pTDI);

	BOOL loadFromFile(LPCTSTR lpszPathName, CWCommonModel& common, BOOL bLogIfMissing);
	BOOL writeFile(CString & sPath, CWCommonModel& commonModel);

	CWOrthoChangeList	m_orthoChanges;
};

/*class CWm_orthoChangesModel : public CWModel
{
public:
	BOOL loadFromFile(LPCTSTR lpszPathName);
	CWOrthoChangeList	m_orthoChanges;
	// the file also has string classes
};
*/

#endif
