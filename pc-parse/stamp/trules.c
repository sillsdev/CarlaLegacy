/*      TRULES.C - rules functions for transfer
 ***************************************************************************
 *
 * void addStampSubstitutionRule(char *      str,
 *				 StampData * pStamp_io)
 *
 * void addStampInsertionRule(char *      str,
 *			      StampData * pStamp_io)
 *
 * void addStampFlagRule(char *      str,
 *			 StampData * pStamp_io)
 *
 * void writeStampSubstitutionRule(StampTrSubstituteRule * subp,
 *				   FILE *                  pOutputFP_in,
 *				   StampData *             pStamp_in)
 *
 * void writeStampInsertionRule(StampTrInsertRule * insp,
 *				FILE *              pOutputFP_in,
 *				StampData *         pStamp_in)
 *
 * void writeStampFlagRule(StampTrFlagRule * flgp,
 *			   FILE *            pOutputFP_in)
 *
 * void writeStampTransferRules(FILE *      pOutputFP_in,
 *                              StampData * pStamp_in)
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1989, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include "stamp.h"

static const char	szErrHead_m[] = "\nTRANSFER RULE: ";
static const char	szWhitespace_m[7] = " \t\r\n\f\v";
/*
 *  local function prototypes
 */
static void		show_tr_flag P((StampTrFlag * tp,
					FILE *        pOutputFP_in));
static StampTrFlag *	parse_flags P((char  *str));
static void		add_rule P((StampTransferRule * pNew_in,
					StampData *         pStamp_io));
static void		show_morphlist P((AmpleMorphlist * mlp,
					  FILE *           pOutputFP_in));

/*************************************************************************
 * NAME
 *    addStampSubstitutionRule
 * DESCRIPTION
 *    Parse the substitution rule and add it to the list of rules.
 * RETURN VALUE
 *    none
 */
void addStampSubstitutionRule(str, pStamp_io)
char *		str;		/* string defining a substitution rule */
StampData *	pStamp_io;
{
char *match, *replace, *flagstr, *envstr;
AmpleEnvConstraint *env;
StampTrFlag *flags;
StampChangeMorphList *matchlist, *replist;
char buffer[2*BUFSIZE];
StampTransferRule *pNewRule;
/*
 *  isolate the pieces of the line
 */
str += strspn(str, szWhitespace_m);
strcpy(buffer, str);    /* work on copy, save original for messages */
match = splitStampChangeString(buffer, &replace, &flagstr, &envstr);
/*
 *  check over the individual items in preparation for storage
 */
if (match == NULL)
	{
	if (pStamp_io->pLogFP != NULL)
	fprintf(pStamp_io->pLogFP,

		"%sInvalid substitution rule: %s\n", szErrHead_m, str);
	return;
	}
/*
 *  parse the match string
 */
matchlist = parseStampTransferMatch(match,
					1,		/* 1 => substitution rule */
					szErrHead_m,
					pStamp_io);
if (!matchlist)
	{
	if (pStamp_io->pLogFP != NULL)
	fprintf(pStamp_io->pLogFP,
		"%sInvalid match string in substitution rule: %s\n",
		szErrHead_m, str);
	return;
	}
/*
 *  parse the replace string
 */
replist = parseStampTransferReplace(replace,
					1,		/* 1 => substitution rule */
					matchlist,
					szErrHead_m,
					pStamp_io);
if (!replist && (*replace != NUL))
	{                           /* can have empty replacement for deletion */
	if (pStamp_io->pLogFP != NULL)
	fprintf(pStamp_io->pLogFP,
		"%sInvalid substitution string in substitution rule: %s\n",
				szErrHead_m, str);
	freeStampChangeMorphList(matchlist);
	return;
	}
/*
 *  parse the flags if any are present
 */
if (flagstr != NULL)
	{
	flags = parse_flags(flagstr);
	if (flags == NULL)
		{
	if (pStamp_io->pLogFP != NULL)
		fprintf(pStamp_io->pLogFP,
			"%sInvalid flags in substitution rule: %s\n",
			szErrHead_m, str);
		freeStampChangeMorphList(matchlist);
		freeStampChangeMorphList(replist);
		return;
		}
	}
else
	flags = NULL;
/*
 *  parse the environment if one is present
 */
if (envstr != NULL)
	{
	env = parseAmpleMorphEnvConstraint(envstr,
					   "transfer substitution rule",
					   pStamp_io->pCategories,
					   &pStamp_io->sProperties,
					   pStamp_io->pCategClasses,
					   pStamp_io->pMorphClasses,
					   pStamp_io->pLogFP,
					   &pStamp_io->pStringList);
	if (env == NULL)
		{
	if (pStamp_io->pLogFP != NULL)
		fprintf(pStamp_io->pLogFP,
			"%sInvalid environment in substitution rule: %s\n",
			szErrHead_m, str);
		freeStampChangeMorphList(matchlist);
		if (replist)
			freeStampChangeMorphList(replist);
		return;
		}
	}
else
	env = NULL;
/*
 *  allocate and fill in a new node, and add it to the end of the rules list
 */
pNewRule = (StampTransferRule *)allocMemory( sizeof(StampTransferRule) );
pNewRule->eType                   = pStamp_io->eRuleType;
pNewRule->u.sSubRule.pMatch       = matchlist;
pNewRule->u.sSubRule.pReplace     = replist;
pNewRule->u.sSubRule.pEnvironment = env;
pNewRule->u.sSubRule.pFlags       = flags;

add_rule(pNewRule, pStamp_io);
}

/*************************************************************************
 * NAME
 *    addStampInsertionRule
 * DESCRIPTION
 *    Parse the insertion rule and add it to the list of rules.
 * RETURN VALUE
 *    none
 */
void addStampInsertionRule(str, pStamp_io)
char *		str;		/* string defining an insertion rule */
StampData *	pStamp_io;
{
char *instr, *flagstr, *envstr;
AmpleEnvConstraint *env;
StampTrFlag *flags;
StampChangeMorphList *insertion;
char buffer[2*BUFSIZE], token[BUFSIZE];
unsigned char cat;
StampTransferRule *pNewRule;
/*
 *  isolate the pieces of the line
 */
str += strspn(str, szWhitespace_m);
strcpy(buffer, str);    /* work on copy, save original for messages */
instr = splitStampChangeString(buffer, (char **)NULL, &flagstr, &envstr);
/*
 *  check over the individual items in preparation for storage
 */
if (!instr || (*instr == NUL))
	{
	if (pStamp_io->pLogFP != NULL)
	fprintf(pStamp_io->pLogFP, "%sInvalid insertion rule: %s\n",
		szErrHead_m, str);
	return;
	}
insertion = NULL;
/*
 *  parse the insertion string: only a single morphname allowed
 */
instr = getNextStampToken(instr,token,NULL);
if (token[0])
	{
	if (!instr || (*instr == NUL))
		insertion = newStampChangeMorph(0,			/* affix */
					(void *)duplicateString(token));
	else
		{                                                       /* root */
		if (!(cat = findAmpleCategoryNumber(token, pStamp_io->pCategories)))
		{
		if (pStamp_io->pLogFP != NULL)
		fprintf(pStamp_io->pLogFP,
			"%sInvalid root category %s in insertion\n",
			szErrHead_m, token);
		}
		else
			{
			instr = getNextStampToken(instr,token,NULL);
			if (!instr || (*instr == NUL))      /* only one morpheme! */
				{
				insertion = newStampChangeMorph(ROOT,
						   (void *)duplicateString(token));
				insertion->uCat.iCode = cat;
				}
			}
		}
	}
if (!insertion)
	{
	if (pStamp_io->pLogFP != NULL)
	fprintf(pStamp_io->pLogFP, "%sInvalid insertion rule: %s\n",
		szErrHead_m, str);
	return;
	}
/*
 *  parse the flags if any are present
 */
if (flagstr != NULL)
	{
	flags = parse_flags(flagstr);
	if (flags == NULL)
		{
	if (pStamp_io->pLogFP != NULL)
		fprintf(pStamp_io->pLogFP,
			"%sInvalid flags in substitution rule: %s\n",
			szErrHead_m, str);
		freeStampChangeMorphList(insertion);
		return;
		}
	}
else
	flags = NULL;
/*
 *  parse the environment if one is present
 */
if (envstr != NULL)
	{
	env = parseAmpleMorphEnvConstraint(envstr,
					   "transfer insertion rule",
					   pStamp_io->pCategories,
					   &pStamp_io->sProperties,
					   pStamp_io->pCategClasses,
					   pStamp_io->pMorphClasses,
					   pStamp_io->pLogFP,
					   &pStamp_io->pStringList);
	if (env == NULL)
		{
	if (pStamp_io->pLogFP != NULL)
		fprintf(pStamp_io->pLogFP,
			"%sInvalid environment in insertion rule: %s\n",
			szErrHead_m, str);
		freeStampChangeMorphList(insertion);
		return;
		}
	}
else
	env = NULL;
/*
 *  allocate and fill in a new node, and add it to the end of the rules list
 */
pNewRule = (StampTransferRule *)allocMemory( sizeof(StampTransferRule) );
pNewRule->eType                   = INSRULE;
pNewRule->u.sInsRule.pInsert      = insertion;
pNewRule->u.sInsRule.pEnvironment = env;
pNewRule->u.sInsRule.pFlags       = flags;

add_rule(pNewRule, pStamp_io);
}

/*************************************************************************
 * NAME
 *    show_tr_flag
 * ARGUMENTS
 *    tp - pointer to list of tr_flag struct's
 * DESCRIPTION
 *    Display the contents of a list of tr_flag struct's.
 * RETURN VALUE
 *    none
 */
static void show_tr_flag(tp, pOutputFP_in)
StampTrFlag *	tp;
FILE *		pOutputFP_in;
{
if (pOutputFP_in == NULL)
	return;
for ( ; tp ; tp = tp->pNext )
	{
	if (tp->bFlagComp)
		fprintf(pOutputFP_in," ~%s", tp->pszFlagname);
	else
		fprintf(pOutputFP_in," %s", tp->pszFlagname);
	}
}

/*************************************************************************
 * NAME
 *    parse_flags
 * ARGUMENTS
 *    str - pointer to a string containing the flags for a substitution
 *          or insertion rule
 * DESCRIPTION
 *    Parse the string into a list of tr_flag struct's.
 * RETURN VALUE
 *    pointer to the created list of tr_flag's, or NULL if an error occurred
 */
static StampTrFlag * parse_flags(str)
char *str;
{
char token[BUFSIZE];
unsigned char not;
StampTrFlag *flaglist, *tp;
/*
 *  build a list of tr_flag struct's, starting with an empty list
 */
flaglist = NULL;
not = FALSE;
do  {
	str = getNextStampToken(str, token, "~");
	if (token[0] == NUL)
		break;                          /* paranoid check? */
	if (token[0] == '~')
		not = !not;                     /* save complementation */
	else
		{
		tp = (StampTrFlag *)allocMemory( sizeof(StampTrFlag) );
		tp->bFlagComp = not;             /* set the complementation bits */
		not = FALSE;
		tp->pszFlagname = duplicateString(token);        /* set the name of the flag */
		tp->pNext = flaglist;            /* link into the list */
		flaglist = tp;
		}
	} while (str && *str);

return( flaglist );
}

/*************************************************************************
 * NAME
 *    addStampFlagRule
 * DESCRIPTION
 *    Parse the flag rule and add it to the list of rules.
 * RETURN VALUE
 *    none
 */
void addStampFlagRule(str, pStamp_io)
char *		str;		/* string defining a flag rule */
StampData *	pStamp_io;
{
register char *p;
char *flagname;
AmpleMorphlist *mp, *headmorph;
AmpleMorphClass *mcl;
char token[BUFSIZE];
StampTransferRule *pNewRule;
short state;
#define WANT_MORPH      0
#define NEED_CLASS      1
#define END_CLASS       2
/*
 *  get the flag's name, then scan for morphnames and morpheme classes
 */
p = getNextStampToken(str,token,NULL);
if (token[0] == NUL)
	{
	if (pStamp_io->pLogFP != NULL)
	fprintf(pStamp_io->pLogFP, "%sEmpty flag rule\n", szErrHead_m);
	return;
	}
flagname = duplicateString(token);
headmorph = NULL;
state = WANT_MORPH;
do  {
	p = getNextStampToken(p,token,"[]");
	if (token[0] == NUL)
		break;                  /* paranoid check? */

	if ((token[0] == '[') && (state != WANT_MORPH))
		{
	if (pStamp_io->pLogFP != NULL)
		fprintf(pStamp_io->pLogFP,
			"%sInvalid '[' in flag rule:\n        %s\n",
			szErrHead_m, str);
		return;
		}
	if ((token[0] == ']') && (state != END_CLASS))
		{
	if (pStamp_io->pLogFP != NULL)
		fprintf(pStamp_io->pLogFP,
			"%sInvalid ']' in flag rule:\n        %s\n",
			szErrHead_m, str);
		return;
		}

	switch(state)
		{
		case WANT_MORPH:
			if (token[0] == '[')
				state = NEED_CLASS;
			else
				{
				mp = (AmpleMorphlist *)allocMemory( sizeof(AmpleMorphlist) );
				mp->bClass         = FALSE;
				mp->u.pszMorphName = duplicateString( token );
				mp->pNext          = headmorph;
				headmorph = mp;
				}
			break;

		case NEED_CLASS:
			if (!(mcl = findAmpleMorphClass(token, pStamp_io->pMorphClasses)))
				{
		if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP,
			"%sUnknown morpheme class in flag rule:\n        %s\n",
				szErrHead_m, str);
				return;
				}
			mp = (AmpleMorphlist *)allocMemory( sizeof(AmpleMorphlist) );
			mp->bClass        = TRUE;
			mp->u.pMorphClass = mcl;
			mp->pNext         = headmorph;
			headmorph = mp;
			state = END_CLASS;
			break;

		case END_CLASS:
			if (token[0] == ']')
				state = WANT_MORPH;
			else
				{
		if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP,
				"%sMissing ']' in flag rule:\n        %s\n",
				szErrHead_m, str);
				return;
				}
			break;

		}
	} while (p && *p);

/*
 *  allocate and fill in a new node, and add it to the end of the rules list
 */
pNewRule = (StampTransferRule *)allocMemory( sizeof(StampTransferRule) );
pNewRule->eType                   = FLAGRULE;
pNewRule->u.sFlagRule.pszFlagname = flagname;
pNewRule->u.sFlagRule.pFlagMorphs = headmorph;

add_rule(pNewRule, pStamp_io);
}

/*************************************************************************
 * NAME
 *    add_rule
 * ARGUMENTS
 *    pNewRule - pointer to new tr_rules struct
 * DESCRIPTION
 *    Add a new rule to the end of the ordered list of rules.
 * RETURN VALUE
 *    none
 */
static void add_rule(pNewRule_in, pStamp_io)
StampTransferRule *	pNewRule_in;
StampData *		pStamp_io;
{
StampTransferRule *	r;

if ((pNewRule_in == NULL) || (pStamp_io == NULL))
	return;
if (pStamp_io->pTransferRules)
	{
	/*
	 *  add to the end of the list
	 */
	for ( r = pStamp_io->pTransferRules ; r->pNext ; r = r->pNext )
		;
	r->pNext           = pNewRule_in;
	pNewRule_in->pNext = NULL;
	}
else
	pStamp_io->pTransferRules = pNewRule_in;	/* very first rule */
}

/*************************************************************************
 * NAME
 *    writeStampSubstitutionRule
 * DESCRIPTION
 *    Display the substitution rule.
 * RETURN VALUE
 *    none
 */
void writeStampSubstitutionRule( subp, pOutputFP_in, pStamp_in )
StampTrSubstituteRule *	subp;
FILE *			pOutputFP_in;
StampData *		pStamp_in;
{
fprintf(pOutputFP_in,"\"");
writeStampChangeMorphList(subp->pMatch, pOutputFP_in, pStamp_in);
fprintf(pOutputFP_in,"\" --> \"");
if (subp->pReplace)
	writeStampChangeMorphList(subp->pReplace, pOutputFP_in, pStamp_in);
fprintf(pOutputFP_in," \"");
if (subp->pFlags)
	{
	fprintf(pOutputFP_in,"   ");
	show_tr_flag(subp->pFlags, pOutputFP_in);
	}
if (subp->pEnvironment)
	{
	fprintf(pOutputFP_in,"   ");
	writeAmpleEnvConstraint(pOutputFP_in, subp->pEnvironment, FALSE);
	}
}

/*************************************************************************
 * NAME
 *    writeStampInsertionRule
 * DESCRIPTION
 *    Display the insertion rule.
 * RETURN VALUE
 *    none
 */
void writeStampInsertionRule( insp, pOutputFP_in, pStamp_in )
StampTrInsertRule *	insp;
FILE *			pOutputFP_in;
StampData *		pStamp_in;
{
fprintf(pOutputFP_in,"  \"");
writeStampChangeMorphList(insp->pInsert, pOutputFP_in, pStamp_in);
fprintf(pOutputFP_in," \"");
if (insp->pFlags)
	{
	fprintf(pOutputFP_in,"   ");
	show_tr_flag(insp->pFlags, pOutputFP_in);
	}
if (insp->pEnvironment)
	{
	fprintf(pOutputFP_in,"   ");
	writeAmpleEnvConstraint(pOutputFP_in, insp->pEnvironment, FALSE);
	}
}

/*************************************************************************
 * NAME
 *    writeStampFlagRule
 * ARGUMENTS
 *    flgp - pointer to a tr_flagrule struct
 * DESCRIPTION
 *    Display the flag rule.
 * RETURN VALUE
 *    none
 */
void writeStampFlagRule( flgp, pOutputFP_in )
StampTrFlagRule *	flgp;
FILE *			pOutputFP_in;
{
fprintf(pOutputFP_in,"  %s    ", flgp->pszFlagname);
show_morphlist(flgp->pFlagMorphs, pOutputFP_in);
}

/*************************************************************************
 * NAME
 *    writeStampTransferRules
 * DESCRIPTION
 *    Display the ordered list of transfer rules.
 * RETURN VALUE
 *    none
 */
void writeStampTransferRules(pOutputFP_in, pStamp_in)
FILE *		pOutputFP_in;
StampData *	pStamp_in;
{
StampTransferRule *	trp;

if (	(pOutputFP_in == NULL) ||
	(pStamp_in  == NULL) ||
	(pStamp_in->pTransferRules == NULL) )
	return;
fprintf(pOutputFP_in,"\nTransfer Rules:\n");
/*
 *  for each rule in the list
 */
for ( trp = pStamp_in->pTransferRules ; trp ; trp = trp->pNext )
	{
	switch (trp->eType)
		{
		case SUBRULE:                   /* substitution rule */
			fprintf(pOutputFP_in,"    SUB:");
			writeStampSubstitutionRule( &(trp->u.sSubRule), pOutputFP_in,
					pStamp_in );
		putc('\n', pOutputFP_in);
			break;

		case COPYRULE:                   /* copy rule */
			fprintf(pOutputFP_in,"   COPY:");
			writeStampSubstitutionRule( &(trp->u.sSubRule), pOutputFP_in,
					pStamp_in );
		putc('\n', pOutputFP_in);
			break;

		case INSRULE:                   /* insertion rule */
			fprintf(pOutputFP_in,"    INS:");
			writeStampInsertionRule( &(trp->u.sInsRule), pOutputFP_in,
					 pStamp_in );
		putc('\n', pOutputFP_in);
			break;

		case FLAGRULE:                  /* flag rule */
			fprintf(pOutputFP_in,"   FLAG:");
			writeStampFlagRule( &(trp->u.sFlagRule), pOutputFP_in );
		putc('\n', pOutputFP_in);
			break;
		}
	}
putc('\n', pOutputFP_in);
}

/*************************************************************************
 * NAME
 *    show_morphlist
 * ARGUMENTS
 *    mlp - pointer to a list of morphlist struct's
 * DESCRIPTION
 *    Display a list of morphlist struct's.
 * RETURN VALUE
 *    none
 */
static void show_morphlist(mlp, pOutputFP_in)
AmpleMorphlist * mlp;
FILE *		 pOutputFP_in;
{
if (pOutputFP_in == NULL)
	return;
for ( ; mlp ; mlp = mlp->pNext )
	{
	if (mlp->bClass)
		fprintf(pOutputFP_in, " [%s]", mlp->u.pMorphClass->pszName );
	else
		fprintf(pOutputFP_in, " %s", mlp->u.pszMorphName );
	}
}
