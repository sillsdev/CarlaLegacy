/* loadrule.c  Load rules into structure  Alan B  1 Nov 90
*
Rule *loadrules( FILE *infile );
Rule *newrule( void );
Envir *newenv( void );
Match *newmatch( void );
void error_msg( char *msg, char *element );
Mem *newcat( void );
Mem *findcat( char *name );
*/

/* Change History at end of file */

#include "SenTransLib.h"

Word *newitem( char *str, unsigned int type );
static Match *loadmatch( FILE *infile, Match *mat,
			 SenTransData *pSenTransData );
static void linkrepl( Match *fmat, Match *firstrep, SenTransData *pSenTransData );
static void linkcatref( Rule *ru, SenTransData *pSenTransData );
static void dumpmatch( Match *mt, SenTransData *pSenTransData );
static void dispmatch( Match *mt, SenTransData *pSenTransData );
static Class *loadclass( FILE *infile, SenTransData *pSenTransData );
static void loadcats( FILE *infile, SenTransData *pSenTransData );
static void loadprops( FILE *infile, SenTransData *pSenTransData );
#ifndef hab210
static StringList *loadpunc( FILE *infile, SenTransData *pSenTransData );
#else
static char *loadpunc( FILE *infile, SenTransData *pSenTransData );
#endif /* hab210 */
static char *pszGetReplaceText( Match *rep );
#ifndef hab210
static int PuncLengthAtBeginning(SenTransData *pSenTransData_in, char *pszStart_in);
int PuncLengthAtBegSL(StringList *pStrList_in, char *pszStart_in);
#endif /* hab210 */
#ifdef EXTRA_SPACE
static void loadspc( FILE *infile, SenTransData *pSenTransData );
extern char *myspaces;  /* this is defined by AMPLE in ANALDA.C */
#define myisspace(c)    myspaces[(c) & 255]
extern void set_extra_spaces(char *s, char *errhead);
#else
int myisspace( char c );
#endif

#ifdef MacCADA          /* allocate rules using AMPLE's "permanent heap" scheme */
extern void *mypalloc(unsigned int size);
#define myalloc(x)      mypalloc(x)
#define mystrdup(s)     strcpy(mypalloc(strlen(s)+1),s)
#endif

char *rest;                     /* Rest of line */
Pat *lastpat = NULL;            /* Previous pattern */
Class *lastcl = NULL;           /* Last class in list */
Mem *lastcat = NULL;            /* Last category in list */
Mem *lastprop = NULL;		/* Last property in list */
Rule *lastrule = NULL;          /* Previous rule */

char tagchar = '^';	 /* 1.2g RNE tag character, defaults to hat '^' */
char inputcatchar = '%'; /* MD input character, defaults to '%' */

	/*
	* The following establishes a base so that the ellipse count
	*   for an ellipsis can be stored in the category field of
	*   the rule without causing the compiler to complain.
	* The max ellipse count is added to the base and the
	*   result is stored.
	*/
char *ellipse_base = "...";     /* Base for ellipse max; all ellipse items also point here */
static int ellipse_max = 5;     /* Default ellipse max to 5 */
char *sent_bound = "#";         /* All sentence boundary items point here */

static int error_seen = FALSE;         /* Note an error was seen */
static int rule_eofseen = FALSE;  /* Saw eof last time */

#define LEFTENV  1               /* values to set envload to 1.2a BJY */
#define RIGHTENV 2
static int envload = FALSE;       /* Loading environment */

static char endchs[] = " \t\n=>&~";  /* Chars that end an element
										 ][ are permitted in names. */ /* AB 1.2p Removed / and _ for special handling */
								  /* ) also ends, but is treated special */
static char divchs[] = ">&/_";     /* Chars that divide rule into pieces */

static int dispref = FALSE; /* Flag for displaying reference */

/**************************************************************
 * NAME
 *      loadrules
 * ARGS
 *      infile - file to load from
 * DESCR
 *      Load a file of rules into the structures.
 * RETRN
 *      None.
 */
void loadrules( FILE *infile, SenTransData *pSenTransData )
{
Rule *ru = NULL;               /* Temp rule */

int amrule;             /* Flag for ambig rule */
int amunrule;           /* Flag for amun rule */
int rejrule;            /* Flag for reject rule */
int rejunrule;          /* Flag for rejun rule */
int rurule;             /* Flag for ru rule */
int rulesoff;           /* Flag for rules currently turned off */
int ruleset;            /* Flag for ruleset seen */
int default_unanimous;
Envir *envprev;         /* Previous envir */
Envir *env;             /* Temp envir */
Pat *pat;               /* Temp pattern */
char *cp, *cp2;         /* Scratch char ptrs */

default_unanimous = FALSE;
rulesoff = FALSE;
ruleset = FALSE;
pSenTransData->rules = lastrule = NULL;                /* Init first  rule */
pSenTransData->firstpat = lastpat = NULL;              /* Init firstpat */
pSenTransData->firstcl = lastcl = NULL;                /* Init firstcl */
pSenTransData->firstcat = lastcat = NULL;              /* Init firstcat */
pSenTransData->firstprop = lastprop = NULL;			/* Init properties */


if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get first line */
	return;                             /* If none, return eof */

#ifdef MacCADA
/* We'll initialize a bunch of variables, in case they've got values left
over from a previous run */

pSenTransData->sent_punc = ".?!:;";      /* Sentence terminators */
pSenTransData->other_punc = "-,'/\"";    /* Other punctuation */
pSenTransData->begin_punc = "'\"";       /* Begin punctuation */
#endif
ellipse_max = 5;     /* Default ellipse max to 5 */

error_seen = FALSE;         /* Note an error was seen */
rule_eofseen = FALSE;  /* Saw eof last time */
envload = FALSE;       /* Loading environment */

#ifdef EXTRA_SPACE
/* initialize myisspace */
myspaces = myalloc(256);
{
int i;
for (i = 0; i < 256; ++i)
	myspaces[i] = 0;
}
myspaces['\t'] = 1;
myspaces['\n'] = 1;
myspaces['\r'] = 1;
myspaces['\f'] = 1;
myspaces['\v'] = 1;
myspaces[' '] = 1;
#endif

while ( TRUE )                          /* While line (tested below) */
	{
	if ( *pSenTransData->line == '\\' && error_seen )  /* If new rule and last was erroneous */
		{
	  if (ru)
		ru->type |= DISABLE;        /* Disable rule */
	  error_seen = FALSE;             /* Clear error flag */
		}

/* change first whitespace char to space, so strncmp's work with tab after sfm */
	for (cp = pSenTransData->line; ; ++cp)
		if (!*cp || *cp == '\n')
			break;
		else if (myisspace(*cp))
			{
			*cp = ' ';
			break;
			}

	amrule = !strncmp( "\\am ", pSenTransData->line, 4 );        /* Note if \am line */
	amunrule = !strncmp( "\\amun ", pSenTransData->line, 6 );    /* Note if \amun line */
	rejrule = !strncmp( "\\rej ", pSenTransData->line, 5 );      /* Note if \rej line */
	rejunrule = !strncmp( "\\rejun ", pSenTransData->line, 7 );  /* Note if \rejun line */
	rurule =  (!strncmp( "\\ru ", pSenTransData->line, 4 ))      /* Or \ru line */
			|| (!strncmp( "\\sr ", pSenTransData->line, 4 ));	  /* \sr is synonymous with \ru */

												   /* If line is rule */
	if ( amrule || rejrule || rurule || amunrule || rejunrule )
		{
		pSenTransData->rulecount++;                    /* Count all rules */
		ru = newrule();                 /* Get new rule */
		ru->number = pSenTransData->rulecount;
		if ( rulesoff )
			ru->type |= DISABLE;
		if ( !ruleset )                 /* If not in a ruleset */
			ru->type |= ENDSET;         /* Make each rule end its own set */
										/* Link new rule into  general list */
		if ( !pSenTransData->rules )               /* If first rule  */
			pSenTransData->rules = lastrule = ru;  /* Set first and prev rule  */
		else                /* Else (not first) */
							/* Link prev to here, remember this as prev  */
			lastrule = lastrule->next = ru;

		if ( rurule )
			{
			pSenTransData->rucount++;                       /* Count rule */
			rest = skipwhite( pSenTransData->line + 4);     /* Pass over \ru */
			ru->type |= RU;
			}
		else if ( amrule )
			{
			pSenTransData->amcount++;
			rest = skipwhite( pSenTransData->line + 4);    /* Pass over \am */
			ru->type |= AM;                  /* Set am type */
			if ( default_unanimous )
				ru->type |= UNANIM;
			}
		else if ( rejrule )
			{
			pSenTransData->rejcount++;
			rest = skipwhite( pSenTransData->line + 5 );          /* Pass over \rej */
			ru->type |= REJ;                        /* Set reject type */
			if ( default_unanimous )
				ru->type |= UNANIM;
			}
		else if ( amunrule )
			{
			pSenTransData->amuncount++;
			rest = skipwhite( pSenTransData->line + 6 );    /* Pass over \amun */
			ru->type |= AMUN;
			}
		else if ( rejunrule )
			{
			pSenTransData->rejuncount++;
			rest = skipwhite( pSenTransData->line + 7 ); /* Pass \rejun */
			ru->type |= REJUN;
			}

		ru->match = loadmatch( infile, NULL, pSenTransData ); /* Load match */

		if ( !ru->match )               /* If no elements in match */
			error_msg( "Nothing to match", "",
			   pSenTransData ); /* Give message */

		if ( *rest == '>' )                      /* If start of replace */
			{
			if ( *rest == '-' )         /* If hyphen wedge, move past hyphen */
				++rest;
			rest = skipwhite( ++rest ); /* Move past wedge */
			ru->repl = loadmatch( infile, ru->match,
				  pSenTransData ); /* Load replace */
			if ( !ru->repl )            /* If replace is NULL */
				ru->repl = newmatch();  /* Put in an empty one */
			}

		/* Link each replace element without a cat
		*  to a corresponding unreferenced match element.
		*/
		if ( !error_seen )
			linkcatref( ru, pSenTransData );

		envprev = NULL;                 /* Init previous envir */
		while ( *rest == '/' || (*rest == '&' && *(rest+1) == '/') )
										/* If environ */
			{
			env = newenv();             /* Get new environment */
			if ( envprev )              /* Link new env in */
				envprev->next = env;
			else
				ru->env = env;

			if (*rest == '&')
				{
				if (envprev)            /* ignore & if this is first env */
					env->and_env = TRUE;
				++rest;
				}

			envprev = env;              /* Remember this as prev for next */

			rest = skipwhite( ++rest ); /* Move past slash */

			cp = strchr(rest, '_');
			cp2 = strchr(rest, '/');
			if (!cp || (cp2 && (cp > cp2) ) ) /* Check for underline within this env */
				error_msg( "Missing underline in environment", "",
			   pSenTransData );

			envload = LEFTENV;              /* 1.2a BJY */
			env->envlf = loadmatch( infile, NULL,
					pSenTransData ); /* Load left env */
			if ( env->envlf )            /* If left environ */
				while ( env->envlf->next ) /* Move to point to end of it */
					env->envlf = env->envlf->next;
			if ( *rest == '~' )             /* If negated environ */
				{
				env->envneg = TRUE;          /* Note negated */
				rest = skipwhite( ++rest ); /* Move past tilde */
				}
			if ( *rest == '_' )             /* If environ bar */
				{
				rest = skipwhite( ++rest ); /* Move past underline */
				envload = RIGHTENV;         /* 1.2a BJY */
				env->envrt = loadmatch( infile, NULL,
					pSenTransData ); /* Load right env */
				}
			}
		envload = FALSE;                /* Not envir any more */

	if ( *rest == '>' )             /* If extra wedge */
			{
			error_msg( "Extra wedge in rule", "",
			   pSenTransData ); /* Give message */
			}

	if ( *rest && strchr( divchs, *rest ) )      /* If dividing char ">/_" */
			{
										/* Give message */
			error_msg( "Illegal use of >, /, &/ or _ in rule: ",
			   pSenTransData->line, pSenTransData );/* 1.2zf hab */
										/* Advance beyond the bad line */
		if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get next line */
			goto DONE; /* If no more, get out  */
			}

		if ( rule_eofseen )             /* If eof */
			{
			goto DONE;                  /* finished loading */
			}
		}

	else if ( !strncmp( "\\pat ", pSenTransData->line, 5 ) )  /* If \pat line */
		{
		char *en;
		pat = newpat();                 /* Get new pattern */

		rest = skipwhite( pSenTransData->line + 5 );   /* Start after \pat */

										/* Find end of pattern name */
		for ( en = rest; *en && !strchr( endchs, *en ); en++ ) ;
		*en = '\0';                     /* Terminate name */

		pat->name = mystrdup( rest );   /* Set name */
		*en = ' ';                      /* Restore line for err message */

		if ( findcat( pat->name, pSenTransData )
				|| findcl( pat->name, pSenTransData )
				|| findpat( pat->name, pSenTransData ) )
			{
			error_msg( "Pattern name already used:", pat->name,
			   pSenTransData );
			pat->name = "xxx";
			}

		rest = skipwhite( ++en );        /* Move rest to after element */
		pat->match = loadmatch( infile, NULL, pSenTransData ); /* Load match */
		if ( *rest == '>' )             /* If there was replace */
			{
			error_msg( "Replace not allowed in pattern", "", pSenTransData );
			if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get next line */
				goto DONE;              /* If no more, finished */
			}

		if ( !pat->match )               /* If no elements in match */
			error_msg( "Nothing in pattern:", pat->name,
			   pSenTransData ); /* Give message */

		/* do this AFTER loading pattern to prevent recursion */
		if ( !pSenTransData->firstpat )                /* If first pattern */
			pSenTransData->firstpat = lastpat = pat;   /* Set first and prev pat */
		else                            /* Else (not first) */
			{
			lastpat->next = pat;        /* Link prev to here */
			lastpat = pat;              /* Remember this one as prev */
			}

		if ( rule_eofseen )             /* If eof */
			goto DONE;                  /* finished */
		}

	else if ( !strncmp( "\\cl ", pSenTransData->line, 4 ) ) /* If \cl line */
		{
		rest = skipwhite( pSenTransData->line + 4 );   /* Start after \cl */

		loadclass( infile, pSenTransData ); /* Load class from line */

		}
	else if ( !strncmp( "\\ccl ", pSenTransData->line, 5 ) ||/* If \ccl line */
		  !strncmp( "\\mcl ", pSenTransData->line, 5 ) ) /* Or \mcl line */
		{
		rest = skipwhite( pSenTransData->line + 5 );   /* Start after \mcl */

		loadclass( infile, pSenTransData ); /* Load class from line */

		}
	else if ( !strncmp( "\\ca ", pSenTransData->line, 4 ) )  /* If \ca line */
		{
		rest = skipwhite( pSenTransData->line + 4 );   /* Start after \ca */

		loadcats( infile, pSenTransData ); /* Load cat names from line */
		}
	/* RNE 1995-11-20  This is a good place to process the \mp and \ap properties.*/
	else if ((!strncmp( "\\mp ", pSenTransData->line, 4 ) ) ||
		 (!strncmp( "\\ap ", pSenTransData->line, 4 ) )) /* If \mp or \ap line (treat as same) */
	  {
	rest = skipwhite(pSenTransData->line + 4);	/* Start after marker.*/

		/* Load morpheme property from line.*/
	loadprops( infile, pSenTransData );
	  }
	else if ( !strncmp( "\\sentpunc ", pSenTransData->line, 10 ) ) /* If sent punc */
		{
		rest = skipwhite( pSenTransData->line + 10 );  /* Start after marker */
#ifndef hab210
	freeStringList(pSenTransData->sent_punc);
#endif /* hab210 */
		pSenTransData->sent_punc = loadpunc( infile, pSenTransData ); /* Load punc from line */
		}
	else if ( !strncmp( "\\punc ", pSenTransData->line, 6 ) ) /* If other punc */
		{
		rest = skipwhite( pSenTransData->line + 6 );  /* Start after marker */
#ifndef hab210
	freeStringList(pSenTransData->other_punc);
#endif /* hab210 */
		pSenTransData->other_punc = loadpunc( infile, pSenTransData );	/* Load punc from line */
		}
#ifndef hab207
	else if ( !strncmp( "\\bpunc ", pSenTransData->line, 7 ) ) /* If begin punc */
		{
		rest = skipwhite( pSenTransData->line + 7 );  /* Start after marker */
#ifndef hab210
	freeStringList(pSenTransData->begin_punc);
#endif /* hab210 */
		pSenTransData->begin_punc = loadpunc( infile, pSenTransData );	/* Load punc from line */
		}
#else  /* hab207 */
	else if ( !strncmp( "\\bpunc ", pSenTransData->line, 6 ) ) /* If begin punc */
		{
		rest = skipwhite( pSenTransData->line + 6 );  /* Start after marker */

		pSenTransData->begin_punc = loadpunc( infile, pSenTransData );	/* Load punc from line */
		}
#endif /* hab207 */
	else if ( !strncmp( "\\... ", pSenTransData->line, 5 ) ) /* If dot number */
		{
		rest = skipwhite( pSenTransData->line + 5 );  /* Start after marker */

		ellipse_max = atoi( rest );             /* Pick up number */
		if ( !ellipse_max )
			{
			ellipse_max = 5;
		if (pSenTransData->pLogFP)
		  fprintf( pSenTransData->pLogFP, "\nError: %s %s\n%s",
			   "Invalid ellipses maximum setting", "",
			   pSenTransData->line );
			/* error_msg removed due to side effect */
			}
		if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get next line */
			goto DONE;		/* If no more, finished loading */
		}
	else if ( !strncmp( "\\ruleson", pSenTransData->line, 8 ) )
		{
		rulesoff = FALSE;
		pSenTransData->rulesoncount++; /* 1.2f BJY accumulate occurences of \ruleson */
		if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get next line */
			goto DONE;		/* If no more, finished loading */
		}
	else if ( !strncmp( "\\rulesoff", pSenTransData->line, 9 ) )
		{
		rulesoff = TRUE;
		pSenTransData->rulesoffcount++; /* 1.2f BJY accumulate occurences of \rulesoff */
		if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get next line */
			goto DONE;		/* If no more, finished loading */
		}
	else if ( !strncmp( "\\ruleset", pSenTransData->line, 8 ) )
		{
		if ( ru )
			ru->type |= ENDSET;
		ruleset = TRUE;
		if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get next line */
			goto DONE;		/* If no more, finished loading */
		}
	else if ( !strncmp( "\\endruleset", pSenTransData->line, 11 ) )
		{
		if ( ru )
			ru->type |= ENDSET;
		ruleset = FALSE;
		if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get next line */
			goto DONE;		/* If no more, finished loading */
		}
	else if ( !strncmp( "\\unanimous", pSenTransData->line, 10 ) )
		{
		default_unanimous = TRUE;
		if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get next line */
			goto DONE;		/* If no more, finished loading */
		}
	else if ( !strncmp( "\\nonunanimous", pSenTransData->line, 13 ) )
		{
		default_unanimous = FALSE;
		if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get next line */
			goto DONE;		/* If no more, finished loading */
		}
	else if ( !strncmp( "\\tagchar", pSenTransData->line, 8) )	/* \tagchar*/
		{
		rest = skipwhite( pSenTransData->line + 8 );  /* Start after marker */
		if (*rest && *rest != '\n')
			tagchar = *rest;		/* Tag character */

		if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get next line */
			goto DONE;		/* If no more, finished loading */
	}

#ifdef EXTRA_SPACE
	else if ( !strncmp( "\\spc ", pSenTransData->line, 5 ) )   /* extra space codes */
		{
		rest = skipwhite( pSenTransData->line + 5 );  /* Start after marker */
		loadspc(infile, pSenTransData);
		}
#endif
	else
		if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get next line */
			goto DONE; /* If no more, finished */
	}
DONE:
if ( error_seen || rulesoff )   /* If last erroneous or rules off */
	{
	if (ru)
	  ru->type |= DISABLE;        /* Disable rule */
	error_seen = FALSE;         /* Clear error flag */
	}

if ( ru )
	ru->type |= ENDSET;         /* Make last rule end set */

return;
}

/**************************************************************
 * NAME
 *      loadmatch
 * ARGS
 *      infile - file to use for continued lines
 *      rmat - NULL if loading match, else match for replace to link to
 * GLOB
 *      rest - rest of line to process
 * DESCR
 *      Load the match part of a rule into structures.
 * RETRN
 *      Pointer to first match structure, NULL at error.
 */
static Match *loadmatch( FILE *infile, Match *rmat, SenTransData*pSenTransData)
{
Match *firstmt;     /* First match element */
Match *mprev;       /* Previous match element */
Match *mt;          /* Temp match element */
Class *tcl;            /* Temp class */
Mem*  prop;			/* Property */
char *en;           /* End of element */
char remchar;       /* Removed character */
int equalnext;      /* Note equal coming next */
int crnext;         /* Flag for compound root coming next */
char *s;            /* Temp char pointer */
int bracketseen = 0;    /* Class bracket [] flag */
int fInputCatChar = FALSE; /* input category character seen or no */
Pat *pat;           /* Temp pattern */
char *tagstr;       /* for tags on match elements (^xxx) */
#ifndef hab210
int iLen;			/* length of a matching punctuation string */
#endif /* hab210 */

mt = NULL;
firstmt = mprev = NULL;                 /* Init firstmt */
crnext = FALSE;                         /* Init compound root next */

if ( (s = strstr( rest, "->" )) != NULL )         /* If -> type of arrow */
	*s = ' ';                           /* Change to plain wedge */
if ( (s = strstr( rest, "##" )) != NULL )         /* If double ## sent bound */
	*s = ' ';                           /* Change to single # */
rest = skipwhite( rest );               /* Skip over any new whitespace */

while ( TRUE )                          /* While elements found */
	{                                   /* Find an element */
	while ( !*rest || *rest == pSenTransData->comment_char )    /* While at end of line */
		{
		if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get another line */
			{
			*pSenTransData->line = '\0';               /* Clear line */
			rule_eofseen = TRUE;        /* If no more, remember */
			goto done;
			}

		rest = skipwhite( pSenTransData->line );       /* Skip to first element */

		if ( *pSenTransData->line == '\\' )            /* If next line starts rule */
			goto done;
		}

	if ( strchr( divchs, *rest ) )      /* If dividing char ">/_"; also "&/" */
		{
		if (*rest != '&')	/* 1.2zf hab - use & only if also followed */
			goto done;		/*             by '/'  */
		if (*(rest+1) == '/')
			goto done;
		rest++;			/* not dividing char after all... */
		}
										/* If negated env bar next */
	if ( *rest == '~' && *(skipwhite( rest+1 )) == '_' )
		goto done;

	if ( *rest == '0'                  /* If token is zero alone */
			&& ( !*(rest+1) || (myisspace(*(rest+1)) || *(rest+1) == '/') ) ) /* AB 1.2n add test for end of string */
		{
		rest = skipwhite( rest + 1 );   /* Skip over it */
		continue;
		}

	if ( rmat && *rest == '#' && myisspace( *(rest+1) ) ) /* 1.2a BJY ignore # in replace */
		{
		rest = skipwhite(  rest + 1 );   /* Skip over it */
		continue;
		}

	if ( *rest == '=' )                 /* If cat string boundary */
		rest = skipwhite( rest + 1 );   /* Move past equal */
	else
		{
		mt = newmatch();                    /* Make new element */

		if ( !firstmt )                     /* If first one */
			firstmt = mprev = mt;           /* Set first and prev */
		else
			{
			mprev->next = mt;               /* Link prev to here */
			mt->prev = mprev;               /* Link here to prev */
			mprev = mt;                     /* Remember this one as prev */
			}
		bracketseen = FALSE;                /* Clear for this element */
		}

	mt->type |= RT;                 /* Assume root */
	if ( crnext )                   /* If compound root */
		{
		mt->type |= CR;             /* Set compound root flag */
		crnext = FALSE;             /* Clear flag for cr next */
		}

	if ( *rest == '#' && myisspace( *(rest+1) ) )
		mt->type |= BOUND;

#ifndef hab210
	if ( ((iLen = PuncLengthAtBeginning(pSenTransData, rest)) > 0) &&
	 myisspace(*(rest + iLen))) /* is punctuation with whitespace after it */
		{
		mt->type |= PUNC;
		en = rest + iLen;                  /* Note end */
		*en = '\0';                     /* Terminate string */
		mt->string = mystrdup( rest );  /* Set string */
		*en = ' ';                      /* Restore removed char */
		rest = skipwhite( rest + 1 );   /* Move past punc */
		if ( rmat )
			linkrepl( rmat, mt, pSenTransData );
		continue;                       /* Continue with next char */
		}
#else  /* hab210 */
	if ( myisspace( *(rest + 1) )             /* If single char */
			&& (   strchr( pSenTransData->sent_punc, *rest )    /* And punc */
				|| strchr( pSenTransData->other_punc, *rest )
				|| strchr( pSenTransData->begin_punc, *rest ) ) )
		{
		mt->type |= PUNC;
		en = rest + 1;                  /* Note end */
		*en = '\0';                     /* Terminate string */
		mt->string = mystrdup( rest );  /* Set string */
		*en = ' ';                      /* Restore removed char */
		rest = skipwhite( rest + 1 );   /* Move past punc */
		if ( rmat )
			linkrepl( rmat, mt, pSenTransData );
		continue;                       /* Continue with next char */
		}
#endif /* hab210 */

	if ( *rest == '~' )                 /* If NOT */
		{
		if ( *(skipwhite( rest+1 )) == '_' )  /* If environ bar next */
			goto done;
		mt->type |= NOT;                /* Set NOT flag */
		rest = skipwhite( rest + 1 );   /* Move past tilde */
		}

	if ( *rest == '(' )                 /* If optional */
		{
		mt->type |= OPT;                /* Set option flag */
		rest++;     /* start BJY 1.2 */
		s = strchr(rest,')');   /* look for matching closing paren */
		if (!s)
			error_msg( "Unmatched paren", "", pSenTransData );
		while (s >= rest)
			if (myisspace(*s--))    /* check for spaces between parens */
				{
				error_msg( "Whitespace not allowed between parens", "",
			   pSenTransData );
				rest = strchr(rest,')');
				break;
				}    /* end BJY 1.2 */
		}

/* added by JK: allow ~ within (parens) as well as outside */
	if ( *rest == '~' )                 /* If NOT */
		{
		if (mt->type & NOT)
			error_msg( "Double negation not allowed", "", pSenTransData );
		mt->type |= NOT;                /* Set NOT flag */
		rest = skipwhite( rest + 1 );   /* Move past tilde */
		}
/* end JK added code */

	/* 1.2e BJY The following two if statements were flipped to allow -[mcl] to work */
	if ( *rest == '-' && !myisspace( *(rest+1) ) ) /* If suffix */ /* 1.2a BJY added !isspace() */
		{
		mt->type |= SFX;                /* Set suffix */
		mt->type ^= RT;                 /* Clear root */
		rest = skipwhite( rest + 1 );   /* Move past hyphen */
		}

	if ( *rest == inputcatchar )        /* If input category */
		{
		fInputCatChar = TRUE;           /* Remember input category */
		rest = skipwhite( rest + 1 );   /* Move past bracket */
		}

	if ( (*rest == '[' )                 /* If class bracket */
		|| (*rest ==  '{') )
		{
		bracketseen = TRUE;             /* Remember class bracket */
		rest = skipwhite( rest + 1 );   /* Move past bracket */
		}

	if (!envload && mt->type & (SFX | CR) && mt->prev && IS_ELLIPSIS(mt->prev) )
		error_msg( "Suffix after ... allowed only in environment", "",
		   pSenTransData );

	for ( en = rest; *en; en++ )        /* Find end of morphname */
		{
		if ( strchr( endchs, *en ) )    /* Break at ending char */
		{			/* 1.2zf hab check for &/ */
		if (*en != '&')
			break;
		if (*(en + 1) == '/')
			break;
		}
	if ( strchr( divchs, *en ) && strchr( endchs, *(en+1) ) ) /* AB 1.2p Break at / or _ followed by space */
			break;
		if ( *en == ')' && (mt->type & OPT) )  /* AB 1.2p Break at parend only if optional set by opening parend, not if open was embedded in morphname */
			break;
#ifdef JUNK /* AB 1.2p Allow parends in names if not preceded by space */
		if ( *en == ')' && !(mt->type & OPT) )  /* start BJY 1.2 */
			{                           /* don't allow ) by itself */
			error_msg( "Unmatched paren", "", pSenTransData );
			break;
			}
		if ( *en == '(' )               /* don't allow ( in name */
			{
			error_msg( "Parens not allowed in morphname", "", pSenTransData );
			break;                              /* end BJY 1.2 */
			}
#endif /* JUNK */
		if ( *en == '-'                 /* Break at hyphen at end of line */
				&& ( !*(en+1)           /* Or before space or parend */
				  || ( myisspace( *(en+1) ) && en > rest )  /* 1.2a BJY handle - by itself */
				  || *(en+1) == /*(*/ ')'
				  || *(en+1) == '-' ) )  /* Or at double hyphen, croot */
			break;
		if ( *en == '+'                 /* Break at plus at end of line */
				&& ( !*(en+1)           /* Or before space or parend */
				  || myisspace( *(en+1) )
				  || *(en+1) == /*(*/ ')' ) )
			break;
		}

	remchar = *en;                      /* Remember char to be removed */
	*en = '\0';                         /* Terminate string */

	if ( *(en - 1) == ')'               /* If parend at end */
				&& !strchr( rest, '(' ) )   /* And no open parend in name */
		{
		*en = remchar;                  /* Restore removed char */
		en--;                           /* Back up one */
		remchar = *en;                  /* Remember char */
		*en = '\0';                     /* Terminate one earlier */
		}

	if ( ( (*(en - 1) == ']') || (*(en - 1) == '}') )	/* If close bracket at end */
			&& bracketseen ) /* 1.2w AB Don't treat as close unless open was present */
		{
		*en = remchar;                  /* Restore removed char */
		en--;                           /* Back up one */
		remchar = *en;                  /* Remember char */
		*en = '\0';                     /* Terminate one earlier */
		}

	mt->string = mystrdup( rest );      /* Set string */
	*en = remchar;                      /* Restore removed char */

	if ( ( (*en == ']') || (*en == '}') ) /* Bypass the right bracket if needed */
			&& bracketseen ) /* 1.2w AB Don't treat [ as close unless open was present */
		en++;

	equalnext = (remchar == '=') ? TRUE : FALSE; /* Note if equal next */

	if ( streq( mt->string, sent_bound ) ) /* If sentence boundary */
		mt->string = sent_bound;        /* explicitly point at the fixed "#" */

	if ( (tagstr = strchr( mt->string, tagchar )) != NULL )
		{
		if (envload)
			error_msg( "Element tag is meaningless in environment: ",
			   mt->string, pSenTransData );
		*tagstr++ = 0;
		if (*tagstr)
			mt->tag = tagstr;
		}

	if ( streq( mt->string, ellipse_base ) )
		{
		mt->string = ellipse_base;              /* make all ellipsis items point to
														ellipse_base string */
		mt->cat = ellipse_base + ellipse_max;   /* store max in cat */
		if (!envload && mt->prev && mt->prev->type & PFX)
			error_msg( "Prefix before ... allowed only in environment", "",
			   pSenTransData );
		}

	if ( (tcl = findcl( mt->string, pSenTransData )) != NULL )   /* If class */
		{
		if ( tcl->mem && findcat( tcl->mem->name,
				  pSenTransData ) ) /* If class has cats */ /* tcl->mem can be NULL 1.2a BJY */
			{
			mt->type |= CAT;            /* Set cat flag */
			mt->type |= CCL;            /* Set cat class */
			mt->cat = (char *)tcl;      /* Point cat to class */
			mt->string = NULL;          /* Clear morph name */
			}
		else
			{
			mt->type |= MCL;            /* Else set morpheme class */
			mt->string = (char *)tcl;   /* Point to class */
			}
		}
	else if ( (pat = findpat( mt->string, pSenTransData )) != NULL )
		{
		mt->type |= PAT;
		mt->string = (char *)pat;
		}
	else if ((prop = findprop( mt->string, pSenTransData)) != NULL)
		{
		mt->type |= PROP;
		mt->string = prop->name;
		}
	else                                /* Else, not class or pattern */
		{   if ( bracketseen )          /* should have been a class. */
		   error_msg( "Class indicated in rule but not found: ", mt->string,
			  pSenTransData);
		}

	rest = en;

	if ( *rest == '-' )                 /* If immediate hyphen, */
		{                               /*   prefix or compound root */
		if ( *(rest + 1) == '-' )       /* If double hyphen, croot */
			{
			crnext = TRUE;              /* Note compound root next */
			rest = skipwhite( rest + 2 ); /* Move past double hyphen */
			}
		else                            /* Else (prefix) */
			{
			mt->type |= PFX;                /* Set prefix */
			mt->type ^= RT;                 /* Clear root */
			rest = skipwhite( rest + 1 );   /* Move past hyphen */
			}
		}

	if ( (mt->type & PAT) && (mt->type & AFX) )
		error_msg( "Pattern cannot be used as affix: ",
		   ((Pat*)(mt->string))->name, pSenTransData);

	if (    !(mt->type & (PFX | SFX))       /* if not a prefix or suffix, and */
			&& (   findcat( mt->string,
				pSenTransData ) /* If found in cat list */
				 )                 /* 1.2g AB removed Or equal sign is next */
	   ) {
		mt->type |= CAT;                /* Set cat flag */
		mt->cat = mt->string;           /* Set cat string */
		mt->string = NULL;              /* Clear morph name */
		if (fInputCatChar) {
		  mt->type |= MORPHCAT;           /* if referring to the input category rather than the word category */
		  if ( pSenTransData->do_debug ) {
			fprintf(pSenTransData->pLogFP, "put in a rule with input cc %s\n", mt->cat);
		  }
		}
	}
	else if (fInputCatChar) {
		 error_msg( "Input category marker found without subsequent valid category", "",
			   pSenTransData );
	}
	fInputCatChar = FALSE;

	if ( ( *rest == ']' )   /* If close bracket */
			&& bracketseen ) /* 1.2w AB Don't treat as close unless open was present */
		rest = skipwhite( rest + 1 );   /* Move past */

	if ( *rest == ')' )   /* If paren */
		rest = skipwhite( rest + 1 );   /* Move past */

	if ( *rest == '+' )                 /* If plus */
		{
		if ( mt->type & ( PFX | SFX | CR ) )
			error_msg( "Repeat not allowed on affix or compound root", "",
			   pSenTransData );
		mt->type |= PLUS;               /* Set plus */
		rest = skipwhite( rest + 1 );   /* Move past plus sign */
		}

	if ( *rest == ')' )                 /* If close parend */
		rest = skipwhite( rest + 1 );   /* Move past */

		/* The following is after parend check so that if close parend
		*   is punc and is preceded by white space, it can be recognized
		*   as punc.
		*/
	rest = skipwhite( rest );           /* Move past any white space */

	if ( rmat && mt->type & AFX && mt->type & NOT )
		error_msg( "Negation on affix not allowed in replace", "",
		   pSenTransData );

	if ( rmat                           /* If this is replace */
			&& !equalnext )             /* And not equal coming next */
		linkrepl( rmat, mt, pSenTransData ); /* Link it to match or new */
	}
done:
if ( firstmt && !rmat )
	{
	if ( IS_ELLIPSIS( firstmt )         /* convert "... x" to "# ... x" 1.2a BJY */
		 && envload != RIGHTENV )
		{
		mt = newmatch();                /* put a '#' node at head of match list */
		mt->type = RT;
		mt->string = sent_bound;        /* explicitly point at the fixed "#" */
		mt->next = firstmt;
		mt->next->prev = mt;            /* link at list head */
		firstmt = mt;
		}
	for ( mprev = firstmt; mprev->next; mprev = mprev->next )
		;                               /* find end of match list */
	if ( IS_ELLIPSIS( mt )              /* ellipsis node last thing in list? */
		 && envload != LEFTENV )        /* convert "x ..." to "x ... #" */
		{
		mt = newmatch();                /* put a '#' node at end of match list */
		mt->type = RT;
		mt->string = sent_bound;        /* explicitly point at the fixed "#" */
		mt->prev = mprev;
		mt->prev->next = mt;            /* link at end of list */
		}
	}
return( firstmt );                      /* return match list head */
}

/**************************************************************
 * NAME
 *      loadclass
 * ARGS
 *      infile - file to use for continued lines
 * GLOB
 *      rest - rest of line to process
 * DESCR
 *      Load the class into structures.
 * RETRN
 *      Pointer to first match structure, NULL at error.
 */
static Class *loadclass( FILE *infile, SenTransData *pSenTransData )
{
Class *tcl;         /* Temp class */
Class *included;    /* Temp for included class */
char *en;           /* End of element */
char remchar;       /* Removed character */
Mem *tmem;          /* Temp class member */
Mem *lastmem;       /* Last class member */
Mem *includedmem;   /* Included class member */
int bracketseen;    /* Name had [] */

tcl = newcl();                          /* Get new class */
lastmem = NULL;                         /* Init last member */

										/* Find end of class name */
for ( en = rest; *en && !strchr( endchs, *en ); en++ );
remchar = *en;                          /* Remember removed char */
*en = '\0';                             /* Terminate name */
tcl->name = mystrdup( rest );           /* Set name */
*en = remchar;                          /* Restore line for err message */

if ( findcat( tcl->name, pSenTransData )
		|| findpat( tcl->name, pSenTransData )
		|| findcl( tcl->name, pSenTransData ) )
	{
	if (pSenTransData->pLogFP)
	  fprintf( pSenTransData->pLogFP, "\nClass name already used: %s\n%s",
		   tcl->name, pSenTransData->line );
	tcl->name = "xxx";                  /* Give fake name */
	}

if ( !pSenTransData->firstcl )                         /* If first class */
	pSenTransData->firstcl = lastcl = tcl;             /* Set first and prev cl */
else                                    /* Else (not first) */
	{
	lastcl->next = tcl;                 /* Link prev to here */
	lastcl = tcl;                       /* Remember this one as prev */
	}

rest = skipwhite( en );                 /* Move rest to after element */

while ( TRUE )                          /* While elements found */
	{                                   /* Find an element */
	while ( !*rest || *rest == pSenTransData->comment_char )    /* While at end of line */
		{
		if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get another line */
			{
			rule_eofseen = TRUE;        /* If no more, remember */
			return( pSenTransData->firstcl );          /* Return class */
			}

		rest = skipwhite( pSenTransData->line );       /* Skip to first element */

		if ( *pSenTransData->line == '\\' )            /* If next line starts rule */
			return( pSenTransData->firstcl );          /* Return class */
		}

	tmem = newcat();                    /* Make new class member */
	if ( !tcl->mem )                    /* If first one */
		tcl->mem = lastmem = tmem;      /* Set first and prev */
	else
		{
		lastmem->next = tmem;           /* Link prev to here */
		lastmem = tmem;                 /* Remember this one as prev */
		}

										/* Strip off any [ */
	if ( (*rest == '[' ) ||	(*rest == '{' ) )
			{
			bracketseen = TRUE;
			rest = skipwhite( rest + 1);    /* Skip the [ and whitespace. */
			}
	else
		bracketseen = FALSE;

	for ( en = rest; *en && !myisspace(*en); en++ ) ; /* Find end */
	remchar = *en;                      /* Remember removed char */
	*en = '\0';                         /* Terminate string */

	if ( ( (*(en - 1) == ']') || (*(en - 1) == '}') )	/* RNE 1995-11-30 '}' is equiv*/
			&& bracketseen ) /* 1.2w AB Don't treat as close unless open was present */
		*(en - 1) = '\0';  /* Wipe out final ] in name */

	tmem->name = mystrdup( rest );      /* Set name */

	if ( *(en - 1) == '\0' )
		*(en - 1) = ']';
	*en = remchar;                      /* Restore line for error messages */

	included = findcl( tmem->name, pSenTransData );
					/* Test for class brackets with no corresponding class */
	if ( bracketseen && !included && pSenTransData->pLogFP)
		fprintf( pSenTransData->pLogFP, "\nError: %s %s\n%s",
		 "Class indicated but not found: ", tmem->name,
		 pSenTransData->line );
	if ( included  && included->mem )
										/* It is a nonempty class */
			{       /* Use the existing member slot for the first member */
			tmem->name = mystrdup( included->mem->name );
					/* Go through the included class adding members to new */
	for (includedmem = included->mem->next; includedmem;
					   includedmem = includedmem->next)
		{
		tmem = newcat();
		tmem->name = mystrdup( includedmem->name );
		lastmem->next = tmem;           /* Link prev to here */
		lastmem = tmem;                 /* Remember this one as prev */
		}
			 }    /* end included class copying */
		 else if ( included ) /* there was an included class, empty. */
				 {tmem->name = mystrdup( "Emptydummy" );
				  lastmem->next = tmem;      /* Link prev to here */
				  lastmem = tmem;            /* Remember this one as prev */
				 }

	rest = skipwhite( en );             /* Move rest to after element */
	}
}

/*************************************************************
 * NAME
 *      mat_eq
 * ARGS
 *      m - a match element
 *      n - another match element to compare it with
 * DESCR
 *      Compare two match elements to see if they look like one
 *      should be a reference to the other.
 *      If the elements are references, we compare the referenced
 *      elements rather than the pointers to them.
 * RETRN
 *      FALSE if match elements don't correspond, TRUE if they do
 */
static int mat_eq(Match *m, Match *n)
{
	if (m->type & REF)          /* dereference args if they are references */
		m = (Match*)(m->cat);
	if (n->type & REF)
		n = (Match*)(n->cat);

	if (m->type != n->type)
		return FALSE;

	if ( !(    ( ( m->type & CCL ) && ( m->cat == n->cat ) )
			|| ( ( m->type & MCL ) && ( m->string == n->string ) )
			|| ( ( m->type & PAT ) && ( m->string == n->string ) )
			|| (   !( m->type & ( MCL | CCL | PAT ) )
				 && (    ( !m->string && !n->string )
					  || ( m->string && n->string && streq( m->string, n->string ) )
					)
				 && (    ( !m->cat && !n->cat )
					  || ( m->cat && n->cat && streq( m->cat, n->cat ) )
					)
			   )

		  )
	   )
		return FALSE;

	if ( !(    ( !m->tag && !n->tag )
			|| ( m->tag && n->tag && streq( m->tag, n->tag ) )
		  )
	   )
		return FALSE;

	return TRUE;
}

/**************************************************************
 * NAME
 *      linkrepl
 * ARGS
 *      fmat - first element of match for this replace
 *      rep - element of replace to link
 * DESCR
 *      Link a replacement element of a rule to a corresponding
 *          match element, or to a new word structure.
 * RETRN
 *      None
 */
static void linkrepl( Match *fmat, Match *rep, SenTransData *pSenTransData )
{
Match *mat;         /* Temp match element */
Word *wd;           /* Temp word */
Ambig *amb;         /* Temp ambig */
Morph *mp = NULL;          /* Temp morph */
Match *last = NULL;            /* pointer to last matching elem */
int auto_tag = 1;       /* implicit tag # for this replace */
int mat_count = 0;      /* counter for matching elements */
t_Wflag type;

for ( mat = rep->prev; mat; mat = mat->prev )
	if (mat_eq(rep, mat))
		++auto_tag;     /* auto_tag is count of similar elements in rep */
for ( mat = fmat; mat; mat = mat->next ) /* For each match */
	{
	if ( mat_eq(rep, mat))                   /* See if replace is identical */
		{
		++mat_count;                        /* count occurrences */
		if (mat_count == auto_tag)
			{
			rep->cat = (char *)mat;         /* Set reference */
			rep->type |= REF;               /* Note reference */
			return;                         /* No need to look further */
			}
		else
			last = mat; /* remember last match in case no more found */
		}
	}

	if ( mat_count > 0 )
		{       /* we found a matching element, but not enough of them */
		if ( rep->type & AFX )
			{           /* for an affix, we duplicate the last one */
			rep->cat = (char *)last;
			rep->type |= REF;
			return;
			}
		else
			{
#ifdef Before_1_2_za
			char        *s;
			if ( rep->type & MCL )
				s = ((Class*)(rep->string))->name;
			else if ( rep->type & CCL )
				s = ((Class*)(rep->cat))->name;
			else if ( (rep->type & CAT) && rep->cat )
				s = rep->cat;
			else if (rep->type & PAT)
				s = ((Pat*)(rep->string))->name;
			else
				s = rep->string;
			error_msg( "Cannot duplicate a root or pattern: ", s,
			   pSenTransData );
#else
		error_msg( "Cannot duplicate a root or pattern: ",
			   pszGetReplaceText(rep), pSenTransData);	/* 1.2zb hab */
#endif /* Before_1_2_za */
			return;
			}
		}
	else			/* replacement not found in match  1.2zb hab */
	  {
	if (rep->type & OPT)	/* cannot be optional then */
	  {
		error_msg(
			  "Optional replacement does not have a corresponding match:",
		  pszGetReplaceText(rep), pSenTransData);
		return;
	  }
	  }

if ( !(rep->type & REF ) )              /* If not reference */
	{
	/***/ /* Here test for OPT, NOT, PLUS, CL, CAT */
	if ( rep->type & ( MCL | CCL | PAT ) )
		{
		error_msg( "Inserted element cannot be class or pattern", "",
		   pSenTransData );
		return;
		}
/* TAG_MATCHES */
	if ( rep->tag != NULL )
		{
		error_msg( "Inserted element cannot be tagged", "", pSenTransData );
		return;
		}
/* end TAG_MATCHES */
										/* Build word struct */
	if ( !rep->string )                 /* If no string to replace */
		{
		error_msg( "Inserted word cannot be category or class", "",
		   pSenTransData );
		return;
		}
	type = WORD;
	if ( rep->type & PUNC )             /* allow insertion of punctuation 1.2a BJY */
#ifndef hab210
		if ( PuncLengthAtBegSL(pSenTransData->begin_punc, rep->string) )
#else  /* hab210 */
		if ( strchr( pSenTransData->begin_punc, rep->string[0] ) )
#endif /* habd210 */
			type = WDPUNC | FROMF;      /* decide which field it should go in: \f or \n */
		else
			type = WDPUNC | FROMN;

	wd = newitem( rep->string, type );  /* allocate new word structure */

	if ( !( rep->type & PUNC ) )        /* don't have to do this stuff for simple punc node */
		{
		amb = wd->ambigs;
		mp = amb->morphs;

		amb->cat = rep->cat;            /* If cat given, use it */

		wd->name = rep->string;         /* Set word name */
		amb->decomp = rep->string;      /* Set decomposition */
		amb->uform = rep->string;       /* Set underlying form */

		mp->type = rep->type & MORPHTYPE;   /* Set type */
		mp->cat = amb->cat;                 /* Same cat as ambig */
		}
	rep->begwd = wd;                    /* Point to new word */
	rep->endwd = wd;
	if ( mp != 0 &&                     /* 1.2zd hab */
	 mp->type & AFX )               /* If affix */
		rep->matmp = mp;                /* Point to morpheme */
	}
}

/**************************************************************
 * NAME
 *      linkcatref
 * ARGS
 *      ru - rule to do linking on
 * DESCR
 *      Link each replace element that doesn't have a cat
 *          to a corresponding unreferenced match element.
 * RETRN
 *      None
 */
static void linkcatref( Rule *ru, SenTransData *pSenTransData )
{
Match *mat = ru->match; /* 1.2a BJY */
Match *repl = ru->repl;
Match *rep;         /* Replace element */
Match *trep;        /* Temp replace element */
int ref;            /* Temp flag for ref */

for ( rep = repl; rep; rep = rep->next )
	if ( rep->type & (RT | CR) && !rep->cat ) /* If root with no cat */
		{
		for ( ; mat; mat = mat->next )      /* For each remaining match */
			if ( mat->type == rep->type )   /* If same type */
				{                           /* See if any replace references it */
				for ( ref = FALSE, trep = repl; trep; trep = trep->next )
					if ( trep->type & REF && (Match *)trep->cat == mat )
						{
						ref = TRUE;
						break;
						}
				if ( !ref )                 /* If match not referenced */
					{                       /* Make a catref to it */
					rep->type |= CATREF;
					rep->cat = (char *)mat;
					mat = mat->next;        /* Move mat so next can't see it */
					break;
					}
				}
		if ( !rep->cat && !( rep->type & PUNC ) ) /* If no success, give error */
			{
		if (pSenTransData->pLogFP)
		  fprintf( pSenTransData->pLogFP,
			   "\nError: Inserted root must have category: %s\n",
			   rep->string );
			disprule( ru, pSenTransData ); /* fix bug of wrong rule being displayed 1.2a BJY */
			error_seen = TRUE;
			}
		}
}

/**************************************************************
 * NAME
 *      loadcats
 * ARGS
 *      infile - file to use for continued lines
 * GLOB
 *      rest - rest of line to process
 * DESCR
 *      Load cats into structures.
 * RETRN
 *      Pointer to first cat structure, NULL at error.
 */
static void loadcats( FILE *infile, SenTransData *pSenTransData )
{
Mem *cat;          /* Temp match element */
char *en;           /* End of element */

while ( TRUE )                          /* While elements found */
	{                                   /* Find an element */
	while ( !*rest || *rest == pSenTransData->comment_char )    /* While at end of line */
		{
		if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get another line */
			{
			rule_eofseen = TRUE;        /* If no more, remember */
			return;                     /* Return */
			}

		rest = skipwhite( pSenTransData->line );       /* Skip to first element */

		if ( *pSenTransData->line == '\\' )            /* If next line starts rule */
			return;                     /* Return cat */
		}

	cat = newcat();                     /* Make new element */
	if ( !pSenTransData->firstcat )                    /* If first one */
		pSenTransData->firstcat = lastcat = cat;       /* Set first and prev */
	else
		{
		lastcat->next = cat;            /* Link prev to here */
		lastcat = cat;                  /* Remember this one as prev */
		}

	for ( en = rest; *en && !myisspace(*en); en++ ) ; /* Find end */

	*en = '\0';                         /* Terminate string */

	cat->name = mystrdup( rest );       /* Set name */

	if ( findpat( cat->name, pSenTransData ) ||
	 findcl( cat->name, pSenTransData ) )
	  {
	  if (pSenTransData->pLogFP)
	fprintf( pSenTransData->pLogFP,
		 "\nCategory already used as pattern or class name: %s\n%s",
		 cat->name, pSenTransData->line );
	  }
	rest = skipwhite( ++en );           /* Move rest to after element */
	}
}

/**************************************************************
 * NAME
 *      loadprops
 * ARGS
 *      infile - file to use for continued lines
 * GLOB
 *      rest - rest of line to process
 * DESCR
 *      Load props into structures.
 * RETRN
 *      Pointer to first prop structure, NULL at error.
 */
static void loadprops( FILE *infile, SenTransData *pSenTransData )
{
Mem *prop;          /* Temp match element */
char *en;           /* End of element */

while ( TRUE )                          /* While elements found */
	{                                   /* Find an element */
	while ( !*rest || *rest == pSenTransData->comment_char )    /* While at end of line */
		{
		if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get another line */
			{
			rule_eofseen = TRUE;        /* If no more, remember */
			return;                     /* Return */
			}

		rest = skipwhite( pSenTransData->line );       /* Skip to first element */

		if ( *pSenTransData->line == '\\' )            /* If next line starts rule */
			return;                     /* Return cat */
		}

	prop = newprop();                     /* Make new element */
	if ( !pSenTransData->firstprop )                    /* If first one */
		pSenTransData->firstprop = lastprop = prop;       /* Set first and prev */
	else
		{
		lastprop->next = prop;            /* Link prev to here */
		lastprop = prop;                  /* Remember this one as prev */
		}

	for ( en = rest; *en && !myisspace(*en); en++ ) ; /* Find end */

	*en = '\0';                         /* Terminate string */

	prop->name = mystrdup( rest );       /* Set name */

	if ( findpat( prop->name, pSenTransData ) ||
	 findcl( prop->name, pSenTransData ) )
	  {
	  if (pSenTransData->pLogFP)
	fprintf( pSenTransData->pLogFP,
		"\nProperty already used as pattern, category, or class name: %s\n%s",
		 prop->name, pSenTransData->line );
	  }
	rest = skipwhite( ++en );           /* Move rest to after element */
	}
}

#ifdef EXTRA_SPACE
/**************************************************************
 * NAME
 *      loadspc
 * ARGS
 *      infile - file to use to get next line
 * GLOB
 *      rest - rest of line to process
 * DESCR
 *      Load space codes from a \spc line.
 * RETRN
 *      none.
 */
static void loadspc( FILE *infile, SenTransData *pSenTransData )
{
set_extra_spaces(rest, "\n");   /* borrowing AMPLE's routine */

if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get another line */
	rule_eofseen = TRUE;            /* If no more, remember */
}
#endif

#ifndef hab210
/**************************************************************
 * NAME
 *      loadpunc
 * ARGS
 *      infile - file to use to get next line
 *      pSenTransData - SenTrans Data
 * GLOB
 *      rest - rest of line to process
 * DESCR
 *      Load punctuation marks from a punc or sentpunc line.
 * RETRN
 *      Pointer to newly created string list.
 */
static StringList *loadpunc( FILE *infile, SenTransData *pSenTransData)
{
StringList *pStrList = NULL;
char *pszBeg;
char *cp;

for (pszBeg = cp = rest; *cp; cp++)
  {
	if (myisspace(*cp))
	  {
	*cp = '\0';
	if (*pszBeg != '\0' && *pszBeg != '\\')
	  pStrList = addToStringList(pStrList, pszBeg);
	pszBeg = skipwhite(cp + 1);
	  }
  }
 if (*pszBeg != '\0' && *pszBeg != '\\')
   pStrList = addToStringList(pStrList, pszBeg);

if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get another line */
	rule_eofseen = TRUE;            /* If no more, remember */

return(pStrList);
}
#else  /* hab210 */
/**************************************************************
 * NAME
 *      loadpunc
 * ARGS
 *      infile - file to use to get next line
 * GLOB
 *      rest - rest of line to process
 * DESCR
 *      Load punctuation marks from a punc or sentpunc line.
 * RETRN
 *      Pointer to string with punc marks.
 */
static char *loadpunc( FILE *infile, SenTransData *pSenTransData)
{
char *s;

for ( s = rest; *s; s++ )           /* Squeeze out spaces and illegals */
	{
	while ( myisspace( *s ) || *s == '\\' )   /* If char is space or bksl */
		strcpy( s, s + 1 );         /* Copy rest down */
	if ( *s == pSenTransData->comment_char )                /* If comment */
		{
		*s = '\0';                  /* Terminate string */
		break;                      /* Terminate search for spaces */
		}
	}

s = mystrdup( rest );               /* Dup resulting string */

if ( !fgets ( pSenTransData->line, MAXLINE, infile ) ) /* Get another line */
	rule_eofseen = TRUE;            /* If no more, remember */

return( s );                        /* Return punc marks */
}
#endif /* hab210 */

/**************************************************************
 * NAME
 *      newrule
 * ARGS
 *      None
 * DESCR
 *      Make a new rule structure.
 * RETRN
 *      Pointer to new rule structure.
 */
Rule *newrule( void )
{
Rule *t;

t = myalloc( sizeof( Rule ) );
t->match = NULL;
t->repl = NULL;
t->env = NULL;
t->type = 0;
t->next = NULL;
return( t );
}

/**************************************************************
 * NAME
 *      newenv
 * ARGS
 *      None
 * DESCR
 *      Make a new envir structure.
 * RETRN
 *      Pointer to new structure.
 */
Envir *newenv( void )
{
Envir *t;

t = myalloc( sizeof( Envir ) );
t->envlf = NULL;
t->envrt = NULL;
t->and_env = FALSE;     /* AND_ENV */
t->envneg = FALSE;
t->next = NULL;
return( t );
}

/**************************************************************
 * NAME
 *      newpat
 * ARGS
 *      None
 * DESCR
 *      Make a new pattern structure.
 * RETRN
 *      Pointer to new pattern structure.
 */
Pat *newpat( void )
{
Pat *t;

t = myalloc( sizeof( Pat ) );
t->name = NULL;
t->match = NULL;
t->next = NULL;
return( t );
}

/**************************************************************
 * NAME
 *      findpat
 * ARGS
 *      None
 * DESCR
 *      Find a pattern structure, based on its name.
 * RETRN
 *      Pointer to pattern structure, NULL if not found.
 */
Pat *findpat( char *name, SenTransData *pSenTransData )
{
Pat *tpat;

for ( tpat = pSenTransData->firstpat; tpat; tpat = tpat->next ) /* For each pattern */
	if ( streq( name, tpat->name ) )    /* If name matches */
		return( tpat );                 /* Return pattern */

return( NULL );                         /* If not found, return NULL */
}

/**************************************************************
 * NAME
 *      newcl
 * ARGS
 *      None
 * DESCR
 *      Make a new class structure.
 * RETRN
 *      Pointer to new class structure.
 */
Class *newcl( void )
{
Class *t;

t = myalloc( sizeof( Class ) );
t->name = NULL;
t->mem = NULL;
t->next = NULL;
return( t );
}

/**************************************************************
 * NAME
 *      findcl
 * ARGS
 *      None
 * DESCR
 *      Find a class structure, based on its name.
 * RETRN
 *      Pointer to class structure, NULL if not found.
 */
Class *findcl( char *name, SenTransData *pSenTransData )
{
Class *tcl;

for ( tcl = pSenTransData->firstcl; tcl; tcl = tcl->next ) /* For each class */
	if ( streq( name, tcl->name ) )     /* If name matches */
		return( tcl );                  /* Return class */

return( NULL );                         /* If not found, return NULL */
}

/**************************************************************
 * NAME
 *      newcat
 * ARGS
 *      None
 * DESCR
 *      Make a new cat structure.
 * RETRN
 *      Pointer to new cat structure.
 */
Mem *newcat( void )
{
Mem *t;

t = myalloc( sizeof( Mem ) );
t->name = NULL;
t->next = NULL;
return( t );
}

/**************************************************************
 * NAME
 *      newprop
 * ARGS
 *      None
 * DESCR
 *      Make a new prop (property) structure.
 * RETRN
 *      Pointer to prop cat structure.
 *
 * Note, properties and categories are very similar.
 */
Mem *newprop( void )
{
	return newcat();
}

/**************************************************************
 * NAME
 *      findprop
 * ARGS
 *      None
 * DESCR
 *      Find a prop (property) structure, based on its name.
 * RETRN
 *      Pointer to prop structure, NULL if not found.
 */
Mem *findprop( char *name, SenTransData *pSenTransData )
{
Mem *prop;

for ( prop = pSenTransData->firstprop; prop; prop = prop->next ) /* For each cat */
	if ( streq( name, prop->name ) )     /* If name matches */
		return( prop );                  /* Return cat */

return( NULL );                         /* If not found, return NULL */
}

/**************************************************************
 * NAME
 *      findcat
 * ARGS
 *      None
 * DESCR
 *      Find a cat structure, based on its name.
 * RETRN
 *      Pointer to cat structure, NULL if not found.
 */
Mem *findcat( char *name, SenTransData *pSenTransData )
{
Mem *tcat;

if (name == NULL)
	return (NULL);

for ( tcat = pSenTransData->firstcat; tcat; tcat = tcat->next ) /* For each cat */
	if ( streq( name, tcat->name ) )     /* If name matches */
		return( tcat );                  /* Return cat */

return( NULL );                         /* If not found, return NULL */
}

/**************************************************************
 * NAME
 *      newmatch
 * ARGS
 *      None
 * DESCR
 *      Make a new match structure.
 * RETRN
 *      Pointer to new match structure.
 */
Match *newmatch( void )
{
Match *t;

t = myalloc( sizeof( Match ) );
t->type = 0;
t->string = NULL;
t->cat = NULL;
/* TAG_MATCHES */
t->tag = NULL;
/* end TAG_MATCHES */
t->begwd = NULL;
t->matmp = NULL;
t->mpList = NULL;		/* hab 1.2ze */
t->endwd = NULL;
t->prev = NULL;
t->next = NULL;
return( t );
}

/**************************************************************
 * NAME
 *      error_msg
 * ARGS
 *      msg - message to give
 * GLOB
 *      error_seen - set to show error seen in rule file.
 *      line - line containing error
 * DESCR
 *      Give error message and line with error and set error_seen.
 */
void error_msg( char *msg, char *element, SenTransData *pSenTransData )
{
if (pSenTransData->pLogFP == NULL)
  return;
											/* Line ends with nl */
fprintf( pSenTransData->pLogFP, "\nError: %s %s\n%s", msg, element, pSenTransData->line );
error_seen = TRUE;
}

/**************************************************************
 * NAME
 *      skipwhite
 * ARGS
 *      s - string to look at
 * DESC
 *      Skip all spaces and tabs at s.
 * RETN
 *      Pointer to next char after white space.
 */
char *skipwhite( char *s )
{
while (myisspace(*s))
	s++;
return( s );
}

/**************************************************************
 * NAME
 *      dumprules
 * Dump rules for debug
 */
void dumprules( Rule *ru, SenTransData *pSenTransData )
{
Match *mt;
Envir *env;

if (pSenTransData->pLogFP == NULL)
  return;

for ( ; ru; ru = ru->next )
	{
	fprintf( pSenTransData->pLogFP, "Rule %3d:  ", ru->number );         /* Rule and number */

	if ( ru->type & DISABLE )
	fprintf( pSenTransData->pLogFP, "OFF: " );

	switch ( ru->type & RULETYPE )
		{      /* Print rule type  */
	case AM:  fprintf( pSenTransData->pLogFP, "\\am" );   break;
	case REJ: fprintf( pSenTransData->pLogFP, "\\rej" );  break;
	case RU:  fprintf( pSenTransData->pLogFP, "\\ru" );   break;
		}  /* end of switch */

	if ( ru->type & UNANIM )
	fprintf( pSenTransData->pLogFP, "un" );
	fprintf( pSenTransData->pLogFP, " " );

	for ( mt = ru->match; mt; mt = mt->next )
		dumpmatch( mt, pSenTransData );

	if ( ru->repl )
	fprintf( pSenTransData->pLogFP, "\n  Repl: " );
	for ( mt = ru->repl; mt; mt = mt->next )
		{
		if ( mt->type & REF )  /* If ref */
			{
		fprintf( pSenTransData->pLogFP, "<" );
			dumpmatch( (Match *)mt->cat, pSenTransData );
			}
		else
			dumpmatch( mt, pSenTransData );
		}

	for ( env = ru->env; env; env = env->next )
		{
		if ( env->envlf )
		fprintf( pSenTransData->pLogFP, "\n  Left Env (reversed): " );
		for ( mt = env->envlf; mt; mt = mt->prev )
			dumpmatch( mt, pSenTransData );

		if ( env->envrt )
		fprintf( pSenTransData->pLogFP, "\n  Right Env: " );
		for ( mt = env->envrt; mt; mt = mt->next )
			dumpmatch( mt, pSenTransData );

		if ( env->envneg )
		fprintf( pSenTransData->pLogFP, "\n  Environ Negated" );
		}

	fprintf( pSenTransData->pLogFP, "\n" );
	}
}

/**************************************************************
 * NAME
 *      dumppats
 * Dump pattern for debug
 */
void dumppats( Pat *pat, SenTransData *pSenTransData )
{
Match *mt;

if (pSenTransData->pLogFP == NULL)
  return;

for ( ; pat; pat = pat->next )
	{
	fprintf( pSenTransData->pLogFP, "Pattern: %s ", pat->name );
	for ( mt = pat->match; mt; mt = mt->next )
		dumpmatch( mt, pSenTransData );
	fprintf( pSenTransData->pLogFP, "\n" );
	}
}

/**************************************************************
 * NAME
 *      dumpclasses
 * Dump class for debug
 */
void dumpclasses( Class *cl, SenTransData *pSenTransData )
{
Mem *tmem;

if (pSenTransData->pLogFP == NULL)
  return;

for ( ; cl; cl = cl->next )
	{
	fprintf( pSenTransData->pLogFP, "\nClass: %s ", cl->name );
	for ( tmem = cl->mem; tmem; tmem = tmem->next )
	fprintf( pSenTransData->pLogFP, "%s ",tmem->name );
	fprintf( pSenTransData->pLogFP, "\n" );
	}
}

/**************************************************************
 * NAME
 *      dumpcats
 * Dump cats for debug
 */
void dumpcats( Mem *cat, SenTransData *pSenTransData )
{

if (pSenTransData->pLogFP == NULL)
  return;

fprintf( pSenTransData->pLogFP, "Cats: " );
for ( ; cat; cat = cat->next )
	fprintf( pSenTransData->pLogFP, "%s ", cat->name );
fprintf( pSenTransData->pLogFP, "\n" );
}

/**************************************************************
 * NAME
 *      dumpmatch
 * Dump a match for debug
 */
static void dumpmatch( Match *mt, SenTransData *pSenTransData )
{
Class *tcl;

if (pSenTransData->pLogFP == NULL)
  return;

if ( mt->type & CAT )
	{
	if ( mt->type & CCL )
		{
		tcl = (Class *)mt->cat;
	fprintf( pSenTransData->pLogFP, "CCL %s", tcl->name );
		}
	else
	fprintf( pSenTransData->pLogFP, "CAT %s%s", (mt->type&MORPHCAT)?"%":"",mt->cat );
	if ( mt->string )
	fprintf( pSenTransData->pLogFP, "=" );
	}
if ( mt->string )
	{
	if ( mt->type & MCL )
		{
		tcl = (Class *)mt->string;
	fprintf( pSenTransData->pLogFP, "MCL %s", tcl->name );
		}
	else
	fprintf( pSenTransData->pLogFP, "%s", mt->string  );
	}
if ( mt->type & OPT )
	fprintf( pSenTransData->pLogFP, " OPT" );
if ( mt->type & NOT )
	fprintf( pSenTransData->pLogFP, " NOT" );
if ( mt->type & PLUS )
	fprintf( pSenTransData->pLogFP, " PLUS" );
if ( mt->type & SFX )
	fprintf( pSenTransData->pLogFP, " SFX" );
if ( mt->type & PFX )
	fprintf( pSenTransData->pLogFP, " PFX" );

fprintf( pSenTransData->pLogFP, ". " );                     /* Separate with periods */
}

/**************************************************************
 * NAME
 *      disprule
 * Display rule for trace
 */
void disprule( Rule *ru, SenTransData *pSenTransData )
{
Match *mt;
Envir *env;

if (pSenTransData->pLogFP == NULL)
  return;

if ( ru->type & REJ )
	fprintf( pSenTransData->pLogFP, "Reject " );
for ( mt = ru->match; mt; mt = mt->next )
	dispmatch( mt, pSenTransData );
if ( ru->repl )
	{
	fprintf( pSenTransData->pLogFP, "> " );
	for ( mt = ru->repl; mt; mt = mt->next )
		dispmatch( mt, pSenTransData );
	}
for ( env = ru->env; env; env = env->next )
	{
	if (env->and_env)
	fprintf( pSenTransData->pLogFP, "&" );
	fprintf( pSenTransData->pLogFP, "/ " );
	if ( env->envlf )
		{
		for ( mt = env->envlf; mt->prev; mt = mt->prev )
			;                           /* Find first of left */
		for ( ; mt; mt = mt->next )
			dispmatch( mt, pSenTransData );
		}
	if ( env->envneg )
	fprintf( pSenTransData->pLogFP, "~" );
	fprintf( pSenTransData->pLogFP, "_ " );
	if ( env->envrt )
		for ( mt = env->envrt; mt; mt = mt->next )
			dispmatch( mt, pSenTransData );
	}
fprintf( pSenTransData->pLogFP, "\n" );
}

/**************************************************************
 * NAME
 *      dispmatch
 * Display a match element from a rule for trace
 */
static void dispmatch( Match *mt, SenTransData *pSenTransData )
{
Class *tcl;         /* Temp class */

if (pSenTransData->pLogFP == NULL)
  return;

if ( mt->type & REF )
	{
	dispref = TRUE;
	dispmatch( (Match *)mt->cat, pSenTransData );
	dispref = FALSE;
	return;
	}
if ( mt->type & OPT )
	fprintf( pSenTransData->pLogFP, "(" );
if ( mt->type & NOT )                       /* If NOT */
	fprintf( pSenTransData->pLogFP, "~" );
if ( mt->type & SFX )
	fprintf( pSenTransData->pLogFP, "-" );
if ( mt->type & CAT )
	{
	if ( mt->type & CCL )
		{
		tcl = (Class *)mt->cat;
	fprintf( pSenTransData->pLogFP, "%s", tcl->name );
		}
	else
	  fprintf( pSenTransData->pLogFP, "%s", mt->cat );
	if ( mt->string )
	  fprintf( pSenTransData->pLogFP, "=" );
	}
if ( mt->type & PAT )
	{
	fprintf( pSenTransData->pLogFP, "%s", ((Pat*)(mt->string))->name );
	}
else if ( mt->string )
	{
	if ( mt->type & MCL )
		{
		tcl = (Class *)mt->string;
	fprintf( pSenTransData->pLogFP, "%s", tcl->name );
		}
	else
	  fprintf( pSenTransData->pLogFP, "%s", mt->string  );
	}
if ( mt->tag )
	fprintf( pSenTransData->pLogFP, "%c%s", tagchar, mt->tag );
if ( mt->type & PFX )
	fprintf( pSenTransData->pLogFP, "-" );
if ( mt->type & PLUS )
	fprintf( pSenTransData->pLogFP, "+" );
if ( mt->type & OPT )
	fprintf( pSenTransData->pLogFP, ")" );
if ( !dispref && mt->next && mt->next->type & CR )
	fprintf( pSenTransData->pLogFP, "--" );
else
	fprintf( pSenTransData->pLogFP, " " );
}

#ifndef EXTRA_SPACE
/* replaced with macro for EXTRA_SPACE version */
/**************************************************************
 * NAME
 *      myisspace
 * ARGS
 *      c - char to test for space
 * DESC
 *      Test for space char, including working for 8-bit char,
 *          unlike the stupid isspace with the compiler!
 * RETN
 *      TRUE if char is space, FALSE if not.
 */
int myisspace( char c )
{

if ( c == ' ' || c == '\n' || c == '\t' )
	return( TRUE );
else
	return( FALSE );
}
#endif

/**************************************************************  1.2zb hab
 * NAME
 *      pszGetReplaceText
 * ARGS
 *      rep - element of replace
 * DESCR
 *      Determine string to use to identify the replacement
 * RETRUN
 *      Pointer to string
 */
static char *pszGetReplaceText( Match *rep )
{
  char        *s;

  if ( rep->type & MCL )
	s = ((Class*)(rep->string))->name;
  else if ( rep->type & CCL )
	s = ((Class*)(rep->cat))->name;
  else if ( (rep->type & CAT) && rep->cat )
	s = rep->cat;
  else if (rep->type & PAT)
	s = ((Pat*)(rep->string))->name;
  else
	s = rep->string;
  return(s);
}

#ifndef hab210
/**************************************************************  1.2zb hab
 * NAME
 *      PuncLengthAtBeginning
 * ARGS
 *      pSenTransData_in - SenTrans Data
 *      pszStart_in      - pointer to character beginning search space
 * DESCR
 *      Determine if some punctuation string matches at pszStart_in
 * RTRN
 *      The length of the punctuation that matched.
 *      0 otherwise.
 */
static int PuncLengthAtBeginning(SenTransData *pSenTransData_in, char *pszStart_in)
{
int iLen = 0;

 if ( (iLen = PuncLengthAtBegSL(pSenTransData_in->sent_punc, pszStart_in))
	  == 0)
   if ((iLen = PuncLengthAtBegSL(pSenTransData_in->other_punc, pszStart_in))
	   == 0)
	 iLen = PuncLengthAtBegSL(pSenTransData_in->begin_punc, pszStart_in);

return iLen;
}

/**************************************************************  1.2zb hab
 * NAME
 *      PuncLengthAtBegSL
 * ARGS
 *      pStrList_in - a string list to search
 *      pszStart_in - pointer to character beginning search space
 * DESCR
 *      Determine if a string begins one of the members of the string list
 * RTRN
 *      The length of the matching string.
 *      0 if no match.
 */
int PuncLengthAtBegSL(StringList *pStrList_in, char *pszStart_in)
{
for ( ; pStrList_in ; pStrList_in = pStrList_in->pNext )
  {				/* for each string in string list */
	if (strstr(pszStart_in, pStrList_in->pszString) == pszStart_in)
	  {			/* it matches at the left edge */
	return strlen(pStrList_in->pszString);
	  }
  }

return 0;
}
#endif /* hab210 */

/*------------------------------------------------------------
* Change history:
* 0.1h  1-Nov-90 AB Original coding
* 0.3i 12-Jul-91 AB Fix bug of not recognizing same root if affix
* 0.3k 24-Jul-91 AB Remove endmp, change begmp to matmp
* 0.3m 25-Jul-91 AB Clean up pattern and class code some
* 0.3v 26-Sep-91 AB Consider hyphen with no spaces part of morph name
* 0.4a  2-Oct-91 AB Add environment \am x / _ y (Mark Bean)
* 0.4b  3-Oct-91 AB Rework environ partially, still unfinished
* 0.4c  3-Oct-91 AB Finish environ coding, not fully tested yet
*                   Change sent bound to store literal pound sign
* 0.4n 18-Oct-91 AB Remove vestigial + code,allow + in morphnames
* 0.4t 12-Nov-91 AB Allow multiple environments (OR)
* 0.4u 18-Nov-91 AB Change compound root ref to -- double hyphen
* 1.0c 22-Jan-92 AB Fix bug of memory full message from extra wedge in line
* 1.0e  1-Apr-92 AB Add \rej rule to reject an ambiguity
* 1.0f 14-Jul-92 AB Allow \mcl and \ccl as classes along with \cl
* 1.0j  9-Nov-92 AB Send messages to log file, don't produce empty output
* 1.0m 12-Nov-92 AB Add -c option for comment character
* 1.0p  3-Mar-93 AB Add statistical counts
* 1.0r  6-Apr-93 AB Split ambig from ru in prep for repeat ambig
* 1.1a 10-Jun-93 WM Add rejun,amun,rulesoff,ruleson; rejoin ambig & ru rules
*                   Put type on every rule;
*                   Remove buggy uses of error_msg on nonrules;
*                   Add classes included in classes
* 1.1e 29-Dec-93 WM Add [] in rules; remove whitespace bugs
* 1.1f 19-Feb-94 JK Port to MacCADA, add EXTRA_SPACE (\spc) and ignore_cat
*                   Fix comparisons using streq on non-strings
*                   (changed ellipse item storage to facilitate this)
* 1.1g 21-Feb-94 JK Add + (repeatable) after match element
*                   Add tags (^xxx) to distinguish multiple similar elems
* 1.1h 22-Feb-94 JK Add ANDable environments (&/)
* 1.2  03-May-95 BJY Require matching parens without whitespace between
*                   for optional items and add appropriate error messages
* 1.2a 27-Jun-95 BJY Give punctuation and whitespace their own nodes in the sentence
*                   structure instead of being attached to the word they came in with.
*                   Enforce 100 max word per sentence limit.
*                   Fixed problem of # ... x and ... x not working
*                   Output \u field for inserted words
* 1.2e 28-Nov-95 BJY Made so -[mcl] works
* 1.2f 29-Nov-95 BJY report number of occurences of \ruleson and \rulesoff
* 1.2g 09-Dec-95 RNE Added processing of properties and tag character (default '^')
* 1.2h 12-Dec-95 RNE & AB Applying property rules in environments.
* 1.2zb  19-Oct-1998 hab Insist that all optional replacement elements have
*                        identical match elements as originally intended.
* 1.2zd  20-Nov-1998 hab Fix bug: an ending punctuation symbol in a replacement
*                         without following environment would crash Win32
*                         version.
* 1.2ze  16-Apr-1999 hab Fix bug: a reject rule with a repeated affix would
*                         incorrectly disambiguate a single occurrence of that
*                         affix.
*-----------------------------------------------------------*/
