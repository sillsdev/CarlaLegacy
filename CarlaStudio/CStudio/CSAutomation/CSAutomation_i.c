/* this file contains the actual definitions of */
/* the IIDs and CLSIDs */

/* link this file in with the server and any clients */


/* File created by MIDL compiler version 5.01.0164 */
/* at Tue Jan 05 09:20:16 2016
 */
/* Compiler settings for C:\carlarepo\CarlaLegacy\CarlaStudio\CStudio\CSAutomation\CSAutomation.idl:
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

const IID IID_ITask = {0x61FE777C,0x09DF,0x11D3,{0x86,0x64,0xE0,0x57,0x0B,0xC1,0x49,0x08}};


const IID LIBID_CSAUTOMATIONLib = {0x61FE776F,0x09DF,0x11D3,{0x86,0x64,0xE0,0x57,0x0B,0xC1,0x49,0x08}};


const CLSID CLSID_TaskImpl = {0x61FE777D,0x09DF,0x11D3,{0x86,0x64,0xE0,0x57,0x0B,0xC1,0x49,0x08}};


#ifdef __cplusplus
}
#endif

