/* ALLOCMEM.C - "safe" memory allocation functions
 ***************************************************************************
 *
 * VOIDP allocMemory(size_t size)
 * VOIDP reallocMemory(VOIDP ptr, size_t size)
 * void freeMemory(VOIDP s)
 * char *duplicateString(const char *pszString_in)
 * char *fitAllocStringExactly(char *s)
 *
 * char szOutOfMemoryMarker_g[101]
 * void (*pfOutOfMemory_g)(size_t size)
 *
 * void setAllocMemoryTracing(const char *filename)
 * void setAllocMemoryTrap(const VOIDP address, int count)
 * void writeAllocMemoryDebugMsg(const char * pszFormat_in, ...)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1988, 1999 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <stdlib.h>
#include <string.h>
#else
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
extern char * strcpy  P((char * dest, const char * src));
extern size_t strlen  P((const char * s));
extern VOIDP  malloc  P((size_t size));
extern VOIDP  realloc P((VOIDP ptr, size_t size));
extern void   free    P((VOIDP ptr));
extern void   abort   P((void));
#endif /*STDC_HEADERS*/
#ifdef _WINDOWS_FOR_REAL
#include <windows.h>
#endif

#include "allocmem.h"
#include "rpterror.h"

extern int exitSafely P((int iCode_in));

#ifdef __MWERKS__
/*#define USE_XX_MALLOC*/
#endif
#ifdef USE_XX_MALLOC
extern VOIDP xx_malloc P((size_t n));
extern VOIDP xx_realloc P((VOIDP s, size_t n));
extern VOIDP xx_free P((VOIDP s));
#define malloc(n)     xx_malloc(n)
#define realloc(s, n) xx_realloc(s, n)
#define free(s)       xx_free(s)
#endif

/************************************************************************/
/*			    GLOBAL VARIABLES				*/
/************************************************************************/

char    szOutOfMemoryMarker_g[101];	/* globally settable by callers */
void (* pfOutOfMemory_g) P((size_t size)) = NULL;

static FILE *		pAllocMemoryDebugFP_m = NULL;
static const VOIDP	trap_address = NULL;
static int		trap_count = 0;
static unsigned		trace_flag = 0;
static void		trap_found P((VOIDP ptr));
static char		debug_buffer[BUFSIZ];
static unsigned long	mem_used = 0;
static VOIDP		pLowBound_m  = NULL;
static VOIDP		pHighBound_m = NULL;

#ifdef applec
#pragma segment S_opaclib
#endif

/***************************************************************************
 * NAME
 *    allocMemory_fail
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Die with an appropriate error message.
 * RETURN VALUE
 *    none (may not return!)
 */
static void allocMemory_fail(size)
size_t size;
{
if (pfOutOfMemory_g != NULL)
	(*pfOutOfMemory_g)(size);
else
	{
	reportError(ERROR_MSG,
		"ALLOCATE MEMORY: No space left%s%s [%ul bytes wanted]\n",
		*szOutOfMemoryMarker_g ? " at: " : "", szOutOfMemoryMarker_g,
		(unsigned long)size);
	exitSafely(2);
	}
}

/***************************************************************************
 * NAME
 *    allocMemory
 * ARGUMENTS
 *    size - number of bytes to allocate
 * DESCRIPTION
 *    "Safe" interface to malloc() -- abort the program with an error message
 *    if we run out of memory.
 * RETURN VALUE
 *    pointer to beginning of area allocated
 */
VOIDP allocMemory(size)
size_t size;
{
register VOIDP p;

p = (VOIDP)malloc(size);
if (pAllocMemoryDebugFP_m != NULL)
#ifndef hab3318
	fprintf(pAllocMemoryDebugFP_m, "m %lu %lx\n",
		(unsigned long)size, (unsigned long)p);
#else
	fprintf(pAllocMemoryDebugFP_m, "m %lu %lu\n",
		(unsigned long)size, (unsigned long)p);
#endif /* hab3318 */
if (p == NULL)
	{
	allocMemory_fail(size);
	return p;
	}
if ((trap_address != NULL) && (p == trap_address) && (--trap_count <= 0))
	{
	trap_found(p);
	}
memset((char *)p, '\0', (size_t)size);
mem_used += size + 2;			/* Allow for heap link overhead */

if ((pLowBound_m == NULL) || (p < pLowBound_m))
	pLowBound_m = p;
if (p > pHighBound_m)
	pHighBound_m = p;

return(p);
}

/***************************************************************************
 * NAME
 *    duplicateString
 * ARGUMENTS
 *    pszString_in - pointer to character string to duplicate
 * DESCRIPTION
 *    Create a duplicate of an existing NUL-terminated character string.
 * RETURN VALUE
 *    pointer to the newly allocated and copied duplicate
 */
char * duplicateString(pszString_in)
const char *	pszString_in;
{
char *	p;
size_t	k;

if (pszString_in == (char *)NULL)
	return((char *)NULL);
k = strlen(pszString_in) + 1;
p = (char *)allocMemory( k );
strcpy(p, pszString_in);
return( p );
}

/***************************************************************************
 * NAME
 *    reallocMemory
 * ARGUMENTS
 *    s    - pointer to string in overlarge allocated buffer
 *    size - new size, either smaller or larger
 * DESCRIPTION
 *    Adjust an allocated buffer to a new size.  Abort the program with an
 *    error message if we run out of memory.
 * RETURN VALUE
 *    pointer to reallocated block
 */
VOIDP reallocMemory(s, size)
VOIDP	s;
size_t	size;
{
VOIDP p;

if (s == NULL)
	p = (VOIDP)malloc(size);
else
	{
	if (pAllocMemoryDebugFP_m != NULL)
#ifndef hab3318
	fprintf(pAllocMemoryDebugFP_m, "f %lx\n", (unsigned long)s);
#else
	fprintf(pAllocMemoryDebugFP_m, "f %lu\n", (unsigned long)s);
#endif /* hab3318 */
	p = (VOIDP)realloc(s, size);
	}
if (pAllocMemoryDebugFP_m != NULL)
#ifndef hab3318
	fprintf(pAllocMemoryDebugFP_m, "m %lu %lx\n",
		(unsigned long)size, (unsigned long)p);
#else
	fprintf(pAllocMemoryDebugFP_m, "m %lu %lu\n",
		(unsigned long)size, (unsigned long)p);
#endif /* hab3318 */
if (p == NULL)
	{
	allocMemory_fail(size);
	return p;
	}
if (	(trap_address != NULL) &&
	((p == trap_address) || (s == trap_address)) &&
	(--trap_count <= 0) )
	trap_found(p);

if ((pLowBound_m == NULL) || (p < pLowBound_m))
	pLowBound_m = p;
if (p > pHighBound_m)
	pHighBound_m = p;

return( p );
}

/***************************************************************************
 * NAME
 *    freeMemory
 * ARGUMENTS
 *    p - pointer to block to deallocate
 * DESCRIPTION
 *    interface to free() -- release previously allocated memory
 * RETURN VALUE
 *    none
 */
void freeMemory(p)
VOIDP p;
{
if (p == NULL)
	return;		/* protect against braindead callers */
if (pAllocMemoryDebugFP_m != NULL)
#ifndef hab3318
	fprintf(pAllocMemoryDebugFP_m, "f %lx\n", (unsigned long)p);
#else
	fprintf(pAllocMemoryDebugFP_m, "f %lu\n", (unsigned long)p);
#endif /* hab3318 */
if ((trap_address != NULL) && (p == trap_address) && (--trap_count <= 0))
	trap_found(p);
if ((p < pLowBound_m) || (p > pHighBound_m))
	trap_found(p);	/* bogus value -- let's notice this! */

free(p);
}

/***************************************************************************
 * NAME
 *    fitAllocStringExactly
 * ARGUMENTS
 *    s - pointer to string in overlarge allocated buffer
 * DESCRIPTION
 *    Shrink the allocated buffer to exactly fit the string.  Abort the
 *    program with an error message if we somehow run out of memory.
 * RETURN VALUE
 *    pointer to reallocated block
 */
char * fitAllocStringExactly(s)
char * s;
{
if (s == (char *)NULL)
	return((char *)NULL);
else
	return( (char *)reallocMemory(s, strlen(s) + 1) );
}

/*****************************************************************************
 * NAME
 *    setAllocMemoryTracing
 * ARGUMENTS
 *    filename - name of the debugging output file
 * DESCRIPTION
 *    turn debugging on (if filename given) or off (if filename is NULL)
 * RETURN VALUE
 *    none
 */
void setAllocMemoryTracing(filename)
const char *filename;
{
if (filename != NULL)
	{
	if (pAllocMemoryDebugFP_m == NULL)
	{
	if (trace_flag++ == 0)
		pAllocMemoryDebugFP_m = fopen(filename, "w");
	else
		pAllocMemoryDebugFP_m = fopen(filename, "a");
	if (pAllocMemoryDebugFP_m != NULL)
		setbuf(pAllocMemoryDebugFP_m, debug_buffer);
	}
	}
else if (pAllocMemoryDebugFP_m != NULL)
	{
	fclose(pAllocMemoryDebugFP_m );
	pAllocMemoryDebugFP_m  = NULL;
	}
}

/*****************************************************************************
 * NAME
 *    setAllocMemoryTrap
 * ARGUMENTS
 *    address - memory address to trap on
 *    count   - which occurrence to trap on
 * DESCRIPTION
 *    turn trapping of memory addresses on
 * RETURN VALUE
 *    none
 */
void setAllocMemoryTrap(address, count)
const VOIDP address;
int count;
{
trap_address = address;
trap_count = count;
}

/*****************************************************************************
 * NAME
 *    trap_found
 * DESCRIPTION
 *    print a message that the trap address has been found, and (for DJGPP)
 *    dump the stack return addresses
 * RETURN VALUE
 *    none -- the program dies
 */
static void trap_found(ptr)
VOIDP ptr;
{
#ifdef __GO32__
int depth = 20;
unsigned long *p = NULL;

if (ptr == trap_address)
	printf("allocMemory: trapping on address %lu\n", (unsigned long)ptr);
else
	printf("freeMemory: invalid address %lu\n", (unsigned long)ptr);
printf("Call frame traceback EIPs: (%d most recent function calls)\n", depth);
p = (unsigned long *)(&p) + 2;
while ((p > (unsigned long *)&p) && (*p > 0x2000L) && (*p < 0x90000000L))
	{
	printf( "  0x%08lx\n", *p);
	fflush(stdout);
	if (--depth <= 0)
	break;
	p = (unsigned long *)*(p - 1) + 1;
	}
#else
#ifdef _WINDOWS_FOR_REAL
static char	szMessageBuffer_s[128];

if (ptr == trap_address)
	wsprintf(szMessageBuffer_s,
		 "allocMemory: trapping on address %lu\n", (unsigned long)ptr);
else
	wsprintf(szMessageBuffer_s,
		 "freeMemory: invalid address %lu\n", (unsigned long)ptr);
MessageBox(0, szMessageBuffer_s, "trap_found()", MB_OK | MB_ICONINFORMATION);
#else
if (ptr == trap_address)
	fprintf(stderr, "allocMemory: trapping on address %lu\n",
		(unsigned long)ptr);
else
	fprintf(stderr, "freeMemory: invalid address %lu\n", (unsigned long)ptr);
#endif
#endif
abort();
}

/***************************************************************************
 * NAME
 *    getAndClearAllocMemorySum
 * DESCRIPTION
 *    Returns amount of memory used by allocMemory calls since last call.
 * RETURN VALUE
 *    Amount of memory used by allocMemory calls since last call.
 */
unsigned long getAndClearAllocMemorySum()
{
unsigned long prev;

prev     = mem_used;	/* Remember how much used */
mem_used = 0;		/* Clear it */
return( prev );		/* Return how much used */
}

/*****************************************************************************
 * NAME
 *    writeAllocMemoryDebugMsg
 * DESCRIPTION
 *    write a message to the memory allocation tracing file if it is open
 * RETURN VALUE
 *    none
 */
#ifdef HAVE_STDARG_H
void writeAllocMemoryDebugMsg(const char * pszFormat_in, ...)
#else
/*VARARGS*/
void writeAllocMemoryDebugMsg(pszFormat_in, va_alist)
const char * pszFormat_in;
va_dcl
#endif
{
va_list ap;
#ifdef HAVE_STDARG_H
va_start(ap, pszFormat_in);
#else
va_start(ap);
#endif
if (pAllocMemoryDebugFP_m != NULL)
#ifdef HAVE_VPRINTF
	vfprintf(pAllocMemoryDebugFP_m, pszFormat_in, ap );
#else
#ifdef HAVE_DOPRNT
	_doprnt(pszFormat_in, ap, pAllocMemoryDebugFP_m);
#endif
#endif
va_end(ap);
}

/***************************************************************************
 * EDIT HISTORY
 * 28-Jul-88	Steve McConnel - write the original code to replace ssutl.c
 *  1-Aug-88	SRMc - delinted
 * 25-Aug-88	SRMc - regularized error messages
 *		     - change errmsg to errloc
 * 21-Oct-88	SRMc - remove register from function parameter declarations
 *		     - reorganize the file header comments
 * 10-Nov-88	SRMc - add myfree()
 *  4-Jan-89	SRMc - fix for Microsoft C
 * 22-Mar-89	SRMc - nomem() is no longer a static function
 * 20-May-89	SRMc - remove #include "dict.h"
 *		     - change errloc to 101 rather than MAXMORPH+1 bytes long
 *			(removed need for defs.h)
 *		     - rename errloc to myalloc_errmsg
 *		     - added mystrdup(),
 *		     - removed reliance on errexit()
 * 13-Jul-89	hab  - de-"lint" the source
 * 31-Jul-89	rk   - mods for MacIntosh Lightspeed's Think_C
 * 07-Aug-89	ab/hab - rename myrealloc() to myshrink(); add myrealloc()
 * 04-Jan-90	ab   - add comment on myrealloc() to top of file
 * 21-Jun-90	RK   - Fix up for THINKC on MAC
 * 19-Oct-90	SRMc - rename file from MYALLO.C to MYALLOC.C
 *		     - rename nomem() to myalloc_fail()
 * 14-Jan-91	SRMc - add TURBO C patches from Thomas B. Ridgeway
 *			(ridgeway@blackbox.hacc.washington.edu)
 * 15-Jan-91	SRMc - refix for Macintosh Lightspeed THINK C
 *  2-Mar-91	SRMc - revise myrealloc() to call malloc() if it's handed a
 *			NULL pointer (as in PCKFUNCS.C)
 *  7-Jun-91	ALB  - Add myused() for report on memory used
 * 16-Sep-91	SRMc - delint with GNU C "-Wall -ansi -pedantic" and
 *			Microsoft C -W3 option
 * 22-Jan-92	SRMc - use myalloc.h
 *  4-Sep-92	SRMc - use newly written report_error()
 * 25-May-93	SRMc - add myalloc_nomemory function pointer
 *  1-Jun-93	SRMc - make mystrdup() safe for NULL pointers
 * 15-Jun-94	SRMc - added debugging functions and variables
 * 20-Sep-94	SRMc - add USE_XX_MALLOC #ifdef for experimental malloc()
 * 26-Oct-94	SRMc - add trap_myalloc() function
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 21-Aug-96	SRMc - change mystrdup() argument to (const char *)
 *  9-Oct-96	SRMc - add myused() from AMPLE sources
 * 31-Jan-97	SRMc - fix for STDC_HEADERS
 * 10-Feb-97	SRMc - renamed myalloc_nomemory to pfOutOfMemory_g
 *		     - renamed myalloc_errmsg   to szOutOfMemoryMarker_g
 *		     - renamed myalloc_debugfp  to pAllocMemoryDebugFP_g
 *		     - renamed trace_myalloc()  to setAllocMemoryTracing()
 *		     - renamed trap_myalloc()   to setAllocMemoryTrap()
 *		     - renamed myshrink()       to fitAllocStringExactly()
 *		     - renamed myused()         to getAndClearAllocMemorySum()
 *		     - renamed mystrdup()       to duplicateString()
 *		     - renamed myrealloc()      to reallocMemory()
 *		     - renamed myalloc()        to allocMemory()
 *		     - renamed myfree()         to freeMemory()
 *		     - renamed myalloc.h and myalloc.c to allocmem.h and
 *			allocmem.c
 * 21-Feb-97	SRMc - convert allocMemory() and reallocMemory() to use size_t
 *			instead of unsigned
 *		     - convert getAndClearAllocMemorySum() to unsigned long
 * 28-Feb-97	SRMc - rename pAllocMemoryDebugFP_g to pAllocMemoryDebugFP_m
 *			and make it a static (module) variable
 *		     - wrote writeAllocMemoryDebugMsg()
 * 17-Apr-97	SRMc - fix for inclusion in Windows DLL
 * 21-May-97	SRMc - merge error messages in allocMemory_fail()
 * 28-May-97	SRMc - make function arguments const where possible
 * 16-Oct-98	SRMc - make header files safe for #including in C++ sources
 * 20-Nov-1998	SRMc - distinguish between actual trapping and invalid
 *			arguments to freeMemory() in trap_found()
 * 27-Jul-1999	SRMc - allow "out of memory" handler to return, which allows
 *			NULL values to be returned from allocMemory() and
 *			reallocMemory()
 */
