#include "stdafx.h"
#include "MyMLang.h"    // for MyML2Ptr

_eEncoding  m_csacp = eAnsi;
BOOL        m_bCsAcpEstablished = false;

// this global function returns the code page that the T2CU8 and U82CT macros use to convert
//  from wide characters (used internally by CSUnicode version).
//  Normally this'll be UTF-8, but it might not be if we're opening a custom-encoded
//  project. For starters, we return just the ansi code page, but after the
//  user loads the project and language files it will call 'EstablishUTF8Safeness' which might
//  change this returned global to eUTF8 if the file he passes (???outit.ctl) contains
//  UTF-8 encodings (or no change is made if not).
CSUTILDLL_API UINT GetCSAcp(void)
{
#ifdef  _UNICODE // CSU should always only deal with UTF8 (MLang doesn't work well with some Unicode ranges)
	m_csacp = eUTF8;
#endif	// rde273
	return (UINT)m_csacp;
}

CSUTILDLL_API BOOL EstablishUTF8Safeness(const CString& sPath)
{
	BOOL    bRet = true;    // assume the best for now.

#ifdef  _UNICODE
	CFileStatus fstat;
	if( CFile::GetStatus(sPath,fstat) )
	{
		CFile file;
		try
		{
			CFileException e;
			if( file.Open(sPath, CFile::modeRead | CFile::shareDenyNone, &e) )
			{
				// this should always be relative small
				ASSERT(fstat.m_size <= 0xFFF);

				LPVOID pBuf = (LPVOID)alloca(fstat.m_size);
				if( file.Read(pBuf,fstat.m_size) )
				{
					MyML2Ptr m_pML2;
					if( !!m_pML2 )  // if it's not bad (i.e. good)
					{
						_eEncoding eEnc = m_pML2.WhichEncoding(pBuf, fstat.m_size);

						// if this is the first time (i.e. 1st project to open/test), then
						//  keep track of that and set the cp using what we just determined.
						if( !m_bCsAcpEstablished )
						{
							m_bCsAcpEstablished = true;
							m_csacp = eEnc;
						}

						// otherwise, if we've already established one project, make sure
						//  the answer is the same for this new project...
						else if( m_csacp != eEnc )
						{
							// This means the user is opening one project which is UTF-8 safe
							//  and another which isn't! return false so the project won't
							//  open
							bRet = false;
						}
					}
				}

				file.Close();
			}
		} catch( CFileException e )
		{
		}
	}

	return  bRet;
#else   // !_UNICODE
	return  bRet;
#endif  // !_UNICODE
}

// reset the safeness whenever you close the project so newly opened projects can start from
//  scratch (since the variables we're returning are based on globals they stay around for
//  the duration).
CSUTILDLL_API void ResetUTF8Safeness()
{
	m_csacp = eAnsi;
	m_bCsAcpEstablished = false;
}
