/* this file contains the actual definitions of */
/* the IIDs and CLSIDs */

/* link this file in with the server and any clients */


/* File created by MIDL compiler version 5.01.0164 */
/* at Fri Jun 15 14:12:37 2001
 */
/* Compiler settings for C:\carla\Dev\SOSMirror\pc-parse\pcpatr\patr100.idl:
	Oicf (OptLev=i2), W1, Zp8, env=Win32, ms_ext, c_ext
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

const IID IID_IPatrParser = {0x327879FF,0x5405,0x11D3,{0x8F,0xD4,0x00,0x40,0x05,0x41,0xF6,0xD3}};


const IID LIBID_PATR100Lib = {0x327879F1,0x5405,0x11D3,{0x8F,0xD4,0x00,0x40,0x05,0x41,0xF6,0xD3}};


const CLSID CLSID_PatrParser = {0x32787A00,0x5405,0x11D3,{0x8F,0xD4,0x00,0x40,0x05,0x41,0xF6,0xD3}};


#ifdef __cplusplus
}
#endif
