/* myallo.h  memory allocator prototypes for myallo.c Alan B 26 Oct 90 */


#ifndef _MYALLO_H_INCLUDED_
#define _MYALLO_H_INCLUDED_
#ifdef __cplusplus
extern "C" {
#endif

  /* typedef struct sentrans_data		SenTransData; hab20000726*/

#ifdef MacCADA
/*
 * Avoid name conflicts with AMPLE & STAMP functions & variables.
 * (Some probably could be shared.)
 */
#define myalloc     sentrans_myalloc
#define myrealloc   sentrans_myrealloc
#define myfree      sentrans_myfree
#define mystrdup    sentrans_mystrdup
#define mystrappend sentrans_mystrappend
#define mytalloc    sentrans_mytalloc
#define mytfree     sentrans_mytfree
#define myalloc_errmsg  sentrans_myalloc_errmsg
#endif

void *myalloc( unsigned size );
void *myrealloc( void *ptr, unsigned size );
void myfree( void *s );
char *mystrdup( char *str );
char *mystrappend( char *t, char *s );
void *mytalloc( unsigned region, SenTransData *pSenTransData );
void mytfree( void *reg_bot );


/* jdh may18-99 */
void myFreeAll(void);
void prepareMyAllocGlobals(void);
#ifdef __cplusplus
}
#endif
#endif /*_MYALLO_H_INCLUDED_*/
