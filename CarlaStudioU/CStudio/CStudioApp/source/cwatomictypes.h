//       06-Dec-1999 hab Removed extra ctrl-Ms at end of lines.

#pragma once

#ifndef __AFXTEMPL_H__
#include <afxtempl.h>
#endif

#include <afxcoll.h>
//typedef enum CWINFONTSELECTOR {DEFAULTFont=0, SRCFont=1, TRGFont=4};

#include "iostream.h"
class CTextDisplayInfo;

// this is used for parameters that take a language but should
// be just the default (english or french) font

static const CTextDisplayInfo* kUserLanguage=NULL;
enum{kNoEnv=0, kMorphEnv, kStringEnv};

///////////////////////////////////////////////////////////////////
class CWAtomic : public CObject
{
public:
	virtual void OnSize(UINT nType, int cx, int cy);
	virtual void doUpdate();//CFont* pSrcFont, /*CFont* pTrgFont, */ CFont* pDEFAULTFont);
	CWAtomic(LPCTSTR pLabel);
	virtual int AddToView(int left,int top,  int labelWidth,
							CWnd* parent, UINT id) = 0;
	virtual void retrieveData() = 0;
protected:
	CString m_label;
	CStatic* m_pLabel_ctrl;
};

///////////////////////////////////////////////////////////////////

#define rde271b // just testing...

#ifndef rde271b
#include "RichEdit3.h"
#endif  // rde271b

class CWString : public CWAtomic
{
public:
	virtual void OnSize(UINT nType, int cx, int cy);
	CWString(LPCTSTR pLabel,
					char c,
					const CTextDisplayInfo* pTDI=kUserLanguage, /*CWINFONTSELECTOR iFontFlags = DEFAULTFont, */
					BOOL bScrolling=FALSE,
					int iHeight=40);
	CWString(LPCTSTR pLabel,
					LPCTSTR pStr = NULL,
					const CTextDisplayInfo* pTDI=kUserLanguage, /*CWINFONTSELECTOR iFontFlags = DEFAULTFont, */
					BOOL bScrolling=FALSE,
					int iHeight=40);

	virtual void doUpdate();//CFont* pSrcFont, CFont* pTrgFont, CFont* pDEFAULTFont);
	void appendData(CString& s, TCHAR bSeperator= '\n');
	~CWString();
//	CWString() {};

#ifndef rde270
	// add the ability to update the display (after we've massaged the user input to be more
	//  like what we expect (in this case, inserting spaces after adjacent punct symbols for
	//  Sentrans 'Sentence Punctuation').
	void setData(const CString& sStr, BOOL bUpdateEC = false);
#else   // rde270
	void setData(CString& sStr) {m_data = sStr; }
#endif  // rde270
	void setData(LPCTSTR lpszStr) {ASSERTX(lpszStr); m_data = lpszStr; }
	int AddToView(int left,int top,  int labelWidth, CWnd* parent, UINT id);
	virtual void retrieveData();
	CString getData() const {return m_data;}
	BOOL isEmpty() const;
	operator CString() {return getData();}

protected:
	BOOL getIsMultiLine();
	CRect m_editRect;
//	CWINFONTSELECTOR m_iFontFlags;
	DWORD m_windowFlags;
	BOOL m_bScrolling;
	int m_iMaxLength;
	int m_iHeight;
#ifndef rde271b
	CRichEdit* m_pEditCtrl;
#else   // rde271b
	CEdit* m_pEditCtrl;
#endif  // rde271b
	CString m_data;
	const CTextDisplayInfo* m_pTDI;
	virtual UINT EditWidth(int spaceLeft);
	virtual UINT EditHeight() {return m_iHeight;}
	virtual UINT MaxChars()	  {return 1024;}	// what should this be?

	friend ostream& operator <<( ostream& fout, const CWString& i );
};

///////////////////////////////////////////////////////////////////
//	To DO: add validation
class CWChar : public CWString
{
public:
	CWChar(LPCTSTR pLabel,
		char c, const CTextDisplayInfo* pTDI=kUserLanguage);
		//CWINFONTSELECTOR iFontFlags=DEFAULTFont);
	virtual void retrieveData();
	void setData(char cChar) {CWString::setData(CString(cChar==' '?NULL:cChar));}
	BOOL operator==(char c) const {if(isEmpty()) return FALSE; else return m_data[0]==c;}
	char operator=(char c) { setData(c); return c;}
	BOOL operator!=(char c) const {return !(*this==c);}
	operator char() {return getData();}

	BOOL isEmpty() const;
	char getData() const {return m_data.IsEmpty()?NULL:m_data[0];} // can be null either way
protected:
	virtual UINT EditWidth(int spaceLeft)  {return 20;}
	virtual UINT EditHeight() {return 20;}
	virtual UINT MaxChars()	  {return 1;}	// what should this be?
};

///////////////////////////////////////////////////////////////////
//	To DO: add validation
class CWInteger : public CWString
{
public:
	CWInteger(LPCTSTR pLabel, int iValue);
	virtual void retrieveData();
	void setData(int iValue);
	void operator=(int iValue) {setData(iValue);}
	BOOL operator>(int iValue) const {return m_iValue > iValue;}
	BOOL operator==(int iValue) const {return m_iValue == iValue;}
protected:
	enum {kMaxDigits=4};
	virtual UINT EditWidth(int spaceLeft)  {return 60;}
	virtual UINT EditHeight() {return 20;}
	virtual UINT MaxChars()	  {return 1;}	// what should this be?
	int m_iValue;

	friend ostream& operator <<( ostream& fout, const CWInteger& i ) {return fout << i.m_iValue;}

};
///////////////////////////////////////////////////////////////////
//	To DO: add validation, backslash insertion
class CWMarker : public CWString
{
public:
	CWMarker(LPCTSTR pLabel, LPCTSTR pStr=NULL);
protected:
	virtual UINT EditWidth(int spaceLeft)  {return 100;}
	virtual UINT EditHeight() {return 20;}
	virtual UINT MaxChars()	  {return 1;}	// what should this be?

};
///////////////////////////////////////////////////////////////////
class CWStatic : public CWAtomic
{
public:
	~CWStatic();
	CWStatic(LPCTSTR pLabel, DWORD dwFlags=NULL);
	int AddToView(int left,int top,  int labelWidth, CWnd* parent, UINT id);
	virtual void retrieveData(){};
	void setData( CString sLabel) {m_label = sLabel;};
	void setFlags( DWORD dwFlags) {m_dwFlags = dwFlags;};

protected:
	CStatic* m_pStaticCtrl;
	DWORD m_dwFlags;
};
///////////////////////////////////////////////////////////////////
/* couldn't figure out a quick easy way to *do* anything when a button is pressed
class CWHelpButton : public CWAtomic
{
public:
	~CWHelpButton();
	CWHelpButton(const char* pLabel, UINT idHelp, DWORD dwFlags=NULL);
	int AddToView(int left,int top,  int labelWidth, CWnd* parent, UINT id);
	virtual void retrieveData(){};
	void setData( CString sLabel) {m_label = sLabel;};
	void setFlags( DWORD dwFlags) {m_dwFlags = dwFlags;};

protected:
	CButton* m_pButton;
	UINT m_idHelp;
	DWORD m_dwFlags;
};
*/


///////////////////////////////////////////////////////////////////
class CWBool : public CWAtomic
{
public:
	BOOL isTrue() const;
	~CWBool();
	CWBool(LPCTSTR pLabel, BOOL bValue = FALSE);
	BOOL operator=(BOOL bValue) {setData(bValue); return bValue;}

	int AddToView(int left,int top,  int labelWidth, CWnd* parent, UINT id);
	virtual void retrieveData();
	void setData( BOOL bValue) {m_data = bValue;};
	operator BOOL() {return m_data;}

	BOOL m_data;

protected:
	CButton* m_pButtonCtrl;
};

///////////////////////////////////////////////////////////////////
class CWRadio : public CWAtomic
{
public:
	~CWRadio();
	enum {kMaxRadios = 4};
	CWRadio(int iWhichIsOn,
			LPCTSTR pLabel1,
			LPCTSTR pLabel2,
			LPCTSTR pLabel3=0,
			LPCTSTR pLabel4=0);
	CString *m_pLabel[kMaxRadios];

	BOOL operator==(unsigned int i) const {return m_data==i;}
	int AddToView(int left,int top,  int labelWidth, CWnd* parent, UINT id);
	virtual void retrieveData();
	void setData(int iWhichIsOn) {m_data = iWhichIsOn;};

	unsigned int m_data;	// which of the radio buttons is on

protected:
	CButton* m_pButtonCtrl[kMaxRadios];
	UINT addOneButton(unsigned int iWhich, int left,int top, CWnd* parent, UINT id);

};

///////////////////////////////////////////////////////////////////
class CWGroup : public CWAtomic
{
public:
	virtual  ~CWGroup();
//	~CWGroup();
	CWGroup(LPCTSTR pLabel);

	int AddToView(int left,int top,  int labelWidth, CWnd* parent, UINT id);
	virtual void OnSize(UINT nType, int cx, int cy);
	virtual void doUpdate();
	void Add(CWAtomic* p_item) {m_pItems.Add(p_item);}
	virtual void retrieveData();

protected:
	CButton* m_pGroupBox;
	CRect m_boxRect;
	CTypedPtrArray<CPtrArray, CWAtomic*> m_pItems;
};

const int kHorizontalLeading = 10;
