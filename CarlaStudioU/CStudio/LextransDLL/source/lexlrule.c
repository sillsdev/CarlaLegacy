/* loadrule.c  Load rules into structure  Alan B  1 Nov 90
*
Rule **loadrules( FILE *infile );
Rule *newrule( void );
void error_msg( char *msg );
*/
/*------------------------------------------------------------
* Change history:
* 0.1  30-Sep-92 AB Original coding
* 0.2a 12-Nov-92 AB Add -c option for comment character
* 0.2b  1-Mar-93 AB Cut off nl, add warning for empty from or to firld
*                   Change some chars to unsigned
* 0.2c  2-Mar-93 AB Incorporate Bill's work from his 0.2a
* 0.2d  2-Mar-93 AB Allow for nl or tab after marker
* 0.2h  1-Mar-95 BJY Put in fix that allows rules to be made for multiple source and target words
* 0.2k 15-Jun-95 BJY Add ability to read AMPLE command file and thence parse the
*                     code table to get the noload marker(s)
* 0.2m 28-Nov-95 BJY Port to 386 compiler
*		21-Sep-98 jdh convert references to errlogfile to errlogfile,
*						so this code can work with DLLs
* MAR 18 1999 JDH Switched to list of FILES instead of one Dict or .cmd file choices
* 0.2v 20-Oct-2000 rde LexTrans wasn't allowing *just* category
*                      changing. When only '-p' replace categories
*                      is selected, the rule file was processing
*                      as having no rules (due to an invalid for
*                      loop test).
* 0.2v 25-Oct-2000 hab Fix bug which did not set fromhead->next and
*                      tohead->next pointers to null after their content was
*                      freed.
* 0.2w 28-Mar-2001 hab Fix bugs which did not manage memory properly for
*                      properties in rules.
*-----------------------------------------------------------*/

#include "lextrans.h"
#include <assert.h>

static int myisspace( char c );
static char *nextwd( char *s );
static char *getcline( char *line, int maxline, FILE *file );
static void makerule( unsigned char *from, unsigned char *to, unsigned char *cat, ListCharPtr* pPropList );
static int marker( char *mark, char *line, int marklen );
static FILE *next_rootfile( FILE *cmdfile );
static int read_codetab( FILE *cmdfile );

extern FILE* logfile;
extern FILE* errlogfile;

#ifndef hab02w
extern void FreeRuleProps( ListCharPtr * pList );
ListCharPtr* newCharItem();
#endif /* hab02w */

extern int do_debug;
extern int reccount;     /* Records seen */
extern int rulecount;    /* Rules made */

extern char comment_char;

int error_seen = FALSE;         /* Note an error was seen */
#ifdef NOTUSED
static int rule_eofseen = FALSE;  /* Saw eof last time */

static char whitechs[] = " \t\n"; /* Whitespace chars */
#endif
static Rule **hash;            /* Hash table for rules */

struct SLIST {  /* linked list of strings */
	char *str;  /* 0.2h BJY */
	struct SLIST *next;
};

struct SLIST *noloads = NULL;   /* list of noload markers (normally just one) 0.2k BJY */

/**************************************************************/
#ifdef CSTUDIODLL
void prepareLexRuleGlobals()
{;
	error_seen = FALSE;
	hash=0;
}
#endif


/**************************************************************
 * NAME
 *      new_word
 * ARGS
 *      word - pointer to word to add to source or target list
 *      list - address of pointer to word list to add to
 * DESCR
 *      Add a word to the source or target list for the
 *       dictionary record currently being read.
 *      NOTE: The "list" will normally only have one entry.
 *      The list will have multiple entries only when the current
 *       dictionary record has multiple source or target definitions.
 * RETRN
 *      none
 *
 * Function added 3/95 0.2h BJY to fix the problem of LEXTRANS only
 *  making a rule for the last source and target entries in a
 *  given dictionary record.
 */
void new_word( char *word, struct SLIST **pplist)
{
struct SLIST *new;
struct SLIST *plist = *pplist;

if (!*plist->str)     /* If this is the first word for this record */
	{                   /*  just copy it into first element in the list */
	strcpy( plist->str, word);    /* This way we normally don't need */
	plist->next = NULL;         /* to allocate any memory. */
	}
else
	{                   /* handle additional source or target words */
	new = myalloc(sizeof(struct SLIST)); /* allocate another element */
	new->str = myalloc( strlen(word)+1);
	strcpy( new->str, word);
	new->next = NULL;
	plist->next = new;      /* append to list */
	*pplist = plist->next;      /* advance list */
	}
}

#ifndef hab02w
/**************************************************************
 * NAME
 *      CopyPropList
 * ARGS
 *      pPropList - head of list to copy
 * DESCR
 *      make a copy of a property list, maintaining the same order
 * RETRN
 *      pointer to head of new copy
 */
ListCharPtr * CopyPropList(ListCharPtr * pPropList)
{
  ListCharPtr * pList;		/* pointer to existing list */
  ListCharPtr * pListHead;	/* head of new list */
  ListCharPtr * pListNew;	/* newly created list element */
  ListCharPtr * pListLast;	/* last element created */

  pListHead = NULL;
  pListLast = NULL;
  pList = pPropList;
  while (pList)
	{
	  pListNew = newCharItem();
	  pListNew->name = mystrdup(pList->name);
	  if (!pListHead)
	pListHead = pListNew;	/* this is the head of the list */
	  else
	pListLast->next = pListNew; /* link in the new element */
	  pListLast = pListNew;	/* remember last */
	  pList = pList->next;
	}
  return pListHead;
}
#endif /* hab02w */

/**************************************************************
 * NAME
 *      makerules
 * ARGS
 *      fromhead - start of source word list
 *      tohead   - start of target word list
 *      cat      - string containing category
 *      noload   - if TRUE, don't generate rules from this entry
 * DESCR
 *      make a rule for each target word combined with each
 *       source word for the current dictionary record.
 * RETRN
 *      none
 *
 * Function added 3/95 0.2h BJY to fix the problem of LEXTRANS only
 *  making a rule for the last source and target entries in a
 *  given dictionary record.
 */
void makerules( struct SLIST *fromhead, struct SLIST *tohead, char *cat, ListCharPtr* pPropList, int noload)
{
struct SLIST *from, *to, *next;
#ifndef hab02w
int iCount;
#endif /* hab02w */

#ifndef rde02v
if ( !noload && *fromhead->str && (*tohead->str || cat) )   /* 20-10-2000 rde   include if just cat is present also */
#else  /* red02v */
if ( !noload && *fromhead->str && *tohead->str )    /* 0.2k BJY  don't generate rules if */
														/* noload TRUE or no source or target word */
#endif /* rde02v */
	{                                               /* noload TRUE or no source or target word */
#ifndef hab02w
	iCount = 0;			/* initialize rule count for this record */
#endif /* hab02w */
	from = fromhead;    /* start at beginning of list */
	do
		{
		to = tohead;
		do              /* make a rule for each target and source combination */
			{
#ifndef hab02w
		if (iCount++)
		  { /* make a copy because we will need to free each and
		   every rule later on */
		pPropList = CopyPropList(pPropList);
		  }
#endif /* hab02w */
			makerule( (unsigned char *)from->str,
			  (unsigned char *)to->str,
			  (unsigned char *)cat,
			  pPropList );
			} while ((to = to->next));    /* step through target list */
		} while ((from = from->next));    /* step through source list */
	}

if ( *fromhead->str )               /* don't free empty list  0.2k BJY */
	{
	for (from = fromhead->next; from; from = next)
		{
		next = from->next;          /* free up memory allocated for word list */
		myfree( from->str );        /* NOTE: first element does not get freed */
		myfree( from );
		}
#ifndef hab02v
	fromhead->next = NULL;	/* insure head link is null now that the
				   contents have been freed */
#endif /* hab02v */
	}
#ifndef hab02w
else
  {				/* there really isn't a rule after all */
	FreeRuleProps(pPropList);	/* free any morpheme properties */
  }
#endif /* hab02w */

if ( *tohead->str )                 /* don't free empty list  0.2k BJY */
	{
	for (to = tohead->next; to; to = next)
		{
		next = to->next;            /* free up memory allocated for word list */
		myfree( to->str );          /* NOTE: first element does not get freed */
		myfree( to );
		}
#ifndef hab02v
	tohead->next = NULL;	/* insure head link is null now that the
				   contents have been freed */
#endif /* hab02v */
	}
}


/**************************************************************
 * NAME
 *      loadrules
 * ARGS
 *      ppszDictFILEArray an array of FILE pointers
 * DESCR
 *      Load file(s) of rules into the structures.
 * RETRN
 *      Rules, NULL if no file or error.
 */
Rule **loadrules(FILE** ppszDictFILEArray, int nNumDicts)
{
int i=0;
int iDict=0;
FILE *infile;           /* current dict file being read  0.2k BJY */
unsigned char cat[100];          /* Change to */
unsigned char *wd;               /* Temp word pointer */
unsigned char *pucTmp;
int rmarklen, smarklen, tmarklen, cmarklen, pmarklen; /* Lengths of marks */

struct SLIST *tohead;   /* head of target list */
struct SLIST *fromhead; /* head of source list */
struct SLIST *to;       /* 0.2h BJY */
struct SLIST *from;
struct SLIST *pnl;      /* 0.2k BJY */
ListCharPtr* pPropList = NULL; /* 0.2o RNE */
int noload = FALSE;


hash = myalloc( 256 * sizeof(Rule *) );     /* Allocate hash table */
for ( i = 0; i < 256; i++ )                 /* Clear hash table */
	hash[i] = NULL;

rmarklen = strlen( recmark );               /* Find length of it */
smarklen = strlen( sourcemark );              /* Find length of source mark */
tmarklen = strlen( targetmark );               /* Find length of target mark */
cmarklen = strlen( catmark );               /* Find length of cat mark */
pmarklen = strlen( propmark );               /* Find length of property mark */

if ( do_debug )
	{
	fprintf(logfile,  "Rec marker is: \"%s\", length: %d\n", recmark, rmarklen );
	fprintf(logfile,  "Src marker is: \"%s\", length: %d\n", sourcemark, smarklen );
	fprintf(logfile,  "Tar marker is: \"%s\", length: %d\n", targetmark, tmarklen );
	fprintf(logfile,  "Cat marker is: \"%s\", length: %d\n", catmark, cmarklen );
	fprintf(logfile,  "Prop marker is: \"%s\", length: %d\n", propmark, pmarklen );
	}

	/* 0.2h BJY */
tohead = myalloc( sizeof(struct SLIST));    /* allocate space for first word only once */
tohead->str = myalloc(100);
fromhead = myalloc( sizeof(struct SLIST));  /* allocate space for first word only once */
fromhead->str = myalloc(100);
to = tohead;
from = fromhead;
*fromhead->str = *tohead->str = *cat = '\0';    /* prepare for first word */

#ifndef rde02v
/* 20-10-2000 rde
 * don't assume the next pointer is 0 (in makerules, the next value of 0
 * is used to stop the loop). Explicitly make them null here before
 * checking. */
fromhead->next = tohead->next = NULL;
#endif /* rde02v */

assert(ppszDictFILEArray);
for(iDict=0; iDict< nNumDicts; iDict++)
{
	assert(ppszDictFILEArray[iDict]);
	infile = ppszDictFILEArray[iDict];

	while ( getcline( line, MAXLINE, infile ) ) /* While a line */
		{
		for ( pnl = noloads; pnl; pnl = pnl->next ) /* Is this a noload marker?  0.2k BJY */
			{
			if ( marker( pnl->str, line, strlen( pnl->str ) ) )
				noload = TRUE;                      /* this IS a noload marker! */
			}

		if ( marker( recmark, line, rmarklen ) )  /* If record line */
			{
			makerules( fromhead,
			   tohead,
			   (char *)cat,
			   pPropList,
			   noload );   /* Save change(s) */
			pPropList = NULL;
			to = tohead;
			from = fromhead;
			*fromhead->str = *tohead->str = *cat = '\0';  /* Get ready for next record */
			if ( !noload )
				reccount++;
			noload = FALSE;                 /* reset flag 0.2k BJY */
			}

		if ( marker( sourcemark, line, smarklen ) )  /* If source line */
			{
			wd = (unsigned char *)nextwd( line );            /* Find word after marker */
			nextwd( (char *)wd );                   /* Cut off space or nl after word */
			new_word( (char *)wd, &from );          /* add word to source list */
			}

		if ( marker( targetmark, line, tmarklen ) )  /* If target line */
			{
			wd = (unsigned char *)nextwd( line );            /* Find word after marker */
			nextwd( (char *)wd );                   /* Cut off space or nl after word */
			new_word( (char *)wd, &to );            /* add word to target list */
			}

		if ( marker( catmark, line, cmarklen ) )  /* If cat line */
			{
			wd = (unsigned char *)nextwd( line );            /* Find word after marker */
			nextwd( (char *)wd );                   /* Cut off space or nl after word */
			strcpy( (char *)cat, (char *)wd );              /* Load cat */
			}

		if ( marker( propmark, line, pmarklen ) )  /* If property line */
			{
			wd = (unsigned char *)nextwd( line );            /* Find word after marker */
			/* Eliminate any newlines or comments. */
			for (pucTmp = wd; *pucTmp; pucTmp++)
				{
				if (*pucTmp == '\n')
					*pucTmp = ' ';
				if (*pucTmp == '|')
					{
					*pucTmp = '\x0';
					break;
					}
				}
			/* Build the properties list. */
			BuildMorphPropertyList(&pPropList, (char *)wd);

			nextwd( (char *)wd );                   /* Cut off space or nl after word */
			/* strcpy( prop, wd ); */             /* Load property */
			}

		}
	fclose( infile );                       /* done with this file */
}

makerules( fromhead, tohead, (char *)cat, pPropList, noload ); /* Save change(s) */

myfree( tohead->str);       /* 0.2h BJY */
myfree( tohead);
myfree( fromhead->str);
myfree( fromhead);
return( hash );
}



/**************************************************************
 * NAME
 *      next_rootfile
 * ARGS
 *      cmdfile - file pointer to AMPLE command file
 * DESCR
 *      Try to open the next root dictionary file
 *        specified in the command file
 * RETRN
 *      file pointer to fresh dictionary file or NULL
 *
 * Function added 6/95 0.2k BJY
 */
FILE *next_rootfile( FILE *cmdfile )
{
FILE *fp;

if ( !fgets( line, MAXLINE, cmdfile ) )     /* read Code Table filename */
	{
	fprintf( stdout, "Error: Incomplete command file\n" );
	return( NULL );
	}
line[strlen(line)-1] = '\0';            /* cut off CR */
if ( !line[0] )
	return( NULL );                     /* no more root dictionaries specified */
fp = fopen( line, "r" );                /* Open root dictionary file */
if ( !fp )                              /* If not found */
	{
	fprintf( stdout, "Error: Dictionary file %s not found\n", line );
	return( NULL );
	}
return( fp );                           /* root dictionary opened successfully */
}



/**************************************************************
 * NAME
 *      read_codetab
 * ARGS
 *      cmdfile - file pointer to AMPLE command file
 * DESCR
 *      Parse the AMPLE code table for noload marker info and
 *        so we know which dictionary files to expect in the
 *        command file. (prefix, infix, etc.)
 *      Exit with the file position of cmdfile at the first
 *        root dictionary filename.
 * RETRN
 *      TRUE if nothing bad happens
 *
 * Function added 6/95 0.2k BJY
 */
int read_codetab( FILE *cmdfile )
{
int in_root = 0;    /* TRUE, if \root was last dictionary marker found */
int dic_count = 0;  /* count of affix dictionaries in command file */
struct SLIST *new;  /* used to add a marker to the list of noload markers */
char *p, *marker;
FILE *ctabfp;       /* file pointer for code table file */
char fname[100];    /* to hold name of code table file */

if ( !fgets( line, MAXLINE, cmdfile ) ||        /* skip AD CTL file */
	 !fgets( fname, sizeof(fname), cmdfile ) || /* read Code Table filename */
	 !fgets( line, MAXLINE, cmdfile ) )         /* then skip ORDC.TAB file */
	{
	fprintf( stdout, "Error: Incomplete command file\n" );
	return( FALSE );
	}
fname[strlen(fname)-1] = '\0';          /* cut off CR */
ctabfp = fopen( fname, "r" );           /* Open code table file */
if ( !ctabfp )                          /* If not found */
	{
	fprintf( stdout, "Error: Code table file %s not found\n", fname );
	return( FALSE );
	}

while ( fgets( line, MAXLINE, ctabfp ) )        /* read code table */
	{
	if ( in_root && ( p = strstr( line, "\\ch" ) ) )  /* see if this is a noload spec */
		{
		p = skipwhite( p+3 );                   /* should be at delimiter now */
		if ( !*p )
			continue;
		marker = ++p;                           /* remember start of marker text */
		p = nextwd( p );                        /* find code associated with this marker */
		if ( *(p+1) == '!' )                    /* was this a noload marker? */
			{
			marker[strlen(marker)-1] = '\0';    /* trash delimiter at end of marker */
			new = myalloc(sizeof(struct SLIST)); /* allocate another element */
			new->str = mystrdup( marker );      /* add this one to list */
			new->next = noloads;                /* link at front of list */
			noloads = new;
			}
		}
	else if ( strstr( line, "\\root" ) )        /* root area of code table */
		{
		in_root = TRUE;
		}
	else if ( strstr( line, "\\prefix" ) ||
			  strstr( line, "\\infix" ) ||
			  strstr( line, "\\suffix" ) )
		{
		in_root = FALSE;                        /* not in root area anymore */
		dic_count++;                            /* another affix dictionary */
		}
	}
fclose( ctabfp );                               /* done with code table */

while ( dic_count-- )                           /* skip past affix dictionary filenames */
	{
	if ( !fgets( line, MAXLINE, cmdfile ) )     /* read code table */
		{
		fprintf( stdout, "Error: Root dictionary not found in command file\n" );
		return( FALSE );
		}
	}
return( TRUE );
}


/**************************************************************
 * NAME
 *      marker
 * ARGS
 *      mark - marker to look for
 *      line - line to look at
 *      marklen - length of marker
 * DESCR
 *      Look at front of line for backslash marker
 * RETRN
 *      TRUE if mark found, FALSE if not
 */
int marker( char *mark, char *line, int marklen )
{
if ( !strncmp( mark, line, marklen ) && myisspace( *(line + marklen) ) )
	return( TRUE );
else
	return( FALSE );
}


/**************************************************************
 * NAME
 *      makerule
 * ARGS
 *      from - change from
 *      to - change to
 * DESCR
 *      Make a new rule structure.
 * RETRN
 *      None
 */
void makerule( unsigned char *from, unsigned char *to, unsigned char *cat, ListCharPtr* pPropList )
{
Rule *t;
Rule *h;
int matchequal;                     /* duplicate detected */

if ( !*from || ( !*to && !*cat ) )  /* If pieces missing, don't make rule */
	return;

rulecount++;                        /* Count rules made */

									/* Make new rule */
t = newrule();
t->match = mystrdup( (char *)from + 1 );    /* Skip first char for hash */
t->repl = mystrdup( (char *)to );
t->cat = mystrdup( (char *)cat );
t->lstProps = pPropList;

							/* Load rule into hash table */
if ( !hash[ *from ] )               /* If hash entry of letter is null */
	hash[ *from ] = t;              /* Point hash to new rule */
else
	{
	h = hash[ *from ];
	if ( strcmp( t->match, h->match ) < 0 ) /* If lower than first */
		{
		t->next = h;                /* Link before first */
		hash[ *from ] = t;
		}
	else
		{                           /* Find alphabetical place */
		while ( h->next && strcmp( t->match, h->next->match ) >= 0 )
			h = h->next;
		matchequal = streq( t->match, h->match );
		if ( matchequal && streq( t->repl, h->repl ) )
	{
			fprintf(logfile,  "Skipping duplicate rule %s -> %s\n",
					from, t->repl );
		myfree(t->match);  /* hab 0.2r need to free rule */
		myfree(t->repl);
		myfree(t->cat);
#ifndef hab02w
		FreeRuleProps(t->lstProps);
#else
		myfree(t->lstProps);
#endif /* hab02w */
		myfree(t);
	}
		else
			{
			if ( matchequal )
				fprintf(logfile,  "Duplicate match: %s -> %s, %s\n",
						from, t->repl, h->repl );
			t->next = h->next;          /* Link in place */
			h->next = t;
			}
		}
	}
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
t->match = NULL;
t->repl = NULL;
#ifndef rde02v
t->cat = NULL;      /* 20-10-2000 rde   probably unnecessary, but since we're initializing the
			   fields here, might as well do them all... (previously cat wasn't being null'd out) */
#endif /* rde02v */
t->lstProps = NULL;
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
void error_msg( char *msg )
{
											/* Line ends with nl */
fprintf( errlogfile, "\nError: %s\n%s", msg, line );
error_seen = TRUE;
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
static char *nextwd( char *s )
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
 *      dumprules
 * Dump rules for debug
 */
void dumprules( void )
{
Rule *ru;
int i;

for ( i = 0; i < 256; i++ )
	if ( hash[ i ] )
		{
		fprintf(logfile,  "Hash of %c\n", i );
		for ( ru = hash[ i ]; ru; ru = ru->next )
			fprintf(logfile,  "  Rule from: %c%s to: %s\n", i, ru->match, ru->repl );
		}
fprintf(logfile,  "\n" );
}


/**************************************************************
 * NAME
 *      disprule
 * Display rule for trace
 */
void disprule( Rule *ru )
{

fprintf(logfile,  "Rule from: %s to: %s\n", ru->match, ru->repl );
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
static int myisspace( char c )
{

if ( c == ' ' || c == '\n' || c == '\t' )
	return( TRUE );
else
	return( FALSE );
}


/**********************************************************************
 * NAME
 *      getcline
 * ARGS
 *      Same as fgets.
 * DESCR
 *      Read a line and cut off comments and nl.
 * RETRN
 *      Line if success, NULL at EOF.
 *      Also, line is returned in first argument.
 */
static char *getcline( char *line, int maxline, FILE *file )
{
char *s;

if ( fgets( line, maxline, file ) )     /* If a line */
	{
	if ( ( s = strchr( line, comment_char ) ) ) /* If comment on end of line */
		*s = '\0';                      /* Cut it off */
	else                                /* Else cut off nl */
		*( line + strlen( line ) - 1 ) = '\0';
	return( line );                     /* Return success */
	}
else                                    /* Else (EOF) */
	return( NULL );                     /* Return NULL */
}
