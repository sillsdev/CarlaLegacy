/* SenTransLib.h  Transfer data structures  Alan B  25 Oct 90 */
/*------------------------------------------------------------
*
* Structures:
*   Word        One word of sentence
*   Ambig       One ambiguity of word
*   Morph       One morpheme of one ambiguity
*
*-----------------------------------------------------------*/

#ifndef _SENTRANSLIB_H_INCLUDED_
#define _SENTRANSLIB_H_INCLUDED_
#ifdef __cplusplus
extern "C" {
#endif

#define ENABLE_REPEAT   1       /* allow + after elements in environment */

#ifdef MacCADA
/*
 * Avoid name conflicts with AMPLE & STAMP functions & variables.
 * (Some probably could be shared.)
 */
#define num_words       sentrans_num_words
#define do_debug        sentrans_do_debug
#define do_trace        sentrans_do_trace
#define do_monitor      sentrans_do_monitor
#define skipwhite       sentrans_skipwhite
#endif

#include <stdio.h>              /* Include standard lib prototypes */
#include <string.h>
#include <stdlib.h>
#ifdef _MSC_VER
#include <io.h>
#endif

typedef struct sentrans_data		SenTransData;

#include "myallo.h"             /* Include myallo prototypes */

#ifdef MacCADA
#include "ConsoleOutput.h"
#endif

extern FILE* pLogFP;
extern FILE* pErrorLogFP;
								/* Define TRUE and FALSE */
	/*--------------------------------------------------------------------
	* The following are convenient aliases for TRUE, FALSE,
	* and string equal.
	*-------------------------------------------------------------------*/
#define TRUE 1
#define FALSE 0
#ifdef Before12w
#define streq !strcmp
#else
extern int streq (const char *s1, const char *s2);
#endif

/* Allocate memory for a specified struct */
#define structalloc(x) (struct x *) myalloc( sizeof(struct x) )
#define Structalloc(x) (x *) myalloc( sizeof(x) )

/* RNE bit flags data type.  Needs 32 bits, so it's unsigned long. */
typedef unsigned long    t_flag;

/* RNE   Rule flag */
typedef unsigned int     t_Rflag;

/* RNE  Word flag */
typedef unsigned int	 t_Wflag;

#define MAXLINE 20000

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
#define MorphList struct morphliststruct /* hab 1.2ze */
#define Pat struct patstruct
#define Class struct clstruct
#define Match struct matchstruct
#define Rule struct rulestruct
#define Envir struct envirstruct
#define Mem struct memstruct

Word {                  /* Word structure */
	char *name;         /* Word name */
	char *cap;          /* Word capitalization */
	t_Wflag type;       /* Word type: WORD, WHSPC, PUNC etc. 1.2a BJY */
	int numamb;         /* Number of ambigs */
	Ambig *ambigs;      /* Ambigs of word */
	Word *prev;         /* Link to prev word */
	Word *next;         /* Link to next word */
	};

Ambig {                 /* Ambig structure */
	Morph *morphs;      /* Morphemes of this ambig */
	char *decomp;       /* Decomposition of word */
	char *uform;            /* Underlying form */
	char *cat;          /* Category of word for this ambig */
	char *icat;         /* Category from input \cat field for this ambig */
	char *feat;         /* Features for this ambig */
	int matched;        /* Flag for matched in main match */
	int ematched;       /* Flag for matched in environment */
	Ambig *prev;        /* Link to prev ambig */
	Ambig *next;        /* Link to next ambig */
	};

Morph {                 /* Morph structure */
	char *name;         /* Morpheme name */
	t_flag type;  /* Morpheme type: PFX, RT, SFX   RNE Was an int */
	char *cat;          /* Cat if root */
	Mem	 *prop;	  /* List of properties for each morpheme. */
	Morph *next;        /* Link to prev morpheme */
	Morph *prev;        /* Link to next morpheme */
	};

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
*   Picture of Rule
*
*  Rule(s)       Match(s)
* |---|---|     |---|---|---|----|----|----|
* | ---> ------>|SUF|ing|REF| -> | -> | -> |
* |   |   |     |   |   |   |    |    |    |
* match,repl    type,str,cat,begwd,endwd,matmp
*                        pat        Word,Morph
*                        cl
*                        ref
*------------------------------------------------------------------*/

Rule {                  /* Rule structure */
	Match *match;       /* Match */
	Match *repl;        /* Replace */
	Envir *env;         /* Environment */
	t_Rflag type;           /* Type  RNE  Rule flags doesn't need to be long*/
	int number;         /* Sequence Number */
	Rule *next;         /* Link to next rule */
	};

#define RU      0x1            /* rule types */
#define AM      0x2
#define REJ     0x4
#define UNANIM  0x8
#define DISABLE 0x10
#define ENDSET  0x20

#define REJUN   ( REJ | UNANIM )
#define AMUN    ( AM  | UNANIM )
#define RULETYPE ( RU | AM | REJ )

#define ALL 3          /* logic values for unanimity computation */
#define SOME 1         /* they are chosen so that bitwise &, | ops work */
#define NONE 0

Envir {                 /* Environment structure */
	Match *envlf;       /* Left environ (points to end) */
	Match *envrt;       /* Right environ */
	char and_env;       /* True if this is ANDed with preceding envs */
	char envneg;        /* True if environ negated */
	Envir *next;        /* Link to next envir */
	};

Pat {                   /* Pattern structure */
	char *name;         /* Name of pattern */
	Match *match;       /* Pattern to match */
	Pat *next;          /* Link to next */
	};

Class {                 /* Class structure */
	char *name;         /* Name of class */
	Mem *mem;           /* Members of class */
	Class *next;        /* Link to next */
	};

Mem {                   /* List of category names and class members */
	char *name;         /* Category name */
	Mem *next;          /* Link to next */
	};


#define PFX     0x00000001
#define RT      0x00000002
#define SFX     0x00000004
#define CAT     0x00000008
#define MCL     0x00000010
#define CCL     0x00000020
#define OPT     0x00000040
#define NOT     0x00000080
#define PLUS    0x00000100
#define CR      0x00000200
#define REF     0x00000400
#define CATREF  0x00000800
#define PUNC    0x00001000
#define BPUNC   0x00002000
#define PAT     0x00004000
#define BOUND   0x00008000
#define PROP	0x00010000	/* Note that this pushes us into using DWORDs*/

#define AFX     ( PFX | SFX | CR )
#define MORPHTYPE ( PFX | SFX | RT | CR )

/* The following values are for the type field in the Word structure 1.2a BJY */
#define WORD    0x1
#define WDPUNC  0x2
#define FROMF   0x4
#define FROMN   0x8
#define WHSPC   0x10
#define HASPROP 0x20
/*#define BOUND   0x8000*/

MorphList {			/* hab 1.2ze */
	Morph *mp;		/* Morph which matched */
	MorphList * next;	/* next member in list */
	};

Match {                 /* Match element structure */
	t_flag type;  /* Flags for type of element */
	char *string;       /* Element string or class */
	char *cat;          /* Cat or class or match reference */
	char *tag;          /* User's tag (^xxx) for the element */
	Word *begwd;        /* Begin word matched */
	Word *endwd;        /* End word matched */
	Morph *matmp;       /* Begin morph matched */
	MorphList *mpList;      /* List of morphs which have matched hab 1.2ze */
	Match *prev;        /* Link to prev match */
	Match *next;        /* Link to next match */
	};

/*****************************************************************************
 * NAME
 *    SenTransData
 * DESCRIPTION
 *    information that controls the SenTrans parsing
 */
struct sentrans_data {
	/*
	 *  information provided directly by the user
	 */
	int  do_ambig_monitor;	/* -a Monitor ambigs output */
	char comment_char;		/* -c Comment character */
	int  do_monitor;		/* -m Monitor progress */
	int  do_trace;		/* -t Output trace info */
	int  do_dumpclass;		/* -v Dump class info to log */
	int  ignore_cat;		/* -x Ignore \cat field in input */
	int  do_debug;		/* -z Output debug info */
	FILE *pLogFP;		/*  > Log file pointer */
	char *rulefname;		/* -r Rule file name */
	/*
	 *  other variables
	 */
	FILE *pRuleFP;		/* pointer to rule file */
	FILE* pErrorLogFP;		/* Error log pointer (for monitoring) */
	int ruletrycount;           /* Number of rules tried */
	int ambigcount;             /* Number of disambiguations performed */
	int ruchgcount;             /* Number of actual changes made */
	int rulecount;              /* Total number of rules in rule file */
	int rejcount;               /* Number of rej rules */
	int amcount;                /* Number of am rules */
	int rejuncount;             /* Number of rejun rules */
	int amuncount;              /* Number of amun rules */
	int rucount;                /* Number of ru rules */
	int rulesoffcount;          /* Number of rulesoff rules */
	int rulesoncount;           /* Number of ruleson rules */
	int num_sents;              /* Number of sentences processed */
	unsigned int num_words;     /* Number of words output, for monitor */
	long tot_words_in;          /* Counts of words and ambigs in and out */
	long tot_ambig_words_in;	/* Number of ambiguous words input */
	long tot_ambigs_in;		/* Number of ambiguities in */
	long tot_words_out;		/* Number of words output */
	long tot_ambig_words_out;	/* Number of ambiguous words output */
	long tot_ambigs_out;	/* Number of ambiguities output */
	char* line;			/* Input line */
	Pat *firstpat;		/* First pattern */
	Class *firstcl;		/* First class */
	Mem *firstcat;		/* First category */
	Mem *firstprop;             /* First property */
	Rule *rules;		/* General rule list */
	char *sent_punc;		/* Sentence terminators */
	char *other_punc;		/* Other punctuation */
	char *begin_punc;		/* Begin punctuation */
	short bMorphsHaveCats;	/* all morphs have cat info in \cat field */
	};

/* Macro to check if a match element represents "...". */
#define IS_ELLIPSIS(m)          ( !(m->type & (MCL | CCL | CAT | PAT) ) \
								&& m->string == ellipse_base)
/* Macro to check if a match element represents "#" */
#define IS_SENT_BOUND(m)        ( !(m->type & (MCL | CCL | CAT | PAT) ) \
								&& m->string == sent_bound)

/* Prototypes */
void print_header(FILE *pOutFP_in, char *pszTime_in);
void loadrules( FILE *pRuleFP, SenTransData *pSenTransData );
Rule *newrule( void );
Envir *newenv( void );
Match *newmatch( void );
int applyrules( Rule *rules, Word *sent, SenTransData *pSenTransData );
Word *loadsent( FILE *infile, SenTransData *pSenTransData );
Word *newword( void );
Ambig *newambig( void );
Morph *newmorph( void );
Pat *newpat( void );
Pat *findpat( char *name, SenTransData *pSenTransData );
Class *newcl( void );
Class *findcl( char *name, SenTransData *pSenTransData );
Mem *newcat( void );
Mem *findcat( char *name, SenTransData *pSenTransData );
Mem *newprop( void );
Mem *findprop( char* name, SenTransData *pSenTransData );
void putsent( Word *sent, FILE *outfile, SenTransData *pSenTransData );
char *skipwhite( char *s );
void error_msg( char *msg, char *element, SenTransData *pSenTransData );
void dumprules( Rule *ru, SenTransData *pSenTransData );
void dumpcats( Mem *cat, SenTransData *pSenTransData );
void dumpprops( Mem *prop, SenTransData *pSenTransData );
void dumpclasses( Class *cl, SenTransData *pSenTransData );
void dumppats( Pat *pat, SenTransData *pSenTransData );
void disprule( Rule *ru, SenTransData *pSenTransData );
#ifdef __cplusplus
}
#endif
#endif /*_SENTRANSLIB_H_INCLUDED_*/
