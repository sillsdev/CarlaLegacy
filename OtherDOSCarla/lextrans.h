/* lextrans.h  Transfer data structures  Alan B  25 Oct 90 */
/*------------------------------------------------------------
*
* Structures:
*   Word        One word of sentence
*   Ambig       One ambiguity of word
*   Morph       One morpheme of one ambiguity
*
*-----------------------------------------------------------*/
/*------------------------------------------------------------
* Change history:
* 0.1  29-Sep-92 AB Brought over from sentrans 1.0f
*	18-May-99 JDH added some fn prototypes
* 0.2t 05-Jul-2000 hab Pass on \u field
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


#ifndef hab02s
#define MAXLINE 10000
#else
#define MAXLINE 2000
#endif /* hab02s */

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

#define Word struct wordstruct
#define Ambig struct ambigstruct
#define Morph struct morphstruct
#define Rule struct rulestruct
#define ListCharPtr struct listcharptrstruct


ListCharPtr {                   /* Items (of char*) list */
			char *name;         /* Item name */
			ListCharPtr *next;          /* Link to next */
			};


Word {                  /* Word structure */
	unsigned char *name;         /* Word name */
	char *format;       /* Word formatting */
	char *cap;          /* Word capitalization */
	char *punc;         /* Punctuation after word */
#ifndef hab02t
	char *underForm;	/* Underlying form */
#endif /* hab02t */
	int numamb;         /* Number of ambigs */
	int bHasProps;		/* TRUE (nonzero) if word has properties */
	Ambig *ambigs;      /* Ambigs of word */
	Word *prev;         /* Link to prev word */
	Word *next;         /* Link to next word */
	};

Ambig {                 /* Ambig structure */
	Morph *morphs;      /* Morphemes of this ambig */
	char *decomp;       /* Decomposition of word */
	char *cat;          /* Category of word for this ambig */
	char *feat;         /* Features for this ambig */
	int matched;        /* Flag for matched */
	Ambig *prev;        /* Link to prev ambig */
	Ambig *next;        /* Link to next ambig */
	};

Morph {                 /* Morph structure */
	unsigned char *name;         /* Morpheme name */
	unsigned int type;  /* Morpheme type: PFX, RT, SFX */
	char *cat;          /* Cat if root */
	int numchange;      /* Number of change applied */
	ListCharPtr*	lstProps;	/* List of properties */
	Morph *next;        /* Link to prev morpheme */
	Morph *prev;        /* Link to next morpheme */
	};




#define PFX  0x1
#define RT   0x202      /* First root or compound root */
#define SFX  0x4
#define CR   0x200

/*-------------------------------------------------------------------
*
*   Picture of Sentence
*
*  Word(s)                        Ambig(s)             Morph(s)
* |---|---|---|---|---|---|      |---|---|---|---|---|    |---|---|---|
* |ab |\p | 2 | , | 1 | -------->|a-b| V |pl | T | ------>|a  |pf | 0 |
* |   |   |   |   |   |   |      |   |   |   |   |   |    |b  |rt | V |
* name,fmt,cap,punc,numa,ambigs  dec,cat,feat,mat,morphs  name,type,cat
*
*   Picture of Rules
*
*  Rule**   Rule(s)
* |---|    |---|---|---|
* | ------>|   |   |   |
* |   |    |   |   |   |
*  hash   match,repl,cat
*
*------------------------------------------------------------------*/

Rule {                  /* Rule structure */
	char *match;        /* Match */
	char *repl;         /* Replace */
	char *cat;      /* Category */
	ListCharPtr*	lstProps;	/* List of properties */
	Rule *next;         /* Link to next rule */
	};

/* Prototypes */
int getopt( int argc, char **argv, char *opts );
#ifdef CSTUDIODLL
Rule **loadrules(FILE** ppszDictFILEArray, int nNumDicts);
#else
Rule **loadrules( FILE *dicfile, FILE *cmdfile );
#endif
Rule *newrule( void );
Word *applyrules( Rule **rules, Word *sent );
Word *loadsent( FILE *infile );
Word *newword( void );
Ambig *newambig( void );
Morph *newmorph( void );
void BuildMorphPropertyList(ListCharPtr** ppMorphList, char* pszLstProp);
void putsent( Word *sent, FILE *outfile );
char *skipwhite( char *s );
void error_msg( char *msg );
void dumprules( void );
void disprule( Rule *ru );

void prepareLexSentGlobals(void);
void prepareLexRuleGlobals(void);

/* These definitions to header file added 3/95 0.2h BJY for compiler happiness */
extern char recmark[10];            /* Mark of record in dic */
extern char sourcemark[10];         /* Mark of source form in dic */
extern char targetmark[10];         /* Mark of target form in dic */
extern char catmark[10];            /* Mark of cat in dic */
extern char propmark[10];			/* Mark of properties (morpheme) in dic */
extern char line[MAXLINE];          /* Last input line from last call */
