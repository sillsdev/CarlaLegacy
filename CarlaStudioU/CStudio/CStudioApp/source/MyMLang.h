#pragma once

#include "MLang.h"

#define CP_UTF16    1200    // from 'IsValidCodePage' help files
#define CP_ASCII    20127   // from 'IsValidCodePage'
enum _eEncoding { eAnsi = CP_ACP, eUTF8 = CP_UTF8, eUTF16 = CP_UTF16 };

// helper class for accessing IMultiLanguage2
class MyML2Ptr : public CComPtr<IMultiLanguage2>
{
public:
	MyML2Ptr()
	{
		CComQIPtr<IMultiLanguage> pML;
		if( pML.CoCreateInstance(CLSID_CMultiLanguage) == S_OK )
		{
			if( pML.QueryInterface(&p) != S_OK )
			{
				throw;
			}
		}
	};

	// this function is specific to our CS needs. It'll only tell one of 3 answers:
	//  eUTF16 -    if the file actually has the UTF-16 BOM (or DetectInputCodepage tells us
	//              it is; though I've never see it returned even when it was...)
	//  eUTF8 -     if DetectInputCodepage tells us that at least one of the encodings is
	//              UTF-8 (it seems to never have 100% confidence even on files *with the
	//              BOM and even if they were saved by Word, for example).
	//  eAnsi -     if it isn't one of the above two (this is simply so we know how to treat
	//              the data; i.e. use CP_ACP for conversion to wide). Even though this is a
	//              huge assumption on my part, in our CS case, we really don't need to
	//              expect data to be in any form besides these three.
	_eEncoding WhichEncoding(LPVOID pbBuff, INT lNumRead);
};

// kind of big for a inline, but I didn't want to have to put it in a library which isn't
//  currently linked with all the users (CS Utility DLL needs it, but doesn't link with the
//  CStudioProcessorLib)
inline _eEncoding MyML2Ptr::WhichEncoding(LPVOID pbBuff, INT lNumRead)
{
	ASSERT( !!(*this) );

	// if all fails, then return eAnsi, so we won't clobber data.
	_eEncoding eEncoding = eAnsi;

	INT i, nScores; i = lNumRead; nScores = 10;
	DetectEncodingInfo* pDEI = (DetectEncodingInfo*)alloca(sizeof(DetectEncodingInfo)*nScores);
	HRESULT hr = p->DetectInputCodepage
					(
						MLDETECTCP_8BIT,
						CP_UTF8,
						(LPSTR)pbBuff,
						&i,
						pDEI,
						&nScores
					);

	for(i = 0; (eEncoding == eAnsi) && (i < nScores); i++ )
	{
		switch( pDEI[i].nCodePage )
		{
		case CP_ASCII:
		case CP_UTF8:
			// it has at least *some* UTF8
			eEncoding = eUTF8;
			break;
		case CP_UTF16:
			// it has at least *some* UTF16
			eEncoding = eUTF16;
			break;
		}
	}

	return eEncoding;
}
