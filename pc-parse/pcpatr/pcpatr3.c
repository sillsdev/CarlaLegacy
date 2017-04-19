/* PCPATR3.C - functions to support user interface for PC-PATR
 ***************************************************************************
 *
 *	void show_status()
 *	void do_clear()
 *	void do_save_status(char *filename)
 *	void do_save_lexicon(char *filename)
 *
 ***************************************************************************
 * Copyright 1988, 1999 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "patr.h"
#include "pcpatr.h"

#ifdef applec
#pragma segment S_pcpatr3
#endif

/*****************************************************************************
 * NAME
 *    show_status
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Execute a SHOW STATUS command.
 * RETURN VALUE
 *    none
 */
void show_status()
{
char * p;
const StringList * sp;

fprintf(stderr, "Status of PC-PATR:\n");
fprintf(stderr, "    Grammar file: %s\n",
	(pszPCPATRGrammarFile_g != (char *)NULL) ?
					pszPCPATRGrammarFile_g : "(none)" );
if (pPCPATRLexiconFiles_g != NULL)
	{
	fprintf(stderr, "    Lexicon file%s:",
		(pPCPATRLexiconFiles_g->pNext) ? "s" : "");
	for ( sp = pPCPATRLexiconFiles_g ; sp ; sp = sp->pNext )
	fprintf(stderr, " %s", sp->pszString);
	putc('\n', stderr);
	}
else if (pPCPATRAmpleFiles_g != NULL)
	{
	fprintf(stderr, "    (AMPLE) Lexicon file%s:",
		(pPCPATRAmpleFiles_g->pNext)?"s":"");
	for ( sp = pPCPATRAmpleFiles_g ; sp ; sp = sp->pNext )
	fprintf(stderr, " %s", sp->pszString);
	putc('\n', stderr);
	}
else
	fprintf(stderr, "    Lexicon file: (none)\n");

if (sPCPATRKimmoData_g.pszRulesFile != NULL)
	fprintf(stderr, "    Kimmo rules file: %s\n",
		sPCPATRKimmoData_g.pszRulesFile);
if (sPCPATRKimmoData_g.pszLexiconFile != NULL)
	fprintf(stderr, "    Kimmo lexicon file: %s\n",
		sPCPATRKimmoData_g.pszLexiconFile);
if (	(sPCPATRKimmoData_g.sPATR.pGrammar != NULL) &&
	(sPCPATRKimmoData_g.sPATR.pszGrammarFile != NULL) )
	fprintf(stderr, "    Kimmo grammar file: %s\n",
		sPCPATRKimmoData_g.sPATR.pszGrammarFile);

fprintf(stderr, "    Log file:     %s\n",
	(pszCmdLogFile_g != (char *)NULL) ? pszCmdLogFile_g : "(none)" );
putc('\n', stderr);
fprintf(stderr, "    Ambiguity limit is %d\n", sPCPATRData_g.iMaxAmbiguities);
if (sPCPATRData_g.cComment == NUL)
	fprintf(stderr, "    Comment character is (none)\n");
else
	fprintf(stderr, "    Comment character is %c\n", sPCPATRData_g.cComment);
fprintf(stderr,"    Failures display is %s\n",
	sPCPATRData_g.bFailure ? "ON" : "OFF");
if (sPCPATRData_g.iFeatureDisplay & PATR_FEATURE_ON)
	{
	fprintf(stderr, "    Feature display is %s and %s\n",
		(sPCPATRData_g.iFeatureDisplay & PATR_FEATURE_ALL) ? "ALL" : "TOP",
		(sPCPATRData_g.iFeatureDisplay & PATR_FEATURE_FLAT) ?
								  "FLAT" : "FULL");
	}
else
	fprintf(stderr, "    Feature display is OFF\n");

fprintf(stderr, "    Gloss display is %s\n",
	(sPCPATRData_g.bGloss)?"ON":"OFF");
if (sPCPATRData_g.iMaxProcTime != 0)
	fprintf(stderr, "    Parse time limit is %lu seconds\n",
		(unsigned long)sPCPATRData_g.iMaxProcTime);
else
	fprintf(stderr, "    Parse time is unlimited\n");
fprintf(stderr, "    Record marker is   %s\n",
	sPCPATRData_g.pszRecordMarker);
fprintf(stderr, "    Word marker is     %s\n",
	sPCPATRData_g.pszWordMarker);
fprintf(stderr, "    Category marker is %s\n",
	sPCPATRData_g.pszCategoryMarker);
fprintf(stderr, "    Feature marker is  %s\n",
	sPCPATRData_g.pszFeatureMarker);
fprintf(stderr, "    Gloss marker is    %s\n",
	sPCPATRData_g.pszGlossMarker);
fprintf(stderr, "    Timing is %s\n", (bPCPATRTiming_g)?"ON":"OFF");
switch (sPCPATRData_g.eTreeDisplay)
	{
	case PATR_NO_TREE:		p = "OFF";	break;
	case PATR_FLAT_TREE:	p = "FLAT";	break;
	case PATR_FULL_TREE:	p = "FULL";	break;
	case PATR_INDENTED_TREE:	p = "INDENTED";	break;
	case PATR_XML_TREE:		p = "XML";	break;
	default:			p = "ON";	break;
	}
fprintf(stderr, "    Tree display is %s\n", p);
fprintf(stderr, "    Trim-empty-features display is %s\n",
	(sPCPATRData_g.iFeatureDisplay & PATR_FEATURE_TRIM) ? "ON" : "OFF");
fprintf(stderr, "    Unification is %s\n",
	(sPCPATRData_g.bUnification)?"ON":"OFF");
fprintf(stderr, "    Verbose output is %s\n", (bPCPATRVerbose_g)?"ON":"OFF");
fprintf(stderr, "    Warning display is %s\n",
	(bCmdShowWarnings_g) ? "ON" : "OFF");
fprintf(stderr, "    Sentence final punctuation is ");
writeStringList(sPCPATRData_g.pFinalPunc, " ", stderr);
fprintf(stderr, "\n\n");	/* blank line before the prompt */
}

/*****************************************************************************
 * NAME
 *    do_clear
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Execute a CLEAR command.
 * RETURN VALUE
 *    none
 */
void do_clear()
{
/*
 *  handle any embedded PC-Kimmo stuff
 */
freeKimmoRules(&sPCPATRKimmoData_g);		/* remove existing rules */
freeKimmoLexicon(&sPCPATRKimmoData_g);		/* remove existing lexicon */
freePATRGrammar(&sPCPATRKimmoData_g.sPATR);	/* remove existing grammar */
/*
 *  handle any embedded AMPLE stuff
 */
resetAmpleData( &sPCPATRAmpleData_g );
/*
 *  handle the PC-PATR specific stuff
 */
freePATRGrammar(&sPCPATRData_g);	/* remove existing grammar */
freePATRLexicon(&sPCPATRData_g);	/* remove existing lexicon */
if (pszPCPATRGrammarFile_g != (char *)NULL)
	{
	freeMemory(pszPCPATRGrammarFile_g);
	pszPCPATRGrammarFile_g = (char *)NULL;
	}
if (pPCPATRLexiconFiles_g != (StringList *)NULL)
	{
	freeStringList(pPCPATRLexiconFiles_g);
	pPCPATRLexiconFiles_g = (StringList *)NULL;
	}
if (pPCPATRAmpleFiles_g != (StringList *)NULL)
	{
	freeStringList(pPCPATRAmpleFiles_g);
	pPCPATRAmpleFiles_g = (StringList *)NULL;
	}
freePATRInternalMemory(&sPCPATRData_g);
}

/*****************************************************************************
 * NAME
 *    do_save_status
 * ARGUMENTS
 *    filename - pointer to an optional TAKE file name.
 * DESCRIPTION
 *    Execute a SAVE STATUS [<filename>] command.
 * RETURN VALUE
 *    none
 */
void do_save_status(filename)
char *filename;
{
char buffer[80];
FILE *fp;
char *p;
StringList *sp;

sprintf(buffer, "SAVE STATUS [<file>] (default is %s.tak)",
	pszCmdProgramName_g);
if (wantCmdHelp(filename, buffer))
	return;
if (filename == (char *)NULL)
	{
	sprintf(buffer, "%s.tak", pszCmdProgramName_g);
	filename = buffer;		/* default log file name */
	}
fp = fopen(filename,"w");
if (fp == (FILE *)NULL)
	{
	displayNumberedMessage(&sCmdBadOutputFile_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g,
			   pCmdLogFP_g,
			   NULL, 0,
			   filename, "SAVE STATUS");
	return;
	}
if (pszPCPATRGrammarFile_g != (char *)NULL)
	fprintf(fp, "load grammar %s\n", pszPCPATRGrammarFile_g);
if (pPCPATRLexiconFiles_g != (StringList *)NULL)
	{
	fprintf(fp, "load lexicon");
	for ( sp = pPCPATRLexiconFiles_g ; sp ; sp = sp->pNext )
	fprintf(fp, " %s", sp->pszString);
	putc('\n', fp);
	}
if (pPCPATRAmpleFiles_g != (StringList *)NULL)
	{
	fprintf(fp, "load analysis");
	for ( sp = pPCPATRAmpleFiles_g ; sp ; sp = sp->pNext )
	fprintf(fp, " %s", sp->pszString);
	putc('\n', fp);
	}

if (sPCPATRKimmoData_g.pszRulesFile != NULL)
	fprintf(fp, "load kimmo rules %s\n", sPCPATRKimmoData_g.pszRulesFile);
if (sPCPATRKimmoData_g.pszLexiconFile != NULL)
	fprintf(fp, "load kimmo lexicon %s\n",
		sPCPATRKimmoData_g.pszLexiconFile);
if (	(sPCPATRKimmoData_g.sPATR.pGrammar != NULL) &&
	(sPCPATRKimmoData_g.sPATR.pszGrammarFile != NULL) )
	fprintf(fp, "load kimmo grammar %s\n",
		sPCPATRKimmoData_g.sPATR.pszGrammarFile);

if (	(sPCPATRAmpleData_g.pszAnalysisDataFile != NULL) &&
	(sPCPATRAmpleData_g.pszDictionaryCodesFile != NULL) )
	fprintf(fp, "load ample control %s %s %s\n",
		sPCPATRAmpleData_g.pszAnalysisDataFile,
		sPCPATRAmpleData_g.pszDictionaryCodesFile,
		sPCPATRAmpleData_g.pszDictOrthoChangeFile ?
			sPCPATRAmpleData_g.pszDictOrthoChangeFile : "");
if (sPCPATRAmpleData_g.pDictionaryFiles != NULL)
	{
	fprintf(fp, "load ample dictionary ");
	writeStringList(sPCPATRAmpleData_g.pDictionaryFiles, " ", fp);
	fprintf(fp, "\n");
	}
if (sPCPATRAmpleData_g.sTextCtl.pszTextControlFile != NULL)
	fprintf(fp, "load ample text-control %s\n",
		sPCPATRAmpleData_g.sTextCtl.pszTextControlFile);

if (pszCmdLogFile_g != (char *)NULL)
	fprintf(fp, "log %s\n", pszCmdLogFile_g);
fprintf(fp, "set ambiguities %d\n", sPCPATRData_g.iMaxAmbiguities);
fprintf(fp, "set comment\n");
if (sPCPATRData_g.cComment != NUL)
	fprintf(fp, "set comment %c\n", sPCPATRData_g.cComment);
fprintf(fp, "set failures %s\n", (sPCPATRData_g.bFailure) ? "ON":"OFF");
p = NULL;
fprintf(fp, "set features %s\n",
	(sPCPATRData_g.iFeatureDisplay & PATR_FEATURE_ALL) ?
							"ALL" : "TOP");
fprintf(fp, "set features %s\n",
	(sPCPATRData_g.iFeatureDisplay & PATR_FEATURE_FLAT) ? "FLAT" : "FULL");
fprintf(fp, "set features %s\n",
	(sPCPATRData_g.iFeatureDisplay & PATR_FEATURE_ON) ? "ON" : "OFF");
fprintf(fp, "set gloss %s\n", (sPCPATRData_g.bGloss) ? "ON":"OFF");
fprintf(fp, "set limit %lu\n", (unsigned long)sPCPATRData_g.iMaxProcTime);
fprintf(fp, "set marker record %s\n",   sPCPATRData_g.pszRecordMarker);
fprintf(fp, "set marker word %s\n",     sPCPATRData_g.pszWordMarker);
fprintf(fp, "set marker category %s\n", sPCPATRData_g.pszCategoryMarker);
fprintf(fp, "set marker feature %s\n",  sPCPATRData_g.pszFeatureMarker);
fprintf(fp, "set marker gloss %s\n",    sPCPATRData_g.pszGlossMarker);
fprintf(fp, "set timing %s\n", (bPCPATRTiming_g)?"ON":"OFF");
p = NULL;
switch (sPCPATRData_g.eTreeDisplay)
	{
	case PATR_NO_TREE:		p = "OFF";	break;
	case PATR_FLAT_TREE:	p = "FLAT";	break;
	case PATR_FULL_TREE:	p = "FULL";	break;
	case PATR_INDENTED_TREE:	p = "INDENTED";	break;
	case PATR_XML_TREE:		p = "XML";	break;
	default:			p = "ON";	break;
	}
if (p != NULL)
	fprintf(fp, "set tree %s\n", p);
fprintf(fp, "set trim-empty-features %s\n",
	(sPCPATRData_g.iFeatureDisplay & PATR_FEATURE_TRIM) ? "ON" : "OFF");
fprintf(fp, "set unification %s\n",
	(sPCPATRData_g.bUnification) ? "ON" : "OFF");
fprintf(fp, "set verbose %s\n", (bPCPATRVerbose_g) ? "ON" : "OFF");
fprintf(fp, "set warning %s\n", (bCmdShowWarnings_g) ? "ON" : "OFF");
fclose(fp);
}

/*****************************************************************************
 * NAME
 *    do_save_lexicon
 * ARGUMENTS
 *    filename - pointer to a lexicon file name.
 * DESCRIPTION
 *    Execute a SAVE LEXICON <filename> command.
 * RETURN VALUE
 *    none
 */
void do_save_lexicon(filename)
char *filename;
{
char buffer[80];
FILE *fp;

sprintf(buffer, "SAVE LEXICON [<file>] (default is %s.lex)",
	pszCmdProgramName_g);
if (wantCmdHelp(filename, buffer))
	return;
if (sPCPATRData_g.pLexicon == NULL)
	return;
if (filename == (char *)NULL)
	{
	sprintf(buffer, "%s.lex", pszCmdProgramName_g);
	filename = buffer;		/* default lexicon file name */
	}
fp = fopen(filename,"w");
if (fp == (FILE *)NULL)
	{
	displayNumberedMessage(&sCmdBadOutputFile_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g,
			   pCmdLogFP_g,
			   NULL, 0,
			   filename, "SAVE LEXICON");
	return;
	}
writePATRLexicon(fp, &sPCPATRData_g);
fclose(fp);
}
