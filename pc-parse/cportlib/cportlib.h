/* CPORTLIB.H - function prototypes for the CPORT library
 *****************************************************************************
 * Copyright 1996, 1998 by Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef CPORTLIB_H_INCLUDED
#define CPORTLIB_H_INCLUDED
#ifdef __cplusplus
extern "C" {
#endif
#include <stdio.h>
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif

#ifndef HAVE_ABS
/* abs.c */
extern int   abs   P((int x));
#define HAVE_ABS 1
#endif

#ifndef HAVE_BCMP
/* bcmp.c */
extern int bcmp P((char *b1, char *b2, int length));
#define HAVE_BCMP 1
#endif

#ifndef HAVE_BCOPY
/* bcopy.c */
extern char *bcopy P((char *src, char *dst, int size));
#define HAVE_BCOPY 1
#endif

#ifndef HAVE_BSEARCH
/* bsearch.c */
extern VOIDP bsearch P((const VOIDP key, const VOIDP base,
			size_t nmemb, size_t size,
			int (* compar)(const VOIDP, const VOIDP)));
#define HAVE_BSEARCH 1
#endif

#ifndef HAVE_BZERO
/* bzero.c */
extern void bzero P((char *dst, unsigned size));
#define HAVE_BZERO 1
#endif

/* ccommand.c */
extern int ccommand P((char ***argvp));

/* concat.c */
extern char *concat P((char *out, ... ));

/* cpystr.c */
extern char *cpystr P((char *out, char *in));

#ifndef HAVE_CTERMID
/* ctermid.c */
extern char *ctermid P((char *s));
#define HAVE_CTERMID 1
#ifndef L_ctermid
#ifdef MSDOS
#define L_ctermid 4
#endif /* MSDOS */
#ifdef _WINDOWS
#define L_ctermid 4
#endif /* _WINDOWS */
#ifdef UNIX
#define L_ctermid 12
#endif /* UNIX */
#endif /* L_ctermid */
#endif

#ifndef HAVE_FFS
/* ffs.c */
extern int ffs P((int i));
#define HAVE_FFS 1
#endif

/* fgetss.c */
extern char *fgetss P((char *s, int n, FILE *stream));

/* fputss.c */
extern void fputss P((char *s, FILE *fp));

/* fsize.c */
extern long fsize P((FILE *fp));

#ifndef HAVE_GETOPT
/* getopt.c */
extern int	getopt P((int argc, char * const argv[], const char *opts));
extern char *	optarg;
extern int	optind;
extern int	opterr;
extern int	optopt;
#define HAVE_GETOPT 1
#endif

#ifndef HAVE_INDEX
/* index.c */
extern char *index P((char *s, int c));
#define HAVE_INDEX 1
#endif

#ifndef HAVE_ISCNTRL
/* iscntrl.c */
extern int iscntrl P((int c));
#define HAVE_ISCNTRL 1
#endif

#ifndef HAVE_ISGRAPH
/* isgraph.c */
extern int isgraph P((int c));
#define HAVE_ISGRAPH 1
#endif

/* isodigit.c */
extern int isodigit P((char c));

#ifndef HAVE_ISPUNCT
/* ispunct.c */
extern int ispunct P((int c));
#define HAVE_ISPUNCT 1
#endif

#ifndef HAVE_ITOA
/* itoa.c */
extern char *itoa P((int value, char *string));
#define HAVE_ITOA 1
#endif

#ifndef HAVE_ITOA8
/* itoa8.c */
extern char *itoa8 P((int value, char *string));
#define HAVE_ITOA8 1
#endif

#ifndef HAVE_ITOAX
/* itoax.c */
extern char *itoax P((int value, char *string));
#define HAVE_ITOAX 1
#endif

#ifndef HAVE_LABS
/* labs.c */
extern long  labs  P((long x));
#define HAVE_LABS 1
#endif

#ifndef HAVE_MEMCCPY
/* memccpy.c */
extern VOIDP  memccpy P((VOIDP dest, const VOIDP src, int c, size_t n));
#define HAVE_MEMCCPY 1
#endif

#ifndef HAVE_MEMCHR
/* memchr.c */
extern VOIDP  memchr  P((const VOIDP s, int c, size_t n));
#define HAVE_MEMCHR 1
#endif

#ifndef HAVE_MEMCMP
/* memcmp.c */
extern int    memcmp  P((const VOIDP s1, const VOIDP s2, size_t n));
#define HAVE_MEMCMP 1
#endif

#ifndef HAVE_MEMCPY
/* memcpy.c */
extern VOIDP  memcpy  P((VOIDP dest, const VOIDP src, size_t n));
#define HAVE_MEMCPY 1
#endif

#ifndef HAVE_MEMMOVE
/* memmove.c */
extern VOIDP  memmove P((VOIDP dest, const VOIDP src, size_t n));
#define HAVE_MEMMOVE 1
#endif

#ifndef HAVE_MEMSET
/* memset.c */
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
#define HAVE_MEMSET 1
#endif

#ifndef HAVE_RAND
/* rand.c */
extern int   rand   P((void));
extern void  srand  P((unsigned seed));
#define HAVE_RAND 1
#endif

#ifndef HAVE_RINDEX
/* rindex.c */
extern char *rindex P((char *s, int c));
#define HAVE_RINDEX 1
#endif

#ifndef HAVE_STRCASECMP
/* strcasec.c */
extern int strcasecmp P((const char *s1, const char *s2));
#define HAVE_STRCASECMP 1
#endif

#ifndef HAVE_STRCHR
/* strchr.c */
extern char * strchr  P((const char * s, int c));
#define HAVE_STRCHR 1
#endif

#ifndef HAVE_STRCSPN
/* strcspn.c */
extern size_t strcspn P((const char * s, const char * reject));
#define HAVE_STRCSPN 1
#endif

/* streq.c */
extern int streq P((const char *s1, const char *s2));

#ifndef HAVE_STRICMP
/* stricmp.c */
extern int stricmp P((const char * pszString1_in, const char * pszString2_in));
#define HAVE_STRICMP 1
#endif

#ifndef HAVE_STRLWR
/* strlwr.c */
extern char *strlwr P((char *string));
#define HAVE_STRLWR 1
#endif

#ifndef HAVE_STRPBRK
/* strpbrk.c */
extern char * strpbrk P((const char * s, const char * accept));
#define HAVE_STRPBRK 1
#endif

#ifndef HAVE_STRPOS
/* strpos.c */
extern int strpos P((const char *s, int ch));
#define HAVE_STRPOS 1
#endif

#ifndef HAVE_STRRCHR
/* strrchr.c */
extern char * strrchr P((const char * s, int c));
extern char *strrchr P((char *s, int c));
#define HAVE_STRRCHR 1
#endif

#ifndef HAVE_STRRPBRK
/* strrpbrk.c */
extern char *strrpbrk P((char *s1, char *s2));
#define HAVE_STRRPBRK 1
#endif

#ifndef HAVE_STRRPOS
/* strrpos.c */
extern int strrpos P((char *s, int ch));
#define HAVE_STRRPOS 1
#endif

#ifndef HAVE_STRSPN
/* strspn.c */
extern size_t strspn  P((const char * s, const char * accept));
#define HAVE_STRSPN 1
#endif

#ifndef HAVE_STRSTR
/* strstr.c */
extern char * strstr  P((const char * s1, const char * s2));
#define HAVE_STRSTR 1
#endif

#ifndef HAVE_STRTOK
/* strtok.c */
extern char * strtok  P((char * s, const char * delim));
#define HAVE_STRTOK 1
#endif

#ifndef HAVE_STRTOL
/* strtol.c */
extern long  strtol  P((const char * nptr, char ** endptr, int base));
#define HAVE_STRTOL 1
#endif

#ifndef HAVE_STRTOUL
/* strtoul.c */
extern unsigned long strtoul P((const char * nptr, char ** endptr, int base));
#define HAVE_STRTOUL 1
#endif

/* strupper.c */
extern char *strupper P((char *string));

#ifndef HAVE_STRUPR
/* strupr.c */
extern char *strupr P((char *string));
#define HAVE_STRUPR 1
#endif

/* swapmem.c */
extern void swapmem P((char *src, char *dest, int length));

/* toint.c */
extern int toint P((int c));

#ifndef HAVE_TOLOWER
/* tolower.c */
extern int tolower P((int c));
#define HAVE_TOLOWER 1
#endif

#ifndef HAVE_TOUPPER
/* toupper.c */
extern int toupper P((int c));
#define HAVE_TOUPPER 1
#endif

/* zapnl.c */
extern char *zapnl P((char *s));

#ifdef __cplusplus
}
#endif
#endif /*CPORTLIB_H_INCLUDED*/
