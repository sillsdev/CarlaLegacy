////////////////////////////////////////////////////////
//
//	CBStr : BSTR wrapper class with manipulation routines
//
//	Gary Olliffe : Parallax Solutions Ltd
//
//	e-mail : Gary_Olliffe@hotmail.com
//
//  date : 14/07/1998
//
//  updated : 19/10/98
//                  Fixed SetAt() to work with ANSI and Unicode
//                  Tested under UNICODE release and Debug.
//                  Added LoadString() method.
//
////////////////////////////////////////////////////////
//
// The public interface to this class was
// "inspired by"/"poached from" the NoMFC::CString example
// www.worldofatl.com.  As a result it fairly closely mimics the
// MFC CString interface -  the methods not implemented have been left
// in the class definition but are commented out.
// Additional constructorsto mimic _bstr_t have been added, these include a
// _variant_t constructor and a BSTR constructor with copy/attach flag
//
// If you have a string that will require manipulation then use this
// otherwise stick to the basic _bstr_t class.
//
// The reason I have written this _bstr_t based class rather than use the
// basic_string implementation is that the MS STL requires a support dll
// to be shipped to support the allocators, and not everyone want to use STL
//
// This is by no means intended as an optimised implementation of this class,
// most or the routines use the standard "c" string manipulation routines
//
// Users looking at the implementation should also note that the _bstr_t base class
// has two internal representations (one ASNI, one uNICODE) methods on this
// class that modify the string (eg. MakeUpper, SetAt, etc...) modify both internal
// strings to maintain consistency.
//
// Users should also note that where appropriate the class makes use of the TCHAR
// typedef, giving UNICODE compatibility.
//
/////////////////////////////////////////////////////////////

#ifndef _CBSTR_H_D130E080_1B3E_11d2_955A_00805FC3DFB4
#define _CBSTR_H_D130E080_1B3E_11d2_955A_00805FC3DFB4


class CBstr : public _bstr_t
{
	// These methods groupings and names have been taken from
	// NoMFC::CString from www.worldofatl.com
public:
	  // Constructors
	  CBstr();
	  CBstr( const CBstr& strInput);
	  CBstr( const _bstr_t& strInput);
	  CBstr( const TCHAR* strInput);
	  // _bstr_t mimic constructors
	  CBstr( const _variant_t& varinput );
	  CBstr( BSTR strinput, bool bcopy );

//      CBstr(TCHAR ch, int nRepeat = 1);

	  //string population
	  bool LoadString(HINSTANCE hInstance, UINT uID);

	  // The string as an array
//      int GetLength() const;
	  bool IsEmpty() const;
	  void Empty();
	  TCHAR GetAt(int nIndex) const;
	  void SetAt(int nIndex, TCHAR ch);

	  // Comparison
	  int Compare(const TCHAR* psz) ;//const;
	  int Compare(const CBstr& str) const;
	  int CompareNoCase(const TCHAR* psz) const;
	  int CompareNoCase(const CBstr& str) const;
	  int Collate(const TCHAR* psz) const;
	  int Collate(const CBstr& str) const;

	  // Extraction
//      CBstr Mid(int nFirst) const;
	  CBstr Mid(int nFirst, int nCount) const;
	  CBstr Left(int nCount) const;
	  CBstr Right(int nCount) const;
	  CBstr SpanIncluding(const TCHAR* pszCharSet) const;
	  CBstr SpanExcluding(const TCHAR* pszCharSet) const;

	  // Other Conversions
	  void MakeUpper();
	  void MakeLower();
	  void MakeReverse();
	  void TrimLeft();
	  void TrimRight();
	  void Format(const TCHAR* pszFormat, ... );

	  // Searching
	  int Find(const TCHAR& ch) const;
	  int Find(const TCHAR* psz) const;
	  int ReverseFind(const TCHAR& ch) const;
	  int FindOneOf(const TCHAR* pszCharSet) const;

	  // Operators
	  TCHAR operator[](int nIndex) const;
	  operator const TCHAR*() const;

};

#endif // _CBSTR_H_D130E080_1B3E_11d2_955A_00805FC3DFB4
