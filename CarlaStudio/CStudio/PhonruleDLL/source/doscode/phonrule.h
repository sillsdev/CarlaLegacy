/* phonrule.h  Phonological Rule data structures  Alan B  9 Sep 91 */
/*------------------------------------------------------------
*
* Structures:
*   Rule                   Rule structure
*   Str                    String list for category names, etc
*   Scl                    String class
*
*-----------------------------------------------------------*/

#include <stdio.h>              /* Include standard lib prototypes */
#include <string.h>
#include <stdlib.h>

#include "myallo.h"             /* Include myallo prototypes */

								/* Define TRUE and FALSE */
	/*--------------------------------------------------------------------
	* The following are convenient aliases for TRUE, FALSE,
	* and string equal.
	*-------------------------------------------------------------------*/
#define TRUE 1
#define FALSE 0
#define streq !strcmp

/* Allocate memory for a specified struct */
#define structalloc(x) (struct x *) myalloc( sizeof(struct x) )
#define Structalloc(x) (x *) myalloc( sizeof(x) )


#define MAXLINE 500

/*-------------------------------------------------------------------
* The data structures in this file all use defines of the form:
*
*   #define Grammar struct gramstruct
*
* These defines are supposed to make later code more readable
*   by simplifying constructs such as:
*
*   struct gramstruct *gram1;           ->    Grammar *gram1;
*   malloc(sizeof(struct gramstruct))   ->    malloc(sizeof(Grammar))
*
* An upper case first letter is used to distinguish these structure
*   names from variables.
*------------------------------------------------------------------*/

#define Rule struct rulestruct
#define Str struct strstruct
#define Scl struct sclstruct
#define Allo struct allostruct

/*-------------------------------------------------------------------
*
*   Picture of Rule
*
*  Rule(s)
* |---|---|-----|---|---|---|
* | ->| 1 |   ->| ->| 1 | ->|
* |   |   |     |   |   |   |
* match,len,repl,env,beg,cat
*
*------------------------------------------------------------------*/

Rule {                  /* Rule structure */
	char *match;        /* Match */
	int matlen;         /* Match length */
	char *repl;         /* Replace */
	char *envir;        /* Environment to put out */
	int begin;          /* Apply to begin or end */
	int base;           /* Base rules generate a new base */
	char *cat;          /* Categories to apply to */
	Rule *next;         /* Link to next rule */
	};

Str {                   /* String list for category names, etc */
	char *name;         /* String */
	Str *next;          /* Link to next */
	};

Allo {                  /* Allo list */
	char *name;         /* String */
	int ruletype;       /* type of rule used to generate this allo */
	Allo *next;         /* Link to next */
	};

Scl {                   /* String class */
	char *name;         /* Class name */
	Str *class;         /* Members of class */
	Scl *next;          /* Link to next */
	};

/* Prototypes */
int getopt( int argc, char **argv, char *opts );
int myisspace( char c );
Rule *loadrules( FILE *rulefile );
Rule *newrule( void );
char *applyrules( Rule *rules, char *ent );
void initent(FILE *infile);
char *loadent( FILE *infile, FILE *outfile );
char *newent( void );
Str *new_str( void );
Str *findcat( char *name );
Scl *find_scl( char *s );
Scl *find_ccl( char *s );
void putent( char *ent, FILE *outfile );
char *skipwhite( char *s );
char *nextwd( char *s );
void error_msg( char *msg );
void dumprules( Rule *ru );
void dumpcats( Str *cat );
void disprule( Rule *ru );
void dump_classes( void );
