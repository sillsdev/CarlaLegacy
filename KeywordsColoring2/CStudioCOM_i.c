/* this file contains the actual definitions of */
/* the IIDs and CLSIDs */

/* link this file in with the server and any clients */


/* File created by MIDL compiler version 5.01.0164 */
/* at Wed Aug 28 09:09:55 2002
 */
/* Compiler settings for C:\carla\KeywordsColoring2\source\CStudioCOM.idl:
	Os (OptLev=s), W1, Zp8, env=Win32, ms_ext, c_ext
	error checks: allocation ref bounds_check enum stub_data
*/
//@@MIDL_FILE_HEADING(  )
#ifdef __cplusplus
extern "C"{
#endif


#ifndef __IID_DEFINED__
#define __IID_DEFINED__

typedef struct _IID
{
	unsigned long x;
	unsigned short s1;
	unsigned short s2;
	unsigned char  c[8];
} IID;

#endif // __IID_DEFINED__

#ifndef CLSID_DEFINED
#define CLSID_DEFINED
typedef IID CLSID;
#endif // CLSID_DEFINED

const IID IID_ICSHook = {0x11EC31D6,0x094D,0x11D3,{0x86,0x64,0x88,0x97,0x0C,0xC1,0x00,0x00}};


const IID IID_IParseCS = {0x6698ECD9,0x76C3,0x48C7,{0x93,0x9E,0xBD,0x39,0xBF,0xE2,0x74,0x55}};


const IID LIBID_CStudioLib = {0x11EC31D4,0x094D,0x11D3,{0x86,0x64,0x88,0x97,0x0C,0xC1,0x00,0x00}};


const CLSID CLSID_CSHook = {0x11EC31D7,0x094D,0x11D3,{0x86,0x64,0x88,0x97,0x0C,0xC1,0x00,0x00}};


const CLSID CLSID_ParseCS = {0x5A2AFAD2,0xB372,0x4F91,{0xAD,0x5D,0x23,0x90,0x5E,0x20,0x2E,0xE3}};


#ifdef __cplusplus
}
#endif
