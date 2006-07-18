/* TEMPLATE.H - definition of word template structure
 ***************************************************************************
 *
 *	WordTemplate (struct)
 *	WordAnalysis (struct word_analysis)
 *
 ***************************************************************************
 * Copyright 1988-2000 by SIL International
 * All rights reserved.
 */
#ifndef _TEMPLATE_H_INCLUDED
#define _TEMPLATE_H_INCLUDED
#ifdef __cplusplus
extern "C" {
#endif
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "textctl.h"	/* includes change.h strclass.h strlist.h */

/*****************************************************************************
 * NAME
 *    WordAnalysis (struct word_analysis)
 * DESCRIPTION
 *    structure for holding an analysis of a word
 */
typedef struct word_analysis {
	char *	pszAnalysis;
	char *	pszDecomposition;
	char *	pszCategory;
	char *	pszProperties;
	char *	pszFeatures;
	char *	pszUnderlyingForm;
	char *	pszSurfaceForm;

	struct word_analysis *	pNext;
	} WordAnalysis;

/*****************************************************************************
 * NAME
 *    WordTemplate (struct)
 * DESCRIPTION
 *    structure for holding complete information about a word and its
 *    punctuation and formatting environment.
 */
typedef struct {
	/*
	 *  these come from the original input text
	 */
	char *	pszFormat;	/* formatting information prior to word */
	char *	pszOrigWord;	/* original word input to AMPLE */
	char **	paWord;		/* array of alternative surface forms after
				   decapitalization and orthography changes */
	char *	pszNonAlpha;	/* formatting information following word */
	long	iCapital;	/* capitalization flag */
#define NOCAP	0	/* no capitalization */
#define INITCAP	1	/* initial letter capitalized */
#define ALLCAP	2	/* entire word capitalized */
			/* with the enhanced use of capital field, it might be
			 * better to define ALLCAP as -1, and use a long rather
			 * than a short.  This would make processing easier,
			 * and also would allow up to 31 characters to be
			 * individually capitalized rather than only 14.  Too
			 * bad this would break all existing data files!  (not
			 * much payoff in practice either, i would imagine.) */
	/*
	 *  these come from analysis and synthesis functions
	 */
	short           iOutputFlags;	/* marks which fields are wanted */
#define WANT_DECOMPOSITION	0x0001
#define WANT_CATEGORY		0x0002
#define WANT_PROPERTIES		0x0004
#define WANT_FEATURES		0x0008
#define WANT_UNDERLYING		0x0010
#define WANT_ORIGINAL		0x0020
#define WANT_SYNTHESIS		0x0100
	WordAnalysis *	pAnalyses;
	StringList *	pNewWords;
#ifndef hab20000926
	char *       pszRootNodeWord; /* used in TonePars and ToneGen */
#endif /* hab20000926 */
	char *              pszSentenceParse;
	char *              pszWordParse;
	} WordTemplate;

/* dtbin.c */
extern WordTemplate * readTemplateFromAnalysis P((FILE * pInputFP_in,
						 const TextControl * pTextCtl_in));

/* free_wt.c */
extern void freeWordTemplate P((WordTemplate * pWord_io));

/* dtbout.c */
extern void writeTemplate P((FILE *               pOutputFP_in,
				 const char *         pszFilename_in,
				 const WordTemplate * pTemplate_in,
				 const TextControl *  pTextCtl_in));
/* senttemp.c */
extern WordTemplate ** readSentenceOfTemplates P((
						 FILE *              pInputFP_in,
						 const char *        pszAnaFile_in,
						 const StringList *  pFinalPunc_in,
						 const TextControl * pTextCtl_in,
						 FILE *	         pLogFP_in));

/*  textin.c  */
extern WordTemplate * readTemplateFromText P((FILE * pInputFP_in,
						 const TextControl * pTextCtl_in));
#ifndef hab20000510
extern WordTemplate * readTemplateFromTextString P((unsigned char ** ppszString_io,
						 const TextControl * pTextCtl_in));
#endif /* hab20000510 */

extern long decapitalizeWord P((WordTemplate * pWord_io,
				const TextControl * pTextCtl_in));

/*  textout.c  */
extern char * recapitalizeWord P((char *              pszWord_io,
				  long                iRecap_in,
				  const TextControl * pTextCtl_in,
				  const StringList *  pSkipOver_in));
extern void fixSynthesizedWord P((WordTemplate *      pTemplate_io,
				  const TextControl * pTextCtl_in,
				  const StringList *  pSkipOver_in));
extern void writeTextFromTemplate P((FILE *               pOutputFP_in,
					 const WordTemplate * pTemplate_in,
					 const TextControl *  pTextCtl_in));
/* wordanal.c */
extern void writeWordAnalysisList P((const WordAnalysis * pAnalyses_in,
					 FILE *		  pOutputFP_in));
extern void freeWordAnalysisList P((WordAnalysis * pAnalyses_io));

/***************************************************************************
 * EDIT HISTORY
 * 26-APR-82	D. Weber/Bob Kasper
 *    ...
 *  1-Jun-88	SRMc - add orig_word field to template structure
 *  2-Jun-88	SRMc - remove new_word[256] field from template
 * 			structure
 * 11-May-89	SRMc - extract from AMPLE's defs.h file
 * 		     - added strlist pointer fields
 * 		     - renamed structure to word_template
 * 19-Jan-91	SRMc - add catlist and fdlist to the structure,
 * 			to handle the \cat and \fd fields output by
 * 			AMPLE 1.6
 *  1-Mar-91	SRMc - revise some comments
 * 16-Sep-91	SRMc - #include strlist.h, since this uses strlist
 * 			structures
 *  3-Oct-94	SRMc - add relevant function prototypes
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 10-Oct-96	SRMc - bring into line with AMPLE 2.0c
 * 14-Oct-96	SRMc - rename elements of WordTemplate
 *  5-Nov-96	SRMc - define WordAnalysis struct
 *  3-Apr-97	SRMc - #define WANT_ORIGINAL, remove WANT_SURFACE
 *  6-Oct-97	SRMc - minimize explicit #include statements, add comments
 * 10-Oct-97	SRMc - cosmetic changes and proofreading
 *  7-Nov-97	SRMc - wrote writeWordAnalysisList() and freeWordAnalysisList()
 * 14-Jul-98	SRMc - change recapitalizeWord to return a pointer to the
 *			recapitalized word string
 * 21-Jul-98	SRMc - fix a typo in a comment
 * 16-Oct-98	SRMc - make header files safe for #including in C++ sources
 * 20-Apr-2000  hab  - allow for PCPATR \parse and \WordParse fields
 * 10-May-2000  hab  - add readTemplateFromTextString()
 */
#ifdef __cplusplus
}
#endif
#endif /* _TEMPLATE_H_INCLUDED */
