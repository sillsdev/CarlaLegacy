# MS-DOS makefile for SenTransLib
# GNU C / GNU make (DJGPP 2.01)
# H. Andrew Black, 26-Jul-2000

CC      = gcc -g -O2 -Wall -Dalloca=__builtin_alloca
CFLAGS  = -DDJGPP -DHAVE_CONFIG_H -I. -I.. -I../include
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

SOURCES = SenTransLib.h applrule.c loadrule.c loadsent.c prtheadr.c \
		  myallo.c myallo.h


DISTFILES = $(SOURCES) Makefile.unx Makefile.DOS Makefile.dj Makefile.msc

LIBS  =../pc-parse/lib/libopac.a ../pc-parse/lib/libcport.a
LIBSP =../pc-parse/lib/libopac_p.a ../pc-parse/lib/libcport_p.a
LIBS86=../lib/lopac.lib ../lib/lcport.lib
LFLAGS=/batch
STACK =/stack:8192

#############################################################################

OBJS = applrule.o loadrule.o loadsent.o prtheadr.o myallo.o

libsentr.a: $(OBJS)
	-@if exist libsentr.a del libsentr.a >nul
	ar rc libsentr.a $(OBJS)
	$(RANLIB) libsentr.a
#
# build the 386 mode profiling library
#
OBJP = applrule.op loadrule.op loadsent.op prtheadr.op myallo.op

libsen_p.a: $(OBJSP)
	-del libsen_p.a
	ar rc libsen_p.a $(OBJSP)
	$(RANLIB) libsen_p.a

applrule.o applrule.op: applrule.c SenTransLib.h myallo.h
loadrule.o loadrule.op: loadrule.c SenTransLib.h myallo.h
loadsent.o loadsent.op: loadsent.c SenTransLib.h myallo.h
prtheadr.o prtheadr.op: prtheadr.c version.h

myallo.o myallo.op: myallo.c myallo.h

#############################################################################
