# MS-DOS makefile for PhonRule
# GNU C / GNU make (DJGPP 2.01)
# H. Andrew Black, 26-Jul-2000

CC      = gcc -g -O2 -Wall -Dalloca=__builtin_alloca
COPY    = cp
#CFLAGS  = -DDJGPP -DHAVE_CONFIG_H -I. -I.. -I../include
CFLAGS  = -DDJGPP -DHAVE_CONFIG_H -I. -I.. -I../include -I../../pc-parse -I../../pc-parse/include
RANLIB  = ranlib
INSTALL = copy

.SUFFIXES:
.SUFFIXES: .c .o .op .ox
.c.o:
	$(CC) -ansi -pedantic $(CFLAGS) -c $<
.c.op:
	$(CC) -ansi -pedantic $(CFLAGS) -pg -c -o$@ $<
.c.ox:
	$(CC) -ansi -pedantic $(CFLAGS) -DEXPERIMENTAL -c -o$@ $<

#############################################################################

SOURCES = phonrule.h phonrule.c phnarule.c phnlrule.c \
		  myallo.c myallo.h


DISTFILES = $(SOURCES) Makefile.unx Makefile.DOS Makefile.dj Makefile.msc

LIBS  =
LIBSP =
LIBS86=
LFLAGS=/batch
STACK =/stack:8192

#############################################################################

OBJS = phonrule.o phnarule.o phnlrule.o Loadent.o myallo.o

#
# build the 386 mode profiling library
#
OBJSP = phonrule.op phnarule.op phnlrule.op myallo.op Loadent.op

phonrule.o phonrule.op: phonrule.c phonrule.h myallo.h
phnarule.o phnarule.op: phnarule.c phonrule.h myallo.h
phnlrule.o phnlrule.op: phnlrule.c phonrule.h myallo.h
Loadent.o  Loadent.op: Loadent.c phonrule.h myallo.h

myallo.o myallo.op: myallo.c myallo.h

#############################################################################

phonrule.exe: $(OBJS)
	$(CC) -o phonrule $(OBJS)
	$(COPY) phonrule. a.out >nul
	strip phonrule.
	stubify phonrule
	@del phonrule. >nul
	@ren a.out phonrule. >nul
