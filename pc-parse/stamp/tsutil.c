/* TSUTIL.C - utility functions for STAMP
 ***************************************************************************
 *
 * void freeStampAllomorphList(StampAllomorphList * ap)
 *
 * void freeStampMorpheme(StampMorpheme * mp)
 *
 * void dumpStampWord(StampWord * wp,
 *                    FILE *      pOutputFP_in)
 *
 * StampAnalysis * newStampAnalysis(unsigned    morphtype,
 *                                  char *      morphname,
 *                                  char *      rootcatname,
 *                                  StampData * pStamp_in)
 *
 * void freeStampAnalysis(StampAnalysis * analp)
 *
 * void logMissingMorphemes(StampAnalysis * pAnalysis_in,
 *                          StampWord *     pWord_in,
 *                          StampData *     pStamp_in)
 *
 * void writeStampAnalysis(StampAnalysis * analp,
 *                         FILE *          pOutputFP_in,
 *                         StampData *     pStamp_in)
 *
 * void writeStampBriefAnalysis(StampAnalysis *	analp,
 *                              StampAnalysis *	currentp,
 *                              FILE *		pOutputFP_in,
 *                              StampData *	pStamp_in)
 *
 * StampChangeMorphList * newStampChangeMorph(unsigned type,
 *                                            void *   name)
 *
 * void freeStampChangeMorphList(StampChangeMorphList *	list)
 *
 * void writeStampChangeMorphList(StampChangeMorphList * list,
 *                                FILE *		 pOutputFP_in,
 *                                StampData *		 pStamp_in)
 *
 * char * getNextStampToken(char * string,
 *                          char * buffer,
 *                          char * special)
 *
 * char * splitStampChangeString(char *  line,
 *                               char ** p_rep,
 *                               char ** p_marks,
 *                               char ** p_env)
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1989, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#include "stamp.h"

#ifdef TONEPARS
extern void showTones P((FILE *           pOutputFP_in,
			 struct tone_list *tlp));
extern char *tone_domain_name  P((int td));
#endif

static const char szWhitespace_m[7] = " \t\r\n\f\v";

static void	show_allomorph P((StampAllomorph * ap,
				  FILE *           pOutputFP_in,
				  StampData *      pStamp_in));
static void	show_allomorph_list P((StampAllomorphList * ap,
					   FILE *               pOutputFP_in,
					   StampData *          pStamp_in));
static void	show_morpheme P((StampMorpheme * mp,
				 FILE *          pOutputFP_in,
				 StampData *     pStamp_in));

/*************************************************************************
 * NAME
 *    show_allomorph
 * ARGUMENTS
 *    ap - pointer to an allomorph struct
 * DESCRIPTION
 *    Print the allomorph string and any allomorph property names or
 *    allomorph environments
 * RETURN VALUE
 *    none
 */
static void show_allomorph(ap, pOutputFP_in, pStamp_in)
StampAllomorph *ap;
FILE *		pOutputFP_in;
StampData *	pStamp_in;
{
char *	p;

p = ap->pszAllomorph;
fprintf(pOutputFP_in, "  Allo: %s", ((p==NULL) || (*p==NUL)) ? "0" : p );
if (ap->uAlloPropertySet.pProperties != NULL)
	{
	fprintf(pOutputFP_in, " ");
	writeAmplePropertySet(ap->uAlloPropertySet,
			  &pStamp_in->sProperties,
			  pOutputFP_in);
	}
if (ap->pAlloEnvironment != NULL)
	{
	writeAmpleEnvConstraint(pOutputFP_in, ap->pAlloEnvironment->pStringCond,
				FALSE);
	writeAmpleEnvConstraint(pOutputFP_in, ap->pAlloEnvironment->pMorphCond,
				FALSE);
				/* 2.1b1 hab */
	writeAmpleEnvConstraint(pOutputFP_in, ap->pAlloEnvironment->pPunctCond,
				FALSE);
	}
putc('\n', pOutputFP_in);
}

/*************************************************************************
 * NAME
 *    freeStampAllomorphList
 * ARGUMENTS
 *    ap - pointer to allomorph_list list which must be cleaned up
 * DESCRIPTION
 *    Free the space used by an allomorph list.
 * RETURN VALUE
 *    none
 */
void freeStampAllomorphList(ap)
StampAllomorphList * ap;
{
StampAllomorphList *	apx;

if (ap == NULL)
	return;

for ( ; ap ; ap = apx )
	{                           /* loop down the list freeing the nodes */
	if (ap->a.pszAllomorph != NULL)
		freeMemory( ap->a.pszAllomorph );
	if (ap->a.pAlloEnvironment != NULL)
		{
		freeAmpleEnvConstraint(ap->a.pAlloEnvironment->pStringCond);
		freeAmpleEnvConstraint(ap->a.pAlloEnvironment->pMorphCond);
				/* 2.1b1 hab */
		freeAmpleEnvConstraint(ap->a.pAlloEnvironment->pPunctCond);
		}
	apx = ap->pNext;
	freeMemory( (void *)ap );
	}
}

/*************************************************************************
 * NAME
 *    show_allomorph_list
 * ARGUMENTS
 *    ap - pointer to an allomorph list
 * DESCRIPTION
 *    Display the information stored in a list of allomorph_list structures.
 * RETURN VALUE
 *    none
 */
static void show_allomorph_list(ap, pOutputFP_in, pStamp_in)
StampAllomorphList *	ap;
FILE *			pOutputFP_in;
StampData *		pStamp_in;
{
for ( ; ap ; ap = ap->pNext )
	show_allomorph( &(ap->a), pOutputFP_in, pStamp_in );
}

/*************************************************************************
 * NAME
 *    freeStampMorpheme
 * ARGUMENTS
 *    mp - pointer to morpheme structure which must be cleaned up
 * DESCRIPTION
 *    Free the space used by a morpheme structure.
 * RETURN VALUE
 *    none
 */
void freeStampMorpheme(mp)
StampMorpheme * mp;
{
if (mp == NULL)
	return;
if (mp->pszMorphname != NULL)
	freeMemory(mp->pszMorphname);
if ((mp->iMorphType & ROOT) && (mp->u.pRootCategories != NULL))
	freeMemory((void *)mp->u.pRootCategories);
else if (mp->iMorphType & IFX)
	freeAmpleEnvConstraint( mp->u.pInfixEnv );     /* it checks for NULL */
freeStampAllomorphList( mp->pAllomorphs );            /* it checks for NULL */
freeMemory( (void *)mp );
}

/***************************************************************************
 * NAME
 *    show_morpheme
 * ARGUMENTS:
 *    mp - pointer to an morpheme structure
 * DESCRIPTION
 *    Display the information stored for a morpheme in transfer and
 *    synthesis.
 * RETURN VALUE
 *    none
 */
static void show_morpheme(mp, pOutputFP_in, pStamp_in)
StampMorpheme *	mp;
FILE *		pOutputFP_in;
StampData *	pStamp_in;
{
if ((mp == NULL) || (pOutputFP_in == NULL) || (pStamp_in == NULL))
	return;
/*
 *  show the morpheme information
 */
fprintf(pOutputFP_in, "%s",
		(mp->pszMorphname) ? mp->pszMorphname : "{NULL MORPHNAME}" );
if (mp->iMorphType & ROOT)
	{
	if (mp->iMorphType & RSC_MASK)
		fprintf(pOutputFP_in, " (RSC set)");
	if (mp->iToCategory)
		fprintf(pOutputFP_in, "   Cat: %s",
		   findAmpleCategoryName(mp->iToCategory, pStamp_in->pCategories));
	else
		fprintf(pOutputFP_in, "   Cat unknown");
	}
else
	{
	if (mp->iToCategory && mp->iFromCategory)
		fprintf(pOutputFP_in, "   Cat: %s/%s",
		findAmpleCategoryName(mp->iFromCategory,
					  pStamp_in->pCategories),
		findAmpleCategoryName(mp->iToCategory,
					  pStamp_in->pCategories));
	else
		fprintf(pOutputFP_in, "   Cat unknown");
	fprintf(pOutputFP_in, "  " );
	if (mp->iMorphType & PFX)
	fprintf(pOutputFP_in, "PFX" );
	if (mp->iMorphType & IFX)
	fprintf(pOutputFP_in, "IFX" );
	if (mp->iMorphType & SFX)
	fprintf(pOutputFP_in, "SFX" );
	fprintf(pOutputFP_in, "  OC: %d", mp->iOrderClass);
	}
putc('\n', pOutputFP_in);
if (mp->iMorphType & IFX)
	{
	fprintf(pOutputFP_in, "  IFX Loc: ");
	if (mp->iMorphType & PFX_OK)
	fprintf(pOutputFP_in, "PFX ");
	if (mp->iMorphType & ROOT_OK)
	fprintf(pOutputFP_in, "RT ");
	if (mp->iMorphType & SFX_OK)
	fprintf(pOutputFP_in, "SFX ");
	if (mp->u.pInfixEnv != NULL)
		writeAmpleEnvConstraint(pOutputFP_in, mp->u.pInfixEnv, FALSE);
	putc('\n', pOutputFP_in);
	}
#ifdef TONEPARS
showTones(pOutputFP_in, mp->pTones);
fprintf(pOutputFP_in, "\n        %s", tone_domain_name(mp->iDomain));
#endif /* TONEPARS */
/*
 *  show the allomorph information for this morpheme
 */
if ( mp->pAllomorphs )
	show_allomorph_list( mp->pAllomorphs, pOutputFP_in, pStamp_in );
else
	fprintf(pOutputFP_in, "     No allomorphs in dictionary entry\n" );
}

/*************************************************************************
 * NAME
 *    dumpStampWord
 * ARGUMENTS
 *    wp - pointer to a word_template structure
 * DESCRIPTION
 *    Print the contents of the word template
 * RETURN VALUE
 *    none
 */
void dumpStampWord(wp, pOutputFP_in)
StampWord *	wp;
FILE *		pOutputFP_in;
{
if (pOutputFP_in == NULL)
	return;
if ((wp == NULL) || (wp->pTemplate == NULL))
	{
	fprintf(pOutputFP_in, "word_template ptr is NULL\n");
	return;
	}
putc('\n', pOutputFP_in);
fprintf(pOutputFP_in, "  orig_word = \"%s\"\n",
	   wp->pTemplate->pszOrigWord ? wp->pTemplate->pszOrigWord : "{NULL}" );
fprintf(pOutputFP_in, "  word[0]   = \"%s\"\n",
	   wp->pTemplate->paWord && wp->pTemplate->paWord[0] ?
					wp->pTemplate->paWord[0] : "{NULL}" );
fprintf(pOutputFP_in, "  format    = \"%s\"\n",
	   wp->pTemplate->pszFormat ? wp->pTemplate->pszFormat : "{NULL}" );
fprintf(pOutputFP_in, "  non_alpha = \"%s\"\n",
	   wp->pTemplate->pszNonAlpha ? wp->pTemplate->pszNonAlpha : "{NULL}" );
fprintf(pOutputFP_in, "  capital   = %ld\n", wp->pTemplate->iCapital );

writeWordAnalysisList(wp->pTemplate->pAnalyses, pOutputFP_in);

fprintf(pOutputFP_in, "  new_words = ");
if (wp->pTemplate->pNewWords)
	{
	fprintf(pOutputFP_in, "\"");
	writeStringList( wp->pTemplate->pNewWords, "\" \"", pOutputFP_in);
	fprintf(pOutputFP_in, "\"\n");
	}
else
	fprintf(pOutputFP_in, "{NULL}\n");
}

/*************************************************************************
 * NAME
 *    newStampAnalysis
 * DESCRIPTION
 *    Allocate and initialize a StampAnalysis.
 * RETURN VALUE
 *    address of the newly allocated node
 */
StampAnalysis * newStampAnalysis(morphtype, morphname, rootcatname, pStamp_in)
unsigned	morphtype;	/* morpheme type, including RSC bits */
char *		morphname;	/* morphname string */
char *		rootcatname;	/* root category name string */
StampData *	pStamp_in;
{
register StampAnalysis *ap;
unsigned char catcode;
/*
 *  allocate the structure and set all the pointers to NULL
 */
ap = (StampAnalysis *)allocMemory( sizeof(StampAnalysis) );
ap->pszAlloStart         = NULL;
ap->pszAlloEnd           = NULL;
ap->pCurrentAllo         = NULL;
ap->pLeftLink            = NULL;
ap->pRightLink           = NULL;
ap->m.u.pRootCategories  = NULL;       /* (don't use in processing) */
ap->m.pAllomorphs        = NULL;
#ifndef hab2111
#ifdef TONEGEN
ap->bDidSynthWordSave    = FALSE;
#endif /* TONEGEN */
#endif /* hab2111 */
/*
 *  fill in what we know about the morpheme
 */
ap->m.pszMorphname = duplicateString( morphname );
ap->m.iMorphType   = morphtype;
if (morphtype & ROOT)
	{
	/*
	 *  translate the category name to a category code for storing
	 */
	catcode = findAmpleCategoryNumber(rootcatname, pStamp_in->pCategories);
	if (catcode == NUL)
	{
	if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP,
			"Warning: unknown root category - %s\n", rootcatname);
	if (pStamp_in->bOnlyTransfer)
		{
		pStamp_in->pCategories = addAmpleCategory(rootcatname,
						  pStamp_in->pCategories,
						  pStamp_in->pLogFP);
		catcode = findAmpleCategoryNumber(rootcatname,
						  pStamp_in->pCategories);
		}
	}
	}
else
	catcode = NUL;
ap->m.iFromCategory = catcode;
ap->m.iToCategory   = catcode;
ap->m.iOrderClass   = 0;
return( ap );
}

/*************************************************************************
 * NAME
 *    freeStampAnalysis
 * ARGUMENTS
 *    analp - pointer to a list of analysis struct's
 * DESCRIPTION
 *    Deallocate all dynamically allocated space associated with a list
 *    of analysis struct's, including the struct's themselves.
 * RETURN VALUE
 *    none
 */
void freeStampAnalysis(analp)
StampAnalysis *	analp;
{
StampAnalysis *	ap;

#ifndef hab2111
#ifdef TONEGEN
	/*
	 * For tone work, we needed to keep the succesfully synthesized word.
	 * All we need to free is the first pszAlloStart.
	 */
	if (analp && analp->bDidSynthWordSave)
		freeMemory(analp->pszAlloStart);
#endif /* TONEGEN */
#endif /* hab2111 */
for ( ap = analp ; ap ; ap = analp )
	{
	/*
	 * Free only the morphname and the analysis struct, because everything
	 *  else was just linked from the dictionary.
	 */
	if (ap->m.pszMorphname != NULL)    /* free morphname */
		freeMemory(ap->m.pszMorphname);

	analp = analp->pRightLink;
	freeMemory( (void *)ap );                  /* free the node itself */
	}
}

/*************************************************************************
 * NAME
 *    logMissingMorphemes
 * ARGUMENTS
 *    analp - pointer to a list of analysis struct's
 * DESCRIPTION
 *    Display the names of incoming morphemes that have no dict entry
 * RETURN VALUE
 *    none
 */
void logMissingMorphemes(pAnalysis_in, pWord_in, pStamp_in)
StampAnalysis *	pAnalysis_in;
StampWord *	pWord_in;
StampData *	pStamp_in;
{
StampAnalysis *	pAnal;
char *		pszWord;

pszWord = pWord_in->pTemplate->pszOrigWord;
if (	(pWord_in            == NULL) ||
	(pWord_in->pTemplate == NULL) ||
	(pStamp_in           == NULL) ||
	(pStamp_in->pLogFP   == NULL) )
	return;

for ( pAnal = pAnalysis_in ; pAnal ; pAnal = pAnal->pRightLink )
	{
	if (pAnal->m.pAllomorphs == NULL)
	{
	fprintf(pStamp_in->pLogFP,
	 "Warning: \"%s\" not found in dictionary while synthesizing ",
		pAnal->m.pszMorphname);
	if (pszWord != NULL)
		fprintf(pStamp_in->pLogFP, "\"%s\"\n", pszWord);
	else
		{
		writeStampBriefAnalysis(pAnalysis_in, NULL, pStamp_in->pLogFP,
					pStamp_in);
		fputc('\n', pStamp_in->pLogFP);
		}
	pStamp_in->uiMissingMorpheme++;
	}
	}
}

/*************************************************************************
 * NAME
 *    writeStampAnalysis
 * ARGUMENTS
 *    analp - pointer to a list of analysis struct's
 * DESCRIPTION
 *    Display the information stored in a list of analysis struct's.
 * RETURN VALUE
 *    none
 */
void writeStampAnalysis(analp, pOutputFP_in, pStamp_in)
StampAnalysis *	analp;
FILE *		pOutputFP_in;
StampData *	pStamp_in;
{
if ((pOutputFP_in == NULL) || (pStamp_in == NULL))
	return;
fprintf(pOutputFP_in, "------------------------------\n");
if (analp != NULL)
	{
	for ( ; analp ; analp = analp->pRightLink )
	{
	show_morpheme( &(analp->m), pOutputFP_in, pStamp_in );
	fprintf(pOutputFP_in, "------------------------------\n");
	}
	}
else
	fprintf(pOutputFP_in, "------------------------------\n\n");
}

/*************************************************************************
 * NAME
 *    writeStampBriefAnalysis
 * ARGUMENTS
 *    analp    - pointer to a list of analysis struct's
 *    currentp - pointer to a node in list to highlight
 * DESCRIPTION
 *    Display the information stored in a list of analysis struct's.
 *      The display starts with one space, but no <CR>.
 *
 *      There are three states (PFX, ROOT, and SFX), but
 *      only ROOT and non-ROOT states are considered (to allow
 *      for compound roots with intervening infixes).
 *
 * RETURN VALUE
 *    none
 */
void writeStampBriefAnalysis(analp, currentp, pOutputFP_in, pStamp_in)
StampAnalysis *	analp;
StampAnalysis *	currentp;
FILE *		pOutputFP_in;
StampData *	pStamp_in;
{
int state;
char *cp;

for ( state = PFX ; analp ; analp = analp->pRightLink )
	{
	if ((state != ROOT) && (analp->m.iMorphType & ROOT))
		fprintf(pOutputFP_in, " %c",pStamp_in->cBeginRoot), state = ROOT;
	else if ((state == ROOT) && !(analp->m.iMorphType & ROOT))
		fprintf(pOutputFP_in, " %c",pStamp_in->cEndRoot), state = SFX;

	if (analp == currentp)
		fprintf(pOutputFP_in, " [*");

	if (state == ROOT)
		fprintf(pOutputFP_in, " %s",
		(cp = findAmpleCategoryName(analp->m.iToCategory,
						pStamp_in->pCategories)) ?
						  cp : "Undefined-Category!" );
	fprintf(pOutputFP_in, " %s", analp->m.pszMorphname );

	if (analp == currentp)
		fprintf(pOutputFP_in, " *]");

	if ((state == ROOT) && !(analp->pRightLink) )
		fprintf(pOutputFP_in, " %c",pStamp_in->cEndRoot);
	}
}

#ifndef hab2111
#ifdef TONEGEN
/*************************************************************************
 * NAME
 *    writeStampDecomposition
 * ARGUMENTS
 *    analp    - pointer to a list of analysis struct's
 * DESCRIPTION
 *    Display the allomorph information stored in a list of analysis struct's.
 *      The display starts with one space, but no <CR>.
 *
 * RETURN VALUE
 *    none
 */
void writeStampDecomposition(analp, pStamp_in)
StampAnalysis *	analp;
StampData *	pStamp_in;
{

if (pStamp_in == NULL ||
	 pStamp_in->pLogFP == NULL)
   return;

fputc(' ', pStamp_in->pLogFP);
for ( ; analp ; analp = analp->pRightLink )
	{
	  fprintf(pStamp_in->pLogFP, "%s",
		  (analp->pCurrentAllo != NULL) ? analp->pCurrentAllo->pszAllomorph
										: "??");
	if (analp->pRightLink != NULL)
		fputc(pStamp_in->sTextCtl.cDecomp, pStamp_in->pLogFP);
	}
}
#endif /* TONEGEN */
#endif /* hab2111 */

/*************************************************************************
 * NAME
 *    newStampChangeMorph
 * DESCRIPTION
 *    Allocate a new chg_morph node, filling in what you can.
 * RETURN VALUE
 *    pointer to the newly allocated struct
 */
StampChangeMorphList * newStampChangeMorph(type, name)
unsigned	type;	/* morph type byte */
void *		name;	/* pointer to morphname string, or morph_class list */
{
StampChangeMorphList *pNew;

pNew = (StampChangeMorphList *)allocMemory( sizeof(StampChangeMorphList) );
pNew->uMorph.pszName = (char *)name;
pNew->iMorphType     = type;
pNew->iPos           = 0;
pNew->uCat.pClass    = NULL;
pNew->pNext          = NULL;
return( pNew );
}

/*************************************************************************
 * NAME
 *    freeStampChangeMorphList
 * DESCRIPTION
 *    Free the memory allocated to a list of chg_morph struct's.
 * RETURN VALUE
 *    none
 */
void freeStampChangeMorphList(list)
StampChangeMorphList *	list;	/* pointer to a list of chg_morph struct's */
{
StampChangeMorphList *	cp;
StampChangeMorphList *	next;

for ( cp = list ; cp ; cp = next )
	{
	next = cp->pNext;
	if (!(cp->iMorphType & MORPHCLASS))
		freeMemory( cp->uMorph.pszName );
	freeMemory( (void *)cp );
	}
}

static char * type_name(iMorphType_in)
int iMorphType_in;
{
switch (iMorphType_in & MORPHTYPE_MASK)
	{
	case 0:			return "none";
	case PFX:			return "PFX";
	case SFX:			return "SFX";
	case IFX:			return "IFX";
	case ROOT:			return "ROOT";
	case PFX|SFX|IFX:		return "AFFIX";
	case PFX|SFX|IFX|ROOT:	return "ANY";
	default:			return "MIXED?";
	}
}

/*************************************************************************
 * NAME
 *    writeStampChangeMorphList
 * DESCRIPTION
 *    Display the contents of a list of chg_morph struct's
 * RETURN VALUE
 *    none
 */
void writeStampChangeMorphList(list, pOutputFP_in, pStamp_in)
StampChangeMorphList *	list;		/* list of chg_morph struct's */
FILE *			pOutputFP_in;
StampData *		pStamp_in;
{
StampChangeMorphList *cp;
int first;

for ( first = TRUE, cp = list ; cp ; cp = cp->pNext )
	{
	if ( !first )
		fprintf(pOutputFP_in," ");

	if (cp->iMorphType & CATCLASS)
		fprintf(pOutputFP_in,"[%s] ", cp->uCat.pClass->pszName );
	else if (cp->uCat.iCode)
		fprintf(pOutputFP_in,"%s ",
		findAmpleCategoryName(cp->uCat.iCode, pStamp_in->pCategories));

	if (cp->iMorphType & MORPHCLASS)
		fprintf(pOutputFP_in,"[%s]", cp->uMorph.pClass->pszName );
	else
		fprintf(pOutputFP_in,"%s", cp->uMorph.pszName );

	if (pStamp_in->bTrace)
	fprintf(pOutputFP_in, "{%s}", type_name(cp->iMorphType));
	first = FALSE;
	}
 }

/*************************************************************************
 * NAME
 *    getNextStampToken
 * ARGUMENTS
 *    string  - string which needs to be split into tokens
 *    buffer  - storage for the output token
 *    special - string of special one-character tokens
 * DESCRIPTION
 *    Fill the buffer with the next token in the string.  Tokens are
 *    defined as contiguous non-whitespace characters or as the individual
 *    characters in special.  For example,
 *              getNextStampToken( "<[foo]> bar", buf, "<>[]");
 *    would consider these to be individual tokens:
 *              "<"  "["  "foo"  "]"  ">"  "bar"
 * RETURN VALUE
 *    pointer to the beginning of the next token in string
 */
char * getNextStampToken(string, buffer, special)
char *	string;
char *	buffer;
char *	special;
{
unsigned char ch;

if ((string == NULL) && (buffer == NULL))
	return( NULL );             /* no string or output buffer?? */
buffer[0] = NUL;
if (special == NULL)
	special = "";                       /* simplify handling below */
/*
 * ensure we're past whitespace
 */
string += strspn(string, szWhitespace_m);
/*
 *  look for any special one-character tokens
 */
if (strchr(special, *string))
	{
	buffer[0] = *string++;
	buffer[1] = NUL;
	}
else
	{
	while (     (ch = *string) &&
				!myisspace((int)ch) && !strchr(special,(int)((char)ch)) )
		{
		*buffer++ = ch;
		++string;
		}
	*buffer = NUL;              /* terminate the output buffer */
	}
return( string + strspn(string, szWhitespace_m) );
}

/***************************************************************************
 * NAME
 *    splitStampChangeString
 * ARGUMENTS
 *    line
 *    p_rep
 *    p_marks
 *    p_env
 * DESCRIPTION
 *    Parse a line of input which has the following fields:
 *      1) an initial delimited string
 *      2) if p_rep is not NULL, a second delimited string
 *      3) if p_marks is not NULL, an optional list of items before any
 *         environment
 *      4) if p_env is not NULL, an optional environment
 *    The delimiter at the end of the initial string is replaced by a NUL.
 *    The second delimited string is treated similarly, with the address
 *    of the string being stored through p_rep.  If an environment is found,
 *    a pointer to it is stored through p_env.  If any tokens are found
 *    between the end of the strings and the beginning of an environment,
 *    the address of the initial token is stored through p_marks.
 * RETURN VALUE
 *    pointer to the initial delimited string in the input line
 *    (p_rep, p_marks, and p_env are pointers to values which may be
 *    changed as a side effect of this function)
 *    NULL if a required string is not found
 */
char * splitStampChangeString(line,p_rep,p_marks,p_env)
char *line;
char **p_rep;
char **p_marks;
char **p_env;
{
register char *p;
char *match, *replace = NULL, *marks, *env;
char delim;

if (line == NULL)
	return NULL;
/*
 *  find the initial (match) string, and terminate it with a NUL
 */
match = line + strspn(line, szWhitespace_m);
if ((delim = *match++) == NUL)
	return((char *)NULL);
if ((p = strchr(match,delim)) == (char *)NULL)
	return((char *)NULL);
*p++ = NUL;
/*
 *  if requested, find the second (replace) string, and terminate it likewise
 */
if (p_rep != (char **)NULL)
	{
	if ((replace = strchr(p,delim)) == (char *)NULL)
		return((char *)NULL);
	if ((p = strchr(++replace,delim)) == (char *)NULL)  /* (adjust replace) */
		return((char *)NULL);
	*p++ = NUL;
	}
/*
 *  isolate any markers or environment
 */
env = (char *)NULL;
marks = p + strspn(p, szWhitespace_m);
if ((*marks != NUL) && (p_env != (char **)NULL))
	{
	if ((*marks == '/') || matchBeginning(marks,"+/"))
		{
		env = marks;
		marks = (char *)NULL;
		}
	else
		{
		/*
		 *  look for an environment marker (/ or +/) preceded by whitespace
		 */
		p = marks;
		while ((env = strchr(p,'/')) != (char *)NULL)
			{
			p = env+1;                  /* advance start of search */
			if (*(env-1) == '+')
				--env;                  /* back up to leading + if +/ */
			if (myisspace(*(env-1)))
				{
				*(env-1) = NUL;         /* terminate markers */
				break;
				}
			}
		}
	}
if (marks && (*marks == NUL))
	marks = (char *)NULL;               /* convert empty string to NULL */
/*
 *  check for unwanted clutter
 */
if ((marks != (char *)NULL) && (p_marks == (char **)NULL))
	return((char *)NULL);               /* unwanted markers */
if ((env != (char *)NULL) && (p_env == (char **)NULL))
	return((char *)NULL);               /* unwanted environment */
/*
 *  we've collected everything safely, so stuff the return values and return
 */
if (p_rep != (char **)NULL)
	*p_rep = replace;
if (p_marks != (char **)NULL)
	*p_marks = marks;
if (p_env != (char **)NULL)
	*p_env = env;
return( match );
}
