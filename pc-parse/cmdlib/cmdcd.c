/* CMDCD.C - function to support a "change directory" command
 ***************************************************************************
 *
 * void doCmdChdir(const char * pszDirectory_in)
 *
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#include <ctype.h>
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <stdlib.h>
#include <string.h>
#else
extern char * strcpy P((char * dest, const char * src));
extern char * getenv P((const char *name));
#endif /* STDC_HEADERS */
#ifdef HAVE_UNISTD_H
#include <unistd.h>
#else
#ifdef HAVE_GETCWD
#if _MSC_VER < 1100
extern char *getcwd P((char *buf, size_t size));
#endif
#endif
#ifdef UNIX
extern int chdir P((const char *dirname));
#endif
#endif
#ifndef HAVE_GETCWD
extern char *getwd P((char *buf));
#endif

#include "opaclib.h"
#include "cmd.h"

#ifdef _WINDOWS
#undef MSDOS
#endif
#ifndef isascii
#define isascii(c) (!(c & ~0177))
#endif
#ifndef TRUE
#define TRUE 1
#define FALSE 0
#endif

#ifndef NUL
#define NUL '\0'
#endif

#ifdef _MSC_VER
#include <direct.h>		/* for _getcwd(), _getdrive(), _chdir(), ... */
#endif

#ifdef __GO32__
#include <dos.h>
#if __DJGPP__ < 2
extern int _get_default_drive();
#endif
#define _getcwd(a,b)	getcwd(a,b)
#define _chdir(a)	chdir(a)
extern int _getdrive();
extern int _chdrive(int drive);
#endif

#ifdef applec
#pragma segment S_cmdlib
#endif

#ifdef __GO32__
int _chdrive(int drive)
{
int k;

k = bdos(0x0E, drive-1, 0) & 0xFF;
if (drive > k)
	return(-1);
return(0);
}

int _getdrive()
{
#if __DJGPP__ >= 2
unsigned uiDrive;
_dos_getdrive(&uiDrive);
return( uiDrive );
#else
return( _get_default_drive() + 1 );
#endif
}
#endif

/*****************************************************************************
 * NAME
 *    do_mac_cd
 * DESCRIPTION
 *    execute a CD command for the Apple Macintosh
 * RETURN VALUE
 *    none
 */
#ifdef MACINTOSH
#undef HAVE_HOME
static void do_mac_cd(pszPathname_in)
const char *	pszPathname_in;
{
char buf[256];
char *p;
WDPBRec paramBlock;
long ioWDProcID;

strcpy(buf, pszPathname_in);
/* a directory pathname should end in a colon; supply if needed */
for ( p = buf ; *p ; p++ )
	;
if (*(p-1) != ':')
	{
	*p++ = ':';
	*p = '\0';
	}
/*
 *  The incredible mess that follows here is because the high-level
 *  SetVol does not work when passed the name of a directory not
 *  previously used.  Instead, it is necessary to use the low level
 *  calls, and ask for a working directory to be opened.
 */
#ifdef THINK_C
paramBlock.ioCompletion = (ProcPtr)NULL;
paramBlock.ioNamePtr = (StringPtr)CtoPstr(buf);
#else
#ifdef __MWERKS__
paramBlock.ioCompletion = (IOCompletionUPP)NULL;
paramBlock.ioNamePtr = (StringPtr)C2PStr(buf);
#else
paramBlock.ioCompletion = (ProcPtr)NULL;
paramBlock.ioNamePtr = (StringPtr)c2pstr(buf);
#endif
#endif
paramBlock.ioVRefNum = 0;
paramBlock.ioWDDirID = 0;
if(PBHSetVol(&paramBlock, FALSE) != 0)
	{
	displayNumberedMessage(&sCmdInvalidDirectory_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
			   NULL, 0);
	return;
	}
paramBlock.ioNamePtr = NULL;
PBHGetVol (&paramBlock, FALSE);
ioWDProcID = paramBlock.ioWDProcID;
paramBlock.ioNamePtr = NULL;
PBOpenWD (&paramBlock, FALSE);
SetVol(NULL, paramBlock.ioVRefNum);
}
#endif /*MACINTOSH*/

/*****************************************************************************
 * NAME
 *    do_dos_cd
 * DESCRIPTION
 *    execute a CD command for MS-DOS
 * RETURN VALUE
 *    none
 */
#ifdef DOS_FILESYSTEM		/* MSDOS or MS WINDOWS */
#undef HAVE_HOME
static void do_dos_cd(pszPathname_in)
const char *	pszPathname_in;
{
int	k;
int	drive;
int	olddrive;
char *	olddir;
char *	newdir;

olddir = _getcwd(NULL, 128);
olddrive = _getdrive();
if ((pszPathname_in[1] == ':') && (pszPathname_in[2] == NUL))
	k = 0;
else
	k = _chdir(pszPathname_in);
if (k != 0)
	goto bad_directory;
if (pszPathname_in[1] == ':')
	{
	drive = pszPathname_in[0];
	if (isascii(drive) && islower(drive))
	drive -= 'a';
	else
	drive -= 'A';
	++drive;
	k = _chdrive(drive);
	if (k != 0)
	{
bad_directory:
	if (olddrive != 0)
		_chdrive(olddrive);
	if (olddir != NULL)
		_chdir(olddir);
	displayNumberedMessage(&sCmdInvalidDirectory_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   pszPathname_in, 0);
	}
	}
if (olddir != NULL)
	free(olddir);
if (k == 0)
	{
	newdir = _getcwd(NULL, 80);
	if (newdir != NULL)
	{
	fprintf(stderr, "%s\n", newdir);
	free(newdir);
	}
	}
}
#endif /*DOS_FILESYSTEM*/

/*****************************************************************************
 * NAME
 *    do_unix_cd
 * DESCRIPTION
 *    execute a CD command for Unix
 * RETURN VALUE
 *    none
 */
#ifdef UNIX
#define HAVE_HOME
void do_unix_cd(pszPathname_in)
const char *	pszPathname_in;
{
int		k;
char		pathname[1026];

#ifdef HAVE_GETCWD
if (getcwd(pathname, 1026) == NULL)
	{
	perror("CD");
	return;
	}
#else
if (getwd(pathname) == NULL)
	{
	fprintf(stderr, "%s\n", pathname);
	return;
	}
#endif
k = chdir(pszPathname_in);
if (k != 0)
	{
	chdir(pathname);
	displayNumberedMessage(&sCmdInvalidDirectory_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
			   pszPathname_in, 0);
	return;
	}
#ifdef HAVE_GETCWD
if (getcwd(pathname, 1026) != NULL)
	fprintf(stderr, "%s\n", pathname);
else
	perror("CD");
#else
getwd(pathname);
fprintf(stderr, "%s\n", pathname);
#endif
}
#endif /*UNIX*/

/*****************************************************************************
 * NAME
 *    do_vms_cd
 * DESCRIPTION
 *    execute a CD command for VMS
 * RETURN VALUE
 *    none
 */
#ifdef vms
#define HAVE_HOME
void do_vms_cd(pszPathname_in)
const char *	pszPathname_in;
{
int k;
char pathname[1026];
char *homedir;

if (getcwd(pathname, 1026) == NULL)
	{
	perror("CD");
	return;
	}
k = chdir(pszPathname_in);
if (k != 0)
	{
	chdir(pathname);
	displayNumberedMessage(&sCmdInvalidDirectory_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
			   pszPathname_in, 0);
	return;
	}
if (getcwd(pathname, 1026) != NULL)
	fprintf(stderr, "%s\n", pathname);
else
	perror("CD");
}
#endif /*vms*/

/*****************************************************************************
 * NAME
 *    doCmdChdir
 * DESCRIPTION
 *    Make the indicated directory current.
 * RETURN VALUE
 *    none
 */
void doCmdChdir(pszPathname_in)
const char *	pszPathname_in;
{
char *	pszPath;

if (wantCmdHelp(pszPathname_in, "CD <pathname>   (no default)\n"))
	return;
if ((pszPathname_in == NULL) || (*pszPathname_in == NUL))
	{
#ifdef HAVE_HOME
	pszPathname_in = getenv("HOME");	/* default to home directory */
	if (pszPathname_in == NULL)
#endif
	{
	displayNumberedMessage(&sCmdMissingDirectory_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0);
	return;
	}
	}
if (getCmdTakeLevel() != 0)
	pszPath = buildAdjustedFilename(pszPathname_in, getCmdTakeFile(), NULL);
else
	pszPath = duplicateString(pszPathname_in);

#ifdef MACINTOSH
do_mac_cd(pszPath);
#endif
#ifdef DOS_FILESYSTEM		/* MSDOS or MS WINDOWS */
do_dos_cd(pszPath);
#endif
#ifdef UNIX
do_unix_cd(pszPath);
#endif
#ifdef vms
do_vms_cd(pszPath);
#endif

freeMemory(pszPath);
}
