typedef union  {
	int                  ival;
	char                *cval;
	struct action       *acval;
	struct domain_id    *dival;
	struct domain_list  *dlval;
	struct cond_node    *cnval;
	struct cycle        *cyval;
	struct tone_id      *tival;
	struct tone_pattern *tpval;
	struct tone_rule    *trval;
	} YYSTYPE;
#define	LX_A	258
#define	LX_AND	259
#define	LX_APPLIES	260
#define	LX_ASSOCIATE	261
#define	LX_AT	262
#define	LX_BIMORAIC	263
#define	LX_BOUNDARY	264
#define	LX_CATEGORY	265
#define	LX_CODA	266
#define	LX_CONDITION	267
#define	LX_COPY	268
#define	LX_CURRENT	269
#define	LX_CYCLE	270
#define	LX_CYCLICALLY	271
#define	LX_DEFAULT	272
#define	LX_DELETE	273
#define	LX_DELINK	274
#define	LX_DELINKED	275
#define	LX_DIRECTION	276
#define	LX_DISYLLABIC	277
#define	LX_DOMAIN	278
#define	LX_DOMAINS	279
#define	LX_ECONDITION	280
#define	LX_EDGE	281
#define	LX_EDGE_IN	282
#define	LX_EXTRAMETRICAL	283
#define	LX_FEATURE_ADDING	284
#define	LX_FEATURE_CHANGING	285
#define	LX_FEATURE_FILLING	286
#define	LX_FILL_IN	287
#define	LX_FINAL	288
#define	LX_FLOATING	289
#define	LX_HAS	290
#define	LX_IDENTIFIER	291
#define	LX_IF	292
#define	LX_IN	293
#define	LX_INFIX	294
#define	LX_INITIAL	295
#define	LX_INSERT	296
#define	LX_IS	297
#define	LX_ITERATION	298
#define	LX_ITERATIVELY	299
#define	LX_LEFT	300
#define	LX_LEFT_FLOATING	301
#define	LX_LEFTTWO	302
#define	LX_LEFTWARD	303
#define	LX_LINK	304
#define	LX_LINKED	305
#define	LX_LO_AND	306
#define	LX_LO_IFF	307
#define	LX_LO_NOT	308
#define	LX_LO_OR	309
#define	LX_LO_XOR	310
#define	LX_MEMBER	311
#define	LX_MELODY	312
#define	LX_MODE	313
#define	LX_MONOMORAIC	314
#define	LX_MONOSYLLABIC	315
#define	LX_MORPHEME	316
#define	LX_MORPHNAME	317
#define	LX_NONE	318
#define	LX_NONITERATIVELY	319
#define	LX_OCP	320
#define	LX_OCP_BLOCKAGE	321
#define	LX_OCP_IGNORED	322
#define	LX_OCP_MERGER	323
#define	LX_OF	324
#define	LX_ONE_TO_ONE	325
#define	LX_ONSET	326
#define	LX_OPTIONAL	327
#define	LX_PATTERN	328
#define	LX_PFINAL	329
#define	LX_PINITIAL	330
#define	LX_POLYSYLLABIC	331
#define	LX_PREFIX	332
#define	LX_PROPERTY	333
#define	LX_QUADRISYLLABIC	334
#define	LX_RIGHT	335
#define	LX_RIGHT_FLOATING	336
#define	LX_RIGHTTWO	337
#define	LX_RIGHTWARD	338
#define	LX_ROOT	339
#define	LX_SEGMENT	340
#define	LX_SET	341
#define	LX_SPREAD	342
#define	LX_SUFFIX	343
#define	LX_SYLLABLE	344
#define	LX_TBU	345
#define	LX_TBUS	346
#define	LX_THEN	347
#define	LX_TO	348
#define	LX_TONE	349
#define	LX_TONES	350
#define	LX_TRISYLLABIC	351
#define	LX_TYPE	352
#define	LX_UNDER	353
#define	LX_USING	354
#define	LX_WITH	355
#define	LX_WITHIN	356
#define	LX_WORD	357


extern YYSTYPE yylval;