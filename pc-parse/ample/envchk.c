/* ENVCHK.C - check string environment constraints
 ***************************************************************************
 *
 * int checkAmpleStringEnviron(char *               leftstring,
 *                             int                  leftsize,
 *                             char *               rightstring,
 *                             AmpleEnvConstraint * ec,
 *                             AmpleWord *          pPreviousWord_in,
 *                             AmpleWord *          pNextWord_in,
 *                             AmpleData *          pAmpleData_in)
 *
 * int checkAmpleMorphEnviron(AmpleHeadList *      left,
 *                            AmpleHeadList *      right,
 *                            AmpleEnvConstraint * menv,
 *                            AmpleWord *          pPreviousWord_in,
 *                            AmpleWord *          pNextWord_in,
 *                            AmpleData *          pAmpleData_in)
 *
 * int checkAmplePunctEnviron(AmpleEnvConstraint * ec,
 *                            AmpleWord *          pCurrentWord_in,
 *                            AmpleData *          pAmpleData_in)
 *
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "ample.h"
#include "ampledef.h"

/********************* ENVCHK.C FUNCTION PROTOTYPES *********************/

static char *	shorten		P((char * string,
				   int    size));
static int	chk_senv_left	P((int            size,
				   char *         left,
				   AmpleEnvItem * env,
				   char *         match));
static int	chk_senv_right	P((int            size,
				   char *         right,
				   AmpleEnvItem * env,
				   AmpleData *    pAmpleData_in));
static int	senv_left	P((char *         left,
				   AmpleEnvItem * env));
static int	senv_right	P((char *         right,
				   AmpleEnvItem * env,
				   AmpleData *    pAmpleData_in));

				/* 3.3.0 hab */
static int	chk_penv_left	P((int            size,
				   char *         left,
				   AmpleEnvItem * env,
				   char *         match));
static int	chk_penv_right	P((int            size,
				   char *         right,
				   AmpleEnvItem * env));
static int	penv_left	P((char *         left,
				   AmpleEnvItem * env));
static int	penv_right	P((char *         right,
				   AmpleEnvItem * env));

static int	menv_left	P((AmpleHeadList * left,
				   AmpleEnvItem *  env,
				   AmpleData *     pAmpleData_in));
static int	menv_right	P((AmpleHeadList * right,
				   AmpleEnvItem *  env,
				   AmpleData *     pAmpleData_in));

static AmpleWord *	pPreviousWord_m = NULL;
static AmpleWord *	pNextWord_m     = NULL;

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
	return(string);		/* check for reasonable arguments */

len = strlen(string) - size;	/* find out where to chop */
if (len <= 0)
	*string = NUL;		/* nothing left of the string... */
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
static int chk_senv_left(size,left,env,match)
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
	{					/* happily progress along */
	if (senv_left( shorten(left,(size ? size : 1)), env->pNext ))
	return( TRUE );
					/* restore matched string that was
					   deleted by shorten */
	cpystr((left + strlen(left)), match);
	}
if (env->iFlags & E_OPTIONAL)
	{
	if (senv_left( left, env->pNext ))
	return( TRUE );			/* didn't need it after all */
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
static int chk_senv_right(size,right,env, pAmpleData_in)
int		size;
char *		right;
AmpleEnvItem *	env;
AmpleData *	pAmpleData_in;
{
	/*
	 *  figure out what to do based on success (stored in size) , E_NOT,
	 *  and E_OPTIONAL
	 */
if (    (size && !(env->iFlags & E_NOT)) ||
	(!size && (env->iFlags & E_NOT)) )
	{
	if (senv_right( right + (size ? size : 1), env->pNext, pAmpleData_in))
	return( TRUE );
	}
if (env->iFlags & E_OPTIONAL)
	{
	if (senv_right( right, env->pNext, pAmpleData_in))
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
static int senv_left(left,env)
char *left;
AmpleEnvItem *env;
{
int size;
char *myleft;
StringList *sp;
char *temp_word;

if (env == (AmpleEnvItem *)NULL)
	return( TRUE );		/* no (more) environment */
if (left == (char *)NULL)
	return( FALSE );		/* no string at all?? */
/*
 *  If we had the DECUS C function salloc() or the 4.2BSD Unix function
 *  alloca() guaranteed to be available [these allocate storage on the
 *  stack, which gets reclaimed automatically when the function exits],
 *  this would be a virtual mirror image of senv_right() below.  Alas,
 *  this is not guaranteed, so I allocate space explicitly and use
 *  myriads of goto's instead of return's in order to guarantee that the
 *  space is released.
 */
myleft = duplicateString( left );
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
		if ((env->iFlags & E_OPTIONAL) && senv_left(left,env->pNext))
		goto goodleft;
		if ((env->iFlags & E_NOT) &&
		(env->pNext==(AmpleEnvItem *)NULL) )
		goto goodleft;		/* boundary is "NOT something" */
		else
		goto badleft;           /* had to match something more */
		}
	else
		{				/* boundary */
		if (env->iFlags & E_NOT)
		goto badleft;		/* didn't want this boundary */
		else if ((pPreviousWord_m == NULL) ||
			 (pPreviousWord_m->pTemplate == NULL) )
			{
			/* Check for end of environment */
			if (env->pNext == (AmpleEnvItem *)NULL)
			goto goodleft;
		else
			goto badleft;
			}
		else
		{
#if OLD
		/* preserve pPreviousWord_m->pszWord from demolition by
		   senv_left() */
		if (	(pPreviousWord_m != NULL) &&
			(pPreviousWord_m->pTemplate != NULL) &&
			(pPreviousWord_m->pTemplate->pszWord != NULL) )
			temp_word = duplicateString(
					  pPreviousWord_m->pTemplate->pszWord);
		else
			temp_word = NULL;

		if (senv_left(temp_word,env->pNext))
			{
			if (temp_word != NULL)
			freeMemory(temp_word);
			goto goodleft;
			}
		else
			{
			if (temp_word != NULL)
			freeMemory(temp_word);
			goto badleft;
			}
#else
		/*
		 *  Check string environment of previous word
		 */
		if (	(pPreviousWord_m != NULL) &&
			(pPreviousWord_m->pTemplate != NULL) &&
			(pPreviousWord_m->pTemplate->paWord != NULL) )
			{
			size_t	i;

			for ( i = 0 ; pPreviousWord_m->pTemplate->paWord[i] ; ++i )
			{
			temp_word = duplicateString(
					pPreviousWord_m->pTemplate->paWord[i]);
			if (senv_left(temp_word,env->pNext))
				{
				freeMemory(temp_word);
				goto goodleft;
				}
			else
				freeMemory(temp_word);
			}
			}
		else
			{
			temp_word = NULL;
			if (senv_left(NULL,env->pNext))
			goto goodleft;
			}
		goto badleft;
#endif
		}
		}
	}
	/*
	 *  handle having something to match against
	 */
	if ( env->iFlags & E_CLASS )
	{				/* check against a string class */
	size = 0;			/* assume it won't be in the class */
					/* for each element that matches the
					   string, see if it will work */
	for ( sp = ((StringClass *)(env->u.pClass))->pMembers ;
		  sp != (StringList *)NULL ;
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
		  if (chk_senv_left (size, left, env, sp->pszString) ) goto goodleft;
		  }
#ifdef BAD_COMPILER_CODE_GENERATION
	   strcpy("","");
#endif
		}
	if (size == 0 &&                /* check for negation, etc. */
		chk_senv_left(0, left, env, "") ) goto goodleft;
					/* if we are in an ellipsis, break
					   out to the iteration on left.*/
	if  ( env->iFlags & E_ELLIPSIS) continue;		/* 1.9s BJY */
	 goto badleft;
	}
	else if (env->u.pszString != (char *)NULL)
	{				/* check against a literal string */
	size = (matchEnd(left,env->u.pszString)) ?
				strlen(env->u.pszString) : 0;
					/* check for validity */
	if (chk_senv_left(size, left, env, "") ) goto goodleft;
	}
	else
	{				/* check word initial condition */
	if (	((env->iFlags & E_NOT) && (*left != NUL)) ||
		(!(env->iFlags & E_NOT) && (env->iFlags & E_ELLIPSIS)) ||
		(!(env->iFlags & E_NOT) && (*left == NUL)) )
		goto goodleft;		/* word boundary condition okay */
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
freeMemory( myleft );			/* too bad we don't have salloc() */
return( TRUE );

badleft:
freeMemory( myleft );			/*   or alloca() to use!! */
return( FALSE );
} /* end of senv_left() */

/*************************************************************************
 * NAME
 *    senv_right
 * ARGUMENTS
 *    right - NUL-terminated right-hand string to be checked
 *    env   - pointer to list of right-hand side env_item's
 * DESCRIPTION
 *    Check whether the given string matches the given environment items.
 *    This is a recursive function, thanks to ellipses.
 * RETURN VALUE
 *    nonzero if successful, zero if unsuccessful
 */
static int senv_right(right,env, pAmpleData_in)
char *		right;
AmpleEnvItem *	env;
AmpleData *	pAmpleData_in;
{
int size;
StringList *sp;
char *temp_word;

if (env == (AmpleEnvItem *)NULL)
	return( TRUE );		/* no (more) environment */
if (right == (char *)NULL)
	return( FALSE );		/* no string at all?? */
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
	if ((env->iFlags & E_CLASS) || (env->u.pszString != NULL))
		{
		if (    (env->iFlags & E_OPTIONAL) &&
			senv_right(right,env->pNext, pAmpleData_in) )
		return( TRUE );
		if ((env->iFlags & E_NOT) &&
		(env->pNext == NULL) )
		return( TRUE );		/* boundary is "NOT something" */
		else
		return( FALSE );	/* had to match something more */
		}
	else
		{
		if (env->iFlags & E_NOT)
		return( FALSE );	/* didn't want this boundary */
		if (    (pNextWord_m            == NULL) ||
			(pNextWord_m->pTemplate == NULL))
		{
		/* Check for end of environment */
		if (env->pNext == NULL)
			return(TRUE);
		else
			return(FALSE);
		}
		else
		{
		/* If we're already in the next word, we can't look ahead
		   any further */
		if (pNextWord_m == NULL)
			{
			pAmpleData_in->bMultiDependency = TRUE;
			return(FALSE);
			}
#if OLD
		/*
		 *  Check string environment of next word, making sure
		 *  senv_right() doesn't demolish pNextWord_m->pszWord
		 */
		if (	(pNextWord_m->pTemplate != NULL) &&
			(pNextWord_m->pTemplate->pszWord != NULL) )
			temp_word = duplicateString(
						  pNextWord_m->pTemplate->pszWord);
		else
			temp_word = NULL;
		if (senv_right(temp_word,env->pNext, pAmpleData_in))
			{
			if (temp_word != NULL)
			freeMemory(temp_word);
			return(TRUE);
			}
		else
			{
			if (temp_word != NULL)
			freeMemory(temp_word);
			return(FALSE);
			}
#else
		/*
		 *  Check string environment of next word
		 */
		if (	(pNextWord_m->pTemplate != NULL) &&
			(pNextWord_m->pTemplate->paWord != NULL) )
			{
			size_t	i;

			for ( i = 0 ; pNextWord_m->pTemplate->paWord[i] ; ++i )
			{
			temp_word = duplicateString(
						pNextWord_m->pTemplate->paWord[i]);
			if (senv_right(temp_word,env->pNext, pAmpleData_in))
				{
				freeMemory(temp_word);
				return(TRUE);
				}
			else
				freeMemory(temp_word);
			}
			}
		else
			{
			if (senv_right(NULL,env->pNext, pAmpleData_in))
			return(TRUE);
			}
		return(FALSE);
#endif
		}
		}
	}
	/*
	 *  handle having something to match against
	 */
	if ( env->iFlags & E_CLASS )
	{				/* check against a string class */
	size = 0;			/* assume it won't match */
					/* for each element that matches the
					   string, see if it will work */
	for ( sp = ((StringClass *)(env->u.pClass))->pMembers ;
		  sp != (StringList *)NULL ;
		  sp = sp->pNext )
	   {
	   if (matchBeginning(right,sp->pszString))
		  {
		  size = strlen(sp->pszString);
		  if (chk_senv_right(size, right, env, pAmpleData_in) )
		  return( TRUE );
		  }
	   }
	if (	(size == 0) &&                /*  check for negation, etc. */
		chk_senv_right(0, right, env, pAmpleData_in) )
		return( TRUE );
					/* if we are in an ellipsis, break
					   out to the iteration on right.*/
	if  ( env->iFlags & E_ELLIPSIS) continue;	/* 1.9s BJY */
	return( FALSE );
	}
	else if (env->u.pszString != (char *)NULL)
	{				/* check against a literal string */
	size = (matchBeginning(right,env->u.pszString)) ?
						strlen(env->u.pszString) : 0;
					/* check for validity */
	if (chk_senv_right(size, right, env, pAmpleData_in) )
		return( TRUE );
	}
	else
	{				/* check word final condition */
	if (env->iFlags & E_NOT)
		return( *right != NUL );	/* ellipses don't matter for ~# */
	if (env->iFlags & E_ELLIPSIS)
		return( TRUE );		/* we always eventually end! */
	return( *right == NUL );
	}
	/*
	 *  now check for E_ELLIPSIS case
	 */
	if (!(env->iFlags & E_ELLIPSIS))
	return( FALSE );		/* had to match here */
	/* if we reach here, we try again further out (due to '...') */
	}
} /* end of senv_right() */

/*************************************************************************
 * NAME
 *    checkAmpleStringEnviron
 * ARGUMENTS
 *    leftstring  - pointer to the leftside environment string
 *    leftsize    - length of the leftside environment string
 *    rightstring - pointer to the rightside environment string
 *    ec          - pointer to the allomorph's string environment
 * DESCRIPTION
 *    Check if this allomorph is allowed by it's surface (string)
 *    environment.
 *	(Note: the allomorph string begins at leftstring+leftsize and
 *				  and ends at rightstring;
 *	       the length of the allomorph string is
 *			rightstring - (leftstring+leftsize)  )
 * RETURN VALUE
 *    nonzero if okay, zero if the environment is wrong
 */
int checkAmpleStringEnviron(leftstring, leftsize, rightstring, ec,
				pPreviousWord_in, pNextWord_in, pAmpleData_in)
char *			leftstring;
int			leftsize;
char *			rightstring;
AmpleEnvConstraint *	ec;
AmpleWord *		pPreviousWord_in;
AmpleWord *		pNextWord_in;
AmpleData *		pAmpleData_in;
{
char *left;
int val = 0;
/*
 *  handle null arguments safely
 */
if (ec == (AmpleEnvConstraint *)NULL)
	return( TRUE );		/* no environment constraint at all */
if (leftstring == (char *)NULL)
	{
	leftstring = "";
	leftsize   = 0;
	}
if (rightstring == (char *)NULL)
	rightstring = "";

pPreviousWord_m = pPreviousWord_in;
pNextWord_m     = pNextWord_in;
/*
 *  allocate space for a copy of the leftside string
 */
left = allocMemory( leftsize+1 );
/*
 *  go through the list of string environment conditions, quitting at the
 *  first one that succeeds
 */
for ( ; ec != (AmpleEnvConstraint *)NULL ; ec = ec->pNext )
	{
	strncpy(left, leftstring, leftsize);   /* need fresh copy each time */
	left[leftsize] = NUL;		/* Ensure null termination */
	val = senv_left( left,        ec->pLeftEnv) &&
	  senv_right(rightstring, ec->pRightEnv, pAmpleData_in);
	/* check for negative environment */
	if (    ec->bNot /*&&
		!pAmpleData_in->bMultiDependency &&
		(	(pNextWord_m == NULL) ||
		!pAmpleData_in->bMorphemeLookahead ||
		pAmpleData_in->bLookaheadDone ) */)
	val = !val;
	if (val)
	break;				/* both sides okay, so quit */
	}
freeMemory( left );				/* free the allocated space */
return( val );
} /* end of checkAmpleStringEnviron() */

/*************************************************************************
 * NAME
 *    chk_penv_left    3.3.0 hab
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
	{					/* happily progress along */
	if (penv_left( shorten(left,(size ? size : 1)), env->pNext ))
	return( TRUE );
					/* restore matched string that was
					   deleted by shorten */
	cpystr((left + strlen(left)), match);
	}
if (env->iFlags & E_OPTIONAL)
	{
	if (penv_left( left, env->pNext ))
	return( TRUE );			/* didn't need it after all */
	}

return( FALSE );
}

/*************************************************************************
 * NAME
 *    chk_penv_right   3.3.0 hab
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
int		size;
char *		right;
AmpleEnvItem *	env;
{
	/*
	 *  figure out what to do based on success (stored in size) , E_NOT,
	 *  and E_OPTIONAL
	 */
if (    (size && !(env->iFlags & E_NOT)) ||
	(!size && (env->iFlags & E_NOT)) )
	{
	if (penv_right( right + (size ? size : 1), env->pNext))
	return( TRUE );
	}
if (env->iFlags & E_OPTIONAL)
	{
	if (penv_right( right, env->pNext))
	return( TRUE );
	}
return( FALSE );
}

/*************************************************************************
 * NAME
 *    penv_left   3.3.0 hab
 * ARGUMENTS
 *    left - NUL-terminated left-hand string to be checked
 *    env  - pointer to list of left-hand side env_item's
 * DESCRIPTION
 *    Check whether the given string matches the given environment items.
 *    This is a recursive function.
 * RETURN VALUE
 *    nonzero if successful, zero if unsuccessful
 */
static int penv_left(left,env)
char *left;
AmpleEnvItem *env;
{
int size;
char *myleft;
StringList *sp;

if (env == (AmpleEnvItem *)NULL)
	return( TRUE );		/* no (more) environment */
if (left == (char *)NULL)
	return( FALSE );		/* no string at all?? */
/*
 *  If we had the DECUS C function salloc() or the 4.2BSD Unix function
 *  alloca() guaranteed to be available [these allocate storage on the
 *  stack, which gets reclaimed automatically when the function exits],
 *  this would be a virtual mirror image of penv_right() below.  Alas,
 *  this is not guaranteed, so I allocate space explicitly and use
 *  myriads of goto's instead of return's in order to guarantee that the
 *  space is released.
 */
myleft = duplicateString( left );
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
		if ((env->iFlags & E_OPTIONAL) && penv_left(left,env->pNext))
		goto goodleft;
		if ((env->iFlags & E_NOT) &&
		(env->pNext==(AmpleEnvItem *)NULL) )
		goto goodleft;		/* boundary is "NOT something" */
		else
		goto badleft;           /* had to match something more */
		}
	else
		{				/* boundary */
		if (env->iFlags & E_NOT)
		goto badleft;		/* didn't want this boundary */
		else /* Check for end of environment */
			{
			if (env->pNext == (AmpleEnvItem *)NULL)
			goto goodleft;
		else
			goto badleft;
			}
		}
	}
	/*
	 *  handle having something to match against
	 */
	if ( env->iFlags & E_CLASS )
	{				/* check against a punctuation class */
	size = 0;			/* assume it won't be in the class */
					/* for each element that matches the
					   string, see if it will work */
	for ( sp = ((PunctClass *)(env->u.pClass))->pMembers ;
		  sp != (StringList *)NULL ;
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
		  if (chk_penv_left (size, left, env, sp->pszString) ) goto goodleft;
		  }
#ifdef BAD_COMPILER_CODE_GENERATION
	   strcpy("","");
#endif
		}
	if (size == 0 &&                /* check for negation, etc. */
		chk_penv_left(0, left, env, "") ) goto goodleft;
	goto badleft;
	}
	else if (env->u.pszString != (char *)NULL)
	{				/* check against a literal string */
	size = (matchEnd(left,env->u.pszString)) ?
				strlen(env->u.pszString) : 0;
					/* check for validity */
	if (chk_penv_left(size, left, env, "") ) goto goodleft;
	}
	else
	{				/* check word initial condition */
	if (	((env->iFlags & E_NOT) && (*left != NUL)) ||
		(!(env->iFlags & E_NOT) && (env->iFlags & E_ELLIPSIS)) ||
		(!(env->iFlags & E_NOT) && (*left == NUL)) )
		goto goodleft;		/* word boundary condition okay */
	else
		goto badleft;
	}
	goto badleft;                   /* had to match here */
	}

goodleft:
freeMemory( myleft );			/* too bad we don't have salloc() */
return( TRUE );

badleft:
freeMemory( myleft );			/*   or alloca() to use!! */
return( FALSE );
} /* end of penv_left() */

/*************************************************************************
 * NAME
 *    penv_right     3.3.0 hab
 * ARGUMENTS
 *    right - NUL-terminated right-hand string to be checked
 *    env   - pointer to list of right-hand side env_item's
 * DESCRIPTION
 *    Check whether the given string matches the given environment items.
 *    This is a recursive function, thanks to ellipses.
 * RETURN VALUE
 *    nonzero if successful, zero if unsuccessful
 */
static int penv_right(right,env)
char *		right;
AmpleEnvItem *	env;
{
int size;
StringList *sp;

if (env == (AmpleEnvItem *)NULL)
	return( TRUE );		/* no (more) environment */
if (right == (char *)NULL)
	return( FALSE );		/* no string at all?? */
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
	if ((env->iFlags & E_CLASS) || (env->u.pszString != NULL))
		{
		if (    (env->iFlags & E_OPTIONAL) &&
			penv_right(right,env->pNext) )
		return( TRUE );
		if ((env->iFlags & E_NOT) &&
		(env->pNext == NULL) )
		return( TRUE );		/* boundary is "NOT something" */
		else
		return( FALSE );	/* had to match something more */
		}
	else
		{
		if (env->iFlags & E_NOT)
		return( FALSE );	/* didn't want this boundary */
		if (    (pNextWord_m            == NULL) ||
			(pNextWord_m->pTemplate == NULL))
		{
		/* Check for end of environment */
		if (env->pNext == NULL)
			return(TRUE);
		else
			return(FALSE);
		}
		else
		{
		/* we can't look ahead any further */
		return(FALSE);
		}
		}
	}
	/*
	 *  handle having something to match against
	 */
	if ( env->iFlags & E_CLASS )
	{				/* check against a punctuation class */
	size = 0;			/* assume it won't match */
					/* for each element that matches the
					   string, see if it will work */
	for ( sp = ((PunctClass *)(env->u.pClass))->pMembers ;
		  sp != (StringList *)NULL ;
		  sp = sp->pNext )
	   {
	   if (matchBeginning(right,sp->pszString))
		  {
		  size = strlen(sp->pszString);
		  if (chk_penv_right(size, right, env) )
		  return( TRUE );
		  }
	   }
	if (	(size == 0) &&                /*  check for negation, etc. */
		chk_penv_right(0, right, env) )
		return( TRUE );
	return( FALSE );
	}
	else if (env->u.pszString != (char *)NULL)
	{				/* check against a literal string */
	size = (matchBeginning(right,env->u.pszString)) ?
						strlen(env->u.pszString) : 0;
					/* check for validity */
	if (chk_penv_right(size, right, env) )
		return( TRUE );
	}
	else
	{				/* check word final condition */
	if (env->iFlags & E_NOT)
		return( *right != NUL );	/* ellipses don't matter for ~# */
	return( *right == NUL );
	}
	return( FALSE );		/* had to match here */
	}
} /* end of penv_right() */

/*************************************************************************
 * NAME
 *    checkAmplePunctEnviron    3.3.0 hab
 * ARGUMENTS
 *    leftstring  - pointer to the leftside environment string
 *    leftsize    - length of the leftside environment string
 *    rightstring - pointer to the rightside environment string
 *    ec          - pointer to the allomorph's string environment
 *    pAmpleData_in   - pointer to Ample parsing control data
 * DESCRIPTION
 *    Check if this allomorph is allowed by its punctuation
 *    environment.
 *    the rightside string is the trailing non-alphabetics string
 *    the leftside string is the preceding format string
 * RETURN VALUE
 *    nonzero if okay, zero if the environment is wrong
 */
int checkAmplePunctEnviron(leftstring, leftsize, rightstring, ec,
			   pAmpleData_in)
char *			leftstring;
int			leftsize;
char *			rightstring;
AmpleEnvConstraint *	ec;
AmpleData *		pAmpleData_in;
{
char *left;
int val = 0;
/*
 *  handle null arguments safely
 */
if (ec == (AmpleEnvConstraint *)NULL)
	return( TRUE );		/* no environment constraint at all */
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
left = allocMemory( leftsize+1 );
/*
 *  go through the list of punctuation environment conditions, quitting at the
 *  first one that succeeds
 */
for ( ; ec != (AmpleEnvConstraint *)NULL ; ec = ec->pNext )
	{
	strncpy(left, leftstring, leftsize);   /* need fresh copy each time */
	left[leftsize] = NUL;		/* Ensure null termination */
	val = penv_left( left,        ec->pLeftEnv) &&
	  penv_right(rightstring, ec->pRightEnv);
	/* check for negative environment */
	if (ec->bNot)
	val = !val;
	if (val)
	break;				/* both sides okay, so quit */
	}
return( val );
} /* end of checkAmplePunctEnviron() */

/*************************************************************************
 * NAME
 *    menv_left
 * ARGUMENTS
 *    left - pointer to list of left-hand side headlist's
 *    env  - pointer to list of left-hand side env_item's
 * DESCRIPTION
 *    Check whether the headlist's match the env_item's okay.
 *    This is very recursive.
 * RETURN VALUE
 *    nonzero if successful, zero if unsuccessful
 */
static int menv_left(left, env, pAmpleData_in)
AmpleHeadList *	left;
AmpleEnvItem *	env;
AmpleData *	pAmpleData_in;
{
register int		val;
char *			name;
unsigned short		uiProperty;
int			tc;
AmpleHeadlistList *	hl_ambp;
AmpleHeadList *		nextleft;
AmpleCategoryClass *	tcl;  /* 1.9s BJY */

if (env == (AmpleEnvItem *)NULL)
	return( TRUE );         /* no more environment to check */

for (;; left = left->pLeft )
	{
	/*
	 *  handle hitting the beginning of the headlist
	 */
	if (left == (AmpleHeadList *)NULL)
	{
	if ((env->iFlags&E_CLASS) || (env->u.pszString!=(char *)NULL))
		{
		if (    (env->iFlags & E_OPTIONAL) &&
			menv_left(left,env->pNext, pAmpleData_in) )
		return( TRUE );
		if (    (env->iFlags & E_NOT) &&
			(env->pNext==(AmpleEnvItem *)NULL) )
		return( TRUE );         /* boundary is "NOT something" */
		else
		return( FALSE );        /* had to match something more */
		}
	else
		{
		if (env->iFlags & E_NOT)
		return( FALSE );    /* didn't want this boundary */
		else
		{
		/* Check for end of environment */
		if (env->pNext == (AmpleEnvItem *)NULL)
			return( TRUE );     /* wanted this boundary */
		/* If we are already in lookahead mode, then we have a
		   multiple dependency */
		if (pNextWord_m == NULL)
			{
			pAmpleData_in->bMultiDependency = TRUE;
			return(FALSE);
			}
		if (pPreviousWord_m->pTemplate == NULL)
			return(env->pNext == NULL);
		/* at least one ambiguity of previous word must match */
		for (	hl_ambp = pPreviousWord_m->pHeadlists ;
			hl_ambp ;
			hl_ambp = hl_ambp->pNext )
			{
			/* first, find rightmost morpheme */
			for (nextleft = hl_ambp->pHeadList;
			 nextleft->pRight;
			 nextleft = nextleft->pRight)
			; /* do nothing other than keep looking */
			/* now, continue checking for environment match */
			if (menv_left(nextleft, env->pNext, pAmpleData_in))
			return(TRUE);
			}
		return(FALSE);
		}
		}
	}
	/*
	 *  check the current headlist element
	 */
	else if (env->iFlags & E_CLASS)
	{                               /* check against a morpheme class */
	val = isAmpleMorphClassMember( left->pAllomorph->pMORPHNAME,
					   env->u.pClass );
	}
	else if (env->iFlags & E_GROUP)    /* If curly brace construction */
	{
	name = env->u.pszString;   /* Get name */

	if (strcmp( name, "root" ) == 0)    /* If root test */
		val = (left->eType == AMPLE_ROOT);  /* Check for root */

	else if (strcmp( name, "prefix" ) == 0)    /* else if prefix test */
		val = (left->eType == AMPLE_PFX );  /* Check for prefix */

	else if (strcmp( name, "suffix" ) == 0)    /* else if suffix test */
		val = (left->eType == AMPLE_SFX );  /* Check for suffix */

	else if (strcmp( name, "infix" ) == 0)    /* else if infix test */
		val = (left->eType == AMPLE_IFX );  /* Check for infix */
	/*
	 *  If property name, check property
	 */
	else if ((uiProperty = findAmplePropertyNumber(name,
						&pAmpleData_in->sProperties)) != 0)
		val = hasAmpleProperty(left->sPropertySet, uiProperty,
				   &pAmpleData_in->sProperties);
	/*
	 *  If category, check category
	 */
	else if ( (tc = findAmpleCategoryNumber(name,
						pAmpleData_in->pCategories )) )
		{
		if ( left->eType == AMPLE_ROOT )
		val = (tc == left->iROOTCATEG);
		else
		val = (tc == left->iToCategory);
		}

	else if ( (tcl = findAmpleCategClass(name,
						 pAmpleData_in->pCategoryClasses)))
		{				/* 1.9s BJY If category class */
		if ( left->eType == AMPLE_ROOT )
		val = isAmpleCategClassMember( left->iROOTCATEG, tcl );
		else				/* Check category class */
		val = isAmpleCategClassMember( left->iToCategory, tcl );
		}

	else
		val = FALSE;                /* Default to false */
	}
	else if (env->u.pszString != (char *)NULL)
	{                               /* check against a given morpheme */
	val = (strcmp(left->pAllomorph->pMORPHNAME, env->u.pszString) == 0);
	}
	else
	{                               /* check against the word boundary */
	if (env->iFlags & E_NOT)
		return( left != (AmpleHeadList *)NULL );
	else
		val = FALSE;        /* 1.9v BJY */
	}
	/*
	 *  now figure out what to do based on val, E_NOT, E_OPTIONAL, and
	 *  E_ELLIPSIS
	 */
	if (    (val && !(env->iFlags & E_NOT)) ||
	(!val && (env->iFlags & E_NOT)) )
	{
	if (menv_left( left->pLeft, env->pNext, pAmpleData_in))
		return( TRUE );
	}
	else
	{
	if (env->iFlags & E_OPTIONAL)
		{
		if (menv_left( left, env->pNext, pAmpleData_in))
		return( TRUE );
		}
	}

	if (!(env->iFlags & E_ELLIPSIS))
	return( FALSE );                /* had to match here */
	/* if we reach here, we try again further out (due to '...') */
	}
} /* end of menv_left() */

/*************************************************************************
 * NAME
 *    menv_right
 * ARGUMENTS
 *    right - pointer to list of right-hand side headlist's
 *    env   - pointer to list of right-hand side env_item's
 * DESCRIPTION
 *    Check whether the headlist's match the env_item's okay.
 *    This is very recursive.
 * RETURN VALUE
 *    nonzero if successful, zero if unsuccessful
 */
static int menv_right(right,env, pAmpleData_in)
AmpleHeadList *	right;
AmpleEnvItem *	env;
AmpleData *	pAmpleData_in;
{
register int		val;
char *			name;
unsigned short		uiProperty;
int			tc;
AmpleHeadlistList *	hl_ambp;
AmpleCategoryClass *	tcl;  /* 1.9s BJY */

if (env == (AmpleEnvItem *)NULL)
	return( TRUE );         /* no more environment to check */

for (;; right = right->pRight )
	{
	/*
	 *  handle hitting the end of the headlist
	 */
	if (right == (AmpleHeadList *)NULL)
	{
	if ((env->iFlags&E_CLASS) || (env->u.pszString!=(char *)NULL))
		{
		if (    (env->iFlags&E_OPTIONAL) &&
			menv_right(right,env->pNext, pAmpleData_in) )
		return( TRUE );
		if (    (env->iFlags & E_NOT) &&
		(env->pNext==(AmpleEnvItem *)NULL) )
		return( TRUE );     /* boundary is "NOT something" */
		else
		return( FALSE );    /* had to match something more */
		}
	else
		{
		if (env->iFlags & E_NOT)
		return( FALSE );    /* didn't want this boundary */
		else
		{
		/* Check for end of environment */
		if ( env->pNext == (AmpleEnvItem *)NULL )
			return( TRUE );
		/* Can't check next word unless lookahead is done */
		if ( pAmpleData_in->bLookaheadDone )
			{
			if (    (pNextWord_m == NULL) ||
				(pNextWord_m->pTemplate == NULL))
			return( env->pNext == NULL );
			/* at least one ambiguity of next word must match */
			for (   hl_ambp = pNextWord_m->pHeadlists;
				hl_ambp;
				hl_ambp = hl_ambp->pNext)
			{
			if (menv_right(hl_ambp->pHeadList, env->pNext,
					   pAmpleData_in))
				return(TRUE);
			}
			return(FALSE);
			}
		/* If we are already in lookahead mode, then we have a
		   multiple dependency */
		if (pNextWord_m == NULL)
			{
			pAmpleData_in->bMultiDependency = TRUE;
			return( FALSE );
			}
		/* If we get to this point, then we need to tell anproc()
		   to look ahead */
		pAmpleData_in->bMorphemeLookahead = TRUE;
		return( FALSE );
		}
		}
	}
	/*
	 *  check the current headlist element
	 */
	if (env->iFlags & E_CLASS)
	{                               /* check against a morpheme class */
	val = isAmpleMorphClassMember( right->pAllomorph->pMORPHNAME,
					   env->u.pClass );
	}
	else if (env->iFlags & E_GROUP)    /* If curly brace construction */
	{
	name = env->u.pszString;   /* Get name */
	if (strcmp( name, "root" ) == 0)    /* If root test */
		val = (right->eType == AMPLE_ROOT); /* Check for root */

	else if (strcmp( name, "prefix" ) == 0)    /* else if prefix test */
		val = (right->eType == AMPLE_PFX );  /* Check for prefix */

	else if (strcmp( name, "suffix" ) == 0)    /* else if suffix test */
		val = (right->eType == AMPLE_SFX );  /* Check for suffix */

	else if (strcmp( name, "infix" ) == 0)    /* else if infix test */
		val = (right->eType == AMPLE_IFX );  /* Check for infix */
	/*
	 *  If property name, check property
	 */
	else if ((uiProperty = findAmplePropertyNumber(name,
						&pAmpleData_in->sProperties)) != 0)
		val = hasAmpleProperty(right->sPropertySet, uiProperty,
				   &pAmpleData_in->sProperties);
	/*
	 *  If category, check category
	 */
	else if ( (tc = findAmpleCategoryNumber(name,
						pAmpleData_in->pCategories )) )
		{
		if ( right->eType == AMPLE_ROOT )
		val = (tc == right->iROOTCATEG);
		else
		val = (tc == right->iToCategory);
		}

	else if ( (tcl = findAmpleCategClass(name,
						 pAmpleData_in->pCategoryClasses)))
		{				/* 1.9s BJY If category class */
		if ( right->eType == AMPLE_ROOT )
		val = isAmpleCategClassMember( right->iROOTCATEG, tcl );
		else				/* Check category class */
		val = isAmpleCategClassMember( right->iToCategory, tcl );
		}

	else
		val = FALSE;                /* Default to false */
	}
	else if (env->u.pszString != (char *)NULL)
	{                               /* check against a given morpheme */
	val = (strcmp(right->pAllomorph->pMORPHNAME, env->u.pszString) == 0);
	}
	else
	{                               /* check against the word boundary */
	if (env->iFlags & E_NOT)
		return( right != (AmpleHeadList *)NULL );
	else
		val = FALSE;        /* 1.9v BJY */
	}
	/*
	 *  now figure out what to do based on val, E_NOT, E_OPTIONAL, and
	 *  E_ELLIPSIS
	 */
	if (    (val && !(env->iFlags & E_NOT)) ||
	(!val && (env->iFlags & E_NOT)) )
	{
	if (menv_right( right->pRight, env->pNext, pAmpleData_in))
		return( TRUE );
	}
	else
	{
	if (env->iFlags & E_OPTIONAL)
		{
		if (menv_right( right, env->pNext, pAmpleData_in))
		return( TRUE );
		}
	}

	if (!(env->iFlags & E_ELLIPSIS))
	return( FALSE );        /* had to match here */
	/* if we reach here, we try again further out (due to '...') */
	}
} /* end of menv_right() */

/*************************************************************************
 * NAME
 *    checkAmpleMorphEnviron
 * ARGUMENTS
 *    left  - pointer to leftward headlist structure
 *    right - pointer to rightward headlist structure
 *    menv  - pointer to the morpheme environment list
 * DESCRIPTION
 *    Check if we meet the given morpheme environment.
 * RETURN VALUE
 *    nonzero if okay, zero if the environment is wrong
 */
int checkAmpleMorphEnviron(left, right, menv, pPreviousWord_in, pNextWord_in,
			   pAmpleData_in)
AmpleHeadList *		left;
AmpleHeadList *		right;
AmpleEnvConstraint *	menv;
AmpleWord *		pPreviousWord_in;
AmpleWord *		pNextWord_in;
AmpleData *		pAmpleData_in;
{
register int val;

if (menv == (AmpleEnvConstraint *)NULL)
	return( TRUE );                     /* nothing to check */

pPreviousWord_m = pPreviousWord_in;
pNextWord_m     = pNextWord_in;
/*
 *  go through the list of morpheme environment conditions, quitting at the
 *  first one that succeeds
 */
for ( ; menv != (AmpleEnvConstraint *)NULL ; menv = menv->pNext )
	{
	val = menv_left(left,   menv->pLeftEnv,  pAmpleData_in) &&
	  menv_right(right, menv->pRightEnv, pAmpleData_in);
	/* check for negative environment */
	if (    menv->bNot /*&&
		!pAmpleData_in->bMultiDependency &&
		(	(pNextWord_m == NULL) ||
		!pAmpleData_in->bMorphemeLookahead ||
		pAmpleData_in->bLookaheadDone ) */)
	val = !val;
	if (val)
	return( TRUE );
	}
return( FALSE );                        /* nothing succeeded */
} /* end of checkAmpleMorphEnviron() */
