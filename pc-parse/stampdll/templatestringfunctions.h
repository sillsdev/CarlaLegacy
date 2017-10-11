/* templatestringfunctions.h - definition of string input functions for buffer input.
 *****************************************************************************************
 *
 * Template String Function declarations
 *
 *****************************************************************************************
 * Copyright 2013 by SIL International
 * All rights reserved.
 */
#ifndef _TEMPLATESTRINGFUNCTIONS_H_INCLUDED
#define _TEMPLATESTRINGFUNCTIONS_H_INCLUDED
#include "stampdll.h"


/*
 * FieldWorks strings
 */
static char szExceptionBufSizeBegin_m[] = "  <Exception code='ReachedMaxBufferSize' totalAnalyses='";
static char szExceptionAnalysesSizeBegin_m[] = "  <Exception code='ReachedMaxAnalyses' totalAnalyses='";
static char szExceptionEnd_m[]   = "'/>\r\n";
static char szWordFormClose_m[]  = " </Wordform>\r\n";

/***************************************************************************
 *  local function prototypes
 */

void writeStringListToABuffer(StringList *pList_in, char *pszSet_in,
				int iAnalysesCount_in, int *iRoom, char *pszAResult);

WordTemplate *readTemplateFromAnalysisString(const char *pszInputString_in,
											 const TextControl *pTextCtl_in, StampSetup *pSetup_io);
const TextControl *pTextCtl_in;
char *readLineFromString(const char *position, int cCommentChar_in, StampSetup *pSetup_io);
const char *addFWParseToBuffer(StampSetup *pSetup_in, const StampWord *pWord_in, TextControl *pTextCtl_in,
	 char *pszBuffer_out, size_t uiBufferSize_in, int iAnalysesCount_in);

extern void fwConCatWrap(char *pszString_in, int iAnalysesCount_in, int *iRoom_io, char *pszAResult_io);

int countAmbiguities(const WordTemplate *pTemplate_in);
static char *form_analFW(StampAnalysis *anal, StampData *pStamp_in);
#define MAXLINELEN 256
static char getline_buffer[MAXLINELEN];

#endif /* _TEMPLATESTRINGFUNCTIONS_H_INCLUDED */