/* R.C - simple program illustrating the applyKimmoRecognizer() function
 * compile with this command in a subdirectory under pc-parse-1997...:
 * cc -I.. -I../include -DHAVE_CONFIG_H -o r r.c -L../lib -lkimmo -lpatr -lopac -lcport
 ******************************************************************************
 * revised February 17, 1997 for PC-Kimmo version 2.1b8
 */
#include <stdio.h>
#include "kimmo.h"
#ifndef isatty
extern int isatty P((int fd));
#endif
#ifndef fileno
extern int fileno P((FILE*));
#endif
/*
 *  global variables required by PC-Kimmo functions
 */
FILE *	Log_fp = NULL;		/* log FILE pointer */
/*
 *  memory to release if we run out of memory
 */
char *	emergency_memory = NULL;
/*
 *  local definitions and module variables
 */
#define MAX_WORD_SIZE	512
static KimmoData	sLang_m = {
	FALSE,		/* bLimit      - limit to a single good result */
	0,			/* iTraceLevel - enable tracing of Kimmo processing */
	FALSE,		/* bUsePATR    - enable parsing with PATR functions */
	FALSE,		/* bSilent     - disable stderr messages */
	TRUE,		/* bShowWarnings - allow warning messages */
	'<',		/* cGlossBegin - optionally surround morphnames */
	'>',		/* cGlossEnd       in synthesizer input strings */
	KIMMO_DEFAULT_COMMENT,	/* begins comment in input lines */
	NULL,		/* pLogFP      - output log FILE */
	};

/*****************************************************************************
 * NAME
 *    display_rec_result
 * DESCRIPTION
 *    write the PC-Kimmo recogizer() results to the standard output
 * RETURN VALUE
 *    none
 */
void display_rec_result(pResult_in)
KimmoResult *	pResult_in;
{
KimmoMorpheme * mp;

printf("    ");
for ( mp = pResult_in->analysis ; mp ; mp = mp->next )
	{
	if (mp->morph && mp->morph->lex_string)
	printf("%s", mp->morph->lex_string);
	}
printf("    ");
for ( mp = pResult_in->analysis ; mp ; mp = mp->next )
	{
	if (mp->morph && mp->morph->lex_gloss)
	printf("%s", mp->morph->lex_gloss);
	}
if (sLang_m.gram != NULL)
	{
	if (pResult_in->PATR_result == NULL)
	printf("\n    *** no PATR results ***");
	else
	writePATRParses(pResult_in->PATR_result, stdout, &sLang_m.sPATR);
	}
printf("\n");
}

/*****************************************************************************
 * NAME
 *    main
 * DESCRIPTION
 *    main procedure for simple program illustrating the custom use of the
 *    PC-Kimmo function library
 * RETURN VALUE
 *    0 if successful, nonzero if an error occurs
 */
int main(argc,argv)
int	argc;
char *	argv[];
{
KimmoResult *		resp;
KimmoResult *		rp;
char			word[MAX_WORD_SIZE+1];
/*
 *  load the rules file, lexicon file, and (optional) grammar file
 *  first check for a plausible number of command line arguments
 */
if (argc < 3)
	{
	fprintf(stderr,
		"usage: %s rulefile lexfile [grammarfile] <input >output\n",
		argv[0] );
	exit(1);
	}
sLang_m.cComment = ';';
if (loadKimmoRules((unsigned char *)argv[1], &sLang_m) < 0)
	exit(1);
if (loadKimmoLexicon((unsigned char *)argv[2], KIMMO_ANALYSIS, &sLang_m) < 0)
	exit(1);
if (argc > 3)
	{
	sLang_m.sPATR.cComment    = sLang_m.cComment;
	sLang_m.sPATR.iDebugLevel = 0;
	if (loadPATRGrammar(argv[3], &sLang_m.sPATR) == 0)
	exit(1);
	sFlags_m.parsing = 1;
	/*
	 * you might want to fiddle with these settings (see patr.h and patrdata.c)
	 *		sPATRData_g.bFailure
	 *		sPATRData_g.bUnification
	 *		sPATRData_g.eTreeDisplay
	 *		sPATRData_g.bGloss
	 *		sPATRData_g.iFeatureDisplay
	 *		sPATRData_g.iMaxAmbiguities
	 */
	}
/*
 *  you might want to fiddle with these settings (see kimmo.h):
 *		sFlags_m.limit
 *		sFlags_m.trace
 */
/*
 *  process the data, reading from stdin and writing to stdout
 */
while (gets(word) != (char *)NULL)
	{
	if (!isatty(fileno(stdin)))
	puts(word);
	resp = applyKimmoRecognizer((unsigned char *)word, &sLang_m);
	if (resp == (KimmoResult *)NULL)
	printf("    form not recognized: %s\n", word);
	else
	{
	for ( rp = resp ; rp ; rp = rp->link )
		{
		display_rec_result(rp);
		}
	freeKimmoResult(resp);
	}
	}
return(0);
}
