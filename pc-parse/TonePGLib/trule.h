/* TRULE.H - Tone Parser Rule defines and struct definitions
 *           tone_rule is the top struct
 *
 *	Andy Black
 *	15-Feb-95
 *
 ***************************************************************************
 *
 *	struct tbu
 *	struct tbu_list
 *	struct tone
 *	struct tone_list
 *
 ***************************************************************************
 *	EDIT HISTORY
 *	15-Feb-95	hab - initial coding
 ***************************************************************************
 * Copyright 1995 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */

/****************************************************************************
 * NAME
 *    struct action
 * DESCRIPTION
 *    structure for storing a linked list of rule actions
 */
struct action
	{
	  int               ac_op;		/* operation to perform */
	  struct tone_id   *ac_tone;	/* tone info of the action */
	  struct domain_id *ac_domain;	/* domain info of action */
	  int               ac_params;      /* parameters of the action */
	  long              ac_econds;	/* edge conditions of the action */
	  struct action    *ac_next;        /* next action in list */
	};
				/* action operations */
#define ASSOCIATE      1
#define	INSERT         2
#define	DELETE         3
#define	DELINK         4
#define	LINK           5
#define	SPREAD         6
#define	COPY           7
#define SET_EDGE_COND  8
#define FILL_IN        9
				/* action parameters */
		/* direction (bits 1-4) */
#define LEFTWARD               0x0001
#define RIGHTWARD              0x0002
#define DIRECTION(x)      (x & 0x000F)
#define CLEAR_DIRECTION(x) (x & 0xFFF0)

		/* iteration (bits 5-8) */
#define NONITERATIVELY         0x0010
#define ITERATIVELY            0x0020
#define EDGE_IN                0x0030
#define ONE_TO_ONE             0x0040
#define ITERATION(x)      (x & 0x00F0)

		/* mode (bits 9-12) */
#define FEATURE_ADDING         0x0100
#define FEATURE_CHANGING       0x0200
#define FEATURE_FILLING        0x0300
#define MODE(x)           (x & 0x0F00)

		/* OCP (bits 13-16) */
#define OPTIONAL_OCP_BLOCKAGE  0x1000
#define OCP_BLOCKAGE           0x2000
#define OCP_IGNORED            0x3000
#define OCP_MERGER             0x4000
#define OCP(x)            (x & 0xF000)

				/* set defaults: rightward, non-iteratively,
						feature filling with OCP ignored */
#define DEFAULT_ACTION_PARAMS 0x3312
				/* set defaults for FILL-IN operation: */
				/* rightward, iterative, feature filling, */
				/* OCP ignored */
#define FILL_IN_ACTION_PARAMS 0x3322

/*************************************************************************
 * NAME
 *    struct cond_node
 * DESCRIPTION
 *    user defined test condition node structure
 *    A binary tree is built by yyparse().
 */
union leftside
	{
	  short             l_pos;	/* position code for morpheme on left leaf */
	  struct cond_node *l_son;	/* pointer to left subtree */
	};
union rightside
	{
	  int                  r_int;	/* integer        for right leaf */
	  long                 r_long;      /* long integer   for right leaf */
	  char                *r_string;	/* string         for right leaf */
	  AmpleCategoryClass  *r_ccp;	/* category class for right leaf */
	  struct domain_id    *r_dip;	/* domain_id      for right leaf */
	  StringClass         *r_scp;	/* string class   for right leaf */
					/* for now, morph_class is #define'd
					   identically to string_class */
  /*  struct morph_class  *r_mcp;*/	/* morpheme class for right leaf */
	  struct tone_id      *r_tip;	/* tone_id        for right leaf */
	  struct tone_pattern *r_tpip;	/* tone_pattern   for right leaf */
	  unsigned short      *r_prop;      /* property       for right leaf */
	  struct cond_node    *r_son;	/* pointer to right subtree */
	};
#define r_mcp r_scp

struct cond_node
	{
	  char            cn_opcode;	/* bit 7 is NOT, bits 0-6 contain */
						/*               the code */
	  char            cn_tbu_num;	/* tbu number (used by 1 condition) */
	  union leftside  cl;		/* the left  branch */
	  union rightside cr;		/* the right branch */
	};

			/* Condition OP codes */
#define OP_MASK	0177		/* only the bottom seven bits */
#define OP_NOT  0200		/* complement the results */

#define TOP_NODE	  0

#define LOGAND		  1	/* 'AND' (A && B) */
#define LOGOR		  2	/* 'OR'  (A || B) */
#define LOGXOR		  3	/* 'XOR' ((!A && B) || (A && !B)) */
#define LOGIFF		  4	/* 'IFF' ((A && B) || (!A && !B)) */
#define LOGIF		  5	/* 'IF' ... 'THEN' (!A || (A & B)) */
				   /* not implemented (yet) */

#define CATEGORY_IS	 36	/* 'category 'is' IDENTIFIER */
#define CATEGORY_MEMBER	 37	/* 'category 'is' 'member' IDENTIFIER */

#define EDGE_COND_IS	 38	/* 'edge' 'condition' 'is' IDENTIFIER */

#define PROP_IS		 10 	/* 'property' 'is' IDENTIFIER */
				/* (keep in sync with stample.h) */
#define MORPH_IS	 11	/* 'morphname' 'is' STRING */
				/* (keep in sync with stample.h) */
#define MORPH_MEMBER	 13	/* 'morphname' 'is' 'member' IDENTIFIER */
				/* (keep in sync with stample.h) */
#define MORPH_PROSODY	 39	/* 'morpheme' 'is' PROSODIC_SHAPE */

#define SEGMENT_IS	 12	/* 'segment' 'is'  STRING */
#define SEGMENT_MEMBER	 14	/* 'segment' 'is' 'member' IDENTIFIER */

#define SYLLABLE_HAS	 15	/* 'syllable' 'has' ONSET_CODA */

#define TBU_DOMAIN	 16	/* 'tbu' 'is'  DOMAIN */
#define TBU_EXTRAMET   	 17	/* 'tbu' 'is' 'extrametrical' */
#define TBU_HAS  	 18	/* 'tbu' 'has'  TONE_NONE */
#define TBU_NUMBER       19	/* 'morpheme' 'tbu' NUMBER 'has' TONE_NONE */
#define TBU_UNDER_NUMBER 20	/* 'morpheme' 'underlying' 'tbu' NUMBER 'has'
												 TONE_NONE */
#define MORPH_HAS_N_TBUS 21     /* 'morpheme' 'has' NUMBER 'tbus' */

#define TONE_IS		 22	/* 'tone' 'is' TONE_NONE */
#define TONESTATUS_TONE_IS 23   /* 'tone' 'tone status' is TONE_NONE */
#define TONE_PATTERN_IS	 24	/* 'tone' 'pattern' 'is' TONE_PATTERN */
#define WORD_TONE_IS     25	/* 'word' 'tone' 'pattern' 'is' TONE_PATTERN */
#define MORPH_TONE_IS	 26	/* 'morpheme' 'tone' 'is' TONE_NONE */
#define MORPH_UL_TONE_IS 27     /* 'morpheme' 'underlying' 'tone' 'is'
				   TONE_NONE */
#define MORPH_TONE_PAT_IS 28	/* 'morpheme' 'tone' 'pattern'
				   'is' TONE_PATTERN */
#define MORPH_UL_TONE_PAT_IS 29	/* 'morpheme' 'underlying' 'tone' 'pattern'
				   'is' TONE_PATTERN */

#define TYPE_IS		 34	/* 'type' 'is' <TYPE> */
				/* (keep it in sync with stample.h) */

			/* morpheme position constants */
#define ARGCURRENT	0	/* 'current' */
#define ARGLEFT		1	/* 'left' */
#define ARGRIGHT	2	/* 'right */
#define INITIALM	5	/* 'INITIAL' */
#define FINALM		6	/* 'FINAL' */
#define ARGLEFTTWO	7	/* 'lefttwo' */
#define ARGRIGHTTWO	8	/* 'righttwo' */

			/* onset/coda */
#define ONSET		1
#define CODA		2

			/* prosodic shape */
#define MONOSYLLABIC	1
#define DISYLLABIC	2
#define TRISYLLABIC	3
#define QUADRISYLLABIC	4
#define POLYSYLLABIC	5
#define MONOMORAIC	6
#define BIMORAIC	7

/****************************************************************************
 * NAME
 *    struct cycle
 * DESCRIPTION
 *    structure for storing cyclicity information of a rule
 *    if the domain is null and direction is null, it means to apply the rules
 *    from the innermost morphological domain node outward (presumably this
 *    will be root-out)
 */
struct cycle
	{
	  int                 cy_dir;	/* direction (see action) */
	  struct domain_list *cy_domain; 	/* head of list of domains */
	};

/****************************************************************************
 * NAME
 *    struct domain_id
 * DESCRIPTION
 *    structure for storing domain information of a rule
 */
struct domain_id
	{
	  int                  di_edge;	/* edge of domain; 0 = no edge */
	  int                  di_type;	/* either domain or morpheme */
	  int                  di_domain;	/* domain */
	};
				/* edge */
#define LEFT_EDGE  1
#define RIGHT_EDGE 2

#define DI_DOMAIN   1
#define DI_MORPHEME 2
#define DI_WORD     3

/****************************************************************************
 * NAME
 *    struct domain_list
 * DESCRIPTION
 *    structure for storing a linked list of domains
 */
struct domain_list
	{
	  int                 dl_domain;	/* domain */
	  struct domain_list *dl_next;	/* next element in the list */
	};

/****************************************************************************
 * NAME
 *    struct edge_cond_list
 * DESCRIPTION
 *    structure for storing a linked list of edge conditions
 */
struct edge_cond_list
	{
	  long                   ec_value;	/* internal code value */
	  char                  *ec_str;    /* edge condition string */
	  struct edge_cond_list *ec_next;	/* next element in the list */
	};

/****************************************************************************
 * NAME
 *    struct tone_id
 * DESCRIPTION
 *    tone structure
 */
struct tone_id
	{
	  int                     ti_status;  /* status (linked, floating, etc.)*/
	  int                     ti_params;  /* single/plural; default */
	  int                     ti_pos;     /* morpheme position (if any) */
	  struct tone_value_list *ti_value;	  /* value (H, L, M, etc.); if NULL,
						 then all tones of given status */
   };
				/* parameters */
#define SINGLE  1
#define PLURAL  2
				/* default is also single */
#define DEFAULT 5

/****************************************************************************
 * NAME
 *    struct tone_pattern
 * DESCRIPTION
 *    structure for storing a linked list of tone patterns
 */
struct tone_pattern
	{
	  struct tone_id      *tp_tone;	/* tone */
	  struct tone_pattern *tp_next;	/* next element in the list */
	};

/****************************************************************************
 * NAME
 *    struct tone_rule
 * DESCRIPTION
 *    top node in the internal representation of a tone_rule;
 *    is a doubly-linked list
 */
struct tone_rule
	{
	  char                *tr_name;	/* rule name */
	  int                  tr_params;	/* rule parameters */
	  struct action       *tr_action;	/* head of list of rule actions */
	  struct cond_node    *tr_cond;	/* top node of condition(s) on rule */
	  struct cycle        *tr_cycle; 	/* info on cyclic nature of rule */
	  struct tone_rule    *tr_right;    /* pointer to next rule */
	  struct tone_rule    *tr_left;     /* pointer to last rule */
	  long                 tr_tried;    /* number of times rule tried */
	  long                 tr_applied;  /* number of times rule applied */
	};
				/* rule parameters */
		/* optionality (bits 1-4) */
#define OPTIONAL               0x0001
#define OPTIONALITY(x)    (x & 0x000F)

		/* type (bits 5-8) */
#define TONE_RULE               0x0010
#define EDGE_RULE               0x0020
#define RIGHT_EDGE_RULE         0x0030
#define EDGE_CONDITION          0x0040
#define DEFAULT_RULE            0x0050
#define CLEAR_RULE_TYPE(x) (x & 0xFF0F)
#define RULE_TYPE(x)       (x & 0x00F0)

		/* cycle (bits 9-12) */
#define CYCLIC                 0x0100
#define NONCYCLIC              0xF0FF
#define RULE_CYCLICITY(x) (x & 0x0F00)
#define ALL                    0x0000
				/* set defaults: non-optional, non-cyclic,
						tone rule */
#define DEFAULT_TONE_PARAMS 0x0010
