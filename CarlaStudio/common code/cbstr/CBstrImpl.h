////////////////////////////////////////////////////////
//
//	CBStr : BSTR wrapper class with manipulation routines
//
//	Gary Olliffe : Parallax Solutions Ltd
//
//	e-mail : Gary.Olliffe@parallax.co.uk
//
//  updated : 19/10/98
//                  Fixed SetAt() to work with ANSI and Unicode
//                  Tested under UNICODE release and Debug.
//                  Added LoadString() method.

#ifndef _CBSTR_IMPLEMENTATION_H_00944610_1B3F_11d2_955A_00805FC3DFB4
#define _CBSTR_IMPLEMENTATION_H_00944610_1B3F_11d2_955A_00805FC3DFB4

#include <stdio.h>

#include <comdef.h>

#include <tchar.h>

#include "CBStr.h"

///////////////////////////////////////////////////////////////////////////
// The string as an array
///////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////
// Constructors
///////////////////////////////////////////////////////////////////////////

	inline CBstr::CBstr()
	  :  _bstr_t() {}

	inline CBstr::CBstr(const CBstr& strInput)
	  :  _bstr_t(strInput) {}

	inline CBstr::CBstr(const _bstr_t& strInput)
	  :  _bstr_t(strInput) {}

	inline CBstr::CBstr(const TCHAR* strInput)
	  :  _bstr_t(strInput) {}

	inline CBstr::CBstr(const variant_t& varinput)
	  :  _bstr_t(varinput) {}

	inline CBstr::CBstr(const BSTR strInput, bool bcopy)
	  :  _bstr_t(strInput, bcopy) {}


////////////////////////////////////////////////////////////////////////////
// Methods
////////////////////////////////////////////////////////////////////////////

	// New Loadstring method
	inline bool CBstr::LoadString(HINSTANCE hInstance, UINT uID)
	{
		bool bRetval = false;
		TCHAR lpBuffer[256];
		if (0 != ::LoadString(hInstance, uID, lpBuffer, 256))
		{
			bRetval = true;
			// assign value to this class
			*this = lpBuffer;
		}
		return bRetval;
	}



   inline bool CBstr::IsEmpty() const
   {
	  return _bstr_t::length() == 0;
   };

   inline void CBstr::Empty()
   {
	  _bstr_t::operator=( _T("") );
	  return;
   };

   inline TCHAR CBstr::GetAt(int nIndex) const
   {
	  unsigned int len = _bstr_t::length();
	  if (len > 0 && len > static_cast<unsigned int>(nIndex))
	  {
			const TCHAR* tmp =  _bstr_t::operator const TCHAR*() ;
			return tmp[nIndex];
	  }
	  return L'\0';
   };

   inline void CBstr::SetAt(int nIndex, TCHAR ch)
   {
	  unsigned int len = _bstr_t::length();
	  if (len > 0 && len > static_cast<unsigned int>(nIndex))
	  {
			// We need to modify both internal representations in the
			// base class
			char* tmp =  _bstr_t::operator char*() ;
			wchar_t* tmpw =  _bstr_t::operator wchar_t*() ;

#if defined(UNICODE) && defined(_UNICODE)
// This is a UNICODE build
			wchar_t wch = ch;
			char mbch;
			WideCharToMultiByte(CP_ACP, 0, &ch, 1,
									&mbch, 1, NULL,NULL);

#else
// This is an ANSI build
			wchar_t wch;
			char mbch = ch;
			MultiByteToWideChar(CP_ACP, 0, &ch, 1,
									&wch, 1 );
#endif

			tmp[nIndex] = mbch;
			tmpw[nIndex] = wch;
	  }
	  return;
   };

///////////////////////////////////////////////////////////////////////////
// Comparison
///////////////////////////////////////////////////////////////////////////

   inline int CBstr::Compare(LPCTSTR psz) //const
   {
	   const TCHAR* tmp = _bstr_t::operator TCHAR*();
	   return _tcscmp(tmp, psz);
   };

   inline int CBstr::Compare(const CBstr& str) const
   {
	   const TCHAR* tmpthis = _bstr_t::operator const TCHAR*();
	   const TCHAR* tmpOther = static_cast<const TCHAR*>(str);

	   return _tcscmp(tmpthis, tmpOther);
   };

   inline int CBstr::CompareNoCase(const TCHAR* psz) const
   {
	   const TCHAR* tmp = _bstr_t::operator const TCHAR*();
	   return _tcsicmp(tmp, psz);
   };

   inline int CBstr::CompareNoCase(const CBstr& str) const
   {
	   const TCHAR* tmpthis = _bstr_t::operator const TCHAR*();
	   const TCHAR* tmpOther = static_cast<const TCHAR*>(str);

	   return _tcsicmp(tmpthis, tmpOther);
   };

   inline int CBstr::Collate(const TCHAR* psz) const
   {
	   const TCHAR* tmpthis = _bstr_t::operator const TCHAR*();

	   return _tcscoll(tmpthis, psz);
   };

   inline int CBstr::Collate(const CBstr& str) const
   {
	   const TCHAR* tmpthis = _bstr_t::operator const TCHAR*();
	   const TCHAR* tmpOther = static_cast<const TCHAR*>(str);

	   return _tcscoll(tmpthis, tmpOther);
   };

///////////////////////////////////////////////////////////////////////////
// Extraction
///////////////////////////////////////////////////////////////////////////

/*   inline CBstr<T> CBstr::Mid(int nFirst) const
   {
	  const TCHAR* tmp = _bstr_t::operator TCHAR*();
	  return _tcsnstr(nFirst);
   };
*/
   inline CBstr CBstr::Mid(int nFirst, int nCount) const
   {
	  TCHAR* tmp = _bstr_t::operator TCHAR*();
	  int len = _bstr_t::length() + 1;
	  TCHAR *result = new TCHAR[ len ];

	  memset( result, '\0',  len * sizeof(TCHAR) );
	   _tcsncpy( result, &tmp[nFirst], nCount );

	  CBstr cbRes = result;
	  delete result;

	  return cbRes;
   };

   inline CBstr CBstr::Left(int nCount) const
   {
	   return CBstr::Mid(0, nCount);
   };

   inline CBstr CBstr::Right(int nCount) const
   {
	   return CBstr::Mid(length() - nCount, nCount);
   };

   inline CBstr CBstr::SpanIncluding(const TCHAR* pszCharSet) const
   {
	  const TCHAR* tmp = _bstr_t::operator const TCHAR*();
	  int strlen = _tcsspn( tmp, pszCharSet );

	  return CBstr::Mid(0, strlen);
   };

   inline CBstr CBstr::SpanExcluding(const TCHAR* pszCharSet) const
   {
	  const TCHAR* tmp = _bstr_t::operator const TCHAR*();
	  int pos = _tcscspn( tmp, pszCharSet );

	  return CBstr::Mid(0, pos);
   };

///////////////////////////////////////////////////////////////////////////
// Other Conversions
///////////////////////////////////////////////////////////////////////////

   inline void CBstr::MakeUpper()
   {
		// We need to modify both internal representations in the
		// base class
	   char* tmp =  _bstr_t::operator char*() ;
	   wchar_t* tmpw =  _bstr_t::operator wchar_t*() ;
	   strupr(tmp);
	   _wcsupr(tmpw);
	   return;
   };

   inline void CBstr::MakeLower()
   {
		// We need to modify both internal representations in the
		// base class
	   char* tmp =  _bstr_t::operator char*() ;
	   wchar_t* tmpw =  _bstr_t::operator wchar_t*() ;
	   strlwr(tmp);
	   _wcslwr(tmpw);
	   return;
   };

   inline void CBstr::MakeReverse()
   {
		// We need to modify both internal representations in the
		// base class
	   char* tmp =  _bstr_t::operator char*() ;
	   wchar_t* tmpw =  _bstr_t::operator wchar_t*() ;
	   strrev(tmp);
	   _wcsrev(tmpw);

	  return;
   };

   inline void CBstr::TrimLeft()
   {
	  const TCHAR* tmp = _bstr_t::operator const TCHAR*();
	  TCHAR* trimstr = _tcsspnp( tmp, _T(" \t") );

	  *this = trimstr;
	  return;
   };

   inline void CBstr::TrimRight()
   {
	  const TCHAR* tmp = _bstr_t::operator const TCHAR*();
	  TCHAR* trimstr = _tcsspnp( tmp, _T(" \t") );
	  int pos = _bstr_t::length() - 1;
	  while (trimstr[pos] == ' ')
	  {
		 trimstr[pos--] = '\0';
	  }

	  *this = trimstr;
	  return;
   };

   inline void CBstr::Format(const TCHAR* pszFormat, ... )
   {
	  // Doesn't have all the features of CString::Format()
	  va_list vl;
	  va_start(vl, pszFormat);

	  TCHAR* pszTemp = NULL;
	  int nBufferSize = 0;
	  int nRetVal = -1;

	  do
	  {
		 // Increment the buffer 100 characters at a time
		 // I'm not sure whether this is robust!
		 nBufferSize += 100;
		 delete [] pszTemp;
		 pszTemp = new TCHAR [nBufferSize];
		 nRetVal = _vstprintf(pszTemp, pszFormat, vl);
	  } while (nRetVal < 0);

	  *this = pszTemp;
	  delete [] pszTemp;

	  va_end(vl);
	  return;
   };

///////////////////////////////////////////////////////////////////////////
// Searching
///////////////////////////////////////////////////////////////////////////

   inline int CBstr::Find(const TCHAR& ch) const
   {
	  // npos == -1 in this implementation, but it might not always be, so this is
	  // a bit dodgy.
	   const TCHAR* tmp =  _bstr_t::operator const TCHAR*() ;
	   TCHAR* pdest = _tcschr( tmp, ch );
	   return pdest - tmp;
   };

   inline int CBstr::Find(const TCHAR* psz) const
   {
	   const TCHAR* tmp =  _bstr_t::operator const TCHAR*() ;
	   TCHAR* pdest = _tcsstr( tmp, psz );
	   return pdest - tmp;
   };

   inline int CBstr::ReverseFind(const TCHAR& ch) const
   {
	   const TCHAR* tmp =  _bstr_t::operator const TCHAR*() ;
	   TCHAR* pdest = _tcsrchr( tmp, ch );
	   return pdest - tmp;
   };

   inline int CBstr::FindOneOf(const TCHAR* psz) const
   {
	   const TCHAR* tmp =  _bstr_t::operator const TCHAR*() ;
	   int pos = _tcscspn( tmp, psz );
	   if (pos == static_cast<long>(_bstr_t::length()))
	   {
		   pos = -1;
	   }
	   return pos;
   };

///////////////////////////////////////////////////////////////////////////
// Operators
///////////////////////////////////////////////////////////////////////////
inline CBstr::operator const TCHAR*() const
   { return _bstr_t::operator const TCHAR*(); };

inline TCHAR CBstr::operator[](int nIndex) const
   { return GetAt(nIndex); };

///////////////////////////////////////////////////////////////////////////
// Comparison Operators
///////////////////////////////////////////////////////////////////////////
inline bool operator==(const CBstr& s1, const CBstr& s2)
	{ return s1.Compare(s2) == 0; }
inline bool operator==(const CBstr& s1, const TCHAR* s2)
	{ return s1.Compare(s2) == 0; }
inline bool operator==(const TCHAR* s1, const CBstr& s2)
	{ return s2.Compare(s1) == 0; }

inline bool operator!=(const CBstr& s1, const CBstr& s2)
	{ return s1.Compare(s2) != 0; }
inline bool operator!=(const CBstr& s1, const TCHAR* s2)
	{ return s1.Compare(s2) != 0; }
inline bool operator!=(const TCHAR* s1, const CBstr& s2)
	{ return s2.Compare(s1) != 0; }

inline bool operator<(const CBstr& s1, const CBstr& s2)
	{ return s1.Compare(s2) < 0; }
inline bool operator<(const CBstr& s1, const TCHAR* s2)
	{ return s1.Compare(s2) < 0; }
inline bool operator<(const TCHAR* s1, const CBstr& s2)
	{ return s2.Compare(s1) > 0; }

inline bool operator>(const CBstr& s1, const CBstr& s2)
	{ return s1.Compare(s2) > 0; }
inline bool operator>(const CBstr& s1, const TCHAR* s2)
	{ return s1.Compare(s2) > 0; }
inline bool operator>(const TCHAR* s1, const CBstr& s2)
	{ return s2.Compare(s1) < 0; }

inline bool operator<=(const CBstr& s1, const CBstr& s2)
	{ return s1.Compare(s2) <= 0; }
inline bool operator<=(const CBstr& s1, const TCHAR* s2)
	{ return s1.Compare(s2) <= 0; }
inline bool operator<=(const TCHAR* s1, const CBstr& s2)
	{ return s2.Compare(s1) >= 0; }

inline bool operator>=(const CBstr& s1, const CBstr& s2)
	{ return s1.Compare(s2) >= 0; }
inline bool operator>=(const CBstr& s1, const TCHAR* s2)
	{ return s1.Compare(s2) >= 0; }
inline bool operator>=(const TCHAR* s1, const CBstr& s2)
	{ return s2.Compare(s1) <= 0; }


#endif //_CBSTR_IMPLEMENTATION_H_00944610_1B3F_11d2_955A_00805FC3DFB4