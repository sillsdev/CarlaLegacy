// Ana2XmlLib.cpp : Ana2Xml library routines
//

#include "ana2xmlLib.h"

/* clever hack to handle function prototypes flexibly */
#ifdef HAVE_PROTOTYPES
#define P(args) args
#else
#define P(args) ()
#endif

static void encoded P((FILE *outfp,
					   char *str));
	   void          performMapping        P((AnaData * pAnaData_in));
WordTemplate *       readAnaWord           P((AnaData *pAnaData_in));
	   void          openFiles             P((AnaData * pAnaData_in));
	   void          closeFiles            P((AnaData * pAnaData_in));
#ifdef PatrParse
static void          writeXmlSentenceParse P((WordTemplate *pWord_in,
						  AnaData *pAnaData_in));
#endif /* PatrParse */
static void          writeXmlAnalysisMorph P((AnaMorpheme *pMorph_in,
						  AnaData *pAnaData_in,
						  unsigned long uiAnaCount_in,
						  unsigned long uiMorphCount_in));
static void          writeXmlAnalysis      P((WordAnalysis *pAnalysis_in,
						  AnaData * pAnaData_in,
						  unsigned long uiAnaCount_in));
static void          writeXmlMorphParse    P((WordAnalysis *pAnalysis_in,
						  AnaData *pAnaData_in,
						  unsigned long uiAnaCount_in));
static void          writeXmlMorphParses   P((WordTemplate *pWord_in,
						  AnaData *pAnaData_in));
static void          writeXmlWordCategory  P((char *pszCategory_in,
						  AnaData *pAnaData_in,
						  unsigned long uiAnaCount_in));
static void          writeXmlWord          P((WordTemplate *pWord_in,
						  AnaData *pAnaData_in));
static void          writeXmlAnaRecord     P((WordTemplate *pWord_in,
						  AnaData *pAnaData_in));
static AnaMorpheme * parseAnalysis         P((WordAnalysis *pAnalysis_in,
						  AnaData *pAnaData_in));
static AnaMorpheme * newAnaMorpheme        P((unsigned uiMorphtype_in,
						  char *pszMorphName_in,
						  char *pszRootCat_in));
static void          freeAnaMorpheme    P((AnaMorpheme *pMorphHead_in));
static void          writeAnaMorpheme   P((AnaMorpheme *pMorph,
					   FILE *pOutputFP_in));
static AnaMorpheme * linkAnaMorpheme    P((AnaMorpheme *pLeft_io,
					   AnaMorpheme *pNew_io));
static void          parseDecomposition P((WordAnalysis *pAnalysis_in,
					   AnaData *pAnaData_in,
					   AnaMorpheme *pMorph_io));
static void          parseUnderlyingForm P((WordAnalysis *pAnalysis_in,
						AnaData *pAnaData_in,
						AnaMorpheme *pMorph_io));
static void          parseProperties     P((WordAnalysis *pAnalysis_in,
						AnaData *pAnaData_in,
						AnaMorpheme *pMorph_io));
static void          parseFeatures       P((WordAnalysis *pAnalysis_in,
						AnaData *pAnaData_in,
						AnaMorpheme *pMorph_io));
static void          parseMorphCategories P((WordAnalysis *pAnalysis_in,
						 AnaData *pAnaData_in,
						 AnaMorpheme *pMorph_io));
static void          writePCDATA         P((char * pszText_in,
						FILE *pOutputFP_in));


#undef P

static const char	szErrHead_m[11] = "\nANA2XML: ";

/*************************************************************************
 * NAME
 *    performMapping
 * DESCRIPTION
 *    Top-level processing function for mapping from ANA to XML.
 * RETURN VALUE
 *    none
 */
void performMapping(AnaData * pAnaData_in)
{
  WordTemplate *	pWord;

				/* output header information */
  fprintf(pAnaData_in->pOutputFP, "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n\
<!DOCTYPE XAmpleANA SYSTEM \"xample.dtd\">\n\
<XAmpleANA>\n");

	sprintf(szOutOfMemoryMarker_g, "input word number %ld",
		pAnaData_in->uiWordCount);
	/*
	 * While there is a word to map...
	 */
	  while ( (pWord = readAnaWord(pAnaData_in)) != NULL)
		{
	  sprintf( szOutOfMemoryMarker_g, "input word number %ld",
		   pAnaData_in->uiWordCount );
	  writeXmlAnaRecord(pWord, pAnaData_in);
	  ++pAnaData_in->uiWordCount;
	  freeWordTemplate( pWord );
		}
				/* output trailer */
  fprintf(pAnaData_in->pOutputFP, "</XAmpleANA>\n");
}

/***************************************************************************
 * NAME
 *    readAnaWord
 * DESCRIPTION
 *    Read one record from an analysis database file, storing the information
 *    in a dynamically allocated WordTemplate data structure.
 * RETURN VALUE
 *    pointer to the WordTemplate data structure, or NULL on EOF
 */
WordTemplate * readAnaWord(AnaData *pAnaData_in)
{
WordTemplate *	pWord;
static unsigned long uiWordCount;

pWord = readTemplateFromAnalysis(pAnaData_in->pInputFP,&pAnaData_in->sTextCtl);
uiWordCount = showAmbiguousProgress(1, uiWordCount);

return( pWord );
}

/***************************************************************************
 * NAME
 *    openFiles
 * DESCRIPTION
 *    Open the data files.
 *    Error processing is rather primitive...
 * RETURN VALUE
 *    none
 */
void openFiles(AnaData * pAnaData_in)
{
  if ( pAnaData_in->pszInputFile == NULL)
	{
	  exitSafely(2);		/* must have an input file */
	}
  pAnaData_in->pInputFP = fopen( pAnaData_in->pszInputFile, "r");
  if (pAnaData_in->pInputFP == NULL)
	exitSafely(3);		/* if open failed, then quit */

  if ( pAnaData_in->pszOutputFile == NULL)
	{
	  exitSafely(4);		/* must have an output file */
	}
  if (streq(pAnaData_in->pszOutputFile, "stdout"))
	pAnaData_in->pOutputFP = stdout;
  else
	pAnaData_in->pOutputFP = fopen( pAnaData_in->pszOutputFile, "w");
  if (pAnaData_in->pOutputFP == NULL)
	exitSafely(5);		/* if open failed, then quit */

  if ( pAnaData_in->pszLogFile != NULL)
	{
	  pAnaData_in->pLogFP = fopen( pAnaData_in->pszLogFile, "w");
	  if (pAnaData_in->pLogFP == NULL)
	exitSafely(6);		/* if open failed, then quit */
	}
}

/***************************************************************************
 * NAME
 *    closeFiles
 * DESCRIPTION
 *    Close the open files.
 * RETURN VALUE
 *    none
 */
void closeFiles(AnaData * pAnaData_in)
{
	fclose(pAnaData_in->pInputFP);
	fflush(pAnaData_in->pOutputFP);
	checkFileError(pAnaData_in->pOutputFP, "Ana2Xml", pAnaData_in->pszOutputFile);
	fclose(pAnaData_in->pOutputFP);
	if (pAnaData_in->pLogFP)
	  fclose(pAnaData_in->pLogFP);
}

/***************************************************************************
 * NAME
 *    writeXmlAnalysisMorph
 * DESCRIPTION
 *    Write the XML form of a morpheme in an analysis.
 * RETURN VALUE
 *    none
 */
static void writeXmlAnalysisMorph(AnaMorpheme *pMorph_in,
				  AnaData *pAnaData_in,
				  unsigned long uiAnaCount_in,
				  unsigned long uiMorphCount_in)
{
  if (pMorph_in == NULL || pAnaData_in->pOutputFP == NULL)
	return;

  char *pszMorphType;
				/* morph type */
  if (pMorph_in->iMorphType == PFX)
	pszMorphType = "pfx";
  else if (pMorph_in->iMorphType == SFX)
	pszMorphType = "sfx";
  else
	pszMorphType = "root";
  fprintf(pAnaData_in->pOutputFP, "<%s id=\"%s%d.%d.%d\">", pszMorphType,
	  pszMorphType, pAnaData_in->uiWordCount, uiAnaCount_in,
	  uiMorphCount_in);
				/* morphname */
  fprintf(pAnaData_in->pOutputFP, "<m id=\"m%d.%d.%d\">",
	  pAnaData_in->uiWordCount,
	  uiAnaCount_in, uiMorphCount_in);
  if (pMorph_in->pszMorphname != NULL)
	writePCDATA(pMorph_in->pszMorphname, pAnaData_in->pOutputFP);
  fprintf(pAnaData_in->pOutputFP, "</m>\n");
				/* underlying form */
  if (pMorph_in->pszUnderForm)
	{
	  fprintf(pAnaData_in->pOutputFP, "<u id=\"u%d.%d.%d\">",
		  pAnaData_in->uiWordCount,
		  uiAnaCount_in, uiMorphCount_in);
	  writePCDATA(pMorph_in->pszUnderForm, pAnaData_in->pOutputFP);
	  fprintf(pAnaData_in->pOutputFP, "</u>\n");
	}
				/* decomposition */
  if (pMorph_in->pszDecomposition)
	{
	  fprintf(pAnaData_in->pOutputFP, "<d id=\"d%d.%d.%d\">",
		  pAnaData_in->uiWordCount,
		  uiAnaCount_in, uiMorphCount_in);
	  writePCDATA(pMorph_in->pszDecomposition, pAnaData_in->pOutputFP);
	  fprintf(pAnaData_in->pOutputFP, "</d>\n");
	}
				/* morpheme category/category mapping */
  if (pMorph_in->pszMorphCat)
	{
	  fprintf(pAnaData_in->pOutputFP, "<mcat id=\"mcat%d.%d.%d\">",
		  pAnaData_in->uiWordCount,
		  uiAnaCount_in, uiMorphCount_in);
	  writePCDATA(pMorph_in->pszMorphCat, pAnaData_in->pOutputFP);
	  fprintf(pAnaData_in->pOutputFP, "</mcat>\n");
	}
				/* properties */
  if (pMorph_in->pszProperties)
	{
	  fprintf(pAnaData_in->pOutputFP, "<p id=\"p%d.%d.%d\">",
		  pAnaData_in->uiWordCount,
		  uiAnaCount_in, uiMorphCount_in);
	  writePCDATA(pMorph_in->pszProperties, pAnaData_in->pOutputFP);
	  fprintf(pAnaData_in->pOutputFP, "</p>\n");
	}
				/* feature descriptors */
  if (pMorph_in->pszFeatureDescriptors)
	{
	  fprintf(pAnaData_in->pOutputFP, "<fd id=\"fd%d.%d.%d\">",
		  pAnaData_in->uiWordCount,
		  uiAnaCount_in, uiMorphCount_in);
	  writePCDATA(pMorph_in->pszFeatureDescriptors, pAnaData_in->pOutputFP);
	  fprintf(pAnaData_in->pOutputFP, "</fd>\n");
	}
				/* close morph type */
  fprintf(pAnaData_in->pOutputFP, "</%s>\n", pszMorphType);
}

/***************************************************************************
 * NAME
 *    writeXmlAnalysis
 * DESCRIPTION
 *    Write an analysis in XML format.
 * RETURN VALUE
 *    none
 */
static void writeXmlAnalysis(WordAnalysis *pAnalysis_in,
				   AnaData * pAnaData_in,
				   unsigned long uiAnaCount_in)
{
  AnaMorpheme * pMorph = NULL;
  AnaMorpheme * pHead = NULL;
  unsigned long uiMorphCount = 1;

  if (pAnalysis_in == NULL || pAnaData_in->pOutputFP == NULL)
	return;

  pHead = pMorph = parseAnalysis(pAnalysis_in, pAnaData_in);
  if (pMorph != NULL)
	{
	  fprintf(pAnaData_in->pOutputFP, "<a id=\"a%d.%d\">\n",
		  pAnaData_in->uiWordCount,
		  uiAnaCount_in);
	  while (pMorph != NULL)
	{
	  writeXmlAnalysisMorph(pMorph, pAnaData_in, uiAnaCount_in,
				uiMorphCount);
	  uiMorphCount++;
	  pMorph = pMorph->pRightLink;
	}
	  fprintf(pAnaData_in->pOutputFP, "</a>\n");
	}
  freeAnaMorpheme(pHead);
}

/***************************************************************************
 * NAME
 *    writeXmlMorphParse
 * DESCRIPTION
 *    Write the morpheme parse information in XML format.
 * RETURN VALUE
 *    none
 */
static void writeXmlMorphParse(WordAnalysis *pAnalysis_in,
				 AnaData *pAnaData_in,
				 unsigned long uiAnaCount_in)
{
  if (pAnalysis_in == NULL || pAnaData_in->pOutputFP == NULL)
	return;

  fprintf(pAnaData_in->pOutputFP, "<mparse id=\"mparse%d.%d\">\n",
	  pAnaData_in->uiWordCount,
	  uiAnaCount_in);
  writeXmlAnalysis(pAnalysis_in, pAnaData_in, uiAnaCount_in);
  writeXmlWordCategory(pAnalysis_in->pszCategory, pAnaData_in, uiAnaCount_in);
#ifdef HAVE_WORD_PARSE
  writeXmlWordParse(pAnalysis_in->pszWordParse, pAnaData_in, uiAnaCount_in);
#endif
  fprintf(pAnaData_in->pOutputFP, "</mparse>\n");
}

/***************************************************************************
 * NAME
 *    writeXmlMorphParses
 * DESCRIPTION
 *    Write all morphme parses in XML format.
 * RETURN VALUE
 *    none
 */
static void writeXmlMorphParses(WordTemplate *pWord_in,
				  AnaData *pAnaData_in)
{
  unsigned long uiAnaCount = 1;
  WordAnalysis * pAnalysis;

  if (pWord_in == NULL || pAnaData_in->pOutputFP == NULL)
	return;

  pAnalysis = pWord_in->pAnalyses;
  while (pAnalysis != NULL)	// for each analysis
	{
	  writeXmlMorphParse(pAnalysis, pAnaData_in, uiAnaCount);
	  pAnalysis = pAnalysis->pNext; /* go to next parse */
	  uiAnaCount++;
	}
}

/***************************************************************************
 * NAME
 *    writeXmlWordCategory
 * DESCRIPTION
 *    Write the word category in XML format.
 * RETURN VALUE
 *    none
 */
static void writeXmlWordCategory(char *pszCategory_in,
				   AnaData *pAnaData_in,
				   unsigned long uiAnaCount_in)
{
  char *cp;

  if (pszCategory_in == NULL || pAnaData_in->pOutputFP == NULL)
	return;

  fprintf(pAnaData_in->pOutputFP, "<cat id=\"cat%d.%d\">",
	  pAnaData_in->uiWordCount, uiAnaCount_in);
  cp = strchr(pszCategory_in, ' '); /* check for morpheme cats */
  if (cp != NULL)
	*cp = '\0';
  writePCDATA(pszCategory_in, pAnaData_in->pOutputFP);
  if (cp != NULL)
	*cp = ' ';			/* now put it back */
  fprintf(pAnaData_in->pOutputFP, "</cat>\n");
}

/***************************************************************************
 * NAME
 *    writeXmlWord
 * DESCRIPTION
 *    Write the Word information in XML format.
 * RETURN VALUE
 *    none
 */
static void writeXmlWord(WordTemplate *pWord_in, AnaData *pAnaData_in)
{
  if (pWord_in == NULL || pAnaData_in->pOutputFP == NULL)
	return;

  fprintf(pAnaData_in->pOutputFP, "<w ");
  if (pWord_in->iCapital)
	fprintf(pAnaData_in->pOutputFP, "cap=\"%d\" ", pWord_in->iCapital);
  fprintf(pAnaData_in->pOutputFP, "id=\"w%d\">",
	  pAnaData_in->uiWordCount);
  if (pWord_in->pszOrigWord != NULL)
	writePCDATA(pWord_in->pszOrigWord, pAnaData_in->pOutputFP);
  fprintf(pAnaData_in->pOutputFP, "</w>\n");
}

#ifdef PatrParse
/***************************************************************************
 * NAME
 *    writeXmlSentenceParse
 * DESCRIPTION
 *    Write the PcPatr sentence parse in its XML format.
 * RETURN VALUE
 *    none
 */
static void writeXmlSentenceParse(WordTemplate *pWord_in,
				  AnaData *pAnaData_in)
{

  if (pWord_in == NULL || pAnaData_in->pOutputFP == NULL)
	return;

  if (pWord_in->pszSentenceParse == NULL)
	return;

  fprintf(pAnaData_in->pOutputFP, "%s",
	  pWord_in->pszSentenceParse);
}
#endif /* PatrParse */

/***************************************************************************
 * NAME
 *    writeXmlAnaRecord
 * DESCRIPTION
 *    Write an ANA record in XML format.
 * RETURN VALUE
 *    none
 */
static void writeXmlAnaRecord(WordTemplate *pWord_in,
				AnaData *pAnaData_in)
{

  if (pWord_in == NULL || pAnaData_in->pOutputFP == NULL)
	return;

  fprintf(pAnaData_in->pOutputFP, "<anaRec id=\"anaRec%d\">\n",
	  pAnaData_in->uiWordCount);
  writeXmlWord(pWord_in, pAnaData_in);
  writeXmlMorphParses(pWord_in, pAnaData_in);
  if (pWord_in->pszFormat != NULL)
	{
	  fprintf(pAnaData_in->pOutputFP, "<fmt id=\"fmt%d\">",
		  pAnaData_in->uiWordCount);
	  encoded(pAnaData_in->pOutputFP, pWord_in->pszFormat);
	  fprintf(pAnaData_in->pOutputFP, "</fmt>\n");
	}
  if (pWord_in->pszNonAlpha != NULL)
	{
	  fprintf(pAnaData_in->pOutputFP, "<n id=\"n%d\">",
		  pAnaData_in->uiWordCount);
	  encoded(pAnaData_in->pOutputFP, pWord_in->pszNonAlpha);
	  fprintf(pAnaData_in->pOutputFP, "</n>\n");
	}
#ifdef PatrParse
  if (pWord_in->pszSentenceParse != NULL)
	writeXmlSentenceParse(pWord_in, pAnaData_in);
#endif /* PatrParse */
  fprintf(pAnaData_in->pOutputFP, "</anaRec>\n");
}

// following taken from dtbout.c
/***************************************************************************
 * NAME
 *    encoded
 * ARGUMENTS
 *    pOutFP_in - pointer to output FILE
 *    str   - pointer to string
 * DESCRIPTION
 *    Replace certain control characters in the old string with backslash
 *    escape sequences in the file output.
 * RETURN VALUE
 *    none
 */
static void encoded( FILE *pOutFP_in, char *str)
{
register char *p;
register int c;
register int nl_last;

for ( p = str, nl_last = 0 ; (c = *p++) ; )
	{
	if (nl_last && (c != '\n'))
		{
	/*
	 *  we've had a nl followed by more stuff, so give another line in
	 *  output (safely) (multiple nl's in a row allowed)
	 */
		fputs("\n\t",pOutFP_in);
		nl_last = 0;
		}
	switch ( c )
		{
		case '\b':   fputs( "\\b",  pOutFP_in);                     break;
		case '\f':   fputs( "\\f",  pOutFP_in);                     break;
		case '\n':   fputs( "\\n",  pOutFP_in);     nl_last = 1;    break;
		case '\r':   fputs( "\\r",  pOutFP_in);                     break;
		case '\t':   fputs( "\\t",  pOutFP_in);                     break;
		case '\\':   fputs( "\\\\", pOutFP_in);                     break;
		default:      putc( c,      pOutFP_in);                     break;
		};
	}
}



/*************************************************************************
 * NAME
 *    parseAnalysis
 * DESCRIPTION
 *    Parse an analysis string (presumably produced by AMPLE), creating
 *    a linked list of AnaMorpheme struct's for use in transfer and synthesis.
 * RETURN VALUE
 *    pointer to a list of AnaMorpheme struct's
 */
static AnaMorpheme * parseAnalysis(WordAnalysis *pAnalysis_in,
				   AnaData *pAnaData_in)
{
  static const char szWhitespace_m[7] = " \t\r\n\f\v";
  register char *p;
  char *nextp;
  char *catp = NULL;
  register AnaMorpheme *pAnaMorph = NULL;
  AnaMorpheme *pAnaMorph0;
  AnaMorpheme *pHeadMorph, *pLeftMorph;
  char buffer[BUFSIZE];
  short state;                    /* finite state machine state */
#define WANT_PREFIX     0
#define WANT_ROOTCAT    1
#define WANT_ROOTNAME   2
#define WANT_SUFFIX     3

  /*
   *  check that we have something to do
   */
  if (pAnalysis_in == NULL)
	return( NULL );
  char * pszAnalString = pAnalysis_in->pszAnalysis;
  /*
   *  initialize the state and some pointers
   */
  state = WANT_PREFIX;
  pLeftMorph = NULL;
  pHeadMorph = NULL;
  strcpy(buffer, pszAnalString);  /* (save pszAnalString for error messages) */
  /*
   *  scan across the analysis string
   */
  for (	p = buffer + strspn(buffer, szWhitespace_m) ;
	*p != NUL ;
	p = nextp + strspn(nextp, szWhitespace_m) )
	{
	  /*
	   *  check for state switching markers
	   */
	  if (*p == pAnaData_in->cBeginRoot) /* is it the marker beginning roots?*/
		{
		if (state == WANT_SUFFIX)
			{
			/* run back through and change any preceding suffixes to prefix */
			for (pAnaMorph0 = pAnaMorph;
				 pAnaMorph0 != NULL && pAnaMorph0->iMorphType & SFX;
				 pAnaMorph0 = pAnaMorph0->pLeftLink)
			  pAnaMorph0->iMorphType = PFX;
			}
		else if (state != WANT_PREFIX)
			{
			if ((pAnaData_in->iDebugLevel == 5) &&
		(pAnaData_in->pLogFP != NULL))
				fprintf(pAnaData_in->pLogFP, "\nstate != WANT_PREFIX\n");
		if (pAnaData_in->pLogFP != NULL)
		fprintf(pAnaData_in->pLogFP,
		"%sInvalid marker '%c' found in analysis string\n        %s\n",
			szErrHead_m, pAnaData_in->cBeginRoot, pszAnalString);
			freeAnaMorpheme( pHeadMorph );
			return( NULL );
			}
		state = WANT_ROOTCAT;   /* next thing we want is a root category */
		nextp = p + 1;
		continue;
		}
	if (*p == pAnaData_in->cEndRoot)    /* is it the marker ending roots? */
		{
		if (state != WANT_ROOTCAT)
			{
			if ((pAnaData_in->iDebugLevel == 5) &&
		(pAnaData_in->pLogFP != NULL))
				fprintf(pAnaData_in->pLogFP, "\nstate != WANT_ROOTCAT\n");
		if (pAnaData_in->pLogFP != NULL)
		fprintf(pAnaData_in->pLogFP,
		"%sInvalid marker '%c' found in analysis string\n        %s\n",
			szErrHead_m, pAnaData_in->cEndRoot, pszAnalString);
			freeAnaMorpheme( pHeadMorph );
			return( NULL );
			}
		state = WANT_SUFFIX;    /* now we go looking for suffixes */
		nextp = p + 1;
		continue;
		}
	/*
	 *  handle the token in the input string according to the state
	 */
	nextp = isolateWord(p);           /* split out the token */
	if ((pAnaData_in->iDebugLevel == 5) && (pAnaData_in->pLogFP != NULL))
		fprintf(pAnaData_in->pLogFP, "\nstate = %d\nnextp = %s\n",
		state, nextp);
	switch (state)
		{
		case WANT_PREFIX:
			pAnaMorph = linkAnaMorpheme(pLeftMorph,
					newAnaMorpheme(PFX, p, NULL));
			if (pHeadMorph == NULL)
				pHeadMorph = pAnaMorph;
			pLeftMorph = pAnaMorph;  /* save trailing ptr for linking later */
			break;

		case WANT_ROOTCAT:
			catp = p;                   /* save the address of the catname */
			state = WANT_ROOTNAME;
			break;

		case WANT_ROOTNAME:
			pAnaMorph = linkAnaMorpheme(pLeftMorph,
					newAnaMorpheme(ROOT, p, catp));
			if (pHeadMorph == NULL)
				pHeadMorph = pAnaMorph;
			pLeftMorph = pAnaMorph;  /* save trailing ptr for linking later */
			state = WANT_ROOTCAT;
			break;

		case WANT_SUFFIX:
			pAnaMorph = linkAnaMorpheme(pLeftMorph,
					newAnaMorpheme(SFX, p, NULL));
			if (pHeadMorph == NULL)
				pHeadMorph = pAnaMorph;
			pLeftMorph = pAnaMorph;  /* save trailing ptr for linking later */
			break;

		} /* end switch */

	} /* end for */

/*
 *  check that we're in the right state at the end before accepting this
 *  analysis
 */
if (state != WANT_SUFFIX)       /* accept only valid input */
	{
	if (pAnaData_in->pLogFP != NULL)
	fprintf(pAnaData_in->pLogFP,
		"%sInvalid analysis string\n        %s\n",
		szErrHead_m, pszAnalString);
	freeAnaMorpheme( pHeadMorph );
	return( NULL );
	}
if ((pAnaData_in->iDebugLevel) && (pAnaData_in->pLogFP != NULL))
	{                           /* user wants it, so... */
	fprintf(pAnaData_in->pLogFP, "INPUT ANALYSIS MORPHEME LIST:\n");
	writeAnaMorpheme(pHeadMorph, pAnaData_in->pLogFP);
	}

				/* now do the others */
parseDecomposition(pAnalysis_in, pAnaData_in, pHeadMorph);
parseUnderlyingForm(pAnalysis_in, pAnaData_in, pHeadMorph);
parseProperties(pAnalysis_in, pAnaData_in, pHeadMorph);
parseFeatures(pAnalysis_in, pAnaData_in, pHeadMorph);
parseMorphCategories(pAnalysis_in, pAnaData_in, pHeadMorph);

return( pHeadMorph );                 /* we've done it! */
}

/*************************************************************************
 * NAME
 *    newAnaMorpheme
 * DESCRIPTION
 *    Allocate and initialize a AnaMorpheme.
 * RETURN VALUE
 *    address of the newly allocated node
 */
static AnaMorpheme * newAnaMorpheme(unsigned uiMorphtype_in,
				 char *pszMorphName_in,
				 char *pszRootCat_in)
{
  register AnaMorpheme *pMorph;
  /*
   *  allocate the structure and set all the pointers to NULL
   */
  pMorph = (AnaMorpheme *)allocMemory( sizeof(AnaMorpheme) );
  pMorph->iMorphType            = NULL;
  pMorph->pszMorphname          = NULL;
  pMorph->pszUnderForm          = NULL;
  pMorph->pszDecomposition      = NULL;
  pMorph->pszMorphCat           = NULL;
  pMorph->pszProperties         = NULL;
  pMorph->pszFeatureDescriptors = NULL;
  pMorph->pLeftLink             = NULL;
  pMorph->pRightLink            = NULL;
  /*
   *  fill in what we know about the morpheme
   */
  pMorph->pszMorphname = duplicateString(pszMorphName_in);
  pMorph->iMorphType   = uiMorphtype_in;
  pMorph->pszMorphCat  = duplicateString(pszRootCat_in);

  return( pMorph );
}

/*************************************************************************
 * NAME
 *    freeAnaMorpheme
 * DESCRIPTION
 *    Deallocate all dynamically allocated space associated with a list
 *    of AnaMorpheme struct's, including the struct's themselves.
 * RETURN VALUE
 *    none
 */
static void freeAnaMorpheme(AnaMorpheme *pMorphHead_in)
{
AnaMorpheme *	pMorph;

for ( pMorph = pMorphHead_in ; pMorph ; pMorph = pMorphHead_in )
	{
	  if (pMorph->pszMorphname != NULL)
	freeMemory(pMorph->pszMorphname);
	  if (pMorph->pszUnderForm != NULL)
	freeMemory(pMorph->pszUnderForm);
	  if (pMorph->pszDecomposition != NULL)
	freeMemory(pMorph->pszDecomposition);
	  if (pMorph->pszMorphCat != NULL)
	freeMemory(pMorph->pszMorphCat);
	  if (pMorph->pszProperties != NULL)
	freeMemory(pMorph->pszProperties);
	  if (pMorph->pszFeatureDescriptors != NULL)
	freeMemory(pMorph->pszFeatureDescriptors);
	  pMorphHead_in = pMorphHead_in->pRightLink;
	  freeMemory( (void *)pMorph );                  /* free the node itself */
	}
}

/*************************************************************************
 * NAME
 *    writeAnaMorpheme
 * DESCRIPTION
 *    Display the information stored in a list of AnaMorpheme struct's.
 * RETURN VALUE
 *    none
 */
static void writeAnaMorpheme(AnaMorpheme *pMorph, FILE *pOutputFP_in)
{
if (pOutputFP_in == NULL)
	return;
fprintf(pOutputFP_in, "------------------------------\n");
if (pMorph != NULL)
	{
	for ( ; pMorph ; pMorph = pMorph->pRightLink )
	{
	  fprintf(pOutputFP_in, "\nType     = %d", pMorph->iMorphType);
	  if (pMorph->pszMorphname != NULL)
		fprintf(pOutputFP_in, "\nMorph  = %s", pMorph->pszMorphname);
	  if (pMorph->pszUnderForm != NULL)
		fprintf(pOutputFP_in, "\nUnder  = %s", pMorph->pszUnderForm);
	  if (pMorph->pszDecomposition != NULL)
		fprintf(pOutputFP_in, "\nDecomp = %s", pMorph->pszDecomposition);
	  if (pMorph->pszMorphCat != NULL)
		fprintf(pOutputFP_in, "\nCat    = %s", pMorph->pszMorphCat);
	  if (pMorph->pszProperties != NULL)
		fprintf(pOutputFP_in, "\nProps  = %s", pMorph->pszProperties);
	  if (pMorph->pszFeatureDescriptors != NULL)
		fprintf(pOutputFP_in, "\nFds    = %s", pMorph->pszFeatureDescriptors);
	fprintf(pOutputFP_in, "------------------------------\n");
	}
	}
else
	fprintf(pOutputFP_in, "------------------------------\n\n");
}

/*************************************************************************
 * NAME
 *    parseDecomposition
 * DESCRIPTION
 *    Parse a Decomposition string (presumably produced by AMPLE).
 * RETURN VALUE
 *    none
 */
void parseDecomposition(WordAnalysis *pAnalysis_in,
				   AnaData *pAnaData_in,
				   AnaMorpheme *pMorph_io)
{
  char cDecompSep = pAnaData_in->sTextCtl.cDecomp;
  char *pszDecomp = pAnalysis_in->pszDecomposition;
  char * cp;
  AnaMorpheme *pMorph = pMorph_io;

  while (pMorph != NULL && pszDecomp != NULL && *pszDecomp != '\0')
	{
	  if ((cp = strchr(pszDecomp, cDecompSep)) != NULL)
	{
	  *cp = '\0';
	  pMorph->pszDecomposition = duplicateString(pszDecomp);
	  pszDecomp = cp + 1;
	}
	  else
	{
	  pMorph->pszDecomposition = duplicateString(pszDecomp);
	  pszDecomp = pszDecomp + strlen(pszDecomp);
	}
	  pMorph = pMorph->pRightLink;
	}
}

/*************************************************************************
 * NAME
 *    parseUnderlyingForm
 * DESCRIPTION
 *    Parse an UnderlyingForm string (presumably produced by AMPLE).
 * RETURN VALUE
 *    none
 */
static void parseUnderlyingForm(WordAnalysis *pAnalysis_in,
				   AnaData *pAnaData_in,
				   AnaMorpheme *pMorph_io)
{
  char cUnderFormSep = pAnaData_in->sTextCtl.cDecomp;
  char *pszUnderForm = pAnalysis_in->pszUnderlyingForm;
  char * cp;
  AnaMorpheme *pMorph = pMorph_io;

  while (pMorph != NULL && pszUnderForm != NULL && *pszUnderForm != '\0')
	{
	  if ((cp = strchr(pszUnderForm, cUnderFormSep)) != NULL)
	{
	  *cp = '\0';
	  pMorph->pszUnderForm = duplicateString(pszUnderForm);
	  pszUnderForm = cp + 1;
	}
	  else
	{
	  pMorph->pszUnderForm = duplicateString(pszUnderForm);
	  pszUnderForm = pszUnderForm + strlen(pszUnderForm);
	}
	  pMorph = pMorph->pRightLink;
	}
}

/*************************************************************************
 * NAME
 *    parseProperties
 * DESCRIPTION
 *    Parse a Properties string (presumably produced by AMPLE).
 * RETURN VALUE
 *    none
 */
static void parseProperties(WordAnalysis *pAnalysis_in,
				   AnaData *pAnaData_in,
				   AnaMorpheme *pMorph_io)
{
  char cPropertiesSep = '=';
  char *pszProperties = pAnalysis_in->pszProperties;
  char * cp;
  AnaMorpheme *pMorph = pMorph_io;

  while (pMorph != NULL && pszProperties != NULL && *pszProperties != '\0')
	{
	  if ((cp = strchr(pszProperties, cPropertiesSep)) != NULL)
	{
	  *cp = '\0';
	  pMorph->pszProperties = duplicateString(pszProperties);
	  pszProperties = cp + 1;
	}
	  else
	{
	  pMorph->pszProperties = duplicateString(pszProperties);
	  pszProperties = pszProperties + strlen(pszProperties);
	}
	  pMorph = pMorph->pRightLink;
	}
}

/*************************************************************************
 * NAME
 *    parseFeatures
 * DESCRIPTION
 *    Parse a Features string (presumably produced by AMPLE).
 * RETURN VALUE
 *    none
 */
static void parseFeatures(WordAnalysis *pAnalysis_in,
				   AnaData *pAnaData_in,
				   AnaMorpheme *pMorph_io)
{
  char cFeaturesSep = '=';
  char *pszFeatures = pAnalysis_in->pszFeatures;
  char * cp;
  AnaMorpheme *pMorph = pMorph_io;

  while (pMorph != NULL && pszFeatures != NULL && *pszFeatures != '\0')
	{
	  if ((cp = strchr(pszFeatures, cFeaturesSep)) != NULL)
	{
	  *cp = '\0';
	  pMorph->pszFeatureDescriptors = duplicateString(pszFeatures);
	  pszFeatures = cp + 1;
	}
	  else
	{
	  pMorph->pszFeatureDescriptors = duplicateString(pszFeatures);
	  pszFeatures = pszFeatures + strlen(pszFeatures);
	}
	  pMorph = pMorph->pRightLink;
	}
}

/*************************************************************************
 * NAME
 *    parseMorphCategories
 * DESCRIPTION
 *    Parse a MorphCats string (presumably produced by AMPLE).
 * RETURN VALUE
 *    none
 */
static void parseMorphCategories(WordAnalysis *pAnalysis_in,
				   AnaData *pAnaData_in,
				   AnaMorpheme *pMorph_io)
{
  char cMorphCatsSep = '=';
  char *pszMorphCats = pAnalysis_in->pszCategory;
  char * cp;
  AnaMorpheme *pMorph = pMorph_io;

  if (pszMorphCats != NULL && *pszMorphCats != '\0')
	{
	  pszMorphCats = strchr(pszMorphCats, ' '); /* check for morpheme cats */
	}

  while (pMorph != NULL && pszMorphCats != NULL && *pszMorphCats != '\0')
	{
	  if (pMorph->pszMorphCat != NULL)
	freeMemory(pMorph->pszMorphCat);
	  if ((cp = strchr(pszMorphCats, cMorphCatsSep)) != NULL)
	{
	  *cp = '\0';
	  pMorph->pszMorphCat = duplicateString(pszMorphCats);
	  pszMorphCats = cp + 1;
	}
	  else
	{
	  pMorph->pszMorphCat = duplicateString(pszMorphCats);
	  pszMorphCats = pszMorphCats + strlen(pszMorphCats);
	}
	  pMorph = pMorph->pRightLink;
	}
}

/*************************************************************************
 * NAME
 *    linkAnaMorpheme
 * DESCRIPTION
 *    Link a new AnaMorpheme into an existing list.
 *	pLeft_io;    pointer to the left of where we want to link
 *	pNew_io;     pointer to the new node we want to link in
 * RETURN VALUE
 *    pNew_io
 */
static AnaMorpheme * linkAnaMorpheme(AnaMorpheme *pLeft_io,
					 AnaMorpheme *pNew_io)
{
pNew_io->pLeftLink  = pLeft_io;
if (pLeft_io != NULL)
	{
	pNew_io->pRightLink = pLeft_io->pRightLink;
	if (pLeft_io->pRightLink != NULL)
		pLeft_io->pRightLink->pLeftLink = pNew_io;
	pLeft_io->pRightLink = pNew_io;
	}
else
	pNew_io->pRightLink = NULL;

return( pNew_io );
}

/*************************************************************************
 * NAME
 *    writePCDATA
 * DESCRIPTION
 *    Convert any XML key symbols to their numeric counterpart
 * RETURN VALUE
 *    none
 */
static void writePCDATA(char * pszText_in, FILE *pOutputFP_in)
{
  char *cp = pszText_in;

  while (cp != NULL && *cp != '\0')
	{
	  switch(*cp)
	{
	case '<':
	  fputs("&#60;", pOutputFP_in);
	  break;
	case '>':
	  fputs("&#62;", pOutputFP_in);
	  break;
	case '&':
	  fputs("&#26;", pOutputFP_in);
	  break;
	case ']':
	  fputs("&#93;", pOutputFP_in);
	  break;
	case '"':
	  fputs("&#34;", pOutputFP_in);
	  break;
	default:
	  fputc(*cp, pOutputFP_in);
	}
	  cp++;
	}
}
