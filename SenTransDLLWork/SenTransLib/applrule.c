/* Applrule.c  Apply rules to input  Alan B  6 Nov 90
*
Word *applyrules( Rule *rules, Word *sent )
*/

/* Change History at end of file */

#include "SenTransLib.h"

extern char *ellipse_base; /* Base for ellipse max */
extern char *sent_bound; /* Fixed string for sentence boundary items */
#ifdef MacCADA
extern unsigned char gInterrupt;
#endif

extern Word *newitem( char *str, unsigned int type );
static Word *nextwd( Word *wd );
static Word *prevwd( Word *wd );
static int rulematch( Word *word, Rule *rule, SenTransData *pSenTransData );
static int do_match( Word *word, Match *match );
static int do_match_right( Word *word, Match *match );
static int do_match_left( Word *word, Match *match );
static int trymatch( Word *wd, Match *mat );
static int matches( Match *mat, Morph *mp );
static int invert( int val );
static int allambigs( Word *wd );
static int findclmem( Class *cl, char* s );
static Word *replace( Match *match, Match *replace );
static Match *copyrep( Match *rep );
static Morph *copymp( Morph *mp );
static int disambig( Match *match, int reject, int do_disamb );
static int more_same_word( Match *mat );
static void dispmatched( Match *match, SenTransData *pSenTransData );
static void dispsent( Word *sent, int num, SenTransData *pSenTransData );
				/* next two hab 1.2ze */
static MorphList *insertMorph( MorphList *mlp, Morph *mp);
static MorphList *newMorphList( Morph *mp);
static Word *thesentence;       /* Hold for tracing use */
static int trace_this_one;      /* Remember this one is tracing */
static int this_will_disambig;  /* Remember this one will disambig */
static int match_env;           /* Matching environment (either way) */
static int match_envlf;         /* Matching left environment */
static int num_apps;            /* Number of rules applied */

/**************************************************************
 * NAME
 *      bRuleDeletesRoot        1.2z hab
 * ARGS
 *      pMatch_in   - pointer to match   list
 *      pReplace_in - pointer to replace list
 * DESC
 *      Determine if the match has a root, but the replace does not
 *      i.e. the rule is of the basic form: Cat=A > -B
 * RETN
 *      TRUE if the rule deletes a root
 *      FALSE otherwise
 */
int bRuleDeletesRoot( Match *pMatch_in, Match *pReplace_in )
{
Match *pMatch;
Match *pReplace;

for (pMatch = pMatch_in; pMatch; pMatch = pMatch->next)
				/* for all matches */
	if (pMatch->type & RT)
		{			/* one is a root; is there a root
				   in the replace? */
	for (pReplace = pReplace_in; pReplace; pReplace = pReplace->next)
	  if ((pReplace->type & RT) && !(pReplace->type & REF))
		  return(FALSE);	/* yes, so it does not delete a root */
	return(TRUE);		/* no, it does delete a root */
	}
return (FALSE);
}

/**************************************************************
 * NAME
 *      bIsInitialInsertion        1.2y hab
 * ARGS
 *      pReplace_in - pointer to replace list
 * DESC
 *      Determine if the replace structure is a kind of initial insertion
 *      i.e. the rule is of the basic form: A > B A
 *      More than one element (B) may be inserted before the referenced item
 *      (A).  Referenced affixes are ignored.
 * RETN
 *      TRUE if replace is an initial insertion replace
 *      FALSE otherwise
 */
int bIsInitialInsertion( Match *pReplace_in )
{
Match *pReplace;

if (pReplace_in->type & REF)
  return(FALSE);		/* is initial reference, not insertion */
for (pReplace = pReplace_in->next; pReplace; pReplace = pReplace->next)
	if (pReplace->type & REF &&
	(pReplace->type & RT ||
	 pReplace->type & CAT))
	  return (TRUE);
return(FALSE);
}

/**************************************************************
 * NAME
 *      applyrules
 * ARGS
 *      rules - list of rules to apply
 *      sent - sentence to apply rules to
 * DESC
 *      Apply rules to sentence to modify or disambiguate.
 * RETN
 *      Number of rules applied.
 */
int applyrules( Rule *rules, Word *sent, SenTransData *pSenTransData )
{
Rule *ru = NULL;           /* Temp rule */
Word *wd;           /* Temp word */
Word *fwd;          /* First word for trace */
Rule *first_in_set;   /* First rule in a set of rules */
int did_replace;
char *scap = NULL;  /* Sentence capitalization pointer 1.2a BJY */
char *wcap = NULL;  /* Word     capitalization pointer 1.2x hab */

num_apps = 0;                       /* Clear number of rules applied */
thesentence = sent;                 /* Set up global for tracing use. */

for ( wd = nextwd( sent ); wd && !( wd->type & WORD ); wd = nextwd( wd ) )
	;                               /* find first real word  1.2a BJY */
if ( wd )
	{
	scap = wd->cap;                 /* remember capitalization of sentence if any */
	wd->cap = NULL;
	}

/*  For each rule set
 *      For each word
 *          For each rule in the rule set
 *              Apply the rule
 */
first_in_set = pSenTransData->rules;
while( first_in_set )
	{
	for ( wd = sent; wd; wd = nextwd( wd ) ) /* For each word in sent */
		{
		did_replace = FALSE;
		for ( ru = first_in_set; ru; ru = ru->next ) /* For each rule in set */
			{
			if ( rulematch( wd, ru, pSenTransData ) ) /* If match (and disambig) */
				{
				fwd = wd->prev ? wd->prev : wd; /* Remember prev word */

				if ( ru->repl )                 /* If rule has replace */
					{
					wcap = wd->cap; /* remember capitalization of initial word
									   1.2x hab */
					wd = replace( ru->match, ru->repl ); /* Do replace */
					if (ru->repl->type && !bIsInitialInsertion(ru->repl) &&
						!bRuleDeletesRoot(ru->match, ru->repl))
								/* restore capitalization of initial word
								   only if it is not a deletion (type of
								   replace is null) 1.2y hab*/
					  fwd->next->cap = wcap; /* restore capitalization of
											  initial word 1.2x hab */
					did_replace = TRUE;
					}

				if ( trace_this_one &&
			 pSenTransData->pLogFP) /* If tracing, show result */
					{
					fprintf( pSenTransData->pLogFP, "After:   " );
					dispsent( fwd->next, 5, pSenTransData );
					}
				} /* end if rulematch() */
#ifdef MacCADA
			if ( gInterrupt )
				break;
#endif
			if ( ( ru->type & ENDSET ) || did_replace )
				break;
			} /* end for each rule */
		} /* end for each word */

	first_in_set = ru ? ru->next : NULL; /* Move to next rule set */
	} /* end while rule set to process */

for ( wd = nextwd( sent ); wd && !( wd->type & WORD ); wd = nextwd( wd ) )
	;                               /* find first real word  1.2a BJY */
if ( scap && wd && !wd->cap )       /* if sentence is not capitalized anymore */
	wd->cap = scap;                 /*  put previous capitalization back in */

return( num_apps );                 /* Return number of rules applied */
} /* function applyrules */

/**************************************************************
 * NAME
 *      rulematch
 * ARGS
 *      word - word at which to try to match
 *      rule - rule to try to match
 * DESC
 *      Try to match rule starting at word.
 *      If match is successful, pointers to matched words
 *          and morphs are set in the elements of match.
 *      Also, if match is successful any ambiguities not used
 *          in the match are removed.  This gives disambiguation
 *          and prevents wrong rearrangements.
 * RETN
 *      TRUE if successful match, FALSE if no match.
 */
static int rulematch( Word *word, Rule *rule, SenTransData *pSenTransData )
{
Match *match;       /* Match portion of rule */
Match *mat;         /* Temp match */
Word *firstwd;      /* First word matched */
Word *lastwd;       /* Last word matched */
Word *wd;                       /* Temp word */
int envok;          /* Environ OK (binary) */
int bestenv;        /* temp  environ degree of match overall (3 valued) */
int group_best;     /* temp  environ degree of match within OR group (3 valued) */
int leftenv;        /* left  environ degree of match (3 valued) */
int rightenv;       /* right environ degree of match (3 valued) */
Envir *env;         /* Temp envir */

if ( rule->type & DISABLE )             /* AB 1.1m Check for disabled rule */
	return FALSE;

pSenTransData->ruletrycount++;          /* Count all rule attempts */
match = rule->match;                    /* Get match from rule */

										/* Unanimousness required  */
match_env = FALSE;
match_envlf = FALSE;                    /* Clear environ switches */

if ( !do_match( word, match ) )         /* If no match here */
	return( FALSE );                    /* Return fail */

firstwd = lastwd = NULL;                /* Find first and last wd matched */
for ( mat = match; mat; mat = mat->next )
	{
	if ( mat->begwd && !firstwd )
		firstwd = mat->begwd;
	if ( mat->endwd )
		lastwd = mat->endwd;
	}

if ( !firstwd ) /* 1.2k AB If all optional in match, and nothing was matched, fail */
		return( FALSE );

bestenv = ALL;          /* best overall result for environments */
group_best = NONE;      /* best result for a group of ORed envs */
match_env = TRUE;       /* signal for trymatch */

for ( env = rule->env; env; env = env->next )
	{
	if (env->and_env)           /* when we find an ANDed env */
		{
		if (group_best == NONE)
			break;              /* if nothing succeeded so far, we fail */
		bestenv &= group_best;  /* otherwise limit overall result to */
		group_best = NONE;      /* best of the preceding OR group */
		}
	else if (group_best == ALL)
		continue;               /* if already had a full success, skip this OR */

	leftenv = ALL;                           /* Default environs full match */
	rightenv = ALL;

	if ( env->envrt )                       /* If right environment */
		{
				wd = nextwd( lastwd ); /* Start looking in next word */
				for ( mat = match; mat->next; mat = mat->next ) /* Find last match element */
						;
		if ( mat->type & PFX ) /* If match ends with a prefix, start looking in same word */
						wd = lastwd;
				rightenv = do_match_right( wd, env->envrt );
		}
	if ( env->envlf )                       /* If left envir */
		{
				wd = prevwd( firstwd ); /* Start looking in previous word */
#ifndef hab207
				if ( (match->type & SFX) && /* If match starts with a suffix, start looking in same word */
			 env != NULL && /* but only if the environment is not */
			 env->envlf != NULL && /* a begin punc */
			 !(env->envlf->type & PUNC))
#else  /* hab207 */
				if ( match->type & SFX ) /* If match starts with a suffix, start looking in same word */
#endif /* hab207 */
						wd = firstwd;
		match_envlf = TRUE;                 /* Signal for trymatch */
		leftenv = do_match_left( wd, env->envlf );
		match_envlf = FALSE;                /* Clear left flag */
		}

	if ( env->envneg )                         /* If negated environ */
		envok = invert( leftenv & rightenv);   /* Invert it */
	else
		envok =  ( leftenv & rightenv);

	group_best |= envok;                /* Best degree of match so far in OR group */

	} /* end for each env */
bestenv &= group_best;          /* apply result of final OR group to overall best */
match_env = FALSE;

if ( rule->env )                /* Apply env results */
	{
	if ( rule->type & UNANIM )       /* Require unanimity */
		{
		if ( bestenv != ALL )
			return ( FALSE );
		}
	else                             /* non-unanimous matching */
		{
		if ( bestenv == NONE )
			return ( FALSE );
		}
	}

/* If here, rule has matched */
										/* See if will disambig */
this_will_disambig = disambig( match, ( rule->type & REJ ), FALSE );

if ( this_will_disambig || rule->repl ) /* If disamb or rule, trace */
	{
	trace_this_one = pSenTransData->do_trace; /* Note this one can be traced */
	num_apps++;                         /* Count rule applied */

	if ( rule->repl )
		{
		pSenTransData->ruchgcount++; /* Count actual changes */
		if ( this_will_disambig && pSenTransData->pLogFP)
			{
		  fprintf( pSenTransData->pLogFP,
			   "Warning: Change rule is disambiguating\n" );
		  trace_this_one = TRUE;      /* Trigger trace */
			}
		}
	else
		pSenTransData->ambigcount++; /* Count disambiguations */
	}
else
	trace_this_one = FALSE;

if ( trace_this_one && pSenTransData->pLogFP) /* If tracing, show match */
	{
		Word *dispword; /* 1.2c BJY Display first real word - skip punctuation, whitespace at start of sentence */
		for (dispword = thesentence->next; dispword->next && !(dispword->type & WORD); dispword = dispword->next)
				;
	fprintf( pSenTransData->pLogFP, "\nIn sentence %d, which starts with \"",
		 pSenTransData->num_sents + 1 );
	if (dispword->name)        /* this is null if \w absent from input */
		fprintf( pSenTransData->pLogFP, "%s\":\n", dispword->name);
	else
		{
		Morph *m = dispword->ambigs->morphs;
		fprintf( pSenTransData->pLogFP, m->name );
		m = m->next;
		while ( m )
			{
			fprintf( pSenTransData->pLogFP, "-%s", m->name );
			m = m->next;
			}
		fprintf( pSenTransData->pLogFP, "\":\n" );
		}

	fprintf( pSenTransData->pLogFP, "Rule %d:  ", rule->number );

	switch ( rule->type & RULETYPE )
	  {      /* Print rule type  */
	  case AM:  fprintf( pSenTransData->pLogFP, "\\am" );  break;
	  case REJ: fprintf( pSenTransData->pLogFP, "\\rej" ); break;
	  case RU:  fprintf( pSenTransData->pLogFP, "\\ru" );  break;
	  }  /* end of switch */
	if ( rule->type & UNANIM )
	  fprintf( pSenTransData->pLogFP, "un" );
	fprintf( pSenTransData->pLogFP, "  " );

	disprule( rule, pSenTransData );

	fprintf( pSenTransData->pLogFP, "Preceding context:  " );
					 /* Previous-word printing restored as a stopgap */
	if ( prevwd( word ) && prevwd( prevwd( word ) ) )/* AB 1.1m Fix hang bug */
		dispsent( prevwd( prevwd( word ) ), 2, pSenTransData );
	else if ( prevwd( word ) )
		dispsent( prevwd( word ), 1, pSenTransData );
	else
		fprintf( pSenTransData->pLogFP, "\n" );   /* none! 1.2a BJY */

	fprintf( pSenTransData->pLogFP, "Before:  " );
	dispsent( word, 5, pSenTransData );

	fprintf( pSenTransData->pLogFP, "Matched: " );
	dispmatched( match, pSenTransData );
	}

if ( this_will_disambig )               /* If it will disambiguate */
	disambig( match, ( rule->type & REJ ), TRUE );
										/* Disambiguate the match */

return( TRUE );                         /* Return success */
} /* function rulematch */

/**************************************************************
 * NAME
 *      do_match
 * ARGS
 *      word - word at which to try to match
 *      match - match to try
 * DESC
 *      Try to match rule starting at word.
 *      If match on rule is successful, pointers to matched words
 *          and morphs are set in the elements of match.
 * RETN
 *      TRUE if successful match, FALSE if no match.
 */
static int do_match( Word *word, Match *match )
{
Match *mat;         /* Temp match */
Word *wd;           /* Temp word */
Word *twd;          /* Temp word */
Word *last_wd;      /* Another one */
int succ;           /* Temp success flag */
int cnt;            /* Count for ellipses */
int maxe;           /* Max for ellipses */

if ( !match )
	return( FALSE );                      /* If no match, fail */

wd = word;                                /* Start at current word */

for ( mat = match; mat; mat = mat->next ) /* For each match element */
	{
	succ = FALSE;                         /* Clear success */
	mat->begwd = mat->endwd = NULL;       /* Clear word pointers */
	mat->matmp = NULL;                    /* Clear morph pointer */
	mat->mpList = NULL;  /* Clear morph pointers hab 1.2ze */

	if ( !wd )                              /* If no more words */
		return( FALSE );                    /* We have failed */

	if ( IS_ELLIPSIS(mat) )
		{                                   /* Search for next */
		cnt = 1;                            /* Init count */
		maxe = mat->cat - ellipse_base;     /* Get max from cat */
		if (mat->next && (mat->next->type & (SFX | CR) ) )
			twd = wd->next;
		else
			twd = wd;
		for ( ; twd; twd = nextwd( twd ) ) /* For each word */
			{
			if ( cnt > maxe )               /* If over max, break */
				break;
			if ( do_match( twd, mat->next ) ) /* If match found */
				{
				if (mat->prev && IS_SENT_BOUND(mat->prev))  /* 1.2c BJY Don't match initial punctuation, */
		  {                                                                               /* markers, etc at start of sentence */
			for (; wd != twd && (wd->type & FROMF); wd = wd->next)
			  ;
		  }
				if ( twd != wd )             /* If dots cover something */
					{                       /* Point them at it */
					mat->begwd = wd;
					mat->endwd = prevwd( twd );
					}
				return( TRUE );             /* It is all right */
				}
			cnt++;                          /* Count how many tried */
			}
		}
	else if (mat->type & PLUS)
		{
		/* A repeatable item is processed like ellipsis,
		   except that everything we pass must match it (at least partly),
		   and there is no limit to how many items it can pass over.
		   Repeatable items are greedy if at the end of a match sequence,
		   but if something follows they match the minimum needed for
		   the following stuff to succeed. */

		if (mat->type & OPT)          /* if repeated elem is optional... */
			if ( mat->next && do_match(wd, mat->next) )
				return TRUE;          /* and rest of match succeeds, omit it */

		twd = wd;
		last_wd = NULL;
		while (twd)
			{
			if ( !trymatch(twd, mat) ) { /* try to match repeated element */
				if ( mat->next ) {
					return FALSE;       /* if failed, and something follows, return failure */
				} else
				{
					if ( last_wd != NULL )      /* if repeat succeeded at least once */
						{
						mat->begwd = wd;        /* point repeatable elem at stuff it matched */
						mat->endwd = last_wd;
						return TRUE;            /* and say we succeeded */
						}
					else                        /* else fail unless optional */
						return (mat->type & OPT) ? TRUE : FALSE ;
				}
			}
			if ( mat->endwd )
				twd = mat->endwd;
			last_wd = twd;              /* remember last successful match of repeat */
			twd = nextwd( twd );

			/* if something after the repeat, try to match it and terminate repeat */
			if ( mat->next && do_match(twd, mat->next) )
				{                       /* try to match rest */
				mat->begwd = wd;        /* point repeatable elem at stuff it matched */
				mat->endwd = last_wd;
				return TRUE;            /* and say we succeeded */
				}
			}
		break;
		}
	else
		succ = trymatch( wd, mat );         /* Try match here */

	if ( succ == NONE && mat->type & OPT )  /* If fail but optional */
		continue;                           /* Skip this match element */

	if ( succ == NONE )                     /* If no success on this mat */
		return( FALSE );                    /* Return failure */

	if ( mat->type & PAT )
		wd = mat->endwd;
											/* Have success on this mat */
	if ( !more_same_word( mat ) )           /* If not more on same word */
		wd = nextwd( wd );                  /* Move to next word */

	} /* for each match element */
										/* If here, all mats succeeded */
return( TRUE );                         /* So we have a successful match */
}

/**************************************************************
 * NAME
 *      do_match_right
 * ARGS
 *      word - word at which to try to match
 *      match - match to try
 * DESC
 *      Try to match right envir starting at word.
 * RETN
 *      ALL if every ambiguity is matched, SOME if some are matched, NONE
 *       if none are matched.
 */
static int do_match_right( Word *word, Match *match )
{
Match *mat;         /* Temp match */
Word *wd;           /* Temp word */
Word *twd;          /* Temp word */
int succ;           /* Degree of match for single match element:  3-valued */
int overall_succ;   /* Degree of match over   all match elements: 3-valued */
int cnt;            /* Count for ellipses */
int maxe;           /* Max for ellipses */

if (!match)
	return ALL;
if (!word)
	return NONE;

overall_succ = ALL;                         /* Default to full match */
wd = word;                                  /* Start at current word */

if ( match->type & ( SFX | CR ) )           /* If suffix, compound root */
	{
	wd = prevwd( word );                    /* Look at prev */
	if ( !wd )
		return NONE;
	}

for ( mat = match; mat; mat = mat->next )   /* For each match element */
	{
	succ = NONE;                            /* Clear success */

	if ( !wd )                              /* If no more words
				  then there are match elements that cannot be matched */
		return( NONE  );                    /* We have failed */

	if ( IS_ELLIPSIS(mat) )
		{                                   /* Search for next */
		cnt = 1;                            /* Init count */
		maxe = mat->cat - ellipse_base;     /* Get max from cat */
		if (mat->next && (mat->next->type & (SFX | CR) ) )
			twd = nextwd( wd );
		else
			twd = wd;
		for ( ; twd; twd = nextwd( twd ) ) /* For each word */
			{
			if ( cnt > maxe )               /* If over max, break */
				break;
			succ |=  do_match_right( twd, mat->next ); /* Find best */
			cnt++;                          /* Count how many tried */
			}
					  /* update overall success with the elipsis result */
			overall_succ &= succ;
			break;                  /* Result comes entirely from elipsis */
		}
	else if (mat->type & PLUS)
		{
		/* A repeatable item is processed like ellipsis,
		   except that everything we pass must match it (at least partly),
		   and there is no limit to how many items it can pass over. */
		int rep_succ = ALL, env_succ = NONE;

		if ( (mat->type & OPT) && mat->next)    /* if repeated elem is optional... */
			{
			succ = do_match_right(wd, mat->next);
			if (succ == ALL)   /* and env succeeds by omitting opt elem, */
				break;         /* then done (and ignore result of opt elem) */
			}

/* for this loop, if env_succ becomes ALL we know we have the best possible
   result, and if rep_succ becomes NONE then it isn't worth looking further */
		twd = wd;
		while (twd)
			{                           /* try following elements */
			int tsucc = trymatch(twd, mat);
			if ( tsucc == NONE )
				{
				if ( !mat->next ) /* if nothing follows in env */
					if ( twd != wd ) /* if repeatable matched at least once */
						succ = rep_succ; /* result comes from repeatable item*/
					else if ( mat->type & OPT )
						succ = ALL; /* otherwise only succeed if optional */
				break;
				}
			rep_succ &= tsucc;          /* rep_succ can only get worse! */
			if ( mat->endwd )
				twd = mat->endwd;
			twd = nextwd( twd );
			if ( mat->next )
				{
				if ( !twd )             /* if run out of words, break */
					break;
				env_succ = do_match_right( twd, mat->next );
				succ |= ( rep_succ & env_succ );  /* keep track of best result so far */
				if ( env_succ == ALL )
					break;
				}
			}
		overall_succ &= succ;
		break;
		}
	else  /* not ellipsis or repeatable */
		{
		succ = trymatch( wd, mat );                 /* Try match here in env */

		if ( ( succ == NONE ) && mat->type & OPT )  /* If fail but optional */
			continue; /* Skip this match element */
		else
			overall_succ &= succ;

		if ( succ == NONE ) /* If no success on this mat */
			return( NONE ); /* Return failure */

		if ( mat->endwd )
			wd = mat->endwd;
											/* Have success on this mat */
											/* Right and Left not Analogous */
		if ( !more_same_word( mat ) )           /* If not more on same word */
			wd = nextwd( wd );                  /* Move to next word */
		} /* end not ellipsis */
	} /* for each match element */
						   /* If here, all mats succeeded to some degree */
	return( overall_succ );                         /* return that degree */
}

/**************************************************************
 * NAME
 *      do_match_left
 * ARGS
 *      word - word at which to try to match
 *      match - match to try
 * DESC
 *      Try to match left envir starting at word.
 * RETN
 *      ALL if every ambiguity is matched, SOME if some are matched, NONE
 *       if none are matched.
 */
static int do_match_left( Word *word, Match *match )
{
Match *mat;         /* Temp match */
Word *wd;           /* Temp word */
Word *twd;          /* Temp word */
int succ;           /* Degree of match for single match element:  3-valued */
int overall_succ;   /* Degree of match over   all match elements: 3-valued */
int cnt;            /* Count for ellipses */
int maxe;           /* Max for ellipses */

if (!match)
	return ALL;
if (!word)
	return NONE;

overall_succ = ALL;                         /* Default to full match */
wd = word;                                  /* Start at current word */
											/* If prefix or begin punc */
if ( match->type & PFX )
	{
	wd = nextwd( word );                    /* look at next */
	if ( !wd )
		return NONE;
	}

for ( mat = match; mat; mat = mat->prev ) /* hab 1.2ze */
	mat->mpList = NULL;		/* clear pointers */
for ( mat = match; mat; mat = mat->prev ) /* For each match element */
	{
	succ = NONE;                            /* Clear success */


#ifndef hab207
		while ( wd &&
		(wd->type & FROMF) && /* 1.2t AB Move past from field elements */
		!(mat->type & PUNC)) /* but only if it is not a begin punc match */
#else  /* hab207 */
		while ( wd && wd->type & FROMF ) /* 1.2t AB Move past from field elements */
#endif /* hab207 */
				wd = wd->prev;
	if ( !wd )                              /* If no more words
				  then there are match elements that cannot be matched */
		return( NONE  );                    /* We have failed */

	if ( IS_ELLIPSIS(mat) )
		{                                   /* Search for next */
		cnt = 1;                            /* Init count */
		maxe = mat->cat - ellipse_base;     /* Get max from cat */
		if (mat->prev && (mat->prev->type & PFX) )
			twd = prevwd( wd );
		else
			twd = wd;
		for ( ; twd; twd = prevwd( twd ) )  /* For each word */
			{
			if ( cnt > maxe )               /* If over max, break */
				break;
			succ |=  do_match_left( twd, mat->prev ); /* Find best */
			cnt++;                          /* Count how many tried */
			}
					  /* update overall success with the elipsis result */
			overall_succ &= succ;
			break;                  /* Result comes entirely from elipsis */
	   }
	else if (mat->type & PLUS)
		{
		/* A repeatable item is processed like ellipsis,
		   except that everything we pass must match it (at least partly),
		   and there is no limit to how many items it can pass over. */
		int rep_succ = ALL, env_succ = NONE;

		if ( (mat->type & OPT) && mat->prev )   /* if repeated elem is optional... */
			{
			succ = do_match_left(wd, mat->prev);
			if (succ == ALL)            /* and env succeeds by omitting opt elem, */
				break;                  /* then done (and ignore result of opt elem) */
			}

/* for this loop, if env_succ becomes ALL we know we have the best possible
   result, and if rep_succ becomes NONE then it isn't worth looking further */
		twd = wd;
		while (env_succ != ALL && twd)
			{                           /* try following elements */
			int tsucc = trymatch(twd, mat);
			if ( tsucc == NONE )
				{
				if ( !mat->prev )
					if ( twd != wd )
						succ = rep_succ;
					else if ( mat->type & OPT )
						succ = ALL;
				break;
				}
			rep_succ &= tsucc;     /* rep_succ can only get worse! */
			if ( mat->begwd )
				twd = mat->begwd;
			twd = prevwd( twd );
			if ( mat->prev )
				{
				if ( !twd )
					break;
				env_succ = do_match_left( twd, mat->prev );
				succ |= ( rep_succ & env_succ );      /* keep track of best result so far */
				if ( env_succ == ALL )
					break;
				}
			}
		overall_succ &= succ;
		break;
		}
	else  /* not ellipsis or repeat */
		{
		succ = trymatch( wd, mat );         /* Try match here in env */

		if ( ( succ == NONE ) && mat->type & OPT )  /* If fail but optional */
			continue;                               /* Skip this match element */
		else
			overall_succ &= succ;

		if ( succ == NONE )                    /* If no success on this mat */
			return( NONE );                    /* Return failure */

		if ( mat->begwd )
			wd = mat->begwd;

		if ( mat->prev && !more_same_word( mat->prev ) )  /* If not more on same word */
			wd = prevwd( wd );                      /* Move to next word */
		} /* end not ellipsis */
	} /* for each match element */
						   /* If here, all mats succeeded to some degree */
	return( overall_succ );                         /* return that degree */
}

/**************************************************************
 * NAME
 *      matchprev
 * ARGS
 *      mat - current match element
 *      mp - morph to look for
 * DESC
 *      Test for previously matched element.
 * RETN
 *      TRUE if previously matched, FALSE if not.
 */
static int matchprev( Match *mat, Morph *mp )
{
				/* reworked to check list of morphs
				   hab 1.2ze */
MorphList *mlp;
for ( ; mat; mat = mat->prev ) /* For each previous match */
				/* run through the list of morphs for
				   this match */
  for (mlp = mat->mpList; mlp; mlp = mlp->next)
	if (mlp->mp == mp)
	  return TRUE;
return FALSE; /* If none matched, return false */
}

/**************************************************************
 * NAME
 *      trymatch
 * ARGS
 *      wd - word at which to try to match
 *      mat - match to try
 * DESC
 *      Try to match single match element at word.
 *      If match is successful, pointers to matched words
 *          and morphs are set in the elements of match.
 *      Also, if match is successful matched is set on any
 *          ambiguities that matched.
 * RETN
 *      ALL if every ambiguity is matched, SOME if some are matched, NONE
 *       if none are matched.
 */
static int trymatch( Word *wd, Match *mat )
{
Ambig *amb;         /* Temp ambig */
Morph *mp = NULL;          /* Temp morph */
Word *twd;
Mem* pProp;
int succ;           /* Success flag, 3-valued */
int matchseen;      /* Was some match seen */
int same_word;      /* Flag for same word as last match */

matchseen = FALSE;                     /* Clear any match seen?. */
succ = NONE;                           /* Clear success */

mat->begwd = mat->endwd = NULL;         /* Clear word pointers */
mat->matmp = NULL;                      /* Clear morph pointer */
mat->mpList = NULL;		/* Clear morph pointer  hab 1.2ze */

if ( mat->type & PAT )
	{
	Match *tmat = ((Pat*)mat->string)->match;

	if ( match_envlf )
		{
		while (tmat->next)
			tmat = tmat->next;
		succ = do_match_left( wd, tmat );
		}
	else if ( match_env )
		{
		succ = do_match_right( wd, tmat );
		}
	else /* not processing environment */
		{
		succ = do_match( wd, tmat ) ? ALL : NONE;
			/* do_match is simple boolean; force to ALL or NONE for invert() */
		}

	if ( mat->type & NOT )
		succ = invert( succ );
	if ( succ == NONE )
		return succ;

	if ( match_envlf )
		while ( tmat )
			{
			if ( tmat->endwd && !mat->endwd )
				mat->endwd = tmat->endwd;
			if ( tmat->begwd )
				mat->begwd = tmat->begwd;
			tmat = tmat->prev;
			}
	else
		while ( tmat )
			{
			if ( tmat->begwd && !mat->begwd )
				mat->begwd = tmat->begwd;
			if ( tmat->endwd )
				mat->endwd = tmat->endwd;
			tmat = tmat->next;
			}

	return succ;
	}

/* If we get here, we aren't dealing with a pattern,
   so we have a "normal" match element to compare with the ambs of a wd. */

	/* If something to the left and left is prefix or this
	*   is suffix, we are matching the same word as the last match.
	*  In that case, we can't clear the amb->matched flag on
	*   each ambiguity because the previous match has already
	*   set it.  Also, we should try to match only on ones that
	*   the previous match has accepted.  If we succeed on them,
	*   we will leave them as matched, but if we fail on them,
	*   then we should clear their matched flag.
	*/

if ( match_envlf )
	same_word = more_same_word(mat)
				&& !IS_ELLIPSIS(mat->next);
else
	same_word = mat->prev
				&& !IS_ELLIPSIS(mat->prev)
				&& more_same_word(mat->prev);

for ( amb = wd->ambigs; amb; amb = amb->next ) /* For each ambig */
	{
	succ = FALSE;                       /* init success flag for this ambig */
	if ( same_word                      /* If same word and already rejected */
		 && (    ( match_env && !amb->ematched )
			|| (  !match_env && !amb->matched ) ) )
		continue;                       /* Let it stay rejected */

	if ( mat->type & CAT ) {            /* If match has cat */
	  char *szCat = NULL;

	  if ((mat->type & MORPHCAT) == MORPHCAT) {
		/* input category to match - now we have to find the root category */
		for ( mp = amb->morphs; mp; mp = mp->next ) /* For each morph */
		  if ( mp->type & RT ) {        /* If root */
			szCat = mp->cat;            /* Set ambig category */
			break;                      /* Break to only do first cat */
		  }
		if (szCat == NULL) {
		  goto done;                    /* no category, no match */
		}
	  }
	  else {
		szCat = amb->cat;
	  }

	  if ( mat->type & CCL )            /* If cat class */
		  {
		  if ( !findclmem( (Class*)mat->cat, szCat) )
				goto done;              /* If not found in class, failed */
		  }
		else
			if ( !streq( mat->cat, szCat ) )
				goto done;              /* else if cats don't match, failed */
	}

	if ( mat->type & PROP )
		{
	  for ( mp = amb->morphs; mp; mp = mp->next ) /* For each morph in word */
		{
		  for (pProp = mp->prop; pProp; pProp = pProp->next)
		{
		  if ( streq(pProp->name, mat->string) )
			{
			  succ = TRUE;
			  goto done;
			}
		}
		}
		}

	if ( !mat->string )                 /* If no string, succeed */
		{
		succ = TRUE;
		goto done;
		}

	for ( mp = amb->morphs; mp; mp = mp->next ) /* For each morph in word */
		if ( matches( mat, mp ) && !matchprev( mat->prev, mp ) ) /* If matching morph, and not matched previously, succeed */
			{ /* 1.2m AB Make sure the same morph was not matched by some previous match */
			succ = TRUE;
			goto done;
			}

	if ( IS_SENT_BOUND( mat ) && ( wd->type & (FROMF|FROMN) ) ) /* 1.2a look past punc for sentence break */
		{
		if ( match_envlf || ( !match_env && !mat->prev ) )   /* looking at left side of match? */
			{
			for ( twd = prevwd( wd ); twd && twd->type & (FROMF|FROMN); twd = prevwd( twd ) )
				;
			}
		else                                    /* looking at right side */
			{
			for ( twd = nextwd( wd ); twd && twd->type & (FROMF|FROMN); twd = nextwd( twd ) )
				;
			}
		succ = twd && ( twd->type & BOUND );    /* at sentence boundary? */
		}
done:
		/* now we've seen if the ambig matches; invert success if NOT */
	if ( mat->type & NOT )
		succ = !succ;

		/* then set matched flag on the amb if it is a match */
	if ( succ )
		{
		if ( match_env )
			{
			amb->ematched = TRUE;
			mat->begwd = mat->endwd = wd;   /* Set word pointers */
			if ( mat->type & AFX )          /* If affix */
			{
				mat->matmp = mp;            /* Set morph pointers */
			mat->mpList = insertMorph(mat->mpList, mp); /* hab 1.2ze */
		}
			}
		else
			{
			amb->matched = TRUE;            /* Mark ambig as matched */
			mat->begwd = mat->endwd = wd;   /* Set word pointers */
			if ( mat->type & AFX )          /* If affix */
			{
				mat->matmp = mp;            /* Set morph pointers */
			mat->mpList = insertMorph(mat->mpList, mp); /* hab 1.2ze */
		}
			}
		}
	else
		{
		if ( !( same_word && mat->type & OPT ) ) /* If not option on same wd */
			if ( match_env )
				amb->ematched = FALSE;
			else
				amb->matched = FALSE;           /* Clear matched of ambig */
		}
	} /* for each ambig */

succ = allambigs( wd );                         /* set return value 3-value */

return( succ );                                 /* Return success */
}

/**************************************************************
 * NAME
 *      matches
 * ARGS
 *      mat - match element
 *      mp - morph to try to match
 * DESC
 *      Test for match of match string or string class and morph.
 * RETN
 *      TRUE if match, FALSE if not.
 */
static int matches( Match *mat, Morph *mp )
{
Mem *tmem;          /* Temp class member */
Class *tcl;         /* Temp class */
										/* If types don't match */
if ( (mat->type & MORPHTYPE) != (mp->type & MORPHTYPE) )
	return( FALSE );                    /* Return fail */

if ( mat->type & MCL )                  /* If class */
	{
	tcl = (Class *)mat->string;         /* Get class */
	tmem = tcl->mem;                    /* Get first member */
	for ( ; tmem; tmem = tmem->next )
		if ( streq( tmem->name, mp->name ) ) /* If member matches */
			return( TRUE );             /* Return success */
	}
else                                    /* Else (not class) */
	if ( streq( mat->string, mp->name ) ) /* If string matches */
		return( TRUE );                 /* Return success */

return( FALSE );                        /* If no success, return fail */
}

/**************************************************************
 * NAME
 *      findclmem
 * ARGS
 *      cl - class to search
 *      s - string to search for
 * DESC
 *      Search for string s in class cl.
 * RETN
 *      TRUE if found, FALSE if not.
 */
static int findclmem( Class* cl, char* s )
{
Mem *tmem;          /* Temp class member */

for ( tmem = cl->mem; tmem; tmem = tmem->next )
	if ( streq( tmem->name, s ) ) /* If member matches, return true */
		return TRUE;

return FALSE;
}

/**************************************************************
 * NAME
 *      allambigs
 * ARGS
 *      wd - word to test for unanimous matching among all ambiguities
 * DESC
 *      test to see whether for every interpretation of the word,
 *      the match has succeeded.
 *
 * RETN
 *      ALL if every ambiguity is matched, SOME if some are matched, NONE
 *       if none are matched.
 */
static int allambigs( Word *wd )
{
Ambig *amb;         /* Temp ambig */
int someyes = FALSE;
int someno  = FALSE;

for ( amb = wd->ambigs; amb; amb = amb->next ) /* For each ambig */
	if (        ( match_env && amb->ematched )
			|| ( !match_env && amb->matched ) )  /* If this one is true */
		someyes = TRUE;
	else
		someno  = TRUE;

return someyes ? ( someno ? SOME : ALL) : NONE;  /*  degree of match */

}

/**************************************************************
 * NAME
 *      disambig
 * ARGS
 *      match - matched rule segment to disambiguate
 *      reject - treat rule as a reject rule
 *      do_disamb - actually do the disambiguation
 * DESC
 *      Remove unmatched ambiguities of a matched portion of sentence.
 * RETN
 *      TRUE if this rule disambiguates something, FALSE otherwise
 */
static int disambig( Match *match, int reject, int do_disamb )
{
Match *mat;         /* Temp match pointer */
Word *wd;           /* Temp word */
Ambig *amb;         /* Temp ambig */
int succ;           /* success flag (whether rule disambigs or not) */
int disamb;         /* flag for whether disamb happens */
int rejall;         /* flag for all ambs being rejected */

succ = FALSE;
for ( mat = match; mat; mat = mat->next )   /* For each match element */
											/* For each word it matched */
	for ( wd = mat->begwd; wd; wd = nextwd( wd ) ) /* (Terminates at loop bot) */
		{
		/* First we check whether disamb should happen to this word */
		rejall = TRUE;  /* assume everything will be rejected */
		disamb = FALSE; /* assume nothing is to be done */
		for ( amb = wd->ambigs; amb; amb = amb->next )
			if (    ( !reject && !amb->matched )
				 || (  reject &&  amb->matched ) )
				disamb = TRUE;
			else
				rejall = FALSE;

	 /* Now do the disambiguation ONLY if required and not removing all ambs */
		if ( do_disamb && disamb && !rejall )
			{
			for ( amb = wd->ambigs; amb; amb = amb->next ) /* For each ambig */

				if ( ( !reject && !amb->matched ) /* If ambig not wanted */
						|| ( reject && amb->matched ) )
					{                           /* Unlink ambig from list */
					if ( amb->prev )
						amb->prev->next = amb->next;
					else
						wd->ambigs = amb->next;

					if ( amb->next )
						amb->next->prev = amb->prev;

					wd->numamb--;
					}
			}

		succ |= ( disamb & !rejall );

		if ( wd == mat->endwd )             /* Stop at last wd matched */
			break;
		}

return succ;
} /* function disambig */

/**************************************************************
 * NAME
 *      replace
 * ARGS
 *      match - matched rule segment to replace
 *      replace - rule segment to use for replacement
 * DESC
 *      Replace matched part of a sentence with replacement part.
 * RETN
 *      Pointer to modified sentence.
 */
static Word *replace( Match *match, Match *replace )
{
Match *mat;             /* Temp match pointer */
Match *tmat;            /* Temp match pointer */
Match *rep;             /* Temp replacement pointer */
Match *repend = NULL;             /* Temp for last element of replacement */
Match *firstmat = NULL;        /* First match */
Match *lastmat = NULL;         /* Last match */
Word *firstwd;          /* First word matched */
Word *first_matwd = NULL;      /* First word matched, for affix carrying */
Word *lastwd;           /* Last word matched */
Word *last_matwd = NULL;       /* Last word matched, for affix carrying */
#ifndef hab205
Word *prevwrd;           /* Previous word before first matched */
#else
Word *prevwd;           /* Previous word before first matched */
#endif /* hab205 */
Word *nextwd;           /* Next word after last matched */
Word *wd;               /* Temp word pointer */
Word *twd;              /* Another temp word pointer */
Ambig *amb;             /* Temp ambig pointer */
Morph *mp = NULL;              /* Temp morph pointer */
Morph *tmp;             /* Temp morph pointer */
Morph *smp;             /* Temp morph pointer */
Morph *cmp;             /* Temp morph pointer */
Word *firstwd_prev = NULL;     /* Prev of first word matched */
Word *lastwd_next = NULL;      /* Next of last word matched */
int mat_nl;             /* Flag to show there was a \n in matched part */
int rep_nl;             /* Flag for \n in replaced part */
int backing;            /* Flag to show backing up */
int deleting;                   /* Flag to show deleting, no replacement */
int matchisallaff;    /* 1.2s AB Flag to say the match is all affixes */
Match *backbase;        /* Base of backing up */

deleting = !replace || !replace->type;
	/*
	* Find ends of matched part.  This is necessary because
	*   optional elements at the beginning and end of the
	*   match may or may not have matched something.
	*   If they did, they have their beginning word set to
	*   point at what they matched.
	*/

firstwd = lastwd = NULL;                /* Find first and last wd matched */
for ( mat = match; mat; mat = mat->next )
	{
	if ( mat->begwd && !firstwd && !IS_SENT_BOUND( mat ) )  /* don't do anything with # 1.2a BJY */
		{
		firstmat = mat;                 /* Remember first match */
		firstwd = mat->begwd;
		firstwd_prev = firstwd->prev;   /* Remember prev of first */
		first_matwd = firstwd;
		}
	if ( mat->endwd && !IS_SENT_BOUND( mat ) )   /* ignore sentence boundary match 1.2a BJY */
		{
		lastmat = mat;                  /* Remember last match */
		lastwd = mat->endwd;
		lastwd_next = lastwd->next;     /* Remember next of last */
		last_matwd = lastwd;
		}
	}

	/*
	* Remember if there is a \n in the matched part.
	*   If there is, it may be lost during the replacement.
	*   This does not apply to the last word of the matched
	*   part, because its punc is always kept.
	*/
mat_nl = FALSE;
for ( wd = firstwd; wd->prev != lastwd; wd = wd->next )  /* For each word */
	if ( wd->type & (FROMF | FROMN)     /* 1.2a BJY */
		 && strstr( wd->ambigs->morphs->name, "\\n" ) )  /* If \n in list */
		mat_nl = TRUE;                  /* Remember there was one */

		/* 1.2r AB If match starts with a suffix or ends with a prefix
		*    just replace it instead of deleting whole word.
		*/
matchisallaff = FALSE;
if ( firstmat->type & SFX )
  {
	for ( amb = firstmat->begwd->ambigs; amb; amb = amb->next ) /* For each ambig */
	  {
	for ( mat = firstmat; mat && mat->type & SFX; mat = mat->next ) /* For each suffix at front of match */
	  { /* Remove the suffix */
		for ( mp = amb->morphs; mp; mp = mp->next ) /* For each morph */
		  if ( matches( mat, mp ) ) /* If it is the matched one, remove it */
		{
		  if ( mp->prev )                 /* If prev */
			mp->prev->next = mp->next;  /* Hook to next */
		  else                            /* Else */
			amb->morphs = mp->next;     /* Point to it */
		  if ( mp->next )                 /* If next */
			mp->next->prev = mp->prev;  /* Hook to prev */
		  mp = mp->prev; /* Move to prev as place for replace */
		  mat->begwd = NULL; /* 1.2u AB Clear match so possible replacement won't be deleted */
		  break;
		}
	  }
	for ( rep = replace; mp && rep && rep->type & SFX; rep = rep->next ) /* For each suffix at beginning of replace */
	  { /* Insert the suffix */
		if ( rep->type & REF )              /* 1.2u AB If reference */
		  tmp = copymp( ((Match *)(rep->cat))->matmp ); /* Use referenced match */
		else
		  tmp = copymp( rep->matmp ); /* Copy replace morph for insert */
		tmp->prev = mp; /* Hook it in after mp */
		tmp->next = mp->next; /* Hook it to prev and next */
		mp->next = tmp; /* Point prev to it */
		if ( tmp->next ) /* If next, point next back to it */
		  tmp->next->prev = tmp;
		mp = tmp; /* Move to inserted mp for next insert */
	  }
	  }
	while ( firstmat && firstmat->type & SFX ) /* Move to first non-suffix match */
	  firstmat = firstmat->next;
	while ( replace && replace->type & SFX ) /* Move to first non-suffix replace */
	  replace = replace->next;
	if ( !replace ) /* If no more replacement, the rest acts as a deletion */
	  deleting = TRUE;
	if ( firstwd == lastwd ) /* If only one word, don't delete it */
	  matchisallaff = TRUE;
	firstwd_prev = firstwd;   /* Move first word to next */
	firstwd = firstwd->next;
  }
if ( lastmat->type & PFX )
  {
	for ( amb = lastmat->begwd->ambigs; amb; amb = amb->next ) /* For each ambig */
	  {
	for ( mat = lastmat; mat && mat->type & PFX; mat = mat->prev ) /* For each prefix at end of match */
	  { /* Remove the prefix */
		for ( mp = amb->morphs; mp; mp = mp->next ) /* For each morph */
		  if ( matches( mat, mp ) ) /* If it is the matched one, remove it */
		{
		  if ( mp->prev )                 /* If prev */
			mp->prev->next = mp->next;  /* Hook to next */
		  else                            /* Else */
			amb->morphs = mp->next;     /* Point to it */
		  if ( mp->next )                 /* If next */
			mp->next->prev = mp->prev;  /* Hook to prev */
		  mp = mp->next; /* Move to next as place for replace */
		  mat->begwd = NULL; /* 1.2u AB Clear match so possible replacement won't be deleted */
		  break;
		}
	  }
	for ( repend = replace; repend && repend->next; repend = repend->next ) /* Find last replace element */
						;
	for ( rep = repend; mp && rep && rep->type & PFX; rep = rep->prev ) /* For each prefix at end of replace */
	  { /* Insert the prefix */
		if ( rep->type & REF )              /* 1.2u AB If reference */
		  tmp = copymp( ((Match *)(rep->cat))->matmp ); /* Use referenced match */
		else
		  tmp = copymp( rep->matmp ); /* Copy replace morph for insert */
		tmp->prev = mp->prev; /* Hook it in before mp */
		tmp->next = mp; /* Hook it to prev and next */
		mp->prev = tmp; /* Point next to it */
		if ( tmp->prev ) /* If prev, point prev to it */
		  tmp->prev->next = tmp;
		else /* Else point amb to it */
		  amb->morphs = tmp;
		mp = tmp; /* Move to inserted mp for next insert */
	  }
	  }
	while ( lastmat && lastmat->type & PFX ) /* Move to last non-prefix match */
	  lastmat = lastmat->prev;
	while ( repend && repend->type & PFX ) /* Move to last non-prefix replace */
	  repend = repend->prev;
	if ( !repend ) /* If no more replacement, the rest acts as a deletion */
	  deleting = TRUE;
	else /* If still replacements left, cut off the prefixes already inserted */
	  repend->next = NULL;
	if ( firstwd == lastwd ) /* If only one word, don't delete it */
	  matchisallaff = TRUE;
				/* 1.2u AB Remove code to move to prev word */
  }

if ( !matchisallaff )
  {
				/*
				* Unlink matched part.  This is easier because there is
				*   always an empty first element in the sentence.
				*/
	firstwd_prev->next = lastwd_next;       /* Link forward */
	if ( lastwd_next )
	  lastwd_next->prev = firstwd_prev;   /* Link backward */
  }

#ifndef hab205
prevwrd = firstwd_prev;
#else
prevwd = firstwd_prev;
#endif /* hab205 */
nextwd = lastwd_next;

		/*
		* Remove any referenced affixes or croots from matched part.
		* Algorithm is:
		*   For each match element
		*       If it is a matched affix
		*           For each ambig
		*               For each morph
		*                   If it is the matched morph
		*                       Remove it
		*/
for ( mat = match; mat; mat = mat->next )
  if ( ( mat->type & (AFX | CR) ) && mat->begwd )
	for ( amb = mat->begwd->ambigs; amb; amb = amb->next )
	  for ( mp = amb->morphs; mp; mp = mp->next )
	if ( matches( mat, mp ) )
	  {
		if ( mp->prev )                 /* If prev */
		  mp->prev->next = mp->next;  /* Hook to next */
		else                            /* Else */
		  amb->morphs = mp->next;     /* Point to it */
		if ( mp->next )                 /* If next */
		  mp->next->prev = mp->prev;  /* Hook to prev */

		break;                          /* One is enough */
	  }

   /*
	* Do replacement.
	*/
backing = FALSE;
backbase = NULL;
rep = replace;
if ( !deleting )                        /* If not empty replace */
  while( rep )                          /* For each replace */
	{
		/*
		* If prefix, we must insert the root it goes on first,
		*   and then go back inserting prefixes in reverse order
		*   to get them to come out right.
		*/
	if ( !backing && rep->type & PFX )
		{
		while ( rep->next && rep->type & PFX ) /* Find non-prefix */
			rep = rep->next;
		backing = TRUE;                 /* Note backing up */
		backbase = rep;                 /* Note end of backing up */
		}
		/*
		* If there is no reference, at load time there has been
		*   a word structure set up, and rep->begwd points to it.
		*/
	if ( rep->type & REF )              /* If reference */
		{
		tmat = (Match *)rep->cat;       /* Use referenced match */
		if ( tmat->begwd == firstwd )   /* If first word ref */
			first_matwd = NULL;         /* Unset first match for affix */
		if ( tmat->endwd == lastwd )    /* If last word ref */
			last_matwd = NULL;          /* Unset last match for affix */
		}
	else
		{
		tmat = copyrep( rep );          /* Else use copy of replace piece */
		if ( rep->type & CATREF )       /* If category reference */
			{
			Match *tref = (Match *)rep->cat; /* Access ref */
			tmat->cat = tref->begwd->ambigs->cat;          /* Set categories */
			tmat->begwd->ambigs->cat = tmat->cat;
			tmat->begwd->ambigs->morphs->cat = tmat->cat;
			}
		}

		/* If a match element was optional, and if it did not exist
		*   in input, then its match element will not have begwd set.
		*/
	if ( tmat->begwd )                  /* If there is a piece */
		{
		if ( tmat->matmp )              /* If affix */
			{                           /* Link morph onto morphs */
			if ( tmat->type & (SFX | CR) ) /* If suffix or croot */
			  {                         /* Link to end of prev word */
#ifndef hab205
		  if (prevwrd->type & WHSPC)
		prevwrd = prevwd(prevwrd);
			  if ( prevwrd )             /* If prev word */
				{
				for ( amb = prevwrd->ambigs; amb; amb = amb->next )
#else
		  if ( prevwd )
				{
				for ( amb = prevwd->ambigs; amb; amb = amb->next )
#endif /* hab205 */
				  {
				  /* If tmat->begwd is ambiguous
				  *     Make new ambigs as needed
				  */
				  tmp = copymp( tmat->matmp ); /* Copy morph for ambig */
										/* Find last morph */
				  for ( mp = amb->morphs; mp->next; mp = mp->next )
					;
				  if ( tmat->type & CR ) /* If croot, find last root */
					{
					for ( ; mp->type & SFX; mp = mp->prev )
					  ;
					if ( mp->next )       /* If next, link it in */
					  {
					  tmp->next = mp->next;
					  mp->next->prev = tmp;
					  }
					}
				  mp->next = tmp;       /* Link new morph after it */
				  tmp->prev = mp;       /* Link to prev */
				  }
				}
			  }
			else if ( tmat->type & CR ) /* If croot */
			  {                         /* Link to end of prev word */
#ifndef hab205
			  if ( prevwrd )             /* If prev word */
				{
				for ( amb = prevwrd->ambigs; amb; amb = amb->next )
#else
			  if ( prevwd )             /* If prev word */
				{
				for ( amb = prevwd->ambigs; amb; amb = amb->next )
#endif /* hab205 */
				  {
				  tmp = copymp( tmat->matmp ); /* Copy morph for ambig */
										/* Find last morph */
				  for ( mp = amb->morphs; mp->next; mp = mp->next ) ;
				  if ( tmat->type & CR ) /* If croot find last root */
					for ( ; mp->type & SFX; mp = mp->prev ) ;
				  mp->next = tmp;       /* Link new morph after it */
				  mp->next->prev = mp;  /* Link to prev */
				  }
				}
			  }
			else                        /* Else (prefix) */
			  {                         /* Link to begin of next word */
			  if ( backbase             /* If working from a backup base */
					  && backbase->type & RT ) /* That is a root */
#ifndef hab205
				  wd = prevwrd;          /* Attach to inserted base */
#else
				  wd = prevwd;          /* Attach to inserted base */
#endif /* hab205 */
			  else
				  wd = nextwd;          /* Else attach to next word */
			  if ( wd )       /* If next word */
				{
				for ( amb = wd->ambigs; amb; amb = amb->next )
				  {
				  tmp = copymp( tmat->matmp ); /* Copy morph for ambig */
				  mp = amb->morphs;         /* Get first morph */
				  tmp->next = mp;           /* Hook to it */
				  mp->prev = tmp;           /* Link back */
				  amb->morphs = tmp;        /* Point to it */
				  }
				}
			  }
			}
		else                            /* Else (not affix) */
			{                               /* Link in new word */
#ifndef hab205
			prevwrd->next = tmat->begwd;     /* Link prev to new */
			tmat->begwd->prev = prevwrd;     /* Link new to prev */
#else
			prevwd->next = tmat->begwd;     /* Link prev to new */
			tmat->begwd->prev = prevwd;     /* Link new to prev */
#endif /* hab205 */
			if ( nextwd )                   /* If there was a next */
				nextwd->prev = tmat->endwd; /* Link next to new */
			tmat->endwd->next = nextwd;     /* Link new to next */
#ifndef hab205
			prevwrd = tmat->endwd;           /* Set prev to end of new */
#else
			prevwd = tmat->endwd;           /* Set prev to end of new */
#endif /* hab205 */
			} /* else (not affix) */
		}

	if ( backing )                      /* If backing up */
		{
		if ( rep->prev && rep->prev->type & PFX ) /* If prev is prefix */
			rep = rep->prev;            /* Move back to it */
		else
			{
			rep = backbase->next;       /* Else move to next after base */
			backing = FALSE;            /* Set not backing any more */
			backbase = NULL;            /* Clear backup base */
			}
		}
	else
		rep = rep->next;                /* Else (fwd) move fwd one */
	}
										/* Find first of replace */
firstwd = firstwd_prev->next;           /* Next of old prev */

if ( !deleting && !matchisallaff && first_matwd ) /* 1.2q If not delete and unreferenced first word, insert prefixes */
	{
	smp = first_matwd->ambigs->morphs;  /* Find last prefix, if any */
	for ( ; smp->next && smp->next->type & PFX; smp = smp->next )
		;
	for ( ; smp && smp->type & PFX; smp = smp->prev ) /* For each prefix */
		for ( amb = firstwd->ambigs; amb; amb = amb->next )
			{
			mp = amb->morphs;           /* Get first morph of ambig */
			cmp = copymp( smp );        /* Make a copy of inserted morph */
			cmp->next = mp;             /* Hook to it */
			mp->prev = cmp;             /* Link back */
			amb->morphs = cmp;          /* Point to it */
			}
	}

if ( lastwd_next )                      /* Find last of replace */
	lastwd = lastwd_next->prev;         /* Prev of old next */
else                                    /* Or last of sent */
	for ( lastwd = firstwd; lastwd && lastwd->next; lastwd = lastwd->next )
		;

if ( !deleting && !matchisallaff && last_matwd )   /* If not delete and unreferenced last word, insert suffixes and compound roots */
	{
	smp = last_matwd->ambigs->morphs;   /* Find first suff or cr if any */
	for ( ; smp && !(smp->type & (SFX | CR)); smp = smp->next )
		;
	for ( ; smp; smp = smp->next )      /* For each suffix or croot */
		for ( amb = lastwd->ambigs; amb; amb = amb->next )
			{
			if ( smp->type & CR )       /* If croot find last root */
				{
				for ( mp = amb->morphs; mp->next; mp = mp->next )
					if ( mp->next->type & SFX )
						break;
				}
			else                        /* Else find last morph */
				for ( mp = amb->morphs; mp->next; mp = mp->next )
					;
			cmp = copymp( smp );        /* Make a copy of inserted morph */
			mp->next = cmp;             /* Link forward */
			cmp->prev = mp;             /* Link back */
			}
	}

	/*
	* If there was a \n in the matched part, but there is none
	*   in the replaced part, put one in.
	*/
if ( mat_nl )
	{
	rep_nl = FALSE;
	for ( wd = firstwd; wd->prev != lastwd; wd = wd->next )  /* For each word */
		if ( wd->type & (FROMF | FROMN)
			 && strstr( wd->ambigs->morphs->name, "\\n" ) ) /* If \n in punc */
			rep_nl = TRUE;                  /* Remember there was one */
	for ( ; wd->next->type & FROMN; wd = wd->next ) /* don't put it before punc */
		if ( strstr( wd->next->ambigs->morphs->name, "\\n" ) ) /* If \n in punc */
			rep_nl = FALSE;                  /* Remember there was one already there */
	if ( !rep_nl )                          /* If there is none */
		{
		twd = newitem( "\\n", FROMN | WHSPC);  /* new structure for \n */
		twd->next = wd->next;
		twd->prev = wd;                 /* link it in after word and other \n stuff */
		twd->next->prev = twd;
		wd->next = twd;
		}
	}
return( lastwd );                       /* Return last word of replace */
} /* function replace */

/**************************************************************
 * NAME
 *      copyrep
 * DESC
 *      Make a copy of a replace element.
 */
static Match *copyrep( Match *rep )
{
Match *trep;        /* Temp replace element */
Word *wd;           /* Temp word */
Ambig *amb;         /* Temp ambig */
Ambig *ramb;        /* Temp for ambig pointer to by rwd */
Morph *mp;          /* Temp morph */

trep = newmatch();                  /* Make new replace */
trep->type = rep->type;             /* Make same type, string, and cat */
trep->string = rep->string;
trep->cat = rep->cat;

wd = newword();                     /* Make new word */
trep->begwd = wd;                   /* Set rep to point to new word */
trep->endwd = wd;

wd->numamb = 1;                     /* 1 ambig */
wd->name = rep->begwd->name;        /* Same name */
wd->ambigs = rep->begwd->ambigs;    /* I think same ambigs is ok */
wd->type = rep->begwd->type;        /* 1.2a BJY */

amb = newambig();                   /* Make new ambig */
wd->ambigs = amb;                   /* Point word to new ambigs */
ramb = rep->begwd->ambigs;          /* Note rep ambigs */
amb->morphs = ramb->morphs;         /* Point ambig to morphs */
amb->cat = ramb->cat;               /* Same cat */
amb->decomp = ramb->decomp;         /* Same decomp */
amb->uform = ramb->uform;           /* Same underlying form 1.2a BJY */

mp = newmorph();                    /* Get new morph */
amb->morphs = mp;                   /* Set ambig morphs */
mp->name = rep->string;             /* Set name */
mp->type = rep->type & ( AFX | RT ); /* Set type */
mp->cat = amb->cat;                 /* Same cat as ambig */

if ( mp->type & AFX )               /* If affix */
	trep->matmp = mp;                /* Point to morpheme */

return( trep );
}

/**************************************************************
 * NAME
 *      copymp
 * DESC
 *      Make a copy of a replace element.
 */
static Morph *copymp( Morph *mp )
{
Morph *tmp;

tmp = newmorph();                   /* Get new morph */
tmp->name = mp->name;               /* Set name */
tmp->type = mp->type;               /* Set type */
tmp->cat = mp->cat;                 /* Set cat */
tmp->next = NULL;
tmp->prev = NULL;

return( tmp );
}

/**************************************************************
 * NAME
 *      more_same_word
 * ARGS
 *      mat - match to check
 * DESC
 *      Check to see if more matches on same word.
 * RETN
 *      TRUE if more, FALSE otherwise.
 */
static int more_same_word( Match *mat )
{
t_flag t;              /* Temp for type */

if ( !mat->next )                   /* If no more matches */
	return( FALSE );                /* Return no more */

t = mat->type;                      /* Get type */
if ( t & PFX )                      /* If prefix */
	return( TRUE );                 /* Return more */

t = mat->next->type;                /* Get type of next */
if ( t & SFX || t & CR )            /* If suffix or croot */
	return( TRUE );                 /* Return more */

return( FALSE );                    /* If none of above, no more */
}

/**************************************************************
 * NAME
 *      nextwd
 * ARGS
 *      wd - Current word structure
 * DESC
 *      return the next non-whitespace word structure in list
 * RETN
 *      Word structure if found or NULL
 *
 * Added 6/95 1.2a BJY
 */
static Word *nextwd( Word *wd )
{
for ( wd = wd->next; wd && ( wd->type & WHSPC ); wd = wd->next )
	;
return( wd );
}

/**************************************************************
 * NAME
 *      prevwd
 * ARGS
 *      wd - Current word structure
 * DESC
 *      return the next previous non-whitespace word structure in list
 * RETN
 *      Word structure if found or NULL
 *
 * Added 6/95 1.2a BJY
 */
static Word *prevwd( Word *wd )
{
for ( wd = wd->prev; wd && ( wd->type & WHSPC ); wd = wd->prev )
	;
return( wd );
}

/**************************************************************
 * NAME
 *      dispmatched
 * DESC
 *      Dump the matched portion of a sentence.
 */
static void dispmatched( Match *match, SenTransData *pSenTransData )
{
Match *mat;
Ambig *amb;         /* Temp ambig */
Morph *mp;          /* Temp morph */
Word *wd;           /* Temp word */
int firstambig;

if (pSenTransData->pLogFP == NULL)
  return;

for ( mat = match; mat; mat = mat->next )
  {
	if ( (wd = mat->begwd) != NULL )
		do
		{
		for ( firstambig = TRUE, amb = wd->ambigs;
				amb; amb = amb->next ) /* For each ambig */
			{
			if ( amb->matched )
				{
				if ( !firstambig )                      /* If not first ambig */
					fprintf( pSenTransData->pLogFP, "%%" ); /* Print a percent */
				if ( *amb->cat )                        /* 1.2a BJY */
					fprintf( pSenTransData->pLogFP, "%s=", amb->cat ); /* Print cat */
				for ( mp = amb->morphs; mp; mp = mp->next ) /* Print morphs */
					{
					if ( mp->type & ( SFX | CR ) )      /* If suffix or croot */
						fprintf( pSenTransData->pLogFP, "-" ); /* Put hyphen before */
					fprintf( pSenTransData->pLogFP, "%s", mp->name ); /* Print name */
					if ( mp->type & PFX )               /* If prefix */
						fprintf( pSenTransData->pLogFP, "-" ); /* Put hyphen after */
					}
				firstambig = FALSE;
				}
			}
		while ( mat->next && more_same_word( mat ) ) /* If more on same word */
			mat = mat->next;                        /* Move past them */
		fprintf( pSenTransData->pLogFP, " " );
		} while ( ( wd != mat->endwd ) && ( wd = nextwd( wd ) ) );
	}
fprintf( pSenTransData->pLogFP, "\n" );
}

/**************************************************************
 * NAME
 *      dispsent
 * ARGS
 *      sent - sentence to display
 *      num - number to display, 0 means all
 * DESC
 *      Dump content of a sentence.
 */
static void dispsent( Word *sent, int num, SenTransData *pSenTransData )
{
Word *wd;           /* Temp word */
Ambig *amb;         /* Temp ambig */
Morph *mp;          /* Temp morph */

if (pSenTransData->pLogFP == NULL)
  return;

if ( num == 0 )                  /* If num is 0 make it large */
	num = 1000;

for ( wd = sent; wd; wd = nextwd( wd ) )   /* For each word in sent */
	{
	for ( amb = wd->ambigs; amb; amb = amb->next ) /* For each ambig */
		{
				/* 1.2zf hab added "amb->cat &&" below */
		if ( amb->cat && *amb->cat )                        /* If cat not null string */
			fprintf( pSenTransData->pLogFP, "%s=", amb->cat );          /* Print cat */
		for ( mp = amb->morphs; mp; mp = mp->next ) /* Print morphs */
			{
			fprintf( pSenTransData->pLogFP, "%s", mp->name );           /* Print name */
			if ( mp->next )                     /* If another coming */
				fprintf( pSenTransData->pLogFP, "-" );                  /* Print hyphen */
			}
		if ( amb->next )                        /* If another ambig */
			fprintf( pSenTransData->pLogFP, "%%" );                     /* Print a percent */
		else
			fprintf( pSenTransData->pLogFP, " " );                      /* Else put space between */
		}
	if ( --num <= 0 )
		break;
	}
fprintf( pSenTransData->pLogFP, "\n" );
}

/**************************************************************
 * NAME
 *      invert
 * ARGS
 *      val - 3-valued logical value to invert.
 * DESC
 *      compute the logical inverse
 */
static int invert( int val )
{     switch ( val ) {
		case ALL:        return NONE;
		case SOME:       return SOME;
		case NONE:       return ALL;
		default:         return 0;
					}
}

/**************************************************************
 * NAME
 *      insertMorph  (hab 1.2ze)
 * ARGS
 *      mlp - head of morphList
 *      mp  - morph to add to list
 * DESC
 *      insert a morph into a morph list
 * RETN
 *      pointer to head of the morphList
 */
static MorphList * insertMorph( MorphList *mlp, Morph *mp )
{
MorphList * mlp0;

mlp0 = newMorphList(mp);
mlp0->next = mlp;
return mlp0;
}

/********************************************************************
 * NAME
 *      newMorphList  (hab 1.2ze)
 * ARGS
 *      mp  - morph in this MorphList element
 * DESCR
 *      Make a new Morphlist structure.
 * RETRN
 *      New MorphList structure.
 */
MorphList *newMorphList( Morph *mp )
{
MorphList *t;

t = myalloc( sizeof( MorphList ) );
t->mp = mp;
t->next = NULL;
return( t );
}

/*------------------------------------------------------------
* Change history:
* 0.1h  6-Nov-90 AB Original coding
* 0.3j 19-Jul-91 AB Fix bug of add prefix not working
*                   Fix bug of not adding affixes to all ambigs
* 0.3k 24-Jul-91 AB Remove endmp, change begmp to matmp
* 0.3n 26-Jul-91 AB Put empty element on front of sentence
* 0.3p 29-Jul-91 AB Fix bug of not removing prefix
* 0.3r  6-Aug-91 AB Fix bug of losing nl when word with it is deleted
* 0.4a  2-Oct-91 AB Add environment \am x / _ y (Mark Bean)
* 0.4b  3-Oct-91 AB Rework environ partially, still unfinished
* 0.4c  3-Oct-91 AB Finish environ coding, not fully tested yet
*                   Change sent bound to store literal pound sign
* 0.4d  4-Oct-91 AB Fix 0.4c bug of trace not right after rearrange
* 0.4t 12-Nov-91 AB Allow multiple environments (OR)
* 0.4v 19-Nov-91 AB Fix bug of failing to match right after replace
* 1.0a 22-Nov-91 AB Fix bug of left env failing on root suff combos
* 1.0d 27-Mar-92 AB Fix bug of sentence initial not working
* 1.0e  1-Apr-92 AB Add \rej rule to reject an ambiguity
* 1.0j  9-Nov-92 AB Protect against no match
*                   Send messages to log file, don't produce empty output
* 1.0p  3-Mar-93 AB Add statistical counts
*                   Add numbers after monitor lines
* 1.0r  6-Apr-93 AB Split ambig from ru in prep for repeat ambig
* 1.1  10-Jun-93 WM Add unanimity (amun, rejun), ruleson, rulesoff
*                   Fix dumprules hang.
* 1.1f 19-Feb-94 JK Port to MacCADA environment
*                   Fix trace where \w absent
*                   Fix doubtful comparisons (using streq with non-strings)
* 1.1g 21-Feb-94 JK Implement repeated elements (+)
* 1.1h 22-Feb-94 JK/AB Implement &/ for ANDed environments
*                   Fix / _ ... -SFX and similar environs
*                   Allow negated suffixes after non-negated
*                   Allow negated affixes in match
* 1.2a 27-Jun-95 BJY Give punctuation and whitespace their own nodes in the sentence
*                   structure instead of being attached to the word they came in with.
*                   Enforce 100 max word per sentence limit.
*                   Fixed problem of # ... x and ... x not working
*                   Output \u field for inserted words
* 1.2b 29-Jun-95 BJY Fix capitalization code broken by 1.2a
* 1.2c 20-Nov-95 BJY Fix bug from 1.2a of words getting inserted before initial punctuation,
*					markers, etc at beginning of sentence. Also fix bug of trace
*					showing \f field content - initial punc, etc as first word of sentence.
* 1.2x 09-Sep-1998 hab Fix bug which failed to maintain capitalization of the
*                        initial matching word in a replacement when it was
*                        not sentence initial
* 1.2y 11-Sep-1998 hab Refine 1.2x so that it applies only to replacements and
*                        not to deletions or initial insertions
* 1.2z 30-Sep-1998 hab Refine 1.2x so that capitalization of a deleted root
*                        within a "Cat=A > -B" kind of rule does not put A's
*                        capitalization on a following word.
* 1.2ze  16-Apr-1999 hab Fix bug: a reject rule with a repeated affix would
*                         incorrectly disambiguate a single occurrence of that
*                         affix.
* 1.2zh  24-Feb-2000 hab Fix bug: a failure might be missing a \cat field and
*                         the code was dereferencing a null pointer.
*-----------------------------------------------------------*/
