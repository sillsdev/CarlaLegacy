# MS-DOS makefile for SenTrans
# GNU C / GNU make (DJGPP 2.01)
# H. Andrew Black, 26-Jul-2000

# directory where executable programs are stored
# (this is the only line that you should need to customize)
BINDIR=c:\carla\LatestVersions\TestExes
LIBDIR=..\SenTransLib
LIBSRCDIR=..\SenTransLib

CC      = gcc -g -O2 -Wall -Dalloca=__builtin_alloca
#CFLAGS  = -DDJGPP -DHAVE_CONFIG_H -I. -I.. -I../../pc-parse/include -I../SenTransLib
CFLAGS  = -DDJGPP -DHAVE_CONFIG_H -I. -I.. -I../../pc-parse -I../../pc-parse/include -I../SenTransLib
RANLIB  = ranlib
INSTALL = copy
# either GNU bison or Berkeley yacc work okay: need the -d and -p options
#YACC = bison -y
YACC = byacc
FLEX = flex
SED  = sed

.SUFFIXES:
.SUFFIXES: .c .o .op .ox
.c.o:
	$(CC) -ansi -pedantic $(CFLAGS) -c $<
.c.op:
	$(CC) -ansi -pedantic $(CFLAGS) -pg -c -o$@ $<
.c.ox:
	$(CC) -ansi -pedantic $(CFLAGS) -DEXPERIMENTAL -c -o$@ $<

#############################################################################

SOURCES = SenTrans32.cpp $(LIBSRCDIR)\SenTransLib.h \
		  $(LIBSRCDIR)\applrule.c $(LIBSRCDIR)\loadrule.c \
		  $(LIBSRCDIR)\loadsent.c $(LIBSRCDIR)\prtheadr.c \
		  $(LIBSRCDIR)\myallo.c $(LIBSRCDIR)\myallo.h


DISTFILES = $(SOURCES) Makefile.unx Makefile.DOS Makefile.dj Makefile.msc

LIBS  =../SenTransLib/libsentr.a \
	   ../../pc-parse/lib/libopac.a ../../pc-parse/lib/libcport.a

LIBSP =../../pc-parse/lib/libopac_p.a ../../pc-parse/lib/libcport_p.a \
	   ../SenTransLib/libsen_p.a
LIBS86=../lib/lopac.lib ../lib/lcport.lib
LFLAGS=/batch
STACK =/stack:8192

#############################################################################

SENTOBJ = sentrans.o

sentrans.exe: $(SENTOBJ)
	$(CC) -o sentrans $(SENTOBJ) $(LIBS)
	@copy sentrans. a.out >nul
	strip sentrans.
	stubify sentrans
	@del sentrans. >nul
	@ren a.out sentrans. >nul

SENTOBJP = sentrans.op

sentra_p.exe: $(SENTOBJP)
	$(CC) -o sentrans_p $(SENTOBJP) $(LIBSP)
	@copy sentra_p. a.out >nul
	strip sentra_p.
	stubify sentra_p
	@del sentra_p. >nul
	@ren a.out sentra_p. >nul

sentrans.o sentrans.op: SenTrans32.cpp
#	copy SenTrans32.cpp sentrans.c
	$(CC) -ansi -pedantic $(CFLAGS) -c sentrans.c -o sentrans.o

#############################################################################

libs profile_libs installdirs:

all: sentrans.exe

profile: sentra_p.exe

install: all
	$(INSTALL) sentrans.exe $(BINDIR)

uninstall:
	if exist $(BINDIR)\sentrans.exe del $(BINDIR)\sentrans.exe

check: all

mostlyclean:
	rm -f *.o *.op *~

clean: mostlyclean

distclean: clean
	rm -f TAGS Makefile *.exe
	rm -f sentrans sentrans_p

maintainer-clean: distclean

TAGS: $(SOURCES)
	etags $(SOURCES)

SenTransTAGS: $(SOURCES)
	etags $(SOURCES)

doc dvi html info:
	@if exist sentrans.txi         @$(MAKE) sentrans$@
	@if exist sentrans.txi         cd ..\sentrans

dist: $(DISTFILES)
	@echo this target does not work on MS-DOS
	@echo you need some variant of Unix (SunOS, Linux, ...) to "make $@"

testdist:

#############################################################################

.PHONY: all check clean dist distclean doc dvi html info install \
		libs maintainer-clean mostlyclean profile profile_libs testdist \
		uninstall installdirs
