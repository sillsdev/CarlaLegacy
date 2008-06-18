# MS-DOS makefile for the STAMP program and function library
# GNU C / GNU make (DJGPP 2.01)
# Steve McConnel, 2-Dec-1998

# directory where executable programs are stored
# (this is the only line that you should need to customize)
BINDIR=c:\sil

CC      = gcc -g -O2 -Wall -Dalloca=__builtin_alloca
CFLAGS  = -DHAVE_CONFIG_H -I. -I.. -I../include
RANLIB  = ranlib
INSTALL = copy
# either GNU bison or Berkeley yacc work okay: need the -d and -p options
#YACC = bison -y
YACC = byacc
FLEX = flex
SED  = sed

.SUFFIXES:
.SUFFIXES: .c .o .op
.c.o:
	$(CC) -ansi -pedantic $(CFLAGS) -c $<
.c.op:
	$(CC) -ansi -pedantic $(CFLAGS) -pg -c -o$@ $<

##############################################################################

SOURCES=stamp.c    dtbio.c    lexchg.c   menvck.c   synrsc.c   synth.c    \
		syntst.c   sytest.l   sytest.y   tmatch.c   transfer.c treplace.c \
		trules.c   tsdict.c   tsinit.c   tsutil.c   envchk.c   version.c  \
		trample.c  sample.c   \
		stamp.h    version.h  sytest_y.h sytest_l.c sytest_y.c \
		fixflex.sed fixyacc.sed
TESTS     = ckea ckno cksw cz
#
# 386 mode STAMP program and function library
#
LIBS = libstamp.a ../lib/libample.a ../lib/libopac.a ../lib/libcport.a
OBJ  = stamp.o
LIBO = tsinit.o   sytest_l.o sytest_y.o tsdict.o   tsutil.o   transfer.o \
	   synth.o    syntst.o   synrsc.o   lexchg.o   trules.o   tmatch.o   \
	   treplace.o dtbio.o    menvck.o   envchk.o   version.o

stamp.exe: $(OBJ) $(LIBS)
	$(CC) -o stamp $(OBJ) $(LIBS)
	@copy stamp. a.out >nul
	strip stamp.
	stubify stamp
	@del stamp. >nul
	@ren a.out stamp. >nul

libstamp.a: $(LIBO)
	-@if exist libstamp.a del libstamp.a >nul
	ar rc libstamp.a $(LIBO)
	$(RANLIB) libstamp.a
#
# 386 mode STAMP program and function library compiled for profiling
#
LIBSP = libsta_p.a ../lib/libamp_p.a ../lib/libopa_p.a ../lib/libcpo_p.a
OBJP  = stamp.op
LIBOP = tsinit.op   sytest_l.op sytest_y.op tsdict.op tsutil.op  transfer.op \
		synth.op    syntst.op   synrsc.op   lexchg.op trules.op  tmatch.op   \
		treplace.op dtbio.op    menvck.op   envchk.op version.op

stamp_p.exe: $(OBJP) $(LIBSP)
	$(CC) -pg -o stamp_p $(OBJP) $(LIBSP)
	@copy stamp_p. a.out >nul
	strip stamp_p.
	stubify stamp_p
	@del stamp_p. >nul
	@ren a.out stamp_p. >nul

libsta_p.a: $(LIBOP)
	-@if exist libsta_p.a del libsta_p.a >nul
	ar rc libsta_p.a $(LIBOP)
	$(RANLIB) libsta_p.a

HEADERS=stamp.h ../ample/stample.h
#
# sources unique to STAMP (user interface code)
#
stamp.o    stamp.op:    stamp.c    $(HEADERS) version.h
#
# sources shared as a library
#
sytest_y.c sytest_y.h: sytest.y fixyacc.sed
	$(YACC) -d -pstampyy sytest.y
	rm -f sytest_y.h
	mv y_tab.h sytest_y.h
	sed -f fixyacc.sed y_tab.c >sytest_y.c
	rm -f y_tab.c

sytest_l.c: sytest.l fixflex.sed
	$(LEX) -8 -t -Pstampyy sytest.l >sytestl.c
	sed -f fixflex.sed sytestl.c >sytest_l.c
	rm -f sytestl.c

dtbio.o    dtbio.op:    dtbio.c    $(HEADERS)
envchk.o   envchk.op:   envchk.c   $(HEADERS)
lexchg.o   lexchg.op:   lexchg.c   $(HEADERS)
menvck.o   menvck.op:   menvck.c   $(HEADERS)
synrsc.o   synrsc.op:   synrsc.c   $(HEADERS)
synth.o    synth.op:    synth.c    $(HEADERS)
syntst.o   syntst.op:   syntst.c   $(HEADERS)
sytest_l.o sytest_l.op: sytest_l.c $(HEADERS) sytest_y.h
sytest_y.o sytest_y.op: sytest_y.c $(HEADERS)
tmatch.o   tmatch.op:   tmatch.c   $(HEADERS)
transfer.o transfer.op: transfer.c $(HEADERS)
treplace.o treplace.op: treplace.c $(HEADERS)
trules.o   trules.op:   trules.c   $(HEADERS)
tsdict.o   tsdict.op:   tsdict.c   $(HEADERS)
tsinit.o   tsinit.op:   tsinit.c   $(HEADERS)
tsutil.o   tsutil.op:   tsutil.c   $(HEADERS)
version.o  version.op:  version.c  $(SOURCES)
#
# 386 mode TRAMPLE program
#
TROBJ = trample.o
trample.exe: $(TROBJ) $(LIBS)
	$(CC) -o trample $(TROBJ) $(LIBS)
	@copy trample. a.out >nul
	strip trample.
	stubify trample
	@del trample. >nul
	@ren a.out trample. >nul
#
# 386 mode TRAMPLE program compiled for profiling
#
TROBJP = trample.op
tramplep.exe: $(TROBJP) $(LIBSP)
	$(CC) -pg -o tramplep $(TROBJP) $(LIBSP)
	@copy tramplep. a.out >nul
	strip tramplep.
	stubify tramplep
	@del tramplep. >nul
	@ren a.out tramplep. >nul
#
# 386 mode SAMPLE program
#
SOBJ = sample.o
sample.exe: $(SOBJ) $(LIBS)
	$(CC) -o sample $(SOBJ) $(LIBS)
	@copy sample. a.out >nul
	strip sample.
	stubify sample
	@del sample. >nul
	@ren a.out sample. >nul
#
# 386 mode SAMPLE program compiled for profiling
#
SOBJP = sample.op
samplep.exe: $(SOBJP) $(LIBSP)
	$(CC) -pg -o samplep $(SOBJP) $(LIBSP)
	@copy samplep. a.out >nul
	strip samplep.
	stubify samplep
	@del samplep. >nul
	@ren a.out samplep. >nul
#
# sources unique to TRAMPLE or SAMPLE (user interface code)
#
trample.o  trample.op:  trample.c  $(HEADERS) version.h
sample.o   sample.op:   sample.c   $(HEADERS) version.h

#############################################################################

libs: installdirs ../include/stamp.h ../lib/libstamp.a

profile_libs: installdirs ../include/stamp.h ../lib/libsta_p.a

installdirs:
	-@if not exist ..\include\*.* md ..\include >nul
	-@if not exist ..\lib\*.*     md ..\lib >nul
	-@if not exist $(BINDIR)\*.*  md $(BINDIR) >nul

../include/stamp.h: stamp.h
	$(INSTALL) stamp.h ..\include >nul
../lib/libstamp.a: libstamp.a
	$(INSTALL) libstamp.a ..\lib >nul
../lib/libsta_p.a: libsta_p.a
	$(INSTALL) libsta_p.a ..\lib >nul

all: libs stamp.exe

profile: profile_libs stamp_p.exe

install: all
	@$(INSTALL) stamp.exe $(BINDIR)\stamp.exe >nul

uninstall:
	@if exist $(BINDIR)\stamp.exe del $(BINDIR)\stamp.exe >nul

check: stamp.exe
	-@check $(TESTS)

mostlyclean:
	-if exist *.o* del *.o* >nul
	-@if exist *.c~ del *.c~ >nul
	-@if exist *.h~ del *.h~ >nul

clean: mostlyclean
	-if exist lib*.a del lib*.a >nul

distclean: clean
	-if exist *.exe del *.exe >nul
	-if exist makefile. del makefile. >nul
	-@if exist TAGS. del TAGS. >nul
	-@if exist stamp. del stamp. >nul
	-@if exist stamp_p. del stamp_p. >nul

maintainer-clean: distclean
	-if exist sytest_y.c del sytest_y.c >nul
	-if exist sytest_y.h del sytest_y.h >nul
	-if exist sytest_l.c del sytest_l.c >nul

TAGS: $(SOURCES)
	etags $(SOURCES)

doc dvi html info:
	@if exist ..\doc\stamp.txi  cd ..\doc
	@if exist stamp.txi         @$(MAKE) stamp$@
	@if exist stamp.txi         cd ..\stamp

dist testdist:
	@echo this target does not work on MS-DOS
	@echo you need some variant of Unix (SunOS, Linux, ...) to "make $@"

#############################################################################

.PHONY: all check clean dist distclean doc dvi html info install \
		libs maintainer-clean mostlyclean profile profile_libs testdist \
		uninstall installdirs
