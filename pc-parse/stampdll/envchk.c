/*      ENVCHK.C - check string andn punctuation environment constraints
 ***************************************************************************
 *
 *      int checkStampStringEnvironment(leftstring,leftsize,rightstring,ec)
 *      char *leftstring;
 *      int leftsize;
 *      char *rightstring;
 *      AmpleEnvConstraint *ec;
 *
 *      int checkStampPunctEnvironment(leftstring,leftsize,rightstring,ec)
 *      char *leftstring;
 *      int leftsize;
 *      char *rightstring;
 *      AmpleEnvConstraint *ec;
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include "stamp.h"

static char  *shorten P((char  *string, int  size));
static int  chk_senv_left P((int  size,
				 char  *left,
				 AmpleEnvItem *env,
				 char  *match,
				 StampUnit * pUnit_in,
				 StampData * pStamp_in));
static int  chk_senv_right P((int  size,
				  char  *right,
				  AmpleEnvItem *env,
				  StampUnit * pUnit_in,
				  StampData * pStamp_in));
static int  senv_left P((char  *        left,
			 AmpleEnvItem * env,
			 StampUnit *	pUnit_in,
			 StampData *    pStamp_in));
static int  senv_right P((char  *        right,
			  AmpleEnvItem * env,
			  StampUnit *    pUnit_in,
			  StampData *    pStamp_in));
static int  chk_penv_left P((int  size,
				 char  *left,
				 AmpleEnvItem *env,
				 char  *match));
static int  chk_penv_right P((int  size,
				  char  *right,
				  AmpleEnvItem *env));
static int  penv_left P((char  *        left,
			 AmpleEnvItem * env));
static int  penv_right P((char  *        right,
			  AmpleEnvItem * env));

/*************************************************************************
 * NAME
 *    shorten
 * ARGUMENTS
 *    string - pointer to a NUL-terminated string
 *    size   - number of bytes
 * DESCRIPTION
 *    Chop the indicated number of bytes from the end of the string.
 * RETURN VALUE
 *    pointer to the string, which is now shorter
 */
static char *shorten(string,size)
char *string;
int size;
{
int len;

if ((string == (char *)NULL) || (size <= 0))
	return(string);             /* check for reasonable arguments */

len = strlen(string) - size;    /* find out where to chop */
if (len <= 0)
	*string = NUL;              /* nothing left of the string... */
else
	*(string + len) = NUL;
return(string);
}

/*************************************************************************
 * NAME
 *    chk_senv_left
 * ARGUMENTS
 *    size - size of left-hand string that matched
 *    left - NUL-terminated left-hand string to be checked
 *    env  - pointer to list of left-hand side env_item's
 *    match - portion of string that was matched
 *            This is needed only for chk_senv_left, since the original string
 *            is (partly) destroyed by shorten
 * DESCRIPTION
 *    Check what to do based on size of matched string.
 * RETURN VALUE
 *    TRUE if successful, FALSE if unsuccessful
 */
static int chk_senv_left(size,left,env,match, pUnit_in, pStamp_in)
int size;
char *left;
AmpleEnvItem *env;
char *match;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
	/*
	 *  figure out what to do based on success (stored in size) , E_NOT,
	 *  and E_OPTIONAL
	 */
if (    (!size && (env->iFlags & E_NOT)) ||
		(size && !(env->iFlags & E_NOT)) )
	{                                   /* happily progress along */
	if (senv_left( shorten(left,(size ? size : 1)), env->pNext,
		   pUnit_in, pStamp_in ))
	   return( TRUE );
										/* restore matched string that was
										   deleted by shorten */
	cpystr((left + strlen(left)), match);
	}
if (env->iFlags & E_OPTIONAL)		/* 1.4y BJY */
	{
	if (senv_left( left, env->pNext,
		   pUnit_in, pStamp_in ))
		return( TRUE );                 /* didn't need it after all */
	}

return( FALSE );
}

/*************************************************************************
 * NAME
 *    chk_senv_right
 * ARGUMENTS
 *    size - size of right-hand string that matched
 *    right - NUL-terminated left-hand string to be checked
 *    env  - pointer to list of left-hand side env_item's
 * DESCRIPTION
 *    Check what to do based on size of matched string.
 * RETURN VALUE
 *    TRUE if successful, FALSE if unsuccessful
 */
static int chk_senv_right(size,right,env, pUnit_in, pStamp_in)
int size;
char *right;
AmpleEnvItem *env;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
	/*
	 *  figure out what to do based on success (stored in size) , E_NOT,
	 *  and E_OPTIONAL
	 */
if (    (size && !(env->iFlags & E_NOT)) ||
		(!size && (env->iFlags & E_NOT)) )
	{
	if (senv_right( right + (size ? size : 1), env->pNext,
			pUnit_in, pStamp_in ))
		return( TRUE );
	}
if (env->iFlags & E_OPTIONAL)		/* 1.4y BJY */
	{
	if (senv_right( right, env->pNext, pUnit_in, pStamp_in ))
		return( TRUE );
	}
return( FALSE );
}

/*************************************************************************
 * NAME
 *    senv_left
 * ARGUMENTS
 *    left - NUL-terminated left-hand string to be checked
 *    env  - pointer to list of left-hand side env_item's
 * DESCRIPTION
 *    Check whether the given string matches the given environment items.
 *    This is a recursive function.
 * RETURN VALUE
 *    nonzero if successful, zero if unsuccessful
 */
static int senv_left(left, env, pUnit_in, pStamp_in)
char *left;
AmpleEnvItem *env;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
int size;
char *myleft;
int mylength;
StringList *sp;

if (env == (AmpleEnvItem *)NULL)
	return( TRUE );             /* no (more) environment */
if (left == (char *)NULL)
	return( FALSE );            /* no string at all?? */
/*
 *  If we had the DECUS C function salloc() or the 4.2BSD Unix function
 *  alloca() guaranteed to be available [these allocate storage on the
 *  stack, which gets reclaimed automatically when the function exits],
 *  this would be a virtual mirror image of senv_right() below.  Alas,
 *  this is not guaranteed, so I allocate space explicitly and use
 *  myriads of goto's instead of return's in order to guarantee that the
 *  space is released.
 */
mylength = strlen(left)+1;
myleft = strcpy(allocMemory((unsigned)mylength),left);
/*
 *  match the current environment against what's wanted
 */
for (;; strcpy(left,shorten(myleft,1)) )
	{
	/*
	 *  handle hitting the beginning of the word
	 */
	if (*left == NUL)
		{
		if ((env->iFlags&E_CLASS) || (env->u.pszString!=(char *)NULL))
			{
			if (    (env->iFlags & E_OPTIONAL) &&
			senv_left(left,env->pNext, pUnit_in, pStamp_in))
				goto goodleft;
			if (    (env->iFlags & E_NOT) &&
					(env->pNext==(AmpleEnvItem *)NULL) )
				goto goodleft;          /* boundary is "NOT something" */
			else
				goto badleft;           /* had to match something more */
			}
		else
			{                           /* boundary */
			if (env->iFlags & E_NOT)
				goto badleft;           /* didn't want this boundary */
			else
				{
				/* Check for end of environment */
				if ( env->pNext == (AmpleEnvItem *)NULL )
					goto goodleft;
				/* If we are already in lookahead mode, then we have a
				   multiple dependency */
				if (pUnit_in->bStringLookahead && !pUnit_in->bLookaheadDone)
					{
					pUnit_in->bMultiDependency = TRUE;
					goto badleft;
					}
				if (pUnit_in->pPreviousWord == NULL)
					{
					if (env->pNext == NULL)
						goto goodleft;
					else
						goto badleft;
					}
				/* all ambiguities of previous word must match */
				for (	sp = pUnit_in->pPreviousWord->pTemplate->pNewWords ;
			sp ;
			sp = sp->pNext )
					{
					if ( !senv_left( sp->pszString, env->pNext,
					 pUnit_in, pStamp_in ) )
						goto badleft;
					}
				goto goodleft;
				}
			}
		}
	/*
	 *  handle having something to match against
	 */
	if ( env->iFlags & E_CLASS )
		{                               /* check against a string class */
		size = 0;                       /* assume it won't be in the class */
										/* for each element that matches the
										   string, see if it will work */
		for ( sp = ((StringClass *)env->u.pClass)->pMembers ;
			  sp != NULL ;
			  sp = sp->pNext )
		   {
#ifdef MSDOS
#ifdef AZTEC
#ifndef BIGMEM
#define BAD_COMPILER_CODE_GENERATION
#endif
#endif
#endif
		   if (matchEnd(left,sp->pszString))
			  {
			  size = strlen(sp->pszString);
			  if (chk_senv_left (size, left, env, sp->pszString,
				 pUnit_in, pStamp_in) )
		  goto goodleft;
			  }
#ifdef BAD_COMPILER_CODE_GENERATION
		   strcpy("","");
#endif
			}
	/* if did not match the class */
	/* check for negation, etc. */
		if (size == 0 && chk_senv_left(0, left, env, "",
					   pUnit_in, pStamp_in) )
		goto goodleft;
	/* if we are in an ellipsis, break out to the iteration on left.*/
		if  ( env->iFlags & E_ELLIPSIS)
		continue;
	goto badleft;
		}
	else if (env->u.pszString != (char *)NULL)
		{                               /* check against a literal string */
		size = (matchEnd(left,env->u.pszString)) ?
								strlen(env->u.pszString) : 0;
										/* check for validity */
		if (chk_senv_left(size, left, env, "", pUnit_in, pStamp_in) )
		goto goodleft;
		}
	else
		{                               /* check word initial condition */
		if (    ((env->iFlags & E_NOT) && (*left != NUL)) ||
				(!(env->iFlags & E_NOT) && (env->iFlags & E_ELLIPSIS)) ||
				(!(env->iFlags & E_NOT) && (*left == NUL)) )
			goto goodleft;              /* word boundary condition okay */
		else
			goto badleft;
		}
	/*
	 *  now check for E_ELLIPSIS case
	 */
	if (!(env->iFlags & E_ELLIPSIS))
		goto badleft;                   /* had to match here */
	/* if we reach here, we try again further out (due to '...') */
	}

goodleft:
freeMemory( myleft );                       /* too bad we don't have salloc() */
return( TRUE );

badleft:
freeMemory( myleft );                       /*   or alloca() to use!! */
return( FALSE );
} /* end of senv_left() */

/*************************************************************************
 * NAME
 *    senv_right
 * ARGUMENTS
 *    right - NUL-terminated right-hand string to be checked
 *            (environment into which we are attempting to place
 *            the allomorph )
 *    env   - pointer to list of right-hand side env_item's
 *            (environment constraints)
 * DESCRIPTION
 *    Check whether the given string matches the given environment items.
 *    This is a recursive function, thanks to ellipses.
 * RETURN VALUE
 *    nonzero if successful, zero if unsuccessful
 */
static int senv_right(right, env, pUnit_in, pStamp_in)
char *right;
AmpleEnvItem *env;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
int size;
StringList *sp;

if (env == (AmpleEnvItem *)NULL)
	return( TRUE );             /* no (more) environment */
if (right == (char *)NULL)
	return( FALSE );            /* no string at all?? */
/*
 *  match the current environment against what's wanted
 */
for (;; ++right )
	{
	/*
	 *  handle hitting the end of the word
	 */
	if (*right == NUL)
		{
		if ((env->iFlags&E_CLASS) || (env->u.pszString!=(char *)NULL))
			{
		/* item we are looking for is not a word boundary */
			if (    (env->iFlags & E_OPTIONAL) &&
			senv_right(right,env->pNext, pUnit_in, pStamp_in) )
		/*
		 *  item we are looking for is optional and remainder of
		 *  desired environment matches
		 */
				return( TRUE );
			if (    (env->iFlags & E_NOT) && /* we don't want to see this
												  item */
					(env->pNext==(AmpleEnvItem *)NULL) )
						/* no additional items in desired environment */
				return( TRUE );         /* boundary is "NOT something" */
			else
				return( FALSE );        /* had to match something more */
			}
		else
			{
			if (env->iFlags & E_NOT)
				return( FALSE );        /* didn't want this boundary */
			else
				{
				/* Check for end of environment */
				if ( env->pNext == (AmpleEnvItem *)NULL )
					return( TRUE );
				/* Can't check next word unless lookahead is done */
				if ( pUnit_in->bLookaheadDone )
					{
					if (pUnit_in->pNextWord == NULL)
						return( env->pNext == NULL );
					/* all ambiguities of next word must match */
					for (   sp = pUnit_in->pNextWord->pTemplate->pNewWords ;
				sp ;
				sp = sp->pNext )
						if (!senv_right(sp->pszString, env->pNext,
					pUnit_in, pStamp_in))
							return( FALSE );
					return( TRUE );
					}
				/* If we are already in lookahead mode, then we have a
				   multiple dependency */
				if ( pUnit_in->bStringLookahead && !pUnit_in->bLookaheadDone )
					{
					pUnit_in->bMultiDependency = TRUE;
					return( FALSE );
					}
				/* If we get to this point, then we need to tell synthesis
				   to look ahead */
				pUnit_in->bStringLookahead = TRUE;
				return( FALSE );
				}
			}
		}
	/*
	 *  handle having something to match against
	 *  (we won't get here if we hit end of word)
	 */
	if ( env->iFlags & E_CLASS )
		{                               /* check against a string class */
		size = 0;                       /* assume it won't match */
										/* for each element that matches the
										   string, see if it will work */
		for ( sp = ((StringClass *)env->u.pClass)->pMembers ;
			  sp != (StringList *)NULL ;
			  sp = sp->pNext )
		   {
		   if (matchBeginning(right,sp->pszString))
			  {
			  size = strlen(sp->pszString);
			  if (chk_senv_right (size, right, env, pUnit_in, pStamp_in) )
		  return( TRUE );
			  }
		   }
	/* if it did not match the class */
	/*  check for negation, etc. */
		if (size == 0 && chk_senv_right(0, right, env, pUnit_in, pStamp_in))
		return( TRUE );
	/* if we are in an ellipsis, break out to the iteration on right.*/
		if  ( env->iFlags & E_ELLIPSIS)
		continue;
		return( FALSE );
		}
	else if (env->u.pszString != (char *)NULL)
		{                               /* check against a literal string */
		size = (matchBeginning(right,env->u.pszString)) ?
								strlen(env->u.pszString) : 0;
										/* check for validity */
		if (chk_senv_right(size, right, env, pUnit_in, pStamp_in) )
		return( TRUE );
		}
	else /* this environment item is a word boundary */
		{                               /* check word final condition */
		if (env->iFlags & E_NOT)
			return( *right != NUL );    /* ellipses don't matter for ~# */
		if (env->iFlags & E_ELLIPSIS)
			return( TRUE );             /* we always eventually end! */
		return( *right == NUL );
		}
	/*
	 *  now check for E_ELLIPSIS case
	 */
	if (!(env->iFlags & E_ELLIPSIS))
		return( FALSE );                /* had to match here */
	/* if we reach here, we try again further out (due to '...') */
	}
} /* end of senv_right() */

/*************************************************************************
 * NAME
 *    checkStampStringEnvironment
 * ARGUMENTS
 *    leftstring  - pointer to the leftside environment string
 *    leftsize    - length of the leftside environment string
 *    rightstring - pointer to the rightside environment string
 *    ec          - pointer to the allomorph's string environment
 * DESCRIPTION
 *    Check if this allomorph is allowed by it's surface (string)
 *    environment.
 *      (Note: the allomorph string begins at leftstring+leftsize and
 *                                and ends at rightstring;
 *             the length of the allomorph string is
 *                      rightstring - (leftstring+leftsize)  )
 * RETURN VALUE
 *    nonzero if okay, zero if the environment is wrong
 */
int checkStampStringEnvironment(leftstring, leftsize, rightstring, ec,
				pUnit_in, pStamp_in)
char *leftstring;
int leftsize;
char *rightstring;
AmpleEnvConstraint *ec;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
char *left;
int val;

/*
 *  handle null arguments safely
 */
if (ec == (AmpleEnvConstraint *)NULL)
	return( TRUE );             /* no environment constraint at all */
if (leftstring == (char *)NULL)
	{
	leftstring = "";
	leftsize   = 0;
	}
if (rightstring == (char *)NULL)
	rightstring = "";
/*
 *  allocate space for a copy of the leftside string
 */
left = allocMemory( (unsigned)leftsize+1 );
/*
 *  go through the list of string environment conditions, quitting at the
 *  first one that succeeds
 */
for ( ; ec != (AmpleEnvConstraint *)NULL ; ec = ec->pNext )
	{
	strncpy(left, leftstring, leftsize);   /* need fresh copy each time */
	left[leftsize] = NUL;               /* Ensure null termination */
	val = senv_left( left, ec->pLeftEnv, pUnit_in, pStamp_in) &&
		  senv_right( rightstring, ec->pRightEnv, pUnit_in, pStamp_in );
	if (ec->bNot)           /* check for negative environment */
		val = !val;
	if (val)
		break;                          /* both sides okay, so quit */
	}
freeMemory( left );                         /* free the allocated space */
return( val );
} /* end of checkStampStringEnvironment() */

/*************************************************************************
 * NAME
 *    chk_penv_left          2.1b1 hab
 * ARGUMENTS
 *    size - size of left-hand string that matched
 *    left - NUL-terminated left-hand string to be checked
 *    env  - pointer to list of left-hand side env_item's
 *    match - portion of string that was matched
 *            This is needed only for chk_penv_left, since the original string
 *            is (partly) destroyed by shorten
 * DESCRIPTION
 *    Check what to do based on size of matched string.
 * RETURN VALUE
 *    TRUE if successful, FALSE if unsuccessful
 */
static int chk_penv_left(size,left,env,match)
int size;
char *left;
AmpleEnvItem *env;
char *match;
{
	/*
	 *  figure out what to do based on success (stored in size) , E_NOT,
	 *  and E_OPTIONAL
	 */
if (    (!size && (env->iFlags & E_NOT)) ||
		(size && !(env->iFlags & E_NOT)) )
	{                                   /* happily progress along */
	if (penv_left( shorten(left,(size ? size : 1)), env->pNext) )
	   return( TRUE );
										/* restore matched string that was
										   deleted by shorten */
	cpystr((left + strlen(left)), match);
	}
if (env->iFlags & E_OPTIONAL)		/* 1.4y BJY */
	{
	if (penv_left( left, env->pNext ))
		return( TRUE );                 /* didn't need it after all */
	}

return( FALSE );
}

/*************************************************************************
 * NAME
 *    chk_penv_right    2.1b1 hab
 * ARGUMENTS
 *    size - size of right-hand string that matched
 *    right - NUL-terminated left-hand string to be checked
 *    env  - pointer to list of left-hand side env_item's
 * DESCRIPTION
 *    Check what to do based on size of matched string.
 * RETURN VALUE
 *    TRUE if successful, FALSE if unsuccessful
 */
static int chk_penv_right(size,right,env)
int size;
char *right;
AmpleEnvItem *env;
{
	/*
	 *  figure out what to do based on success (stored in size) , E_NOT,
	 *  and E_OPTIONAL
	 */
if (    (size && !(env->iFlags & E_NOT)) ||
		(!size && (env->iFlags & E_NOT)) )
	{
	if (penv_right( right + (size ? size : 1), env->pNext) )
		return( TRUE );
	}
if (env->iFlags & E_OPTIONAL)		/* 1.4y BJY */
	{
	if (penv_right( right, env->pNext ))
		return( TRUE );
	}
return( FALSE );
}

/*************************************************************************
 * NAME
 *    penv_left             2.1b1 hab
 * ARGUMENTS
 *    left - NUL-terminated left-hand string to be checked
 *    env  - pointer to list of left-hand side env_item's
 * DESCRIPTION
 *    Check whether the given string matches the given environment items.
 *    This is a recursive function.
 * RETURN VALUE
 *    nonzero if successful, zero if unsuccessful
 */
static int penv_left(left, env)
char *left;
AmpleEnvItem *env;
{
int size;
char *myleft;
int mylength;
StringList *sp;

if (env == (AmpleEnvItem *)NULL)
	return( TRUE );             /* no (more) environment */
if (left == (char *)NULL)
	return( FALSE );            /* no string at all?? */
/*
 *  If we had the DECUS C function salloc() or the 4.2BSD Unix function
 *  alloca() guaranteed to be available [these allocate storage on the
 *  stack, which gets reclaimed automatically when the function exits],
 *  this would be a virtual mirror image of penv_right() below.  Alas,
 *  this is not guaranteed, so I allocate space explicitly and use
 *  myriads of goto's instead of return's in order to guarantee that the
 *  space is released.
 */
mylength = strlen(left)+1;
myleft = strcpy(allocMemory((unsigned)mylength),left);
/*
 *  match the current environment against what's wanted
 */
for (;; strcpy(left,shorten(myleft,1)) )
	{
	/*
	 *  handle hitting the beginning of the word
	 */
	if (*left == NUL)
		{
		if ((env->iFlags&E_CLASS) || (env->u.pszString!=(char *)NULL))
			{
			if (    (env->iFlags & E_OPTIONAL) &&
			penv_left(left,env->pNext))
				goto goodleft;
			if (    (env->iFlags & E_NOT) &&
					(env->pNext==(AmpleEnvItem *)NULL) )
				goto goodleft;          /* boundary is "NOT something" */
			else
				goto badleft;           /* had to match something more */
			}
		else
			{                           /* boundary */
			if (env->iFlags & E_NOT)
				goto badleft;           /* didn't want this boundary */
			else
				{
				/* Check for end of environment */
				if ( env->pNext == (AmpleEnvItem *)NULL )
					goto goodleft;
		goto badleft;
				}
			}
		}
	/*
	 *  handle having something to match against
	 */
	if ( env->iFlags & E_CLASS )
		{                               /* check against a punctuation class */
		size = 0;                       /* assume it won't be in the class */
										/* for each element that matches the
										   string, see if it will work */
		for ( sp = ((PunctClass *)env->u.pClass)->pMembers ;
			  sp != NULL ;
			  sp = sp->pNext )
		   {
#ifdef MSDOS
#ifdef AZTEC
#ifndef BIGMEM
#define BAD_COMPILER_CODE_GENERATION
#endif
#endif
#endif
		   if (matchEnd(left,sp->pszString))
			  {
			  size = strlen(sp->pszString);
			  if (chk_penv_left (size, left, env, sp->pszString) )
		  goto goodleft;
			  }
#ifdef BAD_COMPILER_CODE_GENERATION
		   strcpy("","");
#endif
			}
	/* if did not match the class */
	/* check for negation, etc. */
		if (size == 0 && chk_penv_left(0, left, env, "") )
		goto goodleft;
	goto badleft;
		}
	else if (env->u.pszString != (char *)NULL)
		{                               /* check against a literal string */
		size = (matchEnd(left,env->u.pszString)) ?
								strlen(env->u.pszString) : 0;
										/* check for validity */
		if (chk_penv_left(size, left, env, "") )
		goto goodleft;
		}
	else
		{                               /* check word initial condition */
		if (    ((env->iFlags & E_NOT) && (*left != NUL)) ||
				(!(env->iFlags & E_NOT) && (env->iFlags & E_ELLIPSIS)) ||
				(!(env->iFlags & E_NOT) && (*left == NUL)) )
			goto goodleft;              /* word boundary condition okay */
		else
			goto badleft;
		}
	goto badleft;                   /* had to match here */
	}

goodleft:
freeMemory( myleft );                       /* too bad we don't have salloc() */
return( TRUE );

badleft:
freeMemory( myleft );                       /*   or alloca() to use!! */
return( FALSE );
} /* end of penv_left() */

/*************************************************************************
 * NAME
 *    penv_right   2.1b1  hab
 * ARGUMENTS
 *    right - NUL-terminated right-hand string to be checked
 *            (environment into which we are attempting to place
 *            the allomorph )
 *    env   - pointer to list of right-hand side env_item's
 *            (environment constraints)
 * DESCRIPTION
 *    Check whether the given string matches the given environment items.
 *    This is a recursive function, thanks to ellipses.
 * RETURN VALUE
 *    nonzero if successful, zero if unsuccessful
 */
static int penv_right(right, env)
char *right;
AmpleEnvItem *env;
{
int size;
StringList *sp;

if (env == (AmpleEnvItem *)NULL)
	return( TRUE );             /* no (more) environment */
if (right == (char *)NULL)
	return( FALSE );            /* no string at all?? */
/*
 *  match the current environment against what's wanted
 */
for (;; ++right )
	{
	/*
	 *  handle hitting the end of the word
	 */
	if (*right == NUL)
		{
		if ((env->iFlags&E_CLASS) || (env->u.pszString!=(char *)NULL))
			{
		/* item we are looking for is not a word boundary */
			if (    (env->iFlags & E_OPTIONAL) &&
			penv_right(right,env->pNext) )
		/*
		 *  item we are looking for is optional and remainder of
		 *  desired environment matches
		 */
				return( TRUE );
			if (    (env->iFlags & E_NOT) && /* we don't want to see this
												  item */
					(env->pNext==(AmpleEnvItem *)NULL) )
						/* no additional items in desired environment */
				return( TRUE );         /* boundary is "NOT something" */
			else
				return( FALSE );        /* had to match something more */
			}
		else
			{
			if (env->iFlags & E_NOT)
				return( FALSE );        /* didn't want this boundary */
			else
				{
				/* Check for end of environment */
				if ( env->pNext == (AmpleEnvItem *)NULL )
					return( TRUE );
				return( FALSE );
				}
			}
		}
	/*
	 *  handle having something to match against
	 *  (we won't get here if we hit end of word)
	 */
	if ( env->iFlags & E_CLASS )
		{                               /* check against a punctuation class */
		size = 0;                       /* assume it won't match */
										/* for each element that matches the
										   string, see if it will work */
		for ( sp = ((PunctClass *)env->u.pClass)->pMembers ;
			  sp != (StringList *)NULL ;
			  sp = sp->pNext )
		   {
		   if (matchBeginning(right,sp->pszString))
			  {
			  size = strlen(sp->pszString);
			  if (chk_penv_right (size, right, env) )
		  return( TRUE );
			  }
		   }
	/* if it did not match the class */
	/*  check for negation, etc. */
		if (size == 0 && chk_penv_right(0, right, env))
		return( TRUE );
		return( FALSE );
		}
	else if (env->u.pszString != (char *)NULL)
		{                               /* check against a literal string */
		size = (matchBeginning(right,env->u.pszString)) ?
								strlen(env->u.pszString) : 0;
										/* check for validity */
		if (chk_penv_right(size, right, env) )
		return( TRUE );
		}
	else /* this environment item is a word boundary */
		{                               /* check word final condition */
		if (env->iFlags & E_NOT)
			return( *right != NUL );    /* ellipses don't matter for ~# */
		return( *right == NUL );
		}
	return( FALSE );                /* had to match here */
	}
} /* end of penv_right() */

/*************************************************************************
 * NAME
 *    checkStampPunctEnvironment
 * ARGUMENTS
 *    leftstring  - pointer to the leftside environment string
 *    leftsize    - length of the leftside environment string
 *    rightstring - pointer to the rightside environment string
 *    ec          - pointer to the allomorph's string environment
 * DESCRIPTION
 *    Check if this allomorph is allowed by it's punctuation
 *    environment.
 *      (Note: the allomorph string begins at leftstring+leftsize and
 *                                and ends at rightstring;
 *             the length of the allomorph string is
 *                      rightstring - (leftstring+leftsize)  )
 * RETURN VALUE
 *    nonzero if okay, zero if the environment is wrong
 */
int checkStampPunctEnvironment(leftstring, leftsize, rightstring, ec)
char *leftstring;
int leftsize;
char *rightstring;
AmpleEnvConstraint *ec;
{
char *left;
int val;

/*
 *  handle null arguments safely
 */
if (ec == (AmpleEnvConstraint *)NULL)
	return( TRUE );             /* no environment constraint at all */
if (leftstring == (char *)NULL)
	{
	leftstring = "";
	leftsize   = 0;
	}
if (rightstring == (char *)NULL)
	rightstring = "";
/*
 *  allocate space for a copy of the leftside string
 */
left = allocMemory( (unsigned)leftsize+1 );
/*
 *  go through the list of punctuation environment conditions, quitting at the
 *  first one that succeeds
 */
for ( ; ec != (AmpleEnvConstraint *)NULL ; ec = ec->pNext )
	{
	strncpy(left, leftstring, leftsize);   /* need fresh copy each time */
	left[leftsize] = NUL;               /* Ensure null termination */
	val = penv_left( left, ec->pLeftEnv) &&
		  penv_right( rightstring, ec->pRightEnv);
	if (ec->bNot)           /* check for negative environment */
		val = !val;
	if (val)
		break;                          /* both sides okay, so quit */
	}
freeMemory( left );                         /* free the allocated space */
return( val );
} /* end of checkStampPunctEnvironment() */
