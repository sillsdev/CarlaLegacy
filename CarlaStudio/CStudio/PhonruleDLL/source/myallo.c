/*      MYALLO.C - "safe" memory allocation functions
 ***************************************************************************
 *
 *      void *myalloc(size)
 *      unsigned size;
 *
 *      void *myrealloc(ptr, size)
 *      void *ptr;
 *      unsigned size;
 *
 *      void myfree(s)
 *      void *s;
 *
 *      char *mystrdup(str)
 *      char *str;
 *
 *      char *mystrappend( char *t, char *s )
 *
 *      void *mytalloc(region)
 *      unsigned region;
 *
 *      void mytfree( reg_bot )
 *      void *reg_bot;
 *
 ***************************************************************************
 *      EDIT HISTORY
 *      28-Jul-88       Steve McConnel - to replace ssutl.c
 *       1-Aug-88       SRMc - delinted
 *      25-Aug-88       SRMc - regularized error messages
 *                           - change errmsg to errloc
 *      21-Oct-88       SRMc - remove register from function parameter
 *                              declarations
 *                           - reorganize the file header comments
 *      10-Nov-88       SRMc - add myfree()
 *       4-Jan-89       SRMc - fix for Microsoft C
 *      22-Mar-89       SRMc - nomem() is no longer a static function
 *      20-May-89       SRMc - remove #include "dict.h"
 *                           - change errloc to 101 rather than MAXMORPH+1
 *                              bytes long (removed need for defs.h)
 *                           - rename errloc to myalloc_errmsg
 *                           - added mystrdup(),
 *                           - removed reliance on errexit()
 *      13-Jul-89       hab  - de-"lint" the source
 *      31-Jul-89       rk   - mods for MacIntosh Lightspeed's Think_C
 *      07-Aug-89       ab/hab - rename myrealloc() to myshrink();
 *                               add myrealloc()
 *      04-Jan-90       ab   - add comment on myrealloc() to top of file
 * Parse versions:
 * 0.7a 14-May-90 AB Add mytalloc and mytfree to free feature structs
 * 0.8k 26-Jun-90 BK Fix for MAC ThinkC compiler, 32 bits
 * 0.9p 10-Jul-90 BK For MAC force myalloc to return even address
 * 1.0n 31-Jul-90 AB Improve mytalloc & mytfree to allow mult regions
 * 1.0q 31-Jul-90 BK Add TEMP_MEM_SIZE to allow different temporary area size on MAC
 * 1.0t  6-Aug-90 AB Protect mytfree from NULL
 * 1.0w  8-Aug-90 AB Remove myshrink, change all to void *
 * 1.0w  8-Aug-90 AB Put prototypes at top and in parse.h
 * Sentrans versions:
 * 0.1  26-Oct 90 AB Change tsize /= 2 to -= 1000 to maximize temp space
 *                   Make myallo.h prototypes and include in sentrans.h
 * 0.4y 20-Nov-91 AB Accept size into mytalloc, force new malloc if given
 * 1.2d 21-Nov-91 BJY Fixed bug of SENTRANS bombing when out of temp memory.
 *                   It now exits gracefully and outputs memory allocation error.
 ***************************************************************************
 * Copyright 1988, 1989 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "myallo.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern FILE* logfile;

#if defined( DLLFunc )
#define exit(x) abort()
#endif

#ifdef THINK_C
#define TEMP_MEM_SIZE 128000
#else
#define TEMP_MEM_SIZE 640000 /* hab 2.0v was 63000 */
#endif

char myalloc_errmsg[101];               /* globally settable by callers */

static int reg_num;                     /* Current temporary region */
char *reg_start;                        /* Start of temp region */
char *reg_end;                          /* End of temp region */
char *reg_cur;                          /* Current pos in temp region */



#ifdef CSTUDIODLL
void prepareMyAllocGlobals()
{
	reg_start = reg_end  = reg_cur = 0;
}
#endif



/***********************************************************************
* myFreeAll
*	added by john hatton because something is'nt freeing itself, and thus
*   there is a memory leak that is noticeable when in a DLL environment
*   where we don't quit after a single run
************************************************************************/
void myFreeAll()
{
	free (reg_start);
	reg_start = NULL;
}


/***************************************************************************
 * NAME
 *    nomem
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Die with an appropriate error message.
 * RETURN VALUE
 *    doesn't return!
 */
static void nomem()
{
if (*myalloc_errmsg)
	fprintf(logfile,"\nALLOCATE MEMORY: No space left at: %s\n",
			myalloc_errmsg);
else
	fprintf(logfile,"\nALLOCATE MEMORY: No space left\n");
exit(2);
}

/***************************************************************************
 * NAME
 *    myalloc
 * ARGUMENTS
 *    size - number of bytes to allocate
 * DESCRIPTION
 *    "Safe" interface to malloc() -- abort the program with an error message
 *    if we run out of memory.
 * RETURN VALUE
 *    pointer to beginning of area allocated
 */
void *myalloc(size)
unsigned size;
{
register char *p = NULL;

if ( reg_num )                          /* If in temp region */
	{
#ifdef MacCADA
	reg_cur += ((unsigned long)reg_cur) & 01L; /* BK: force even address */
#else
#ifdef THINK_C
	reg_cur += ((unsigned long)reg_cur) & 01L; /* BK: force even address */
#endif
#endif                                                            /* 1.2d BJY added casts so compiler does 32 bit math */
	if ( (unsigned long)reg_cur + size > (unsigned long)reg_end ) /* Previously this check didn't work if reg_cur + size > 65535 */
		nomem();                        /* If not enough room */
										/* Give error message and exit */
	else
		{
		p = reg_cur;                    /* Else get current spot */
		reg_cur += size;                /* Set current to above space */
		return( p );                    /* Return current spot */
		}
	}
else                                    /* Else (permanent) */
	{
	p = malloc(size);                   /* Do normal malloc */
	if (p == (char *)NULL)              /* If no room */
		nomem();                        /* Give error message and exit */
	else
		return(p);                      /* Else return space */
	}
 return p;	/* should never reach here */
}

/***************************************************************************
 * NAME
 *    myrealloc
 * ARGUMENTS
 *    ptr  - pointer to block of memory to be reallocated
 *    size - number of bytes to allocate
 * DESCRIPTION
 *    "Safe" interface to realloc() -- abort the program with an error message
 *    if we run out of memory.
 * RETURN VALUE
 *    pointer to beginning of area allocated
 */
void *myrealloc(ptr, size)
void *ptr;
unsigned size;
{
register char *p;

if ( reg_num )                      /* If in temp region */
	{
	p = myalloc( size );            /* Malloc new space */
	memcpy( p, ptr, size );        /* Move data to it */
	return( p );                    /* Return new place */
	}

p = realloc(ptr, size);
if (p == (char *)NULL)
	nomem();
return(p);
}

/***************************************************************************
 * NAME
 *    mystrdup
 * ARGUMENTS
 *    str - pointer to character string to duplicate
 * DESCRIPTION
 *    Create a duplicate of an existing NUL-terminated character string.
 * RETURN VALUE
 *    pointer to the newly allocated and copied duplicate
 */
char *mystrdup(str)
char *str;
{
return( strcpy(myalloc((unsigned)strlen(str)+1), str) );
}

/***************************************************************************
 * NAME
 *    mystrappend
 * ARGUMENTS
 *    t - string to append onto
 *    s - string to append
 * DESCRIPTION
 *    Realloc t in a larger space and append s.
 * RETURN VALUE
 *    pointer to the appended combination
 */
char *mystrappend( char *t, char *s )
{
char *stemp;            /* Temp string pointer */

stemp = myalloc( strlen( t ) + strlen( s ) + 1 );   /* Get space */
strcpy( stemp, t );                         /* Copy t */
strcat( stemp, s );                         /* Append s */
return( stemp );
}


/***************************************************************************
 * NAME
 *    myfree
 * ARGUMENTS
 *    s - pointer to block to deallocate
 * DESCRIPTION
 *    interface to free() -- release previously allocated memory
 * RETURN VALUE
 *    none
 */
void myfree(s)
void *s;
{
if ( reg_num )                          /* If in temp region */
	return;                             /* Don't do anything */

if (s == (char *)NULL)
	return;             /* protect against braindead callers */
free(s);
}


/***************************************************************************
 * NAME
 *    mytalloc
 * ARGUMENTS
 *    region - Sets temp alloc on if TRUE, off if FALSE;
 *              If region is > 10, makes a new region of size region.
 *              Otherwise, if existing region, uses it.
 * DESCRIPTION
 *    Set to temporary allocation region.  0 sets to permanent.
 *    Typical calling sequence is:
 *      long_term_data_bot = mytalloc( 1 );
 *          All myallocs from here on go up from long_term_data_bot.
 *      dummy = mytalloc( 0 );
 *          This is an optional switch from temporary to permanent.
 *          All myallocs from here on do true malloc.
 *      short_term_data_bot = mytalloc( 1 );
 *          All myallocs from here on go up from short_term_data_bot.
 *      mytfree( short_term_data_bot );
 *          This frees short term data, but leaves long term.
 *      mytfree( long_term_data_bot );
 *          This frees long term data.
 * RETURN VALUE
 *    Bottom of region allocated.  Used in calls to mytfree to reset.
 */
void *mytalloc(region)
unsigned region;
{
unsigned int tsize;         /* Temp size */

reg_num = region;                   /* Set region on or off */

if ( region > 10 )                  /* If size given, allocate */
	{
	tsize = region;
	reg_start = malloc( tsize );    /* Get space */
	if ( !reg_start )               /* If malloc failed */
		{
	fprintf( logfile, "Not enough memory to run program\n" );
		exit(2);
		}
	reg_end = reg_start + tsize;    /* Remember end */
	reg_cur = reg_start;            /* Set current to start */
	}
else if ( !reg_start )              /* If no region allocated, get one */
	{
	tsize = TEMP_MEM_SIZE;
	reg_start = malloc( tsize );    /* Get a big space */
	while ( !reg_start && tsize > 1000 ) /* If it fails */
		{
		tsize -= 1000;              /* Try smaller */
		reg_start = malloc( tsize );    /* Get space */
		}
	reg_end = reg_start + tsize;    /* Remember end */
	reg_cur = reg_start;            /* Set current to start */
	}
return( reg_cur );                  /* Return next spot */
}



/***************************************************************************
 * NAME
 *    mytfree
 * ARGUMENTS
 *    reg_bot - Bottom of region to free.
 * DESCRIPTION
 *    Free a temporary region.  Set pointer to reg_bot.
 * RETURN VALUE
 *    none
 */
void mytfree( reg_bot )
void *reg_bot;
{
if ( !reg_bot )             /* Protect against NULL */
	return;
reg_cur = reg_bot;          /* Set current to bottom */
}
