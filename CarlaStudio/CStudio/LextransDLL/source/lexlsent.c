/* loadsent.c  Load sentence into structure  Alan B  26 Oct 90
*
Word *loadsent( FILE *infile );
Word *newword( void );
Ambig *newambig( void );
Morph *newmorph( void );
void putsent( Word *sent, FILE *outfile );
*/
/*------------------------------------------------------------
* Change history:
* 0.1d 26-Oct-90 AB Original coding
* 0.1m 22-Jan-90 AB Fix false return on loadambig
* 0.3n 26-Jul-91 AB Put empty element on front of sentence
*                   Change sent bound to store literal pound sign
* 0.4w 20-Nov-91 AB Fix bug of memory overflow from % in morphname
* 0.4z 20-Nov-91 AB Enlarge MAXLINE to 2000 for huge ambigs
* 0.2m 28-Nov-95 BJY Port to 386 compiler
* 0.2n 13-Dec-95 RNE Add ability to read and write \p properties.
*		21-Sep-98 jdh convert references to errlogfile to errlogfile,
*						so this code can work with DLLs
* 0.2t 05-Jul-2000 hab Pass on \u field
* 0.2w 28-Mar-2001 hab Fix bugs which did not manage memory properly for
*                      properties in rules.
*-----------------------------------------------------------*/

#include "lextrans.h"

extern do_ambig_monitor;        /* Monitor output ambiguities */
extern unsigned int num_words;  /* Number of words output */
#ifdef OLD
extern char *sent_punc;         /* Sentence terminating punctuation */
#endif

extern FILE* logfile;
extern FILE* errlogfile;

char line[MAXLINE];             /* Last input line from last call */

static int first_call = TRUE;   /* First call of loadword */
static int eofseen = FALSE;     /* Saw eof last time */
static int cats_in = TRUE;      /* Categories in input */

static Word *loadword( FILE *infile );
static Word *newbound( void );
static int numambigs( char *s );
static char *nextambig( void );
static void loadambigs( Word *wd, char *line );
static Morph *loadmorphs( char *s );
static Morph *newmorph_linked( void );
static char *getmorph( void );
static void addcats( Word *word );

#ifndef hab02w
ListCharPtr* newCharItem();
#else
static ListCharPtr* newCharItem();
#endif /* hab02w */
#define newprop newCharItem

static void GetMorphProperties(char* pszProps, Morph* pMorphs);
static char*  pszMorphFirst( char* psz );
static char*  pszMorphNext( void );

/**************************************************************/
#ifdef CSTUDIODLL
void prepareLexSentGlobals()
{
	first_call = TRUE;   /* First call of loadword */
	eofseen = FALSE;     /* Saw eof last time */
	cats_in = TRUE;      /* Categories in input */
}
#endif


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
Word *loadsent( FILE *infile )
{
Word *sent;         /* Sentence being built */
Word *wd;           /* Current word */
Word *wprev;        /* Previous word */

if ( eofseen )                      /* If eof seen last time */
	return( NULL );                 /* Return eof */

sent = newbound();                  /* Init sent to boundary */

wprev = sent;                       /* Init prev word */

while ( ( wd = loadword( infile ) ) )   /* While next word not eof */
	{
	/*
	*   Link word onto end of sentence.
	*/
	wd->prev = wprev;           /* Link to prev */
	wprev->next = wd;           /* Link prev to here */
	wprev = wd;                 /* Remember this one as prev */

#ifdef OLD
	/*
	*   If sentence end punctuation on word, stop loading sentence.
	*/
	if ( s = wd->punc )             /* If punctuation on this word */
	for ( ; *s; s++ )           /* For each punctuation mark */
		if ( strchr( sent_punc, *s ) )  /* If sent end punc */
#endif
		goto sentbound;     /* Break out of load loop */
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
static Word *loadword( FILE *infile )
{
Word *wd;                   /* Temp word struct to load */
int first_aline;            /* Flag for first \a line in loop */
int n;                      /* Temp counter */
Ambig *amb;                 /* Temp ambig */
char *s;
char* pszTmp;

if ( first_call )                   /* If first call */
	{
	if ( !fgets ( line, MAXLINE, infile ) ) /* Get first line */
	return( NULL );             /* If none, return eof */
	first_call = FALSE;             /* No longer first */
	}

if ( eofseen )                      /* If eof seen last time */
	return( NULL );                 /* Return eof */

wd = newword();                     /* Allocate a word struct */

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

while ( TRUE )                      /* Terminates on next \a or eof */
	{                                 /* Process a line */
	if ( !strncmp( "\\a ", line, 3 ) ) /* If line is \a line */
	{
	if ( first_aline )              /* If first one */
		{                             /* Load the ambigs */
		loadambigs( wd, line );
		first_aline = FALSE;    /* No longer first */
		}
	else                        /* Else (not first) */
		{
		addcats( wd );          /* Add any missing cats */
		return( wd );           /* Return finished word */
		}
	}
	else if ( !strncmp( "\\d ", line, 3 ) ) /* If line is \d line */
	{
	n = numambigs( line + 3 );  /* Set up ambigs */
	n = wd->numamb;             /* More trustable number */
	n = n ? n : 1;              /* At least 1 */
	for ( amb = wd->ambigs; n--; amb = amb->next ) /* For each ambig */
		amb->decomp = nextambig(); /* Load decomp */
	}
	else if ( !strncmp( "\\cat ", line, 5 ) ) /* If line is \cat line */
	{
	n = numambigs( line + 5 );  /* Set up ambigs */
	n = wd->numamb;             /* More trustable number */
	n = n ? n : 1;              /* At least 1 */
	for ( amb = wd->ambigs; n--; amb = amb->next ) /* For each ambig */
		{
		amb->cat = nextambig(); /* Load cat */
					/* Cut off any morph category pairs */
		if ( ( s = strchr( amb->cat, ' ' ) ) ) /* If space in cat */
		*s = '\0';          /* Cut off */
		}
	}
#if 1
	else if ( !strncmp( "\\p ", line, 3 ) ) /* If line is \p  property line */
		{
		n = numambigs( line + 3 );  /* Set up ambigs */
		n = wd->numamb;             /* More trustable number */
		wd->bHasProps = TRUE;
		n = n ? n : 1;              /* At least 1 */
		for ( amb = wd->ambigs; n--; amb = amb->next ) /* For each ambig */
			{
			pszTmp = nextambig(); /* Load morpheme */
			/* Parse the morpheme properties. */
			GetMorphProperties(pszTmp, amb->morphs);
			}
		}
#endif
	else if ( !strncmp( "\\fd ", line, 4 ) ) /* If line is \fd line */
	{
	n = numambigs( line + 4 );  /* Set up ambigs */
	n = wd->numamb;             /* More trustable number */
	n = n ? n : 1;              /* At least 1 */
	for ( amb = wd->ambigs; n--; amb = amb->next ) /* For each ambig */
		amb->feat = nextambig(); /* Load feat */
	}
	else if ( !strncmp( "\\w ", line, 3 ) ) /* If line is \w line */
	{
	wd->name = (unsigned char *)mystrdup( line + 3 );
	*( wd->name + strlen( (char *)wd->name ) - 1 ) = '\0'; /* Cut off nl */
	}
   else if ( !strncmp( "\\f ", line, 3 ) ) /* If line is \f line */
	{
	wd->format = mystrdup( line );
	while ( TRUE )
		{
		if ( !fgets( line, MAXLINE, infile ) )  /* If no next line */
		{
		eofseen = TRUE;                     /* Remember eof seen */
		addcats( wd );          /* Add any missing cats */
		return( wd );                       /* Return last word */
		}
		else if ( *line == '\n' )       /* Else if blank line */
		;                           /* Don't load it */

		else if ( *line != '\\' )       /* Else if continued format */
		wd->format = mystrappend( wd->format, line ); /* append */

		else                            /* Else (backslash mark) */
		break;                      /* Let other code see line */
		}
	continue;                           /* Go to top of loop */
	}
	else if ( !strncmp( "\\c ", line, 3 ) ) /* If line is \c line */
	{
	wd->cap = mystrdup( line );
	}
	else if ( !strncmp( "\\n ", line, 3 ) ) /* If line is \n line */
	{
	wd->punc = mystrdup( line );
	}
#ifndef hab02t
	else if ( !strncmp( "\\u ", line, 3 ) ) /* If line is \u line */
	{
	wd->underForm = mystrdup( line );
	}
#endif /* hab02t */
	else                                /* Else (blank lines) ignore */
	{                               /* Everything except blank */
	}                               /*   lines should be loaded */

	if ( !fgets( line, MAXLINE, infile ) )  /* Get another line */
	{
				/* If here, eof but a good word */
	eofseen = TRUE;                 /* Remember eof seen */
	addcats( wd );                  /* Add any missing cats */
	return( wd );                   /* Return last word */
	}
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
		cats_in = FALSE;        /* Remember input had no cats */
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
t->numamb = 1;
amb = t->ambigs = newambig();
amb->cat = "";
mp = amb->morphs = newmorph();
mp->type = RT;                      /* Type is root */
mp->name = (unsigned char *)"#";
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
t->format = NULL;
t->cap = NULL;
#ifndef hab02t
t->underForm = NULL;
#endif /* hab02t */
t->punc = NULL;
t->numamb = 0;
t->bHasProps = FALSE;
t->ambigs = NULL;
t->prev = NULL;
t->next = NULL;
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
t->cat = NULL;
t->feat = NULL;
t->matched = FALSE;
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
t->numchange = 0;
t->lstProps = NULL;
t->prev = NULL;
t->next = NULL;
return( t );
}


static char *ambigp;

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


static char *rest;          /* Rest of anal string */
static Morph *mprev;        /* Previous morph struct */
static Morph *firstmp;      /* First morph struct */

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
		mp->name = (unsigned char *)getmorph();  /* Store name */
		}
	getmorph();                 /* Move to next morph */

	if ( !strchr( rest, '<' ) ) /* If no more roots coming */
		affix_type = SFX;       /* Set to suffix */
	}
	else
	{
	mp = newmorph_linked();     /* Get a linked morph */
	mp->type = affix_type;      /* Set type */
	mp->name = (unsigned char *)getmorph();      /* Store name */
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
void putsent( Word *sent, FILE *outfile )
{
Word *wd;
Ambig *amb;
Morph *mp;
ListCharPtr* pProp;
	/*
	*  The first and last words are boundary marks, so are not output.
	*/
for ( wd = sent->next; wd->next; wd = wd->next ) /* For each word in sent */
	{
	num_words++;                        /* Count word */
	if ( do_ambig_monitor )             /* If ambig monitor give dot */
	{
	if ( wd->numamb == 0 )          /* If fail */
		{
		if ( wd->ambigs->morphs )   /* If not final empty one */
		fprintf( errlogfile, "*" ); /* Give star */
		}
	else if ( wd->numamb > 9 )      /* If over 9, give 9 */
		fprintf( errlogfile, "9" );
	else if ( wd->numamb != 1 )     /* If ambig */
		fprintf( errlogfile, "%d", wd->numamb ); /* Out number */
	else
		fprintf( errlogfile, "." );     /* Else (one anal) give dot */

	if ( num_words % 10 == 0 )
		fprintf( errlogfile, "  " );
	if ( num_words % 50 == 0 )
		fprintf( errlogfile, "\n" );
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
		fputs( (char *)mp->name, outfile ); /* Output morpheme */

		if ( mp->next )             /* If another coming */
		fputc( ' ', outfile );  /* Output a space */
		}
	if ( wd->numamb != 1 )          /* If fail or ambig */
		fputc( '%', outfile );      /* Out closing percent */
	}

	fputc( '\n', outfile );                 /* Output nl */

	if ( wd->ambigs->decomp )
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

	if ( wd->ambigs->cat && cats_in )           /* If cat from input */
	{
	fputs( "\\cat ", outfile );                 /* Output \cat category */

	if ( wd->numamb != 1 )              /* If fail or ambig */
		fprintf( outfile, "%%%d%%", wd->numamb ); /* Out num with % */
	for ( amb = wd->ambigs; amb; amb = amb->next ) /* For each ambig */
		{
		fputs( amb->cat, outfile );          /* Output ambig */
		if ( wd->numamb != 1 )              /* If fail or ambig */
		fputc( '%', outfile );              /* Output percent */
		}
	fputc( '\n', outfile );                 /* Output nl */
	}


	if ( wd->ambigs->feat )
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

#ifndef hab02t
	if ( wd->underForm )
	  fputs( wd->underForm, outfile );
#endif /* hab02t */
	if (wd->bHasProps)
	  {
		fputs( "\\p ", outfile );           /* RNE 1995-12-13 Output \p properties*/

		if ( wd->numamb != 1 )              /* If fail or ambig */
			fprintf( outfile, "%%%d%%", wd->numamb ); /* Out number */

		for ( amb = wd->ambigs; amb; amb = amb->next )  /* For each ambig */
			{
			for ( mp = amb->morphs; mp; mp = mp->next ) /* For each morph */
				{
				/* For each property */
				for (pProp = mp->lstProps; pProp; pProp = pProp->next)
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

	if ( wd->format )                   /* Output format */
	fputs( wd->format, outfile );

	if ( wd->cap )                      /* Output cap info */
	fputs( wd->cap, outfile );

	if ( wd->punc )                     /* Output punctuation */
	fputs( wd->punc, outfile );


	fputc( '\n', outfile );             /* Output blank line */
	}
}



static char* s_pszPropMorph;

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
		BuildMorphPropertyList(&pmrph->lstProps, pszThisMorph);
		pszThisMorph = pszMorphNext();
		}

}



void BuildMorphPropertyList(ListCharPtr** ppMorphList, char* pszLstProp)
{
	char* pszProp;
	ListCharPtr* pprop,
		*ppropTail;

	if (pszLstProp == NULL)
		return;

	pszProp = strtok(pszLstProp, " ");

#ifndef hab02w
	ppropTail = *ppMorphList; /* get end of existing list (if any) */
	while (ppropTail && ppropTail->next)
	  ppropTail = ppropTail->next;
				/* add any props to the existing list */
	while (pszProp != NULL)
	{
		/* Add the property to the list. */
		pprop = newprop();	/* Use newprop to get a new Mem* prop item. */
		pprop->name = mystrdup( pszProp );      /* Set name to that property. */
		if (!ppropTail)
		  *ppMorphList = pprop;	/* is head of the list */
		else
		  ppropTail->next = pprop;
		ppropTail = pprop;
		pszProp = strtok(NULL, " ");
	}
#else
	if (pszProp != NULL)
		{
		*ppMorphList = newprop();	/* Use newprop to get a new Mem* prop item. */
		ppropTail = *ppMorphList;
		ppropTail->name = mystrdup( pszProp );      /* Set name to that property. */
		pszProp = strtok(NULL, " ");	/* Get next element. */
		}

	while (pszProp != NULL)
	{
		/* Add the property to the list. */
		pprop = newprop();	/* Use newprop to get a new Mem* prop item. */
		pprop->name = mystrdup( pszProp );      /* Set name to that property. */
		ppropTail->next = pprop;
		ppropTail = pprop;
		pszProp = strtok(NULL, " ");
	}
#endif /* hab02w */
}


/**************************************************************
 * NAME
 *      newCharItem
 * ARGS
 *      None
 * DESCR
 *      Make a new character item structure.
 * RETRN
 *      Pointer to new ListCharPtr.
 */
ListCharPtr* newCharItem()
{
ListCharPtr *t;

t = myalloc( sizeof( ListCharPtr ) );
t->name = NULL;
t->next = NULL;
return( t );
}
