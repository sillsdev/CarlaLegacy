/* CONVLEX.C - program to convert PC-KIMMO version 1 lexicon to version 2
 ***************************************************************************
 * Copyright 1994, 2002 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#include <stdlib.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#define strrchr rindex
#endif
extern char * strcpy  P((char * dest, const char * src));
extern char * strncpy P((char * dest, const char * src, size_t n));
extern char * strcat  P((char * dest, const char * src));
extern char * strncat P((char * dest, const char * src, size_t n));
extern int    strcmp  P((const char * s1, const char * s2));
extern int    strncmp P((const char * s1, const char * s2, size_t n));
extern char * strchr  P((const char * s, int c));
extern char * strrchr P((const char * s, int c));
extern char * strpbrk P((const char * s, const char * accept));
extern char * strtok  P((char * s, const char * delim));
extern size_t strlen  P((const char * s));
extern void   exit    P((int status));
#endif
#ifndef EXIT_FAILURE
#define	EXIT_FAILURE	1	/* Failing exit status.  */
#define	EXIT_SUCCESS	0	/* Successful exit status.  */
#endif

extern int	getopt P((int argc, char * const argv[], const char *opts));
extern char *	optarg;
extern int	optind;
extern int	opterr;
extern int	optopt;

#ifdef __STDC__
void read_file_name(char *namebuffer, char *prompt, char *mode);
void fix_include_name(char *filename);
void print_fields(FILE *ofp);
void convert_lexicon(void);
void exit_convlex(int iExitStatus_in);
#endif

#ifndef isascii
#define isascii(c) (!(c & ~0177))
#endif

#define NUL '\0'

char whitespace[7] = " \t\n\r\f";
char cCommentMarker_g = ';';
char buffer[BUFSIZ];
char answerbuf[10];
#define MAXFILENAME 256
char lexname[MAXFILENAME+1];
char infile[MAXFILENAME+1];
char incfile[MAXFILENAME+1];
char outfile[MAXFILENAME+1];
char sfmfile[MAXFILENAME+1];
char sfm2file[MAXFILENAME+1];
FILE * infp;
FILE * incfp;
FILE * outfp;
FILE * sfmfp;
FILE * sfm2fp;

/*****************************************************************************
 * NAME
 *    exit_convlex
 * DESCRIPTION
 *    exit the program with the given status, after first displaying any
 *    needed message
 * RETURN VALUE
 *    none
 */
void exit_convlex(iExitStatus_in)
int	iExitStatus_in;
{
#ifdef MACINTOSH
fprintf(stderr, "\nUse the Quit command on the File menu (Command-Q)\n");
#endif
#ifdef QUICKWIN
fprintf(stderr, "\nUse the Exit command on the File menu (Control-C)\n");
#endif
exit(iExitStatus_in);
}

/*****************************************************************************
 * NAME
 *    read_file_name
 * ARGUMENTS
 *    namebuffer - address of the buffer for storing the name
 *    prompt     - prompt string to display on the terminal
 *    mode       - mode of opening: "r" or "w"
 * DESCRIPTION
 *    Read the name of a file from the keyboard.  Check for errors.
 * RETURN VALUE
 *    none
 */
void read_file_name(namebuffer, prompt, mode)
char * namebuffer;
char * prompt;
char * mode;
{
char * p;
FILE * fp;

for (;;)
	{
	do	{
	fputs(prompt, stderr);
	p = fgets(namebuffer, MAXFILENAME+1, stdin);
	if (p == NULL)
		exit_convlex(1);
	} while (namebuffer[0] == '\n');
	p = strchr(namebuffer, '\n');
	if (p != NULL)
	*p = NUL;
	fp = fopen(namebuffer, "r");
	if (fp == NULL)
	{
	p = strchr(namebuffer, '.');
	if (p == NULL)
		{
		strcat(namebuffer, ".lex");
		fp = fopen(namebuffer, "r");
		}
	}
	if (fp != NULL)
	fclose(fp);
	if (*mode == 'r')
	{
	if (fp != NULL)
		return;
	fprintf(stderr, "Cannot open \"%s\"\n", namebuffer);
	}
	else
	{
	if (infile[0] && sfm2file[0] && (strcmp(infile, sfm2file) == 0))
		{
		fprintf(stderr,
			"The input and sfm output files must be different!\n");
		continue;
		}
	else if (sfm2file[0] && outfile[0] && (strcmp(sfm2file, outfile) == 0))
		{
		fprintf(stderr,
			   "The output and sfm output files must be different!\n");
		continue;
		}
	else if (sfm2file[0] && sfmfile[0] && (strcmp(sfm2file, sfmfile) == 0))
		{
		fprintf(stderr,
			"The different sfm output files must be different!\n");
		continue;
		}
	else if (sfm2file[0] && incfile[0] && (strcmp(sfm2file, incfile) == 0))
		{
		fprintf(stderr,
			  "The INCLUDE and sfm output files must be different!\n");
		continue;
		}
	if (fp == NULL)
		return;
	fprintf(stderr,
		"%s already exists -- do you want to replace it? [no] ",
		namebuffer);
	p = fgets(answerbuf, sizeof(answerbuf), stdin);
	if (p == NULL)
		exit_convlex(EXIT_FAILURE);
	if ((*p == 'y') || (*p == 'Y'))
		return;
	}
	}
}

/*****************************************************************************
 * NAME
 *    fix_include_name
 * ARGUMENTS
 *    filename - address of the include filename buffer
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
void fix_include_name(filename)
char *filename;
{
char *p;
FILE *fp;
#ifdef DIRSEPCHAR
char namebuf[MAXFILENAME+1];
char dirbuf[MAXFILENAME+1];
unsigned dirlen;
unsigned k;

p = strrchr(filename, DIRSEPCHAR);
if (p != (char *)NULL)
	++p;
else
#endif
	p = filename;
if (strchr(p,'.') == (char *)NULL)
	strncat(filename, ".lex", MAXFILENAME - strlen(filename));

fp = fopen((char *)filename, "r");
fclose(fp);
#ifdef DIRSEPCHAR
if (    (fp == (FILE *)NULL) &&
	((p = strrchr(infile, DIRSEPCHAR)) != NULL) &&
#ifdef MACINTOSH
	((filename[0]==DIRSEPCHAR) || (strchr(filename,DIRSEPCHAR) == NULL)) )
#else
#ifdef MSDOS
	(!( (filename[0] == DIRSEPCHAR) ||
		(	isascii(filename[0]) &&
		isalpha(filename[0]) &&
		(filename[1] == ':') &&
		(filename[2] == DIRSEPCHAR) ) ) ) )
#else
	(filename[0] != DIRSEPCHAR) )
#endif
#endif
	{
	*p = NUL;
	strncpy(dirbuf, infile, MAXFILENAME);
	dirbuf[MAXFILENAME] = NUL;
	*p = DIRSEPCHAR;
	dirlen = (unsigned)strlen(dirbuf);
#ifdef MACINTOSH
	if (filename[0] == DIRSEPCHAR)
	{
	strncpy(namebuf, dirbuf, MAXFILENAME);
	namebuf[MAXFILENAME] = NUL;
	strncat(namebuf, filename, MAXFILENAME - strlen(namebuf));
	}
	else
#else
	{
	strncpy(namebuf, dirbuf, MAXFILENAME);
	namebuf[MAXFILENAME] = NUL;
	k = strlen(namebuf);
	if (k < MAXFILENAME)
		{
		namebuf[k++] = DIRSEPCHAR;
		namebuf[k] = NUL;
		}
	strncat(namebuf, filename, MAXFILENAME - strlen(namebuf));
	}
#endif
	strcpy(filename, namebuf);
	}
#endif
}

/*****************************************************************************
 * NAME
 *    print_fields
 * ARGUMENTS
 *    ofp - output FILE pointer
 * DESCRIPTION
 *    print the FEATURES and FIELDCODE lines to the new main lexicon file
 * RETURN VALUE
 *    none
 */
void print_fields(ofp)
FILE *ofp;
{
putc('\n', ofp);
fprintf(ofp, "FEATURES \n");
putc('\n', ofp);
fprintf(ofp, "FIELDCODE lf  U\n");
fprintf(ofp, "FIELDCODE lx  L\n");
fprintf(ofp, "FIELDCODE alt A\n");
fprintf(ofp, "FIELDCODE fea F\n");
fprintf(ofp, "FIELDCODE gl  G\n");
putc('\n', ofp);
}

/****************************************************************************
 * NAME
 *    convert_lexicon
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Convert an old lexicon file to the new style.
 * RETURN VALUE
 *    none
 */
void convert_lexicon()
{
FILE *ofp, *ifp;
char *filename, *p;
int line_num, save_line_num;
int no_lex_yet;
char promptbuf[MAXFILENAME+80];
char *morph, *alt, *gloss, *comment;
char delim;
/*
 *  open the basic input and output lexicon files
 */
if ((infp = fopen(infile, "r")) == (FILE *)NULL)
	{
	fprintf(stderr, "Cannot open \"%s\"\n", infile);
	exit_convlex(EXIT_FAILURE);
	}
if ((outfp = fopen(outfile, "w")) == (FILE *)NULL)
	{
	fprintf(stderr, "Cannot create \"%s\"\n", outfile);
	exit_convlex(EXIT_FAILURE);
	}
/*
 *  initialize the variables
 */
no_lex_yet = 1;
sfmfp = NULL;
strcpy(lexname, "?");
line_num = save_line_num = 0;
filename = infile;
ifp = infp;
ofp = outfp;
/*
 *  read the input file and write the corresponding output file
 */
for (;;)
	{
	if (fgets(buffer, BUFSIZ, ifp) == NULL)
	strcpy(buffer, "END\n");
	++line_num;
	comment = strchr(buffer, cCommentMarker_g);
	if (    (strncmp(buffer, "ALTERNATION", 11) == 0) &&
		(isascii(buffer[11]) && isspace(buffer[11])) )
	fputs(buffer, ofp);
	else if ((strncmp(buffer, "END", 3) == 0) &&
		 (	(isascii(buffer[3]) && isspace(buffer[3])) ||
		(buffer[3] == NUL) ) )
	{
	if (ifp == incfp)
		{
		fclose(ifp);
		ifp = infp;
		line_num = save_line_num;
		filename = infile;
		if (ofp != outfp)
		{
		fclose(ofp);
		ofp = outfp;
		}
		}
	else
		{
		fputs(buffer, outfp);
		break;
		}
	}
	else if ((strncmp(buffer, "LEXICON", 7) == 0) &&
		 (isascii(buffer[7]) && isspace(buffer[7])) )
	{
	if (no_lex_yet)
		{
		no_lex_yet = 0;
		print_fields(ofp);
		}
	p = strtok(buffer, whitespace);
	p = strtok(NULL, whitespace);
	if (p == NULL)
		{
		fprintf(stderr, "ERROR in %s: line %u\n", filename, line_num);
		fprintf(stderr, "    Missing LEXICON name\n");
		p = "Unknown";
		}
	strncpy(lexname, p, MAXFILENAME);
	lexname[MAXFILENAME] = NUL;
	/*
	 *  if necessary, get the name of the primary sfm file
	 */
	if (ofp == outfp)
		{
		if (ifp == infp)
		{
		if (sfmfp == NULL)
			{
			read_file_name(sfmfile, "Primary sfm lexicon file: ", "w");
			sfmfp = fopen(sfmfile, "w");
			if (sfmfp == NULL)
			{
			fprintf(stderr, "Cannot create \"%s\"\n", sfmfile);
			exit_convlex(EXIT_FAILURE);
			}
			fprintf(outfp, "INCLUDE %s\n", sfmfile);
			}
		ofp = sfmfp;
		}
		else
		{
		sprintf(promptbuf, "New sfm include file to replace %s: ",
			incfile);
		read_file_name(sfm2file, promptbuf, "w");
		sfm2fp = fopen(sfm2file, "w");
		if (sfm2fp == NULL)
			{
			fprintf(stderr, "Cannot create \"%s\"\n", sfm2file);
			fclose(incfp);
			continue;
			}
		fprintf(outfp, "INCLUDE %s\n", sfm2file);
		ofp = sfm2fp;
		}
		}
	if (comment != NULL)
		fprintf(ofp, "%c%s", cCommentMarker_g, comment+1);
	}
	else if ((strncmp(buffer, "INCLUDE", 7) == 0) &&
		 (isascii(buffer[7]) && isspace(buffer[7])) )
	{
	if (ifp == incfp)
		{
		fprintf(stderr, "ERROR in %s: line %u\n", filename, line_num);
		fprintf(stderr, "    Cannot nest lexicon INCLUDE files\n");
		continue;
		}
	p = strtok(buffer, whitespace);
	p = strtok(NULL, whitespace);
	if (p == NULL)
		{
		fprintf(stderr, "ERROR in %s: line %u\n", filename, line_num);
		fprintf(stderr, "    Missing INCLUDE filename\n");
		continue;
		}
	strncpy(incfile, p, MAXFILENAME);
	incfile[MAXFILENAME] = NUL;
	p = strchr(incfile, '\n');
	if (p != NULL)
		*p = NUL;
	fix_include_name(incfile);
	incfp = fopen(incfile, "r");
	if (incfp == NULL)
		{
		fprintf(stderr, "Cannot open INCLUDE file \"%s\"\n", incfile);
		continue;
		}
	ifp = incfp;
	save_line_num = line_num;
	line_num = 0;
	if (comment != NULL)
		fprintf(ofp, "%c%s", cCommentMarker_g, comment+1);
	/*
	 *  if necessary, get the name of the new include file
	 */
	if (!no_lex_yet)
		{
		sprintf(promptbuf,"New sfm include file to replace %s: ",incfile);
		read_file_name(sfm2file, promptbuf, "w");
		sfm2fp = fopen(sfm2file, "w");
		if (sfm2fp == NULL)
		{
		fprintf(stderr, "Cannot create \"%s\"\n", sfm2file);
		fclose(incfp);
		continue;
		}
		fprintf(outfp, "INCLUDE %s\n", sfm2file);
		ofp = sfm2fp;
		}
	}
	else if (no_lex_yet)
	fputs(buffer, ofp);
	else
	{
	morph = buffer;
	while (*morph && isascii(*morph) && isspace(*morph))
		++morph;
	if (*morph == NUL)
		continue;		/* ignore blank lines */
	if (*morph == cCommentMarker_g)
		{
		fputs(buffer, ofp);
		continue;
		}
	alt = strpbrk(morph, whitespace);
	if (alt == NULL)
		{
no_alt:	    fprintf(stderr,
			"Missing alternation and gloss for the lexicon entry:\n%s",
			buffer);
		continue;
		}
	*alt++ = NUL;
	while (*alt && isascii(*alt) && isspace(*alt))
		++alt;
	if (*alt == NUL)
		goto no_alt;
	gloss = strpbrk(alt, whitespace);
	if (gloss == NULL)
		{
no_gloss:   fprintf(stderr,
			"Missing gloss for the lexicon entry:\n%s",
			buffer);
		continue;
		}
	*gloss++ = NUL;
	while (*gloss && isascii(*gloss) && isspace(*gloss))
		++gloss;
	if (*gloss == NUL)
		goto no_gloss;
	delim = *gloss++;
	p = strchr(gloss, delim);
	if (p == NULL)
		{
		fprintf(stderr,
		 "Missing delimiter %c (0%o) in gloss %s for the lexicon entry:\n",
			delim, delim, gloss);
		comment = NULL;
		}
	else
		{
		*p++ = NUL;
		p = strchr(p, cCommentMarker_g);
		comment = p;
		}
	fprintf(ofp, "\\lf %s\n", morph);
	fprintf(ofp, "\\lx %s\n", lexname);
	fprintf(ofp, "\\alt %s\n", alt);
	fprintf(ofp, "\\fea\n");
	fprintf(ofp, "\\gl %s\n", gloss);
	if (comment != (char *)NULL)
		fprintf(ofp, "%s", comment);
	putc('\n', ofp);
	}
	}
fclose(infp);
fclose(outfp);
if (sfmfp)
	fclose(sfmfp);
}

/*****************************************************************************
 * NAME
 *    main
 * ARGUMENTS
 *    argc - number of command line arguments
 *    argv - array of command line arguments
 * DESCRIPTION
 *    program to convert lexicons from version 1 PC-KIMMO to version 2
 * RETURN VALUE
 *    none
 */
int main(argc, argv)
int argc;
char **argv;
{
fprintf(stderr,
	"CONVLEX: convert lexicon from PC-KIMMO version 1 to version 2\n\n");
/*
 *  get the comment character
 */
fputs("Comment character: [;] ", stderr);
if (fgets(answerbuf, sizeof(answerbuf), stdin) == NULL)
	exit_convlex(EXIT_FAILURE);
if (!(isascii(answerbuf[0]) && isspace(answerbuf[0])))
	cCommentMarker_g = answerbuf[0];
/*
 *  get the name of the input file
 */
read_file_name(infile, "Input lexicon file: ", "r");
/*
 *  get the name of the basic output file
 */
read_file_name(outfile, "Output lexicon file: ", "w");
/*
 *  convert the file
 */
convert_lexicon();

exit_convlex(EXIT_SUCCESS);

return EXIT_SUCCESS;		/* (not reached) */
}
