/* LOADSEG.C - Load segment inventory file
 *
------------------------------------------------------------
 *   (feature value assignment/checking needs work)
------------------------------------------------------------
 *
 *	Andy Black
 *	08-Apr-92
 *
 ***************************************************************************
 *
 *      static struct segment_list *add_seg( cp, slp )
 *           char *cp;
 *           struct segment_list *slp;
 *
 *      static void disp_segs( slp )
 *           struct segment_list *slp;
 *
 *      static int get_feature_value( cp, vals, feature_name )
 *           char *cp;
 *           char *vals;
 *           char *feature_name;
 *
 *      struct segment_list *load_segs(seg_file, comment_char, do_disp)
 *           char *seg_file;
 *           int comment_char;
 *           int do_disp;
 *
 ***************************************************************************
 *	EDIT HISTORY
 *	08-Apr-92	hab - initial coding
 *      22-Feb-95 0.1.43 hab- never called free_record to free extra space
 ***************************************************************************
 * Copyright 1992 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>

#include "stamp.h"
#ifdef ORIGTP
#include "tonepars.h"
#include "tone.h"
#include "codetab.h"
#endif /* ORIGTP */

/********************* STANDARD LIBRARY FUNCTIONS *********************/

extern int atoi P((const char *string));

/********************* OPACLIB FUNCTIONS *********************/

			/* opaclib/zapnl.c */
extern char *zapnl P((char *cp));

			/* tone.c */
extern struct tone_seg_list *add_tone_seg_rep P((char *lp, struct tone_seg_list *stp,
				char *errhead));
extern void  show_tone_seg_list P((FILE *pOutputFP_in,
				   struct tone_seg_list *tsl));
extern char *tone_value_name P((int td));


/************************************************************
 * error header strings
 */
static char errhead[] = "\nLOAD SEGMENTS: ";
static char null_seg_err[] = "%s%s defined before its segment; ignoring it\n";

/******************************************************************************
 * field code table for Segment Inventory file
 *
 * External Internal  description
 * -------- --------  -----------
 * \appendix  A       Can be an appendix to a syllable
 * \cons      c       consonantal feature
 * \cont      C       continuant feature
 * \mb        M       mora bearing
 * \s         S       segment string defintion
 * \son       s       sonorant feature
 * \toneseg   T       segment with tone representation
 * \u         U       underlying segment definition
 *
 */
/*
 *  control code table
 */
static const CodeTable asSegmentFields_m = { "\
\\appendix\0A\0\
\\cons\0c\0\
\\cont\0C\0\
\\mb\0M\0\
\\s\0S\0\
\\son\0s\0\
\\toneseg\0T\0\
\\u\0U\0\
", 8, NULL };

static const char szWhitespace_m[7] = " \t\r\n\f\v";

/****************************************************************************
 * NAME
 *    add_seg
 * ARGUMENTS
 *    cp  - pointer to segment
 *    slp - pointer to head of segment list
 * DESCRIPTION
 *    Add a segment structure to the segment_list
 * RETURN VALUE
 *    new head of segment list
 */
static struct segment_list *add_seg( cp, slp )
	 char *cp;
	 struct segment_list *slp;
{
  struct segment *sp;
  struct segment_list *sl;


		/*  allocate space and store the segment string */
  cp = zapnl(cp);
  sp = (struct segment *)allocMemory(sizeof(struct segment));
  sp->seg_len = strlen(cp);
  sp->seg_str = duplicateString( cp );
  sp->seg_mora = 0;
  sp->seg_undr = (char *)NULL;
  sp->seg_tone = (struct tone_seg_list *)NULL;
  sp->seg_son  = 0;
  sp->seg_cons = 0;
  sp->seg_cont = 0;
  sp->seg_appx = FALSE;

		/* add the segment structure to the segment list */

  sl = (struct segment_list *)allocMemory(sizeof(struct segment_list));
  sl->segl_seg = sp;
		/* link the segment_list element into the list */
  if (slp == (struct segment_list *)NULL)
	sl->segl_next = (struct segment_list *)NULL;
  else
	sl->segl_next = slp;

  return(sl);	/* return the new end of the list */
}	/* end add_seg */

/****************************************************************************
 * NAME
 *    disp_segs
 * ARGUMENTS
 *    slp - pointer to head of segment list
 * DESCRIPTION
 *    Display the segments in the segment_list
 * RETURN VALUE
 *    NONE
 */
static void disp_segs( slp, pStamp_in )
	 struct segment_list *slp;
	 StampData           *pStamp_in;
{
  struct segment *sp;
  struct segment_list *sl;

  if (pStamp_in->pLogFP == NULL)
	return;

  if (slp == (struct segment_list *)NULL)
	fprintf(pStamp_in->pLogFP,
		"\nSEGMENT INVENTORY: there are no segments.\n");
  else
	{
		/*  run through the list, displaying the segment info */

	  fprintf(pStamp_in->pLogFP,
		  "\nSegment Length Moras Underlying Son Cons Cont Appx Tone");
	  fprintf(pStamp_in->pLogFP,
		  "\n------- ------ ----- ---------- --- ---- ---- ---- ----");

	  for (sl = slp;
	   sl != (struct segment_list *)NULL;
	   sl = sl->segl_next)
	{
	  sp = sl->segl_seg;
	  fprintf(pStamp_in->pLogFP,
		  "\n%7s %4d   %3d     %7s   %s   %s    %s    %s",
		  sp->seg_str,
		  sp->seg_len,
		  (sp->seg_mora) ? sp->seg_mora : 0,
		  (sp->seg_undr != (char *)NULL) ? sp->seg_undr : " ",
		  (sp->seg_son  == 0) ? "+" : "-",
		  (sp->seg_cons == 0) ? "+" : "-",
		  (sp->seg_cont == 0) ? "+" : "-",
		  (sp->seg_appx)      ? "T" : " ");
	  show_tone_seg_list(pStamp_in->pLogFP, sp->seg_tone);
	}
	}
}	/* end disp_segs */

/****************************************************************************
 * NAME
 *    get_feature_value
 * ARGUMENTS
 *    cp - pointer to character containing potential feature value string
 *    vals - pointer to string of possible values
 *    feature_name - string containing the field code (for error message)
 * DESCRIPTION
 *    Get the value of a feature field.
 * RETURN VALUE
 *    Code for feature if a valid value found
 *    -1 otherwise
 */
static int get_feature_value( cp, vals, feature_name, pStamp_in )
	 char *cp;
	 char *vals;
	 char *feature_name;
	 StampData *pStamp_in;
{
  char *cp1;

  cp1 = vals;
  while (*cp1 != NUL)
	{
	  if (*cp == *cp1)
	return( cp1 - vals );
	  else
	cp1++;
	}

  if (pStamp_in->pLogFP != NULL)
	fprintf(pStamp_in->pLogFP,
		"%sno value found for feature %s", errhead, feature_name);
  return( -1 );
}	/* end get_feature_value */

/****************************************************************************
 * NAME
 *    load_segs
 * ARGUMENTS
 *    seg_file     - name of the segment file
 *    segs         - head of segment list
 *    comment_char - comment character used in file
 *    do_disp      - display segment inventory flag
 * DESCRIPTION
 *    Load the segment inventory file.
 * RETURN VALUE
 *    zero if successful, -1 if error occurs
 */
int load_segs(pszFileName_in, bVerify, pStamp_in)
	 char *pszFileName_in;
	 int   bVerify;
	 StampData *pStamp_in;
{
char *	recp;		/* overall record pointer */
char *	rp;		/* Current string in record */
char *	endp;		/* End of current string in record */
int	code;		/* Field code for current string in record */
FILE *	infp;
struct segment_list *segs = (struct segment_list *)NULL;
int feat;
char *pEnd;
/*
 *  read the entire segment inventory file into a single record
 */
infp = fopen(pszFileName_in, "r");
if (infp == NULL)
	{
	return 1;
	}
recp = readStdFormatRecord(infp, &asSegmentFields_m, pStamp_in->cComment,
			   NULL);
if (pStamp_in->iDebugLevel && (pStamp_in->pLogFP != NULL))
	fprintf(pStamp_in->pLogFP, "\nRECORD IS:\n%s\n\n",
		recp ? recp : "?unreadable? (NULL)");
if (recp == (char *)NULL)
	{
	return 0;			/* nothing in the file?  oh, well... */
	}
/*
 *  fill in global tone data according to codes in record
 */
for ( rp = recp ; *rp != NUL ; rp = endp )
	{                           /* field code is first char on line */
	code = *rp++;
	rp += strspn(rp, szWhitespace_m);	/* skip over white space */
	endp = rp + strlen(rp) + 1;         /* get pointer to next field */
	if ((pStamp_in->iDebugLevel == 5) && (pStamp_in->pLogFP != NULL))
		fprintf(pStamp_in->pLogFP, "\ncode = %c\n", code);
	switch (code)
		{
	case 'S':               /* \s - segment string definition */
		pEnd = isolateWord(rp);
		segs = add_seg(rp,segs);	/* add the segment to the segment list */
		break;

	  case 'T':		/* \toneseg - segment with tones
				   representation */
		pEnd = rp + strlen(rp);
		if (segs == (struct segment_list *)NULL &&
		pStamp_in->pLogFP)
		  fprintf(pStamp_in->pLogFP, null_seg_err, errhead,
			  "Tone segment" );
		else
		  segs->segl_seg->seg_tone = add_tone_seg_rep(rp,
				  segs->segl_seg->seg_tone, errhead);
		break;

	case 'U':               /* \u - underlying segment string definition */
		pEnd = isolateWord(rp);
		if (segs == (struct segment_list *)NULL)
		  printf(null_seg_err, errhead, "Underlying segment" );
		else
		  {
		segs->segl_seg->seg_undr = duplicateString( rp );
		  }
		break;

	case 'M':		/* \mb - mora bearing */
		pEnd = isolateWord(rp);
		if (segs == (struct segment_list *)NULL)
		  printf(null_seg_err, errhead, "Mora Bearing unit" );
		else
		  {
		segs->segl_seg->seg_mora = atoi(rp);
		if (segs->segl_seg->seg_mora <= 0)
		  segs->segl_seg->seg_mora = 1;		/* default is 1 */
		  }
		break;

	case 's':		/* \son - sonorancy feature */
		pEnd = isolateWord(rp);
		if (segs == (struct segment_list *)NULL)
		  printf(null_seg_err, errhead, "Sonorancy feature" );
		else
		  {
		if ((feat = get_feature_value(rp, "+-", "\\son",
						  pStamp_in)))
		  segs->segl_seg->seg_son = feat;
		  }
		break;

	case 'C':		/* \cont - continuancy feature */
		pEnd = isolateWord(rp);
		if (segs == (struct segment_list *)NULL)
		  printf(null_seg_err, errhead, "Continuancy feature");
		else
		  {
		if ((feat = get_feature_value(rp, "+-", "\\cont",
						  pStamp_in)))
		  segs->segl_seg->seg_cont = feat;
		  }
		break;

	case 'c':		/* \cons - consonantal feature */
		pEnd = isolateWord(rp);
		if (segs == (struct segment_list *)NULL)
		  printf(null_seg_err, errhead, "Consonantal feature");
		else
		  {
		if ((feat = get_feature_value(rp, "+-", "\\cons",
						  pStamp_in)))
		  segs->segl_seg->seg_cons = feat;
		  }
		break;

	case 'A':		/* \appendix - can be an appendix to */
		pEnd = isolateWord(rp);	/* a syllable */
		if (segs == (struct segment_list *)NULL)
		  printf(null_seg_err, errhead, "Appendix" );
		else
		  segs->segl_seg->seg_appx = TRUE;

		} /* end switch */

	} /* end for */

if (bVerify)
  disp_segs(segs, pStamp_in);
pStamp_in->pSegments = segs;
return( 0 );

}	/* end load_segs */
