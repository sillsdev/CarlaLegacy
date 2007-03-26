/* Ana2XmlLib.H - main header file
 ***************************************************************************
 * Copyright 2000 by the SIL International
 * All rights reserved.
 */

#ifndef _ANA2XML_H_INCLUDED_
#define _ANA2XML_H_INCLUDED_
#ifdef __cplusplus
extern "C" {
#endif

#include <stdio.h>
#include <ctype.h>
#include <time.h>
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef STDC_HEADERS
#include <string.h>
#include <stdlib.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#define strrchr rindex
#endif
extern char * strchr  P((const char *s, int c));
extern char * strrchr P((const char *s, int c));
extern char * strstr  P((const char *s, const char *t));
extern char * strpbrk P((const char *s, const char *t));
extern char * strcpy  P((char *s, const char *t));
extern char * strncpy P((char *s, const char *t, size_t len));
extern int    strcmp  P((const char *s, const char *t));
extern size_t strlen  P((const char *s));
extern char * bsearch P((const VOIDP key, const VOIDP base,
			 size_t nmemb, size_t size,
			 int (*compar)(const VOIDP, const VOIDP)));
#endif /* STDC_HEADERS */
#if _MSC_VER >= 800
#include <io.h>			/* for _isatty(fd) */
#endif
#include "template.h"
/* SIL library headers */
#include "cportlib.h"
#include "opaclib.h"
#include "stample.h"	/* for declarations shared with AMPLE */

/* UNIX-style names to Microsoft's equivalents. */
#ifdef _MSC_VER
#ifndef isascii
#define isascii __isascii
#endif
#endif

#ifndef myisspace
#define myisspace(x) (isascii(x) ? isspace(x) : FALSE)
#endif
/*
 *  for those who don't like embedded numbers for anything...
 */
#ifndef TRUE
#define TRUE    1       /* what do you think? */
#define FALSE   0
#endif
/*
 *  helpful names for special character values
 */
#ifndef NUL
#define NUL     '\0'    /* ASCII mnemonic */
#endif
/*
 *  sizes for misc buffers
 */
#define BUFSIZE  300            /* general size for scratch buffers */

#ifndef FILENAME_MAX
#define FILENAME_MAX 128
#endif

/*****************************************************************************
 * NAME
 *    AnaMorpheme
 * DESCRIPTION
 *    This structure contains information for a morpheme.
 */
typedef struct ana_morpheme
{
  unsigned char	 iMorphType;	/* bit fields for morpheme type */
  char * pszMorphname;		/* morphname from \a field */
  char * pszUnderForm;		/* underlying form from \u field */
  char * pszDecomposition;	/* decomposition from \d field */
  char * pszMorphCat;		/* root  category from \a field or */
								/* affix category mapping from \cat field */
  char * pszProperties;		/* properties from \p field */
  char * pszFeatureDescriptors;	/* feature descriptors from \fd field */
  struct ana_morpheme *	pRightLink;	/* next one in list */
  struct ana_morpheme *	pLeftLink;	/* previous one in list */
} AnaMorpheme;

/*****************************************************************************
 * NAME
 *    AnaData
 * DESCRIPTION
 *    This structure contains information for format of ANA file and other
 *    globals.
 *    data structure that collects the global variables in one place
 */
typedef struct
{
  int		 iDebugLevel;	/* do we dump lots of stuff? */
  char		 cBeginRoot;	/* delimiter for beginning roots */
  char		 cEndRoot;	/* delimiter for ending roots */
  unsigned long  uiWordCount;	/* word count */
  TextControl	 sTextCtl;	/* output control info */
  char *	 pszInputFile;	/* input file name */
  FILE *	 pInputFP;	/* input file pointer */
  char *	 pszOutputFile;	/* input file name */
  FILE *	 pOutputFP;	/* output file pointer */
  char *	 pszLogFile;	/* input file name */
  FILE *	 pLogFP;	/* log file pointer */
} AnaData;

/*****************************************************************************
 *  GLOBAL VARIABLES
 */
extern const int	iAna2XmlVersion_g;
extern const int	iAna2XmlRevision_g;
extern const int	iAna2XmlPatchlevel_g;
extern const char	cAna2XmlPatchSep_g;
extern const char *	pszAna2XmlDate_g;
extern const char *	pszAna2XmlYear_g;
#ifdef __DATE__
extern const char *	pszAna2XmlCompileFormat_g;
extern const char *	pszAna2XmlCompileDate_g;
extern const char *	pszAna2XmlCompileTime_g;
#else
extern const char *	pszAna2XmlTestVersion_g;
#endif

/*
 *  The lower four bits of the iMorphType byte tell the program what type of
 *  morpheme it's dealing with.  All of the code assumes the same treatment
 *  of these bits, which establish the basic distinction among prefixes,
 *  infixes, roots, and suffixes.
 */
#define MORPHTYPE_MASK 0x0F
#define PFX            0x01	/* prefix morpheme */
#define ROOT           0x02	/* root morpheme */
#define SFX            0x04	/* suffix morpheme */
#define IFX            0x08	/* infix morpheme */
#define STAMP_UNIFIED  0x0F
/*
 *  The upper four bits of the iMorphType byte are used in widely varying
 *  ways, partly dependent on what the code is doing, and then partly
 *  dependent on the setting of the lower four bits.
 */
#define RSC_MASK        0360    /* all four bits used to allow 4 types of
								 * proto-forms for roots */
#define RSC              020    /* lowest value for Regular Sound Change
				 * (others generated by shifting left) */
#ifdef __cplusplus
}
#endif
#endif /*_ANA2XML_H_INCLUDED_*/
