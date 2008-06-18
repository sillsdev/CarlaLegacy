/*      SYNRSC.C - function for synthesis regular sound changes
 ***************************************************************************
 *
 * void setStampRegSoundChangeMarkers(char *      str,
 *				      StampData * pStamp_in)
 *
 * void addStampRegSoundChange(char *      rscstring,
 *			       StampData * pStamp_in)
 *
 * void writeStampRegSoundChanges(FILE *      pOutputFP_in,
 *                                StampData * pStamp_in)
 *
 * StampAnalysis * applyStampRegSoundChanges(StampAnalysis * analp,
 *					     StampData *     pStamp_in)
 *
 * void freeStampRegSoundChanges(StampData * pStamp_io)
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1989, 2002 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#include "stamp.h"

static const char errhead[] = "\nREGULAR SOUND CHANGE: ";

static const char szWhitespace_m[7] = " \t\r\n\f\v";
/*
 *  regular sound change_list's
 */
static Change *	pRSCList_m[MAX_RSC] = { NULL, NULL, NULL, NULL };

/*************************************************************************
 * NAME
 *    setStampRegSoundChangeMarkers
 * DESCRIPTION
 *    Use the first MAX_RSC non-whitespace characters in the string for
 *    regular sound change markers.
 * RETURN VALUE
 *    none
 */
void setStampRegSoundChangeMarkers(str, pStamp_in)
char *		str;
StampData *	pStamp_in;
{
int k;

str += strspn(str, szWhitespace_m);
if (*str == NUL)
	{
	pStamp_in->szRSCMarkers[0] = NUL;         /* no regular sound changes wanted? */
	return;
	}
for ( k = 0 ; *str && k < MAX_RSC ; ++k )
	{
	pStamp_in->szRSCMarkers[k] = *str++;
	str += strspn(str, szWhitespace_m);
	}
pStamp_in->szRSCMarkers[k] = NUL;             /* ensure NUL-terminated */
}

/*************************************************************************
 * NAME
 *    addStampRegSoundChange
 * DESCRIPTION
 *    Parse a regular sound change and add it to the appropriate list(s)
 *    of regular sound changes.  These are ordered lists.
 * RETURN VALUE
 *    none
 */
void addStampRegSoundChange(rscstring, pStamp_in)
char *		rscstring;	/* string defining a regular sound change */
StampData *	pStamp_in;
{
char *		p;
Change *	rscp;
Change *	cp;
int		k;
char		mkbuf[MAX_RSC+1];
char		buffer[2*BUFSIZE];
char		buffer2[2*BUFSIZE];
int		cDelim;
/*
 *  make sure we want regular sound changes
 */
if (!pStamp_in->szRSCMarkers[0])
	{
	if (pStamp_in->pLogFP != NULL)
	fprintf(pStamp_in->pLogFP,
	"Warning: no regular sound change markers are defined, ignoring change\n");
	return;
	}
/*
 *  work on copy, save original for messages
 */
strncpy(buffer, rscstring, 2*BUFSIZE);
buffer[2*BUFSIZE-1] = NUL;
/*
 *  get the RSC markers
 */
p = buffer + strspn(buffer, szWhitespace_m);
if ((cDelim = *p) != NUL)
	{
	if ((p = strchr(p+1, cDelim)) != NULL)
	{
	if ((p = strchr(p+1, cDelim)) != NULL)
		p = strchr(p+1, cDelim);
	}
	}
if (p == NULL)
	{
	if (pStamp_in->pLogFP != NULL)
	fprintf(pStamp_in->pLogFP, "%sInvalid regular sound change: %s",
		errhead, rscstring);
	return;
	}
++p;
p += strspn(p, szWhitespace_m);
memset(mkbuf, NUL, MAX_RSC+1);
if ((*p != NUL) && (*p != '/') && !matchBeginning(p, "+/"))
	{
	int	i = 0;

	for ( ; *p ; ++p )
		{
	if (myisspace(*p))
		{
		if ((*(p+1) == '/') || matchBeginning(p+1, "+/"))
		break;
		else
		continue;                /* skip whitespace */
		}
	/*
	 *  check for only valid proto form markers
	 */
	if (strchr(pStamp_in->szRSCMarkers, *p) == NULL)
		{
		if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP,
			"%sInvalid regular sound change identifier in: %s",
			errhead, rscstring );
		return;
		}
	if ((strchr(mkbuf, *p) == NULL) && (i < MAX_RSC))
		mkbuf[i++] = *p;
	*p = ' ';
		}
	}
else
	{
	/*
	 *  set up the default rsc proto marker if none given explicitly
	 */
	mkbuf[0] = pStamp_in->szRSCMarkers[0];	/* 1.4v BJY */
	}
/*
 *  copy the buffer in case more than one change is requested
 */
strcpy(buffer2, buffer);
/*
 *  now, add this change to each appropriate ordered list
 */
for ( p = mkbuf ; *p ; ++p )
	{
	rscp = parseChangeString(buffer, pStamp_in->pStringClasses);
	if (rscp == NULL)
	{
	if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP, "%sInvalid regular sound change: %s",
			errhead, rscstring);
	return;
	}
	rscp->pNext = NULL;

	k = strpos(pStamp_in->szRSCMarkers, *p);           /* validated earlier */
	if (!pRSCList_m[k])
		pRSCList_m[k] = rscp;             /* first change in list */
	else
		{
		for ( cp = pRSCList_m[k] ; cp->pNext ; cp = cp->pNext )
			;
		cp->pNext = rscp;             /* link at the end */
		}
	strcpy(buffer, buffer2);
	}
}

/*************************************************************************
 * NAME
 *    writeStampRegSoundChanges
 * DESCRIPTION
 *    Display the regular sound change lists.
 * RETURN VALUE
 *    none
 */
void writeStampRegSoundChanges(pOutputFP_in, pStamp_in)
FILE *		pOutputFP_in;
StampData *	pStamp_in;
{
Change *	cp;
int		k;

if ((pOutputFP_in == NULL) || (pStamp_in == NULL))
	return;

for ( k = 0 ; (k < MAX_RSC) && pStamp_in->szRSCMarkers[k] ; ++k )
	{
	if (pRSCList_m[k])
		{
	fprintf(pOutputFP_in,
		"\nRegular sound changes for proto forms marked with %c\n",
		pStamp_in->szRSCMarkers[k] );
	}
	for ( cp = pRSCList_m[k] ; cp ; cp = cp->pNext )
		writeChange(cp, pOutputFP_in);
	}
}

/*************************************************************************
 * NAME
 *    applyStampRegSoundChanges
 * DESCRIPTION
 *    Apply Regular Sound Changes to all appropriate roots in a list of
 *    analysis morphemes.
 * RETURN VALUE
 *    pointer to the list of analysis morphemes
 */
StampAnalysis * applyStampRegSoundChanges( analp, pStamp_in )
StampAnalysis *	analp;		/* pointer to a list of analysis morphemes */
StampData *	pStamp_in;
{
register StampAnalysis *ap;
char *p;
int k;
/*
 * if no regular sound change markers defined, then no regular sound changes!
 */
if (!pStamp_in->szRSCMarkers[0])
	return( analp );
/*
 *  Look for all roots which are marked for regular sound changes.  Fix the
 *    morphname if it starts with a marking character.  If the root doesn't
 *    have any allomorphy (not in the dictionary), then apply the regular
 *    sound changes to the morphname.
 */
for ( ap = analp ; ap ; ap = ap->pRightLink )
	{
	if (!(ap->m.iMorphType & ROOT))
		continue;               /* we don't care about affixes */
	if ((k = strpos(pStamp_in->szRSCMarkers, *(ap->m.pszMorphname))) < 0)
		continue;               /* we don't care about non-proto-roots */
	/*
	 *  fix the root etymology marked as a proto-root by shifting the
	 *    morphname up over the regular sound change marker
	 */
	for ( p = ap->m.pszMorphname ; *p ; ++p )
		*p = *(p+1);
	/*
	 *  if the root isn't in the dictionary, apply regular sound changes
	 *    to the etymology (morphname field)
	 */
	if (ap->m.pAllomorphs == NULL)
		{
		if (pStamp_in->iDebugLevel && (pStamp_in->pLogFP != NULL))
			fprintf(pStamp_in->pLogFP,
		  "Applying regular sound change (%x) to root morphname: %s\n",
			(ap->m.iMorphType & RSC_MASK) >> 4, ap->m.pszMorphname );
		/*
		 *  no allomorphs => not in the dictionary
		 */
		for ( k = 0 ; k < MAX_RSC ; ++k )
			{
			/*
			 *  select the appropriate list of regular sound changes
			 *    and make the changes
			 */
			if (ap->m.iMorphType & (RSC<<k))
				{
				if (pStamp_in->iDebugLevel && (pStamp_in->pLogFP != NULL))
					fprintf(pStamp_in->pLogFP,
				"Regular sound change %c applies\n",
				pStamp_in->szRSCMarkers[k]);
		p = applyChanges(ap->m.pszMorphname, pRSCList_m[k]);
				freeMemory(ap->m.pszMorphname);
				ap->m.pszMorphname = p;
				if (pStamp_in->iDebugLevel && (pStamp_in->pLogFP != NULL))
					fprintf(pStamp_in->pLogFP,
				"After changes, morphname = %s\n", p);
				break;          /* never more than one proto form per root */
				}
			}
		}
	}
return( analp );
}

/*****************************************************************************
 * NAME
 *    freeStampRegSoundChanges
 * DESCRIPTION
 *    Free the memory allocated for STAMP Regular Sound Changes.
 * RETURN VALUE
 *    none
 */
void freeStampRegSoundChanges(pStamp_io)
StampData * pStamp_io;
{
int i;

for ( i = 0 ; i < MAX_RSC ; ++i )
	{
	if (pRSCList_m[i])
	{
	freeChangeList(pRSCList_m[i]);
	pRSCList_m[i] = NULL;
	}
	}
}
