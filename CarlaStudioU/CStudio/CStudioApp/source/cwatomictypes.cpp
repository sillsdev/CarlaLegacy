///////
// 1.7a1 06-Dec-1999 hab Remove extra ctrl-Ms at end of lines

#include "stdafx.h"
#include "CWAtomicTypes.h"
#include "../resource.h"
#include "TextDisplayInfo.h"
#include "ParseStream.h"
#include "FormButton.h"

const UINT kSpaceBetweenLabelAndEdit = 10;

const int kAtomicControlBasicHeight = 20;
const int kHorizBorderWidth = 15;

const int kMaxWidthFIXME = 400;

//CTextDisplayInfo* gpTDI=0;		/// &&&&&&&&&for a test


CWAtomic::CWAtomic(LPCTSTR pLabel): m_label(pLabel), m_pLabel_ctrl(NULL)
{
};

///////////////////////////////////////////////////////////////////////////////////////
 UINT CWString::EditWidth(int spaceLeft)
 {
	return spaceLeft;
 }


CWString::CWString(LPCTSTR pLabel, char c,
				   const CTextDisplayInfo* pTDI,
				 //CWINFONTSELECTOR iFontFlags,
				 BOOL bScrolling, int iHeight)
	: m_data(c==' '?NULL:c), // don't stick a space in there; too hard for the user to see.  Better to leave it empty
	CWAtomic(pLabel),
	m_pEditCtrl(NULL),
	m_bScrolling(bScrolling),
	m_iHeight(iHeight),
	m_windowFlags(NULL),
	m_pTDI(pTDI),
	//m_iFontFlags(iFontFlags),
	m_iMaxLength(1)	// just allow 1 character if this (character) constructor is used
{
};

CWString::CWString(LPCTSTR pLabel,
				   LPCTSTR pStr,
				   const CTextDisplayInfo* pTDI,
				   BOOL bScrolling, int iHeight)
	: m_data(pStr?pStr:_T("")),
	CWAtomic(pLabel),
	m_pEditCtrl(NULL),
	m_bScrolling(bScrolling),
	m_iHeight(iHeight),
	m_pTDI(pTDI),
	m_windowFlags(NULL),
	//m_iFontFlags(iFontFlags),
	m_iMaxLength(0)	// 0 mean maximum possible
{
};

void CWString::retrieveData()
{
	ASSERTX(m_pEditCtrl);
	m_pEditCtrl->GetWindowText(m_data);
}

// currently, the wierd thing about this function is that it will called more
// than once; it will be calle each time the topic that owns this is selected,
// and a new view must be generated.


int CWString::AddToView(int left,int top,  int labelWidth, CWnd* parent, UINT id)
{
	const int kLabelHeight = 20;

	// Setup the label
	CRect labelRect(left, top, left+labelWidth, top + kLabelHeight);
	if(m_pLabel_ctrl)
		delete m_pLabel_ctrl;
	m_pLabel_ctrl = new CStatic;
	m_pLabel_ctrl->Create( m_label + _T(":"), WS_CHILD | WS_VISIBLE,
				labelRect, parent, 0 );


	// grab msgs from this control

	// Setup the EditCtrl
	if(m_pEditCtrl)
		delete m_pEditCtrl;
#ifndef rde271b
	m_pEditCtrl = new CRichEdit(GetCSAcp());
#else   // rde271b
	m_pEditCtrl = new CEdit;
#endif  // rde271b

	RECT parentRect;
	parent->GetClientRect(&parentRect);
	ASSERTX(parent);

	m_editRect.top = top;
	m_editRect.bottom = m_editRect.top + EditHeight();
	m_editRect.left = left;
	m_editRect.right = parentRect.right - kHorizBorderWidth;

	if(!getIsMultiLine())
	{
		const int kLimitedLengthWidth = 100; // a hack
		m_editRect.OffsetRect(labelWidth + kSpaceBetweenLabelAndEdit, 0);
		if(m_editRect.Width() > kLimitedLengthWidth)
			m_editRect.right = m_editRect.left + kLimitedLengthWidth;

	}
	else
	{
		m_editRect.OffsetRect(0, kLabelHeight+5);
	}

	int iFlags = WS_TABSTOP | WS_CHILD | WS_VISIBLE | 	m_windowFlags;
	if (m_bScrolling)
		iFlags |=  ES_MULTILINE | ES_AUTOVSCROLL |WS_VSCROLL;

// THIS DELAYS THE CRASH IN RELEASE VERSIONS UNTIL YOU TYPE SOMETHING
//	iFlags |=  ES_MULTILINE ;

/*	BOOL ok = m_pEditCtrl->Create(iFlags,
									m_editRect,
									parent,
									id);

*/
	BOOL ok = m_pEditCtrl->CreateEx(  WS_EX_CLIENTEDGE ,
#ifndef rde271b
					 RICHEDIT_CLASS,
#else   // rde271b
					  _T("EDIT"),
#endif  // rde271b
					   NULL,       // no window title
					  iFlags,
					  m_editRect.left, //m_editRect.left,
					  m_editRect.top, //top,
					  m_editRect.Width(),
					  m_editRect.Height(),
						parent->m_hWnd,
					  (HMENU) id,
					  NULL );

	ASSERTX(ok);

//AfxMessageBox("SetWindowText");
	ASSERTX(m_pEditCtrl);
	m_pEditCtrl->SetWindowText( m_data);
	m_pEditCtrl->SetLimitText(m_iMaxLength);	// CWChar uses this to enforce just one char

	return m_editRect.bottom - top;
}

#ifndef rde270
// add the ability to update the display (after we've massaged the user input to be more
//  like what we expect (in this case, inserting spaces after adjacent punct symbols for
//  Sentrans 'Sentence Punctuation').
void CWString::setData(const CString& sStr, BOOL bUpdateEC /* = false */ )
{
	m_data = sStr;
	if( bUpdateEC && m_pEditCtrl )
	{
		m_pEditCtrl->SetWindowText(m_data);
		m_pEditCtrl->Invalidate();
	}
}
#endif  // rde270

CWString::~CWString()
{
	if(m_pLabel_ctrl)
		delete m_pLabel_ctrl;
	if(m_pEditCtrl)
		delete m_pEditCtrl;
}

ostream& operator <<( ostream& fout, const CWString& i )
{
	USES_CONVERSION_U8;
	return fout << T2CU8(getNStringFromNRString(i.m_data));
}

///////////////////////////////////////////////////////////////////////////////////////
CWChar::CWChar(LPCTSTR pLabel,
			   char c,
			   const CTextDisplayInfo* pTDI)
	: CWString(pLabel, c, pTDI)
{

}
BOOL CWString::isEmpty() const
{
	if(m_data.GetLength()==0)
		return TRUE;
	// call it empty if it's just white-space
	CString test(m_data);
	test.TrimLeft();
	return test.GetLength()==0;
}

BOOL CWChar::isEmpty() const
{
/*if(!m_data.IsEmpty())
{
	char c = m_data[0];
	TRACE("cwchar::isempty %d\n", c);
}
*/

	// there's something weird going on where isEmpty is false, but m_data[0] == 0;
return CWString::isEmpty() || (m_data[0] == ' ') || (m_data[0] == NULL);
}

void CWChar::retrieveData()
{
	ASSERTX(m_pEditCtrl);
	TCHAR buff[4];
	// this is to avoid the situation where an "invisible" leading space messes the user up
/*	if(m_pEditCtrl->GetWindowText(buff, 3)>1  &&   buff[0]!=' ')
	{
		CString s(buff);
		s.TrimLeft();
		if(s.GetLength()>0)
			m_data = s[0];
		else
			m_data = ' '; // will count as 'empty'
	}
	else
*/


#ifndef rde270
	if(m_pEditCtrl->GetWindowText(buff, 3)>0)
	{
		// make sure this resolves to a single UTF-8 byte (or we can't accept it).
		CString str = buff[0];
		USES_CONVERSION_U8;
		LPCSTR pStr = T2CU8(str);
		if( strlen(pStr) > 1 )
		{
			AfxFormatString1(str,IDS_MUST_BE_ANSI,(LPCTSTR)m_label);
			AfxMessageBox(str);
			m_pEditCtrl->SetFocus();
			m_pEditCtrl->SetSel(0,-1);
			AfxThrowUserException();
		}
		m_data = (TCHAR)pStr[0];
	}
#else   // rde270
	if(m_pEditCtrl->GetWindowText(buff, 3)>0)
		m_data = buff[0];
#endif  // rde270
	else m_data = ' '; // will count as 'empty'
}

///////////////////////////////////////////////////////////////////////////////////////
CWMarker::CWMarker(LPCTSTR pLabel, LPCTSTR pStr)
: CWString(pLabel, pStr)
{
	m_iMaxLength=12;
}

/////////////////////////////////////////////////////////////////////////////////

CWBool::CWBool(LPCTSTR pLabel, BOOL bValue)
	: m_data(bValue), CWAtomic(pLabel), m_pButtonCtrl(NULL)
{
};

void CWBool::retrieveData()
{
	ASSERTX(m_pButtonCtrl);
	m_data = m_pButtonCtrl->GetCheck();
}

int CWBool::AddToView(int left,int top,  int labelWidth, CWnd* parent, UINT id)
{
	if(m_pButtonCtrl)
		delete m_pButtonCtrl;
	m_pButtonCtrl = new CFormButton;	// this subclass is just so I know when it changed

	CRect r(left, top, left + kMaxWidthFIXME,
		top+kAtomicControlBasicHeight);
	BOOL ok = m_pButtonCtrl->Create( m_label,
								WS_TABSTOP|	/*didn'twork BS_NOTIFY |*/  WS_VISIBLE | WS_CHILD | BS_AUTOCHECKBOX,
									r,parent, id );
	ASSERTX(ok);
	m_pButtonCtrl->SetCheck(m_data);

/*	HWND hwndButton = CreateWindow(
		"BUTTON",   // predefined class
		m_label,       // button text
		WS_VISIBLE | WS_CHILD | BS_AUTOCHECKBOX,  // styles
		left, top,   kMaxWidthFIXME,
		kAtomicControlBasicHeight,
		parent->m_hWnd, NULL,  AfxGetInstanceHandle(),  NULL);

	ASSERTX(hwndButton);
*/
	return kAtomicControlBasicHeight;
}

CWBool::~CWBool()
{	if(m_pButtonCtrl)
		delete m_pButtonCtrl;
}

///////////////////////////////////////////////////////////////////////////////////////
CWRadio::CWRadio(int iWhichIsOn,
			LPCTSTR pLabel0,
			LPCTSTR pLabel1,
			LPCTSTR pLabel2,
			LPCTSTR pLabel3) :
		m_data(iWhichIsOn),
		CWAtomic(_T("noLabelForRadios"))
{
	// must have at least two radio buttons
	m_pLabel[0] = new CString(pLabel0);
	m_pLabel[1] = new CString(pLabel1);

	if (pLabel2)
		m_pLabel[2] = new CString(pLabel2);
	else
		m_pLabel[2] = 0;

	if (pLabel3)
		m_pLabel[3] = new CString(pLabel3);
	else
		m_pLabel[3] = 0;

	for(int i=0; i< CWRadio::kMaxRadios; i++)
		m_pButtonCtrl[i] = NULL;
}


void CWRadio::retrieveData()
{
	for(int i=0; i< CWRadio::kMaxRadios; i++)
	{
		if(m_pButtonCtrl[i])
			if(m_pButtonCtrl[i]->GetState())
				 m_data = i;
	}

}

UINT CWRadio::addOneButton(unsigned int iWhich, int left,int top, CWnd* parent, UINT id)	// protected
{

	DWORD dwStyle = WS_TABSTOP | WS_VISIBLE | WS_CHILD | BS_AUTORADIOBUTTON;

	if (0==iWhich)
		dwStyle |= WS_GROUP;  // make the auto radio-button business work

	CRect r(left, top, left + kMaxWidthFIXME,
		top+kAtomicControlBasicHeight);

	if(m_pButtonCtrl[iWhich])
		delete m_pButtonCtrl[iWhich];

	m_pButtonCtrl[iWhich] = new CFormButton;

	BOOL ok = m_pButtonCtrl[iWhich]->Create( *m_pLabel[iWhich],
									dwStyle,
									r,parent,
									id ); //note all the buttons will have the same id; hope that's not a problem
	ASSERTX(ok);

	m_pButtonCtrl[iWhich]->SetCheck(iWhich == m_data);	// off for all but one

/*	HWND hwndButton = CreateWindow(
		"BUTTON", *pLabel,       // button text
		dwStyle,
		left, top,
		kMaxWidthFIXME ,
		kAtomicControlBasicHeight,
		parent->m_hWnd,NULL,AfxGetInstanceHandle(), NULL);      // pointer not needed
	ASSERTX(hwndButton);
*/
	return kAtomicControlBasicHeight;
}

int CWRadio::AddToView(int left,int top,  int labelWidth, CWnd* parent, UINT id)
{
	UINT totalHeight=0;

	for(int i=0; i< CWRadio::kMaxRadios; i++)
	{
		if(m_pLabel[i])
			totalHeight += addOneButton( i, left, top + totalHeight , parent,
			id); // yes, all the buttons get the same id; not clear if that could be a problem in the future
	}

	return totalHeight;
}

CWRadio::~CWRadio()
{
	for(int i=0; i< CWRadio::kMaxRadios; i++)
	{
		if(m_pLabel[i])
			delete m_pLabel[i];
		if(m_pButtonCtrl[i])
			delete m_pButtonCtrl[i];
	}
}
///////////////////////////////////////////////////////////////////////////////////////

CWGroup::CWGroup(LPCTSTR pLabel)
:CWAtomic(pLabel), m_pGroupBox(NULL)
{
};

void CWGroup::retrieveData()
{
	for(int i=0; i<m_pItems.GetSize(); i++)
		m_pItems[i]->retrieveData();
}

int CWGroup::AddToView(int left,int top,  int labelWidth, CWnd* parent, UINT id)
{
	CRect clientRect;
	parent->GetClientRect(&clientRect);

	const int kHeightForGroupLabel = 30;
	const int kIndentForBox = 15;
	int iTop = top + kHeightForGroupLabel ;
	m_boxRect.SetRect(left-5, top, clientRect.right-kHorizBorderWidth, 123 /* changed below*/);//(iTop-top) +5);

	if(m_pGroupBox)
		delete m_pGroupBox;

	m_pGroupBox = new CButton();
	m_pGroupBox->Create(m_label,
		WS_VISIBLE | WS_CHILD | BS_GROUPBOX,
		m_boxRect,
		parent,
		NULL); // id


	// it would be nice to have this box be the parent, but it didn't work; perhaps
	// buttons (which is what a group box is) aren't expecting to have stuff inside them
	for(int i=0; i<m_pItems.GetSize(); i++)
	{
		CWAtomic* pItem = m_pItems[i];
		iTop += pItem->AddToView(left + kIndentForBox, iTop, labelWidth, parent,
				id); // ALL USING SAME ID AT THIS POINT
		iTop += kHorizontalLeading;
	}

	// now that we know how tall we need to be to hold everything
	m_boxRect.bottom = (iTop) +5;
	m_pGroupBox->MoveWindow(m_boxRect.left, m_boxRect.top, m_boxRect.Width(), m_boxRect.Height());


	return m_boxRect.Height();	// our height
}

// append string
void CWString::appendData(CString& s, TCHAR bSeperator)
{
	if(m_data.GetLength())
	{
		if(bSeperator=='\n') // actually need \r\n
			m_data += '\r';
		m_data += bSeperator;
	}

	m_data += s; //m_data += massageString(s);
}

void CWAtomic::doUpdate()//(CFont* pSrcFont, CFont* pTrgFont, CFont* pDEFAULTFont)
{
	// 1 need to get to the control of the subclass of CWAtomic
	//	(or implement doUpdate on each subclass)
	// 2 need to get at the default font

	//ASSERTX(pDEFAULTFont);
	// TO DO: need a way to get to the control for subclasses
	//m_pEditCtrl->SetFont(pDEFAULTFont);
}

void CWString::doUpdate()//CFont* pSrcFont, CFont* pTrgFont, CFont* pDEFAULTFont)
{
	if(!m_pEditCtrl || !::IsWindow(m_pEditCtrl->m_hWnd))	// can only do this when visible?
		return;

	if(m_pTDI)
	{
		m_pEditCtrl->SetFont(m_pTDI->getFont());
//gpTDI = (CTextDisplayInfo*) m_pTDI;
	}
	else	// use default font
	{
		// to do; find out the default font and use it
	}
}

///////////////////////////////////////////////////////////////////////////////////////

CWInteger::CWInteger	(LPCTSTR pLabel, int iValue)
:CWString(pLabel, _T(""), kUserLanguage), m_iValue(iValue)
{
	m_windowFlags |= ES_NUMBER;
	TCHAR s[256];
	_stprintf(s, _T("%d"), iValue);
	m_data = s;
}

void CWInteger::retrieveData()
{
	ASSERTX(m_pEditCtrl);
	TCHAR buff[256];
	m_pEditCtrl->GetWindowText(buff, CWInteger::kMaxDigits);

	m_iValue = _ttoi(buff);
	setData(m_iValue);	// this is goofy; we need to set the m_data string
}

void CWInteger::setData(int iValue)
{
	m_iValue = iValue;
	TCHAR s[256];
	_stprintf(s, _T("%d"), iValue);
	CWString::setData(CString(s));
}

BOOL CWBool::isTrue() const
{
	return m_data;
}

void CWAtomic::OnSize(UINT nType, int cx, int cy)
{

}

//virtual
void CWString::OnSize(UINT nType, int cx, int cy)
{
	if(!m_pEditCtrl || !::IsWindow(m_pEditCtrl->m_hWnd))	// can only do this when visible?
		return;
	if(getIsMultiLine())
	{
		WINDOWPLACEMENT wndpl;
		m_pEditCtrl->GetWindowPlacement(&wndpl );
		CRect r(wndpl.rcNormalPosition);
		r.right = cx - kHorizBorderWidth;
		m_pEditCtrl->MoveWindow(r.left, r.top, r.Width(), r.Height());
	}
}

//virtual
void CWGroup::doUpdate()
{
	for(int i=0; i<m_pItems.GetSize(); i++)
	{
		m_pItems[i]->doUpdate();
	}
}

//virtual
void CWGroup::OnSize(UINT nType, int cx, int cy)
{
	if(!m_pGroupBox || !::IsWindow(m_pGroupBox->m_hWnd))	// can only do this when visible?
		return;

	WINDOWPLACEMENT wndpl;
	m_pGroupBox->GetWindowPlacement(&wndpl );
	CRect r(wndpl.rcNormalPosition);
	r.right = cx - kHorizBorderWidth + 5;
	m_pGroupBox->MoveWindow(r.left, r.top, r.Width(), r.Height());

	for(int i=0; i<m_pItems.GetSize(); i++)
	{
		m_pItems[i]->OnSize(nType, cx, cy);
	}

}
// decide whether this is a small, limited string or a longer, take as much as space as you have one
BOOL CWString::getIsMultiLine()
{
	return !(m_iMaxLength < 20 && m_iMaxLength != 0
		|| (m_windowFlags & ES_NUMBER));

}

CWGroup::~CWGroup()
{
	// this stuff appears to be getting deleted already, whithout being removed from our list
/*	for(int i=0; i< m_pItems.GetSize(); i++)
	{
		CWAtomic* x = m_pItems[i];
		delete x;
	}
*/


	if(m_pGroupBox)
		delete m_pGroupBox;
}
/////////////////////////////////////////////////////////////////////////////////

CWStatic::CWStatic(LPCTSTR pLabel, DWORD dwFlags)
	: CWAtomic(pLabel),m_dwFlags(dwFlags),  m_pStaticCtrl(NULL)
{
};

int CWStatic::AddToView(int left,int top,  int labelWidth, CWnd* parent, UINT id)
{
	if(m_pStaticCtrl)
		delete m_pStaticCtrl;
	m_pStaticCtrl = new CStatic;

	CRect r(left, top, left + kMaxWidthFIXME,
		top+kAtomicControlBasicHeight);
	BOOL ok = m_pStaticCtrl->Create( m_label,
								WS_TABSTOP|	  WS_VISIBLE | WS_CHILD | m_dwFlags,
									r,parent, id );
	ASSERTX(ok);
	return kAtomicControlBasicHeight;
}

CWStatic::~CWStatic()
{	if(m_pStaticCtrl)
		delete m_pStaticCtrl;
}
