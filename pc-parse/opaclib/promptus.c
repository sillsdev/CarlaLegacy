/* PROMPTUS.C - prompt the user for keyboard input
 ***************************************************************************
 *
 * char * promptUser(const char * pszPrompt_in)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1992, 2000 by SIL International.  All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#else
#ifndef HAVE_STRRCHR
#define strrchr rindex
#endif
extern VOIDP  memcpy  P((VOIDP dest, const VOIDP src, size_t n));
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
extern char * strncpy P((char * dest, const char * src, size_t n));
extern char * strrchr P((const char * s, int c));
#endif /*STDC_HEADERS*/
#ifdef HAVE_UNISTD_H
#include <unistd.h>	/* for ctermid() */
#endif
#ifdef HAVE_SIGNAL
#include <signal.h>
typedef RETSIGTYPE (* signalfunction_t) P((int));
#endif
#ifdef HAVE_READLINE_READLINE_H
#include <readline/readline.h>
#endif
#ifdef HAVE_READLINE_HISTORY_H
#include <readline/history.h>
#endif

#include "opaclib.h"	/* for exitSafely() */

#ifdef UNIX
#ifdef HAVE_CTERMID
#define TTY ctermid((char *)NULL)
#else
#define TTY "/dev/tty"
#endif
#endif

#ifdef MSDOS
#include <dos.h>
#define TTY "con"
#ifdef _MSC_VER
#define USE_DOS_INT_210A
#endif
#endif

#ifndef _MSC_VER
#ifndef isatty
extern int isatty P((int fd));
#endif
#ifndef fileno
extern int fileno P((FILE *stream));
#endif
#else /* _MSC_VER */
#include <io.h>
#endif

#ifndef NUL
#define NUL '\0'
#endif
#ifndef MAXLINELEN
#define MAXLINELEN 127
#endif

/* Make sure the principal variations are mutually exclusive */
#define USE_STDIN 1	/* the default, simplest case */
#ifdef HAVE_READLINE
#undef USE_DOS_INT_210A
#undef applec
#undef __GO32__
#undef USE_STDIN
#endif
#ifdef __GO32__
#undef USE_DOS_INT_210A
#undef applec
#undef USE_STDIN
#endif
#ifdef USE_DOS_INT_210A
#undef applec
#undef USE_STDIN
#endif
#ifdef applec
#undef USE_STDIN
#endif

/*****************************************************************************
 * NAME
 *    promptUser
 * ARGUMENTS
 *    pszPrompt_in - prompt message
 * DESCRIPTION
 *    Prompt the user, then read a line of input from the standard input.
 *    If EOF occurs, try to reopen stdin, attaching to the the terminal.
 *    If stdin is redirected, echo what is read to the terminal.
 * RETURN VALUE
 *    none
 */
char * promptUser(pszPrompt_in)
const char * pszPrompt_in;
{
#ifdef HAVE_READLINE
static char * pszOld = NULL;
char * p;
#ifdef HAVE_SIGNAL
signalfunction_t	pOldSigFunc;
/*
 *  ignore SIGINT during keyboard input
 */
#ifdef SIGINT
pOldSigFunc = signal( SIGINT, SIG_IGN );
#endif
#endif

if (pszOld)
	free(pszOld);
p = readline(pszPrompt_in ? pszPrompt_in : "");
#ifdef HAVE_ADD_HISTORY
if (p && *p)
	add_history(p);
#endif
pszOld = p;
#ifdef HAVE_SIGNAL
/*
 *  restore any previous SIGINT trapping
 */
#ifdef SIGINT
signal( SIGINT, pOldSigFunc );
#endif
#endif
return p;
#endif /*HAVE_READLINE*/
/*****************************************************************************/
#ifdef USE_DOS_INT_210A
char * p;
static unsigned char buffer[MAXLINELEN];
int num;
char far * pbuf;
union REGS inreg;
union REGS outreg;
struct SREGS segreg;
#ifdef HAVE_SIGNAL
signalfunction_t pOldSigFunc;
/*
 *  ignore SIGINT during keyboard input
 */
#ifdef SIGINT
pOldSigFunc = signal( SIGINT, SIG_IGN );
#endif
#endif

fflush(stdout);
fprintf(stderr, "%s", pszPrompt_in);
fflush(stderr);

memset(buffer, NUL, MAXLINELEN);	/* prepare for DOS call */
buffer[0] = MAXLINELEN - 3;
if (buffer[0] > uiBufferSize_in)
	buffer[0] = uiBufferSize_in;
memset(&inreg,  NUL, sizeof(union REGS));	/* clear memory */
memset(&outreg, NUL, sizeof(union REGS));	/* (for paranoia) */
memset(&segreg, NUL, sizeof(struct SREGS));
inreg.h.ah = 0x0A;			/* int 21H, func 0AH */
pbuf       = buffer;
inreg.x.dx = FP_OFF(pbuf);
segreg.ds  = FP_SEG(pbuf);

intdosx(&inreg, &outreg, &segreg);	/* call DOS for an input line */

num = buffer[1];
memmove(buffer, buffer + 2, num);
buffer[num] = NUL;			/* make sure NUL-terminated */
fputc('\n', stderr);
#ifdef HAVE_SIGNAL
/*
 *  restore any previous SIGINT trapping
 */
#ifdef SIGINT
signal( SIGINT, pOldSigFunc );
#endif
#endif
return buffer;
#endif /*USE_DOS_INT_210A*/
/*****************************************************************************/
#ifdef __GO32__
static unsigned char buffer[MAXLINELEN];
int i;
int c;
#ifdef HAVE_SIGNAL
signalfunction_t pOldSigFunc;
/*
 *  ignore SIGINT during keyboard input
 */
#ifdef SIGINT
pOldSigFunc = signal( SIGINT, SIG_IGN );
#endif
#endif

fflush(stdout);
fprintf(stderr, "%s", pszPrompt_in);
fflush(stderr);
memset(buffer, NUL, MAXLINELEN);
for ( i = 0 ; ; )
	{
	c = bdos(7, 0, 0) & 0xFF;
	if ((c == '\n') || (c == '\r'))
	{
	fputc('\n', stderr);
	if (i < MAXLINELEN-1)
		buffer[i] = '\n';
	break;
	}
	if (c == '\03')
	{
	strcpy(buffer, "\n");
	fputs("^C", stderr);
	break;
	}
	if ((c == '\b') || (c == '\177'))
	{
	if (i > 0)
		{
		--i;
		buffer[i] = NUL;		/* erase the latest character */
		fputs("\b \b", stderr);	/* on the screen as well */
		}
	else
		fputc('\07', stderr);
	continue;
	}
	else if (c == '\33')
	{
	while (i > 0)
		{
		--i;
		if (i < MAXLINELEN-1)
		{
		buffer[i] = NUL;	/* erase the latest character */
		fputs("\b \b", stderr);	/* on the screen as well */
		}
		}
	continue;
	}
	else if (c == '\t')
	{
	if (i < MAXLINELEN-1)
		{
		fputc(' ', stderr);
		buffer[i++] = c;
		}
	}
	else if ((c < ' ') || (i >= MAXLINELEN-1))
	fputc('\07', stderr);
	else
	{
	fputc(c, stderr);
	buffer[i++] = c;
	}
	}
#ifdef HAVE_SIGNAL
/*
 *  restore any previous SIGINT trapping
 */
#ifdef SIGINT
signal( SIGINT, pOldSigFunc );
#endif
#endif
return buffer;
#endif /*__GO32__*/
/*****************************************************************************/
#ifdef applec
char * p;
size_t	len;
size_t	uiPromptLength;
#ifdef HAVE_SIGNAL
signalfunction_t	pOldSigFunc;
/*
 *  ignore SIGINT during keyboard input
 */
#ifdef SIGINT
pOldSigFunc = signal( SIGINT, SIG_IGN );
#endif
#endif

fflush(stdout);
fprintf(stderr, "%s", pszPrompt_in);
fflush(stderr);

p = readLineFromFile(stdin, NULL, NUL);
if (p)
	{
	len = strlen(p);
	uiPromptLength = strlen(pszPrompt_in);
	if (strncmp(p, pszPrompt_in, uiPromptLength) == 0)
	memmove(p, p + uiPromptLength, len - uiPromptLength + 1);
	}
#ifdef HAVE_SIGNAL
/*
 *  restore any previous SIGINT trapping
 */
#ifdef SIGINT
signal( SIGINT, pOldSigFunc );
#endif
#endif
if (p && !isatty(fileno(stdin)))
	fprintf(stderr, "%s\n", p);
return p;
#endif /*applec*/
/*****************************************************************************/
#ifdef USE_STDIN
char * p;
#ifdef HAVE_SIGNAL
signalfunction_t	pOldSigFunc;
/*
 *  ignore SIGINT during keyboard input
 */
#ifdef SIGINT
pOldSigFunc = signal( SIGINT, SIG_IGN );
#endif
#endif

fflush(stdout);
fprintf(stderr, "%s", pszPrompt_in);
fflush(stderr);

p = readLineFromFile(stdin, NULL, NUL);
if (p && !isatty(fileno(stdin)))
	fprintf(stderr, "%s\n", p);
return p;
#endif /*USE_STDIN*/
}

/***************************************************************************
 * EDIT HISTORY
 *  ?-?  -91	Steve McConnel
 *  5-Jun-92	SRMc - fix for putting in the OPAC function library
 * 21-Jul-92	SRMc - put get_yesno() in a file of its own
 *  8-Feb-93	SRMc - call _vheapterm() just to be safe for MSC 7.00
 * 26-May-93	SRMc - handle stupid renaming of functions by MSC 7.00
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 10-Oct-96	SRMc - change exit() to safe_exit()
 * 14-Oct-96	SRMc - change #include "opaclib.h" to extern int safe_exit()
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 * 30-Jan-97	SRMc - fix for STDC_HEADERS
 * 23-May-97	SRMc - renamed safe_exit() to exitSafely()
 * 29-May-97	SRMc - incorporate code from cmdlib/userfunc.c
 *  2-Jun-97	SRMc - doublecheck for EOF from fgets()
 * 12-Jun-97	SRMc - fix type for pOldSigFunc
 *		     - fflush(stderr) after writing the prompt
 *  2-Oct-97	SRMc - fix for revised reportError()
 *  1-Apr-98	hab  - fix for MSC VC 5.0: add #include <io.h>
 * 12-Apr-2000	SRMc - add support for GNU readline as suggested by George
 *			Petasis (petasis@iit.demokritos.gr)
 *		     - use readLineFromFile(stdin) rather than fgets(stdin)
 *		     - change function to return pointer to internal buffer
 *			(possibly dynamically allocated, but who knows?)
 *			instead of using a fixed size buffer passed in
 */
