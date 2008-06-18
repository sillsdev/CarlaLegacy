/* TRANSFER.C - function to apply transfer to a morpheme string
 ***************************************************************************
 *
 * StampWord * performStampTransfer(StampUnit * pUnit_in,
 *				    StampData * pStamp_in)
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1989, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include "stamp.h"

#ifdef TONEPARS
extern void              copy_morpheme_info P((StampAnalysis *ap,
						   StampMorpheme *mp));
#endif /* TONEPARS */

static StampAnalysis *	parse_analysis P((char  *     analstring,
					  StampData * pStamp_in));
static StampAnalysis *	transfer P((char *      analstring,
					StampUnit * pUnit_in,
					StampData * pStamp_in));
static int		crules_outstanding P((StampData * pStamp_in));
static StampAnalysis *	apply_trules P((StampAnalysis * analp,
					StampUnit * pUnit_in,
					StampData *     pStamp_in));
static StampAnalysis *	apply_sr P((StampAnalysis *analp,
					StampTrSubstituteRule *rulep,
					StampUnit * pUnit_in,
					StampData * pStamp_in));
static StampAnalysis *	apply_ir P((StampAnalysis *analp,
					StampTrInsertRule *rulep,
					StampUnit * pUnit_in,
					StampData * pStamp_in));
static void		apply_fl P((StampAnalysis *analp,
					StampTrFlagRule *rulep,
					StampData * pStamp_in));
static int		check_flags P((StampTrFlag *flagp));
static int		ones_below P((StampData * pStamp_in));
static int		istight P((AmpleEnvConstraint *env));
static StampAnalysis *	locate_insert P((StampAnalysis * head,
					 StampMorpheme * pNew,
					 StampData *     pStamp_in));
static StampAnalysis *	insert_morph P((StampAnalysis *        head,
					StampAnalysis *        locp,
					StampChangeMorphList * insp,
					StampData *            pStamp_in));
static StampAnalysis *	link_analysis P((StampAnalysis * pLeft_io,
					 StampAnalysis * pNew_io));

static const char szErrHead_m[] = "\nINPUT ANALYSIS FILE: ";
static const char szWhitespace_m[7] = " \t\r\n\f\v";
/*
 *  flags which have been set
 */
static StringList *	pLiveFlags_m;
/*
 *  Number of copy rule being executd
 */
static int		iCopyRuleNumber_m;

/*************************************************************************
 * NAME
 *    performStampTransfer
 * DESCRIPTION
 *    Load a word record from the input file and do transfer on it.
 * RETURN VALUE
 *    pointer to transferred word structure
 */
StampWord * performStampTransfer(pUnit_in, pStamp_in )
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
WordAnalysis *		pAnal;
WordAnalysis *		pNew;
WordAnalysis *		pNewList = NULL;
StampAnalysisList *	pNewStampAnal;

if (	(pUnit_in != NULL) &&
	(pUnit_in->pCurrentWord != NULL) &&
	(pUnit_in->pCurrentWord->pTemplate != NULL) )
	{
	if (pStamp_in->iDebugLevel && (pStamp_in->pLogFP != NULL))
		{
		fprintf(pStamp_in->pLogFP, "\nBeginning of performStampTransfer():\n");
		dumpStampWord(pUnit_in->pCurrentWord, pStamp_in->pLogFP);
		}
	/*
	 *  Process the word one ambiguity at a time
	 */
	for (   pAnal = pUnit_in->pCurrentWord->pTemplate->pAnalyses ;
		pAnal ;
		pAnal = pAnal->pNext )
		{
		do
			{
			/* transfer analyses */
			pNewStampAnal = (StampAnalysisList *)allocMemory(
							sizeof(StampAnalysisList));
			if (pStamp_in->iDebugLevel && (pStamp_in->pLogFP != NULL))
				fprintf(pStamp_in->pLogFP,
			"\npAnal->pszAnalysis = %s\n", pAnal->pszAnalysis);
			pNewStampAnal->pAnal = transfer( pAnal->pszAnalysis, pUnit_in,
						 pStamp_in );
			if ((pStamp_in->iDebugLevel == 5) && (pStamp_in->pLogFP != NULL))
				writeStampAnalysis(pNewStampAnal->pAnal, pStamp_in->pLogFP,
				   pStamp_in);
			pNewStampAnal->pNext = pUnit_in->pCurrentWord->pTrAnalyses;
			pUnit_in->pCurrentWord->pTrAnalyses = pNewStampAnal;
		pNew = allocMemory( sizeof(WordAnalysis) );
		if (pAnal->pszAnalysis)
		pNew->pszAnalysis = duplicateString(pAnal->pszAnalysis);
		if (pAnal->pszDecomposition)
		pNew->pszDecomposition = duplicateString(
							  pAnal->pszDecomposition);
		if (pAnal->pszCategory)
		pNew->pszCategory = duplicateString(pAnal->pszCategory);
		if (pAnal->pszProperties)
		pNew->pszProperties = duplicateString(pAnal->pszProperties);
		if (pAnal->pszFeatures)
		pNew->pszFeatures = duplicateString(pAnal->pszFeatures);
		if (pAnal->pszUnderlyingForm)
		pNew->pszUnderlyingForm = duplicateString(
							 pAnal->pszUnderlyingForm);
		if (pAnal->pszSurfaceForm)
		pNew->pszSurfaceForm = duplicateString(pAnal->pszSurfaceForm);
		pNew->pNext = pNewList;
		pNewList = pNew;

			if ((pStamp_in->iDebugLevel == 5) && (pStamp_in->pLogFP != NULL))
				{
				writeStampAnalysis(pNewStampAnal->pAnal, pStamp_in->pLogFP,
				   pStamp_in);
				}
		/* Controlled by transfer */
			} while ( crules_outstanding(pStamp_in) );
		}

	freeWordAnalysisList(pUnit_in->pCurrentWord->pTemplate->pAnalyses);
	pUnit_in->pCurrentWord->pTemplate->pAnalyses = pNewList;

	if (pStamp_in->iDebugLevel && (pStamp_in->pLogFP != NULL))
		{
		fprintf(pStamp_in->pLogFP, "\nEnd of performStampTransfer():\n");
		dumpStampWord(pUnit_in->pCurrentWord, pStamp_in->pLogFP);
		}
	}
return( pUnit_in->pCurrentWord );
}

/*************************************************************************
 * NAME
 *    parse_analysis
 * DESCRIPTION
 *    Parse an analysis string (presumably produced by AMPLE), creating
 *    a linked list of analysis struct's for use in transfer and synthesis.
 * RETURN VALUE
 *    pointer to a list of analysis struct's
 */
static StampAnalysis * parse_analysis(analstring, pStamp_in)
char *		analstring;	/* analysis string produced by AMPLE */
StampData *	pStamp_in;
{
register char *p;
char *nextp;
char *catp = NULL;
register StampAnalysis *ap = NULL;
StampAnalysis *ap0;
StampAnalysis *head, *left;
#ifdef TONEPARS
StampMorpheme *mp;
unsigned char uiCat;
#endif /* TONEPARS */
char buffer[BUFSIZE];
short state;                    /* finite state machine state */
#define WANT_PREFIX     0
#define WANT_ROOTCAT    1
#define WANT_ROOTNAME   2
#define WANT_SUFFIX     3

/*
 *  check that we have something to do
 */
if (analstring == NULL)
	return( NULL );
/*
 *  initialize the state and some pointers
 */
state = WANT_PREFIX;
left = NULL;
head = NULL;
strcpy(buffer, analstring);     /* (save analstring for error messages) */
/*
 *  scan across the analysis string
 */
for (	p = buffer + strspn(buffer, szWhitespace_m) ;
	*p != NUL ;
	p = nextp + strspn(nextp, szWhitespace_m) )
	{
	if ((pStamp_in->iDebugLevel == 5) && (pStamp_in->pLogFP != NULL))
		fprintf(pStamp_in->pLogFP, "\nstate = %d\np = %s\n", state, p);
	/*
	 *  check for state switching markers
	 */
	if (*p == pStamp_in->cBeginRoot)       /* is it the marker beginning roots? */
		{
		if (state == WANT_SUFFIX)
			{
			/* run back through and change any preceding suffixes to prefix */
			for (ap0 = ap;
				 ap0 != NULL && ap0->m.iMorphType & SFX;
				 ap0 = ap0->pLeftLink)
			  ap0->m.iMorphType = PFX;
			}
		else if (state != WANT_PREFIX)
			{
			if ((pStamp_in->iDebugLevel == 5) && (pStamp_in->pLogFP != NULL))
				fprintf(pStamp_in->pLogFP, "\nstate != WANT_PREFIX\n");
		if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP,
		"%sInvalid marker '%c' found in analysis string\n        %s\n",
			szErrHead_m, pStamp_in->cBeginRoot, analstring);
			freeStampAnalysis( head );
			return( NULL );
			}
		state = WANT_ROOTCAT;   /* next thing we want is a root category */
		nextp = p + 1;
		continue;
		}
	if (*p == pStamp_in->cEndRoot)         /* is it the marker ending roots? */
		{
		if (state != WANT_ROOTCAT)
			{
			if ((pStamp_in->iDebugLevel == 5) && (pStamp_in->pLogFP != NULL))
				fprintf(pStamp_in->pLogFP, "\nstate != WANT_ROOTCAT\n");
		if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP,
		"%sInvalid marker '%c' found in analysis string\n        %s\n",
			szErrHead_m, pStamp_in->cEndRoot, analstring);
			freeStampAnalysis( head );
			return( NULL );
			}
		state = WANT_SUFFIX;    /* now we go looking for suffixes */
		nextp = p + 1;
		continue;
		}
	/*
	 *  handle the token in the input string according to the state
	 */
	nextp = isolateWord(p);           /* split out the token */
	if ((pStamp_in->iDebugLevel == 5) && (pStamp_in->pLogFP != NULL))
		fprintf(pStamp_in->pLogFP, "\nstate = %d\nnextp = %s\n", state, nextp);
	switch (state)
		{
		case WANT_PREFIX:
			ap = link_analysis(left, newStampAnalysis(PFX,p,NULL, pStamp_in));
#ifdef TONEPARS
		if ((mp = searchStampDictionary(PFX, p, 0, FALSE, pStamp_in)))
		  copy_morpheme_info(ap, mp);
		else if (pStamp_in->pLogFP)
		  fprintf(pStamp_in->pLogFP,
			  "%sMorpheme %s not in prefix dictionary", szErrHead_m,
			  p);
#endif /* TONEPARS */
			if (head == NULL)
				head = ap;
			left = ap;          /* save trailing pointer for linking later */
			break;

		case WANT_ROOTCAT:
			catp = p;                   /* save the address of the catname */
			state = WANT_ROOTNAME;
			break;

		case WANT_ROOTNAME:
			ap = link_analysis(left, newStampAnalysis(ROOT,p,catp, pStamp_in));
#ifdef TONEPARS
		uiCat = findAmpleCategoryNumber(catp, pStamp_in->pCategories);
		if ((mp = searchStampDictionary(ROOT, p, uiCat,
					   pStamp_in->bMatchCategories,
					   pStamp_in)))
		  copy_morpheme_info(ap, mp);
		else if (pStamp_in->pLogFP)
		  fprintf(pStamp_in->pLogFP,
			  "%sMorpheme %s not in root dictionary", szErrHead_m,
			  p);
#endif /* TONEPARS */
			if (head == NULL)
				head = ap;
			left = ap;          /* save trailing pointer for linking later */
			state = WANT_ROOTCAT;
			break;

		case WANT_SUFFIX:
			ap = link_analysis(left, newStampAnalysis(SFX,p,NULL, pStamp_in));
#ifdef TONEPARS
		if ((mp = searchStampDictionary(SFX, p, 0, FALSE, pStamp_in)))
		  copy_morpheme_info(ap, mp);
		else if (pStamp_in->pLogFP)
		  fprintf(pStamp_in->pLogFP,
			  "%sMorpheme %s not in suffix dictionary", szErrHead_m,
			  p);
#endif /* TONEPARS */
			if (head == NULL)
				head = ap;
			left = ap;          /* save trailing pointer for linking later */
			break;

		} /* end switch */

	} /* end for */

/*
 *  check that we're in the right state at the end before accepting this
 *  analysis
 */
if (state != WANT_SUFFIX)       /* accept only valid input */
	{
	if (pStamp_in->pLogFP != NULL)
	fprintf(pStamp_in->pLogFP,
		"%sInvalid analysis string\n        %s\n",
		szErrHead_m, analstring);
	freeStampAnalysis( head );
	return( NULL );
	}
if ((pStamp_in->iDebugLevel) && (pStamp_in->pLogFP != NULL))
	{                           /* user wants it, so... */
	fprintf(pStamp_in->pLogFP, "INPUT ANALYSIS MORPHEME LIST:\n");
	writeStampAnalysis(head, pStamp_in->pLogFP, pStamp_in);
	}
return( head );                 /* we've done it! */
}

/*************************************************************************
 * NAME
 *    transfer
 * ARGUMENTS
 *    analstring - NUL-terminated character string of morph names
 * DESCRIPTION
 *    Convert a character string in format produced by AMPLE into a linked
 *    list of analysis struct's which have had the transfer lexical changes
 *    and substitution and insertion rules applied.
 * RETURN VALUE
 *    pointer to the created list of analysis morphemes
 */
static StampAnalysis * transfer(analstring, pUnit_in, pStamp_in)
char *		analstring;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
return apply_trules(
		applyStampTransferLexChanges(
			parse_analysis(analstring, pStamp_in),
			pUnit_in, pStamp_in),
		pUnit_in, pStamp_in);
}

/*****************************************************************************
 * NAME
 *    crules_outstanding
 * DESCRIPTION
 *    check whether there are any copy rules outstanding
 * RETURN VALUE
 *    TRUE if there are active copy rules outstanding, otherwise FALSE
 */
static int crules_outstanding(pStamp_in)
StampData *	pStamp_in;
{
int i;

for ( i = 0 ; i < pStamp_in->iCopyRulesTotalCount ; i++ )
	if ( pStamp_in->pabCopyRulesDone[ i ] )
		return( TRUE );
return( FALSE );
}

/*************************************************************************
 * NAME
 *    apply_trules
 * DESCRIPTION
 *    Apply the ordered list of transfer rules to an analysis list.
 * RETURN VALUE
 *    pointer to the modified list of analysis morphemes
 */
static StampAnalysis * apply_trules(analp, pUnit_in, pStamp_in)
StampAnalysis *	analp;		/* pointer to a list of analysis morphemes */
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
StampTransferRule *trp;
StampAnalysis *mp;

if (!analp)
	return NULL;
/*
 *  Do dictionary lookup now so envir of \sr and \ir can use props.
 *  Look up each of the morphemes in the analysis list in the dictionary.
 */
for ( mp = analp ; mp ; mp = mp->pRightLink )
	addStampAllosToMorph( mp, pStamp_in->bMatchCategories, pStamp_in );

if (pLiveFlags_m)
	{
	freeStringList(pLiveFlags_m);
	pLiveFlags_m = NULL;
	}
iCopyRuleNumber_m = 0;                       /* Set for first crule */
/*
 *  for each rule in the list
 */
for ( trp = pStamp_in->pTransferRules ; trp ; trp = trp->pNext )
	{
	switch (trp->eType)
		{
		case SUBRULE:                   /* substitution rule */
			pStamp_in->eRuleType = SUBRULE;
			analp = apply_sr(analp, &(trp->u.sSubRule), pUnit_in, pStamp_in);
			break;

		case COPYRULE:                  /* copy rule */
		/* Signal crule *//* Do crule *//* Count crule */
			pStamp_in->eRuleType = COPYRULE;
			analp = apply_sr(analp, &(trp->u.sSubRule), pUnit_in, pStamp_in);
			iCopyRuleNumber_m++;
			break;

		case INSRULE:                   /* insertion rule */
			analp = apply_ir(analp, &(trp->u.sInsRule), pUnit_in, pStamp_in);
			break;

		case FLAGRULE:                  /* flag rule */
			apply_fl(analp, &(trp->u.sFlagRule), pStamp_in);
			break;
		}
	}
if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
	{
	fprintf(pStamp_in->pLogFP,"  After \\sr:");
	writeStampBriefAnalysis(analp,NULL, pStamp_in->pLogFP, pStamp_in);
	fputc('\n', pStamp_in->pLogFP);
	}
return( analp );
}

/*************************************************************************
 * NAME
 *    apply_sr
 * ARGUMENTS
 *    analp - pointer to an analysis list of morphemes
 *    rulep - pointer to a substitution rule
 * DESCRIPTION
 *    Apply the transfer substitution rule to the analysis.
 * RETURN VALUE
 *    pointer to possibly modified analysis list
 */
static StampAnalysis *apply_sr(analp, rulep, pUnit_in, pStamp_in)
StampAnalysis *analp;
StampTrSubstituteRule *rulep;
StampUnit *	pUnit_in;
StampData *		pStamp_in;
{
register StampAnalysis *ap, *xp;
StampTrFlag *fp;
int do_replace;             /* Temp flag to signal to do replacement */
int match_found;            /* Remember match found */

/*
 *  for each morpheme in the analysis, check it against the match list
 *    of the substitution, then if it matches, verify the flags and
 *    environment.
 */
match_found = 0;
for ( ap = analp ; ap ; )
	{
	xp = checkStampTransferMatch( ap, rulep->pMatch );
	if (    xp &&                               /* If successful match */
			check_flags(rulep->pFlags) &&
			checkStampMorphEnviron(ap->pLeftLink, xp->pRightLink,
				   rulep->pEnvironment, pUnit_in, pStamp_in) )
		{
		/*
		 * The code below implements \cr copy rules.
		 * A copy rule is performed exactly like a substitution
		 *  rule, except that it triggers a second pass of all rules
		 *  over the same morpeme string, and on the second pass
		 *  the copy rule is not performed.
		 * The algorithm used is to keep an array of done flags with
		 *  one for each copy rule.  The first time the environment of a
		 *  copy rule succeeds it is performed, and its done flag is set.
		 * The function crules_outstanding is used to tell the
		 *  top level of transfer to send the same morpheme string
		 *  through transfer again.
		 * The next time it comes through, if there are
		 *  no outstanding copy rules lower down the list,
		 *  the copy rule is not performed, and its done flag is cleared.
		 * If there are outstanding copy rules lower down, then
		 *  the current one does the same as in previous passes.
		 * The effect of all this is to perform a tree walk over
		 *  the space of all possible combinations of copy rules,
		 *  eventually performing all possible combinations.
		 */
		if ( pStamp_in->eRuleType == COPYRULE )  /* If copy rule */
			{
									/* If current done list entry is 0 */
			if ( !pStamp_in->pabCopyRulesDone[ iCopyRuleNumber_m ] )
				if ( !ones_below(pStamp_in) )    /* If no 1's below */
					{                   /* Make done 1 and do replace */
					pStamp_in->pabCopyRulesDone[ iCopyRuleNumber_m ] = 1;
					do_replace = TRUE;
					}
				else                    /* Else (1's below) */
					do_replace = FALSE; /* Leave done 0 and don't rep */
			else                        /* Else (current done is 1) */
				if ( !ones_below(pStamp_in) )    /* If no 1's below */
					{                   /* Make done 0 and don't rep */
					pStamp_in->pabCopyRulesDone[ iCopyRuleNumber_m ] = 0;
					do_replace = FALSE;
					}
				else                    /* Else (1's below) */
					do_replace = TRUE;  /* Leave done 1 and do replace */
			}
		else                                    /* Else (sub rule) */
			do_replace = TRUE;                  /* Do it for sure */

		if ( do_replace )
			{
			 if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
				{
				fprintf(pStamp_in->pLogFP,"  \\sr applies:    ");
				writeStampSubstitutionRule(rulep, pStamp_in->pLogFP,
					   pStamp_in );
				fprintf(pStamp_in->pLogFP,"\n     Before:");
				writeStampBriefAnalysis( analp, ap, pStamp_in->pLogFP,
					 pStamp_in );
		fputc('\n', pStamp_in->pLogFP);
				}
			/*
			 *  substitute one set of morphemes for another
			 */
			ap = replaceStampMorphemes( &analp,
					ap,
					xp->pRightLink,
					rulep->pReplace,
					pStamp_in);
			if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
				{
				fprintf(pStamp_in->pLogFP,"     After: ");
				writeStampBriefAnalysis( analp, NULL, pStamp_in->pLogFP,
					 pStamp_in );
		fputc('\n', pStamp_in->pLogFP);
				}
			/*
			 *  drop any flags that helped to trigger this substitution
			 */
			for ( fp = rulep->pFlags ; fp ; fp = fp->pNext )
				pLiveFlags_m = removeFromStringList(pLiveFlags_m,
							fp->pszFlagname);
			}
		match_found = 1;            /* Remember we found a match */
		break;                      /* one substitution is enough? */
		}
	else                            /* Else (no match here) */
		ap = ap->pRightLink;         /* Try at next morpheme */
	}

if ( !match_found )                         /* If no match was found */
	if ( pStamp_in->eRuleType == COPYRULE )  /* If copy rule */
		pStamp_in->pabCopyRulesDone[ iCopyRuleNumber_m ] = 0;     /* Clear done */

return(analp);
}

/*************************************************************************
 * NAME
 *    apply_ir
 * ARGUMENTS
 *    analp - pointer to an analysis list of morphemes
 *    rulep - pointer to an insertion rule
 * DESCRIPTION
 *    Apply the transfer insertion rule to the analysis.
 * RETURN VALUE
 *    pointer to possibly modified analysis list
 */
static StampAnalysis *apply_ir(analp, rulep, pUnit_in, pStamp_in)
StampAnalysis *analp;
StampTrInsertRule *rulep;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
register StampAnalysis *ap, *left;
StampMorpheme *dp;
StampTrFlag *fp;
/*
 *  protect against empty insertion
 */
if (!rulep)
	return( analp );
/*
 *  handle the bizarre special case of an empty analysis list
 */
if (analp == NULL)
	{
	return( insert_morph( analp, analp, rulep->pInsert, pStamp_in ) );
	}
/*
 *  for each morpheme in the analysis, check it against the flags and
 *    environment.
 */
for ( left = NULL, ap = analp ;; ap = ap->pRightLink )
	{
	if (    check_flags(rulep->pFlags) &&
			checkStampMorphEnviron(left, ap, rulep->pEnvironment,
				   pUnit_in, pStamp_in) )
		{
		if (!istight(rulep->pEnvironment))
			{
			dp = searchStampDictionary( rulep->pInsert->iMorphType,
					rulep->pInsert->uMorph.pszName,
					rulep->pInsert->uCat.iCode,
					TRUE, pStamp_in );
			if (dp)
				ap = locate_insert( analp, dp, pStamp_in);
			else
				{
		if (pStamp_in->pLogFP != NULL)
			fprintf(pStamp_in->pLogFP,
		"\nWarning: inserting %s at the end of the word (not in dictionary)\n",
				rulep->pInsert->uMorph.pszName);
				ap = NULL;   /* insert at end of word */
				}
			}
		if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
			{
			fprintf(pStamp_in->pLogFP,"  \\ir applies:  ");
			writeStampInsertionRule( rulep, pStamp_in->pLogFP, pStamp_in );
			fprintf(pStamp_in->pLogFP,"\n     Before:");
			writeStampBriefAnalysis( analp, ap, pStamp_in->pLogFP, pStamp_in );
		fputc('\n', pStamp_in->pLogFP);
			}
		analp = insert_morph( analp, ap, rulep->pInsert, pStamp_in );
		if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
			{
			fprintf(pStamp_in->pLogFP,"     After: ");
			writeStampBriefAnalysis( analp, ap, pStamp_in->pLogFP, pStamp_in );
		fputc('\n', pStamp_in->pLogFP);
			}
		/*
		 *  drop any flags that helped to trigger this substitution
		 */
		for ( fp = rulep->pFlags ; fp ; fp = fp->pNext )
			pLiveFlags_m = removeFromStringList(pLiveFlags_m, fp->pszFlagname);
		break;                  /* one insertion is enough */
		}

	if (!ap)                    /* loop exit check */
		break;
	left = ap;                  /* save pointer for next time through loop */
	}

return(analp);
}

/*************************************************************************
 * NAME
 *    apply_fl
 * ARGUMENTS
 *    analp - pointer to an analysis list of morphemes
 *    rulep - pointer to a transfer flag rule
 * DESCRIPTION
 *    Apply the transfer flag rule to the analysis.
 * RETURN VALUE
 *    none
 */
static void apply_fl( analp, rulep, pStamp_in )
StampAnalysis *analp;
StampTrFlagRule *rulep;
StampData *	pStamp_in;
{
register StampAnalysis *ap;
register char *name;
AmpleMorphlist *mp;
/*
 *  for each morpheme in the analysis, check it against each morphname or
 *    morphclass in the flag's list, adding the flag's name to the list
 *    of live flags if a match is found
 */
for ( ap = analp ; ap ; ap = ap->pRightLink )
	{
	name = ap->m.pszMorphname;
	for ( mp = rulep->pFlagMorphs ; mp ; mp = mp->pNext )
		{
		if ( ((!mp->bClass) && !strcmp(name, mp->u.pszMorphName)) ||
			 (mp->bClass &&
				 isAmpleMorphClassMember( name, mp->u.pMorphClass)) )
			{
			if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
				{
				fprintf(pStamp_in->pLogFP,"  \\fl triggered:  ");
				writeStampFlagRule( rulep, pStamp_in->pLogFP );
				fprintf(pStamp_in->pLogFP,"\n   Analysis:");
				writeStampBriefAnalysis( analp, ap, pStamp_in->pLogFP,
					 pStamp_in );
		fputc('\n', pStamp_in->pLogFP);
				}
			pLiveFlags_m = mergeIntoStringList(pLiveFlags_m,
						   rulep->pszFlagname);
			return;                     /* one hit is all it takes! */
			}
		}
	}
}

/*************************************************************************
 * NAME
 *    check_flags
 * DESCRIPTION
 *    Check the flags in the list against the live flags.
 * RETURN VALUE
 *    TRUE if the flag list is satisfied, FALSE otherwise
 */
static int check_flags( flagp )
StampTrFlag *	flagp;	/* list of flags for substitution or insertion rule */
{
/*
 *  all of the flags must be present (or absent if complemented)
 */
for ( ; flagp ; flagp = flagp->pNext )
	{
	if (isMemberOfStringList( pLiveFlags_m, flagp->pszFlagname) )
		{
		if (flagp->bFlagComp)
			return( FALSE );    /* there, but we don't want it */
		}
	else
		{
		if (!(flagp->bFlagComp))
			return( FALSE );    /* not there, but we want it */
		}
	}
return( TRUE );
}

/*****************************************************************************
 * NAME
 *    ones_below
 * DESCRIPTION
 *
 * RETURN VALUE
 *    TRUE if there are ones below iCopyRuleNumber_m in
 *    pStamp_in->pabCopyRulesDone, otherwise FALSE
 */
static int ones_below(pStamp_in)
StampData *	pStamp_in;
{
int i;

for ( i = iCopyRuleNumber_m + 1 ; i < pStamp_in->iCopyRulesTotalCount ; i++ )
	if ( pStamp_in->pabCopyRulesDone[ i ] )
		return( TRUE );
return( FALSE );
}

/*************************************************************************
 * NAME
 *    istight
 * DESCRIPTION
 *    Check whether the environment constrains the location tightly enough
 *    for deterministic insertions.
 * RETURN VALUE
 *    TRUE if the environment tightly constrains location, FALSE otherwise
 */
static int istight( env )
AmpleEnvConstraint *	env;	/* pointer to an environment */
{
register AmpleEnvConstraint *ep;

if (!env)                       /* no environment at all is rather loose! */
	return( FALSE );

for ( ep = env ; ep ; ep = ep->pNext )
	{
	if (   (!ep->pLeftEnv ||
			 (ep->pLeftEnv->iFlags & (E_ELLIPSIS|E_OPTIONAL)))
		&&
		   (!ep->pRightEnv ||
			 (ep->pRightEnv->iFlags & (E_ELLIPSIS|E_OPTIONAL))) )
		return( FALSE );                /* both sides are loose */
	}

return( TRUE );                         /* everything was tight */
}

/*************************************************************************
 * NAME
 *    locate_insert
 * ARGUMENTS
 *    head - pointer to list of analysis morphemes
 *    pNewRule  - pointer to a new morpheme for insertion (pulled from dictionary)
 * DESCRIPTION
 *    Determine where to insert a morpheme based on its type and orderclass
 *    information.
 *    This algorithm is rather iffy, so if you think you can do better, go
 *    ahead!  Monotonically increasing orderclasses of affixes is assumed.
 * RETURN VALUE
 *    pointer to node in analysis list before which the new morpheme goes
 *    (NULL means insertion at the end of the word)
 */
static StampAnalysis * locate_insert( head, pNewRule, pStamp_in)
StampAnalysis *head;
StampMorpheme *pNewRule;
StampData *	pStamp_in;
{
register StampAnalysis *ap = NULL;
StampMorpheme *dp;

switch (pNewRule->iMorphType & MORPHTYPE_MASK)
	{
	case PFX:
		/*
		 *  find the rightmost position for prefixes based on orderclass
		 */
		for ( ap = head ; ap ; ap = ap->pRightLink )
			{
			if (ap->m.iMorphType & ROOT)
				return( ap );           /* prefixes can't go past roots */
			if (pNewRule->iOrderClass)
				{
				dp = searchStampDictionary( ap->m.iMorphType,
						ap->m.pszMorphname,
						0, TRUE, pStamp_in);
				if (    dp &&
						dp->iOrderClass &&
						(dp->iOrderClass > pNewRule->iOrderClass) )
					return( ap );       /* sort by increasing orderclass */
				}
			}
		break;

	case IFX:
		for ( ap = head ; ap ; ap = ap->pRightLink )
			{
			if ((pNewRule->iMorphType & ROOT_OK) && (ap->m.iMorphType & ROOT))
				return( ap );           /* first suitable root wins */
			dp = searchStampDictionary( ap->m.iMorphType,
					ap->m.pszMorphname,
					0, TRUE, pStamp_in );
			if (!dp)
				continue;
			if (    ((pNewRule->iMorphType & PFX_OK) && (dp->iMorphType & PFX)) ||
					((pNewRule->iMorphType & SFX_OK) && (dp->iMorphType & SFX)) )
				{
				if (    pNewRule->iOrderClass && dp->iOrderClass &&
						(dp->iOrderClass > pNewRule->iOrderClass) )
					return( ap );       /* rightmost valid position */
				}
			}
		break;

	case ROOT:
		/*
		 *  find the first root, then first following non-root
		 */
		for ( ap = head ; ap ; ap = ap->pRightLink )
			{
			if (ap->m.iMorphType & ROOT)
				break;
			}
		for ( ; ap ; ap = ap->pRightLink )
			{
			if (!(ap->m.iMorphType & ROOT))
				break;
			}
		/*
		 *  new roots inserted immediately before any suffixes
		 */
		return( ap );
		break;

	case SFX:
		/*
		 *  find the first root, then first following non-root
		 */
		for ( ap = head ; ap ; ap = ap->pRightLink )
			{
			if (ap->m.iMorphType & ROOT)
				break;
			}
		for ( ; ap ; ap = ap->pRightLink )
			{
			if (!(ap->m.iMorphType & ROOT))
				break;
			}
		/*
		 *  find the rightmost position for suffixes based on orderclass
		 */
		for ( ; ap ; ap = ap->pRightLink )
			{
			if (pNewRule->iOrderClass)
				{
				dp = searchStampDictionary( ap->m.iMorphType,
						ap->m.pszMorphname,
						0, TRUE, pStamp_in);
				if (    dp &&
						dp->iOrderClass &&
						(dp->iOrderClass > pNewRule->iOrderClass) )
					return( ap );       /* sort by increasing orderclass */
				}
			}
		return( NULL );      /* insert at end of word */
		break;

	default:
		reportError(ERROR_MSG,
			"\nSERIOUS PROGRAM BUG INSIDE locate_prefix(): morphtype = 0x%x\n",
			pNewRule->iMorphType & MORPHTYPE_MASK );
		break;
	}

return( ap );                   /* shouldn't get here, but... */
}

/*************************************************************************
 * NAME
 *    insert_morph
 * ARGUMENTS
 *    head - pointer to the beginning of a list of analysis morphemes
 *    locp - pointer to node before which we want to insert
 *    insp - pointer to a chg_morph struct to build into the list
 * DESCRIPTION
 *    Insert the indicated morpheme at the indicated location in the
 *    analysis list.  If locp is NULL, then the morpheme is added to the
 *    end of the list.  If locp is the same as head, then the morpheme is
 *    added to the beginning of the list.  Otherwise, the morpheme is
 *    added just before the node pointed to by locp.
 * RETURN VALUE
 *    pointer to the beginning of the modified list
 */
static StampAnalysis *insert_morph( head, locp, insp, pStamp_in )
StampAnalysis *head;
StampAnalysis *locp;
StampChangeMorphList *insp;
StampData *		pStamp_in;
{
StampAnalysis *pNew, *ap;
char *rcatname;
/*
 *  create the new node
 */
rcatname = NULL;
if (insp->iMorphType & ROOT)
	rcatname = findAmpleCategoryName(insp->uCat.iCode,
					 pStamp_in->pCategories);
pNew = newStampAnalysis(insp->iMorphType,
			insp->uMorph.pszName,
			rcatname,
			pStamp_in);
/* Add allos */
addStampAllosToMorph( pNew, pStamp_in->bMatchCategories, pStamp_in );
/*
 *  link the new node into the list at the left
 */
if (head == NULL)
	{                           /* empty list initially?? */
	pNew->pRightLink = NULL;
	pNew->pLeftLink  = NULL;
	return( pNew );
	}
else if (head == locp)
	{
	head->pLeftLink = pNew;
	pNew->pRightLink = head;
	pNew->pLeftLink  = NULL;
	return( pNew );
	}
/*
 *  advance pointer to just prior to insertion point
 */
ap = head;
while ((ap->pRightLink != locp) && ap->pRightLink)
	ap = ap->pRightLink;
/*
 *  link all the pointers carefully and return
 */
pNew->pRightLink = ap->pRightLink;
pNew->pLeftLink  = ap;
if (pNew->pRightLink)
	pNew->pRightLink->pLeftLink = pNew;
ap->pRightLink  = pNew;
return( head );
}

/*************************************************************************
 * NAME
 *    link_analysis
 * DESCRIPTION
 *    Link a new analysis into an existing list.
 * RETURN VALUE
 *    pNew_io
 */
static StampAnalysis * link_analysis(pLeft_io, pNew_io)
StampAnalysis *	pLeft_io;    /* pointer to the left of where we want to link */
StampAnalysis *	pNew_io;     /* pointer to the new node we want to link in */
{
pNew_io->pLeftLink  = pLeft_io;
if (pLeft_io != NULL)
	{
	pNew_io->pRightLink = pLeft_io->pRightLink;
	if (pLeft_io->pRightLink != NULL)
		pLeft_io->pRightLink->pLeftLink = pNew_io;
	pLeft_io->pRightLink = pNew_io;
	}
else
	pNew_io->pRightLink = NULL;

return( pNew_io );
}
