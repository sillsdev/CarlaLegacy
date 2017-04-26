/* FSIZE.C
 *
 * EDIT HISTORY
 * 13-Nov-87	SRMc - originally written
 *  7-Sep-90	SRMc - support SCO's cross compiler
 * 10-Mar-95	SRMc - rename BSD4 to BSD
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 *  4-Mar-96	SRMc - fix for DJGPP 2.0
 *  1-Apr-98	hab  - conditionally uncompiled disk size code for MSC
 *			VC v. 5.0 (i.e. _MSC_VER 1100)
 * 12-May-1999	SRMc - fix MSVC compiler warning about "not all control paths
 *			return a value"
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#include <sys/stat.h>
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef HAVE_SYS_TIME_H
#include <sys/time.h>
#endif
#ifdef HAVE_SYS_RESOURCE_H
#include <sys/resource.h>
#endif

#ifdef _MSC_VER
#include <dos.h>
#endif

#ifdef __DJGPP__
#include <libc/file.h>
#include <dos.h>
#endif

/************************************************************************
 * NAME
 *    fsize
 * ARGUMENTS
 *    fp - FILE pointer
 * DESCRIPTION
 *    If fp is an input file, return its size in bytes.
 *    Otherwise return the amount of available space on the disk.
 *    If Unix, then this is the soft limit on file size, which may not
 *    mean much.  If MSDOS, then this is the amount of space available
 *    on the current default disk, which may not even be where the file
 *    is located.
 * RETURN VALUE
 *    file size, or available space
 */
long fsize(fp)
FILE * fp;
{
long size = 0;

#ifdef UNIX
struct stat fstatus;
struct rlimit maxfsize;
if (fstat( fileno(fp), &fstatus ) == -1)
	return( -1L );
if ((fp->_flag & _IOREAD) && !(fp->_flag & _IORW))
	return( (long)fstatus.st_size );
if (getrlimit(RLIMIT_FSIZE, &maxfsize ) == -1)
	return( -1L );
size = (long)maxfsize.rlim_cur;
#endif

#ifdef _MSC_VER
struct _stat fstatus;
#if _MSC_VER < 1100
union REGS inr, outr;
#endif

if (_fstat( _fileno(fp), &fstatus ) == -1)
	return( -1L );
if (!(fstatus.st_mode & _S_IFREG))
	return( -1L );
#if _MSC_VER < 1400
if ((fp->_flag & _IOREAD) && !(fp->_flag & _IORW))
	size = (long)fstatus.st_size;		/* input file */
else
	{
#if _MSC_VER < 1100
	inr.h.ah = 0x36;		/* get disk free space */
	inr.h.dl = fstatus.st_dev;	/* for the appropriate drive */
	intdos( &inr, &outr );
	if (outr.x.ax == -1)
	return( -1L );
	size  = outr.x.cx;	/* bytes/sector */
	size *= outr.x.ax;	/* sectors/cluster */
	size *= outr.x.bx;	/* available clusters on current drive */
#endif
	}
#else
/* There doesn't seem to be any way to easily get this information once we hit MSVC 14.0 */
#endif
#endif

#ifdef __DJGPP__
struct stat	sFileStatus;
struct dfree	sDiskFree;

if (fstat( fileno(fp), &sFileStatus ) == -1)
	return( -1L );
if ((fp->_flag & _IOREAD) && !(fp->_flag & _IORW))
	return( (long)sFileStatus.st_size );
getdfree(sFileStatus.st_dev+1, &sDiskFree);

size  = sDiskFree.df_avail;
size *= sDiskFree.df_sclus;
size *= sDiskFree.df_bsec;
#endif

return size;
}
