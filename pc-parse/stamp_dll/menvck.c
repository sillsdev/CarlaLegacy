/*      MENVCK.C - check morpheme environment constraints
 ***************************************************************************
 *
 * int checkStampMorphEnviron(StampAnalysis *      left,
 *                            StampAnalysis *      right,
 *                            AmpleEnvConstraint * menv,
 *                            StampData *          pStamp_in)
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#include "stamp.h"

static int menv_left P((StampAnalysis * left,
			AmpleEnvItem *  env,
			StampUnit *	pUnit_in,
			StampData *	pStamp_in));
static int menv_right P((StampAnalysis * right,
			 AmpleEnvItem *  env,
			 StampUnit *	 pUnit_in,
			 StampData *	 pStamp_in));

/*************************************************************************
 * NAME
 *    menv_left
 * ARGUMENTS
 *    left - pointer to list of left-hand side StampAnalysis's
 *    env  - pointer to list of left-hand side env_item's
 * DESCRIPTION
 *    Check whether the StampAnalysis's match the env_item's okay.
 *    This is very recursive.
 * RETURN VALUE
 *    nonzero if successful, zero if unsuccessful
 */
static int menv_left(left,env, pUnit_in, pStamp_in)
StampAnalysis *left;
AmpleEnvItem *env;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
register int val;
char *name;
unsigned short prop;
int tc;
StampAllomorphList *allo;
StampAnalysisList *ambp;
AmpleCategoryClass *tcl;	/* 1.4x BJY */

val = FALSE;                      /* ALB 1.4s bug fix */

if (env == NULL)
	return( TRUE );                     /* no more environment to check */

for (;; left = left->pLeftLink )
	{
	/*
	 *  handle hitting the beginning of the StampAnalysis
	 */
	if (left == NULL)
		{
		if ((env->iFlags&E_CLASS) || (env->u.pszString!=NULL))
			{
			if (    (env->iFlags & E_OPTIONAL) &&
			menv_left(left, env->pNext, pUnit_in, pStamp_in))
				return( TRUE );
			if (    (env->iFlags & E_NOT) &&
					(env->pNext==NULL) )
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
				if (env->pNext == NULL) /* end of env. */
					return( TRUE );
				/* all ambiguities of previous word must succeed */
				for (	ambp = pUnit_in->pPreviousWord->pTrAnalyses ;
			ambp ;
			ambp = ambp->pNext )
					{
					/* find trailing end of previous word */
					for (   left = ambp->pAnal ;
				left->pRightLink ;
				left = left->pRightLink )
						{}
					/* test the morpheme environment */
					if (!menv_left( left, env->pNext, pUnit_in, pStamp_in) )
						return( FALSE );
					}
				return( TRUE );
				}
			}
		}
	/*
	 *  check the current StampAnalysis element
	 */
	if (env->iFlags & E_CLASS)        /* If morpheme class */
		{                               /* check morpheme class */
		val = isAmpleMorphClassMember(left->m.pszMorphname,
					  (AmpleMorphClass *)env->u.pClass);
		}
	else if (env->iFlags & E_GROUP)    /* If curly brace construction */
		{
		name = env->u.pszString;   /* Get name */

		if (strcmp( name, "root" ) == 0)    /* If root test */
			val = (left->m.iMorphType & ROOT);  /* Check for root */

		else if (strcmp( name, "prefix" ) == 0)    /* else if prefix test */
			val = (left->m.iMorphType & PFX );  /* Check for prefix */

		else if (strcmp( name, "suffix" ) == 0)    /* else if suffix test */
			val = (left->m.iMorphType & SFX );  /* Check for suffix */

		else if (strcmp( name, "infix" ) == 0)    /* else if infix test */
			val = (left->m.iMorphType & IFX );  /* Check for infix */

		else if ((prop = findAmplePropertyNumber(name,
						  &pStamp_in->sProperties)) != 0)
			{		/* If property name */
		/* If a current allomorph selected */ /* Check property */
						/* Else check all allos */
			if ( left->pCurrentAllo )
				val = hasAmpleProperty(left->pCurrentAllo->uAlloPropertySet,
					   prop,
					   &pStamp_in->sProperties);
			else
				{
		for ( allo = left->m.pAllomorphs; allo; allo = allo->pNext )
			{
			/* For each allomorph */ /* If it doesn't have prop */
			/* Break with val = false */
			val = hasAmpleProperty( allo->a.uAlloPropertySet,
						prop,
						&pStamp_in->sProperties);
					if (!val)
						break;
			}
		}
		}
		else if ((tc = findAmpleCategoryNumber(name, pStamp_in->pCategories)) != 0)
			{						/* If category */
			if ( left->m.iMorphType & ROOT )
				val = (tc == left->m.iFromCategory);
			else
				val = (tc == left->m.iToCategory);      /* Check category */
			}
		else if ((tcl = findAmpleCategClass(name,
						pStamp_in->pCategClasses)) != NULL)
			{
		/*
		 * If category class, check category class (1.4x BJY)
		 */
			if ( left->m.iMorphType & ROOT )
				val = isAmpleCategClassMember( left->m.iFromCategory, tcl );
			else
				val = isAmpleCategClassMember( left->m.iToCategory, tcl );
			}

		else
			val = FALSE;                /* Default to false */
		}
	else if (env->u.pszString != NULL)
		{                               /* check against a given morpheme */
		val = (strcmp(left->m.pszMorphname, env->u.pszString ) == 0);
		}
	else
		{                               /* check against the word boundary */
		if (env->iFlags & E_NOT)
			return( left != NULL );
		if (env->iFlags & E_ELLIPSIS)
			return( TRUE );
		return( left == NULL );
		}
	/*
	 *  now figure out what to do based on val, E_NOT, E_OPTIONAL, and
	 *  E_ELLIPSIS
	 */
	if (    (val && !(env->iFlags & E_NOT)) ||
			(!val && (env->iFlags & E_NOT)) )
		{
		if (menv_left( left->pLeftLink, env->pNext, pUnit_in, pStamp_in ))
			return( TRUE );
		}
	else if (env->iFlags & E_OPTIONAL)
		{
		if (menv_left( left, env->pNext, pUnit_in, pStamp_in ))
			return( TRUE );
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
 *    right - pointer to list of right-hand side StampAnalysis's
 *    env   - pointer to list of right-hand side env_item's
 * DESCRIPTION
 *    Check whether the StampAnalysis's match the env_item's okay.
 *    This is very recursive.
 * RETURN VALUE
 *    nonzero if successful, zero if unsuccessful
 */
static int menv_right(right,env, pUnit_in, pStamp_in)
StampAnalysis *right;
AmpleEnvItem *env;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
register int val;
char *name;
unsigned short prop;
int tc;
StampAllomorphList *allo;
StampAnalysisList *ambp;
AmpleCategoryClass *tcl;	/* 1.4x BJY */

val = FALSE;               /* ALB 1.4s bug fix */

if (env == NULL)
	return( TRUE );                     /* no more environment to check */

for (;; right = right->pRightLink )
	{
	/*
	 *  handle hitting the end of the StampAnalysis
	 */
	if (right == NULL)
		{
		if ((env->iFlags&E_CLASS) || (env->u.pszString!=NULL))
			{
			if (    (env->iFlags&E_OPTIONAL) &&
			menv_right(right,env->pNext, pUnit_in, pStamp_in))
				return( TRUE );
			if (    (env->iFlags & E_NOT) &&
					(env->pNext==NULL) )
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
				if (env->pNext == NULL) /* end of env. */
					return( TRUE );
				/* If we're already in the next word, we can't look ahead
				   any further */
				if ( pUnit_in->bStringLookahead && !pUnit_in->bLookaheadDone )
					{
					pUnit_in->bMultiDependency = TRUE;
					return( FALSE );
					}
				/* all ambiguities of next word must succeed */
				for (	ambp = pUnit_in->pNextWord->pTrAnalyses ;
			ambp ;
			ambp = ambp->pNext )
					if (!menv_right( ambp->pAnal, env->pNext,
					 pUnit_in, pStamp_in) )
						return( FALSE );
				return( TRUE );
				}
			}
		}
	/*
	 *  check the current StampAnalysis element
	 */
	if (env->iFlags & E_CLASS)
		{                               /* check morpheme class */
		val = isAmpleMorphClassMember(right->m.pszMorphname,
					  (AmpleMorphClass *)env->u.pClass);
		}
	else if (env->iFlags & E_GROUP)    /* If curly brace construction */
		{
		name = env->u.pszString;   /* Get name */

		if (strcmp( name, "root" ) == 0)    /* If root test */
			val = (right->m.iMorphType & ROOT);  /* Check for root */

		else if (strcmp( name, "prefix" ) == 0)    /* else if prefix test */
			val = (right->m.iMorphType & PFX );  /* Check for prefix */

		else if (strcmp( name, "suffix" ) == 0)    /* else if suffix test */
			val = (right->m.iMorphType & SFX );  /* Check for suffix */

		else if (strcmp( name, "infix" ) == 0)    /* else if infix test */
			val = (right->m.iMorphType & IFX );  /* Check for infix */

		else if ((prop = findAmplePropertyNumber(name,
						  &pStamp_in->sProperties)) != 0)
			{		/* If property name */
		/* If a current allomorph selected */ /* Check property */
		/* Else check all allos */
			if ( right->pCurrentAllo )
				val = hasAmpleProperty(right->pCurrentAllo->uAlloPropertySet,
					   prop,
					   &pStamp_in->sProperties);
			else
		{
		/* For each allomorph */ /* If it doesn't have prop */
		/* Break with val = false */
		for ( allo = right->m.pAllomorphs; allo; allo = allo->pNext )
					{
			val = hasAmpleProperty( allo->a.uAlloPropertySet,
						prop,
						&pStamp_in->sProperties);
			if (!val)
						break;
			}
		}
		}
		else if ((tc = findAmpleCategoryNumber(name, pStamp_in->pCategories)) != 0)
			{						/* If category */
			if ( right->m.iMorphType & ROOT )
				val = (tc == right->m.iFromCategory);
			else
				val = (tc == right->m.iToCategory);      /* Check category */
			}
		else if ((tcl = findAmpleCategClass(name,
						pStamp_in->pCategClasses)) != NULL)
			{
		/*
		 *  If category class, check category class (1.4x BJY)
		 */
			if ( right->m.iMorphType & ROOT )
				val = isAmpleCategClassMember( right->m.iFromCategory, tcl );
			else
				val = isAmpleCategClassMember( right->m.iToCategory, tcl );
			}

		else
			val = FALSE;                /* Default to false */
		}
	else if (env->u.pszString != NULL)
		{                               /* check against a given morpheme */
		val = (strcmp(right->m.pszMorphname, env->u.pszString) == 0);
		}
	else
		{                               /* check against the word boundary */
		if (env->iFlags & E_NOT)
			return( right != NULL );
		if (env->iFlags & E_ELLIPSIS)
			return( TRUE );
		return( right == NULL );
		}
	/*
	 *  now figure out what to do based on val, E_NOT, E_OPTIONAL, and
	 *  E_ELLIPSIS
	 */
	if (    (val && !(env->iFlags & E_NOT)) ||
			(!val && (env->iFlags & E_NOT)) )
		{
		if (menv_right( right->pRightLink, env->pNext, pUnit_in, pStamp_in ))
			return( TRUE );
		}
	else if (env->iFlags & E_OPTIONAL)
		{
		if (menv_right( right, env->pNext, pUnit_in, pStamp_in ))
			return( TRUE );
		}
	if (!(env->iFlags & E_ELLIPSIS))
		return( FALSE );                /* had to match here */
	/* if we reach here, we try again further out (due to '...') */
	}
} /* end of menv_right() */

/*************************************************************************
 * NAME
 *    checkStampMorphEnviron
 * ARGUMENTS
 *    left  - pointer to leftward StampAnalysis structure
 *    right - pointer to rightward StampAnalysis structure
 *    menv  - pointer to the morpheme environment list
 * DESCRIPTION
 *    Check if we meet the given morpheme environment.
 * RETURN VALUE
 *    nonzero if okay, zero if the environment is wrong
 */
int checkStampMorphEnviron(left, right, menv, pUnit_in, pStamp_in)
StampAnalysis *left;
StampAnalysis *right;
AmpleEnvConstraint *menv;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
register int val;

if (menv==NULL)
	return( TRUE );                     /* nothing to check */
/*
 *  go through the list of morpheme environment conditions, quitting at the
 *  first one that succeeds
 */
for ( ; menv != NULL ; menv = menv->pNext )
	{
	val = menv_left(left,menv->pLeftEnv, pUnit_in, pStamp_in) &&
		menv_right(right,menv->pRightEnv, pUnit_in, pStamp_in);
	if (menv->bNot)         /* check for negative environment */
		val = !val;
	if (val)
		return( TRUE );
	}
return( FALSE );                        /* nothing succeeded */
}
