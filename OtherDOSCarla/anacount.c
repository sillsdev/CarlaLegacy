/* anacout.c Quick and dirty utility to display ANA counts */

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#define MAXAMBIG 16			/* high level of ambiguity for stats */
static long	aiAmbigCounts[MAXAMBIG+1];
static unsigned long	uiWordCount = 0L;

void outstats()
{
int i;
long ambwds, ambtot;

/*
 *  print the statistics header
 */
printf( "\nANALYSIS STATISTICS: %4ld word%s processed.\n",
	 uiWordCount, (uiWordCount == 1) ? "" : "s" );
/*
 *  print the ambiguity levels
 */
ambwds = ambtot = 0;
printf("   Ambiguity Levels:\n");
for ( i = 0 ; i <= MAXAMBIG ; ++i )
	{
	if (aiAmbigCounts[i] > 0)
	{
	printf( "%25ld word%c with %2d %sanalys%cs.\n",
		aiAmbigCounts[i], (aiAmbigCounts[i]==1) ? ' ' : 's',
		i, (i==MAXAMBIG) ? "or more " : "", (i==1) ? 'i' : 'e' );
	if (i > 1)			    /* If ambiguous */
		{
		ambwds += aiAmbigCounts[i];	 /* Count ambig words */
		ambtot += (i - 1) * aiAmbigCounts[i];    /* Count total ambigs */
		}
	}
	}
if ( uiWordCount - aiAmbigCounts[0] > 0)
	{
	printf( "   Percentage of analyzed words ambiguous: %ld%%\n",
		 ambwds * 100 / ( uiWordCount - aiAmbigCounts[0]) );
	printf( "   Excess ambiguities over analyzed words: %ld%%\n",
		 ambtot * 100 / ( uiWordCount - aiAmbigCounts[0]) );
	}


}

int getNextChar()
{
  int c = getchar();
  if (c != EOF)
	return c;
  outstats();
  exit(0);
}

void main()
{
  int c = 0;
  int i;

  for (i = 0; i < MAXAMBIG; i++)
	aiAmbigCounts[i] = 0L;

  while ((c = getNextChar()))
	{
	  if ( (c == '\\') && (c = getNextChar()) == 'a')
	{
	  uiWordCount++;
	  c = getNextChar();	/* skip space */
	  if ((c = getNextChar()) != '%')
		aiAmbigCounts[1]++;
	  else
		{
		  int count = 0;
		  while (isdigit(c = getNextChar()))
		count = 10 * count + c - '0';
#ifndef hab101
		  if ((count == 0) &&
		  ((c = getNextChar()) == '%'))
		{
		  uiWordCount--; /* skip any final dummy record */
		  continue;
		}
#endif /* hab101 */
		  if (count > 15)
		count = 15;
		  aiAmbigCounts[count]++;
		}
	}
	}
}

/*****************************************************************************
 * EDIT HISTORY
 * 28-Nov-2001  hab - FIx bug of counting final dummy record.
 * [1.0.1]
 *
 * 13-Mar-2000  hab - Initial coding.
 * [1.0.0]
 */
