/* PATRFUNC.C - misc utility functions used by PC-PATR
 *****************************************************************************
 * PATRFeature * followPATRForwardPointers(PATRFeature *x)
 * PATRFeature * createPATRAtomFeature(char *s, PATRData * pThis)
 * PATRFeature * copyPATRFeature(PATRFeature *x, PATRData * pThis)
 * PATRFeatureDisjunction * findPATRTemplate(char *        name,
 *					     PATRGrammar * pGrammar_in,
 *					     PATRData * pThis)
 * PATRDefinition * findPATRDefinition(char *name, PATRGrammar *pGrammar_in)
 * PATRFeatureDisjunction * createPATRFeatureDisjunction(PATRFeature *fs,
 *							 PATRData * pThis)
 * PATRFeature * createPATRNullFeature(PATRData * pThis)
 * void addPATRFeatureToComplex(PATRFeature *old, PATRComplexFeature *new)
 * PATRComplexFeature * createPATRComplexFeature(char * label,
 *						 PATRFeature * newval,
 *						 PATRData * pThis)
 * PATRFeature * findOrAddPATRAttribute(PATRFeature *findfs, char *label,
 *					PATRData * pThis)
 * PATRFeature * findPATRAttribute(PATRFeature *fs, char *label)
 * char * findPATRCatFeature(PATRFeature *x, PATRGrammar *pGrammar_in)
 * void visitPATRTree(PATREdge *edgep, int depth, int preorder,
 *		      void (*routp)(PATREdge *, int))
 * void visitPATREdges(PATREdgeList *edge_listp, int depth, int preorder,
 *			void (*routp)(PATREdge *, int))
 * PATREdgeList * setPATRResultIndexes(PATREdgeList *patr_resp, int show_all)
 * PATRWordCategory * addPATRWordCategory(char *cat, PATRWord *sentt,
 *					  PATRData * pThis)
 * PATRFeature * applyPATRLexicalRule(PATRLexicalRule * pLexicalRule_in,
 *				      PATRFeature *     pNewFeat_io,
 *				      PATRFeature *     pOldFeat_in,
 *				      PATRData *        pThis)
 * PATRFeatureDisjunction * buildPATRFeatureDisjunction(char *fdst,
 *					    PATRFeatureDisjunction *pFeatDisj,
 *					    int warn,
 *					    FILE *errfp,
 *					    PATRData * pThis)
 * int arePATRFeaturesIdentical(PATRFeature *fnp1, PATRFeature *fnp2)
 * void addPATRFeatureToWord(PATRFeatureDisjunction* featd,
 *                           PATRWordCategory *word,
 *			     PATRData * pThis)
 * char * storedPATRString(char * pszString, PATRData * pThis)
 * void showPATRStrings(PATRData * pThis)
 * void freePATRInternalMemory()
 * void initPATRSentenceFinalPunctuation(PATRData * pPATR_io)
 * void clearPATRSentenceFinalPunctuation(PATRData * pPATR_io)
 * void addPATRSentenceFinalPunctuation(PATRData * pPATR_io,
 *                                      const char * pszChar_in)
 *****************************************************************************
 * Copyright 1989, 2002 by SIL International.  All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"
#include "allocmem.h"
#include "rpterror.h"	/* for NumberedMessage and displayNumberedMessage() */
#include "cmd.h"	/* temp fix */

#if _MSC_VER >= 700
#include <io.h>
#ifndef isatty
#define isatty(x) _isatty(x)
#endif
#ifndef fileno
#define fileno(x) _fileno(x)
#endif
#endif
#ifndef MACINTOSH
#ifndef isatty
extern int isatty P((int));
#endif
#ifndef fileno
extern int fileno P((FILE*));
#endif
#endif

static void			promote_defatoms P((PATRFeature *,
							PATRData * pThis));
static void			set_index P((PATREdge *, int,
						 PATRData * pThis));
static PATRFeature *		new_featn P((int type, PATRFeature *newval,
						 PATRData * pThis));
static PATRFeature *		copy_fnode P((PATRFeature *x,
						  PATRData * pThis));
static PATRComplexFeature *	copy_flist P((PATRComplexFeature *f,
						  PATRData * pThis));
static PATRFeatureDisjunction *	copy_featd P((PATRFeatureDisjunction *featd,
						  PATRData * pThis));
static void			promote_flist P((PATRComplexFeature *f,
						 PATRData * pThis));
static void			promote_fnode P((PATRFeature *x,
						 PATRData * pThis));
static PATRWordCategory *	new_categ P((char *cat, PATRData * pThis));
static PATRFeature *		match_featpath P((PATRComplexFeature *path,
						  PATRComplexFeature *list));
static void			add_to_feature P((PATRComplexFeature * node,
						  PATRFeature * feature,
						  int		bReplace,
						  PATRData *    pThis));
static void			store_mapped_feature P((
							PATRFeature * pFeatPath,
							PATRFeature * pValue,
							PATRFeature * pNewFeature,
							int		  bReplace,
							PATRData *    pThis));
static int			identical_words P((PATRWordCategory *wp1,
						   PATRWordCategory *wp2));
static VOIDP			addNewString P((VOIDP vitem, VOIDP vlist));
static void			showTrieStringList P((VOIDP vlist, int indent,
							  FILE *outfp));
static void			freeTrieStringList P((VOIDP vlist));
static void			freePATRStrings P((PATRData * pThis));
static int		 compare_feature_labels P((char * first,
						   char * second,
						   PATRGrammar * pGrammar_in,
						   PATRData * pPATR_in));
/*
 *  error messages
 */
static const NumberedMessage sFeatureNotComplex_m	= { WARNING_MSG, 329,
	"\"%s\" is not a complex feature" };
const NumberedMessage sPATRIncompatibleFeaturesMsg_g	= { WARNING_MSG, 511,
	"Incompatible features %s" };
static const NumberedMessage sFeatureNotDefined_m	= { WARNING_MSG, 512,
	"Feature \"%s\" not defined by Let or Define in grammar" };
static const NumberedMessage sIncompatibleFeaturesOn_m	= { WARNING_MSG, 513,
	"Incompatible features on %s" };
static const NumberedMessage sCyclicWordFeature_m	= { WARNING_MSG, 514,
	"Unifying features on %s produced a cycle" };
static const NumberedMessage sUnificationProducesCycle_m= { WARNING_MSG, 515,
	"Feature unification produced a cycle" };

static const char szWhitespace_m[7] = " \t\r\n\f\v";

#ifdef applec
#pragma segment S_patrfunc
#endif

/***************************************************************************
 * NAME
 *    followPATRForwardPointers
 * ARGUMENTS
 *    x - feature node
 * DESCRIPTION
 *    Follow any FORWARD pointers in x, and return first non-FORWARD.
 * RETURN VALUE
 *    First non-FORWARD in x.
 */
PATRFeature *followPATRForwardPointers( x )
PATRFeature *x;
{
if ( !x )			/* Protect against NULL */
	return( x );
while ( x->eType == PATR_FORWARD )	/* Follow any forward paths */
	x = x->u.pForward;
return( x );
}

/***************************************************************************
 * NAME
 *    createPATRAtomFeature
 * ARGUMENTS
 *    s - string value of atom
 * DESCRIPTION
 *    Allocate and fill in a new atom node structure.
 * RETURN VALUE
 *    New atom node structure.
 */
PATRFeature * createPATRAtomFeature( s, pThis )
char * s;
PATRData * pThis;
{
PATRFeature *f;

f = allocPATRFeature(pThis);			/* Allocate space */
f->eType     = PATR_ATOM;			/* Make it PATR_ATOM */
f->u.pszAtom = s;			/* Point to string */
return( f );
}

/***************************************************************************
 * NAME
 *    new_featn
 * ARGUMENTS
 *    type   - feature type
 *    newval - feature value
 * DESCRIPTION
 *    Allocate and fill values into a new feature node structure.
 * RETURN VALUE
 *    New feature node structure.
 */
static PATRFeature * new_featn( type, newval, pThis )
int type;
PATRFeature * newval;
PATRData * pThis;
{
PATRFeature *f;

f = allocPATRFeature(pThis);		/* Allocate space */
f->eType = type;			/* Fill in values */
f->u.pForward = newval;		/* This can be any of three types */
return( f );
}

/***************************************************************************
 * NAME
 *    copy_fnode
 * ARGUMENTS
 *    x - feature structure to copy
 * DESCRIPTION
 *    Make a copy of a feature structure node.
 * RETURN VALUE
 *    Copy of feature structure node x.
 */
static PATRFeature * copy_fnode( x, pThis )
PATRFeature * x;
PATRData * pThis;
{
PATRFeature *xcopy;

if ( !x )				/* If null, return that */
	return( NULL );

x = followPATRForwardPointers( x );		/* Follow pointers first */
/*
 *  If node already copied, return pointer to copy
 */
xcopy = checkPATRFeatureCopy( x, pThis );
if (xcopy != NULL)
	return xcopy;

if ( x->eType == PATR_ATOM )			/* If atom, make a copy */
	{
	xcopy = createPATRAtomFeature( x->u.pszAtom, pThis );
	recordPATRFeatureCopy( x, xcopy, pThis );             /* Record it */
	}
else if ( x->eType == PATR_DEFATOM )          /* If default atom, make a copy */
	{
	xcopy = createPATRAtomFeature( x->u.pszAtom, pThis );
	xcopy->eType = PATR_DEFATOM;		/* Mark as default atom */
	recordPATRFeatureCopy( x, xcopy, pThis );       	/* Record it */
	}
else if ( x->eType == PATR_NULLFS )           /* If nullfs, make a copy */
	{
	xcopy = createPATRNullFeature(pThis);
	recordPATRFeatureCopy( x, xcopy, pThis );             /* Record it */
	}
else if ( x->eType == PATR_FAILFS )           /* If failure, make a copy */
	{
	xcopy = createPATRNullFeature(pThis);
	xcopy->eType = PATR_FAILFS;
	xcopy->u.pszAtom = x->u.pszAtom;
	recordPATRFeatureCopy( x, xcopy, pThis );             /* Record it */
	}
else                                    /* Else (complex) copy it */
	{
							/* Copy the node */
	xcopy = new_featn( x->eType, (PATRFeature *)NULL, pThis );
	recordPATRFeatureCopy( x, xcopy, pThis );	/* Record it */
							/* Copy the flist */
	xcopy->u.pComplex = copy_flist(x->u.pComplex, pThis);
	}

return( xcopy );                    /* Return pointer to copy of node */
}

/***************************************************************************
 * NAME
 *    copy_flist
 * ARGUMENTS
 *    x - feature list to copy
 * DESCRIPTION
 *    Make a copy of a feature list element.
 * RETURN VALUE
 *    Copy of feature list element x.
 */
static PATRComplexFeature * copy_flist( f, pThis )
PATRComplexFeature * f;
PATRData * pThis;
{
PATRComplexFeature *fcopy;

if (f == NULL)
	return NULL;
fcopy = createPATRComplexFeature( f->pszLabel,
				  copy_fnode( f->pValue, pThis ),
				  pThis );
if ( f->pNext )					/* If link */
	fcopy->pNext = copy_flist(f->pNext, pThis);	/* Copy linked one */
return( fcopy );
}

/***************************************************************************
 * NAME
 *    copyPATRFeature
 * ARGUMENTS
 *    x - feature structure to copy
 * DESCRIPTION
 *    Make a copy of a feature structure.
 * RETURN VALUE
 *    Copy of feature structure x.
 */
PATRFeature * copyPATRFeature( x, pThis )
PATRFeature * x;
PATRData * pThis;
{
PATRFeature *xcopy;

if ( !x )					/* If null, return a null fs */
	return( createPATRNullFeature(pThis) );
resetPATRFeatureCopyCheck(pThis);
xcopy = copy_fnode( x, pThis );			/* Copy the node */
resetPATRFeatureCopyCheck(pThis);
return( xcopy );
}

/***************************************************************************
 * NAME
 *    copy_featd
 * ARGUMENTS
 *    featd - PATRFeatureDisjunction to be copied.
 * DESCRIPTION
 *    Make a copy of a feature disjunction.
 * RETURN VALUE
 *    Copy of featd.
 */
static PATRFeatureDisjunction * copy_featd( featd, pThis )
PATRFeatureDisjunction * featd;
PATRData * pThis;
{
PATRFeatureDisjunction *tfeatd;
PATRFeatureDisjunction *ffeatd = NULL;	/* First node in copy of
					   feature disjunction */
PATRFeatureDisjunction *lfeatd;		/* Last node made, for link */

for ( lfeatd = NULL ; featd ; featd = featd->pNext )
	{						/* For every disjunct */
	tfeatd = allocPATRFeatureDisjunction(pThis); /* Make a new disjunct */
	tfeatd->pNext = NULL;			/* Clear its link */
						/* Copy its fs */
	tfeatd->pFeature = copyPATRFeature(featd->pFeature, pThis);
	if (lfeatd == NULL)
	ffeatd = tfeatd;			/* Remember first for return */
	else
	lfeatd->pNext = tfeatd;			/* Link previous to new one */
	lfeatd = tfeatd;				/* Remember for next one */
	}
return( ffeatd );
}

/***************************************************************************
 * NAME
 *    findPATRTemplate
 * ARGUMENTS
 *    name  - name to look up in list of PATRDefinitions
 *    pGrammar_in - pointer to PATRGrammar structure
 * DESCRIPTION
 *    Find a Template with the given name
 * RETURN VALUE
 *    feature structure for name.  NULL if not found.
 */
PATRFeatureDisjunction * findPATRTemplate( name, pGrammar_in, pThis )
char *		name;
PATRGrammar *	pGrammar_in;
PATRData * pThis;
{
PATRDefinition *		pDef;
PATRFeatureDisjunction *	tfeatd;

if (name == NULL)		/* Check for NULL name */
	return( NULL );

tfeatd = NULL;
for ( pDef = pGrammar_in->pDefinitionTable ; pDef ; pDef = pDef->pNext )
	{
	if (strcmp(name, pDef->pszName) == 0)
	{
	if (pDef->eType == PATR_TEMPLATE)
		tfeatd = copy_featd(pDef->u.pFeatDisj, pThis);
	break;
	}
	}
return( tfeatd );
}

/***************************************************************************
 * NAME
 *    findPATRDefinition
 * ARGUMENTS
 *    name  - name to look up in list of PATRDefinitions
 *    pGrammar_in - pointer to PATRGrammar structure
 * DESCRIPTION
 *    Find a PATRDefinition with the given name
 * RETURN VALUE
 *    PATRDefinition for name.  NULL if not found.
 */
PATRDefinition *findPATRDefinition( name, pGrammar_in )
char *		name;
PATRGrammar *	pGrammar_in;
{
PATRDefinition *		pDef;

if (name == NULL)		/* Check for NULL name */
	return( NULL );
for ( pDef = pGrammar_in->pDefinitionTable ; pDef ; pDef = pDef->pNext )
	{
	if (strcmp(name, pDef->pszName) == 0)
	return( pDef );
	}
return( NULL );
}

/***************************************************************************
 * NAME
 *    createPATRFeatureDisjunction
 * ARGUMENTS
 *    fs - feature structure representation of this alternative
 * DESCRIPTION
 *    Make a new PATRFeatureDisjunction struct with link and a null feature
 *    structure.
 * RETURN VALUE
 *    New PATRFeatureDisjunction struct.
 */
PATRFeatureDisjunction * createPATRFeatureDisjunction( fs, pThis )
PATRFeature * fs;
PATRData * pThis;
{
PATRFeatureDisjunction *tfeatd;

tfeatd = allocPATRFeatureDisjunction(pThis);	/* Make a new disjunct */
tfeatd->pNext = (PATRFeatureDisjunction *)NULL;	/* Clear its link */
tfeatd->pFeature = fs;
return( tfeatd );
}

/***************************************************************************
 * NAME
 *    createPATRNullFeature
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Allocate and fill in a new null node structure.
 * RETURN VALUE
 *    New null node structure.
 */
PATRFeature * createPATRNullFeature(pThis)
PATRData * pThis;
{
PATRFeature *f;

f = allocPATRFeature(pThis);		/* Allocate space */
f->eType     = PATR_NULLFS;	/* Make it null */
f->u.pszAtom = NULL;		/* Make value pointer null */
return( f );
}

/***************************************************************************
 * NAME
 *    addPATRFeatureToComplex
 * ARGUMENTS
 *    old - feature node structure to add to
 *    new - feature list to add to old
 * DESCRIPTION
 *    Link new feature to front of old feature structure.
 * RETURN VALUE
 *    None.
 */
void addPATRFeatureToComplex( old, new )
PATRFeature *old;
PATRComplexFeature *new;
{
PATRComplexFeature *f;
/*
 *  Protect against NULL pointers
 */
if ((old == NULL) || (new == NULL))
	return;
old = followPATRForwardPointers( old );
if (old->eType == PATR_NULLFS)
	{					/* If old is null, make it complex */
	old->eType      = PATR_COMPLEX;
	old->u.pComplex = new;
	}
else if (old->eType == PATR_COMPLEX)
	{
	for ( f = old->u.pComplex ; f->pNext ; f = f->pNext )
	;
	f->pNext = new;			/* Link new at end of list */
	}
}

/***************************************************************************
 * NAME
 *    createPATRComplexFeature
 * ARGUMENTS
 *    type   - feature type
 *    newval - feature value
 * DESCRIPTION
 *    Allocate and fill values into a new feature list structure.
 * RETURN VALUE
 *    New feature list structure.
 */
PATRComplexFeature * createPATRComplexFeature( label, newval, pThis )
char * label;
PATRFeature * newval;
PATRData * pThis;
{
PATRComplexFeature *f;

f = allocPATRComplexFeature(pThis);		/* Allocate space */
f->pszLabel = label;		/* Fill in values */
f->pValue    = newval;
f->pNext     = NULL;
return( f );
}

/***************************************************************************
 * NAME
 *    findOrAddPATRAttribute
 * ARGUMENTS
 *    findfs - Feature structure to find or create in.
 *    label  - Label to find or create in the structure.
 * DESCRIPTION
 *    If attribute with given label is not in the complex feature, then
 *    create it as a label in feature structure findfs.
 * RETURN VALUE
 *    Feature structure found or created.
 */
PATRFeature * findOrAddPATRAttribute( findfs, label, pThis )
PATRFeature * findfs;
char *        label;
PATRData *    pThis;
{
PATRFeature *f;
char *	pszLabel;

if ( !findfs )				/* Protect against NULL */
	return( findfs );

f = followPATRForwardPointers( findfs );		/* Protect against FAIL */
if ( f->eType == PATR_FAILFS )
	return( f );
pszLabel = storedPATRString( label, pThis);
/*
 *  see if it is a label in findfs
 */
f = findPATRAttribute( findfs, pszLabel );
if ( !f )
	{					/* If it is not found as a label */
	f = createPATRNullFeature(pThis);		/* Make a new null */
	addPATRFeatureToComplex(findfs,			/* Hook in as label */
				createPATRComplexFeature(pszLabel, f, pThis));
	}
return( f );				/* Return struct found or created */
}

/***************************************************************************
 * NAME
 *    findPATRAttribute
 * ARGUMENTS
 *    fs    - Feature structure to look in.
 *    label - Label to find.
 * DESCRIPTION
 *    Search in fs for label.
 * RETURN VALUE
 *    Value of label if found, else NULL.
 */
PATRFeature * findPATRAttribute( fs, label )
PATRFeature *	fs;
char *		label;
{
PATRComplexFeature *fl;

if (!fs || !label)			/* Handle empty fs or missing label */
	return( NULL );

fs = followPATRForwardPointers( fs );

if (fs->eType != PATR_COMPLEX)		/* If not complex, can't find */
	return( NULL );

for ( fl = fs->u.pComplex ; fl ; fl = fl->pNext )
	{						/* For each label in fs */
	if (!fl->pszLabel)
	continue;
	if (strcmp(fl->pszLabel, label) == 0)	/* If label found */
	return followPATRForwardPointers( fl->pValue );	/* Return its value */
	}
return( NULL );                     /* If none found, return NULL */
}

/***************************************************************************
 * NAME
 *    findPATRCatFeature
 * DESCRIPTION
 *    Find the "category" feature of a structure.
 * RETURN VALUE
 *    Atom value of category feature, NULL if no category feature.
 */
char * findPATRCatFeature( x, pGrammar_in )
PATRFeature *	x;
PATRGrammar *	pGrammar_in;
{
PATRComplexFeature *f;

x = followPATRForwardPointers( x );		/* Follow pointers */

if (x->eType != PATR_COMPLEX)		/* If not complex, fail */
	return( NULL );

for ( f = x->u.pComplex ; f ; f = f->pNext )
	{
	if (f->pszLabel == pGrammar_in->pszCatFeatName)
	{
	x = followPATRForwardPointers( f->pValue );	/* Get its fs */
	if ( !(x->eType == PATR_ATOM || x->eType == PATR_DEFATOM) )
		return( NULL );			/* If not atom, fail */
	return( x->u.pszAtom );		/* Else (atom), return it */
	}
	}
return( NULL );				/* If label not found return fail */
}

/***************************************************************************
 * NAME
 *    promote_flist
 * ARGUMENTS
 *    x - feature list to promote
 * DESCRIPTION
 *    Promote a feature list element.
 * RETURN VALUE
 *    none
 */
static void promote_flist( f, pThis )
PATRComplexFeature * f;
PATRData * pThis;
{
promote_fnode( f->pValue, pThis );		/* Promote first node */
if ( f->pNext )					/* If link */
	promote_flist( f->pNext, pThis );	/* Promote linked one */
}

/***************************************************************************
 * NAME
 *    promote_fnode
 * ARGUMENTS
 *    x - feature structure to promote
 * DESCRIPTION
 *    Promote all default atoms in feature structure to atoms.
 * RETURN VALUE
 *    none
 */
static void promote_fnode( x, pThis )
PATRFeature *x;
PATRData * pThis;
{
if ( !x )				/* If null, return */
	return;
/*
 *  If node already promoted, return
 */
if (checkPATRFeatureCopy(x, pThis) != NULL)
	return;

if ( x->eType == PATR_ATOM )			/* If atom, record it */
	recordPATRFeatureCopy( x, (PATRFeature *)NULL, pThis );
else if ( x->eType == PATR_DEFATOM )		/* If default atom, promote */
	{
	x->eType = PATR_ATOM;			/* Make it atom */
	recordPATRFeatureCopy( x, (PATRFeature *)NULL, pThis );	/* Record it */
	}
else if ( x->eType == PATR_NULLFS )		/* If nullfs, record it */
	recordPATRFeatureCopy( x, (PATRFeature *)NULL, pThis );
else if ( x->eType == PATR_FAILFS )		/* If failure, record it */
	recordPATRFeatureCopy( x, (PATRFeature *)NULL, pThis );
else if ( x->eType == PATR_FORWARD )		/* If forward */
	{
	recordPATRFeatureCopy( x, (PATRFeature *)NULL, pThis );	/* Record it */
	promote_fnode( x->u.pForward, pThis );	/* Promote its forward */
	}
else					/* Else (complex) promote it */
	{
	recordPATRFeatureCopy( x, (PATRFeature *)NULL, pThis );	/* Record it */
	promote_flist( x->u.pComplex, pThis );	/* Promote the flist */
	}
}

/***************************************************************************
 * NAME
 *    promote_defatoms
 * ARGUMENTS
 *    x - feature structure to promote
 * DESCRIPTION
 *    Promote all default atoms in feature structure to atoms.
 * RETURN VALUE
 *    none
 */
static void promote_defatoms( x, pThis )
PATRFeature *x;
PATRData * pThis;
{
if ( !x )					/* If null, return */
	return;
resetPATRFeatureCopyCheck(pThis);		/* Clear promote node list */
promote_fnode( x, pThis );				/* Promote the node */
resetPATRFeatureCopyCheck(pThis);
}

/*
 *   This routine and the following routine together allow the parse
 *   tree to be processed in a depth first fashion invocating a
 *   processing routine for each node.  The processing routine must
 *   be declared with arguments as follows:
 *
 *          routx(edgep, depth)
 *          PATREdge *edgep;
 *          int depth;
 *
 *   The return code of the routx is ignored.  Children are visited
 *   in reverse order to allow the leftmost edge to be processed first
 *   (i.e. the parser builds the child list backwards).  The parent
 *   node may be visited either before or after the children as controlled
 *   by the 'preorder' parameter.
 */
/*****************************************************************************
 * NAME
 *    visitPATRTree
 * ARGUMENTS
 *    edgep    - current parse edge
 *    depth    - current depth of tree (top node == 1)
 *    preorder - TRUE = visit parent node before children, FALSE = visit all
 *			children before parent
 *    routp    - routine to call at each node
 * DESCRIPTION
 *    visit all nodes of parse
 * RETURN VALUE
 *    none
 */
void visitPATRTree(edgep, depth, preorder, routp, pThis)
PATREdge * edgep;
int depth;
int preorder;
void (*routp) P((PATREdge *, int, PATRData *));
PATRData * pThis;
{
if (preorder)
	(*routp)(edgep, depth, pThis);

if (edgep->eType == PATR_RULE_EDGE)
	visitPATREdges(edgep->u.r.pChildren, depth+1, preorder, routp, pThis);

if (!preorder)
	(*routp)(edgep, depth, pThis);
}

/*****************************************************************************
 * NAME
 *    visitPATREdges
 * ARGUMENTS
 *    edge_listp - current list of parse edges
 *    depth      - current depth of tree (top node == 1)
 *    preorder   - TRUE = visit parent node before children, FALSE = visit all
 *			children before parent
 *    routp      - routine to call at each node
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
void visitPATREdges(edge_listp, depth, preorder, routp, pThis)
PATREdgeList * edge_listp;
int depth;
int preorder;
void (*routp) P((PATREdge *, int, PATRData *));
PATRData * pThis;
{
PATREdgeList *	pEdge;

if (depth == 1)
	{
	for ( pEdge = edge_listp ; pEdge ; pEdge = pEdge->pNext )
	visitPATRTree(pEdge->pEdge, depth, preorder, routp, pThis);
	return;
	}
if (edge_listp == NULL)
	return;

if (edge_listp->pNext)
	visitPATREdges(edge_listp->pNext, depth, preorder, routp, pThis);

visitPATRTree(edge_listp->pEdge, depth, preorder, routp, pThis);
}

/*****************************************************************************
 * NAME
 *    set_index
 * ARGUMENTS
 *    edgep -
 *    depth -
 * DESCRIPTION
 *    This routine (when called by the standard tree visiting iterator
 *    over all the edges in a parse) assigns unique consecutive indices
 *    to all edges used in the parse.  POSTORDER visiting is used to
 *    guarantee that the index of a parent is always greater than the
 *    index of its children.
 * RETURN VALUE
 *    none
 */
static void set_index(edgep, depth, pThis)
PATREdge *edgep;
int depth;
PATRData * pThis;
{
if (edgep->iIndex == 0)    /* if index not yet assigned */
	edgep->iIndex = ++pThis->pMem->iCurrent;   /* assign next value */
}

/****************************************************************************
 * NAME
 *    setPATRResultIndexes
 * ARGUMENTS
 *    pel      - pointer to PATREdgeList list
 *    show_all - flag to set indexes even if result not ambiguous
 * DESCRIPTION
 *    Set indexes before storing result
 * RETURN VALUE
 *    Revised pel.
 */
PATREdgeList * setPATRResultIndexes(pel, pThis)
PATREdgeList *	pel;
PATRData *	pThis;
{
/*
 *  If we are showing all features or if there are ambiguous
 *  parses, we add index numbers to all edges to help
 *  identify them.
 */
if (	(pThis->iFeatureDisplay & PATR_FEATURE_ALL) ||
	(pThis->eTreeDisplay == PATR_XML_TREE)      ||
	((pel != NULL) && (pel->pNext != NULL))     )
	{
	pThis->pMem->iCurrent = 0;
	visitPATREdges(pel, 1, PATR_PREORDER, set_index, pThis);
	pThis->iCurrentIndex = pThis->pMem->iCurrent;
	}
return(pel);
}

/*****************************************************************************
 * NAME
 *    new_categ
 * ARGUMENTS
 *    cat - Category to put into structure
 * DESCRIPTION
 *    Make a new PATRWordCategory structure
 * RETURN VALUE
 *    pointer to the new PATRWordCategory structure
 */
static PATRWordCategory * new_categ( cat, pThis )
char * cat;
PATRData * pThis;
{
PATRWordCategory *wordt;				/* Temp word pointer */

wordt = allocPATRWordCategory(pThis);		/* Allocate word */
wordt->pszCategory  = allocPATRStringCopy(cat, pThis); /* Put in category */
wordt->pFeature     = NULL;			/* Clear word feature ptr */
wordt->bUsed        = FALSE;			/* Clear word used flag */
wordt->iAmbigNumber = 0;			/* Clear ambiguity number */
wordt->pNext        = NULL;			/* Clear word link */
return( wordt );
}

/*****************************************************************************
 * NAME
 *    addPATRWordCategory
 * ARGUMENTS
 *    cat   - Category to add
 *    sentt - Sentence Word to add it to
 * DESCRIPTION
 *    Add category to sentence structure
 * RETURN VALUE
 *    pointer to the new PATRWordCategory structure containing the category
 */
PATRWordCategory * addPATRWordCategory( cat, sentt, pThis )
char *cat;
PATRWord *sentt;
PATRData * pThis;
{
PATRWordCategory *word;                /* Temp word pointer */
PATRWordCategory *wordt;               /* Temp word pointer from sentence */

word = new_categ( cat, pThis );    /* Make new word struct */
word->pFeature = createPATRNullFeature(pThis);   /* Init to null fs */
/*
 *  Cats must be linked in the order in which they come
 *  to make the disambiguation of AMPLE input work right.
 */
if ( sentt->pCategories )	/* If already a word in sent, find last one */
	{
	for ( wordt = sentt->pCategories ; wordt->pNext ; wordt = wordt->pNext )
	;
	wordt->pNext       = word;	/* Link this word after previous last */
	word->iAmbigNumber = wordt->iAmbigNumber + 1;  /* Give it next ambig num */
	}
else                        /* Else (no words in sent yet) */
	{
	sentt->pCategories = word;		/* Set first word to this */
	word->iAmbigNumber = 1;		/* Mark as first ambig */
	}
return( word );             /* Return word */
}

/*****************************************************************************
 * NAME
 *    match_featpath
 * ARGUMENTS
 *    path - pointer to a feature path
 *    list - pointer to a list of features
 * DESCRIPTION
 *    find the feature in the list pointed to by the path, if any
 * RETURN VALUE
 *    pointer to the feature node (PATRFeature) in the second feature list
 *    that the labels in the first feature list (path) point to.  NULL if no
 *    match
 */
static PATRFeature *match_featpath(path, list)
PATRComplexFeature *path;
PATRComplexFeature *list;
{
PATRComplexFeature *flp;
PATRFeature *listvalue, *value;

if (path->pszLabel != list->pszLabel)
	{
	return (PATRFeature *)NULL;
	}
if (path->pValue == (PATRFeature *)NULL)
	return followPATRForwardPointers(list->pValue);
if (list->pValue == (PATRFeature *)NULL)
	return (PATRFeature *)NULL;
listvalue = followPATRForwardPointers(list->pValue);
if (listvalue->eType != PATR_COMPLEX)
	return (PATRFeature *)NULL;
for ( flp = listvalue->u.pComplex ; flp ; flp = flp->pNext )
	{
	value = match_featpath(path->pValue->u.pComplex, flp);
	if (value != (PATRFeature *)NULL)
	return value;
	}
return (PATRFeature *)NULL;
}

/*****************************************************************************
 * NAME
 *    add_to_feature
 * ARGUMENTS
 *    pPathFeat - pointer to a labeled feature (PATRComplexFeature)
 *    pFeat     - pointer to a feature node (PATRFeature)
 * DESCRIPTION
 *    Add the labeled feature to the list of complex features associated with
 *    the feature node.
 * RETURN VALUE
 *    none
 */
static void add_to_feature(pPathFeat, pFeat, bReplace, pThis)
PATRComplexFeature *	pPathFeat;
PATRFeature *		pFeat;
int			bReplace;
PATRData *		pThis;
{
PATRComplexFeature * pCmplx;
PATRComplexFeature * pNextPathFeat;

if (pFeat->eType == PATR_NULLFS)
	{
	pFeat->eType = PATR_COMPLEX;
	pFeat->u.pComplex = pPathFeat;
	return;
	}
if (pFeat->eType != PATR_COMPLEX)
	return;
for ( pCmplx = pFeat->u.pComplex ; pCmplx ; pCmplx = pCmplx->pNext )
	{
	if (pCmplx->pszLabel == pPathFeat->pszLabel)
	{
	if (pPathFeat->pValue->eType == PATR_COMPLEX)
		{
		pNextPathFeat = pPathFeat->pValue->u.pComplex;
		add_to_feature(pNextPathFeat, pCmplx->pValue, bReplace, pThis);
		}
	else
		{
		if (bReplace)
		pCmplx->pValue = pPathFeat->pValue;
		else
		displayNumberedMessage(&sFeatureNotComplex_m,
					   pThis->bSilent, pThis->bShowWarnings,
					   pThis->pLogFP,
					   NULL, 0,
					   pPathFeat->pszLabel);
		}
	return;
	}
	}
pPathFeat->pNext = pFeat->u.pComplex;
pFeat->u.pComplex = pPathFeat;
}

/*****************************************************************************
 * NAME
 *    store_mapped_feature
 * ARGUMENTS
 *    pFeatPath   - pointer to a COMPLEX feature containing the path to store
 *    pValue      - pointer to a feature containing the value to store
 *    pNewFeature - pointer to a COMPLEX feature containing a list of features
 * DESCRIPTION
 *    add the feature constructed from pFeatPath and pValue to pNewFeature,
 *    merging pValue with whatever is already there
 * RETURN VALUE
 *    none (contents pointed to by pNewFeature is modified)
 */
static void store_mapped_feature(pFeatPath, pValue_in, pNewFeature, bReplace,
				 pThis)
PATRFeature *	pFeatPath;
PATRFeature *	pValue_in;
PATRFeature *	pNewFeature;
int		bReplace;
PATRData *	pThis;
{
PATRFeature * pFeat;
PATRFeature * pNextFeat;
PATRComplexFeature * pComplex;
PATRComplexFeature * pNewComplex;
PATRComplexFeature * pHeadComplex = (PATRComplexFeature *)NULL;
PATRComplexFeature * pTailComplex = (PATRComplexFeature *)NULL;

for ( pFeat = pFeatPath ; pFeat ; pFeat = pNextFeat )
	{
	pComplex = pFeat->u.pComplex;
	pNewComplex = createPATRComplexFeature(pComplex->pszLabel, NULL, pThis);
	if (pHeadComplex == (PATRComplexFeature *)NULL)
	pHeadComplex = pNewComplex;
	else
	pTailComplex->pValue->u.pComplex = pNewComplex;
	if (pComplex->pValue)
	{
	pNewComplex->pValue = createPATRNullFeature(pThis);
	pNewComplex->pValue->eType = PATR_COMPLEX;
	pNewComplex->pValue->u.pComplex = NULL;
	pTailComplex = pNewComplex;
	}
	else
	{
	pNewComplex->pValue = pValue_in;
	}
	pNextFeat = pComplex->pValue;
	}
add_to_feature(pHeadComplex, pNewFeature, bReplace, pThis);
}

/*****************************************************************************
 * NAME
 *    applyPATRLexicalRule
 * ARGUMENTS
 *    pLexicalRule_in - pointer the Lexical Rule to apply
 *    pNewFeat_io     - pointer to the new COMPLEX PATRFeature node
 *    pOldFeat_in     - pointer to the old COMPLEX PATRFeature node
 *    pGrammar_in        - pointer to the current PATR grammar
 * DESCRIPTION
 *    convert the old complex feature node to a new one according to the
 *    desired mappings
 * RETURN VALUE
 *    pointer to the new COMPLEX PATRFeature node; pOldFeat_in is destroyed
 *    as a side effect
 */
PATRFeature * applyPATRLexicalRule(pLexicalRule_in, pNewFeat_io, pOldFeat_in,
				   pThis)
PATRLexicalRule *	pLexicalRule_in;
PATRFeature *		pNewFeat_io;
PATRFeature *		pOldFeat_in;
PATRData *		pThis;
{
PATRFeature * value;
PATRComplexFeature * pOldComplex;
PATRComplexFeature * pLexInComplex;
PATRLexicalRule * pLex;
char *	pszLexFeatName;
char *	pszGlossFeatName;
PATRFeature * pFeat;

if (pThis->pGrammar != NULL)
	{
	pszLexFeatName   = pThis->pGrammar->pszLexFeatName;
	pszGlossFeatName = pThis->pGrammar->pszGlossFeatName;
	if (pThis->iDebugLevel >= 5)
	{
	int bTrim = pThis->iFeatureDisplay & PATR_FEATURE_TRIM;
	pThis->iFeatureDisplay &= ~PATR_FEATURE_TRIM;
	fprintf(stdout, "DEBUG: applyPATRLexicalRule() lexical rule\n");
	for ( pLex = pLexicalRule_in ; pLex ; pLex = pLex->pNext )
		{
		fprintf(stdout, "        <out");
		for (	pFeat = pLex->pOutFeat ;
			pFeat && pFeat->eType == PATR_COMPLEX ;
			pFeat = pFeat->u.pComplex->pValue )
		fprintf(stdout, " %s", pFeat->u.pComplex->pszLabel );
		fprintf(stdout, "> =%s ", pLex->bReplace ? ">" : "");
		if (pLex->pInFeat->eType == PATR_ATOM)
		{
		fprintf(stdout, "%s\n", pLex->pInFeat->u.pszAtom);
		}
		else if (pLex->pInFeat->eType == PATR_NULLFS)
		{
		fprintf(stdout, "[]\n");
		}
		else
		{
		fprintf(stdout, "<in");
		for (   pFeat = pLex->pInFeat ;
			pFeat && pFeat->eType == PATR_COMPLEX ;
			pFeat = pFeat->u.pComplex->pValue )
			fprintf(stdout, " %s", pFeat->u.pComplex->pszLabel );
		fprintf(stdout, ">\n");
		}
		}
	fprintf(stdout, "DEBUG: applyPATRLexicalRule() input feature\n");
	fprintf(stdout, "        ");
	showPATRFeature( pOldFeat_in, 8, pThis );
	pThis->iFeatureDisplay |= bTrim;
	}
	}
else
	{
	pszLexFeatName   = storedPATRString( "lex", pThis);
	pszGlossFeatName = storedPATRString( "gloss", pThis);
	}
/*
 *  process all the Unify operations first
 */
for ( pLex = pLexicalRule_in ; pLex ; pLex = pLex->pNext )
	{
	if (pLex->bReplace)
	continue;
	if (pLex->pInFeat->eType == PATR_COMPLEX)
	{
	pLexInComplex = pLex->pInFeat->u.pComplex;
	for (	pOldComplex = pOldFeat_in->u.pComplex ;
		pOldComplex ;
		pOldComplex = pOldComplex->pNext )
		{
		value = match_featpath(pLexInComplex, pOldComplex);
		if (value != (PATRFeature *)NULL)
		{
		/*
		 *  we have a mapping to make.
		 *  copy the output path, attaching the value node to it, and
		 *  add it to the new feature
		 */
		store_mapped_feature(pLex->pOutFeat, value, pNewFeat_io, FALSE,
					 pThis);
		break;
		}
		}
	}
	else
	{
	value = pLex->pInFeat;
	store_mapped_feature(pLex->pOutFeat, value, pNewFeat_io, FALSE, pThis);
	}
	}
/*
 *  now process the Replace operations
 */
for ( pLex = pLexicalRule_in ; pLex ; pLex = pLex->pNext )
	{
	if (!pLex->bReplace)
	continue;
	if (pLex->pInFeat->eType == PATR_COMPLEX)
	{
	pLexInComplex = pLex->pInFeat->u.pComplex;
	for (	pOldComplex = pOldFeat_in->u.pComplex ;
		pOldComplex ;
		pOldComplex = pOldComplex->pNext )
		{
		value = match_featpath(pLexInComplex, pOldComplex);
		if (value != (PATRFeature *)NULL)
		{
		/*
		 *  we have a mapping to make.
		 *  copy the output path, attaching the value node to it, and
		 *  add it to the new feature
		 */
		store_mapped_feature(pLex->pOutFeat, value, pNewFeat_io, TRUE,
					 pThis);
		break;
		}
		}
	}
	else
	{
	value = pLex->pInFeat;
	store_mapped_feature(pLex->pOutFeat, value, pNewFeat_io, TRUE, pThis);
	}
	}
if (pThis->iDebugLevel >= 5)
	{
	int bTrim = pThis->iFeatureDisplay & PATR_FEATURE_TRIM;
	pThis->iFeatureDisplay &= ~PATR_FEATURE_TRIM;
	fprintf(stdout, "DEBUG: applyPATRLexicalRule() output feature\n");
	fprintf(stdout, "        ");
	showPATRFeature( pNewFeat_io, 8, pThis );
	pThis->iFeatureDisplay |= bTrim;
	}
return pNewFeat_io;
}

/*****************************************************************************
 * NAME
 *    buildPATRFeatureDisjunction
 * ARGUMENTS
 *    fdst  - Features to add
 *    featd - PATRFeatureDisjunction to add them to
 *    warn  - Warn if an fdst not found
 *    errfp - output FILE pointer for error messages
 *    pThis - pointer to PATRData structure
 * DESCRIPTION
 *    Build a feat descrip structure
 * RETURN VALUE
 *    pointer to new feat descrip
 */
PATRFeatureDisjunction * buildPATRFeatureDisjunction(fdst, pFeatDisj, warn,
							 errfp, pThis)
char *			fdst;
PATRFeatureDisjunction *pFeatDisj;
int			warn;
FILE *			errfp;
PATRData *		pThis;
{
char *			tfdst;
char *			efdst;
int			end;
int			found;
PATRFeatureDisjunction *	pFeatd;
PATRFeatureDisjunction *	pTempFeatd;
char			errmsg[256];
PATRDefinition *		pDef;
char			cSave = ' ';

if (pThis == NULL)
	return NULL;
/*
 *  if no feature disjunction passed in, start with an empty feature
 *  disjunction
 */
if (pFeatDisj == NULL)
	pFeatDisj = createPATRFeatureDisjunction(createPATRNullFeature(pThis),
						 pThis);
tfdst = fdst;

while (*tfdst != NUL)				/* For each fdst in string */
	{
	/* Find start of fdst (use = as feature separator) */
	while ((*tfdst == '=') || (isascii(*tfdst) && isspace(*tfdst)))
	++tfdst;
	if (*tfdst == NUL)				/* If no more, return */
	{
	return( pFeatDisj );			/* Return built featd */
	}
	efdst = tfdst;				/* Find end of fdst */
	while (*efdst && (*efdst != '=') && !(isascii(*efdst) && isspace(*efdst)))
	++efdst;
	if (*efdst != NUL)				/* If not end */
	{
	cSave = *efdst;
	*efdst = NUL;				/* Terminate fdst */
	end = FALSE;
	}
	else
	end = TRUE;				/* Else remember end */

	found = FALSE;
	/*
	 *  Translate fdst based on PATRDefinition
	 */
	pDef = findPATRDefinition(tfdst, pThis->pGrammar);
	if (pDef == NULL)
	{
	if (warn)
		{
		/*
		 *  If not found and we should warn
		 */
		displayNumberedMessage(&sFeatureNotDefined_m,
				   pThis->bSilent, pThis->bShowWarnings,
				   pThis->pLogFP,
				   NULL, 0,
				   tfdst);
		sprintf(errmsg, sFeatureNotDefined_m.pszMessage, tfdst);
		if (    (errfp != (FILE *)NULL) &&
			(errfp != stdout) &&
			(errfp != stderr) )
		fputs(errmsg, errfp);
#ifndef MACINTOSH
		else if (!isatty(fileno(stdout)))
		fputs(errmsg, stdout);
#endif
		}
	}
	else if (pDef->eType == PATR_TEMPLATE)
	{
	/*
	 *  Unify it in
	 */
	pFeatd = copy_featd(pDef->u.pFeatDisj, pThis);
	pTempFeatd = unifyPATRDisjuncts(pFeatDisj, pFeatd, pThis);
	if (pTempFeatd == NULL)
		{
		if (!end)
		*efdst = cSave;			/* Restore space for message */
		displayNumberedMessage(&sPATRIncompatibleFeaturesMsg_g,
				   pThis->bSilent, pThis->bShowWarnings,
				   pThis->pLogFP,
				   NULL, 0,
				   fdst);
		return(pFeatDisj);			/* Return, no use doing more */
		}
	else
		pFeatDisj = pTempFeatd;
	}

	tfdst = efdst;			/* Move to end */
	if (!end)				/* If more to come */
	{
	*efdst = cSave;			/* Restore space for messages */
	tfdst++;			/* Move to start of next */
	}
	}

return( pFeatDisj );			/* Return built featd */
}

/*****************************************************************************
 * NAME
 *    arePATRFeaturesIdentical
 * ARGUMENTS
 *    fnp1 - pointer to a PATRFeature struct
 *    fnp2 - pointer to another PATRFeature struct
 * DESCRIPTION
 *    Test whether two PATRFeature structures are essentially identical.
 * RETURN VALUE
 *    nonzero if the two features are identical, zero if they differ
 */
int arePATRFeaturesIdentical(fnp1, fnp2)
PATRFeature *fnp1;
PATRFeature *fnp2;
{
PATRComplexFeature *flp1, *flp2;
int ok;

fnp1 = followPATRForwardPointers( fnp1 );
fnp2 = followPATRForwardPointers( fnp2 );
if (fnp1 == fnp2)
	return( 1 );
if ((fnp1 == NULL) || (fnp2 == NULL))
	return( 0 );
if (fnp1->eType != fnp2->eType)
	return( 0 );
switch (fnp1->eType)
	{
	case PATR_ATOM:
	case PATR_DEFATOM:
	return( fnp1->u.pszAtom == fnp2->u.pszAtom );

	case PATR_COMPLEX:
	ok = 1;
	for ( flp1 = fnp1->u.pComplex ; flp1 ; flp1 = flp1->pNext )
		{
		for ( flp2 = fnp2->u.pComplex ; flp2 ; flp2 = flp2->pNext)
		{
		if (flp1->pszLabel == flp2->pszLabel)
			{
			ok = arePATRFeaturesIdentical(flp1->pValue, flp2->pValue);
			break;
			}
		}
		if (!ok || (flp2 == NULL))
		return( 0 );
		}
	for ( flp2 = fnp2->u.pComplex ; flp2 ; flp2 = flp2->pNext )
		{
		for ( flp1 = fnp1->u.pComplex ; flp1 ; flp1 = flp1->pNext)
		{
		if (flp1->pszLabel == flp2->pszLabel)
			{
			ok = arePATRFeaturesIdentical(flp1->pValue, flp2->pValue);
			break;
			}
		}
		if (!ok || (flp1 == NULL))
		return( 0 );
		}
	break;

	case PATR_NULLFS:
	case PATR_FAILFS:
	return( fnp1->u.pszAtom == fnp2->u.pszAtom );
#ifndef hab130v
	case PATR_VARIABLE:
	  return( fnp1->u.iVariable == fnp2->u.iVariable );
#endif /* hab130v */
	}

return( 1 );
}

/*****************************************************************************
 * NAME
 *    identical_words
 * ARGUMENTS
 *    wp1 - pointer to a PATRWordCategory struct
 *    wp2 - pointer to another PATRWordCategory struct
 * DESCRIPTION
 *    Test whether two PATRWordCategory structures are essentially identical.
 * RETURN VALUE
 *    nonzero if the two words are identical, zero if they differ
 */
static int identical_words(wp1, wp2)
PATRWordCategory *wp1;
PATRWordCategory *wp2;
{
int ok;

if (wp1 == wp2)
	return( 1 );
if ((wp1 == NULL) || (wp2 == NULL))
	return( 0 );
if (wp1->iAmbigNumber != wp2->iAmbigNumber)
	return( 0 );
if (wp1->pszCategory == wp2->pszCategory)
	ok = 1;
else if ((wp1->pszCategory == NULL) || (wp2->pszCategory == NULL))
	return( 0 );
else if (strcmp(wp1->pszCategory, wp2->pszCategory) != 0)
	return( 0 );
return( arePATRFeaturesIdentical(wp1->pFeature, wp2->pFeature) );
}

/*****************************************************************************
 * NAME
 *    addPATRFeatureToWord
 * ARGUMENTS
 *    featd    - features to add
 *    word     - word to add them to
 *    pGrammar_in    - pointer to PATRGrammar structure
 * DESCRIPTION
 *    Add feat descrip to word structure
 * RETURN VALUE
 *    none
 */
void addPATRFeatureToWord( featd, word, pThis )
PATRFeatureDisjunction *featd;
PATRWordCategory *	word;
PATRData *		pThis;
{
PATRWordCategory *wordt, *wordp;
PATRFeatureDisjunction *pFeatd;
PATRFeature *feat_copy = NULL;
char *stemp;

if ( featd->pNext )			/* Keep a copy of word feat */
	feat_copy = copyPATRFeature( word->pFeature, pThis );
/*
 *  For each alternative on list, make a copy of word
 */
for ( pFeatd = featd ; pFeatd ; pFeatd = pFeatd->pNext )
	{
	if ( pFeatd != featd )          /* If not first */
	{                           /* Make a copy */
	wordt = new_categ( word->pszCategory, pThis ); /* Get a new one */
							/* Copy features */
	wordt->pFeature = copyPATRFeature( feat_copy, pThis );
	wordt->iAmbigNumber = word->iAmbigNumber;	/* same ambig */
	wordt->pNext        = word->pNext;		/* same link */
	word->pNext         = wordt;		/* Link word to this one */
	}
	else
	wordt = word;			/* Else (first) use word */
	/*
	 *  Put fs onto word
	 */
	if (unifyPATRFeatures(wordt->pFeature,
			  pFeatd->pFeature, FALSE, pThis) == NULL)
	displayNumberedMessage(&sIncompatibleFeaturesOn_m,
				   pThis->bSilent, pThis->bShowWarnings,
				   pThis->pLogFP,
				   NULL, 0,
				   word->pszCategory);
	if (!verifyAcyclicPATRFeature(wordt->pFeature))
	{
	displayNumberedMessage(&sCyclicWordFeature_m,
				   pThis->bSilent, pThis->bShowWarnings,
				   pThis->pLogFP,
				   NULL, 0,
				   word->pszCategory);
	wordt->pFeature = NULL;
	}

	/* Promote defaults to atom */
	if (pThis->bPromoteDefAtoms)
	promote_defatoms( wordt->pFeature, pThis );
	/*
	 *  if cat feature, use it for cat
	 */
	if ((stemp = findPATRCatFeature(wordt->pFeature,
					pThis->pGrammar)) != NULL)
	wordt->pszCategory = allocPATRStringCopy( stemp, pThis );
	/*
	 *  store only one copy of identical word nodes
	 */
	if (wordt != word)
	{
	if (identical_words(wordt, word))
		{
		word->pNext = wordt->pNext;	/* restore old link */
		wordt->pNext = NULL;	/* wordt will be garbage collected */
		}
	else
		{
		for ( wordp = wordt->pNext ; wordp ; wordp = wordp->pNext )
		{
		if (identical_words(wordt, wordp))
			{
			word->pNext = wordt->pNext;	/* restore old link */
			wordt->pNext = NULL;	/* will be garbage collected */
			break;
			}
		}
		}
	}
	}
}

/*----------------------------------------------------------------------------
 * NAME
 *    addNewString
 * DESCRIPTION
 *    Add a node to the end of a linked list of StringList nodes.
 * RETURN VALUE
 *    pointer to the stored list (either vlist or vitem)
 */
static VOIDP addNewString(vitem, vlist)
VOIDP vitem;		/* current StringList node to add the list */
VOIDP vlist;		/* list of StringList nodes */
{
register StringList *pSL;
/*
 *  if empty list, just return the item
 */
if (vlist == (VOIDP)NULL)
	return(vitem);
/*
 *  add the item to the end of the list, then return the head of the list
 */
for ( pSL = (StringList *)vlist ; pSL->pNext ; pSL = pSL->pNext )
	;
pSL->pNext = (StringList *)vitem;
return(vlist);
}

/*****************************************************************************
 * NAME
 *    storedPATRString
 * DESCRIPTION
 *    find a stored string, or store it
 * RETURN VALUE
 *    pointer to the stored string
 */
char * storedPATRString(pszString, pThis)
char *	pszString;
PATRData *      pThis;
{
StringList *pSL;
StringList *pTailSL;
/*
 *  find the string if it's already stored
 */
pTailSL = (StringList *)NULL;
for (	pSL = (StringList *)findDataInTrie(pThis->pMem->pStoredStringTable,
					   pszString) ;
	pSL ;
	pSL = pSL->pNext )
	{
	if (strcmp(pszString, pSL->pszString) == 0)
	return pSL->pszString;
	pTailSL = pSL;
	}
/*
 *  store the string for future reference
 */
#define MAX_TRIE_DEPTH 3
pSL = (StringList *)allocMemory(sizeof(StringList));
pSL->pszString = duplicateString( pszString );
pSL->pNext     = (StringList *)NULL;
if (pTailSL != NULL)
	pTailSL->pNext = pSL;
else
	pThis->pMem->pStoredStringTable = addDataToTrie(
					pThis->pMem->pStoredStringTable,
					pszString, pSL,
					addNewString, MAX_TRIE_DEPTH);
return pSL->pszString;
}

/*----------------------------------------------------------------------------
 * NAME
 *    showTrieStringList
 * DESCRIPTION
 *    write the list of StringList nodes to the output file
 * RETURN VALUE
 *    none
 */
static void showTrieStringList(vlist, indent, outfp)
VOIDP	vlist;		/* list of StringList nodes */
int	indent;
FILE *	outfp;
{
StringList *	pSL;
int		i;
/*
 *  if empty list or NULL file, just return
 */
if ((vlist == (VOIDP)NULL) || (outfp == (FILE *)NULL))
	return;
/*
 *  write the stored strings, one per line
 */
for ( pSL = (StringList *)vlist ; pSL ; pSL = pSL->pNext )
	{
	putc('\n', outfp);
	for ( i = 0 ; i < indent ; ++i )
	putc(' ', outfp);
	fprintf(outfp, "%s\t\t%lx", pSL->pszString, (unsigned long)pSL->pszString);
	}
}

/*****************************************************************************
 * NAME
 *    showPATRStrings
 * DESCRIPTION
 *    write the stored strings to the standard output
 * RETURN VALUE
 *    none
 */
void showPATRStrings(pThis)
PATRData * pThis;
{
if (pThis->pMem->pStoredStringTable != NULL)
	{
	writeTrieData(pThis->pMem->pStoredStringTable, showTrieStringList,
		  stdout);
	fputc('\n', stdout);
	}
}

/*----------------------------------------------------------------------------
 * NAME
 *    freeTrieStringList
 * DESCRIPTION
 *    free the list of StringList nodes
 * RETURN VALUE
 *    none
 */
static void freeTrieStringList(vlist)
VOIDP	vlist;		/* list of StringList nodes */
{
StringList *	pSL;
StringList *	pNextSL;
/*
 *  if empty list, just return
 */
if (vlist == (VOIDP)NULL)
	return;
/*
 *  free the stored strings and list nodes
 */
for ( pSL = (StringList *)vlist ; pSL ; pSL = pNextSL )
	{
	pNextSL = pSL->pNext;
	freeMemory(pSL->pszString);
	freeMemory(pSL);
	}
}

/*****************************************************************************
 * NAME
 *    freePATRStrings
 * DESCRIPTION
 *    free all of the stored strings
 * RETURN VALUE
 *    none
 */
static void freePATRStrings(pThis)
PATRData * pThis;
{
if (pThis->pMem->pStoredStringTable != NULL)
	eraseTrie(pThis->pMem->pStoredStringTable, freeTrieStringList);
pThis->pMem->pStoredStringTable = NULL;
}

/*****************************************************************************
 * NAME
 *    followPATRFeaturePath
 * DESCRIPTION
 *    Find the feature indicated by the path.
 * RETURN VALUE
 *    pointer to feature value specified by path, or NULL if not found
 */
PATRFeature * followPATRFeaturePath(pFeature_in, pPath_in)
PATRFeature *	pFeature_in;	/* pointer to a feature structure */
StringList *	pPath_in;	/* list of feature path labels */
{
PATRComplexFeature *	flp;
PATRFeature *		pFeature;

if (pFeature_in == (PATRFeature *)NULL)
	return NULL;
pFeature = followPATRForwardPointers( pFeature_in );
if (pPath_in == (StringList *)NULL)
	return( pFeature );

if (pFeature->eType == PATR_COMPLEX)
	{
	for ( flp = pFeature->u.pComplex ; flp ; flp = flp->pNext )
	{
	if (strcmp(flp->pszLabel, pPath_in->pszString) == 0)
		return followPATRFeaturePath(flp->pValue, pPath_in->pNext);
	}
	}
return NULL;
}

static int	note_mult P((PATRFeature *x, PATRData * pThis));
static void	check_mult P((PATRFeature *x, PATRData * pThis));

/*****************************************************************************
 * NAME
 *    note_mult
 * DESCRIPTION
 *    Note that x has been visited, and return whether visited before.
 * RETURN VALUE
 *    True if x visited before, else false.
 */
static int note_mult(x, pThis)
PATRFeature * x;	/* feature node to note that it has been seen */
PATRData * pThis;
{
PATRDisplayedFeature * m;			/* Temp for mult check */

for ( m = pThis->pMem->pMultTop ; m ; m = m->pNext )
	{					/* For each node in list */
	if ( m->pFeature == x )			/* If x found */
	{
	m->bMultiple = TRUE;		/* Remember used multiple times */
	return( TRUE );			/* Return true */
	}
	}
/*
 *  x not found
 */
m = allocPATRDisplayedFeature(pThis);
m->pFeature = x;			/* Remember x */
m->bMultiple = FALSE;			/* Clear used multiple times */
m->bVisited  = FALSE;			/* Clear visited */
m->pNext = pThis->pMem->pMultTop;	/* Link before old top */
pThis->pMem->pMultTop = m;		/* Set top to this */
return( 0 );				/* Return FALSE for first visit */
}

/*****************************************************************************
 * NAME
 *    check_mult
 * DESCRIPTION
 *    Check for multiple references (co-references) in feature structure.
 * RETURN VALUE
 *    none
 */
static void check_mult(x, pThis)
PATRFeature *	x;	/* feature node to check */
PATRData * pThis;
{
PATRComplexFeature *flist;				/* Temp list pointer */

x = followPATRForwardPointers( x );
if (x == NULL)
	return;
if ( (x->eType == PATR_COMPLEX) || ( x->eType == PATR_NULLFS ) )
	{
	if ( note_mult( x, pThis ) )		/* Note it has been seen */
	return;
	if ( x->eType == PATR_COMPLEX )	/* If complex, check embedded values */
	{
	for ( flist = x->u.pComplex ; flist ; flist = flist->pNext )
		check_mult( flist->pValue, pThis );
	}
	}
}

/*****************************************************************************
 * NAME
 *    checkPATRFeatureCoreferences
 * DESCRIPTION
 *    Check for multiple references (co-references) in feature structure.
 * RETURN VALUE
 *    none
 */
void checkPATRFeatureCoreferences(x, pThis)
PATRFeature *	x;	/* feature node to check */
PATRData * pThis;
{
if (x != NULL)
	check_mult( x, pThis );
}

/*****************************************************************************
 * NAME
 *    markPATRParseCoref
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
void markPATRParseCoref(pEdge_in, pPATR_in)
PATREdge * pEdge_in;
PATRData * pPATR_in;
{
PATREdgeList * pel;
PATRFeature * pFeat;
char * psz0;

if (pEdge_in == NULL)
	return;
psz0 = storedPATRString( "0", pPATR_in);
pFeat = findPATRAttribute(pEdge_in->pFeature, psz0);
if (pFeat == NULL)
	pFeat = pEdge_in->pFeature;
if (pFeat != NULL)
	check_mult(pFeat, pPATR_in);
if (pEdge_in->eType == PATR_RULE_EDGE)
	{
	for ( pel = pEdge_in->u.r.pChildren ; pel ; pel = pel->pNext )
	{
	markPATRParseCoref(pel->pEdge, pPATR_in);
	}
	}
}

/*****************************************************************************
 * NAME
 *    getPATRFeatureCoreference
 * DESCRIPTION
 *    Check to see if x was used multiple times.
 * RETURN VALUE
 *    Reference number if used multiple times, else zero.
 */
int getPATRFeatureCoreference(x, pThis)
PATRFeature *	x;	/* structure to check */
PATRData * pThis;
{
PATRDisplayedFeature *m;			/* Temp for mult check */
int num;			/* Count multiples to make reference number */

x = followPATRForwardPointers( x );
/*
 *  Only do complex or NULL
 */
if ((x->eType != PATR_COMPLEX) && (x->eType != PATR_NULLFS))
	return( 0 );
num = 0;
for ( m = pThis->pMem->pMultTop ; m ; m = m->pNext )
	{					/* For each node in list */
	if ( m->bMultiple )			/* If multiple */
	num++;				/* Increment count */
	if ( m->pFeature == x )			/* If x found */
	{
	if ( m->bMultiple )			/* If used multiple times */
		return( num );		/* Return true */
	else
		return( 0 );		/* Else return false */
	}
	}
reportMessage(TRUE,
		  "PROGRAM BUG: %08lx not found in getPATRFeatureCoreference()\n",
		  (unsigned long)x);
return( 0 );				/* not found (SHOULD NEVER HAPPEN) */
}

/*****************************************************************************
 * NAME
 *    repeatedPATRFeatureCoreference
 * DESCRIPTION
 *    Check to see if x was visited multiple times.
 * RETURN VALUE
 *    True if visited before, else false.
 */
int repeatedPATRFeatureCoreference(x, pThis)
PATRFeature *	x;	/* structure to check */
PATRData * pThis;
{
PATRDisplayedFeature *	m;		/* Temp for mult check */

x = followPATRForwardPointers( x );
/*
 *  Only do complex or NULL
 */
if ((x->eType != PATR_COMPLEX) && (x->eType != PATR_NULLFS))
	return( 0 );

for ( m = pThis->pMem->pMultTop ; m ; m = m->pNext )
	{					/* For each node in list */
	if ( m->pFeature == x )			/* If x found */
	{
	if ( m->bVisited )		/* If visited before */
		return( TRUE );		/* Return true */
	else
		{
		m->bVisited = TRUE;		/* Else remember visited now */
		return( FALSE );		/* Return false for not seen before */
		}
	}
	}
reportMessage(TRUE,
	   "PROGRAM BUG: x not found in repeatedPATRFeatureCoreference() check\n");
return( 0 );				/* not found (SHOULD NEVER HAPPEN) */
}

/*****************************************************************************
 * NAME
 *    resetPATRFeatureCoreferenceCheck
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
void resetPATRFeatureCoreferenceCheck(pThis)
PATRData * pThis;
{
pThis->pMem->pMultTop = NULL;
}

/*****************************************************************************
 * NAME
 *    parsePATRFeatureString
 * DESCRIPTION
 *    parse a string to build a PATR feature structure
 * RETURN VALUE
 *    pointer to a new PATR feature structure, or NULL
 */
PATRFeature * parsePATRFeatureString(pszField_in, pThis)
char *		pszField_in;
PATRData *	pThis;
{
char *		p;
char *		pszEndPath;
PATRFeature *	pPath;
PATRFeature *	pFeature = NULL;

if ((pszField_in == NULL) || (pThis == NULL))
	return NULL;

p = pszField_in + strspn(pszField_in, szWhitespace_m);
if (*p == NUL)
	return NULL;
markPATRParseGarbage(pThis);
if (*p == '[')
	{
	}
else if (*p == '{')
	{
	}
else if (*p == '<')
	{
	while (*p == '<')
	{
	/*
	 *  terminate the path expression
	 */
	pszEndPath = strchr(p, '>');
	if (pszEndPath == NULL)
		break;
	++pszEndPath;
	pszEndPath += strspn(pszEndPath, szWhitespace_m);
	if (*pszEndPath != '=')
		break;
	++pszEndPath;
	pszEndPath += strspn(pszEndPath, szWhitespace_m);
	if (*pszEndPath == NUL)
		break;
	pszEndPath = strpbrk(pszEndPath, szWhitespace_m);
	if (pszEndPath == NULL)
		pszEndPath = p + strlen(p);
	else
		*pszEndPath++ = NUL;
	/*
	 *  parse the path expression
	 */
	pPath = parsePATRFeaturePath(p, pThis->pGrammar, pThis);
	if (pPath == NULL)
		break;
	/*
	 *  add it to the feature structure
	 */
	if (pFeature == NULL)
		pFeature = pPath;
	else
		pFeature = unifyPATRFeatures(pFeature, pPath, FALSE, pThis);
	if (pFeature == NULL)
		break;
	if (!verifyAcyclicPATRFeature(pFeature))
		{
		displayNumberedMessage(&sUnificationProducesCycle_m,
				   pThis->bSilent, pThis->bShowWarnings,
				   pThis->pLogFP,
				   NULL, 0, "");
		pFeature = NULL;
		break;
		}
	/*
	 *  move to the next path expression
	 */
	p = pszEndPath + strspn(pszEndPath, szWhitespace_m);
	}
	}
else
	{
	}

if (pFeature != NULL)
	pFeature = storePATRFeature(pFeature, pThis);
collectPATRParseGarbage(pThis);

return pFeature;
}

/*****************************************************************************
 * NAME
 *    freePATRInternalMemory
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
void freePATRInternalMemory(pThis)
PATRData * pThis;
{
/*
 *  free the scratch memory used by unification
 */
cleanupPATRUnifyDebris(pThis);
/*
 *  free all of the stored strings
 */
freePATRStrings(pThis);
/*
 *  free any memory allocated for the output buffer
 */
resetDynString(&pThis->pMem->dstrOutput);
}

/*****************************************************************************
 * NAME
 *    compare_feature_labels
 * DESCRIPTION
 *    comparison function for sorting the elements of a complex feature by
 *    their labels
 * RETURN VALUE
 *    TRUE if first > second (they should swap positions), FALSE otherwise
 */
static int compare_feature_labels(first, second, pGrammar_in, pPATR_in)
char *		first;
char *		second;
PATRGrammar *	pGrammar_in;
PATRData *      pPATR_in;
{
StringList *pName;
int first_idx;
int second_idx;
char *	pszCatFeatName;

if (	(pGrammar_in != (PATRGrammar *)NULL) &&
	(pGrammar_in->pAttributeOrder != (StringList *)NULL) )
	{
	for (   first_idx = 0, pName = pGrammar_in->pAttributeOrder ;
		pName ;
		pName = pName->pNext, ++first_idx )
	{
	if (strcmp(pName->pszString, first) == 0)
		break;
	}
	for (   second_idx = 0, pName = pGrammar_in->pAttributeOrder ;
		pName ;
		pName = pName->pNext, ++second_idx )
	{
	if (strcmp(pName->pszString, second) == 0)
		break;
	}
	if (first_idx != second_idx)
	return( first_idx > second_idx );
	}
if (pGrammar_in != NULL)
	pszCatFeatName = pGrammar_in->pszCatFeatName;
else
	pszCatFeatName = storedPATRString( "cat", pPATR_in);
return ((strcmp(first, second) > 0) && (strcmp(first, pszCatFeatName) != 0)) ||
	(strcmp(second, pszCatFeatName) == 0);
}

/*****************************************************************************
 * NAME
 *    sortPATRComplexFeature
 * ARGUMENTS
 *    pComplex_in - list of elements of a complex feature structure
 *    pGrammar_in - PATR grammar, used for Attribute Order
 * DESCRIPTION
 *    sort the list of elements alphabetically by label, except that "cat"
 *    always comes first.  This function uses a shell sort.
 * RETURN VALUE
 *    none
 */
void sortPATRComplexFeature(pComplex_in, pGrammar_in, pPATR_in)
PATRComplexFeature * pComplex_in;
PATRGrammar *   pGrammar_in;
PATRData *      pPATR_in;
{
PATRComplexFeature *ap, *bp, *nextp;
PATRComplexFeature x;
int h, j, k;
int num;
/*
 *  first, get the number of increments we'll use for the sequence
 *	h[0] = 1, h[i] = (3 * h[i-1]) + 1, h[max+2] >= N
 *  (see Knuth, Volume 3, page 95)
 */
for ( num = 0, ap = pComplex_in ; ap ; ap = ap->pNext, ++num )
	;
for ( k = 1, h = 1 ; h < num ; ++k )
	h = (3 * h) + 1;
if (k > 3)
	k -= 2;
while (k > 0)
	{
	for ( j = 1, h = 1 ; j < k ; ++j )
	h = (3 * h) + 1;
	for ( nextp = pComplex_in ; nextp && h ; --h, nextp = nextp->pNext )
	;
	do	{
	j = 0;
	for (	ap = pComplex_in, bp = nextp ;
		bp ;
		bp = bp->pNext, ap = ap->pNext )
		{
		if (compare_feature_labels(ap->pszLabel, bp->pszLabel, pGrammar_in,
					   pPATR_in))
		{
		x.pszLabel   = ap->pszLabel;
		x.pValue     = ap->pValue;
		ap->pszLabel = bp->pszLabel;
		ap->pValue   = bp->pValue;
		bp->pszLabel = x.pszLabel;
		bp->pValue   = x.pValue;
		++j;
		}
		}
	} while (j != 0);
	--k;
	}
}

/*****************************************************************************
 * NAME
 *    markPATRParseUnprinted
 * DESCRIPTION
 *    Clear the bPrinted flag in each PATREdge node in the parse chart.
 * RETURN VALUE
 *    none
 */
void markPATRParseUnprinted(pEdge_in)
PATREdge * pEdge_in;
{
PATREdgeList * pel;

if (pEdge_in != NULL)
	{
	pEdge_in->bPrinted = FALSE;
	if (pEdge_in->eType == PATR_RULE_EDGE)
	{
	for ( pel = pEdge_in->u.r.pChildren ; pel ; pel = pel->pNext )
		{
		markPATRParseUnprinted(pel->pEdge);
		}
	}
	}
}

/*****************************************************************************
 * NAME
 *    failedPATRParse
 * DESCRIPTION
 *
 * RETURN VALUE
 *    TRUE if the parse tree contains a failed node, otherwise FALSE
 */
int failedPATRParse(pEdge_in)
PATREdge * pEdge_in;
{
PATREdgeList * pel;

if (pEdge_in == NULL)
	return FALSE;
if (pEdge_in->bFailed)
	return TRUE;
if (pEdge_in->eType == PATR_RULE_EDGE)
	{
	for ( pel = pEdge_in->u.r.pChildren ; pel ; pel = pel->pNext )
	{
	if (failedPATRParse(pel->pEdge))
		return TRUE;
	}
	}
return FALSE;
}

/*****************************************************************************
 * NAME
 *    initPATRSentenceFinalPunctuation
 * DESCRIPTION
 *    Establish the default set of sentence final punctuation characters.
 * RETURN VALUE
 *    none
 */
void initPATRSentenceFinalPunctuation(pPATR_io)
PATRData * pPATR_io;
{
clearPATRSentenceFinalPunctuation(pPATR_io);
addPATRSentenceFinalPunctuation(pPATR_io, ".");
addPATRSentenceFinalPunctuation(pPATR_io, "?");
addPATRSentenceFinalPunctuation(pPATR_io, "!");
addPATRSentenceFinalPunctuation(pPATR_io, ":");
addPATRSentenceFinalPunctuation(pPATR_io, ";");
}

/*****************************************************************************
 * NAME
 *    clearPATRSentenceFinalPunctuation
 * DESCRIPTION
 *    Remove any existing punctuation characters from the list of sentence
 *    final punctuation characters.
 * RETURN VALUE
 *    none
 */
void clearPATRSentenceFinalPunctuation(pPATR_io)
PATRData * pPATR_io;
{
if (pPATR_io->pFinalPunc)
	{
	freeStringList(pPATR_io->pFinalPunc);
	pPATR_io->pFinalPunc = NULL;
	}
}

/*****************************************************************************
 * NAME
 *    addPATRSentenceFinalPunctuation
 * DESCRIPTION
 *    Add a punctuation character to the list of sentence final punctuation
 *    characters.
 * RETURN VALUE
 *    none
 */
void addPATRSentenceFinalPunctuation(pPATR_io, pszChar_in)
PATRData * pPATR_io;
const char * pszChar_in;
{
pPATR_io->pFinalPunc = mergeIntoStringListAtEnd(pPATR_io->pFinalPunc,
						pszChar_in);
}
