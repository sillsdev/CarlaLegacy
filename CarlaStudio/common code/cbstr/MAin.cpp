// Main.cpp
//
// Test harness to execise the CBstr class
// derived from _bstr_t and based on the
// NoMFC::CString class from www.worldofatl.com
//
// If anyone can figure out why the ostream::operator<< refuses to
// use the implicit cast to const char* or char* then please email me
// at gary.olliffe@parallax.co.uk
//
//
#include "CBstrImpl.h"
#include <iostream>
#include "resource.h"

using std::cout;

const TCHAR* Test(const TCHAR* psz);

// This test only works in ANSI (not UNICODE) builds
// due to lack of _T() and stream insertion operator

int main ()
{
	BSTR bstr = ::SysAllocString(L"Hello World");
	CBstr newstr(bstr, true);
	CBstr newstr2(bstr, false);
	newstr2.MakeUpper();

	BSTR ptrcopy = newstr2;
	BSTR deepcopy = newstr2.copy();
	char * ansistr = newstr2;
	const char* ansicstr = newstr2;
	cout << ansistr << "\n" << ansicstr << "\n";
	cout << (const char *)newstr2 << "\n";

	CBstr str(_T("twenty-five"));
	Test(str);
	CBstr str2(str);

//   CBstr str3('X', 20);

   cout << (const char *)str << "\n";
   cout << (const char *)str2 << "\n";
//   cout << (const char *)str3 << "\n";

   str.Format(_T("sder %d %s"), 1, _T("sstt"));
   cout << (const char *)str << "\n";

   CBstr s(_T("abcdef"));
   cout << s.length() << "\n"; // == 6

   CBstr s2;
   cout << s2.IsEmpty() << "\n"; // == true

   CBstr s3(_T("abc"));
   s3.Empty();
   cout << s3.length() << "\n"; // == 0

   CBstr s4(_T("abcdef"));
   cout << s4.GetAt(2) << "\n"; //  == 'c'

   CBstr s5(_T("abc"));
   cout << s5[1] << "\n"; // == 'b'
   s5.SetAt(1, _T('X'));
   cout << s5[1] << "\n"; // == 'X'

   CBstr s6, s7;        // Empty CBstr objects
   s6 = _T("cat");            // s6 == "cat"
   cout << (const char *)s6 << "\n";
   s7 = s6;               // s6 and s7 each == "cat"
   cout << (const char *)s7 << "\n";
   s6 = "the " + s6;      // Or expressions
   cout << (const char *)s6 << "\n";
//   s6 = 'x';              // Or just individual characters
//   cout << (const char *)s6 << "\n";

   // example for CBstr::operator +
   CBstr s8(_T("abc"));
   CBstr s9(_T("def"));
   cout << (const char *)(s8 + s9 ) << "\n"; // == "abcdef"
   CBstr s10;
   s10 = CBstr(_T("abc")) + _T("def") ; // == "abcdef"
   cout << (const char *)s10 << "\n";

   // example for CBstr::operator +=
   CBstr s11(_T("abc"));
   cout << (const char *)( s11 += _T("def")) << "\n"; // == "abcdef"

   // example for CBstr Comparison Operators
   CBstr s12(_T("abc"));
   CBstr s13(_T("abd"));
   if (s12 < s13)
	  cout << "s12 < 13" << "\n"; // == true Operator is overloaded for both.
   if (_T("ABC") < s12)
	  cout << "ABC < s12" << "\n"; // == true CBstr and char*
   if (s13 > _T("abe"))
	  cout << "s13 > abe" << "\n"; // == false
   if (s13 == _T("abd"))
	  cout << "s13 == abd" << "\n"; // == true

   // example for CBstr::Compare
   CBstr s14( _T("abc") );
   CBstr s15( _T("abd") );
   cout << s14.Compare(s15) << "\n"; // == -1 // Compare with another CBstr.
   cout << s14.Compare(_T("abe")) << "\n"; // == -1 // Compare with LPTSTR string.

   // example for CBstr::CompareNoCase
   CBstr s16( _T("abc") );
   CBstr s17( _T("ABD") );
   cout << s16.CompareNoCase( s17 ) << "\n"; // == -1 // Compare with a CBstr.
   cout << s16.Compare( _T("ABE") )  << "\n"; // == 1 // Compare with LPTSTR string.

   // example for CBstr::Mid
   CBstr s18(_T("abcdef"));
   cout << (const char *)s18.Mid(2, 3) << "\n"; //  == _T("cde")

   // example for CBstr::Left
   CBstr s19( _T("abcdef") );
   cout << (const char *)s19.Left(2) << "\n"; //  == _T("ab")

   // example for CBstr::Right
   CBstr s20( _T("abcdef") );
   cout << (const char *)s20.Right(2) << "\n"; //  == _T("ef")

   // example for CBstr::SpanIncluding
   CBstr s21( _T("cabbage") );
   CBstr s22 = s21.SpanIncluding( _T("abc") );
   cout << (const char *)s22 << "\n"; //  == "cabba"
   s22 = s21.SpanIncluding( _T("xyz") );
   cout << s22.IsEmpty( ) << "\n"; // == true

   // example for CBstr::MakeUpper
   CBstr s23( _T("abc") );
   s23.MakeUpper();
   cout << (const char *)s23 << "\n"; //  == "ABC"

   // example for CBstr::MakeLower
   CBstr s24( _T("ABC") );
   s24.MakeLower();
   cout << (const char *)s24 << "\n"; //  == "abc"

   // example for CBstr::MakeReverse
   CBstr s25( _T("abc") );
   s25.MakeReverse();
   cout << (const char *)s25 << "\n"; //  == "cba"

   // example for CBstr::Find
   CBstr s26( _T("abcdef") );
   cout << s26.Find( _T('c') ) << "\n"; //  == 2
   cout << s26.Find( _T("de") ) << "\n"; //  == 3

   // example for CBstr::ReverseFind
   CBstr s27( _T("abcabc") );
   cout << s27.ReverseFind( _T('b') ) << "\n"; //  == 4

   // example for CBstr::FindOneOf
   CBstr s28( _T("abcdef") );
   cout << s28.FindOneOf( _T("xd") ) << "\n"; //  == 3 // 'd' is first match

   CBstr s29;
   HINSTANCE hInst = GetModuleHandle(NULL);
   s29.LoadString( hInst , IDS_HELLO_RES);
   cout << (const char *)s29;
   s29.LoadString( hInst , IDS_WORLD_RES);
   cout << (const char *)s29 << "\n";

   return 0;
}