/* loadent.c  Load entry into structure  Alan B  9 Sep 91
*
char *loadent( FILE *infile );
void initent(FILE *infile);
void putent( char *ent, FILE *outfile );

* Change history:
* 0.2l 11-May-95 BJY Require field markers to be at beginning of line
* 0.2q 15-May-95 BJY Don't process noload records
* 0.2s 15-Sep-95 BJY ifdef out noload stuff added in 0.2q and fix bug of
*					base rule firing but not remembering changed base
* 0.2w 05-Dec-2000 hab increase dictionary entry size from 5000 to 50000
*/

#include "phonrule.h"

extern char *recmark;
extern int recmarklen;
extern char *noloadmark;    /* 0.2q BJY */
extern int noloadmarklen;   /* 0.2q BJY */

extern int num_ents;  /* Number of entries processed */
extern int do_debug;

char line[MAXLINE];             /* Last input line from last call */

#ifdef hab02w
#define MAXENT 5000
#else /* hab02w */
#define MAXENT 50000
#endif /* hab02w */

static char *dicent = NULL;     /* Dictionary entry */
static int eofseen = FALSE;     /* Saw eof last time */
static char *endent_max;        /* Max value for entry end */

/**************************************************************
 * NAME
 *      initent
 * ARGS
 *      infile - file to load from
 * DESCR
 *      Initialize entry structure and pass by \id.
 * RETRN
 *      Pointer to entry structure, NULL at eof or error.
 */
void initent(FILE *infile)
{

dicent = myalloc( MAXENT );             /* Allocate entry */

endent_max = dicent + MAXENT - MAXLINE; /* Max for overflow check */

*dicent = '\0';                         /* Init content to null string */
*line = '\0';                           /* Init line to null string */
}


/**************************************************************
 * NAME
 *      loadent
 * ARGS
 *      infile - file to load from
 *      outfile - file to output noload records to
 * DESCR
 *      Load an entry into the structures.
 * RETRN
 *      Pointer to entry structure, NULL at eof or error.
 */
char *loadent( FILE *infile, FILE *outfile )
{
char *endent;       /* End of entry */
int recmark_in;     /* Note record marker already in */
int noload;         /* TRUE if noload marker detected in record 0.2q BJY */

if ( eofseen )                              /* If eof seen last time */
	return( NULL );                         /* Return eof */

endent = dicent;                            /* Init end of entry */
*endent++ = '\n';                           /* 0.2l BJY start record with nl */
*endent = '\0';                             /* Init entry content to null */
recmark_in = FALSE;                         /* Init record mark in */

noload = FALSE;                             /* begin 0.2q BJY */

while ( TRUE )
	{
#ifdef NO_NOLOAD /* 0.2s BJY */
	if ( recmark_in && ( !strncmp( noloadmark, line, noloadmarklen )    /* may be a nl after */
						 && myisspace( *(line+noloadmarklen) ) ) )      /* marker instead of space */
		{
		noload = TRUE;                      /* signal finding a noload record */
		}
#endif
	if ( !strncmp( recmark, line, recmarklen ) ) /* If line is record mark */
		{
		if ( !recmark_in )                  /* If no rec mark in yet */
			recmark_in = TRUE;              /* Remember this one */
#ifdef NO_NOLOAD /* 0.2s BJY */
		else if ( noload )                  /* begin 0.2q BJY */
			{
			fputs( dicent + 1, outfile );   /* output noload record now */
			endent = dicent;                /* reinitialize for new record */
			*endent++ = '\n';               /* 0.2l BJY start record with nl */
			*endent = '\0';
			noload = FALSE;                 /* end 0.2q BJY */
			}
#endif
		else                                /* Else return entry */
			break;
		}

#ifdef JUNK /* Leave Shoebox number line in */
	if ( strncmp( "\\_no", line, 4 ) )      /* If not shoebox number field */
#endif
		{
		strcpy( endent, line );             /* Copy line into entry */
		endent += strlen( line );           /* Update end of entry */
		}

		/*
		*   The following tests for overflow of entry, which should
		*   never happen.  But if it does, the code tries to make
		*   sure the dictionary is not mangled.
		*/
	if ( endent > endent_max )              /* If overflow of entry */
		break;                              /* Return first part */

	if ( !fgets ( line, MAXLINE, infile ) ) /* Get next line */
		{
		eofseen = TRUE;                     /* If none, remember eof */
		if ( recmark_in && noload )         /* begin 0.2q BJY */
			{                               /* don't process the last record */
			fputs( dicent + 1, outfile );   /* output noload record now */
			*(dicent+1) = '\0';             /* return blank record */
			}                               /* end 0.2q BJY */
		break;
		}
	}

return( dicent );
}


/**************************************************************
 * NAME
 *      putent
 * ARGS
 *      ent - entry to output
 *      outfile - file for output
 * DESC
 *      Output fixed dict entry.
 */
void putent( char *ent, FILE *outfile )
{

if ( do_debug )
	fputs( "-------------- Entry:\n", outfile );

fputs( ent, outfile );           /* Output entry */ /* 0.2l BJY */
}
