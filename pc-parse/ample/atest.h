typedef union  {
	int ival;
	char *cval;
	AmpleTestNode *tstval;
	} YYSTYPE;
#define	LX_IDENTIFIER	257
#define	LX_ALLOMORPH	258
#define	LX_CURRENT	259
#define	LX_FINAL	260
#define	LX_FA_LEFT	261
#define	LX_FA_RIGHT	262
#define	LX_FS_LEFT	263
#define	LX_FS_RIGHT	264
#define	LX_FLEFT	265
#define	LX_FRIGHT	266
#define	LX_IF	267
#define	LX_IFF	268
#define	LX_THEN	269
#define	LX_INITIAL	270
#define	LX_MEMBER	271
#define	LX_MORPHNAME	272
#define	LX_PFINAL	273
#define	LX_PINITIAL	274
#define	LX_PROPERTY	275
#define	LX_PUNCTUATION	276
#define	LX_SURFACE	277
#define	LX_TYPE	278
#define	LX_XOR	279
#define	LX_AND	280
#define	LX_EQ	281
#define	LX_GE	282
#define	LX_GT	283
#define	LX_INFX	284
#define	LX_INTERFX	285
#define	LX_INTERFXPFX	286
#define	LX_INTERFXSFX	287
#define	LX_INTERFXIFX	288
#define	LX_IS	289
#define	LX_LE	290
#define	LX_LEFT	291
#define	LX_LT	292
#define	LX_MATCHES	293
#define	LX_NE	294
#define	LX_NOT	295
#define	LX_OR	296
#define	LX_PRFX	297
#define	LX_RIGHT	298
#define	LX_ROOT	299
#define	LX_SUFX	300
#define	LX_TOCATEGORY	301
#define	LX_FROMCATEGORY	302
#define	LX_ORDRCLASS	303
#define	LX_NEXT	304
#define	LX_LAST	305
#define	LX_WORD	306
#define	LX_CAPITALIZED	307
#define	LX_ORDRCLASSMAX	308


extern YYSTYPE ampyylval;
