// Focuser.h: interface for the CFocuser class.
//
//////////////////////////////////////////////////////////////////////
#if !defined(AFX_FOCUSER_H__DC6F7FA0_D58F_11D2_8651_183E0CC10000__INCLUDED_)
#define AFX_FOCUSER_H__DC6F7FA0_D58F_11D2_8651_183E0CC10000__INCLUDED_


// The following ifdef block is the standard way of creating macros which make exporting
// from a DLL simpler. All files within this DLL are compiled with the CSUTILDLL_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see
// CSUTILDLL_API functions as being imported from a DLL, wheras this DLL sees symbols
// defined with this macro as being exported.
#ifdef CSUTILDLL_EXPORTS
#define CSUTILDLL_API __declspec(dllexport)
#else
#define CSUTILDLL_API __declspec(dllimport)
#endif


#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CSUTILDLL_API CFocuser
{
public:
	void focusShbxOnWord(LPCTSTR lpszWord);
	CFocuser();
	virtual ~CFocuser();

};

#endif // !defined(AFX_FOCUSER_H__DC6F7FA0_D58F_11D2_8651_183E0CC10000__INCLUDED_)
