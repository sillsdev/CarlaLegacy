#pragma once

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

class CTextDisplayInfo;
class SFMFile;
class CProcess;
class ostream;
class CCarlaLanguage;
#include <afxtempl.h>

class CResultStreamDescriptor : public CObject
{
	public:
		 CResultStreamDescriptor(CProcess* pProc);
		CString getProcessDisplayName();
		CString getDetailsText();
		CString getListDisplayString();
		BOOL m_bShow;
		static CString getBeginMarker() {return "+OutputStreamDescriptor";}
		static CString getEndMarker() {return "-OutputStreamDescriptor";}
		CResultStreamDescriptor();
		 CResultStreamDescriptor(SFMFile* f);
		 CResultStreamDescriptor(CResultStreamDescriptor& rCopy)
			:	m_sProcessID(rCopy.m_sProcessID),
				m_sShortDescription(rCopy.m_sShortDescription),
				m_sLongDescription(rCopy.m_sLongDescription),
				m_sTabLabel(rCopy.m_sTabLabel),
				m_bShow(rCopy.m_bShow)
				{};

		DECLARE_DYNAMIC(CResultStreamDescriptor);
		bool operator=( const CResultStreamDescriptor& b);
//		virtual void addItemToListControl(CListCtrl & clc, const CProcessSequence* pSeq);
		CResultStreamDescriptor(CProcess* pProducer,
								LPCTSTR sShortDesc,
								LPCTSTR sLongDescription=NULL,
								LPCTSTR sTabLabel=NULL);
		CString getTabLabel() const ;
		CString getLongDescription() const {return m_sLongDescription.GetLength()?m_sLongDescription:getShortDescription();}
		CString getShortDescription() const {return m_sShortDescription;}
		CString getProcessID() const {return m_sProcessID;}

	friend ostream& operator <<( ostream& fout, const CResultStreamDescriptor& rRSD );
	friend bool operator==(CResultStreamDescriptor& a, CResultStreamDescriptor&b);
	protected:
		CString m_sProcessID;			// id of the process that generated it
		CString m_sShortDescription;
		CString m_sLongDescription;
		CString m_sTabLabel; // Can be include run-specific information
};
typedef CArray<CResultStreamDescriptor, CResultStreamDescriptor&> CResultDescriptorArray;

class CResultStream : public CObject
{
	public:
		DECLARE_DYNAMIC(CResultStream);
		virtual CString getToolTipText();
		const CTextDisplayInfo* getDisplayInfo() const;
		virtual void closeOutFile() =0;
		void setLang(CCarlaLanguage* pLang);
		virtual CFont* getFont();
		 ~CResultStream();
		 // a null language means use the default font (example: log outpus won't have a lang)
		CResultStream(CResultStreamDescriptor* pDescriptor,
						CCarlaLanguage* pLang=NULL,
						int eTabIcon=kNoIcon)
				:	m_pDescriptor(pDescriptor),
					m_pLang(pLang),
					m_eTabIcon(eTabIcon) {};
		virtual EDITSTREAM getEditStreamIn() = 0; //{return m_editStream;}
		virtual EDITSTREAM getEditStreamOut(LPCTSTR lpszPath) = 0;
		CResultStreamDescriptor* getDescriptor()
			{return m_pDescriptor;}

		virtual BOOL openExternally() {return FALSE;}
		virtual CString getOverflowMsg();
		enum{kUnknownStatus=-2, kNoIcon=-1, kErrorIcon=0, kWarningIcon};
		int getTabIconEnum() const;
	protected:
		int m_eTabIcon;
		CCarlaLanguage* m_pLang;
		EDITSTREAM m_editStream;
		CResultStreamDescriptor* m_pDescriptor;
};


class CResultStreamFile : public CResultStream
{
	public:
		long getFileSize();
		DECLARE_DYNAMIC(CResultStreamFile);
		virtual CString getToolTipText();
		void setPath(LPCTSTR lpszPath) {m_sPath=lpszPath;}
		CString getPath() {return m_sPath;}
		void closeOutFile();
		CResultStreamFile(CResultStreamDescriptor* pDescriptor,
						LPCTSTR lpszPath,
						CCarlaLanguage *pLang=NULL,
						int eTabIcon=kNoIcon);
		virtual EDITSTREAM getEditStreamIn();
		virtual EDITSTREAM getEditStreamOut(LPCTSTR lpszPath);

		static DWORD CALLBACK EditStreamInCallback(
			DWORD dwCookie, LPBYTE pbBuff, LONG cb, LONG FAR *pcb);
		static DWORD CALLBACK EditStreamOutCallback(
			DWORD dwCookie, LPBYTE pbBuff, LONG cb, LONG FAR *pcb);
		virtual BOOL openExternally();
		virtual CString getOverflowMsg();
	protected:
		CString m_sPath;
		HANDLE m_hFile;
};
