typedef union  {
	int ival;
	char *cval;
	AmpleTestNode *tstval;
	} YYSTYPE;
#define	LX_IDENTIFIER	258
#define	LX_ALLOMORPH	259
#define	LX_CURRENT	260
#define	LX_FINAL	261
#define	LX_FA_LEFT	262
#define	LX_FA_RIGHT	263
#define	LX_FS_LEFT	264
#define	LX_FS_RIGHT	265
#define	LX_FLEFT	266
#define	LX_FRIGHT	267
#define	LX_IF	268
#define	LX_IFF	269
#define	LX_THEN	270
#define	LX_INITIAL	271
#define	LX_MEMBER	272
#define	LX_MORPHNAME	273
#define	LX_PFINAL	274
#define	LX_PINITIAL	275
#define	LX_PROPERTY	276
#define	LX_PUNCTUATION	277
#define	LX_SURFACE	278
#define	LX_TYPE	279
#define	LX_XOR	280
#define	LX_AND	281
#define	LX_EQ	282
#define	LX_GE	283
#define	LX_GT	284
#define	LX_INFX	285
#define	LX_IS	286
#define	LX_LE	287
#define	LX_LEFT	288
#define	LX_LT	289
#define	LX_MATCHES	290
#define	LX_NE	291
#define	LX_NOT	292
#define	LX_OR	293
#define	LX_PRFX	294
#define	LX_RIGHT	295
#define	LX_ROOT	296
#define	LX_SUFX	297
#define	LX_TOCATEGORY	298
#define	LX_FROMCATEGORY	299
#define	LX_ORDRCLASS	300
#define	LX_NEXT	301
#define	LX_LAST	302
#define	LX_WORD	303
#define	LX_CAPITALIZED	304
#define	LX_ORDRCLASSMAX	305


extern YYSTYPE ampyylval;
