/*      TRULE_YG.Y - YACC grammar for user defined tone rules
 ***************************************************************************
 *
 *	YACC grammar and actions for user defined tone rules
 *
 ***************************************************************************
 *	EDIT HISTORY
 *	14-Feb-95	H.A. Black  initial coding, based on atest.y
 * 1.9k 22-Mar-94 hab make DJGPP compiler happy: remove its warning msgs
***************************************************************************
 * Copyright 1995 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */

%{
	/* Bison includes stdio, and MSC doesn't like seeing it twice */
#ifndef MSC
#include <stdio.h>
#endif
#ifndef NULL
#include <stdio.h>
#endif

#include <ctype.h>
#include <stdlib.h>
#include <string.h>

#ifdef __STDC__
#include <stdlib.h>
#endif

#ifdef ORIG
#include "defs.h"
#include "class.h"
#include "myallo.h"
#include "trule.h"
#include "tonepars.h"
#include "tone.h"
#else  /* ORIG */
#include "stamp.h"
#include "trule.h"
#endif /* ORIG */

/********************* TRULE_YG.Y EXTERN FUNCTIONS *********************/

			/* tone.c */
extern char  *edge_cond_name   P((long ec));
extern long   find_edge_cond P((char *cp));
extern int    find_tone_domain P((char *cp));
extern int    find_tone_type   P((char *cp));
extern char  *tone_type_name P((int td));
extern struct tone_value_list *find_tone_value_list  P((char *cp));
extern char  *tone_domain_name P((int td));

			/* yacc/bison */
extern int yylex P((void));

/********************* TRULE_YG.Y FUNCTION PROTOTYPES *********************/

static int               check_tone_pos P((int pos));
	   struct cycle     *get_default_cycle P((void));
	   struct tone_rule *get_edge_cond_rule_head P(( void ));
	   void              parseToneRule P((char *cp, int type,
					  StampData *pStamp_in));
	   struct tone_rule *get_tone_rule_head P(( void ));
	   struct tone_rule *get_tone_rule_tail P(( void ));
static void              id_error P((char *expected,
					 char *found));
	   void              init_tone_rule P((int   rd, StampData *pStamp_in));
	   void              init_tone_rule_stats  P((void));
static struct action *link_action P((struct action    *ac_head,
					 struct action    *ac_new));
static struct domain_list *link_domain_list P((struct domain_list *dl_head,
						   struct domain_list *dl_new));
static struct tone_pattern *link_tone_pattern P((struct tone_pattern *tp_head,
						 struct tone_pattern *tp_new));
static struct tone_rule    *link_tone_rule    P((struct tone_rule    *tp_head,
						 struct tone_rule    *tp_new));
static struct action *mkaction P((int               op,
				  struct tone_id   *tip,
				  int               dim,
				  int               ocp,
				  struct domain_id *dip,
				  long              econd));
static struct cycle *mkcycle P((int                 dir,
				struct domain_list *domains));
static struct domain_id *mkdomainid P((int type,
					   int domain));
static struct domain_list *mkdomainlist P((int domain));
static struct cond_node *mklfcc P((int               opcode,
				   int               left,
				   AmpleCategoryClass *right));
static struct cond_node *mklfdi P((int               opcode,
				   int               left,
				   struct domain_id *right));
static struct cond_node *mklfi P((int opcode,
				  int left,
				  int right));
static struct cond_node *mklflg P((int           opcode,
				   int           left,
				   unsigned short right));
static struct cond_node *mklfli P((int  opcode,
				   int  left,
				   long right));
static struct cond_node *mklfmc P((int                 opcode,
				   int                 left,
				   AmpleMorphClass *right));
static struct cond_node *mklfs P((int   opcode,
				  int   left,
				  char *right));
static struct cond_node *mklfsc P((int                  opcode,
				   int                  left,
				   StringClass *right));
static struct cond_node *mklfti P((int             opcode,
				   int             left,
				   struct tone_id *right));
static struct cond_node *mklftp P((int                  opcode,
				   int                  left,
				   struct tone_pattern *right));
static struct cond_node *mknode P((int               opcode,
				   struct cond_node *left,
				   struct cond_node *right));
static struct tone_rule *mkrule P((struct action    *action,
				   struct cycle     *cycle,
				   struct cond_node *condition));
static struct tone_id *mktoneid P((int                     status,
				   int                     params,
				   int                     pos,
				   struct tone_value_list *tvlp));
static struct tone_pattern *mktonepattern P((struct tone_id *toneid));
	   void              set_tone_cycle P((int cycle));
static void              show_domain_id   P((struct domain_id *dp));
	   void              show_rule_action P((struct action *ap));
static void              show_rule_cond   P((struct cond_node *cdp));
static void              show_tone_id     P((struct tone_id *tp));
static void              show_tone_pattern P((struct tone_pattern *tp));
static void              show_tone_rule   P((struct tone_rule *tp));
	   void              show_tone_rules  P((void));
static void              show_where       P((int pos));
	   void              tone_rule_stats  P((void));
static void              t_indent         P((int depth,
						 char *str));
static void              tree_walk        P((struct cond_node *condp,
						 int depth));
	   void              yyerror  P((char *s));

#undef P

/********************* TRULE_YG.Y EXTERN VARIABLES *********************/
				/* used in trule_ls.l */
char *rpp;               /* pointer to input buffer */
char *lexp;		 /* pointer to where lex is */
char string_buf[100];
char current_id[100];
char last_id[100];

				/* tone type values */
extern int Linked;
extern int Floating;
extern int LeftFloating;
extern int RightFloating;
extern int Boundary;
extern int Delinked;
extern int Melody;

/********************* TRULE_YG.Y LOCAL VARIABLES *********************/

static char lstname[100];
static char *ltname  = (char *) 0;
static char *cp;

static short	bForLeftSeen_m = FALSE;  /* flag FOR-ALL-LEFT, FOR-SOME-LEFT */
static short	bLeftSeen_m = FALSE;     /* flag LEFT */
static short	bForRightSeen_m = FALSE; /* flag FOR-ALL-RIGHT, FOR-SOME-RIGHT */
static short	bRightSeen_m = FALSE;    /* flag RIGHT */

static AmpleCategoryClass     *tmp_ccp;
static struct domain_list     *tmp_dl, *tmp_dl2;
static AmpleMorphClass        *tmp_mcp;
static StringClass            *tmp_scp;
static unsigned short          tmp_prop;
static struct tone_value_list *tmp_tone;
static struct tone_pattern    *tmp_tp;
static int                     temp, temp2;
static long                    templ;

static int               default_action_params = DEFAULT_ACTION_PARAMS;
static int               default_tone_params   = DEFAULT_TONE_PARAMS;
static struct domain_id *default_domain        = (struct domain_id *)NULL;
static struct cycle     *default_cycle         = (struct cycle *)NULL;
static int               rule_debug            = FALSE;
static char             *tsterrhead            = "\nTONERULE";
static struct tone_rule *trule                 = (struct tone_rule *)NULL;
				/* head of list of edge condition tone rules */
static struct tone_rule *Erule_head            = (struct tone_rule *)NULL;
				/* head of list of tone rules */
static struct tone_rule *Trule_head            = (struct tone_rule *)NULL;

static int               do_morph_expr_check;
static StampData *	pStamp_m;
%}

%start Default_Or_Rule

%union  {
	int                  ival;
	char                *cval;
	struct action       *acval;
	struct domain_id    *dival;
	struct domain_list  *dlval;
	struct cond_node    *cnval;
	struct cycle        *cyval;
	struct tone_id      *tival;
	struct tone_pattern *tpval;
	struct tone_rule    *trval;
	}

%token	<ival>	LX_A
%token	<ival>	LX_AND
%token	<ival>	LX_ANTEPENULTIMATE
%token	<ival>	LX_APPLIES
%token	<ival>	LX_ASSOCIATE
%token	<ival>	LX_AT
%token	<ival>	LX_BIMORAIC
%token	<ival>	LX_BOUNDARY
%token	<ival>	LX_CATEGORY
%token	<ival>	LX_CODA
%token	<ival>	LX_CONDITION
%token	<ival>	LX_COPY
%token	<ival>	LX_CURRENT
%token	<ival>	LX_CYCLE
%token	<ival>	LX_CYCLICALLY
%token	<ival>	LX_DEFAULT
%token	<ival>	LX_DELETE
%token	<ival>	LX_DELINK
%token	<ival>	LX_DELINKED
%token	<ival>	LX_DIRECTION
%token	<ival>	LX_DISYLLABIC
%token	<ival>	LX_DOMAIN
%token	<ival>	LX_DOMAINS
%token	<ival>	LX_ECONDITION
%token	<ival>	LX_EDGE
%token	<ival>	LX_EDGE_IN
%token	<ival>	LX_EXTRAMETRICAL
%token  <ival>  LX_FA_LEFT
%token  <ival>  LX_FA_RIGHT
%token  <ival>  LX_FIRST
%token  <ival>  LX_FS_LEFT
%token  <ival>  LX_FS_RIGHT
%token	<ival>	LX_FEATURE_ADDING
%token	<ival>	LX_FEATURE_CHANGING
%token	<ival>	LX_FEATURE_FILLING
%token	<ival>	LX_FILL_IN
%token	<ival>	LX_FINAL
%token  <ival>  LX_FLEFT
%token	<ival>	LX_FLOATING
%token  <ival>  LX_FRIGHT
%token	<ival>	LX_HAS
%token  <cval>  LX_IDENTIFIER
%token	<ival>	LX_IF
%token	<ival>	LX_IN
%token	<ival>	LX_INFIX
%token	<ival>	LX_INITIAL
%token	<ival>	LX_INSERT
%token	<ival>	LX_IS
%token	<ival>	LX_ITERATION
%token	<ival>	LX_ITERATIVELY
%token	<ival>	LX_LEFT
%token	<ival>	LX_LEFT_FLOATING
%token	<ival>	LX_LEFTTWO
%token	<ival>	LX_LEFTWARD
%token	<ival>	LX_LINK
%token	<ival>	LX_LINKED
%token	<ival>	LX_LO_AND
%token	<ival>	LX_LO_IFF
%token	<ival>	LX_LO_NOT
%token	<ival>	LX_LO_OR
%token	<ival>	LX_LO_XOR
%token	<ival>	LX_MEMBER
%token	<ival>	LX_MELODY
%token	<ival>	LX_MODE
%token	<ival>	LX_MONOMORAIC
%token	<ival>	LX_MONOSYLLABIC
%token	<ival>	LX_MORPHEME
%token	<ival>	LX_MORPHNAME
%token	<ival>	LX_NONE
%token	<ival>	LX_NONITERATIVELY
%token	<ival>	LX_OCP
%token	<ival>	LX_OCP_BLOCKAGE
%token	<ival>	LX_OCP_IGNORED
%token	<ival>	LX_OCP_MERGER
%token	<ival>	LX_OF
%token	<ival>	LX_ONE_TO_ONE
%token	<ival>	LX_ONSET
%token	<ival>	LX_OPTIONAL
%token	<ival>	LX_PATTERN
%token	<ival>	LX_PENULTIMATE
%token	<ival>	LX_PFINAL
%token	<ival>	LX_PINITIAL
%token	<ival>	LX_POLYSYLLABIC
%token	<ival>	LX_PREFIX
%token	<ival>	LX_PROPERTY
%token	<ival>	LX_QUADRISYLLABIC
%token	<ival>	LX_RIGHT
%token	<ival>	LX_RIGHT_FLOATING
%token	<ival>	LX_RIGHTTWO
%token	<ival>	LX_RIGHTWARD
%token	<ival>	LX_ROOT
%token	<ival>	LX_SECOND
%token	<ival>	LX_SEGMENT
%token	<ival>	LX_SET
%token	<ival>	LX_SPREAD
%token	<ival>	LX_SUFFIX
%token	<ival>	LX_SYLLABLE
%token	<ival>	LX_TBU
%token	<ival>	LX_TBUS
%token	<ival>	LX_THEN
%token	<ival>	LX_THIRD
%token	<ival>	LX_TO
%token	<ival>	LX_TONE
%token	<ival>	LX_TONES
%token	<ival>	LX_TRISYLLABIC
%token	<ival>	LX_TYPE
%token	<ival>	LX_ULTIMATE
%token	<ival>	LX_UNDER
%token	<ival>	LX_USING
%token	<ival>	LX_WITH
%token	<ival>	LX_WITHIN
%token	<ival>	LX_WORD


%type	<cnval>		Condition
%type	<cnval>		Condition_Body
%type	<cyval>		Cycle
%type	<ival>		Cycle_Default
%type	<ival>		Default
%type	<ival>		Default_Or_Rule
%type	<ival>		Dir_Iter
%type	<ival>		Dir_Iter_Mode
%type	<ival>		Direction
%type	<dival>		Domain
%type	<dlval>		Domain_cycle
%type	<cnval>		Edge_expr
%type	<ival>		Entity
%type	<cnval>		Factor
%type	<ival>		Feature_Op
%type   <ival>          ForLeft
%type   <ival>          ForRight
%type	<ival>		Iteration
%type	<dival>		Location
%type	<ival>		Mode
%type	<dlval>		More_domains
%type	<cnval>		Morpheme_expr
%type	<dlval>		Multi_domains
%type	<ival>		OCP
%type	<ival>		Ocp
%type	<cnval>		Prosodic_expr
%type	<acval>		Rule_Action
%type	<acval>		Rule_Body
%type	<cyval>		Rule_End
%type	<cnval>		Segment_expr
%type	<cnval>		Tbu_expr
%type	<tival>		Tone
%type	<tpval>		Tone_Pat
%type	<tpval>		Tone_Pattern
%type	<ival>		Tone_Rule
%type	<ival>		Tone_Rule_Body
%type	<cnval>		Tone_expr
%type	<tival>		Tone_none
%type	<cnval>		Type_expr
%type	<dlval>		Two_domains
%type	<ival>		direction
%type	<ival>		edge
%type	<dival>		entity
%type	<ival>		feature_op
%type	<ival>		iteration
%type	<dival>		location
%type	<ival>		logop
%type	<ival>		ocp
%type	<ival>		onset_coda
%type	<ival>		operation
%type	<ival>		position
%type	<ival>		prosodic_shape
%type	<ival>		tone_status
%type	<ival>		type
%type	<ival>		tbu_tbus
%type	<ival>		word_position

%%

Default_Or_Rule
	: Default
	| Tone_Rule
			/* Both default conditions and rules are handled by */
			/* the grammar */
	;

Default
	: Direction
	| Iteration
	| Feature_Op
	| Ocp
	| Entity
	| Cycle_Default
			/* Global default settings can be made for several */
			/* of the rule parameters.  A default consists of */
			/* the field code \default followed by one of the */
			/* key words that indicates which default.  The */
			/* name of the default is followed by a colon and */
			/* then the value of the default */
	;

Direction
	: LX_DIRECTION ':' direction
		  {
		default_action_params |= $3;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: DIRECTION: dir");
			fprintf(pStamp_m->pLogFP, " [dir = %d, default = 0x%x)]",
				$3, (unsigned)default_action_params);
		  }
		  }
			/* Default direction can be any direction */
	;

Iteration
	: LX_ITERATION ':' iteration
		  {
		default_action_params |= $3;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: ITERATION: iter");
			fprintf(pStamp_m->pLogFP, " [iter = %d, default = 0x%x)]",
				$3, (unsigned)default_action_params);
		  }
		  }
			/* Default iteration can be any iteration */
	;

Feature_Op
	: LX_MODE ':' feature_op
		  {
		default_action_params |= $3;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: MODE: feature_op");
			fprintf(pStamp_m->pLogFP, " [feat = %d, default = 0x%x)]",
				$3, (unsigned)default_action_params);
		  }
		  }
			/* Default mode can be any of the feature */
			/* operations */
	;

Ocp
	: LX_OCP ':' ocp
		  {
		default_action_params |= $3;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: OCP: ocp");
			fprintf(pStamp_m->pLogFP, " [ocp = %d, default = 0x%x)]",
				$3, (unsigned)default_action_params);
		  }
		  }
			/* Default OCP values can be any of the OCP */
			/* settings */
	;

Entity
	: LX_DOMAIN ':' entity
		  {
		default_domain = $3;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: DOMAIN: domain");
			fprintf(pStamp_m->pLogFP,
				" [domain = 0x%x, default = 0x%x)]", (unsigned)$3,
			   (unsigned)default_action_params);
		  }
		  }
			/* Default domain can be any entity defined by the */
			/* user */
	;

Cycle_Default
	: LX_CYCLE ':' LX_NONE
		  {
		default_cycle = (struct cycle *)NULL;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: CYCLE: none");
		  }
		  }
			/* Indicates that there are no cyclic rules. */
	| LX_CYCLE ':' LX_DOMAIN
		  {
		default_cycle = mkcycle(0, (struct domain_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: CYCLE: domain");
			fprintf(pStamp_m->pLogFP, " [0x%x mkcycle(0, NULL)]",
			   (unsigned)default_cycle);
		  }
		  }
			/* Indicates that all  "lexical" rules should be */
			/* applied within the domain(s) specified by each */
			/* rule.  If the rules do not specify any domains, */
			/* apply the rules from the innermost morphological */
			/* domain node outward (presumably this will be */
			/* root-out). */
			/* This has not been implemented yet. (9504.27) */
	| LX_CYCLE ':' direction
		  {
		default_cycle = mkcycle($3, (struct domain_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: CYCLE: direction");
			fprintf(pStamp_m->pLogFP, " [0x%x mkcycle(%d, NULL)]", $3,
			   (unsigned)default_cycle);
		  }
		  }
			/* Apply "lexical" rules in the specified direction */
			/* across the morphemes; ignore any morphological */
			/* domain structure. */
	;

Tone_Rule
	: name '(' LX_OPTIONAL ')' Tone_Rule_Body
		  {
		trule->tr_name = duplicateString(ltname);
		trule->tr_params |= OPTIONAL;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_Rule:=name (optional) %s",
				(unsigned)trule, "Tone_Rule_Body (set name = ");
			fprintf(pStamp_m->pLogFP, "\"%s\" and optional flag)",
				ltname );
		  }
		  }
		| name Tone_Rule_Body
		  {
		trule->tr_name = duplicateString(ltname);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_Rule:=name Tone_Rule_Body %s",
				(unsigned)trule, "(set name = ");
			fprintf(pStamp_m->pLogFP, "\"%s\")", ltname);
		  }
		  }
			/* Tone rules consist of a rule name followed by */
			/* the main body of the rule.  The name can also be */
			/* followed by an indication that the rule is to be */
			/* treated as optional. */
	;

name
	: LX_IDENTIFIER			/* name of the test */
		  {
		ltname = strcpy(lstname,$1);    /* save for error messages */
		bForLeftSeen_m  = FALSE;   /* These must be initialized for */
		bForRightSeen_m = FALSE;   /* each test we parse! */
		bLeftSeen_m     = FALSE;
		bRightSeen_m    = FALSE;
		  }
			/* The name of the rule consists of a user-defined */
			/* string.  The only restrictions on the name are */
			/* those of any other identifier.  See below.  It */
			/* is conventional to append various suffixes on */
			/* rule names to indicate the type of rule it is. */
			/* Tone Rules are _TR, Edge Rules are _ER, and Edge */
			/* Conditions are _EC */
	;

Tone_Rule_Body
	: Rule_Body Rule_End Condition
		  {
		trule = mkrule( $1, $2, $3 );
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_Rule_Body:=Rule_Body Rule_End %s",
				(unsigned)trule, "Condition ");
			fprintf(pStamp_m->pLogFP,
				"[mkrule(0x%x, 0x%x, 0x%x)]", (unsigned)$1,
				(unsigned)$2, (unsigned)$3);
		  }
		  }
		| Rule_Body Rule_End
		  {
		trule = mkrule( $1, $2, (struct cond_node *)NULL );
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_Rule_Body:=Rule_Body Rule_End ",
				(unsigned)trule);
			fprintf(pStamp_m->pLogFP,
				"[mkrule(0x%x, 0x%x, NULL)]", (unsigned)$1,
				(unsigned)$2);
		  }
		  }
			/* The body of a tone rule consists of three parts: */
			/* one or more rule actions (contained within a */
			/* Rule Body); an indication of the end of the rule */
			/* actions, including information about the cyclic */
			/* application of the rule; and any conditions on */
			/* the rule's application */
	;

Rule_Body
	: Rule_Action
		  {
		$$ = $1;
		  }
	| Rule_Body ',' Rule_Action
		  {
		$$ = link_action($1, $3);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Body:=Rule_Body ; Rule_Action ",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				"[link_action(0x%x, 0x%x)]", (unsigned)$1,
				(unsigned)$3);
		  }
		  }
			/* A Rule_Body is consists of one or more rule */
			/* actions separated by semi-colons */
	;

Rule_End
	: ';' Cycle '.'
		  {
		$$ = $2;
		  }
	| '.'
		  {
		$$ = default_cycle;
		  }
			/* The end of rule actions consists of a period or */
			/* a comma followed by information about the */
			/* cyclicity of the rule's application. */
	;

Rule_Action
	: operation Tone Dir_Iter_Mode OCP Domain
		  {
		$$ = mkaction($1, $2, $3, $4, $5, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone %s",
				(unsigned)$$, "Dir_Iter_Mode OCP Domain");
			fprintf(pStamp_m->pLogFP,
			   "\n\t\t\t[mkaction(%d, 0x%x, 0x%x, 0x%x, 0x%x, 0)]",
			   $1, (unsigned)$2, (unsigned)$3, (unsigned)$4,
			   (unsigned)$5);
		  }
		  }
	| operation Tone Dir_Iter_Mode OCP Location
		  {
		$$ = mkaction($1, $2, $3, $4, $5, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone %s",
				(unsigned)$$, "Dir_Iter_Mode OCP Location");
			fprintf(pStamp_m->pLogFP,
			   "\n\t\t\t[mkaction(%d, 0x%x, 0x%x, 0x%x, 0x%x, 0)]",
			   $1, (unsigned)$2, (unsigned)$3, (unsigned)$4,
			   (unsigned)$5);
		  }
		  }
	| operation Tone Dir_Iter_Mode OCP
		  {
		$$ = mkaction($1, $2, $3, $4, (struct domain_id *)NULL, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone %s",
				(unsigned)$$, "Dir_Iter_Mode OCP");
			fprintf(pStamp_m->pLogFP,
			   "\n\t\t\t[mkaction(%d, 0x%x, 0x%x, 0x%x, NULL, 0)]",
			   $1, (unsigned)$2, (unsigned)$3, (unsigned)$4);
		  }
		  }
	| operation Tone Dir_Iter_Mode Domain
		  {
		$$ = mkaction($1, $2, $3, 0, $4, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone %s",
				(unsigned)$$, "Dir_Iter_Mode Domain");
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%x, 0x%x, 0, 0x%x, 0)]",
				$1, (unsigned)$2, (unsigned)$3, (unsigned)$4);
		  }
		  }
	| operation Tone Dir_Iter_Mode Location
		  {
		$$ = mkaction($1, $2, $3, 0, $4, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone %s",
				(unsigned)$$, "Dir_Iter_Mode Location");
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%x, 0x%x, 0, 0x%x, 0)]",
				$1, (unsigned)$2, (unsigned)$3, (unsigned)$4);
		  }
		  }
	| operation Tone Dir_Iter_Mode
		  {
		$$ = mkaction($1, $2, $3, 0, (struct domain_id *)NULL, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tRule_Action:=operation Tone Dir_Iter_Mode",
			   (unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%x, 0x%x, 0, NULL, 0)]",
				$1, (unsigned)$2, (unsigned)$3);
		  }
		  }
	| operation Tone OCP Domain
		  {
		$$ = mkaction($1, $2, 0, $3, $4, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone OCP Domain",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%x, 0, 0x%x, 0x%x, 0)]",
				$1, (unsigned)$2, (unsigned)$3, (unsigned)$4);
		  }
		  }
	| operation Tone OCP Location
		  {
		$$ = mkaction($1, $2, 0, $3, $4, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone OCP Location",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%x, 0, 0x%x, 0x%x, 0)]",
				$1, (unsigned)$2, (unsigned)$3, (unsigned)$4);
		  }
		  }
	| operation Tone OCP
		  {
		$$ = mkaction($1, $2, 0, $3, (struct domain_id *)NULL, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone OCP",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%x, 0, 0x%x, NULL, 0)]",
				$1, (unsigned)$2, (unsigned)$3);
		  }
		  }
	| operation Tone Domain
		  {
		$$ = mkaction($1, $2, 0, 0, $3, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone Domain",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%x, 0, 0, 0x%x, 0)]",
				$1, (unsigned)$2, (unsigned)$3);
		  }
		  }
	| operation Tone Location
		  {
		$$ = mkaction($1, $2, 0, 0, $3, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone Location",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%x, 0, 0, 0x%x, 0)]",
				$1, (unsigned)$2, (unsigned)$3);
		  }
		  }
	| operation Tone
		  {
		$$ = mkaction($1, $2, 0, 0, (struct domain_id *)NULL, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%x, 0, 0, NULL, 0)]",
				$1, (unsigned)$2);
		  }
		  }
			/* The action of a rule consists of an operation to */
			/* be performed on an indicated tone.  The */
			/* operation can be qualified in terms of the */
			/* direction of its application, its iteration */
			/* options, its mode, its relation to the OCP, and */
			/* any particular domain in which it might apply. */
			/* All of the latter parameters are optional and */
			/* default values will be used if they are not */
			/* specified. */

	| LX_SET LX_EDGE LX_ECONDITION LX_TO LX_IDENTIFIER
		  {
		if ((templ = find_edge_cond($5)) == 0)
		   id_error("edge condition", $5);
		$$ = mkaction(SET_EDGE_COND, (struct tone_id *)NULL, 0, 0,
				  (struct domain_id *)NULL, templ);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=set edge condition to COND",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, NULL, 0, 0, NULL, %ld)]",
				SET_EDGE_COND, templ);
		  }
		  }
			/* A rule action can also consist of the setting of */
			/* a word edge condition (a flag to facilitate */
			/* tonal effects across word boundaries). */
	;

operation
	: LX_ASSOCIATE
		  {
		$$ = ASSOCIATE;
		  }
			/* Associate the indicated tone: this means to */
			/* insert the tone into the tone tier and to link */
			/* that tone to its appropriate tbu. */
	| LX_DELETE
		  {
		$$ = DELETE;
		  }
			/* Delete the indicated tone.  The tone is removed */
			/* from the tone tier and all of its association */
			/* lines are also erased. */
	| LX_DELINK
		  {
		$$ = DELINK;
		  }
			/* Delink the indicated tone: i.e. erase all of it */
			/* association lines.  The tone is *not* removed */
			/* from the tone tier. */
	| LX_INSERT
		  {
		$$ = INSERT;
		  }
			/* Insert the indicated tone into the tone tier. */
			/* No association lines are drawn. */
	| LX_LINK
		  {
		$$ = LINK;
		  }
			/* Link the indicated tone to its appropriate tbu. */
			/* The tone is assumed to already be in the tone */
			/* tier.  Linking inserts an association line (or */
			/* lines). */
	| LX_SPREAD
		  {
		$$ = SPREAD;
		  }
			/* Spread the indicated tone by drawing in the */
			/* appropriate association lines.  The direction, */
			/* iteration, etc. of the spreading operation */
			/* depends on the setting of the appropriate rule */
			/* action parameters.  Spreading assumes that the */
			/* indicated tone is linked. */
	| LX_FILL_IN
		  {
		$$ = FILL_IN;
		  }
			/* Fill-in a default tone value. */
			/* The indicated tone value will be inserted and */
			/* linked to every tbu that does not already have a */
			/* tone on the indicated tone's tier.  The operation */
			/* parameters are always: left-to-right, */
			/* iteratively, using feature-filling mode with OCP */
			/* ignored.  This rule will always be applied as a */
			/* non-cyclic rule (i.e. all morphemes and domains */
			/* will be ignored). N.B. there is no user-overide */
			/* of these parameters or of the non-cyclicity of */
			/* this operation.  No matter what you say for the */
			/* parameters and no matter if you place this rule */
			/* among the cyclic rules, it will *always* operate */
			/* as prescribed above.  The rule is also treated as */
			/* conditionless (i.e. any conditions on its */
			/* application will be ignored). */
	| LX_COPY
		  {
		$$ = COPY;
		  }
			/* Copy a tone or tone pattern (as in */
			/* reduplication).
			/* This has not been implemented yet. (9504.27) */
	;

Tone
	: LX_A tone_status LX_IDENTIFIER LX_TONE
		  {
		if ((tmp_tone = find_tone_value_list($3)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", $3);
		$$ = mktoneid($2, SINGLE, 0, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=a tone_status TONE tone",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, SINGLE, 0, 0x%x)]",
				$2, (unsigned)tmp_tone);
		  }
		  }
			/* Indicates a tone with a particular value (such */
			/* as H or M or L) which has a particular status */
			/* (linked, right-floating, left-floating, etc.) */
	| LX_A position tone_status LX_IDENTIFIER LX_TONE
		  {
		if ((tmp_tone = find_tone_value_list($4)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", $4);
		$2 = check_tone_pos($2);
		$$ = mktoneid($3, SINGLE, $2, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=a position tone_status TONE tone",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, SINGLE, %d, 0x%x)]",
				$3, $2, (unsigned)tmp_tone);
		  }
		  }
			/* Indicates a tone with a particular value (such */
			/* as H or M or L)  which has a particular status */
			/* (linked, right-floating, left-floating, etc.). */
			/* In addition, the tone must be located in the */
			/* morpheme indicated by position.  If position is */
			/* 'left', then it is the final tone of the */
			/* morpheme (on the tone's tier); if position is */
			/* 'right', then it is the initial tone of the */
			/* morpheme (on the tone's tier). */
	| LX_A tone_status LX_TONE
		  {
		$$ = mktoneid($2, SINGLE, 0, (struct tone_value_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=a tone_status tone",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, SINGLE, 0, NULL)]", $2);
		  }
		  }
			/* Indicates a tone with unspecified value which */
			/* has a particular status (linked, right-floating, */
			/* left-floating, etc.). */
	| LX_A position tone_status LX_TONE
		  {
		$2 = check_tone_pos($2);
		$$ = mktoneid($3, SINGLE, $2, (struct tone_value_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=a position tone_status tone",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, SINGLE, %d, NULL)]", $3, $2);
		  }
		  }
			/* Indicates a tone with unspecified value which */
			/* has a particular status (linked, right-floating, */
			/* left-floating, etc.).
			/* In addition, the tone must be located in the */
			/* morpheme indicated by position.  If position is */
			/* 'left', then it is the final tone of the */
			/* morpheme (on the tone's tier); if position is */
			/* 'right', then it is the initial tone of the */
			/* morpheme (on the tone's tier). */
	| LX_A LX_IDENTIFIER LX_TONE
		  {
		if ((tmp_tone = find_tone_value_list($2)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", $2);
		$$ = mktoneid(0, SINGLE, 0, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\n0x%x\tTone:=a TONE tone",
			   (unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, SINGLE, 0, 0x%x)]",
				(unsigned)tmp_tone);
		  }
		  }
			/* Indicates a tone with a particular value (such */
			/* as H or M or L) irrespective of its status */
			/* (linked, right-floating, left-floating, etc.) */
	| LX_A position LX_IDENTIFIER LX_TONE
		  {
		if ((tmp_tone = find_tone_value_list($3)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", $3);
		$2 = check_tone_pos($2);
		$$ = mktoneid(0, SINGLE, $2, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=a position TONE tone",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, SINGLE, %d, 0x%x)]",
				$2, (unsigned)tmp_tone);
		  }
		  }
			/* Indicates a tone with a particular value (such */
			/* as H or M or L) irrespective of its status */
			/* (linked, right-floating, left-floating, etc.) */
			/* In addition, the tone must be located in the */
			/* morpheme indicated by position.  If position is */
			/* 'left', then it is the final tone of the */
			/* morpheme (on the tone's tier); if position is */
			/* 'right', then it is the initial tone of the */
			/* morpheme (on the tone's tier). */
	| tone_status LX_IDENTIFIER LX_TONES
		  {
		if ((tmp_tone = find_tone_value_list($2)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", $2);
		$$ = mktoneid($1, PLURAL, 0, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=tone_status TONE tones",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, PLURAL, 0, 0x%x)]",
				$1, (unsigned)tmp_tone);
		  }
		  }
			/* Indicates tones with a particular value (such */
			/* as H or M or L) which have a particular status */
			/* (linked, right-floating, left-floating, etc.) */
	| position tone_status LX_IDENTIFIER LX_TONES
		  {
		if ((tmp_tone = find_tone_value_list($3)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", $3);
		$1 = check_tone_pos($1);
		$$ = mktoneid($2, PLURAL, $1, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=position tone_status TONE tones",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, PLURAL, %d, 0x%x)]",
				$2, $1, (unsigned)tmp_tone);
		  }
		  }
			/* Indicates several tones with a particular value */
			/*  (such as H or M or L) which have a particular   */
			/* status (linked, right-floating, etc.). */
			/* In addition, the tones must be located in the */
			/* morpheme indicated by position.  */
	| tone_status LX_TONES
		  {
		$$ = mktoneid($1, PLURAL, 0, (struct tone_value_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=tone_status tones",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, PLURAL, 0, NULL)]", $1);
		  }
		  }
			/* Indicates several tones with the specified */
			/* status (linked, right-floating, left-floating, */
			/* etc.).  The value (such as H or M or L) is not */
			/* specified. */
	| position tone_status LX_TONES
		  {
		$1 = check_tone_pos($1);
		$$ = mktoneid($2, PLURAL, $1, (struct tone_value_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=position tone_status tones",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, PLURAL, %d, NULL)]", $2, $1);
		  }
		  }
			/* Indicates several tones with the specified */
			/* status (linked, right-floating, left-floating, */
			/* etc.).  The value (such as H or M or L) is not */
			/* specified. */
			/* In addition, the tone must be located in the */
			/* morpheme indicated by position.  */
	| LX_IDENTIFIER LX_TONES
		  {
		if ((tmp_tone = find_tone_value_list($1)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", $1);
		$$ = mktoneid(0, PLURAL, 0, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\n0x%x\tTone:=TONE tones",
			   (unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, PLURAL, 0, 0x%x)]",
				(unsigned)tmp_tone);
		  }
		  }
			/* Indicates tones with a particular value (such */
			/* as H or M or L) irrespective of its status */
			/* (linked, right-floating, left-floating, etc.) */
	| position LX_IDENTIFIER LX_TONES
		  {
		if ((tmp_tone = find_tone_value_list($2)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", $2);
		$1 = check_tone_pos($1);
		$$ = mktoneid(0, PLURAL, $1, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=position TONE tones",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, SINGLE, %d, 0x%x)]",
				$1, (unsigned)tmp_tone);
		  }
		  }
			/* Indicates tones with a particular value (such */
			/* as H or M or L) irrespective of its status */
			/* (linked, right-floating, left-floating, etc.) */
			/* In addition, the tone musts be located in the */
			/* morpheme indicated by position. */
	| LX_DEFAULT LX_IDENTIFIER LX_TONE
		  {
		if ((tmp_tone = find_tone_value_list($2)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", $2);
		$$ = mktoneid(0, DEFAULT, 0, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=default TONE tone",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, DEFAULT, 0, 0x%x)]",
				(unsigned)tmp_tone);
		  }
		  }
			/* Indicates the default tone value. */
	| position LX_DEFAULT LX_IDENTIFIER LX_TONE
		  {
		if ((tmp_tone = find_tone_value_list($3)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", $3);
		$1 = check_tone_pos($1);
		$$ = mktoneid(0, DEFAULT, $1, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=position default TONE tone",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, DEFAULT, %d, 0x%x)]",
				$1, (unsigned)tmp_tone);
		  }
		  }
			/* Indicates the default tone value. */
			/* In addition, the tone must be located in the */
			/* morpheme indicated by position.  If position is */
			/* 'left', then it is the final tone of the */
			/* morpheme (on the tone's tier); if position is */
			/* 'right', then it is the initial tone of the */
			/* morpheme (on the tone's tier). */
	;

Dir_Iter_Mode
	: Dir_Iter Mode
		  {
		$$ = $1 + $2;
		  }
	| Dir_Iter
		  {
		$$ = $1;
		  }
			/* Actions can be qualified in terms of the */
			/* direction of their applicability, how they */
			/* iterate, and their mode.  Dir_Iter_Mode is a */
			/* cover non-terminal symbol for these. */
	;

Dir_Iter
	: direction iteration
		  {
		$$ = $1 + $2;
		  }
	| direction
		  {
		$$ = $1;
		  }
	|           iteration
		  {
		$$ = $1;
		  }
			/* Dir_Iter is a cover non-terminal for direction */
			/* and/or for iteration. */
	;

direction
	: LX_LEFTWARD
		  {
		$$ = LEFTWARD;
		  }
	| LX_RIGHTWARD
		  {
		$$ = RIGHTWARD;
		  }
			/* Direction is either towards the left */
			/* (right-to-left) or towards the right */
			/* (left-to-right). */
	;

iteration
	: LX_NONITERATIVELY
		  {
		$$ = NONITERATIVELY;
		  }
			/* The action is to apply non-iteratively; i.e. it */
			/* applies once and only once. */
	| LX_ITERATIVELY
		  {
		$$ = ITERATIVELY;
		  }
			/* The action is to apply iteratively; i.e. it */
			/* applies to as many tbus as possible.  For */
			/* example, if the action is to spread a H tone to */
			/* the right non-cyclically, then the action */
			/* attempts to spread the H tone to all the tbus in */
			/* the word to the right.  If such an action were */
			/* cyclic within morphemes, then the spreading */
			/* would be to all tbus within the morpheme. */
	| LX_EDGE_IN
		  {
		$$ = EDGE_IN;
		  }
			/* The action is to apply the tones in an edge-in */
			/* fashion.  If direction is to the left, then */
			/* (i) associate the rightmost tone to the right */
			/* edge of the domain; (ii) associate the leftmost */
			/* tone to the left edge of the domain (if */
			/* possible); and (iii) associate all remaining */
			/* unassociated tones right-to-left beginning to */
			/* the immediate left of the first tone.
			/* If direction is to the right, then (i) associate */
			/* the leftmost tone to the left edge of the */
			/* domain; (ii) associate the rightmost tone to the */
			/* right edge of the domain (if possible); and */
			/* (iii) associate all remaining unassociated tones */
			/* left-to-right beginning to the immediate right */
			/* of the first tone. */
			/* This has not been implemented yet. (9504.27) */
	| LX_ONE_TO_ONE
		  {
		$$ = ONE_TO_ONE;
		  }
			/* There is a one-to-one matching between tones in */
			/* the list of tones and tbus. */
			/* This has not been implemented yet. (9504.27) */
	;

Mode
	: LX_USING feature_op LX_MODE
		  {
		$$ = $2;
		  }
			/* An action can be performed in one of three */
			/* modes: feature-adding, feature-changing, or */
			/* feature-filling. */
	;

feature_op
	: LX_FEATURE_ADDING
		  {
		$$ = FEATURE_ADDING;
		  }
			/* Feature-adding mode causes the tone of the */
			/* action to be appended to the tbu.  That is, if */
			/* there is already a tone linked to the tbu, the */
			/* new tone will also be linked to it. */
	| LX_FEATURE_CHANGING
		  {
		$$ = FEATURE_CHANGING;
		  }
			/* Feature-changing mode causes any existing tones */
			/* on the indicated tbu to be replaced by the new */
			/* tone. */
	| LX_FEATURE_FILLING
		  {
		$$ = FEATURE_FILLING;
		  }
			/* Feature-filling mode causes the new tone to */
			/* *not* be linked if there are existing tones */
			/* already on the tbu. */
	;

OCP
	: LX_WITH ocp
		  {
		$$ = $2;
		  }
			/* Actions may be subject (or not subject) to the */
			/* Obligatory Contour Principle (OCP) in various */
			/* ways.  */
			/* This has not been implemented yet. (9504.27) */
	;

ocp
	: LX_OPTIONAL LX_OCP_BLOCKAGE
		  {
		$$ = OPTIONAL_OCP_BLOCKAGE;
		  }
			/* An OCP violation will optionally block the */
			/* action from applying. */
			/* This has not been implemented yet. (9504.27) */
	| LX_OCP_BLOCKAGE
		  {
		$$ = OCP_BLOCKAGE;
		  }
			/* An OCP violation will block the action from */
			/* applying. */
			/* This has not been implemented yet. (9504.27) */
	| LX_OCP_IGNORED
		  {
		$$ = OCP_IGNORED;
		  }
			/* The OCP is ignored (does not apply at all). */
			/* This has not been implemented yet. (9504.27) */
			/* (Although this is the effect currently; 9504.27.) */
	| LX_OCP_MERGER
		  {
		$$ = OCP_MERGER;
		  }
			/* When the application of an action will result in */
			/* an OCP violation, merge the two offending tones */
			/* into one. */
			/* This has not been implemented yet. (9504.27) */
	;

Domain
	: LX_WITHIN edge entity
		  {
		$$ = $3;
		$$->di_edge = $2;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tDomain:=within edge entity", (unsigned)$$);
			fprintf(pStamp_m->pLogFP, " (set edge = %d)", $2);
		  }
		  }
	| LX_WITHIN entity
		  {
		$$ = $2;
		$$->di_edge = 0;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tDomain:=within entity", (unsigned)$$);
			fprintf(pStamp_m->pLogFP, " (set edge = 0)");
		  }
		  }
			/* Actions may apply only within a particular */
			/* domain.  In addition, the application may only */
			/* be at the left or right edge of the domain. */
	;

Location
	: LX_WITHIN edge location
		  {
		$$ = $3;
		$$->di_edge = $2;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tLocation:=within edge location", (unsigned)$$);
			fprintf(pStamp_m->pLogFP, " (set edge = %d)", $2);
		  }
		  }
	| LX_WITHIN location
		  {
		$$ = $2;
		$$->di_edge = 0;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tLocation:=within location", (unsigned)$$);
			fprintf(pStamp_m->pLogFP, " (set edge = 0)");
		  }
		  }
			/* Actions may apply only within a particular */
			/* location (tbu or syllable) with respect to word */
			/* boundaries.  For syllables, the action may */
			/* also be at the left or right edge of the syllable. */
	;

edge
	: LX_LEFT  LX_EDGE LX_OF
		  {
		$$ = LEFT_EDGE;
		  }
	| LX_RIGHT LX_EDGE LX_OF
		  {
		$$ = RIGHT_EDGE;
		  }
			/* This indicates the appropriate edge of a domain. */
	;

entity
	: LX_IDENTIFIER LX_DOMAIN
		  {
		if ((temp = find_tone_domain($1)) == 0)
		   id_error("domain", $1);
		$$ = mkdomainid(DI_DOMAIN, temp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tentity:=DOMAIN domain", (unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mkdomainid(%d, %d)]", DI_DOMAIN, temp);
		  }
		  }
	| LX_MORPHEME
		  {
		$$ = mkdomainid(DI_MORPHEME, 0);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tentity:=morpheme", (unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mkdomainid(%d, 0)]", DI_MORPHEME);
		  }
		  }
	| LX_WORD
		  {
		$$ = mkdomainid(DI_WORD, 0);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tentity:=word", (unsigned)$$);
			fprintf(pStamp_m->pLogFP, " [mkdomainid(%d, 0)]", DI_WORD);
		  }
		  }
			/* Entities can be either user-defined domains or */
			/* morphemes or word boundary. */
	;

location
	: word_position LX_SYLLABLE LX_OF LX_WORD
		  {
		$$ = mkdomainid(DI_SYLLABLE, $1);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tlocation:=word_position syllable",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mkdomainid(%d, %d)]", DI_SYLLABLE, 0);
		  }
		  }
	| word_position LX_TBU LX_OF LX_WORD
		  {
		$$ = mkdomainid(DI_TBU, $1);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tlocation:=word_position tbu",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [mkdomainid(%d, 0)]", DI_TBU);
		  }
		  }
			/* Locations can be either syllables or tbus, */
			/* located with respect to a word boundary. */
	;

Cycle
	: LX_APPLIES LX_CYCLICALLY direction LX_WITHIN Domain_cycle
		  {
		$$ = mkcycle($3, $5);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tCycle:=applies cyclically direction %s",
				(unsigned)$$, "within Domain_cycle");
			fprintf(pStamp_m->pLogFP,
				" [mkcycle(%d, 0x%x)]", $3, (unsigned)$5);
		  }
		  }
			/* The rule actions apply cyclically with the */
			/* indicated domain(s) in the indicated direction. */
	| LX_APPLIES LX_CYCLICALLY direction
		  {
		$$ = mkcycle($3, (struct domain_list*)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tCycle:=applies cyclically direction",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP, " [mkcycle(%d, NULL)]", $3);
		  }
		  }
			/* The rule actions apply cyclically in the */
			/* indicated direction. */
	| LX_APPLIES LX_CYCLICALLY LX_WITHIN Domain_cycle
		  {
		$$ = mkcycle(0, $4);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tCycle:=applies cyclically %s",
				(unsigned)$$, "within Domain_cycle");
			fprintf(pStamp_m->pLogFP,
				" [mkcycle(0, 0x%x)]", (unsigned)$4);
		  }
		  }
			/* The rule actions apply cyclically with the */
			/* indicated domain(s). */
	;

Domain_cycle
	: LX_IDENTIFIER LX_DOMAIN
		  {
		if ((temp = find_tone_domain($1)) == 0)
		   id_error("domain", $1);
		$$ = mkdomainlist(temp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tDomain_cycle:=DOMAIN domain",(unsigned)$$);
			fprintf(pStamp_m->pLogFP, " [mkdomainlist(%d)]", temp);
		  }
		  }
	| Multi_domains LX_DOMAINS
		  {
		$$ = $1;
		  }
			/* Indicates one or more domains. */
	;

Multi_domains
	: Two_domains
		  {
		$$ = $1;
		  }
	| More_domains Two_domains
		  {
		$$ = link_domain_list($1, $2);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tMulti_domains:=More_domains Two_domains",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP,
				" [link_domain_list(0x%x, 0x%x)]",
				(unsigned)$1, (unsigned)$2);
		  }
		  }
			/* Indicates two or more domains. */
	;

Two_domains
	: LX_IDENTIFIER LX_AND LX_IDENTIFIER
		  {
		if ((temp = find_tone_domain($1)) == 0)
		   id_error("domain", $1);
		if ((temp2 = find_tone_domain($3)) == 0)
		   id_error("domain", $3);
		tmp_dl  = mkdomainlist(temp);
		tmp_dl2 = mkdomainlist(temp2);
		$$ = link_domain_list(tmp_dl, tmp_dl2);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTwo_domains:=DOMAIN and DOMAIN",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP, " [mkdomainlist(%d)]", temp);
			fprintf(pStamp_m->pLogFP, " [mkdomainlist(%d)]", temp2);
			fprintf(pStamp_m->pLogFP,
				" [link_domain_list(0x%x, 0x%x)]",
				(unsigned)tmp_dl, (unsigned)tmp_dl2);
		  }
		  }
			/* Indicates two domains. */
	;

More_domains
	: More_domains LX_IDENTIFIER ','
		  {
		if ((temp = find_tone_domain($2)) == 0)
		   id_error("domain", $2);
		tmp_dl = mkdomainlist(temp);
		$$ = link_domain_list($1, tmp_dl);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tMore_domains:=More_domains DOMAIN ,",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP, " [mkdomainlist(%d)]", temp);
			fprintf(pStamp_m->pLogFP,
				" [link_domain_list(0x%x, 0x%x)]",
				(unsigned)$1, (unsigned)tmp_dl);
		  }
		  }
	| LX_IDENTIFIER ','
		  {
		if ((temp = find_tone_domain($1)) == 0)
		   id_error("domain", $1);
		$$ = mkdomainlist(temp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\n0x%x\tMore_domains:=DOMAIN ,",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP, " [mkdomainlist(%d)]", temp);
		  }
		  }
			/* Indicates a sequence of domains. */
	;

Condition
	: LX_CONDITION ':' Condition_Body
		  {
		$$ = $3;
		  }
			/* Rules may have conditions upon their */
			/* application. */
	;

Condition_Body
	: Factor
		  {
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%x\tCondition_Body:=Factor [0x%x]",
			  (unsigned)$$, (unsigned)$1);
		  }
	| Condition_Body logop Factor
		  {
		$$ = mknode($2, $1, $3);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tCondition_Body:=Condition_Body logop %s",
				(unsigned)$$, "Factor ");
			fprintf(pStamp_m->pLogFP,
				"[mknode(%d, 0x%x, 0x%x)]", (unsigned)$2,
				(unsigned)$1, (unsigned)$3);
		  }
		  }
	| LX_IF Factor LX_THEN Factor
			  {
		$$ = mknode( LOGIF, $2, $4);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tIF factor THEN factor", (unsigned)$$);
			fprintf(pStamp_m->pLogFP, "[mknode(%d, 0x%x, 0x%x)]",
				LOGIF, (unsigned)$2, (unsigned)$4);
		  }
		  }
		| ForLeft Factor
			  {
		if (bForLeftSeen_m == TRUE)
		  {
			if (pStamp_m->pLogFP != NULL)
			  fprintf(pStamp_m->pLogFP,
				  "%s contains more than one leftward iteration\n",
				  ltname );
		  }
		if (bLeftSeen_m == FALSE)
		  {
			if (pStamp_m->pLogFP != NULL)
			  fprintf(pStamp_m->pLogFP,
				  "%s contains a leftward iteration without a LEFT\n",
				  ltname );
		  }
		bForLeftSeen_m = TRUE;
		$$ = mknode( $1, $2, (struct cond_node *)NULL);
		  }
		| ForRight Factor
		  {
		if (bForRightSeen_m == TRUE)
		  {
			if (pStamp_m->pLogFP != NULL)
			  fprintf(pStamp_m->pLogFP,
				  "%s contains more than one rightward iteration\n",
				  ltname );
		  }
		if (bRightSeen_m == FALSE)
		  {
			if (pStamp_m->pLogFP != NULL)
			  fprintf(pStamp_m->pLogFP,
				  "%s contains a rightward iteration without a RIGHT\n",
				  ltname );
		  }
		bForRightSeen_m = TRUE;
		$$ = mknode( $1, $2, (struct cond_node *)NULL);
		  }
	;

ForLeft
	: LX_FA_LEFT
	{
	$$ = ALL_LEFT;
	}
	| LX_FS_LEFT
	{
	$$ = SOME_LEFT;
	}
	;

ForRight
	: LX_FA_RIGHT
	{
	$$ = ALL_RIGHT;
	}
	| LX_FS_RIGHT
	{
	$$ = SOME_RIGHT;
	}
	;

Factor
	: LX_LO_NOT Factor
		  {
		$$ = $2;
				$$->cn_opcode ^= OP_NOT;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			 "\n0x%x\tFactor:=NOT Factor (set flag for node 0x%x)",
			  (unsigned)$$, (unsigned)$$);
		  }
			/* A condition can be negated. */
	| '(' Condition_Body ')'
		  {
		$$ = $2;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%x\tFactor:='(' Condition_Body ')' [0x%x]",
			  (unsigned)$$, (unsigned)$2);
		  }
	| Edge_expr
		  {
		$$ = $1;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%x\tFactor:=Edge_expr [0x%x]",
			  (unsigned)$$, (unsigned)$1);
		  }
	| Morpheme_expr
		  {
		$$ = $1;
		if (!(default_tone_params & CYCLIC) &&
			do_morph_expr_check &&
			pStamp_m->pLogFP != NULL)
		  {
			fprintf(pStamp_m->pLogFP, "%s %s %s", tsterrhead, ltname,
			  "morpheme-oriented condition in a non-cyclic rule.");
			fprintf(pStamp_m->pLogFP,
				"\n%19sThe condition will probably not work."," ");
		  }
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%x\tFactor:=Morpheme_expr [0x%x]",
			  (unsigned)$$, (unsigned)$1);
		  }
	| Prosodic_expr
		  {
		$$ = $1;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%x\tFactor:=Prosodic_expr [0x%x]",
			  (unsigned)$$, (unsigned)$1);
		  }
	| Segment_expr
		  {
		$$ = $1;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%x\tFactor:=Segment_expr [0x%x]",
			  (unsigned)$$, (unsigned)$1);
		  }
	| Tbu_expr
		  {
		$$ = $1;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP, "\n0x%x\tFactor:=Tbu_expr [0x%x]",
			 (unsigned)$$, (unsigned)$1);
		  }
	| Tone_expr
		  {
		$$ = $1;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP, "\n0x%x\tFactor:=Tone_expr [0x%x]",
			 (unsigned)$$, (unsigned)$1);
		  }
	| Type_expr
		  {
		$$ = $1;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP, "\n0x%x\tFactor:=Type_expr [0x%x]",
			 (unsigned)$$, (unsigned)$1);
		  }
	;

Edge_expr
	: LX_EDGE LX_ECONDITION LX_IS LX_IDENTIFIER
		  {
		if ((templ = find_edge_cond($4)) == 0L)
		  id_error("edge condition", $4);
		$$ = mklfli(EDGE_COND_IS, 0, templ);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tEdge_expr:=edge condition is EDGE_COND ",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP, "[mklfli(%d, 0, %ld)]",
				EDGE_COND_IS, templ);
		  }
		  }
			/* This checks to see if the indicated edge */
			/* condition flag is set. */
	;

Morpheme_expr
	: position LX_CATEGORY LX_IS LX_IDENTIFIER
		  {
		if ((temp = findAmpleCategoryNumber($4, pStamp_m->pCategories)) == 0)
			id_error("category", $4);
		$$ = mklfi(CATEGORY_IS, $1, temp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tMorpheme_expr:=position category is %s",
			   (unsigned)$$, "CATEGORY");
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, %d \"%s\")]",
				CATEGORY_IS, $1, temp, $4);
		  }
		  }
			/* This checks to see if the category of the */
			/* morpheme indicated by position is the indicated */
			/* value. */
	| position LX_CATEGORY LX_IS LX_MEMBER LX_IDENTIFIER
		  {
		if ((tmp_ccp = findAmpleCategClass($5, pStamp_m->pCategClasses)) ==
											(AmpleCategoryClass *)NULL)
			id_error("category class", $5);
		$$ = mklfcc(CATEGORY_MEMBER, $1, tmp_ccp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tMorpheme_expr:=position category is %s",
				(unsigned)$$, "member CATEGORY_CLASS ");
			fprintf(pStamp_m->pLogFP,
				"[mklfcc(%d, %d, 0x%x \"%s\")]", CATEGORY_MEMBER,
				$1, (unsigned)tmp_ccp, $5);
		  }
		  }
			/* This checks to see if the category of the */
			/* morpheme indicated by position is one of the */
			/* categories in the indicated category class. */
	| position LX_MORPHNAME LX_IS LX_IDENTIFIER
		  {
		$$ = mklfs(MORPH_IS, $1, duplicateString($4));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tMorpheme_expr:=position morphname is %s",
				(unsigned)$$, "MORPHNAME ");
			fprintf(pStamp_m->pLogFP,
				"[mklfs(%d, %d, \"%s\")]", MORPH_IS, $1, $4 );
		  }
		  }
			/* This checks to see if the morpheme indicated by */
			/* position has the indicated morphname. */
	| position LX_MORPHNAME LX_IS LX_MEMBER LX_IDENTIFIER
		  {
		if ((tmp_mcp = findAmpleMorphClass($5, pStamp_m->pMorphClasses)) ==
											   (AmpleMorphClass *)NULL)
			id_error("morpheme class", $5);
				$$ = mklfmc(MORPH_MEMBER, $1, tmp_mcp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tMorpheme_expr:=position morphname is %s",
				(unsigned)$$, "member MORPHCLASS ");
			fprintf(pStamp_m->pLogFP,
				"[mklfmc(%d, %d, 0x%x \"%s\")]", MORPH_MEMBER,
				$1, (unsigned)tmp_mcp, $5 );
		  }
		  }
			/* This checks to see if the morphname of the */
			/* morpheme indicated by position is in the */
			/* indicated morpheme class. */
	| position LX_PROPERTY LX_IS LX_IDENTIFIER
		  {
		if ((tmp_prop = findAmplePropertyNumber($4, &pStamp_m->sProperties)) == 0)
		   id_error("property", $4);
		$$ = mklflg(PROP_IS, $1, tmp_prop);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tMorpheme_expr:=position property is %s",
				(unsigned)$$, "PROPERTY ");
			fprintf(pStamp_m->pLogFP,
				"[mklflg(%d, %d, 0x%08x \"%s\")]", PROP_IS, $1,
				tmp_prop, $4 );
		  }
		  }
			/* This checks to see if the morpheme indicated by */
			/* position has the indicated property. */
	;

Prosodic_expr
	: position LX_SYLLABLE LX_HAS onset_coda
		  {
				$$ = mklfi(SYLLABLE_HAS, $1, $4);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tProsodic_expr:=position syllable has %s",
				(unsigned)$$, "ONSET/CODA ");
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, %d)]",
				SYLLABLE_HAS, $1, $4);
		  }
		  }
			/* This checks to see of the first syllable of the */
			/* morpheme indicated by position has an onset or */
			/* a coda. */
	| position LX_MORPHEME LX_IS prosodic_shape
		  {
				$$ = mklfi(MORPH_PROSODY, $1, $4);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tProsodic_expr:=position morpheme is %s",
				(unsigned)$$, "PROSODY ");
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, %d)]",
				MORPH_PROSODY, $1, $4);
		  }
		  }
			/* This checks to see if the morpheme indicated by */
			/* position has the indicated prosodic shape. */
	;

Segment_expr
	: position LX_SEGMENT LX_IS LX_IDENTIFIER
		  {
		$$ = mklfs(SEGMENT_IS, $1, duplicateString($4));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tSegment_expr:=position segment is %s",
				(unsigned)$$, "SEGMENT ");
			fprintf(pStamp_m->pLogFP,
				"[mklfs(%d, %d, \"%s\")]", SEGMENT_IS, $1, $4 );
		  }
		  }
			/* This checks to see if any segment of the */
			/* indicated morpheme is the indicated segment. */
	| position LX_SEGMENT LX_IS LX_MEMBER LX_IDENTIFIER
		  {
		if ((tmp_scp = findStringClass($5, pStamp_m->pStringClasses))
			== (StringClass *)NULL)
			id_error("string class", $5);
				$$ = mklfsc(SEGMENT_MEMBER, $1, tmp_scp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tSegment_expr:=position segment is %s",
				(unsigned)$$, "member STRINGCLASS ");
			fprintf(pStamp_m->pLogFP, "[mklfsc(%d, %d, 0x%x \"%s\")]",
				SEGMENT_MEMBER,
				$1, (unsigned)tmp_scp, $5 );
		  }
		  }
			/* This checks to see if any segment of the */
			/* indicated morpheme is a member of the indicated */
			/* string class. */
	;

Tbu_expr
	: position LX_TBU LX_IS Domain
		  {
				$$ = mklfdi(TBU_DOMAIN, $1, $4);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTbu_expr:=position tbu is DOMAIN ",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP, "[mklfdi(%d, %d, 0x%x)]",
				TBU_DOMAIN, $1,
				(unsigned)$4);
		  }
		  }
			/* This checks to see if the morpheme indicated by */
			/* position has a tbu in the indicated domain. */
			/* This has not been implemented yet. (9504.27) */
	| position LX_TBU LX_IS LX_EXTRAMETRICAL
		  {
				$$ = mklfi(TBU_EXTRAMET, $1, 0);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTbu_expr:=position tbu is extrametrical ",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, 0)]",
				TBU_EXTRAMET, $1);
		  }
		  }
			/* This checks to see if the morpheme indicated by */
			/* position has a tbu that is marked as */
			/* extrametrical (extratonal). */
			/* This has not been implemented yet. (9504.27) */
	| position LX_TBU LX_HAS Tone_none
		  {
				$$ = mklfti(TBU_HAS, $1, $4);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTbu_expr:=position tbu has TONE ",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP, "[mklfti(%d, %d, 0x%x)]",
				TBU_HAS, $1, (unsigned)$4);
		  }
		  }
			/* This checks to see if the morpheme indicated by */
			/* position has a tbu with the indicated tone.  If */
			/* position is initial, the first tbu of the word */
			/* is used.  If position is final, the last tbu of */
			/* the word is used.  If position is current or */
			/* right, the first tbu of the indicated morpheme */
			/* is used.  If position is left, the last tbu of */
			/* the left morpheme is used. */

	| position LX_MORPHEME LX_TBU LX_IDENTIFIER LX_HAS Tone_none
		  {
		cp = last_id;	        /* get value of the identifier */
		temp = atoi(cp);	/* convert identifier to integer */
					/* check for valid digit sequence */
		while (*cp != NUL)	/* should be digits */
		  {
			if (!isdigit(*cp++) &&
			pStamp_m->pLogFP != NULL)
			  {			/* found a non-digit; report error */
			fprintf(pStamp_m->pLogFP, "%s %s constant %s %s",
				tsterrhead, ltname, last_id,
				   "in tbu expression is not a number.");
			fprintf(pStamp_m->pLogFP,
				"\n%19sWill use the value %d for it", " ",
				temp);
			break;
			  }
		  }
				$$ = mklfti(TBU_NUMBER, $1, $6);
		$$->cn_tbu_num = temp;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tTbu_expr:=position morpheme tbu NUMBER %s",
			   (unsigned)$$, "has TONE ");
			fprintf(pStamp_m->pLogFP, "[mklfti(%d, %d, 0x%x)]",
				TBU_NUMBER, $1, (unsigned)$4);
			fprintf(pStamp_m->pLogFP, " and set tbu num = %d]", temp);
		  }
		  }
			/* This checks to see if the indicated tbu of the */
			/* morpheme indicated by position has the indicated */
			/* tone. */
	| position LX_MORPHEME LX_UNDER LX_TBU LX_IDENTIFIER LX_HAS Tone_none
		  {
		cp = last_id;	        /* get value of the identifier */
		temp = atoi(cp);	/* convert identifier to integer */
					/* check for valid digit sequence */
		while (*cp != NUL)	/* should be digits */
		  {
			if (!isdigit(*cp++) &&
			pStamp_m->pLogFP != NULL)
			  {			/* found a non-digit; report error */
			fprintf(pStamp_m->pLogFP, "%s %s constant %s %s",
				tsterrhead, ltname, last_id,
				   "in tbu expression is not a number.");
			fprintf(pStamp_m->pLogFP,
				   "\n%19sWill use the value %d for it", " ",temp);
			break;
			  }
		  }
				$$ = mklfti(TBU_UNDER_NUMBER, $1, $7);
		$$->cn_tbu_num = temp;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tTbu_expr:=position morpheme underlying %s",
			   (unsigned)$$, " tbu NUMBER has TONE ");
			fprintf(pStamp_m->pLogFP, "[mklfti(%d, %d, 0x%x)]",
				TBU_UNDER_NUMBER, $1,
			   (unsigned)$7);
			fprintf(pStamp_m->pLogFP, " and set tbu num = %d]", temp);
		  }
		  }
			/* This checks to see if the indicated tbu of the */
			/* morpheme indicated by position has the indicated */
			/* underlying tone. */
	| position LX_MORPHEME LX_HAS LX_IDENTIFIER tbu_tbus
		  {
		temp = atoi($4);	/* convert identifier to integer */
		cp = $4;		/* check for valid digit sequence */
		while (*cp != NUL)	/* should be digits */
		  {
			if (!isdigit(*cp++) &&
			pStamp_m->pLogFP != NULL)
			  {			/* found a non-digit; report error */
			fprintf(pStamp_m->pLogFP, "%s %s constant %s %s",
				tsterrhead, ltname, $4,
				   "in tbu expression is not a number.");
			fprintf(pStamp_m->pLogFP,
				   "\n%19sWill use the value %d for it", " ",temp);
			break;
			  }
		  }
				$$ = mklfi(MORPH_HAS_N_TBUS, $1, temp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tTbu_expr:=position morpheme has NUMBER %s",
			   (unsigned)$$, "tbus ");
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, %d)]",
				MORPH_HAS_N_TBUS, $1, temp);
		  }
		  }
			/* This checks to see if the indicated morpheme has */
			/* the indicated number of tbus */
	;

Tone_expr
	: position LX_TONE LX_IS Tone_none
		  {
				$$ = mklfti(TONE_IS, $1, $4);
#ifdef B4_0_4_11
		if ((default_tone_params & CYCLIC) &&
			($1 == ARGCURRENT ||
			 $1 == ARGLEFT    ||
			 $1 == ARGRIGHT) &&
			pStamp_m->pLogFP != NULL)
		  {
			fprintf(pStamp_m->pLogFP, "%s %s ", tsterrhead, ltname);
			fprintf(pStamp_m->pLogFP,
				"has a '%s tone is' condition in a cyclic rule.",
			   ($1 == ARGCURRENT ? "current"
								 : ($1 == ARGLEFT ? "left"
												  : "right")));
			fprintf(pStamp_m->pLogFP,
			   "\n%19sThe condition will probably not work.", " ");
		  }
#else
		if ((default_tone_params & CYCLIC) &&
			$1 == ARGCURRENT &&
			pStamp_m->pLogFP != NULL)
		  {
			fprintf(pStamp_m->pLogFP, "%s %s ", tsterrhead, ltname);
			fprintf(pStamp_m->pLogFP,
			"has a 'current tone is' condition in a cyclic rule.");
			fprintf(pStamp_m->pLogFP,
			   "\n%19sThe condition will probably not work.", " ");
		  }
#endif /* B4_0_4_11 */
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_expr:=position tone is TONE ",
			   (unsigned)$$);
			fprintf(pStamp_m->pLogFP, "[mklfti(%d, %d, 0x%x)]",
				TONE_IS, $1,
			   (unsigned)$4);
		  }
		  }
			/* This checks to see if the tone indicated by */
			/* position has the indicated tone.  If position is */
			/* left, the tone is the immediately preceding */
			/* tone.  If position is right, the tone is the */
			/* immediately following tone.  For cyclic rules, */
			/* this condition only makes sense if 'position' is */
			/* not current. */
	| position tone_status LX_TONE LX_IS Tone_none
		  {
		if ($2 != $5->ti_status &&
			pStamp_m->pLogFP != NULL)
		  {
			fprintf(pStamp_m->pLogFP,
			   "%s %s tone status inconsistency (%s is not %s) %s",
			   tsterrhead, ltname, tone_type_name($2),
			   tone_type_name($5->ti_status),
				   "in 'pos tone_status tone is TONE' condition.");
			fprintf(pStamp_m->pLogFP,
				"\n%19sWill use %s for both.", " ",
				tone_type_name($5->ti_status));
		  }
				$$ = mklfti(TONESTATUS_TONE_IS, $1, $5);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tTone_expr:=position tonestatus tone is %s",
			   (unsigned)$$, "TONE");
			fprintf(pStamp_m->pLogFP, " [mklfti(%d, %d, 0x%x)]",
				TONESTATUS_TONE_IS, $1,
			   (unsigned)$5);
		  }
		  }
			/* This scans the tones in the position for a tone */
			/* with the indicated status.  If this tone matches */
			/* the indicated tone pattern (in TONE), then the */
			/* condition is true.  If no such tone exists, the */
			/* condition fails.                                */
			/* If position is  then scanning is  through the */
			/*    --------     ----------------  ----------- */
			/*    initial      left-to-right     word        */
			/*    INITIAL      left-to-right     word        */
			/*    left         right-to-left     morpheme    */
			/*    current      left-to-right     morpheme    */
			/*    right        left-to-right     morpheme    */
			/*    final        right-to-left     word        */
			/*    FINAL        right-to-left     word        */
			/* It is assumed that the tone status is the same */
			/* between the "position tone_status tone" and the */
			/* tone_status of the tone (i.e. "final linked tone */
			/* is a floating H tone" does not make sense).  The */
			/* tone status value of the TONE will be used.  */
	| position LX_MORPHEME LX_TONE LX_IS Tone_none
		  {
				$$ = mklfti(MORPH_TONE_IS, $1, $5);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tTone_expr:=position morpheme tone is TONE",
			   (unsigned)$$);
			fprintf(pStamp_m->pLogFP, " [mklfti(%d, %d, 0x%x)]",
				MORPH_TONE_IS, $1,
			   (unsigned)$5);
		  }
		  }
			/* This checks to see if the morpheme indicated by */
			/* position has only the indicated tone. */
	| position LX_MORPHEME LX_UNDER LX_TONE LX_IS Tone_none
		  {
				$$ = mklfti(MORPH_UL_TONE_IS, $1, $6);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_expr:=position morpheme underlying ",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP, "tone is TONE");
			fprintf(pStamp_m->pLogFP, " [mklfti(%d, %d, 0x%x)]",
				MORPH_UL_TONE_IS, $1,
			   (unsigned)$6);
		  }
		  }
			/* This checks to see if the morpheme indicated by */
			/* position has only the indicated underlying tone. */
	| position LX_TONE LX_PATTERN LX_IS Tone_Pattern
		  {
				$$ = mklftp(TONE_PATTERN_IS, $1, $5);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_expr:=position tone pattern is %s",
				(unsigned)$$, "TONEPATTERN ");
			fprintf(pStamp_m->pLogFP,
				"[mklftp(%d, %d, 0x%x)]", TONE_PATTERN_IS, $1,
				(unsigned)$5);
		  }
		  }
			/* This checks to see if the tone indicated by */
			/* position has the indicated tone pattern.  If */
			/* position is left, the tone is the immediately */
			/* preceding tone.  If position is right, the tone */
			/* is the immediately following tone.  For cyclic */
			/* rules, this only makes sense if 'position' is */
			/* not 'current'. */
	| position LX_MORPHEME LX_TONE LX_PATTERN LX_IS Tone_Pattern
		  {
				$$ = mklftp(MORPH_TONE_PAT_IS, $1, $6);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tTone_expr:=position morpheme tone pattern",
			   (unsigned)$$);
			fprintf(pStamp_m->pLogFP, "is TONEPATTERN");
			fprintf(pStamp_m->pLogFP, " [mklfti(%d, %d, 0x%x)]",
				MORPH_TONE_PAT_IS, $1,
			   (unsigned)$5);
		  }
		  }
			/* This checks to see if the morpheme indicated by */
			/* position has the indicated tone pattern. */
	| position LX_MORPHEME LX_UNDER LX_TONE LX_PATTERN LX_IS Tone_Pattern
		  {
				$$ = mklftp(MORPH_UL_TONE_PAT_IS, $1, $7);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_expr:=position morpheme underlying ",
			   (unsigned)$$);
			fprintf(pStamp_m->pLogFP, "tone pattern is TONEPATTERN ");
			fprintf(pStamp_m->pLogFP,
				"[mklftp(%d, %d, 0x%x)]", MORPH_UL_TONE_PAT_IS, $1,
			   (unsigned)$7);
		  }
		  }
			/* This checks to see if the morpheme indicated by */
			/* position has the indicated underlying tone */
			/* pattern. */
	| LX_WORD LX_TONE LX_PATTERN LX_IS Tone_Pattern
		  {
				$$ = mklftp(WORD_TONE_IS, $1, $5);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_expr:=word tone pattern is %s",
			   (unsigned)$$, "TONEPATTERN ");
			fprintf(pStamp_m->pLogFP, "[mklftp(%d, %d, 0x%x)]",
				WORD_TONE_IS, $1,
			   (unsigned)$5);
		  }
		  }
			/* This checks to see if the word's tone pattern is */
			/* the indicated tone pattern. */
	;

Type_expr
	: position LX_TYPE LX_IS type
		  {
				$$ = mklfi(TYPE_IS, $1, $4);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tType_expr:=position type is TYPE ",
				(unsigned)$$);
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, %d)]", TYPE_IS,
				$1, $4);
		  }
		  }
			/* This checks to see if the morpheme indicated by */
			/* position is of the indicated morpheme type */
			/* (prefix, suffix, root, etc.) */
	;


Tone_none
	: Tone
		  {
				$$ = $1;
		  }
	| LX_NONE
		  {
				$$ = (struct tone_id *)NULL;
		  }
			/* Identifies a particular tone or no tone at all. */
	;

Tone_Pattern
	: Tone_Pat
		  {
				$$ = $1;
		  }
	| LX_NONE
		  {
				$$ = (struct tone_pattern *)NULL;
		  }
			/* Identifies a particular tone pattern, which can */
			/* consist of no tones at all (none). */
	;

Tone_Pat
	: Tone_Pat Tone
		  {
				tmp_tp = mktonepattern($2);
		$$ = link_tone_pattern($1, tmp_tp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_Pat:=Tone_Pat Tone ",
			   (unsigned)$$);
			fprintf(pStamp_m->pLogFP, "[mktonepattern(0x%x)]",
				(unsigned)$2);
			fprintf(pStamp_m->pLogFP,"[link_tone_pattern(0x%x, 0x%x)]",
			   (unsigned)$1, (unsigned)tmp_tp);
		  }
		  }
	| Tone
		  {
				$$ = mktonepattern($1);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\n0x%x\tTone_Pattern:=Tone ",
			   (unsigned)$$);
			fprintf(pStamp_m->pLogFP, "[mktonepattern(0x%x)]",
				(unsigned)$1);
		  }
		  }
	;

onset_coda
	: LX_ONSET
		  {
		$$ = ONSET;
		  }
			/* The syllable has an initial consonant. */
	| LX_CODA
		  {
		$$ = CODA;
		  }
			/* The syllable has a final consonant. */
	;

prosodic_shape
	: LX_MONOSYLLABIC
		  {
		$$ = MONOSYLLABIC;
		  }
			/* The form has exactly one syllable. */
	| LX_DISYLLABIC
		  {
		$$ = DISYLLABIC;
		  }
			/* The form has exactly two syllables. */
	| LX_TRISYLLABIC
		  {
		$$ = TRISYLLABIC;
		  }
			/* The form has exactly three syllables. */
	| LX_QUADRISYLLABIC
		  {
		$$ = QUADRISYLLABIC;
		  }
			/* The form has exactly four syllables. */
	| LX_POLYSYLLABIC
		  {
		$$ = POLYSYLLABIC;
		  }
			/* The form has more than one syllable. */
	| LX_MONOMORAIC
		  {
		$$ = MONOMORAIC;
		  }
			/* The form has exactly one mora. */
	| LX_BIMORAIC
		  {
		$$ = BIMORAIC;
		  }
			/* The form has exactly two moras. */
	;

logop
	: LX_LO_AND
		  {
		$$ = LOGAND;
		  }
			/* Perform a logical ANDing of the two factors. */
	| LX_LO_IFF
		  {
		$$ = LOGIFF;
		  }
			/* Perform a logical IFF of the two factors. */
	| LX_LO_OR
		  {
		$$ = LOGOR;
		  }
			/* Perform a logical ORing of the two factors. */
	| LX_LO_XOR
		  {
		$$ = LOGXOR;
		  }
			/* Perform a logical exclusive ORing of the two */
			/* factors. */
	;

position
	: LX_CURRENT
		  {
		$$ = ARGCURRENT;
		  }
			/* The item being scanned. */
	| LX_LEFT
		  {
		$$ = ARGLEFT;
		  }
			/* The item to the left of the item being scanned. */
	| LX_LEFTTWO
		  {
		$$ = ARGLEFTTWO;
		  }
			/* The item two morphemes to the left of the item */
			/* being scanned. */
	| LX_RIGHT
		  {
		$$ = ARGRIGHT;
		  }
			/* The item to the right of the item being scanned. */
	| LX_RIGHTTWO
		  {
		$$ = ARGRIGHTTWO;
		  }
			/* The item two morphemes to the right of the item */
			/* being scanned. */
		| LX_FLEFT
		  {
		++bLeftSeen_m;
		$$ = FORLEFT;
		  }
			/* The item found in a FOR_SOME_LEFT or FOR_ALL_LEFT */
			/* scan. */
		| LX_FRIGHT
		  {
		++bRightSeen_m;
		$$ = FORRIGHT;
		  }
			/* The item found in a FOR_SOME_RIGHT or */
			/*  FOR_ALL_RIGHT scan. */
	| LX_PINITIAL
		  {
		$$ = INITIALM;
		  }
			/* The first item in the word. */
	| LX_INITIAL
		  {
		$$ = WINITIAL;
		  }
			/* The first item in the word. */
	| LX_PFINAL
		  {
		$$ = FINALM;
		  }
			/* The last item in the word. */
	| LX_FINAL
		  {
		$$ = WFINAL;
		  }
			/* The last item in the word. */
	;

word_position
	: LX_FIRST
		  {
		$$ = FIRSTINWORD;
		  }
			/* First item in the word. */
	| LX_SECOND
		  {
		$$ = SECONDINWORD;
		  }
			/* Second item in the word. */
	| LX_THIRD
		  {
		$$ = THIRDINWORD;
		  }
			/* Third item in the word. */
	| LX_ANTEPENULTIMATE
		  {
		$$ = ANTEPENULTIMATE;
		  }
			/* The antepenultimate item in the word. */
	| LX_PENULTIMATE
		  {
		$$ = PENULTIMATE;
		  }
			/* The penultimate item in the word. */
		| LX_ULTIMATE
		  {
		$$ = ULTIMATE;
		  }
			/* The ultimate item in the word. */
	;

tone_status
	: LX_BOUNDARY
		  {
		if (($$ = Boundary) == 0)
		  id_error("tone_status", "boundary");
		  }
			/* A boundary tone (one which associates to the */
			/* edge of some domain). */
			/* This has not been implemented yet. (9504.27) */
	| LX_DELINKED
		  {
		if (($$ = Delinked) == 0)
		   id_error("tone_status", "delinked");
		  }
			/* A delinked tone. */
	| LX_FLOATING
		  {
		if (($$ = Floating) == 0)
		  id_error("tone_status", "floating");
		  }
			/* A floating tone (either right-floating or */
			/* left-floating). */
	| LX_LEFT_FLOATING
		  {
		if (($$ = LeftFloating) == 0)
		  id_error("tone_status", "left-floating");
		  }
			/* A floating tone that is to the immediate left of */
			/* its tbu. */
	| LX_LINKED
		  {
		if (($$ = Linked) == 0)
		   id_error("tone_status", "linked");
		  }
			/* A linked tone. */
	| LX_MELODY
		  {
		if (($$ = Melody) == 0)
		  id_error("tone_status", "melody");
		  }
			/* Yeah, I'm wondering what this is, too. */
	| LX_RIGHT_FLOATING
		  {
		if (($$ = RightFloating) == 0)
		  id_error("tone_status", "right-floating");
		  }
			/* A floating tone that is to the immediate right of */
			/* its tbu. */
	;

type
	: LX_PREFIX
		  {
		$$ = PFX;
		  }
	| LX_INFIX
		  {
		$$ = IFX;
		  }
	| LX_ROOT
		  {
		$$ = ROOT;
		  }
	| LX_SUFFIX
		  {
		$$ = SFX;
		  }
	| LX_INITIAL
		  {
		$$ = WINITIAL;
		  }
	| LX_FINAL
		  {
		$$ = WFINAL;
		  }
	;

tbu_tbus
	: LX_TBU
		  {
		$$ = 0;
		  }
	| LX_TBUS
		  {
		$$ = 0;
		  }
	;
/*			9502.20 seeing if we can do without these
			IF    Condition_Body
			THEN  Tone_Rule_Body


			IF    Condition_Body
			THEN  Condition_Body
*/

%%

/*****************************************************************
 * NAME
 *    check_tone_pos
 * ARGUMENTS:
 *    pos = morpheme position
 * DESCRIPTION
 *    Determine if morpheme position is reasonable for a tone operation.
 *    Correct it if not along with a warning message.
 * RETURN VALUE
 *    (possibly corrected) morpheme position
 */
static int check_tone_pos(pos)
	 int pos;
{
  switch(pos)
	{
	case LX_CURRENT:		/* these are all fine */
	case LX_LEFT:
	case LX_LEFTTWO:
	case LX_RIGHT:
	case LX_RIGHTTWO:
	  break;
	case LX_PINITIAL:
	case LX_INITIAL:
	  pos = LX_LEFT;
	  if (pStamp_m->pLogFP != NULL)
	{
	  fprintf(pStamp_m->pLogFP,
		  "%s WARNING: using left position instead of %s in tone action",
		  tsterrhead, (pos == LX_PINITIAL) ? "PINITIAL" : "initial");
	  fprintf(pStamp_m->pLogFP, "\n\t\t\tportion of %s", ltname );
	}
	  break;
	case LX_PFINAL:
	case LX_FINAL:
	  pos = LX_RIGHT;
	  if (pStamp_m->pLogFP != NULL)
	{
	  fprintf(pStamp_m->pLogFP,
		  "%s WARNING: using right position instead of %s in tone action",
		  tsterrhead, (pos == LX_PFINAL) ? "PFINAL" : "final");
	  fprintf(pStamp_m->pLogFP, "\n\t\t\tportion of %s", ltname );
	}
	  break;
	}
  return(pos);

} /* end check_tone_pos */

/*****************************************************************
 * NAME
 *    get_default_cycle
 * ARGUMENTS:
 *    NONE
 * DESCRIPTION
 *    Return pointer to default cycle struct
 * RETURN VALUE
 *    pointer to the cycle struct
 */
struct cycle *get_default_cycle()
{
  return(default_cycle);

} /* end get_default_cycle */

/*****************************************************************
 * NAME
 *    get_edge_cond_rule_head
 * ARGUMENTS:
 *    NONE
 * DESCRIPTION
 *    Return pointer to head of linked list of tone_rule structs which
 *    are all edge conditions
 * RETURN VALUE
 *    pointer to the head of the list
 */
struct tone_rule *get_edge_cond_rule_head()
{
  return(Erule_head);

} /* end get_edge_cond_rule_head */

/*****************************************************************
 * NAME
 *    parseToneRule
 * ARGUMENTS:
 *    cp   - pointer to text of the rule
 *    type - type of tone rule: edge condition, edge rule, or tone rule
 * DESCRIPTION
 *    Call yyparse() and process the result
 * RETURN VALUE
 *    NONE
 */
void parseToneRule(cp, type, pStamp_in)
	 char *cp;
	 int type;
	 StampData *pStamp_in;
{
				/* initialize */
  trule = (struct tone_rule *)NULL;

  default_tone_params = CLEAR_RULE_TYPE(default_tone_params);

  do_morph_expr_check = TRUE;
				/* set error message */
  switch (type)
	{
	case DEFAULT_RULE:
	  tsterrhead = "\nDEFAULT_RULE";
	  default_tone_params |= DEFAULT_RULE;
	  ltname = "a default setting rule"; /* is this needed? */
	  do_morph_expr_check = FALSE;
	  break;

	case EDGE_CONDITION:
	  tsterrhead = "\nEDGE_CONDITION";
	  default_tone_params |= EDGE_CONDITION;
	  do_morph_expr_check = FALSE;
	  break;

	case EDGE_RULE:
	  tsterrhead = "\nEDGE_RULE";
	  default_tone_params |= EDGE_RULE;
	  break;

	case RIGHT_EDGE_RULE:
	  tsterrhead = "\nRIGHT_EDGE_RULE";
	  default_tone_params |= RIGHT_EDGE_RULE;
	  break;

	default:
	case TONE_RULE:
	  tsterrhead = "\nTONE_RULE";
	  default_tone_params |= TONE_RULE;
	  break;
	}
  if (rule_debug)
	{
	  fprintf(pStamp_m->pLogFP, "\n\nWorking on:");
	  fprintf(pStamp_m->pLogFP, "%s: %s", tsterrhead, cp);
	}
				/* go parse the input */
  rpp = cp;			/* set up for lexical input */
  pStamp_m = pStamp_in;
  if (yyparse())
	{                           /* show where parse failed in the test */
	  if (pStamp_m->pLogFP != NULL)
	{
	  if (*lexp)
		{
		  fprintf(pStamp_m->pLogFP, "\n%s <<ERROR DETECTED HERE>>", lexp );
		  fprintf(pStamp_m->pLogFP, " %s", (lexp + strlen(lexp) +1));
		}
	  else
		fprintf(pStamp_m->pLogFP,
		"\n%s <<ERROR DETECTED AT THE END; Possible missing paren>>",
		cp);
	}
				/* now skip the rest of the input by */
				/* repeatedly calling yylex */
	  while (YYLEX > 0)
	;
	}
  else
	{
				/* process the result */
	  switch (type)
	{
	case DEFAULT_RULE:
				/* nothing to do */
	  break;

	case EDGE_CONDITION:
	  if (trule != (struct tone_rule *)NULL &&
		  trule->tr_action != (struct action *)NULL &&
		  trule->tr_action->ac_op != SET_EDGE_COND)
		{
		  if (pStamp_m->pLogFP != NULL)
		{
		  fprintf(pStamp_m->pLogFP,
		   "\n%s: expected edge condition and got regular rule in %s.",
			  tsterrhead, ltname);
		  fprintf(pStamp_m->pLogFP, "\n\t\tWill ignore this rule!");
		}
		}
	  else
		{
				/* add rule to list */
		  Erule_head = link_tone_rule(Erule_head, trule);
		}
	  break;

	default:
	case EDGE_RULE:
	case RIGHT_EDGE_RULE:
	case TONE_RULE:
				/* add rule to list */
	  Trule_head = link_tone_rule(Trule_head, trule);
	  break;
	}
	}

} /* end parseToneRule */

/*****************************************************************
 * NAME
 *    get_tone_rule_head
 * ARGUMENTS:
 *    NONE
 * DESCRIPTION
 *    Return pointer to head of linked list of tone_rule structs
 * RETURN VALUE
 *    pointer to the head of the list
 */
struct tone_rule *get_tone_rule_head()
{
  return(Trule_head);

} /* end get_tone_rule_head */

/*****************************************************************
 * NAME
 *    get_tone_rule_tail
 * ARGUMENTS:
 *    NONE
 * DESCRIPTION
 *    Return pointer to tail of linked list of tone_rule structs
 * RETURN VALUE
 *    pointer to the tail of the list
 */
struct tone_rule *get_tone_rule_tail()
{
  struct tone_rule *trp;

  for (trp = Trule_head;
	   trp != (struct tone_rule *)NULL &&
	   trp->tr_right != (struct tone_rule *)NULL;
	   trp = trp->tr_right)
	;

  return(trp);

} /* end get_tone_rule_head */

/*****************************************************************
 * NAME
 *    id_error
 * ARGUMENTS
 *    expected = type of identifier expected
 *    found    = string that was found
 * DESCRIPTION
 *    prints an error message when an incorrect IDENTIFIER is found
 * RETURN VALUE
 *    none
 */
static void id_error(expected, found)
	 char *expected, *found;
{
  if (pStamp_m->pLogFP != NULL)
	fprintf(pStamp_m->pLogFP, "%s Undefined %s %s in %s", tsterrhead,
		expected, found, ltname );
} /* end id_error */

/*****************************************************************
 * NAME
 *    init_tone_rule
 * ARGUMENTS:
 *    rd = rule debug flag
 * DESCRIPTION
 *    Initialize local statics
 * RETURN VALUE
 *    NONE
 */
void init_tone_rule(rd, pStamp_in)
	 int   rd;
	 StampData *pStamp_in;
{
  pStamp_m = pStamp_in;
  if (pStamp_in->pLogFP == NULL)
	rule_debug = FALSE;
  else
	rule_debug = rd;

} /* end init_tone_rule */

/*****************************************************************
 * NAME
 *    init_tone_rule_stats
 * ARGUMENTS:
 *    NONE
 * DESCRIPTION
 *    Initialize tone rule statistics
 * RETURN VALUE
 *    NONE
 */
void init_tone_rule_stats()
{
  struct tone_rule *tp;

  for (tp = Trule_head;
	   tp != (struct tone_rule *)NULL;
	   tp = tp->tr_right)
	tp->tr_tried = tp->tr_applied = 0L;

  for (tp = Erule_head;
	   tp != (struct tone_rule *)NULL;
	   tp = tp->tr_right)
	tp->tr_tried = tp->tr_applied = 0L;


} /* end init_tone_rule_stats */

/*****************************************************************
 * NAME
 *    link_action
 * ARGUMENTS:
 *    ac_head = pointer to head of action list
 *    ac_new  = pointer to action struct to be linked to end of list
 * DESCRIPTION
 *    Append an action struct to a linked list of action structs
 * RETURN VALUE
 *    pointer to the head of the list
 */
static struct action *link_action(ac_head, ac_new)
	 struct action    *ac_head;
	 struct action    *ac_new;
{
  register struct action *ac;

				/* find end of list */
  for (ac = ac_head;
	   ac != (struct action *)NULL &&
	   ac->ac_next != (struct action *)NULL;
	   ac = ac->ac_next)
	;
				/* insert new */
  if (ac == (struct action *)NULL)
	ac_head = ac_new;		/* should never happen, but... */
  else
	ac->ac_next = ac_new;

  return(ac_head);

} /* end link_action */

/*****************************************************************
 * NAME
 *    link_domain_list
 * ARGUMENTS:
 *    dl_head = pointer to head of domain_list list
 *    dl_new  = pointer to domain_list struct to be linked to end of list
 * DESCRIPTION
 *    Append a domain_list struct to a linked list of domain_list structs
 * RETURN VALUE
 *    pointer to the head of the list
 */
static struct domain_list *link_domain_list(dl_head, dl_new)
	 struct domain_list    *dl_head;
	 struct domain_list    *dl_new;
{
  register struct domain_list *dl;

				/* find end of list */
  for (dl = dl_head;
	   dl != (struct domain_list *)NULL &&
	   dl->dl_next != (struct domain_list *)NULL;
	   dl = dl->dl_next)
	;
				/* insert new */
  if (dl == (struct domain_list *)NULL)
	dl_head = dl_new;		/* should never happen, but... */
  else
	dl->dl_next = dl_new;

  return(dl_head);

} /* end link_domain_list */

/*****************************************************************
 * NAME
 *    link_tone_pattern
 * ARGUMENTS:
 *    tp_head = pointer to head of tone_pattern list
 *    tp_new  = pointer to tone_pattern struct to be linked to end of list
 * DESCRIPTION
 *    Append a tone_pattern struct to a linked list of tone_pattern structs
 * RETURN VALUE
 *    pointer to the head of the list
 */
static struct tone_pattern *link_tone_pattern(tp_head, tp_new)
	 struct tone_pattern    *tp_head;
	 struct tone_pattern    *tp_new;
{
  register struct tone_pattern *tp;

				/* find end of list */
  for (tp = tp_head;
	   tp != (struct tone_pattern *)NULL &&
	   tp->tp_next != (struct tone_pattern *)NULL;
	   tp = tp->tp_next)
	;
				/* insert new */
  if (tp == (struct tone_pattern *)NULL)
	tp_head = tp_new;		/* should never happen, but... */
  else
	tp->tp_next = tp_new;

  return(tp_head);

} /* end link_tone_pattern */

/*****************************************************************
 * NAME
 *    link_tone_rule
 * ARGUMENTS:
 *    tp_head = pointer to head of tone_rule list
 *    tp_new  = pointer to tone_rule struct to be linked to end of list
 * DESCRIPTION
 *    Append a tone_rule struct to a linked list of tone_rule structs
 * RETURN VALUE
 *    pointer to the head of the list
 */
static struct tone_rule *link_tone_rule(tp_head, tp_new)
	 struct tone_rule    *tp_head;
	 struct tone_rule    *tp_new;
{
  register struct tone_rule *tp;

				/* find end of list */
  for (tp = tp_head;
	   tp != (struct tone_rule *)NULL &&
	   tp->tr_right != (struct tone_rule *)NULL;
	   tp = tp->tr_right)
	;
				/* insert new */
  if (tp == (struct tone_rule *)NULL)
	tp_head = tp_new;
  else
	{
	  tp->tr_right = tp_new;
	  tp->tr_left  = tp;
	}

  return(tp_head);

} /* end link_tone_rule */

/*****************************************************************
 * NAME
 *    mkaction
 * ARGUMENTS:
 *    op    = operation
 *    tip   = pointer to tone_id    struct
 *    dim   = direction, iteration, mode values
 *    ocp   = OCP flag
 *    dip   = pointer to domain_id struct
 *    econd = edge condition
 * DESCRIPTION
 *    Create an action struct and set it's operation, tone, params, and domain
 * RETURN VALUE
 *    pointer to the action structure
 */
static struct action *mkaction(op, tip, dim, ocp, dip, econd)
	 int               op;
	 struct tone_id   *tip;
	 int               dim;
	 int               ocp;
	 struct domain_id *dip;
	 long              econd;
{
  register struct action *acp;
  register int            params;

				/* allocate an action struct */
  acp = structalloc( action );
				/* initialize its link */
  acp->ac_next = (struct action *)NULL;

				/* set values without explicit defaults */
  acp->ac_op     = op;
  acp->ac_tone   = tip;

				/* force a linked status for SPREAD */
  if (op == SPREAD &&
	  acp->ac_tone != (struct tone_id *)NULL)
	acp->ac_tone->ti_status = Linked;


  if (op == SET_EDGE_COND)
	{
	  acp->ac_econds = econd;
	  acp->ac_params = 0;
	}
  else
	{
	  acp->ac_econds = 0L;
				/* check for defaults */
	  if (dip == (struct domain_id *)NULL)
	acp->ac_domain = default_domain;
	  else
	acp->ac_domain = dip;
				/* set parameters */
	  params = dim + ocp;
	  if (!DIRECTION(params))
	acp->ac_params += DIRECTION(default_action_params);
	  else
	acp->ac_params += DIRECTION(params);
	  if (!ITERATION(params))
	acp->ac_params += ITERATION(default_action_params);
	  else
	acp->ac_params += ITERATION(params);
	  if (!MODE(params))
	acp->ac_params += MODE(default_action_params);
	  else
	acp->ac_params += MODE(params);
	  if (!OCP(params))
	acp->ac_params += OCP(default_action_params);
	  else
	acp->ac_params += OCP(params);
	}

  return(acp);

} /* end mkaction */

/*****************************************************************
 * NAME
 *    mkcycle
 * ARGUMENTS:
 *    dir     = direction flag
 *    domains = head of linked list of domain_list structs
 * DESCRIPTION
 *    Create a cycle struct and set it's direction and domain list
 * RETURN VALUE
 *    pointer to the cycle structure
 */
static struct cycle *mkcycle(dir, domains)
	 int                 dir;
	 struct domain_list *domains;
{
  register struct cycle *cp;

				/* allocate a cycle struct */
  cp = structalloc( cycle );

				/* set values */
  cp->cy_dir    = dir;
  cp->cy_domain = domains;

  return(cp);

} /* end mkcycle */

/*****************************************************************
 * NAME
 *    mkdomainid
 * ARGUMENTS:
 *    type   = type of entity (domain or morpheme)
 *    domain = domain value if type is domain
 * DESCRIPTION
 *    Create a domain_id struct and set it's type and domain
 * RETURN VALUE
 *    pointer to the domain_id structure
 */
static struct domain_id *mkdomainid(type, domain)
	 int type;
	 int domain;
{
  register struct domain_id *dip;

				/* allocate a domain_id struct */
  dip = structalloc( domain_id );

				/* set values */
  dip->di_edge   = 0;
  dip->di_type   = type;
  switch (type)
	{
	case DI_DOMAIN:  		/* fall through */
	case DI_MORPHEME:		/* fall through */
	case DI_WORD:
	dip->u.di_domain = domain;
	break;
	default:
	dip->u.di_word_position = domain;
	break;
	}

  return(dip);

} /* end mkdomainid */

/*****************************************************************
 * NAME
 *    mkdomainlist
 * ARGUMENTS:
 *    domain = domain value
 * DESCRIPTION
 *    Create a domain_list struct and set it's domain
 * RETURN VALUE
 *    pointer to the domain_list structure
 */
static struct domain_list *mkdomainlist(domain)
	 int domain;
{
  register struct domain_list *dlp;

				/* allocate a domain_list struct */
  dlp = structalloc( domain_list );

				/* set values */
  dlp->dl_domain = domain;
  dlp->dl_next   = (struct domain_list *)NULL;

  return(dlp);

} /* end mkdomainlist */

/*****************************************************************
 * NAME
 *    mklfcc
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = pointer to category class for right argument
 * DESCRIPTION
 *    Create a leaf node pointing to a category class in the condition
 *		parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfcc(opcode, left, right)
	 int               opcode;
	 int               left;
	 AmpleCategoryClass *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;			/* store the left morpheme position */
  cp->cr.r_ccp  = right;		/* store the category class pointer */

  return(cp);

} /* end mklfcc */

/*****************************************************************
 * NAME
 *    mklfdi
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = pointer to domain_id struct for right argument
 * DESCRIPTION
 *    Create a leaf node pointing to a domain_id struct in the condition
 *		parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfdi(opcode, left, right)
	 int               opcode;
	 int               left;
	 struct domain_id *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;			/* store the left morpheme position */
  cp->cr.r_dip  = right;		/* store the domain_id pointer */

  return(cp);

} /* end mklfdi */

/*****************************************************************
 * NAME
 *    mklfi
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = integer value stored for right argument
 * DESCRIPTION
 *    Create a leaf node using an integer value in the condition parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfi(opcode, left, right)
	 int opcode;
	 int left;
	 int right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos = left;			/* store the left morpheme position */
  cp->cr.r_int = right;			/* store the integer value */

  return(cp);

} /* end mklfi */

/*****************************************************************
 * NAME
 *    mklflg
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = value for property
 * DESCRIPTION
 *    Create a leaf node pointing to a property in the condition  parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklflg(opcode, left, right)
	 int           opcode;
	 int           left;
	 unsigned short right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;                 /* store the left morpheme position */
					/* store the allomorph property */
  cp->cr.r_prop = (unsigned short *) allocMemory(sizeof(unsigned short));
  *(cp->cr.r_prop) = right;

  return(cp);

} /* end mklflg */

/*****************************************************************
 * NAME
 *    mklfli
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = integer value stored for right argument
 * DESCRIPTION
 *    Create a leaf node using a long integer value in the condition
 *    parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfli(opcode, left, right)
	 int opcode;
	 int left;
	 long right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;			/* store the left morpheme position */
  cp->cr.r_long = right;		/* store the long integer value */

  return(cp);

} /* end mklfli */

/*****************************************************************
 * NAME
 *    mklfmc
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = pointer to morpheme class for right argument
 * DESCRIPTION
 *    Create a leaf node pointing to a morpheme class in the condition
 *		parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfmc(opcode, left, right)
	 int                 opcode;
	 int                 left;
	 AmpleMorphClass *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;			/* store the left morpheme position */
					/* store the morpheme class pointer */
  cp->cr.r_mcp  = (StringClass *)right;

  return(cp);

} /* end mklfmc */

/*****************************************************************
 * NAME
 *    mklfs
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = pointer to character string for right argument
 * DESCRIPTION
 *    Create a leaf node storing a string value in the condition parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfs(opcode, left, right)
	 int   opcode;
	 int   left;
	 char *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode   = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos    = left;		/* store the left morpheme position */
  cp->cr.r_string = right;		/* store the integer value */

  return(cp);

} /* end mklfs */

/*****************************************************************
 * NAME
 *    mklfsc
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = pointer to string class for right argument
 * DESCRIPTION
 *    Create a leaf node pointing to a string class in the condition
 *		parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfsc(opcode, left, right)
	 int                  opcode;
	 int                  left;
	 StringClass         *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;			/* store the left morpheme position */
  cp->cr.r_scp  = right;		/* store the string class pointer */

  return(cp);

} /* end mklfsc */

/*****************************************************************
 * NAME
 *    mklfti
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = pointer to tone_id struct for right argument
 * DESCRIPTION
 *    Create a leaf node pointing to a tone_id struct in the condition
 *		parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfti(opcode, left, right)
	 int             opcode;
	 int             left;
	 struct tone_id *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;			/* store the left morpheme position */
  cp->cr.r_tip  = right;		/* store the tone_id pointer */

  return(cp);

} /* end mklfti */

/*****************************************************************
 * NAME
 *    mklftp
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = pointer to tone_pattern struct for right argument
 * DESCRIPTION
 *    Create a leaf node pointing to a tone_pattern struct in the condition
 *		parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklftp(opcode, left, right)
	 int                  opcode;
	 int                  left;
	 struct tone_pattern *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;			/* store the left morpheme position */
  cp->cr.r_tpip = right;		/* store the tone_id pointer */

  return(cp);

} /* end mklftp */

/*****************************************************************
 * NAME
 *    mknode
 * ARGUMENTS:
 *    opcode = kind of node
 *    left   = left child of this node
 *    right  = right child of this node
 * DESCRIPTION
 *    Create a node in the conditions parse tree
 * RETURN VALUE
 *    pointer to the cond_node structure
 */
static struct cond_node *mknode(opcode, left, right )
	 int               opcode;
	 struct cond_node *left;
	 struct cond_node *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* save the op code */
  cp->cl.l_son = left;			/* save the left subtree */
  cp->cr.r_son = right;			/* save the right subtree */

  return(cp);

} /* end mknode */

/*****************************************************************
 * NAME
 *    mkrule
 * ARGUMENTS:
 *    action    = pointer to action    struct
 *    cycle     = pointer to cycle     struct
 *    condition = pointer to cond_node struct
 * DESCRIPTION
 *    Create a tone_rule struct and set it's action, cycle, and condition
 * RETURN VALUE
 *    pointer to the tone_rule structure
 */
static struct tone_rule *mkrule(action, cycle, condition)
	 struct action    *action;
	 struct cycle     *cycle;
	 struct cond_node *condition;
{
  register struct tone_rule *tp;
  tp = structalloc( tone_rule );
				/* initialize */
  tp->tr_name     = (char *)NULL;
  tp->tr_params   = default_tone_params;

  tp->tr_action = action;
  tp->tr_cond   = condition;
  tp->tr_cycle  = cycle;

  tp->tr_right = tp->tr_left = (struct tone_rule *)NULL;

  return(tp);

} /* end mkrule */

/*****************************************************************
 * NAME
 *    mktoneid
 * ARGUMENTS:
 *    status  = tone status (linked, floating, etc.)
 *    params  = parameters (single/plural, default)
 *    pos     = morpheme position (unspecified, current, left, right)
 *    tvlp    = pointer to a tone_value_list struct
 * DESCRIPTION
 *    Create a tone_id struct and set it's status, params, and value
 * RETURN VALUE
 *    pointer to the tone_id structure
 */
static struct tone_id *mktoneid(status, params, pos, tvlp)
	 int                     status;
	 int                     params;
	 int                     pos;
	 struct tone_value_list *tvlp;
{
  register struct tone_id *tip;

  tip            = structalloc( tone_id );
  tip->ti_status = status;
  tip->ti_params = params;
  tip->ti_pos    = pos;
  tip->ti_value  = tvlp;

  return(tip);

} /* end mktoneid */

/*****************************************************************
 * NAME
 *    mktonepattern
 * ARGUMENTS:
 *    toneid  = pointer to a tone_id struct
 * DESCRIPTION
 *    Create a tone_pattern struct and set it's tone_id
 * RETURN VALUE
 *    pointer to the tone_pattern structure
 */
static struct tone_pattern *mktonepattern(toneid)
	 struct tone_id *toneid;
{
  register struct tone_pattern *tpp;

  tpp            = structalloc( tone_pattern );
  tpp->tp_tone = toneid;

  return(tpp);

} /* end mktonepattern */

/*****************************************************************
 * NAME
 *    set_tone_cycle
 * ARGUMENTS:
 *    cycle = true or false
 * DESCRIPTION
 *    Set default tone cycle parameter to cycle
 * RETURN VALUE
 *    NONE
 */
void set_tone_cycle(cycle)
	 int cycle;
{

  if (cycle)
	default_tone_params |= CYCLIC;
  else
	default_tone_params &= NONCYCLIC;

} /* end set_tone_cycle */

/*****************************************************************
 * NAME
 *    show_domain_id
 * ARGUMENTS:
 *    dp - pointer to a domain_id structure
 * DESCRIPTION
 *    Show a domain_id
 * RETURN VALUE
 *    NONE
 */
static void show_domain_id(dp)
	 struct domain_id *dp;
{

  if (dp == (struct domain_id*)NULL ||
	  pStamp_m->pLogFP == NULL)
	return;

  switch (dp->di_edge)
	{
	case LEFT_EDGE:
	  cp = "at left edge of";
	  break;

	case RIGHT_EDGE:
	  cp = "at right edge of";
	  break;

	case 0:
	  cp = "within";
	  break;

	default:
	  cp = "Unknown domain edge!  Program error!";
	  break;
	}
  fprintf(pStamp_m->pLogFP, "\n\t\t%s", cp);

  switch (dp->di_type)
	{
	case DI_DOMAIN:
	cp = tone_domain_name(dp->u.di_domain);
	break;
	case DI_MORPHEME:
	cp = "morpheme";
	break;
	case DI_WORD:
		cp = "word";
	break;
	default:
	switch (dp->u.di_word_position)
	  {
	  case FIRSTINWORD:
		  cp = "first";
		  break;
	  case SECONDINWORD:
		  cp = "second";
		  break;
	  case THIRDINWORD:
		  cp = "third";
		  break;
	  case ANTEPENULTIMATE:
		  cp = "antepenultimate";
		  break;
	  case PENULTIMATE:
		  cp = "penultimate";
		  break;
	  case ULTIMATE:
		  cp = "ultimate";
		  break;
	  }
	break;
	}


  fprintf(pStamp_m->pLogFP, " %s", cp);

} /* end show_domain_id */

/*****************************************************************
 * NAME
 *    show_rule_action
 * ARGUMENTS:
 *    ap - pointer to an action structure
 * DESCRIPTION
 *    Show a tone rule's actions
 * RETURN VALUE
 *    NONE
 */
void show_rule_action(ap)
	 struct action *ap;
{
  char *op;

  if (pStamp_m->pLogFP == NULL)
	return;			/* no place to show it! */

  if (ap == (struct action *)NULL)
	{
	  fprintf(pStamp_m->pLogFP,
		  "\n\tNo action for rule!  This should not happen!");
	  return;
	}

  switch (ap->ac_op)
	{
	case ASSOCIATE:
	  op = "Associate";
	  break;

	case DELETE:
	  op = "Delete";
	  break;

	case DELINK:
	  op = "Delink";
	  break;

	case INSERT:
	  op = "Insert";
	  break;

	case LINK:
	  op = "Link";
	  break;

	case SPREAD:
	  op = "Spread";
	  break;

	case COPY:
	  op = "Copy";
	  break;

	case SET_EDGE_COND:
	  op = "Set edge condition to ";
	  break;

	default:
	  op = "Unknown operation!  Program error!";
	  break;
	}
  fprintf(pStamp_m->pLogFP, "\n\t%s", op);

  if (ap->ac_op == SET_EDGE_COND)
	{
	  if ((op = edge_cond_name(ap->ac_econds)) != (char *)NULL)
	fprintf(pStamp_m->pLogFP, "%s", op);
	  else
	fprintf(pStamp_m->pLogFP,
		   "unknown edge condition (%ld)!  Program error!", ap->ac_econds);
	}
  else
	{
	  show_tone_id(ap->ac_tone);

	  if (DIRECTION(ap->ac_params) == LEFTWARD)
	fprintf(pStamp_m->pLogFP, " right-to-left");
	  else
	fprintf(pStamp_m->pLogFP, " left-to-right");

	  switch (ITERATION(ap->ac_params))
	{
	case NONITERATIVELY:
	  op = "non-iteratively";
	  break;

	case ITERATIVELY:
	  op = "iteratively";
	  break;

	case EDGE_IN:
	  op = "edge-in";
	  break;

	case ONE_TO_ONE:
	  op = "one-to-one";
	  break;

	default:
	  op = "Unknown iteration type! Program error!";
	  break;
	}
	  fprintf(pStamp_m->pLogFP, " %s", op);

	  if (ap->ac_op != DELETE)
	{
	  switch(MODE(ap->ac_params))
		{
		case FEATURE_ADDING:
		  op = "feature-adding";
		  break;

		case FEATURE_CHANGING:
		  op = "feature-changing";
		  break;

		case FEATURE_FILLING:
		  op = "feature-filling";
		  break;

		default:
		  op = "Unknown mode!  Program error!";
		  break;
		}
	  fprintf(pStamp_m->pLogFP, "\n\t\tusing %s mode", op);

	  switch (OCP(ap->ac_params))
		{
		case OPTIONAL_OCP_BLOCKAGE:
		  op = "optional-OCP-blockage";
		  break;

		case OCP_BLOCKAGE:
		  op = "OCP-blockage";
		  break;

		case OCP_IGNORED:
		  op = "OCP-ignored";
		  break;

		case OCP_MERGER:
		  op = "OCP-merger";
		  break;

		default:
		  op = "Unknown OCP parameter!  Program error!";
		  break;
		}
	  fprintf(pStamp_m->pLogFP, " with %s", op);
	}

	  show_domain_id(ap->ac_domain);
	}

} /* end show_rule_action */

/*****************************************************************
 * NAME
 *    show_rule_cond
 * ARGUMENTS:
 *    cdp - pointer to a cond_node struct
 * DESCRIPTION
 *    Show a tone rule's condtions
 * RETURN VALUE
 *    NONE
 */
static void show_rule_cond(cdp)
	 struct cond_node *cdp;
{

  if (cdp == (struct cond_node *)NULL ||
	  pStamp_m->pLogFP == NULL)
	return;

  fprintf(pStamp_m->pLogFP, "\n\tCONDITION:\n");
  tree_walk(cdp, 3);

} /* end show_rule_cond */

/*****************************************************************
 * NAME
 *    show_tone_id
 * ARGUMENTS:
 *    tp - pointer to a tone_id structure
 * DESCRIPTION
 *    Show a tone_id
 * RETURN VALUE
 *    NONE
 */
static void show_tone_id(tp)
	 struct tone_id *tp;
{
  if (pStamp_m->pLogFP == NULL)
	return;

  if (tp == (struct tone_id*)NULL)
	{
	  fprintf(pStamp_m->pLogFP, " none");
	  return;
	}

  if (tp->ti_params == DEFAULT)
	fprintf(pStamp_m->pLogFP, " default");
  else if (tp->ti_params & 001)
	fprintf(pStamp_m->pLogFP, " a ");
  if (tp->ti_pos)
	  show_where(tp->ti_pos);
  fprintf(pStamp_m->pLogFP, "%s", tone_type_name(tp->ti_status));
  if (tp->ti_value != (struct tone_value_list *)NULL)
	fprintf(pStamp_m->pLogFP, " %s", tp->ti_value->tv_str);
  fprintf(pStamp_m->pLogFP, " tone");
  if (tp->ti_params & 002)
	putc('s', pStamp_m->pLogFP);

} /* end show_tone_id */

/*****************************************************************
 * NAME
 *    show_tone_pattern
 * ARGUMENTS:
 *    tp - pointer to a tone_pattern structure
 * DESCRIPTION
 *    Show a tone_pattern
 * RETURN VALUE
 *    NONE
 */
static void show_tone_pattern(tp)
	 struct tone_pattern *tp;
{

  if (pStamp_m->pLogFP == NULL)
	return;

  if (tp == (struct tone_pattern*)NULL)
	{
	  fprintf(pStamp_m->pLogFP, " none");
	  return;
	}

  for (;
	   tp != (struct tone_pattern*)NULL;
	   tp = tp->tp_next)
	show_tone_id(tp->tp_tone);

} /* end show_tone_pattern */

/*****************************************************************
 * NAME
 *    show_tone_rule
 * ARGUMENTS:
 *    tp - pointer to a tone rule structure
 * DESCRIPTION
 *    Show a tone rule
 * RETURN VALUE
 *    NONE
 */
static void show_tone_rule(tp)
	 struct tone_rule *tp;
{
  char               *cp;
  struct action      *ap;
  struct domain_list *dlp;

  if (pStamp_m->pLogFP == NULL)
	return;

  if (tp == (struct tone_rule*)NULL)
	return;

  fprintf(pStamp_m->pLogFP, "\n%s is ", tp->tr_name);
  switch(RULE_TYPE(tp->tr_params))
	{
	case EDGE_CONDITION:
	  cp = "an edge condition";
	  break;

	case EDGE_RULE:
	  cp = "an edge rule";
	  break;

	case RIGHT_EDGE_RULE:
	  cp = "a right edge rule";
	  break;

	case TONE_RULE:
	  cp = "a tone rule";
	  break;

	default:
	  cp = "Unknown type! Program error!!";
	}
  fprintf(pStamp_m->pLogFP, "%s", cp);
  if (OPTIONALITY(tp->tr_params))
	fprintf(pStamp_m->pLogFP, ", is optional");
  if (!RULE_CYCLICITY(tp->tr_params))
	{
	  fprintf(pStamp_m->pLogFP, " and is noncyclic");
	}
  else
	{
	  fprintf(pStamp_m->pLogFP, " and is cyclic\n\t\t");
	  if (tp->tr_cycle == (struct cycle *)NULL)
	{
	  fprintf(pStamp_m->pLogFP,
		  "from the innermost morphological domain outward");
	}
	  else if (tp->tr_cycle->cy_domain == (struct domain_list *)NULL)
	{
	  fprintf(pStamp_m->pLogFP, "in a %s fashion across the word",
		 (tp->tr_cycle->cy_dir == RIGHTWARD) ? "left-to-right"
											 : "right-to-left");
	}
	  else
	{
	  fprintf(pStamp_m->pLogFP, "within the ");
	  for (dlp = tp->tr_cycle->cy_domain;
		   dlp != (struct domain_list *)NULL;
		   dlp = dlp->dl_next)
		{
/*	  fprintf(pStamp_m->pLogFP, "%s", find_domain_name(dlp->dl_domain)); */
		}
	  fprintf(pStamp_m->pLogFP, " domain(s)");
	}

	}
  putc('.', pStamp_m->pLogFP);

  for (ap = tp->tr_action;
	   ap != (struct action *)NULL;
	   ap = ap->ac_next)
	{
	  show_rule_action(ap);
	  putc((ap->ac_next == (struct action *)NULL) ? '.' : ',',
	   pStamp_m->pLogFP);
	}
  show_rule_cond(tp->tr_cond);

} /* end show_tone_rule */

/*****************************************************************
 * NAME
 *    show_tone_rules
 * ARGUMENTS:
 *    NONE
 * DESCRIPTION
 *    Show tone rules
 * RETURN VALUE
 *    NONE
 */
void show_tone_rules()
{
  struct tone_rule *tp;

  if (pStamp_m->pLogFP == NULL)
	return;

  fprintf(pStamp_m->pLogFP, "\n\nTone Rules:");

  for (tp = Trule_head;
	   tp != (struct tone_rule *)NULL;
	   tp = tp->tr_right)
	show_tone_rule(tp);


  fprintf(pStamp_m->pLogFP, "\n\nEdge Condition Rules:");

  for (tp = Erule_head;
	   tp != (struct tone_rule *)NULL;
	   tp = tp->tr_right)
	show_tone_rule(tp);

} /* end show_tone_rules */

/***************************************************************************
 * NAME
 *    show_where
 * ARGUMENTS
 *    pos   - morpheme position
 * DESCRIPTION
 *    show the morpheme position
 * RETURN VALUE
 *    none
 */
static void show_where( pos )
	 int pos;
{
  if (pStamp_m->pLogFP == NULL)
	return;

  switch (pos)
	{
	case ARGCURRENT:	fprintf(pStamp_m->pLogFP, "current ");	break;
	case ARGLEFT:	fprintf(pStamp_m->pLogFP, "left ");	break;
	case ARGRIGHT:	fprintf(pStamp_m->pLogFP, "right ");	break;
	case INITIALM:	fprintf(pStamp_m->pLogFP, "INITIAL ");	break;
	case FINALM:	fprintf(pStamp_m->pLogFP, "FINAL ");	break;
	case WINITIAL:	fprintf(pStamp_m->pLogFP, "initial ");	break;
	case WFINAL:	fprintf(pStamp_m->pLogFP, "final ");	break;
	default:		fprintf(pStamp_m->pLogFP, "<?> ");	break;
	}
}	/* end show_where  */

/***************************************************************************
 * NAME
 *    t_indent
 * ARGUMENTS
 *    depth - indentation depth for printout
 *    str   - what to display
 * DESCRIPTION
 *    indent for the tree display
 * RETURN VALUE
 *    none
 */
static void t_indent(depth,str)      /* indent for the tree display */
	 int depth;
	 char *str;
{
  register int k;
  if (pStamp_m->pLogFP == NULL)
	return;

  for ( k = 0 ; k < depth ; ++k )
	fprintf(pStamp_m->pLogFP, "    ");
  fprintf(pStamp_m->pLogFP, "%s",str);
}

/***************************************************************************
 * NAME
 *    tone_rule_stats
 * ARGUMENTS
 *    NONE
 * DESCRIPTION
 *    show tone rule statistics
 * RETURN VALUE
 *    none
 */
void tone_rule_stats()
{
  struct tone_rule *tp;

  if (pStamp_m->pLogFP == NULL)
	return;

  fprintf(pStamp_m->pLogFP, "\n\n   Counts for Tone Rules:");

  for (tp = Trule_head;
	   tp != (struct tone_rule *)NULL;
	   tp = tp->tr_right)
	fprintf(pStamp_m->pLogFP,  "\n%26s tried %5ld time%s applied %ld.",
			tp->tr_name,
			tp->tr_tried, (tp->tr_tried==1) ? ", " : "s,",
			tp->tr_applied );

  fprintf(pStamp_m->pLogFP, "\n\n   Counts for Edge Condition Rules:");

  for (tp = Erule_head;
	   tp != (struct tone_rule *)NULL;
	   tp = tp->tr_right)
	fprintf(pStamp_m->pLogFP,  "\n%26s tried %5ld time%s applied %ld.",
			tp->tr_name,
			tp->tr_tried, (tp->tr_tried==1) ? ", " : "s,",
			tp->tr_applied );

} 	/* end tone_rule_stats */

/***************************************************************************
 * NAME
 *    tree_walk
 * ARGUMENTS
 *    condp - pointer to the cond to be traversed
 *    depth - indentation depth for printout
 * DESCRIPTION
 *    Traverse the syntax tree structure in inorder fashion.
 * RETURN VALUE
 *    none
 */
static void tree_walk(condp,depth)
	 struct cond_node *condp;
	 int depth;
{
  char *p;

  if (pStamp_m->pLogFP == NULL)
	return;

  t_indent(depth, (condp->cn_opcode&OP_NOT) ? "NOT " : "" );

switch (condp->cn_opcode & OP_MASK)
	{
	case LOGAND:	/* 'AND' (A && B) */
	fprintf(pStamp_m->pLogFP, "(\n");
	tree_walk( condp->cl.l_son, depth+1 );
	t_indent(depth,"AND\n");
	tree_walk( condp->cr.r_son, depth+1 );
	t_indent(depth,")\n");
	break;
	case LOGOR:	/* 'OR'  (A || B) */
	fprintf(pStamp_m->pLogFP, "(\n");
	tree_walk( condp->cl.l_son, depth+1 );
	t_indent(depth,"OR\n");
	tree_walk( condp->cr.r_son, depth+1 );
	t_indent(depth,")\n");
	break;
	case LOGXOR:	/* 'XOR' ((!A && B) || (A && !B)) */
	fprintf(pStamp_m->pLogFP, "(\n");
	tree_walk( condp->cl.l_son, depth+1 );
	t_indent(depth,"XOR\n");
	tree_walk( condp->cr.r_son, depth+1 );
	t_indent(depth,")\n");
	break;
	case LOGIFF:	/* 'IFF' ((A && B) || (!A && !B)) */
	fprintf(pStamp_m->pLogFP, "(\n");
	tree_walk( condp->cl.l_son, depth+1 );
	t_indent(depth,"IFF\n");
	tree_walk( condp->cr.r_son, depth+1 );
	t_indent(depth,")\n");
	break;

	case CATEGORY_IS:	/* 'category' 'is' IDENTIFIER */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "category is %s\n",
		findAmpleCategoryName((int)condp->cr.r_int,
					  pStamp_m->pCategories) );
	break;
	case CATEGORY_MEMBER:	/* 'category 'is' 'member' IDENTIFIER */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "category is member %s\n",
		condp->cr.r_ccp->pszName );
	break;
	case EDGE_COND_IS:       /* 'edge' 'condition' 'is' IDENTIFIER */
	fprintf(pStamp_m->pLogFP, "edge condition is %s\n",
		edge_cond_name( condp->cr.r_int ));
	break;
	case PROP_IS:       /* 'property' 'is' IDENTIFIER */
	show_where( condp->cl.l_pos );
	p =  findAmplePropertyName((unsigned int)condp->cr.r_prop,
				   &pStamp_m->sProperties);
	fprintf( pStamp_m->pLogFP, "property is %s\n",	p ? p : "??UNKNOWN??");
	break;
	case MORPH_IS:	/* 'morphname' 'is' STRING */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "morphname is \"%s\"\n", condp->cr.r_string);
	break;
	case MORPH_MEMBER:	/* 'morphname' 'is' 'member' IDENTIFIER */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "morphname is member %s\n",
		condp->cr.r_mcp->pszName );
	break;
	case MORPH_PROSODY: /* 'morpheme' 'is' PROSODIC_SHAPE */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "morpheme is ");
	switch (condp->cr.r_int)
		{
		case MONOSYLLABIC:
		  fprintf(pStamp_m->pLogFP, "monosyllabic");
		  break;
		case DISYLLABIC:
		  fprintf(pStamp_m->pLogFP, "disyllabic");
		  break;
		case TRISYLLABIC:
		  fprintf(pStamp_m->pLogFP, "trisyllabic");
		  break;
		case QUADRISYLLABIC:
		  fprintf(pStamp_m->pLogFP, "quadrisyllabic");
		  break;
		case POLYSYLLABIC:
		  fprintf(pStamp_m->pLogFP, "polysyllabic");
		  break;
		case MONOMORAIC:
		  fprintf(pStamp_m->pLogFP, "monomoraic");
		  break;
		case BIMORAIC:
		  fprintf(pStamp_m->pLogFP, "bimoraic");
		  break;
		default:
		  fprintf(pStamp_m->pLogFP, "<?>");
		  break;
		}
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case SEGMENT_IS:	/* 'segment' 'is'  STRING */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "segment is \"%s\"\n", condp->cr.r_string );
	break;
	case SEGMENT_MEMBER:	/* 'segment' 'is' 'member' IDENTIFIER */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "segment is member %s\n",
		condp->cr.r_scp->pszName );
	break;
	case SYLLABLE_HAS: /* 'syllable' 'has' ONSET_CODA */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "syllable has ");
	if (condp->cr.r_int == ONSET)
	  fprintf(pStamp_m->pLogFP, "onset");
	else
	  fprintf(pStamp_m->pLogFP, "coda");
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case TBU_DOMAIN:	/* 'tbu' 'is'  DOMAIN */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "tbu is");
	show_domain_id( condp->cr.r_dip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case TBU_EXTRAMET: /* 'tbu' 'is' 'extrametrical' */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "tbu is extrametrical\n");
	break;
	case TBU_HAS: /* 'tbu' 'has' TONE */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "tbu has");
	show_tone_id( condp->cr.r_tip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case TBU_NUMBER: /* 'morpheme' 'tbu' NUMBER 'has' TONE */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "morpheme tbu %d has", condp->cn_tbu_num);
	show_tone_id( condp->cr.r_tip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case TONE_IS:	/* 'tone' 'is' TONE */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "tone is");
	show_tone_id( condp->cr.r_tip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case MORPH_TONE_IS:	/* 'morpheme' 'tone' 'is' TONE */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "morpheme tone is");
	show_tone_id( condp->cr.r_tip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case MORPH_UL_TONE_IS:	/* 'morpheme' 'underlying' 'tone' 'is' TONE */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "morpheme underlying tone is");
	show_tone_id( condp->cr.r_tip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case TONE_PATTERN_IS:	/* 'tone' 'pattern' 'is' TONE_PATTERN */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "tone pattern is");
	show_tone_pattern( condp->cr.r_tpip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case MORPH_UL_TONE_PAT_IS:	/* 'morpheme' 'underlying' 'tone' 'pattern'
				   'is' TONE_PATTERN */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "morpheme underlying tone pattern is");
	show_tone_pattern( condp->cr.r_tpip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case WORD_TONE_IS:	/* 'word' 'tone' 'pattern' 'is' TONE_PATTERN */
	fprintf(pStamp_m->pLogFP, "word tone pattern is");
	show_tone_pattern( condp->cr.r_tpip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case TYPE_IS:	/* 'type' 'is' <type> */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "type is ");
	switch (condp->cr.r_int)
		{
		case PFX:	   fprintf(pStamp_m->pLogFP, "prefix");	  break;
		case IFX:	   fprintf(pStamp_m->pLogFP, "infix");	  break;
		case ROOT:	   fprintf(pStamp_m->pLogFP, "root");	  break;
		case SFX:	   fprintf(pStamp_m->pLogFP, "suffix");	  break;
		case WINITIAL: fprintf(pStamp_m->pLogFP, "initial");  break;
		case WFINAL:   fprintf(pStamp_m->pLogFP, "final");	  break;
		default:	   fprintf(pStamp_m->pLogFP, "<?>");	  break;
		}
	fprintf(pStamp_m->pLogFP, "\n");
	break;

	default:
	fprintf(pStamp_m->pLogFP, "<<? UNKNOWN NODE TYPE ?>>\n");
	break;
	}
} /* end tree_walk */

/*****************************************************************
 *
 *                         yyerror
 *
 *****************************************************************
 *
 * yyerror
 * error message routine for yacc
 * ARGUMENTS:
 *    s = pointer to error message
 *
 */
void yyerror(s)
	 char *s;
{
  if (pStamp_m->pLogFP == NULL)
	return;

  fprintf(pStamp_m->pLogFP, "%s %s in %s", tsterrhead, s, ltname );
} /* end yyerror */
