/* Define to 1 if we are running on a Unix variant. */
#define UNIX 1

/*********************** END OF INVARIANT TOP MATTER ***********************/
@TOP@
/* Special definitions for processing by autoheader. */

/* Define to 1 if the ANSI keyword "void" works.  */
#undef HAVE_VOID

/* Define to 1 if ANSI function prototypes are usable.  */
#undef HAVE_PROTOTYPES

/* Define to 1 if gettimeofday exists and allows NULL timezone argument */
#undef GETTIMEOFDAY_ALLOWS_NULL_TZ
@BOTTOM@
/****************** BEGINNING OF INVARIANT BOTTOM MATTER *******************/

/* Define to 1 if subprocesses can be spawned. */
#define HAS_SUBPROCESS 1

/* Define to the character used to separate directory levels in a pathname. */
#define DIRSEPCHAR '/'

/* clever hack to handle function prototypes flexibly */
#ifdef HAVE_PROTOTYPES
#define P(args) args
#else
#define P(args) ()
#endif

/* handle missing void keyword, and define the most generic pointer type */
#ifdef HAVE_VOID
#undef void
#define VOIDP void *
#else
#define void
#define VOIDP char *
#endif

/* define to the standard maximum value of unsigned short ints */
#ifndef MAX_USHORT
#define MAX_USHORT 0xFFFF
#endif

/* check whether or not we're running on a RISC CPU */
#undef RISC
#ifdef sparc
#define RISC 1
#endif

/* paranoia about the readline libary and headers */
#ifndef HAVE_READLINE
#undef HAVE_READLINE_READLINE_H
#endif
#ifndef HAVE_READLINE_READLINE_H
#undef HAVE_READLINE
#endif

/* make sure alloca is defined for GNU C */
#ifdef __GNUC__
#ifdef HAVE_ALLOCA
#ifndef HAVE_ALLOCA_H
#define alloca __builtin_alloca
#endif
#endif
#endif
