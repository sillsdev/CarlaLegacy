/* applrule.c  Apply rules to input  Alan B  6 Nov 90
*
Word *applyrules( Rule *rules, Word *sent )
*/
/*------------------------------------------------------------
* Change history:
* 0.1  30-Sep-92 AB Original coding
* 0.2a 20-Oct-92 WM Counts of changes and dups, numbered monitor
* 0.2c  2-Mar-93 AB Incorporate Bill's work from his 0.2a
* 0.2p 01-Sep-1998 hab Conform monitoring output to standard practice
*-----------------------------------------------------------*/

#include "lextrans.h"

extern int replace_cats;
extern int replace_props;
extern int do_debug;
extern int do_trace;
extern int do_monitor;
extern int num_apps;
extern int trycount;
extern int num_sents;
extern int changecount;               /* words with substitutions applied */
extern int splitcount;                /* created ambiguities */

static Ambig *copyamb( Ambig *amb );
static Morph *copymorphs( Morph *mp );
static Morph *copymp( Morph *mp );

/**************************************************************
 * NAME
 *      applyrules
 * ARGS
 *      hash - table of rules to apply
 *      sent - analysis to apply rules to
 * DESC
 *      Apply rules to analysis to do lexical transfer
 * RETN
 *      Pointer to modified analysis
 */
Word *applyrules( Rule **hash, Word *sent )
{
Rule *ru;           /* Temp rule */
Ambig *amb;         /* Temp ambig */
Ambig *tamb;        /* Temp ambig */
Morph *mp;          /* Temp morph */
Word *wd;           /* Temp word */
char *seclet;       /* Second letter of morphname */
int compare;        /* Value of comparison */
int numdup;         /* Number of duplicate */

num_apps = 0;                       /* Clear number of rules applied */

for ( wd = sent; wd; wd = wd->next )        /* For each word in sent */
 for ( amb = wd->ambigs; amb; amb = amb->next ) /* For each ambig */
  for ( mp = amb->morphs; mp; mp = mp->next ) /* For each morph */
	{
	if ( mp->type & RT )                    /* If root */
	{                                   /* For each rule */
	for ( ru = hash[ *mp->name ]; ru; ru = ru->next )
		{
		seclet = (char *)mp->name + 1;
		compare = strcmp( ru->match, seclet );
		if ( compare == 0 )             /* If match */
		{
		mp->numchange++;            /* Note changed */
		changecount++;              /* Global count */
		numdup = 0;                 /* While duplicate matches */
		while ( ru->next && streq( seclet, ru->next->match ) )
			{
			if ( mp->numchange == numdup + 1 )
			{
			if ( do_trace || do_debug )
				printf( "  Duplicate found: %s\n", mp->name );

			tamb = copyamb( amb );  /* make a new ambiguity */
			if ( amb->next )
				amb->next->prev = tamb;
			tamb->next = amb->next;
			tamb->prev = amb;
			amb->next = tamb;

			wd->numamb++;
			break;
			}
			ru = ru->next;
			numdup++;
			splitcount++;              /* Global count of dups */
			}
		if ( do_trace || do_debug )
			printf( "Replace: %s -> %s %s\n", mp->name, ru->cat, ru->repl );
		if ( *ru->cat )
			mp->cat = mystrdup( ru->cat ); /* Replace cat */
		if ( *ru->repl )
			mp->name = (unsigned char *)mystrdup( ru->repl ); /* Substitute root */

		if (replace_props)
		{
			mp->lstProps = ru->lstProps; /* Also substitute with rule properties */
			wd->bHasProps = TRUE;
		}

		num_apps++;                 /* Rule tries on this one */
		trycount++;                 /* Global rule tries */
		break;                      /* No more rules apply */
		}
		if ( compare > 0 )              /* If past possible */
		break;                      /* Stop search */
		}
	}
	}

num_sents++;                                /* Count sentence */
if ( do_monitor )                           /* If monitor, give dot */
	{
	if (num_apps == 0)		/* hab 0.2p Conformed to standard practice */
	  putc('.', stderr);
	else if (num_apps < 10)
	  putc('0'+num_apps, stderr);
	else
	  putc('>', stderr);
	if ( num_sents % 10 == 0 )
	fprintf( stderr, "  " );
	if ( num_sents % 100 == 0 )
	fprintf( stderr, "%d", num_sents );
	if ( num_sents % 50 == 0 )
	fprintf( stderr, "\n" );
	}

return( sent );                             /* Return modified sent */
}


/**************************************************************
 * NAME
 *      copyamb
 * DESC
 *      Make a copy of an ambiguity element.
 */
static Ambig *copyamb( Ambig *amb )
{
Ambig *tamb;

tamb = newambig();                      /* Get new ambig */
tamb->decomp = amb->decomp;             /* Set decomp */
tamb->cat = amb->cat;                   /* Set cat */
tamb->feat = amb->feat;                 /* Set feat */
tamb->matched = amb->matched;           /* Set feat */
tamb->morphs = copymorphs( amb->morphs ); /* Copy morphs */
tamb->next = NULL;
tamb->prev = NULL;

return( tamb );
}



/**************************************************************
 * NAME
 *      copymorphs
 * DESC
 *      Make a copy of a set of morphs.
 */
static Morph *copymorphs( Morph *mp )
{
Morph *tmp;
Morph *firstmp;
Morph *prevmp;

firstmp = prevmp = copymp( mp );

for ( mp = mp->next; mp; mp = mp->next )
	{
	tmp = copymp( mp );                   /* Copy morph */
	tmp->prev = prevmp;
	prevmp->next = tmp;
	prevmp = tmp;
	}

return( firstmp );
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
tmp->lstProps = mp->lstProps;		/* RNE 1995-12-20  copy in the morph properties also from mp */

tmp->numchange = mp->numchange;     /* Set number of change */
tmp->next = NULL;
tmp->prev = NULL;

return( tmp );
}
