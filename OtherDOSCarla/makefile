# MS-DOS makefile for the auxiliary CARLA programs
# GNU C / GNU make (DJGPP 2.01)
# Steve McConnel, 31-Jul-1998
# H. Andrew Black, 13-Mar-2000 (added AnaCount)
# H. Andrew Black, 26-Jul-2000 (removed SenTrans; it's in its own now)

# directory where executable programs are stored
# (this is the only line that you should need to customize)
BINDIR=d:\carla\LatestVersions\TestExes

CC      = gcc -g -O2 -Wall -Dalloca=__builtin_alloca
CFLAGS  = -DDJGPP -DHAVE_CONFIG_H -I. -I../pc-parse -I../pc-parse/include
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

SOURCES = ambex.c \
		  anacount.c \
		  cadadisp.c \
		  joincomp.c \
		  lextrans.c lextrans.h lexlsent.c lexlrule.c lexarule.c \
		  phonrule.c phonrule.h phnarule.c loadent.c phnlrule.c \
		  printana.c \
		  ralph.c \
		  myallo.c myallo.h

DISTFILES = $(SOURCES) Makefile.unx Makefile.DOS Makefile.dj Makefile.msc

LIBS  =../pc-parse/lib/libopac.a ../pc-parse/lib/libcport.a
LIBSP =../pc-parse/lib/libopac_p.a ../pc-parse/lib/libcport_p.a
LIBS86=../lib/lopac.lib ../lib/lcport.lib
LFLAGS=/batch
STACK =/stack:8192

#############################################################################

AMBOBJ = ambex.o

ambex.exe: $(AMBOBJ)
	$(CC) -o ambex $(AMBOBJ) $(LIBS)
	@copy ambex. a.out >nul
	strip ambex.
	stubify ambex
	@del ambex. >nul
	@ren a.out ambex. >nul

AMBOBJP = ambex.op

ambex_p.exe: $(AMBOBJP)
	$(CC) -o ambex_p $(AMBOBJP) $(LIBSP)
	@copy ambex_p. a.out >nul
	strip ambex_p.
	stubify ambex_p
	@del ambex_p. >nul
	@ren a.out ambex_p. >nul

ambex.o ambex.op: ambex.c

#############################################################################

ANCOBJ = anacount.o

anacount.exe: $(ANCOBJ)
	$(CC) -o anacount $(ANCOBJ) $(LIBS)
	@copy anacount. a.out >nul
	strip anacount.
	stubify anacount
	@del anacount. >nul
	@ren a.out anacount. >nul

ANCOBJP = anacount.op

anacou_p.exe: $(ANCOBJP)
	$(CC) -o anacou_p $(ANCOBJP) $(LIBSP)
	@copy anacou_p. a.out >nul
	strip anacou_p.
	stubify anacou_p
	@del anacou_p. >nul
	@ren a.out anacou_p. >nul

anacount.o anacount.op: anacount.c

#############################################################################

DISPOBJ = cadadisp.o

cadadisp.exe: $(DISPOBJ)
	$(CC) -o cadadisp $(DISPOBJ) $(LIBS)
	@copy cadadisp. a.out >nul
	strip cadadisp.
	stubify cadadisp
	@del cadadisp. >nul
	@ren a.out cadadisp. >nul

DISPOBJP = cadadisp.op

cadadisp_p.exe: $(DISPOBJP)
	$(CC) -o cadadisp_p $(DISPOBJP) $(LIBSP)
	@copy cadadi_p. a.out >nul
	strip cadadi_p.
	stubify cadadi_p
	@del cadadi_p. >nul
	@ren a.out cadadi_p. >nul

cadadisp.o cadadisp.op: cadadisp.c

#############################################################################

JOINOBJ  = joincomp.o

joincomp.exe: $(JOINOBJ)
	$(CC) -o joincomp $(JOINOBJ) $(LIBS)
	@copy joincomp. a.out >nul
	strip joincomp.
	stubify joincomp
	@del joincomp. >nul
	@ren a.out joincomp. >nul

JOINOBJP  = joincomp.op

joinco_p.exe: $(JOINOBJP)
	$(CC) -pg -o joinco_p $(JOINOBJP) $(LIBSP)
	@copy joinco_p. a.out >nul
	strip joinco_p.
	stubify joinco_p
	@del joinco_p. >nul
	@ren a.out joinco_p. >nul

joincomp.o joincomp.op: joincomp.c

#############################################################################

LEXOBJ=lextrans.o lexlsent.o lexlrule.o lexarule.o myallo.o

lextrans.exe: $(LEXOBJ)
	$(CC) -o lextrans $(LEXOBJ) $(LIBS)
	@copy lextrans. a.out >nul
	strip lextrans.
	stubify lextrans
	@del lextrans. >nul
	@ren a.out lextrans. >nul

LEXOBJP=lextrans.op lexlsent.op lexlrule.op lexarule.op myallo.op

lextra_p.exe: $(LEXOBJP)
	$(CC) -o lextra_p $(LEXOBJP) $(LIBSP)
	@copy lextra_p. a.out >nul
	strip lextra_p.
	stubify lextra_p
	@del lextra_p. >nul
	@ren a.out lextra_p. >nul

lextrans.o lextrans.op: lextrans.c lextrans.h myallo.h
lexlsent.o lexlsent.op: lexlsent.c lextrans.h myallo.h
lexlrule.o lexlrule.op: lexlrule.c lextrans.h myallo.h
lexarule.o lexarule.op: lexarule.c lextrans.h myallo.h

#############################################################################

PHONOBJ=phonrule.o loadent.o phnlrule.o phnarule.o myallo.o

phonrule.exe: $(PHONOBJ)
	$(CC) -o phonrule $(PHONOBJ) $(LIBS)
	@copy phonrule. a.out >nul
	strip phonrule.
	stubify phonrule
	@del phonrule. >nul
	@ren a.out phonrule. >nul

PHONOBJP=phonrule.op loadent.op phnlrule.op phnarule.op myallo.op

phonru_p.exe: $(PHONOBJP)
	$(CC) -o phonru_p.exe $(PHONOBJP) $(LIBSP)
	@copy phonru_p. a.out >nul
	strip phonru_p.
	stubify phonru_p
	@del phonru_p. >nul
	@ren a.out phonru_p. >nul

phonrule.o phonrule.op: phonrule.c phonrule.h
loadent.o  loadent.op : loadent.c  phonrule.h
phnlrule.o phnlrule.op: phnlrule.c phonrule.h
phnarule.o phnarule.op: phnarule.c phonrule.h

#############################################################################

PRINOBJ  = printana.o

printana.exe: $(PRINOBJ)
	$(CC) -o printana $(PRINOBJ) $(LIBS)
	@copy printana. a.out >nul
	strip printana.
	stubify printana
	@del printana. >nul
	@ren a.out printana. >nul

PRINOBJP  = printana.op

printa_p.exe: $(PRINOBJP)
	$(CC) -pg -o printa_p $(PRINOBJP) $(LIBSP)
	@copy printa_p. a.out >nul
	strip printa_p.
	stubify printa_p
	@del printa_p. >nul
	@ren a.out printa_p. >nul

printana.o printana.op: printana.c

#############################################################################

RALPOBJ  = ralph.o

ralph.exe: $(RALPOBJ)
	$(CC) -o ralph $(RALPOBJ) $(LIBS)
	@copy ralph. a.out >nul
	strip ralph.
	stubify ralph
	@del ralph. >nul
	@ren a.out ralph. >nul

RALPOBJP  = ralph.op

ralph_p.exe: $(RALPOBJP)
	$(CC) -pg -o ralph_p $(RALPOBJP) $(LIBSP)
	@copy ralph_p. a.out >nul
	strip ralph_p.
	stubify ralph_p
	@del ralph_p. >nul
	@ren a.out ralph_p. >nul

ralph.o ralph.op: ralph.c

#############################################################################

libs profile_libs installdirs:

all: ambex.exe cadadisp.exe joincomp.exe lextrans.exe phonrule.exe \
	 printana.exe ralph.exe anacount.exe

profile: ambex_p.exe cadadi_p.exe joinco_p.exe lextra_p.exe phonru_p.exe \
		 printa_p.exe ralph_p.exe sentra_p.exe anacou_p.exe

install: all
	$(INSTALL) ambex.exe $(BINDIR)
	$(INSTALL) anacount.exe $(BINDIR)
	$(INSTALL) cadadisp.exe $(BINDIR)
	$(INSTALL) joincomp.exe $(BINDIR)
	$(INSTALL) lextrans.exe $(BINDIR)
	$(INSTALL) phonrule.exe $(BINDIR)
	$(INSTALL) printana.exe $(BINDIR)
	$(INSTALL) ralph.exe $(BINDIR)

uninstall:
	if exist $(BINDIR)\ambex.exe    del $(BINDIR)\ambex.exe
	if exist $(BINDIR)\anacount.exe del $(BINDIR)\anacount.exe
	if exist $(BINDIR)\cadadisp.exe del $(BINDIR)\cadadisp.exe
	if exist $(BINDIR)\joincomp.exe del $(BINDIR)\joincomp.exe
	if exist $(BINDIR)\lextrans.exe del $(BINDIR)\lextrans.exe
	if exist $(BINDIR)\phonrule.exe del $(BINDIR)\phonrule.exe
	if exist $(BINDIR)\printana.exe del $(BINDIR)\printana.exe
	if exist $(BINDIR)\ralph.exe    del $(BINDIR)\ralph.exe

check: all

mostlyclean:
	rm -f *.o *.op *~

clean: mostlyclean

distclean: clean
	rm -f TAGS Makefile *.exe
	rm -f ambex ambex_p cadadisp cadadisp_p joincomp joincomp_p
	rm -f lextrans lextrans_p phonrule phonrule_p printana printana_p
	rm -f ralph ralph_p anacount.exe anacou_p.exe

maintainer-clean: distclean

TAGS: $(SOURCES)
	etags $(SOURCES)

doc dvi html info:
	@if exist ..\doc\ambex.txi  cd ..\doc
	@if exist ambex.txi         @$(MAKE) ambex$@
	@if exist ambex.txi         cd ..\ambex
	@if exist ..\doc\cadadisp.txi  cd ..\doc
	@if exist cadadisp.txi         @$(MAKE) cadadisp$@
	@if exist cadadisp.txi         cd ..\cadadisp
	@if exist ..\doc\joincomp.txi  cd ..\doc
	@if exist joincomp.txi         @$(MAKE) joincomp$@
	@if exist joincomp.txi         cd ..\joincomp
	@if exist ..\doc\lextrans.txi  cd ..\doc
	@if exist lextrans.txi         @$(MAKE) lextrans$@
	@if exist lextrans.txi         cd ..\lextrans
	@if exist ..\doc\phonrule.txi  cd ..\doc
	@if exist phonrule.txi         @$(MAKE) phonrule$@
	@if exist phonrule.txi         cd ..\phonrule
	@if exist ..\doc\printana.txi  cd ..\doc
	@if exist printana.txi         @$(MAKE) printana$@
	@if exist printana.txi         cd ..\printana
	@if exist ..\doc\ralph.txi  cd ..\doc
	@if exist ralph.txi         @$(MAKE) ralph$@
	@if exist ralph.txi         cd ..\ralph

dist: $(DISTFILES)
	@echo this target does not work on MS-DOS
	@echo you need some variant of Unix (SunOS, Linux, ...) to "make $@"

testdist:

#############################################################################

.PHONY: all check clean dist distclean doc dvi html info install \
		libs maintainer-clean mostlyclean profile profile_libs testdist \
		uninstall installdirs
