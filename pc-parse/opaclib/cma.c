/* CMA.C - check memory allocations written by modified MALLOC.C */
/* this program is a filter: <stdin >stdout */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MYALLOC 0xFFFFFFFFL
#define MYFREE  0xFFFFFFFEL
struct allocated
	{
	unsigned long line;
	unsigned long type;
	unsigned long size;
	struct allocated *link;
	};
struct treenode
	{
	unsigned long key;
	struct treenode *llink;
	struct treenode *rlink;
	short b;
	struct allocated *alloc;
	};
struct treenode head = { 0L, NULL, NULL, 0, NULL };

#define LINK(a,p) ((a == -1) ? p->llink : p->rlink)

/*****************************************************************************
 * NAME
 *    find_node
 * ARGUMENTS
 *    key - unsigned long integer to find
 * DESCRIPTION
 *    find the key in the balanced tree, adding it if necessary
 *    Algorithm A from Knuth, III, pp. 455-457
 * RETURN VALUE
 *    pointer to the node containing the key
 */
struct treenode *find_node(unsigned long key)
{
struct treenode *p, *q, *r, *s, *t;
int alpha;

/*a1:*/				/* Initialize. */
t = &head;
s = p = head.rlink;
if (p == NULL)
	{
	q = malloc(sizeof(struct treenode));
	if (q == NULL)
	{
no_memory:
	fprintf(stderr, "Out of memory!\n");
	return(NULL);
	}
	s = head.rlink = q;
	head.key++;
	}

for ( ; p != NULL ; p = q )
	{
	/*a2:*/			/* Compare. */
	if (p->key == key)
	return( p );
	if (key < p->key)
	{
	/*a3:*/			/* Move left. */
	q = p->llink;
	if (q == NULL)
		{
		q = malloc(sizeof(struct treenode));
		if (q == NULL)
		goto no_memory;
		p->llink = q;
		break;
		}
	}
	else
	{
	/*a4:*/			/* Move right. */
	q = p->rlink;
	if (q == NULL)
		{
		q = malloc(sizeof(struct treenode));
		if (q == NULL)
		goto no_memory;
		p->rlink = q;
		break;
		}
	}
	if (q->b != 0)
	{
	t = p;
	s = q;
	}
	}

/*a5:*/				/* Insert. */
q->key = key;
q->llink = NULL;
q->rlink = NULL;
q->b = 0;
q->alloc = NULL;

/*a6:*/				/* Adjust balance factors. */
if (key < s->key)
	r = p = s->llink;
else
	r = p = s->rlink;
while (p != q)
	{
	if (p == NULL)
	return( q );
	if (key < p->key)
	{
	p->b = -1;
	p = p->llink;
	}
	else if (key > p->key)
	{
	p->b = 1;
	p = p->rlink;
	}
	else
	break;	/* probably unneeded */
	}

/*a7:*/				/* Balancing act. */
if (key < s->key)
	alpha = -1;
else
	alpha = 1;
if (s->b == 0)
	{
	s->b = alpha;
	head.key++;
	return( q );
	}
if (s->b == -alpha)
	{
	s->b = 0;
	return( q );
	}
if (s->b == alpha)
	{
	if (r->b == alpha)
	{
	/*a8:*/			/* Single rotation. */
	p = r;
	LINK(alpha,s) = LINK(-alpha,r);
	LINK(-alpha,r) = s;
	s->b = r->b = 0;
	}
	else
	{
	/*a9:*/			/* Double rotation. */
	p = LINK(-alpha,r);
	LINK(-alpha,r) = LINK(alpha,p);
	LINK(alpha,p) = r;
	LINK(alpha,s) = LINK(-alpha,p);
	LINK(-alpha,p) = s;
	if (p->b == alpha)
		{
		s->b = -alpha;
		r->b = 0;
		}
	else if (p->b == -alpha)
		{
		s->b = 0;
		r->b = alpha;
		}
	else
		{
		s->b = 0;
		r->b = 0;
		}
	p->b = 0;
	}
	}

/*a10:*/			/* Finishing touch. */
if (s == t->rlink)
	t->rlink = p;
else
	t->llink = p;
return( q );
}

/*****************************************************************************
 * NAME
 *    print_tree
 * ARGUMENTS
 *    t - pointer to a tree node
 * DESCRIPTION
 *    Print the data stored in a balanced tree.
 * RETURN VALUE
 *    none
 */
void print_tree(struct treenode *t)
{
struct allocated *ap;

if (t == NULL)
	return;

for ( ap = t->alloc ; ap ; ap = ap->link )
	{
	switch (ap->type)
	{
	case MYALLOC:
		printf("%6lu. malloc: %lu %lu\n", ap->line, ap->size, t->key);
		break;
	case MYFREE:
		printf("%6lu. mfree: %lu\n", ap->line, t->key);
		break;
	}
	}
print_tree(t->llink);
print_tree(t->rlink);
}

#ifdef DEBUG
void dump_tree(struct treenode *t, int depth)
{
struct allocated *ap;

if (t == NULL)
	{
	printf("%4d / NULL\n", depth);
	return;
	}
printf("%4d / key = 0x%lx, b = %d\n", depth, t->key, t->b);
printf("left:  ");
dump_tree(t->llink, depth+1);
printf("right: ");
dump_tree(t->rlink, depth+1);
}
#endif

/*****************************************************************************
 * NAME
 *    main
 * ARGUMENTS
 *    argc -
 *    argv -
 * DESCRIPTION
 *
 * RETURN VALUE
 *
 */
int main(int argc, char **argv)
{
char buffer[128];
char *p;
unsigned long value, size, type, prior;
unsigned long num = 0L;
struct treenode *t;
struct allocated *ap, *prevap;

while (fgets(buffer, 128, stdin) != NULL)
	{
	if ((++num % 100) == 0)
	fprintf(stderr, "%lu\r", num);
	if (strncmp(buffer, "m: ", 3) == 0)
	{
	size = strtoul(buffer+3, &p, 10);
	value = strtoul(p, &p, 10);
add_node:
	type = MYALLOC;
	t = find_node(value);
	if (t == NULL)
		break;
	ap = malloc(sizeof(struct allocated));
	if (ap == NULL)
		{
		fprintf(stderr, "Out of memory!\n");
		break;
		}
	ap->size = size;
	ap->type = type;
	ap->line = num;
	ap->link = t->alloc;
	t->alloc = ap;
	}
	else if (strncmp(buffer, "r: ", 3) == 0)
	{
	prior = strtoul(buffer+3, &p, 10);
	size = strtoul(p+1, &p, 10);
	value = strtoul(p+1, &p, 10);
	if (prior == 0L)
		goto add_node;
replace_node:
	t = find_node(prior);
	if (t == NULL)
		break;
	for ( prevap = NULL, ap = t->alloc ; ap ; ap = ap->link )
		{
		if (ap->type != MYFREE)
		{
		if (prevap == NULL)
			t->alloc = ap->link;
		else
			prevap->link = ap->link;
		free(ap);
		break;
		}
		prevap = ap;
		}
	t = find_node(value);
	if (t == NULL)
		break;
	ap = malloc(sizeof(struct allocated));
	if (ap == NULL)
		{
		fprintf(stderr, "Out of memory!\n");
		break;
		}
	ap->size = size;
	ap->type = prior;
	ap->line = num;
	ap->link = t->alloc;
	t->alloc = ap;
	}
	else if (strncmp(buffer, "f: ", 3) == 0)
	{
	value = strtoul(buffer+3, &p, 10);
	size = 0L;
	type = MYFREE;
remove_node:
	t = find_node(value);
	if (t == NULL)
		break;
	for ( prevap = NULL, ap = t->alloc ; ap ; ap = ap->link )
		{
		if (ap->type != MYFREE)
		{
		if (prevap == NULL)
			t->alloc = ap->link;
		else
			prevap->link = ap->link;
		free(ap);
		break;
		}
		prevap = ap;
		}
	if (ap == NULL)
		{
		ap = malloc(sizeof(struct allocated));
		if (ap == NULL)
		{
		fprintf(stderr, "Out of memory!\n");
		break;
		}
		ap->size = size;
		ap->type = type;
		ap->line = num;
		ap->link = t->alloc;
		t->alloc = ap;
		}
	}
	}
fprintf(stderr, "%lu\n", num);
print_tree( &head );
#ifdef DEBUG
dump_tree( &head, 0 );
#endif
return 0;
}
