/* myallo.h  memory allocator prototypes for myallo.c Alan B 26 Oct 90 */

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
char *mymemdup( char *str, char *end );
char *mystrappend( char *t, char *s );
void *mytalloc( unsigned region );
void mytfree( void *reg_bot );
void myFreeAll(void);
