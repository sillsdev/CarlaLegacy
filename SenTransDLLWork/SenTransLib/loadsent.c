/* loadsent.c  Load sentence into structure  Alan B  26 Oct 90
*
Word *loadsent( FILE *infile );
Word *newword( void );
Ambig *newambig( void );
Morph *newmorph( void );
void putsent( Word *sent, FILE *outfile );
*/

/* Change History at end of file */

#include "SenTransLib.h"

#ifndef min
#define min(a, b) (((a) < (b)) ? (a) : (b))
#endif

static int first_call = TRUE;   /* First call of loadword */
static int eofseen = FALSE;     /* Saw eof last time */
static int cats_in = FALSE;      /* Categories in input */

static char *ambigp;
static char* s_pszPropMorph;


char *rest;          /* Rest of anal string */
static Morph *mprev;        /* Previous morph struct */
static Morph *firstmp;      /* First morph struct */

extern int myisspace( char c );

static char *strnonwhite( char *str );
static char *strpunc( char *str, SenTransData *pSenTransData );
Word *newitem( char *str, unsigned int type );
static Word *loadword( FILE *infile, SenTransData *pSenTransData );
static Word *newbound( void );
static int numambigs( char *s );
static char *nextambig( void );
static void loadambigs( Word *wd, char *line );
static Morph *loadmorphs( char *s );
static Morph *newmorph_linked( void );
static char *getmorph( void );
static void addcats( Word *word );
static void GetMorphProperties(char* pszProps, Morph* pMorphs);
static char*  pszMorphFirst( char* psz );
static char*  pszMorphNext( void );
static void BuildMorphPropertyList(Mem** ppMorphList, char* pszLstProp);
#ifndef hab221
static void GetMorphCategories(char* pszCats, Morph* pMorphs);
#endif /* hab221 */
#define MAXSENT 100

/**************************************************************
 * NAME
 *      loadsent
 * ARGS
 *      infile - file to load from
 * DESCR
 *      Load a sentence into the structures.
 * RETRN
 *      Pointer to first word structure, NULL at eof or error.
 */
Word *loadsent( FILE *infile, SenTransData *pSenTransData )
{
Word *sent;         /* Sentence being built */
Word *wd;           /* Current word */
Word *wprev;        /* Previous word */
Word *twd;          /* Temporary word pointer */
int wdcount;        /* Count of words to protect against overflow */

if ( eofseen )                      /* If eof seen last time */
	{
	eofseen = FALSE;                /* reset flag so we can re-run (needed in MacCADA) */
	first_call = TRUE;
	cats_in = FALSE;
	return( NULL );                 /* Return eof */
	}

sent = newbound();                  /* Init sent to boundary */
wprev = sent;                       /* Init prev word */
wdcount = 0;                        /* Init count of words */

while ( (wd = loadword( infile, pSenTransData )) != NULL )   /* While next word not eof */
	{
		/*
		*   Count word and ambigs
		*/
	wdcount++;
	pSenTransData->tot_words_in++;
#ifndef hab12zg
	twd = wd;
	while (twd && !(twd->type & WORD))
		twd = twd->next;          /* find the "real" word 1.2zg hab */
	if ( twd->numamb > 1 )
		{
		pSenTransData->tot_ambig_words_in++;
		pSenTransData->tot_ambigs_in += twd->numamb - 1;
		}
#else  /* hab12zg */
	if ( wd->numamb > 1 )
		{
		pSenTransData->tot_ambig_words_in++;
		pSenTransData->tot_ambigs_in += wd->numamb - 1;
		}
#endif /* hab 12zg */
		/*
		*   Link word onto end of sentence.
		*/
	twd = wd;
	wd->prev = wprev;           /* Link to prev */
	wprev->next = wd;           /* Link prev to here */
	while ( wd->next )
		wd = wd->next;          /* find end of list of new words 1.2a BJY */
	wprev = wd;                 /* Remember this one as prev */

		/*
		*   If sentence end punctuation on word, stop loading sentence.
		*/
	do  {
		if ( twd->type & WDPUNC &&    /* 1.2a BJY */
		 twd->type & FROMN  &&    /* 1.2zc hab */
			 strchr( pSenTransData->sent_punc, twd->ambigs->morphs->name[0] ) )  /* If sent end punc */
			goto sentbound;     /* Break out of load loop */
		} while ( twd != wd && ( twd = twd->next ) );

	if ( wdcount >= MAXSENT )       /* If sentence too long */
		goto sentbound;             /* Break out of load loop */
	}

sentbound:
wd = newbound();                    /* Link a boundary onto end */
wd->prev = wprev;                   /* Link to prev */
wprev->next = wd;                   /* Link prev to here */

return( sent );
}

/**************************************************************
 * NAME
 *      loadword
 * ARGS
 *      infile - file to load from
 * DESCR
 *      Load a word into the structures.
 * RETRN
 *      Pointer to first word structure, NULL at eof or error.
 */
static Word *loadword( FILE *infile, SenTransData *pSenTransData )
{
Word *firstwd;              /* 1.2a BJY First in a possible list of words */
Word *wd;                   /* Temp word struct to load */
Word *wprev = NULL;         /* 1.2a BJY */
Word *realwd;               /* points to word for current analysis (not punc, etc.) 1.2a BJY */
int first_aline;            /* Flag for first \a line in loop */
int n;                      /* Temp counter */
Ambig *amb;                 /* Temp ambig */
char *tstr;                 /* temp storage for \f and \n fields 1.2a BJY */
char *pszTmp;
char *s, *p;
int gotline = FALSE;        /* flag to skip fgets() call for one round 1.2a BJY */
char charray[2];            /* for making a string of 1 letter */
charray[1] = '\0';

if ( first_call )                   /* If first call */
	{
	if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get first line */
		  {
	  if (pSenTransData->pLogFP)
		fprintf( pSenTransData->pLogFP, "\nError: Empty Input File\n" );
	  eofseen = TRUE;
	  return( NULL );             /* If none, return eof */
		  }
	first_call = FALSE;             /* No longer first */
	}

if ( eofseen )                      /* If eof seen last time */
	return( NULL );                 /* Return eof */

firstwd = realwd = wd = newword();  /* Allocate a word struct */

/*
*   Handling of end of file:
* The loop below expects to be entered with a line already
*   in place in "line".  It is handled this way because it
*   stops when it sees the \a line of the next record.  But
*   the \a line has already been read, so it is left to be
*   processed as the first line of the next record.
* The code above assures that at the first call a line is
*   read in, so that the loop below will see it.
* When the code below sees eof, it has to return the last
*   record as good.  So, it sets eofseen, which triggers
*   the next call to return eof.
*/

first_aline = TRUE;                 /* Set first line */

while ( !eofseen )                    /* Terminates on next \a or eof */
	{                                 /* Process a line */
	if ( !strncmp( "\\a ", pSenTransData->line, 3 ) ) /* If line is \a line */
		{
		if ( first_aline )              /* If first one */
			{                             /* Load the ambigs */
			loadambigs( wd, pSenTransData->line );
			first_aline = FALSE;    /* No longer first */
			}
		else                        /* Else (not first) */
			{
			addcats( realwd );      /* Add any missing cats */
			return( firstwd );      /* Return finished word */
			}
		}
	else if ( !strncmp( "\\d ", pSenTransData->line, 3 ) ) /* If line is \d line */
		{
		n = numambigs( pSenTransData->line + 3 );  /* Set up ambigs */
		n = wd->numamb;             /* More trustable number */
		n = n ? n : 1;              /* At least 1 */
		for ( amb = wd->ambigs; n--; amb = amb->next ) /* For each ambig */
			amb->decomp = nextambig(); /* Load decomp */
		}
	else if ( !strncmp( "\\u ", pSenTransData->line, 3 ) ) /* If line is \d line */
		{
		n = numambigs( pSenTransData->line + 3 );  /* Set up ambigs */
		n = wd->numamb;             /* More trustable number */
		n = n ? n : 1;              /* At least 1 */
		for ( amb = wd->ambigs; n--; amb = amb->next ) /* For each ambig */
			amb->uform = nextambig(); /* Load decomp */
		}
	else if ( !strncmp( "\\cat ", pSenTransData->line, 5 ) ) /* If line is \cat line */
		{
		cats_in = TRUE;
		if (pSenTransData->ignore_cat)
			{
			n = numambigs( pSenTransData->line + 5 );  /* Set up ambigs */
			n = wd->numamb;             /* More trustable number */
			n = n ? n : 1;              /* At least 1 */
			for ( amb = wd->ambigs; n--; amb = amb->next ) /* For each ambig */
				amb->icat = nextambig(); /* Load input cat */
			}
		else
			{
			n = numambigs( pSenTransData->line + 5 );  /* Set up ambigs */
			n = wd->numamb;             /* More trustable number */
			n = n ? n : 1;              /* At least 1 */
			for ( amb = wd->ambigs; n--; amb = amb->next ) /* For each ambig */
				{
				amb->cat = nextambig(); /* Load cat */
										/* Cut off any morph category pairs */
				if ( (s = strchr( amb->cat, ' ' )) != NULL ) /* If space in cat */
#ifndef hab221
		  {
			pSenTransData->bMorphsHaveCats = TRUE; /* now we know */
					*s++ = '\0';          /* Cut off word cat*/
			GetMorphCategories(s, amb->morphs);	/* get morph cats */
		  }
#else /* hab221 */
					*s = '\0';          /* Cut off */
#endif /* hab221 */
				}
			}
		}
	else if ( !strncmp( "\\p ", pSenTransData->line, 3 ) ) /* If line is \p  property line */
		{
		n = numambigs( pSenTransData->line + 3 );  /* Set up ambigs */
		n = wd->numamb;             /* More trustable number */
		wd->type |= HASPROP;
		n = n ? n : 1;              /* At least 1 */
		for ( amb = wd->ambigs; n--; amb = amb->next ) /* For each ambig */
			{
			pszTmp = nextambig(); /* Load morpheme */

		/* Parse the morpheme properties.*/
			GetMorphProperties(pszTmp, amb->morphs);
			}
		}
	else if ( !strncmp( "\\fd ", pSenTransData->line, 4 ) ) /* If line is \fd line */
		{
		n = numambigs( pSenTransData->line + 4 );  /* Set up ambigs */
		n = wd->numamb;             /* More trustable number */
		n = n ? n : 1;              /* At least 1 */
		for ( amb = wd->ambigs; n--; amb = amb->next ) /* For each ambig */
			amb->feat = nextambig(); /* Load feat */
		}
	else if ( !strncmp( "\\w ", pSenTransData->line, 3 ) ) /* If line is \w line */
		{
		wd->name = mystrdup( pSenTransData->line + 3 );
		*( wd->name + strlen( wd->name ) - 1 ) = '\0'; /* Cut off nl */
		}
	else if ( !strncmp( "\\f ", pSenTransData->line, 3 ) ) /* If line is \f line  1.2a BJY */
		{
		tstr = mystrdup( pSenTransData->line + 3 );        /* accumulate \f field in tstr */
		while ( !eofseen && !gotline )
			{
			if ( !fgets( pSenTransData->line, MAXLINE, infile ) )  /* If no next line */
				eofseen = TRUE;             /* Remember eof seen */

			else if ( *pSenTransData->line == '\n' )       /* Else if blank line */
				;                           /* Don't load it */

			else if ( *pSenTransData->line == '\\' )       /* backslash mark */
				gotline = TRUE;             /* need to let other code see this line */

			else
				tstr = mystrappend( tstr, pSenTransData->line ); /* append to accumulating stuff */
			}
		s = tstr + strlen( tstr ) - 2;      /* start backwards from end of string (and skip \n) */
		*(s+1) = '\0';                      /* kill terminating \n */

		for ( p = s; p >= tstr && strchr( pSenTransData->begin_punc, *p ); p-- )    /* any begin punctuation? */
			{
			firstwd = newitem( p, FROMF | WDPUNC );  /* new structure for the punc mark just found */
			firstwd->next = wd;
			wd->prev = firstwd;             /* link this punc struct previous to current word */
			wd = firstwd;
			*p = '\0';
			}

		if ( p >= tstr )                     /* any non-punctuation to save? */
			{
			firstwd = newitem( tstr, FROMF ); /* new structure for the punc mark just found */
			if ( !strnonwhite( tstr ) )     /* is it all whitespace? */
				firstwd->type |= WHSPC;     /* yes, flag it as such */
			firstwd->next = wd;
			wd->prev = firstwd;             /* link this punc struct previous to current word */
			wd = firstwd;
			}

		for ( wd = firstwd; wd->next; wd = wd->next )   /* reset wd to current actual word */
			;
		}
	else if ( !strncmp( "\\c ", pSenTransData->line, 3 ) ) /* If line is \c line */
		{
		realwd->cap = mystrdup( pSenTransData->line );
		}
	else if ( !strncmp( "\\n ", pSenTransData->line, 3 ) ) /* If line is \n line  1.2a BJY */
		{
		tstr = mystrdup( pSenTransData->line + 3 );        /* accumulate \n field in tstr */
		while ( !eofseen && !gotline )
			{
			if ( !fgets( pSenTransData->line, MAXLINE, infile ) )  /* If no next line */
				eofseen = TRUE;             /* Remember eof seen */

			else if ( *pSenTransData->line == '\n' )       /* Else if blank line */
				;                           /* Don't load it */

			else if ( *pSenTransData->line == '\\' )       /* backslash mark */
				gotline = TRUE;             /* need to let other code see this line */

			else
				tstr = mystrappend( tstr, pSenTransData->line ); /* append to accumulating stuff */
			}
		s = tstr;
		*( s+strlen( s ) -1 ) = '\0';       /* kill terminating \n */
		if ( (p = strpunc( s, pSenTransData )) != NULL )             /* does \n contain punctuation? */
			{
			while ( p )
				{
				charray[0] = *p;            /* save punctuation for now */
				if ( p > s )                /* something before punc mark */
					{
					*p = '\0';              /* null terminate it */
					wprev = wd;
					wd = newitem( s, FROMN ); /* new structure for non-punctuation in \n field */
					wprev->next = wd;
					wd->prev = wprev;       /* link the new one to previous word */
					}
				wprev = wd;
				wd = newitem( charray, FROMN | WDPUNC );  /* now link in the punctuation mark */
				wprev->next = wd;
				wd->prev = wprev;           /* link the new one to previous word */
				s = p+1;                    /* skip past punctuation just processed */
				p = strpunc( s, pSenTransData );           /* any more punctuation in \n field? */
				}
			}

		if ( *s )                           /* no punctuation or something left after punctuation */
			{
			wprev = wd;
			wd = newitem( s, FROMN );       /* new structure for the \n field */
			if ( !strnonwhite( s ) )        /* is it all whitespace? */
				wd->type |= WHSPC;          /* yes, flag it as such */
			wprev->next = wd;
			wd->prev = wprev;               /* link the new one to previous word */
			}
		}
	else                                /* Else (blank lines) ignore */
		{                               /* Everything except blank */
		}                               /*   lines should be loaded */

	if ( gotline )                      /* already have next line 1.2a BJY */
		gotline = FALSE;
	else if ( !fgets( pSenTransData->line, MAXLINE, infile ) )  /* Get another line */
		eofseen = TRUE;                 /* If here, eof but a good word */
										/* Remember eof seen */
	}
	addcats( realwd );                  /* Add any missing cats */
	return( firstwd );
}

/**************************************************************
 * NAME
 *      pszMorphFirst
 * ARGS
 *      psz - string to set up for morph properties extraction
 * GLOB
 *      s_pszPropMorph - set to start of first prop for pszMorphNext
 * DESCR
 *      Set up s_pszPropMorph for return of subsequent morph properties.
 * RETRN
 *      pointer to the first morph property or to NULL if none.
 */
static char* pszMorphFirst( char* psz )
{
char* pszProp;
s_pszPropMorph = psz;                 /* Set pointer for string */
if ( *s_pszPropMorph == '\0' ||
		*s_pszPropMorph == '\n' ||
		*s_pszPropMorph == ' ' )            /* If no properties */
	return NULL;            /* Return NULL */
else                        /* Else get first property element */
	{
	pszProp = s_pszPropMorph;
	while ( strchr("=\n", *(s_pszPropMorph)) == NULL )
		s_pszPropMorph++;
	if (*s_pszPropMorph != '\0')
		*(s_pszPropMorph++) = '\0';
	return( pszProp );    /* Return property list */
	}
}

#ifndef hab221
/**************************************************************
 * NAME
 *      GetMorphCategories
 * ARGS
 *      pszCats - pointer to morpheme portion of \cat field in ANA input
 *      pMorphs - list of morphemes
 * DESC
 *      Get the category (mappings) for each morpheme from the \cat field
 * RETN
 *      none
 */
static void GetMorphCategories(char* pszCats, Morph* pMorphs)
{
  char *cp;
  Morph* pmrph;

  pszCats = skipwhite(pszCats);

  for (pmrph = pMorphs; pmrph; pmrph = pmrph->next)
	{
	  if (pszCats == NULL ||
	  *pszCats == '\0')
	break;			/* unexpected input; quit */
	  cp = strchr(pszCats, '=');
	  if (cp != NULL)
	*cp = '\0';
	  if (pmrph->cat == NULL)	/* if not a root */
	  pmrph->cat = mystrdup(pszCats);
	  if (cp != NULL)
	pszCats = ++cp ;
	}
}
#endif /* hab221 */

/**************************************************************
 * NAME
 *      pszMorphNext
 * ARGS
 *      None
 * GLOB
 *      s_pszPropMorph - start of current property list to extract
 * DESC
 *      Get the next morph property list.
 * RETN
 *      pointer to morph property list or to NULL if none.
 */
static char *pszMorphNext( void )
{
char *pszProp;

if ( *s_pszPropMorph == '\0' ||
		*s_pszPropMorph == '\n' ||
		*s_pszPropMorph == ' ' )            /* If no properties */
	return NULL;            /* Return NULL */
else                        /* Else get first property element */
	{
	pszProp = s_pszPropMorph;
	while ( strchr("=\n", *(s_pszPropMorph)) == NULL )
		s_pszPropMorph++;
	if (*s_pszPropMorph != '\0')
		*(s_pszPropMorph++) = '\0';
	return( pszProp );    /* Return property list */
	}
}

void GetMorphProperties(char* pszProps, Morph* pMorphs)
{
	char *pszThisMorph;
	Morph* pmrph;

	pszThisMorph = pszMorphFirst(pszProps);

	for (pmrph = pMorphs; pmrph; pmrph = pmrph->next)
		{
		BuildMorphPropertyList(&pmrph->prop, pszThisMorph);
		pszThisMorph = pszMorphNext();
		}

}

void BuildMorphPropertyList(Mem** ppMorphList, char* pszLstProp)
{
	char* pszProp;
	Mem* pprop,
		*ppropTail;

	if (pszLstProp == NULL)
		return;

	pszProp = strtok(pszLstProp, " ");

	if (pszProp != NULL)
		{
		*ppMorphList = newcat();	/* Use newcat to get a new Mem* prop item. */
		ppropTail = *ppMorphList;
		ppropTail->name = mystrdup( pszProp );      /* Set name to that property. */
		pszProp = strtok(NULL, " ");	/* Get next element. */
		}

	while (pszProp != NULL)
	{
		/* Add the property to the list. */
		pprop = newcat();	/* Use newcat to get a new Mem* prop item. */
		pprop->name = mystrdup( pszProp );      /* Set name to that property. */
		ppropTail->next = pprop;
		ppropTail = pprop;
		pszProp = strtok(NULL, " ");
	}
}

/********************************************************************
 * NAME
 *      strpunc
 * ARGS
 *      str - string to scan
 * DESC
 *      search str for first occurance of punctuation
 * RETN
 *      pointer to first punctuation mark or NULL if none found
 *
 * Added 6/95 1.2a BJY
 */
char *strpunc( char *str, SenTransData *pSenTransData )
{
char *punc = NULL;
char *spunc = NULL;
char *p, *s;

for ( p = pSenTransData->sent_punc; *p; p++ )
	if ( (s=strchr( str, *p )) != NULL )                  /* look for sentence punctuation */
		spunc = spunc ? min( s, spunc ) : s;    /* find first punctuation in str */

for ( p = pSenTransData->other_punc; *p; p++ )
	if ( (s=strchr( str, *p )) != NULL )                  /* look for other punctuation */
		punc = punc ? min( s, punc ) : s;       /* find first punctuation in str */

if ( punc && spunc )
	return( min( punc, spunc ) );       /* return whichever occurs first in str */

else
	return( punc ? punc : spunc );      /* return whichever was found (or NULL) */
}

/********************************************************************
 * NAME
 *      strnonwhite
 * ARGS
 *      str - string to scan
 * DESC
 *      search str for first occurance of something other than whitespace
 *      It sees an adjacent \ and n as whitespace
 * RETN
 *      pointer to first non-whitespace character or NULL if none found
 *
 * Added 6/95 1.2a BJY
 */
char *strnonwhite( char *str )
{
char *p = str;

while ( TRUE )
	{
	if ( *p == '\\' && *(p+1) == 'n' )      /* literal "\n" from \f or \n field */
		p += 2;
	else if ( myisspace( *p ) )
		p++;
	else
		return( *p ? p : NULL );            /* return first non-white or NULL */
	}
}

/********************************************************************
 * NAME
 *      addcats
 * ARGS
 *      word - word to work on
 * DESC
 *      Add cat of first root to any ambig that doesn't have a cat.
 * RETN
 *      None.
 */
static void addcats( Word *word )
{
Ambig *amb;
Morph *mp;

for ( amb = word->ambigs; amb; amb = amb->next )  /* For each ambig */
	if ( !amb->cat )                    /* If no category */
		for ( mp = amb->morphs; mp; mp = mp->next ) /* For each morph */
			if ( mp->type & RT )        /* If root */
				{
				amb->cat = mp->cat;     /* Set ambig category */
				break;                  /* Break to only do first cat */
				}
}

/********************************************************************
 * NAME
 *      newbound
 * DESCR
 *      Make a new sentence boundary word structure.  This is
 *          a "word" with a morpheme of #.
 * RETRN
 *      New word structure.
 */
static Word *newbound( void )
{
Word *t;
Ambig *amb;
Morph *mp;

t = newword();
t->type = BOUND;
t->numamb = 1;
amb = t->ambigs = newambig();
amb->cat = "";
mp = amb->morphs = newmorph();
mp->type = RT;                      /* Type is root */
mp->name = "#";
mp->cat = "";

return( t );
}

/********************************************************************
 * NAME
 *      newitem
 * ARGS
 *      str - string to be stuffed into new word structure
 * DESCR
 *      Make a new word structure of the specified type.  Used for
 *       creating WHSPC and WDPUNC structures.
 * RETRN
 *      New word structure.
 *
 * Added 6/95 1.2a BJY
 */
Word *newitem( char *str, unsigned int type )
{
Word *t;
Ambig *amb;
Morph *mp;

t = newword();
t->numamb = 1;
t->type = type;
amb = t->ambigs = newambig();
amb->cat = "";
mp = amb->morphs = newmorph();
mp->type = RT;
mp->name = mystrdup( str );
mp->cat = "";

return( t );
}

/********************************************************************
 * NAME
 *      newword
 * DESCR
 *      Make a new word structure.
 * RETRN
 *      New word structure.
 */
Word *newword( void )
{
Word *t;

t = myalloc( sizeof( Word ) );
t->name = NULL;
t->cap = NULL;
t->numamb = 0;
t->ambigs = NULL;
t->prev = NULL;
t->next = NULL;
t->type = WORD;
return( t );
}

/********************************************************************
 * NAME
 *      newambig
 * DESCR
 *      Make a new ambig structure.
 * RETRN
 *      New ambig structure.
 */
Ambig *newambig( void )
{
Ambig *t;

t = myalloc( sizeof( Ambig ) );
t->morphs = NULL;
t->decomp = NULL;
t->uform = NULL;
t->cat = NULL;
t->icat = NULL;
t->feat = NULL;
t->matched = FALSE;
t->ematched = FALSE;
t->prev = NULL;
t->next = NULL;
return( t );
}

/********************************************************************
 * NAME
 *      newmorph
 * DESCR
 *      Make a new morph structure.
 * RETRN
 *      New morph structure.
 */
Morph *newmorph( void )
{
Morph *t;

t = myalloc( sizeof( Morph ) );
t->name = NULL;
t->type = 0;
t->cat = NULL;
t->prop = NULL;
t->prev = NULL;
t->next = NULL;
return( t );
}

/**************************************************************
 * NAME
 *      numambigs
 * ARGS
 *      s - string to set up for ambig extraction
 * GLOB
 *      ambigp - set to start of first ambig for nextambig
 * DESCR
 *      Set up string s for ambig extraction by nextambig.
 * RETRN
 *      Number of ambigs in s.
 */
static int numambigs( char *s )
{

ambigp = s;                 /* Set pointer for string */
if ( *s != '%' )            /* If not ambiguous */
	return( 1 );            /* Return 1 */
else                        /* Else (ambig or fail) */
	{
	s = ++ambigp;           /* Remember start of number */
	while ( *(ambigp++) != '%' ) /* Move to after % at end of number */
		;
	return( atoi( s ) );    /* Return number */
	}
}

/**************************************************************
 * NAME
 *      nextambig
 * ARGS
 *      None
 * GLOB
 *      ambigp - start of current ambig to extract
 *               set to start of next ambig
 * DESC
 *      Return copy of next ambig from string set up by numambigs.
 * RETN
 *      Next ambig.
 */
static char *nextambig( void )
{
char *s;                    /* Temp for return value */

s = ambigp;                 /* Remember this one for return */
while ( *ambigp != '%'      /* Move to end percent */
		&& *ambigp != '\n' ) /* or to end CR */
	ambigp++;
*ambigp = '\0';             /* Null terminate */
ambigp++;                   /* Move to start of next */
return( mystrdup( s ) );    /* Return copy of this ambig string */
}

/**************************************************************
 * NAME
 *      loadambigs
 * ARGS
 *      wd - word struct to load ambigs into
 *      line - line to load ambigs from
 * DESC
 *      Load the ambiguities from the \a line.
 */
static void loadambigs( Word *wd, char *line )
{
int n;                      /* Temp counter of ambigs */
Ambig *amb;                 /* Temp amb struct to load */
Ambig *aprev = NULL;               /* Prev amb struct */

wd->numamb = numambigs( line + 3 ); /* Find how many and set up */

n = wd->numamb ? wd->numamb : 1;    /* Set n to ambigs, or 1 for fail */

while ( n-- )                       /* For each ambig */
	{
	amb = newambig();               /* Get new ambig struct */
	amb->morphs = loadmorphs( nextambig() ); /* Load morphs */

	if ( !wd->ambigs )              /* If no prev */
		wd->ambigs = aprev = amb;   /* Point wd and prev to this */
	else
		{
		amb->prev = aprev;          /* Link to prev */
		aprev->next = amb;          /* Link prev to here */
		aprev = amb;                /* Remember this one as prev */
		}
	}
}

/**************************************************************
 * NAME
 *      loadmorphs
 * ARGS
 *      s - string to load from
 * GLOB
 *      rest - the rest of the anal string, for nextmorph
 * DESC
 *      Load the morphs from one analysis from \a line.
 * RETN
 *      A Morph structure with morphs loaded.
 */
static Morph *loadmorphs( char *s )
{
Morph *mp;          /* Temp morph struct */
int affix_type;     /* Type of affix expected */

firstmp = mprev = NULL;             /* Init first and prev */
rest = s;                           /* Set rest to beginning */
affix_type = PFX;                   /* Start with prefix */

while ( *rest )                     /* While more analysis */
	{
	if ( *rest == '<' )             /* If begin root next */
		{
		getmorph();                 /* Move to cat */
		while ( *rest && *rest != '>' ) /* For all roots */
			{
			mp = newmorph_linked(); /* Get a linked morph */
			mp->type = RT;          /* Set type to root */
			if ( mp->prev && mp->prev->type & RT ) /* If prev is root */
				mp->type |= CR;     /* Set compound root */
			mp->cat = getmorph();   /* Store cat */
			mp->name = getmorph();  /* Store name */
			}
		getmorph();                 /* Move to next morph */

		if ( !strchr( rest, '<' ) ) /* If no more roots coming */
			affix_type = SFX;       /* Set to suffix */
		}
	else
		{
		mp = newmorph_linked();     /* Get a linked morph */
		mp->type = affix_type;      /* Set type */
		mp->name = getmorph();      /* Store name */
		}
	}
return( firstmp );                  /* Return first morph in list */
}

/**************************************************************
 * NAME
 *      newmorph_linked
 * ARGS
 *      None
 * GLOB
 *      mprev - previous morph in list
 * DESC
 *      Link a morph for loadmorph.
 * RETN
 *      A new Morph structure linked to previous.
 */
static Morph *newmorph_linked( void )
{
Morph *mp;              /* Temp morph */

mp = newmorph();                /* Allocate a new morph */
								/* Link it in */
if ( !firstmp )                 /* If first morph */
	firstmp = mprev = mp;       /* Set first and prev morph */
else
	{
	mp->prev = mprev;           /* Link to prev */
	mprev->next = mp;           /* Link prev to here */
	mprev = mp;                 /* Remember this one as prev */
	}
return( mp );                   /* Return new morph */
}

/**************************************************************
 * NAME
 *      getmorph
 * ARGS
 *      None
 * GLOB
 *      rest - the rest of the anal string, from loadmorphs
 * DESC
 *      Isolate the next morph from anal string.
 * RETN
 *      The next morph.
 */
static char *getmorph( void )
{
char *begmorph;     /* Beginning of morph */

begmorph = rest;                /* Remember begin */

while ( *rest && *rest != ' ' ) /* Find end */
	rest++;

if ( *rest )                    /* If space */
	*rest++ = '\0';             /* Make NUL and move on */

#ifndef hab206
while (*rest && *rest == ' ')
  rest++;			/* skip any extra spaces */
#endif /* hab206 */
return( begmorph );             /* Return beginning of morph */
}

/**************************************************************
 * NAME
 *      putsent
 * ARGS
 *      sent - first word in sent
 *      outfile - file for output
 * DESC
 *      Output rearranged sentence.
 */
void putsent( Word *sent, FILE *outfile, SenTransData *pSenTransData )
{
Word *wd, *twd, *tend;
Ambig *amb;
Mem*  pProp;
Morph *mp;
int fmtflag = FROMF|FROMN;    /* 1.2a BJY */

if (outfile == NULL)
  return;
	/*
	*  The first and last words are boundary marks, so are not output.
	*/
for ( wd = sent->next; wd->next; wd = wd->next ) /* For each word in sent */
	{
	if ( !(wd->type & WORD ) )
		continue;                       /* skip WHSPC, WDPUNC, etc. 1.2a BJY */

	pSenTransData->num_words++;                        /* Count word */
	if ( pSenTransData->do_ambig_monitor &&
	 pSenTransData->pErrorLogFP) /* If ambig monitor give dot */
		{
		if ( wd->numamb == 0 )          /* If fail */
			{
			if ( wd->ambigs &&	        /* valid pointer check 1.3 hab */
		 wd->ambigs->morphs )   /* If not final empty one */
				fprintf( pSenTransData->pErrorLogFP, "*" ); /* Give star */
			}
		else if ( wd->numamb > 9 )      /* If over 9, give 9 */
			fprintf( pSenTransData->pErrorLogFP, "9" );
		else if ( wd->numamb != 1 )     /* If ambig */
			fprintf( pSenTransData->pErrorLogFP, "%d", wd->numamb ); /* Out number */
		else
			fprintf( pSenTransData->pErrorLogFP, "." );     /* Else (one anal) give dot */
		if ( pSenTransData->num_words % 10 == 0 )          /* Output space every 10 */
			fprintf( pSenTransData->pErrorLogFP, "  " );
		if ( pSenTransData->num_words % 100 == 0 )
			fprintf( pSenTransData->pErrorLogFP, "  %d", pSenTransData->num_words ); /* Output number every 100 */
		if ( pSenTransData->num_words % 50 == 0 )
			fprintf( pSenTransData->pErrorLogFP, "\n" );
		}

		/*
		*   Count word and ambigs
		*/
	pSenTransData->tot_words_out++;
	if ( wd->numamb > 1 )
		{
		pSenTransData->tot_ambig_words_out++;
		pSenTransData->tot_ambigs_out += wd->numamb - 1;
		}

	fputs( "\\a ", outfile );           /* Output \a analysis */

	if ( wd->numamb != 1 )              /* If fail or ambig */
		fprintf( outfile, "%%%d%%", wd->numamb ); /* Out number */

	for ( amb = wd->ambigs; amb; amb = amb->next )  /* For each ambig */
		{
		for ( mp = amb->morphs; mp; mp = mp->next ) /* For each morph */
			{
			if ( mp->type & RT )                   /* If root, out it */
				{
				if ( !mp->prev                      /* If first morph */
						|| !( mp->prev->type & RT ) ) /* Or first root */
					fprintf( outfile, "< " );       /* Output wedge */
													/* Output cat & root */
				fprintf( outfile, "%s %s", mp->cat, mp->name );

				if ( !mp->next                      /* If last morph */
						|| !( mp->next->type & RT ) ) /* Or last root */
					fprintf( outfile, " >" );        /* Output wedge */
				}
			else
				fputs( mp->name, outfile ); /* Output morpheme */

			if ( mp->next )             /* If another coming */
				fputc( ' ', outfile );  /* Output a space */
			}
		if ( wd->numamb != 1 )          /* If fail or ambig */
			fputc( '%', outfile );      /* Out closing percent */
		}

	fputc( '\n', outfile );                 /* Output nl */

	if ( wd->ambigs &&	        /* valid pointer check 1.3 hab */
	 wd->ambigs->decomp )
		{
		fputs( "\\d ", outfile );                   /* Output \d decomp */

		if ( wd->numamb != 1 )              /* If fail or ambig */
			fprintf( outfile, "%%%d%%", wd->numamb ); /* Out number with %'s */
		for ( amb = wd->ambigs; amb; amb = amb->next ) /* For each ambig */
			{
			fputs( amb->decomp, outfile );       /* Output ambig */
			if ( wd->numamb != 1 )              /* If fail or ambig */
				fputc( '%', outfile );              /* Output percent */
			}
		fputc( '\n', outfile );                 /* Output nl */
		}

	if ( wd->ambigs &&	        /* valid pointer check 1.3 hab */
	 wd->ambigs->cat && cats_in )           /* If cat from input */
		{
		fputs( "\\cat ", outfile );                 /* Output \cat category */

		if ( wd->numamb != 1 )              /* If fail or ambig */
			fprintf( outfile, "%%%d%%", wd->numamb ); /* Out num with % */
		for ( amb = wd->ambigs; amb; amb = amb->next ) /* For each ambig */
			{
			if (pSenTransData->ignore_cat && amb->icat)
				fputs( amb->icat, outfile );
			else
#ifndef hab221
		  {
				fputs( amb->cat, outfile );          /* Output ambig */
		if (pSenTransData->bMorphsHaveCats)
		  {
			fputc(' ', outfile);
			for ( mp = amb->morphs; mp; mp = mp->next )
			  {
			if (mp->cat)
			  fputs(mp->cat, outfile);
			if (mp->next)
			  fputc('=', outfile);
			  }
		  }
		  }
#else /* hab221 */
				fputs( amb->cat, outfile );          /* Output ambig */
#endif /* hab221 */
			if ( wd->numamb != 1 )              /* If fail or ambig */
				fputc( '%', outfile );              /* Output percent */
			}
		fputc( '\n', outfile );                 /* Output nl */
		}

	if (wd->type & HASPROP)
		{
		fputs( "\\p ", outfile );           /* RNE 1995-12-11 Output \p properties*/

		if ( wd->numamb != 1 )              /* If fail or ambig */
			fprintf( outfile, "%%%d%%", wd->numamb ); /* Out number */

		for ( amb = wd->ambigs; amb; amb = amb->next )  /* For each ambig */
			{
			for ( mp = amb->morphs; mp; mp = mp->next ) /* For each morph */
				{
				/* For each property */
				for (pProp = mp->prop; pProp; pProp = pProp->next)
					{
					fputs(pProp->name, outfile);
					if (pProp->next)
						fputc( ' ', outfile );  /* Output a separating space */
					}
				if ( mp->next )             /* If another coming */
					fputc( '=', outfile );  /* Output a = */
				}
			if ( wd->numamb != 1 )              /* If fail or ambig */
			fputc( '%', outfile );              /* Output percent */
			}

		fputc( '\n', outfile );                 /* Output nl */
		}

	if ( wd->ambigs &&	        /* valid pointer check 1.3 hab */
	 wd->ambigs->uform )
		{
		fputs( "\\u ", outfile );                   /* Output \u underlying form */

		if ( wd->numamb != 1 )              /* If fail or ambig */
			fprintf( outfile, "%%%d%%", wd->numamb ); /* Out number with %'s */
		for ( amb = wd->ambigs; amb; amb = amb->next ) /* For each ambig */
			{
			fputs( amb->uform, outfile );       /* Output ambig */
			if ( wd->numamb != 1 )              /* If fail or ambig */
				fputc( '%', outfile );              /* Output percent */
			}
		fputc( '\n', outfile );                 /* Output nl */
		}

	if ( wd->ambigs &&	        /* valid pointer check 1.3 hab */
	 wd->ambigs->feat )
		{
		fputs( "\\fd ", outfile );                  /* Output \fd feat */

		if ( wd->numamb != 1 )              /* If fail or ambig */
			fprintf( outfile, "%%%d%%", wd->numamb ); /* Out number with %'s */
		for ( amb = wd->ambigs; amb; amb = amb->next ) /* For each ambig */
			{
			fputs( amb->feat, outfile );         /* Output ambig */
			if ( wd->numamb != 1 )              /* If fail or ambig */
				fputc( '%', outfile );              /* Output percent */
			}
		fputc( '\n', outfile );                 /* Output nl */
		}

	if ( wd->name )                     /* Output word name */
		fprintf( outfile, "\\w %s\n", wd->name );

	if ( wd->prev &&	        /* valid pointer check 1.3 hab */
	 wd->prev->type & fmtflag )     /* was there something in \f field? */
		{
		for ( twd = wd->prev; twd->prev->type & fmtflag; twd = twd->prev )
			;                           /* back up over \n and \f stuff  1.2a BJY*/
										/* may need to output \n stuff here if a */
										/* word containing \n stuff was deleted */
										/* NOTE! this really only happens for first word */
										/* then fmtflag gets set to FROMF */
		if ( twd != wd )
			{
			fputs( "\\f ", outfile );
			for ( ; twd != wd; twd = twd->next ) /* output punctuation, whitespace, etc. */
				fputs( twd->ambigs->morphs->name, outfile ); /* wow! */
			fputs( "\n", outfile );
			}
		}
	fmtflag = FROMF;

	if ( wd->cap )                      /* Output cap info */
		fputs( wd->cap, outfile );

	if ( wd->next &&	        /* valid pointer check 1.3 hab */
	 wd->next->type & (FROMF|FROMN) ) /* was there something in \n field? 1.2a BJY */
		{
		for ( tend = wd->next; tend->next->type & (FROMF|FROMN); tend = tend->next )
			;                           /* may need to output \f stuff here if a */
										/* word containing \f stuff was deleted */
		for ( ; tend->type & FROMF && tend != wd; tend = tend->prev )
			;                           /* now back up to last \n struct */
		if ( tend != wd )               /* anything to output? */
			{
			fputs( "\\n ", outfile );
			for ( twd = wd->next; twd->prev != tend; twd = twd->next )
				fputs( twd->ambigs->morphs->name, outfile ); /* output punctuation, whitespace, etc. */
			fputs( "\n", outfile );
			}
		}

	fputc( '\n', outfile );             /* Output blank line */
	}
}

/*------------------------------------------------------------
* Change history:
* 0.1d 26-Oct-90 AB Original coding
* 0.1m 22-Jan-90 AB Fix false return on loadambig
* 0.3n 26-Jul-91 AB Put empty element on front of sentence
*                   Change sent bound to store literal pound sign
* 0.4w 20-Nov-91 AB Fix bug of memory overflow from % in morphname
* 0.4z 20-Nov-91 AB Enlarge MAXLINE to 2000 for huge ambigs
* 1.0p  3-Mar-93 AB Limit sentence loading to 100 for word lists
* 1.1f 19-Feb-94 JK Port to MacCADA, add ignore_cat option
* 1.1k  7-Mar-94 WM Fix hang due to empty input file
* 1.1s 1-Jul-94 ALB Pass \u field
* 1.2a 27-Jun-95 BJY Give punctuation and whitespace their own nodes in the sentence
*                   structure instead of being attached to the word they came in with.
*                   Enforce 100 max word per sentence limit.
*                   Fixed problem of # ... x and ... x not working
*                   Output \u field for inserted words
* 1.2h Outputting of property \p field.
* 1.2za 02-Oct-1998 hab Fix bug which caused Win32 version to crash on non-ANA
*                        input
* 1.2zc  20-Nov-1998 hab Fix bug : when a begin punctuation symbol is also used
*                         as an end punctuation symbol, it erroneously treated
*                         the begin occurrence as if it were an end occurrence.
* 1.2zg 02-Nov-1999 hab Fix bug : did not count input ambiguities correctly if
*                         there was a "fake" punctuation word.
*-----------------------------------------------------------*/
