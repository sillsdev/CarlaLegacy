/* loadrule.c  Load rules into structure  Alan B  1 Nov 90
*
Rule *loadrules( FILE *infile );
Rule *newrule( void );
void error_msg( char *msg );
Str *new_str( void );
Str *findcat( char *name );
*
* Change History:
* 0.2m 11-May-95 BJY Fix bug of mishandling of deletion of classes
* 0.2n 12-May-95 BJY Add handling for \ca field and verify cats used in rules
* 0.2o 12-May-95 BJY Generate error message for unknown markers
* 0.2p 12-May-95 BJY Fix bug of base rule with a +/ environment inserting a
*                   morpheme property of + in an entry.
* 0.2q 15-May-95 BJY Don't process noload records
* 0.2s 15-Sep-95 BJY ifdef out noload stuff added in 0.2q and fix bug of
*					base rule firing but not remembering changed base
* 0.2t 19-Oct-95 BJY Fix bug of warning message being generated for
*					\id and \dis fields in the rule file
*		22-Sep-98 JDH Converted all "printf" to  "fprintf(logfile,"
*					where logfile is set to stdout for the DOS version, a file for the dll version
*					"stderr" changed to "errlogfile"
* 0.2w 07-Dec-2000 hab Don't give warning about CarlaStudio SFMs.
*/

#include "phonrule.h"

char *rest;                     /* Rest of line */
Scl *firstscl;                  /* First class in list */
Scl *firstccl;                  /* First class in list */
Str *firstcat = NULL;           /* First category in list */
Str *lastcat = NULL;            /* Last category in list */

extern int error_seen;          /* Note an error was seen */
extern char line[];             /* Input line */
extern char *recmark;
extern int recmarklen;
extern char *basemark;
extern int basemarklen;
extern char *allomark;
extern int allomarklen;
extern char *catmark;
extern int catmarklen;
extern char *noloadmark;    /* 0.2q BJY */
extern int noloadmarklen;   /* 0.2q BJY */

extern char comment_char;
extern int base_becomes_allo;
extern char cut_char;

/*static int rule_eofseen = FALSE;*/  /* Saw eof last time */
/*static char endchs[] = " \t\n+-=";*/ /* Chars that end an element */
								  /* ) also ends, but is treated special */
/*static char whitechs[] = " \t\n";*/ /* Whitespace chars */

static void invert_match( char *s );
static int chk_class_lens( char *match, char *repl );
static int check_classes( char *s );
static void add_members( Scl *scl, char *rest );
static void loadcats( char *line );
/*static*/ Str *findcat( char *name );

extern FILE *logfile;
extern FILE *errlogfile;

#ifdef CSTUDIODLL
void preparePhnlGlobals()
{
	firstcat = NULL;           /* First category in list */
	lastcat = NULL;            /* Last category in list */
}
#endif

/**************************************************************
 * NAME
 *      loadrules
 * ARGS
 *      infile - file to load from
 * DESCR
 *      Load a file of rules into the structures.
 * RETRN
 *      Pointer to first rule structure, NULL at eof or error.
 */
Rule *loadrules( FILE *infile )
{
Rule *firstrule;        /* First rule in list */
Rule *ru;               /* Temp rule */
Rule *rprev;            /* Previous rule */
Scl *lastscl;           /* Previous class */
Scl *lastccl;           /* Previous class */
char *s, *t;            /* Temp string pointer */
char wkline[MAXLINE];   /* Working copy of line for error messages */
char mark[50];          /* Working area to build marker */
int newbase;            /* Note new base given so don't override it */
Scl *scl;               /* Current string class for continued lines */
Scl *ccl = NULL;               /* Current string class for continued lines */
int in_cat = FALSE;     /* TRUE if currently reading cat list 0.2n BJY */
int valid_mkr;          /* flag used to catch undefined markers 0.2o BJY */

if ( !fgets ( line, MAXLINE, infile ) ) /* Get first line */
	return( NULL );                     /* If none, return eof */

firstrule = rprev = NULL;               /* Init firstrule */
firstscl = lastscl = NULL;              /* Init firstscl */
firstccl = lastccl = NULL;              /* Init firstccl */
firstcat = lastcat = NULL;              /* Init firstcat */
base_becomes_allo = FALSE;              /* Default to not base as allo */
scl = NULL;                             /* Init current string class */
newbase = FALSE;                        /* No new base set yet */

while ( TRUE )                          /* While line (tested below) */
	{
	valid_mkr = FALSE;                  /* 0.2o BJY */
	strcpy( wkline, line );             /* Make a working copy of line */

	if ( strncmp( "\\pr", wkline, 3 ) )  /* If line is not \pr line */
		{
		if ( (s = strchr( wkline, comment_char )) != NULL )  /* Cut off comments */
			*s = '\0';
		}

	if ( scl && *wkline != '\\' )       /* If continuation of class */
		{
		rest = skipwhite( wkline );     /* Move to first word */
		add_members( scl, rest );       /* Add members to class */
		}
	else                                /* Else clear current class */
		scl = NULL;

	if ( !strncmp( "\\scl ", wkline, 5 ) )  /* If line is string class */
		{
		valid_mkr = TRUE;               /* 0.2o BJY */
		rest = skipwhite( wkline + 5 ); /* Start after mark */
		s = rest;                       /* Get class name */
		rest = nextwd( rest );          /* Terminate class name */

		scl = Structalloc( Scl );       /* Get new class */
		scl->name = mystrdup( s );        /* Point to copy of class name */
		scl->class = NULL;              /* Clear class members */
		scl->next = firstscl;           /* Link to top of class list */
		firstscl = scl;                 /* Set new top of list */

		add_members( scl, rest );       /* Add members to class */
		}

	if ( ccl && *wkline != '\\' )       /* If continuation of class */
		{
		rest = skipwhite( wkline );     /* Move to first word */
		add_members( ccl, rest );       /* Add members to class */
		}
	else                                /* Else clear current class */
		ccl = NULL;

	if ( !strncmp( "\\ccl ", wkline, 5 ) )  /* If line is category class */
		{
		valid_mkr = TRUE;               /* 0.2o BJY */
		rest = skipwhite( wkline + 5 ); /* Start after mark */
		s = rest;                       /* Get class name */
		rest = nextwd( rest );          /* Terminate class name */

		ccl = Structalloc( Scl );       /* Get new class */
		ccl->name = mystrdup( s );        /* Point to copy of class name */
		ccl->class = NULL;              /* Clear class members */
		ccl->next = firstccl;           /* Link to top of class list */
		firstccl = ccl;                 /* Set new top of list */

		add_members( ccl, rest );       /* Add members to class */
		}
										/* begin 0.2n BJY */
	if ( in_cat && *wkline != '\\' )    /* If continuation of category list */
		{
		loadcats( skipwhite( wkline ) ); /* Add more cats to list */
		}
	else                                /* Else clear cat flag */
		in_cat = FALSE;

	if ( !strncmp( "\\ca ", wkline, 4 ) )   /* If line is category list */
		{
		valid_mkr = TRUE;               /* 0.2o BJY */
		loadcats( wkline + 4 );
		in_cat = TRUE;                  /* remember we're in cat list */
		}                               /* end 0.2n BJY */

	if ( !strncmp( "\\base_", wkline, 6 ) ) /* If line is base_becomes_allomorph switch */
		{
		base_becomes_allo = TRUE;       /* Set switch */
		}
	else if ( !strncmp( "\\cut ", wkline, 5 ) ) /* If line is cutoff char */
		{
		rest = skipwhite( wkline + 5 ); /* Start after mark */
		cut_char = *rest;               /* Pick up cutoff char */
		}

	else if ( !strncmp( "\\r ", wkline, 3 ) )  /* If line is record marker */
		{
		rest = skipwhite( wkline + 3 ); /* Start after mark */
		s = rest;                       /* Get marker */
		rest = nextwd( rest );          /* Terminate marker */
		*mark = '\0';                   /* Initialize mark */
		if ( *s != '\\' )               /* If no backslash */
			strcat( mark, "\\" );       /* Put one in */
		strcat( mark, s );              /* Add marker */
		strcat( mark, " " );            /* Add space */
		recmark = mystrdup( mark );     /* Store marker */
		recmarklen = strlen( recmark ); /* Store marker length */
		if ( !newbase )                 /* If base is default, change it */
			{
			basemark = mystrdup( mark );    /* Store marker */
			basemarklen = strlen( basemark ); /* Store marker length */
			}
		}

	else if ( !strncmp( "\\b ", wkline, 3 ) )  /* If line is base marker */
		{
		rest = skipwhite( wkline + 3 ); /* Start after mark */
		s = rest;                       /* Get marker */
		rest = nextwd( rest );          /* Terminate marker */
		*mark = '\0';                   /* Initialize mark */
		if ( *s != '\\' )               /* If no backslash */
			strcat( mark, "\\" );       /* Put one in */
		strcat( mark, s );              /* Add marker */
		strcat( mark, " " );            /* Add space */
		basemark = mystrdup( mark );    /* Store marker */
		basemarklen = strlen( basemark ); /* Store marker length */
		newbase = TRUE;                 /* Remember new base */
		}

	else if ( !strncmp( "\\a ", wkline, 3 ) )  /* If line is allo marker */
		{
		rest = skipwhite( wkline + 3 ); /* Start after mark */
		s = rest;                       /* Get marker */
		rest = nextwd( rest );          /* Terminate marker */
		*mark = '\0';                   /* Initialize mark */
		if ( *s != '\\' )               /* If no backslash */
			strcat( mark, "\\" );       /* Put one in */
		strcat( mark, s );              /* Add marker */
		strcat( mark, " " );            /* Add space */
		allomark = mystrdup( mark );    /* Store marker */
		allomarklen = strlen( allomark ); /* Store marker length */
		}

	else if ( !strncmp( "\\c ", wkline, 3 ) )  /* If line is cat marker */
		{
		rest = skipwhite( wkline + 3 ); /* Start after mark */
		s = rest;                       /* Get marker */
		rest = nextwd( rest );          /* Terminate marker */
		*mark = '\0';                   /* Initialize mark */
		if ( *s != '\\' )               /* If no backslash */
			strcat( mark, "\\" );       /* Put one in */
		strcat( mark, s );              /* Add marker */
		strcat( mark, " " );            /* Add space */
		catmark = mystrdup( mark );     /* Store marker */
		catmarklen = strlen( catmark ); /* Store marker length */
		}
#ifdef NO_NOLOAD /* 0.2s BJY */
										/* begin 0.2q BJY */
	else if ( !strncmp( "\\noload ", wkline, 8 ) )  /* If line is noload marker */
		{
		rest = skipwhite( wkline + 8 ); /* Start after mark */
		s = rest;                       /* Get marker */
		rest = nextwd( rest );          /* Terminate marker */
		*mark = '\0';                   /* Initialize mark */
		if ( *s != '\\' )               /* If no backslash */
			strcat( mark, "\\" );       /* Put one in */
		strcat( mark, s );              /* Add marker */
		noloadmark = mystrdup( mark );  /* Store marker */
		noloadmarklen = strlen( noloadmark ); /* Store marker length */
		}                               /* end 0.2q BJY */
#endif
	else if ( !strncmp( "\\pr ", wkline, 4 )   /* If line is \pr line */
			|| !strncmp( "\\pri ", wkline, 5 )  /* Or \pri initial line */
			|| !strncmp( "\\prf ", wkline, 5 )  /* Or \prf final line */
			|| !strncmp( "\\br ", wkline, 4 )   /* Or \br base rule line */
			|| !strncmp( "\\bri ", wkline, 5 )
			|| !strncmp( "\\brf ", wkline, 5 ) )
		{
		ru = newrule();                 /* Get new rule */

		rest = skipwhite( wkline + 4 ); /* Start after \pr */
		s = rest;                       /* Get match */
		rest = nextwd( rest );          /* Terminate and get next */
		ru->match = mystrdup( s );      /* Store match */
		ru->matlen = strlen( ru->match ); /* Store match length */

		s = rest;                       /* Get arrow */
		rest = nextwd( rest );
										/* If not arrow, prev was cat */
		if ( !streq( s, "->" ) && !streq( s, ">" ) )
			{
			ru->cat = ru->match;        /* Make previous cat */
			if ( *ru->cat == '[' )      /* If category class */
				{                       /* Check for valid */
				t = strchr( ru->cat, ']' );
				if ( !t || *( t + 1 ) ) /* If no ] or ] not last */
					{
					fprintf(logfile, "Error: Invalid category class\n%s", line );
					goto badrule;
					}
				else
					{
					*t = '\0';          /* Terminate class */
					if ( !find_ccl( ru->cat + 1 ) )
						{
						fprintf(logfile, "Error: Undefined category class\n%s", line );
						goto badrule;
						}
					}
				}
			else        /* begin 0.2n BJY  Must be a category name */
				{
				if ( !findcat( ru->cat ) )
					{
					fprintf(logfile, "Error: Undefined category %s\n%s", ru->cat, line );
					goto badrule;
					}
				}       /* end 0.2n BJY */

			if ( streq( s, "0" ) )          /* If zero, use null */
				ru->match = "";
			else
				ru->match = mystrdup( s );  /* Store match */

			ru->matlen = strlen( ru->match ); /* Store match length */

			s = rest;                   /* Get arrow */
			rest = nextwd( rest );
										/* If not arrow, give message */
			if ( !streq( s, "->" ) && !streq( s, ">" ) )
				{
				fprintf(logfile, "Error: Arrow not found in rule\n%s", line );
				goto badrule;
				}
			}

		s = rest;                       /* Get replacement */
		rest = nextwd( rest );
		if ( streq( s, "0" ) )          /* If zero, use null */
			ru->repl = "";
		else
			ru->repl = mystrdup( s ); /* Store replacement */

		if ( !check_classes( ru->match ) || !check_classes( ru->repl ) )
			goto badrule;

		s = rest;                       /* Find end of envir */
		while ( *s && !(*s == '\n') )
			s++;
		*s = '\0';                      /* Cut it off */
		ru->envir = mystrdup( rest );   /* Store environment */

		if ( !strncmp( "\\pri ", wkline, 5 ) )  /* If \pri initial line */
			ru->begin = TRUE;       /* Set begin */
		else if ( !strncmp( "\\prf ", wkline, 5 ) )  /* If \prf final line */
			ru->begin = FALSE;      /* Set end */
		else if ( !strncmp( "\\bri ", wkline, 5 ) )  /* If \bri initial line */ /* 0.2m BJY made else if */
			ru->begin = TRUE;       /* Set begin */
		else if ( !strncmp( "\\brf ", wkline, 5 ) )  /* If \brf final line */
			ru->begin = FALSE;      /* Set end */
		else
			{                            /* See if envir begin or end */
			s = strchr( ru->envir, '/' );   /* Find envir start */
			if ( s )                        /* If envir */
				{
				s = skipwhite( s + 1 );     /* Find first char of envir */
				if ( *s == '_'              /* If underline */
						|| !strncmp( s, "~_", 2 ) ) /* Or tilde underline */
					ru->begin = FALSE;      /* Set end */
				else
					ru->begin = TRUE;       /* Set begin */
				}
			}

		if ( !ru->begin )
			{
			invert_match( ru->match );     /* Invert the match */
			invert_match( ru->repl );      /* Invert the replace */
			}

		if ( !chk_class_lens( ru->match, ru->repl ) )  /* 0.2m BJY */
			goto badrule;

		if ( !strncmp( "\\br ", wkline, 4 )   /* If \br line */
				|| !strncmp( "\\bri ", wkline, 5 )
				|| !strncmp( "\\brf ", wkline, 5 ) )
			{
			ru->base = TRUE;            /* Note base rule */
			if ( (s = strchr( ru->envir, '/' )) != NULL ) /* If envir */
				{
				if ( (s > ru->envir)        /* 0.2p BJY */
					&& (*(s-1) == '+') )    /* check for +/ */
					s--;
				*s = '\0';              /* Cut it off but  retain rule */
				}
			}
										/* Link in rule */
		if ( !firstrule )               /* If first rule */
			firstrule = rprev = ru;     /* Set first and prev rule */
		else                            /* Else (not first) */
			{
			rprev->next = ru;           /* Link prev to here */
			rprev = ru;                 /* Remember this one as prev */
			}
badrule: ;
		}
	else if ( !strncmp( "\\co ", wkline, 4 ) )  /* begin 0.2o BJY */
		{
		valid_mkr = TRUE;       /* found a comment marker */
		}
	else if ( !strncmp( "\\id ", wkline, 4 ) )  /* 0.2t BJY */
		{
		valid_mkr = TRUE;       /* ignore \id field */
		}
	else if ( !strncmp( "\\dis ", wkline, 5 ) )  /* 0.2t BJY */
		{
		valid_mkr = TRUE;       /* ignore \dis field */
		}
#ifndef hab02w
	else if ( !strncmp( "\\CSbeg", wkline, 6 ) )
		{
		valid_mkr = TRUE;       /* ignore all \CSbegX fields */
		}
	else if ( !strncmp( "\\CSend", wkline, 6 ) )
		{
		valid_mkr = TRUE;       /* ignore \CSend field */
		}
#endif /* hab02w */
	else    /* 0.2o BJY  Check for undefined marker */
		{
		if ( *wkline == '\\' && !valid_mkr )
			fprintf(logfile, "Warning: Undefined field\n%s", line );
		}

	if ( !fgets ( line, MAXLINE, infile ) ) /* Get next line */
		return( firstrule ); /* If no more, return rules */
	}
}



/**************************************************************
 * NAME
 *      invert_match
 * ARGS
 *      s - Match to invert.
 * DESC
 *      Invert match for right end matches.
 * RETN
 *      None.
 */
static void invert_match( char *s )
{
char sinv[100];
char *t;

if ( !*s )                          /* Protect against empty */
	return;

*sinv = '\0';

t = s + ( strlen( s ) - 1 );        /* Start at end */
while ( t >= s )                    /* While not to begin */
	{
	if ( *t == ']' )                /* If class end, move to class begin */
		while ( *t != '[' )
			t--;
	strcat( sinv, t );              /* Copy piece onto end of inversion */
	*t = '\0';                      /* Cut off piece */
	t--;                        /* Else move back 1 */
	}
strcpy( s, sinv );                  /* Copy inversion back to s */
}


/**************************************************************
 * NAME
 *      chk_class_lens
 * ARGS
 *      match - pointer to match side of rule.
 *      repl  - pointer to replacement side of rule.
 * DESC
 *      Verify replacement classes have same number of elements
 *       as each corresponding class on the match side
 * RETN
 *      TRUE if ok, FALSE if not.
 *
 * Added 5/95 BJY for 0.2m
 */
static int chk_class_lens( char *match, char *repl )
{
Str *mstr, *rstr;
char *endcl;
char *m = match;
char *r = repl;

while (TRUE)
	{
	m = strchr( m, '[' );   /* look for start of another class */
	r = strchr( r, '[' );

	if ( !m )       /* no more classes on match side */
		{
		if ( r )    /* more classes in replacement than match */
			{
			fprintf(logfile, "Error: Unmatched replacement class in rule\n%s", line );
			return( FALSE );
			}
		else
			return( TRUE );     /* we've checked all classes now */
		}
	else if ( !r )
		return( TRUE );     /* class deletion */

	endcl = strchr( m, ']' );       /* Find end of class */
	if ( !strncmp( m, r, endcl-m ) )
		{
		r += endcl-m;               /* If names the same, then we're okay */
		m = endcl;
		continue;
		}
	*endcl = '\0';                  /* Terminate class */
	mstr = find_scl( m+1 )->class;  /* Find class for match side */
	*endcl = ']';                   /* Restore class terminator */
	m = endcl;                      /* Move to end of class */

	endcl = strchr( r, ']' );       /* Find end of class */
	*endcl = '\0';                  /* Terminate class */
	rstr = find_scl( r+1 )->class;  /* Find class on replacement side */
	*endcl = ']';                   /* Restore class terminator */
	r = endcl;                      /* Move to end of class */

			/* If the two classes have the same number of elements */
			/*  they will reach the end of the list at the same time */
	for ( ; mstr && rstr; mstr=mstr->next, rstr=rstr->next )
		;

	if ( mstr || rstr )
		{
		fprintf(logfile, "Error: Mismatched classes in rule\n%s", line );
		return( FALSE );
		}
	}
}


/**************************************************************
 * NAME
 *      check_classes
 * ARGS
 *      s - Match or replace to check.
 * DESC
 *      Check classes in match or replace for validity as scl.
 * RETN
 *      TRUE if ok, FALSE if not.
 */
static int check_classes( char *s )
{
Scl *scl;
char *endcl;

for ( ; *s; s++ )
	{
	if ( *s == '[' )                    /* If class */
		{
		endcl = strchr( s, ']' );       /* Find end of class */
		if ( !endcl )                   /* If no end, fail */
			{
			fprintf(logfile, "Error: Unterminated class %s in rule\n%s", s, line );
			return( FALSE );
			}
		*endcl = '\0';                  /* Terminate class */
		scl = find_scl( s + 1 );        /* Find class */
		if ( !scl )                     /* If class not found, fail */
			{
			fprintf(logfile, "Error: Undefined class [%s] in rule\n%s", s+1, line );
			*endcl = ']';                   /* Restore class terminator */
			return( FALSE );
			}
		*endcl = ']';                   /* Restore class terminator */
		s = endcl;                      /* Move to end of class */
		}
	}
return( TRUE );                         /* No problems, return success */
}



/**************************************************************
 * NAME
 *      loadcats
 * ARGS
 *      line - string of cat names to process
 * DESCR
 *      Load cats into structures.
 * RETRN
 *      Pointer to first cat structure, NULL at error.
 *
 * Added 5/95 BJY for 0.2n
 */
static void loadcats( char *line )
{
Str *cat;           /* Temp match element */
char *en;           /* End of element */
char *p;

p = skipwhite( line );
while ( *p )
	{
	cat = myalloc( sizeof( Str ) );     /* make new element */
	for ( en = p; *en && !myisspace(*en); en++ )    /* Find end */
		;
	*en = '\0';                         /* Terminate string */
	cat->name = mystrdup( p );          /* Set name */
	cat->next = NULL;

	if ( !firstcat )                    /* If first one */
		firstcat = lastcat = cat;       /* Set first and prev */
	else
		{
		lastcat->next = cat;            /* Link prev to here */
		lastcat = cat;                  /* Remember this one as prev */
		}

	p = skipwhite( ++en );              /* Move past element */
	}
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
 *
 * Added 5/95 BJY for 0.2n
 */
Str *findcat( char *name )
{
Str *tcat;

for ( tcat = firstcat; tcat; tcat = tcat->next ) /* For each cat */
	if ( streq( name, tcat->name ) )     /* If name matches */
		return( tcat );                  /* Return cat */

return( NULL );                         /* If not found, return NULL */
}


/**************************************************************
 * NAME
 *      add_members
 * ARGS
 *      scl - Class to add members to.
 *      rest - Line of members to add.
 * DESC
 *      Add members to string class.
 * RETN
 *      None.
 */
static void add_members( Scl *scl, char *rest )
{
Str *sl;
Scl *tscl;
Str *tsl;
Str *lastsl;
char *s, *t;
									/* Find last class member */
for ( lastsl = scl->class; lastsl && lastsl->next; lastsl = lastsl->next )
	;
s = rest;
while ( *s )                        /* While another string */
	{
	rest = nextwd( rest );          /* Terminate string */

	if ( *s == '[' && *(s+1) )      /* If class reference */
		{
		s++;                                    /* Skip open bracket */

		t = s + ( strlen( s ) - 1 );
		if ( *t == ']' )                        /* If close bracket, delete it */
			*t = '\0';
		else                                    /* Else fail */
			fprintf(logfile, "Error: Missing ] on string class %s\n%s", s, line );
		tscl =  find_scl( s );
		if ( !tscl  )                    /* wm 0.2k: If class not defined as scl */
		tscl =  find_ccl( s );           /* try ccl.  */
		if ( tscl  )                    /* If class  defined as either */
			{                       /* Copy all members */
			for ( tsl = tscl->class; tsl; tsl = tsl->next )
				{
				sl = Structalloc( Str );        /* Get new list element */
				sl->next = NULL;                /* NULL link */
				sl->name = mystrdup( tsl->name ); /* Point to copy of string */
				if ( lastsl )                   /* If lastsl */
					lastsl->next = sl;          /* Point it to this */
				else                            /* Else (no last) */
					scl->class = sl;            /* Point class to this */
				lastsl = sl;                    /* Note this is now last */
				}
			}
		else
			fprintf(logfile, "Error:  Class %s not defined\n%s", s, line );
		}
	else                            /* Else (not class ref) */
		{
		sl = Structalloc( Str );        /* Get new list element */
		sl->next = NULL;                /* NULL link */
		sl->name = mystrdup( s );         /* Point to copy of string */
		if ( lastsl )                   /* If lastsl */
			lastsl->next = sl;          /* Point it to this */
		else                            /* Else (no last) */
			scl->class = sl;            /* Point class to this */
		lastsl = sl;                    /* Note this is now last */
		}
	s = rest;                       /* Move to next string */
	}
}


/**************************************************************
 * NAME
 *      find_scl
 * ARGS
 *      scl - Class to find.
 * DESC
 *      Find string class from name.
 * RETN
 *      Value of string class, NULL if not found.
 */
Scl *find_scl( char *s )
{
Scl *scl;

for ( scl = firstscl; scl; scl = scl->next )    /* For each class */
	if ( streq( scl->name, s ) )        /* If found, return it */
		return( scl );
return( NULL );                         /* If none found, fail */
}



/**************************************************************
 * NAME
 *      find_ccl
 * ARGS
 *      ccl - Class to find.
 * DESC
 *      Find category class from name.
 * RETN
 *      Value of category class, NULL if not found.
 */
Scl *find_ccl( char *s )
{
Scl *ccl;

for ( ccl = firstccl; ccl; ccl = ccl->next )    /* For each class */
	if ( streq( ccl->name, s ) )        /* If found, return it */
		return( ccl );
return( NULL );                         /* If none found, fail */
}


/**************************************************************
 * NAME
 *      dump_classes
 * ARGS
 *      None.
 * DESC
 *      Dump string class.
 * RETN
 *      None.
 */
void dump_classes( void )
{
Scl *scl;
Str *sl;

for ( scl = firstscl; scl; scl = scl->next )
	{
	fprintf(logfile, "\nScl %s: ", scl->name );
	for ( sl = scl->class; sl; sl = sl->next )
		fprintf(logfile, "%s ", sl->name );
	}
for ( scl = firstccl; scl; scl = scl->next )
	{
	fprintf(logfile, "\nCcl %s: ", scl->name );
	for ( sl = scl->class; sl; sl = sl->next )
		fprintf(logfile, "%s ", sl->name );
	}
fprintf(logfile, "\n" );
}



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
t->cat = "";
t->begin = 0;
t->base = 0;
t->match = NULL;
t->matlen = 0;
t->repl = NULL;
t->envir = NULL;
t->next = NULL;
return( t );
}



/**************************************************************
 * NAME
 *      dumprules
 * Dump rules for debug
 */
void dumprules( Rule *ru )
{

for ( ; ru; ru = ru->next )
	disprule( ru );
fprintf(logfile, "\n" );
}


/**************************************************************
 * NAME
 *      disprule
 * Display rule for trace or debug
 */
void disprule( Rule *ru )
{
char *close_brack;

if ( *ru->cat == '[' )              /* If cat class */
	close_brack = "]";              /* Show close bracket */
else
	close_brack = "";               /* Else no close bracket */

if ( !ru->begin )                   /* If inverted, uninvert for display */
	{
	invert_match( ru->match );     /* Invert the match */
	invert_match( ru->repl );      /* Invert the replace */
	}
fprintf(logfile, "Rule: %s%s %s -> %s %s\n",
		ru->cat, close_brack, ru->match, ru->repl, ru->envir );
if ( !ru->begin )                   /* If inverted, uninvert for display */
	{
	invert_match( ru->match );     /* Invert the match */
	invert_match( ru->repl );      /* Invert the replace */
	}
}


/**************************************************************
 * NAME
 *      nextwd
 * ARGS
 *      s - string to look at
 * DESC
 *      Move to end of current word and terminate it.
 * RETN
 *      Pointer to next char after end of word.
 */
char *nextwd( char *s )
{

while ( *s && !myisspace( *s ) )        /* Move to space */
	s++;
if ( *s )                               /* If space found */
	*s++ = '\0';                        /* Terminate and advance */
s = skipwhite( s );                     /* Find next word */
return( s );                            /* Return begin of next wd */
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

while ( *s == ' ' || *s == '\t' || *s == '\n' )
	s++;
return( s );
}


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


/**************************************************************
 * NAME
 *      new_str
 * ARGS
 *      None
 * DESC
 *      Allocate and clear new Str (string list) struct.
 * RETN
 *      New Str struct.
 */
Str *new_str( void )
{
Str *sl;

sl = Structalloc( Str );
sl->name = NULL;
sl->next = NULL;
return( sl );
}
