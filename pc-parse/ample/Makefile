# MS-DOS makefile for the AMPLE program and function library
# GNU C / GNU make (DJGPP 2.01)
# Steve McConnel, 14-Apr-2000

# directory where executable programs are stored
# (this is the only line that you should need to customize)
BINDIR=c:\sil

CC      = gcc -g -O2 -Wall -Dalloca=__builtin_alloca
CFLAGS  = -DHAVE_CONFIG_H -I. -I.. -I../include
RANLIB  = ranlib
INSTALL = copy
# either GNU bison or Berkeley yacc work okay: need the -d and -p options
YACC = bison -y
#YACC = byacc
FLEX = flex
SED  = sed

.SUFFIXES:
.SUFFIXES: .c .o .op .ox .oxp
.c.o:
	$(CC) -ansi -pedantic $(CFLAGS) -c $<
.c.op:
	$(CC) -ansi -pedantic $(CFLAGS) -pg -c -o$@ $<
.c.ox:
	$(CC) -ansi -pedantic $(CFLAGS) -DEXPERIMENTAL -c -o$@ $<
.c.oxp:
	$(CC) -ansi -pedantic $(CFLAGS) -pg -DEXPERIMENTAL -c -o$@ $<

############################################################################

SOURCES=ample.c    anal.c     analda.c   atest.y    categ.c     envchk.c   \
		envpar.c   loadcc.c   loadtb.c   mktest.c   morcla.c    proper.c   \
		putsd.c    select.c   setsd.c    spreds.l   version.c   writests.c \
		cmdutil.c  mccpar.c   validch.c  puncla.c   dynstr.c    \
		ample.h    ampledef.h stample.h  version.h  punclass.h  \
		fixflex.sed fixyacc.sed
TESTS = ae cq hg sb
XTESTS = tt yal
#
# 386 mode AMPLE program and function library
#
LIBS=libample.a ../lib/libopac.a ../lib/libcport.a
OBJ =ample.o
LIBO=anal.o     analda.o   atest.o    categ.o    envchk.o   envpar.o  \
	 loadcc.o   loadtb.o   mktest.o   morcla.o   proper.o   select.o  \
	 setsd.o    spreds.o   version.o  putsd.o    writests.o cmdutil.o \
	 mccpar.o   validch.o  puncla.o   dynstr.o

ample ample.exe: $(OBJ) $(LIBS)
	$(CC) -o ample $(OBJ) $(LIBS)
	@copy ample. a.out >nul
	strip ample.
	stubify ample
	@del ample. >nul
	@ren a.out ample. >nul

libample.a: $(LIBO)
	-@if exist libample.a del libample.a >nul
	ar rc libample.a $(LIBO)
	$(RANLIB) libample.a
#
# 386 mode AMPLE program and function library compiled for profiling
#
LIBSP=libamp_p.a ../lib/libopa_p.a ../lib/libcpo_p.a
OBJP =ample.op
LIBOP=anal.op     analda.op   atest.op    categ.op    envchk.op   envpar.op  \
	  loadcc.op   loadtb.op   mktest.op   morcla.op   proper.op   select.op  \
	  setsd.op    spreds.op   version.op  putsd.op    writests.op cmdutil.op \
	  mccpar.op   validch.op  puncla.op   dynstr.op

ample_p ample_p.exe: $(OBJP) $(LIBSP)
	$(CC) -pg -o ample_p $(OBJP) $(LIBSP)
	@copy ample_p. a.out >nul
	strip ample_p.
	stubify ample_p
	@del ample_p. >nul
	@ren a.out ample_p. >nul

libamp_p.a: $(LIBOP)
	-@if exist libamp_p.a del libamp_p.a >nul
	ar rc libamp_p.a $(LIBOP)
	$(RANLIB) libamp_p.a
#
# AMPLE program and function library compiled with experimental features
#
LIBSX=libxampl.a ../lib/libpatr.a ../lib/libcmd.a ../lib/libopac.a \
	  ../lib/libcport.a
OBJX =ample.ox
LIBOX=anal.ox     analda.ox   atest.ox    categ.ox    envchk.ox   envpar.ox  \
	  loadcc.ox   loadtb.ox   mktest.ox   morcla.ox   proper.ox   select.ox  \
	  setsd.ox    spreds.ox   version.ox  putsd.ox    writests.ox cmdutil.ox \
	  mccpar.ox   validch.ox  puncla.ox   dynstr.ox

xample xample.exe: $(OBJX) $(LIBSX)
	$(CC) -o xample $(OBJX) $(LIBSX)
	@copy xample. a.out >nul
	strip xample.
	stubify xample
	@del xample. >nul
	@ren a.out xample. >nul

libxampl.a: $(LIBOX)
	-@if exist libxampl.a del libxampl.a >nul
	ar rc libxampl.a $(LIBOX)
	$(RANLIB) libxampl.a
#
# AMPLE program and function library compiled for profiling with experimental
# features
#
LIBSXP=libxam_p.a ../lib/libpat_p.a ../lib/libcmd_p.a ../lib/libopa_p.a \
	   ../lib/libcpo_p.a
OBJXP =ample.oxp
LIBOXP=anal.oxp   analda.oxp  atest.oxp   categ.oxp  envchk.oxp   envpar.oxp  \
	   loadcc.oxp loadtb.oxp  mktest.oxp  morcla.oxp proper.oxp   select.oxp  \
	   setsd.oxp  spreds.oxp  version.oxp putsd.oxp  writests.oxp cmdutil.oxp \
	   mccpar.oxp validch.oxp puncla.oxp  dynstr.oxp

xample_p xample_p.exe: $(OBJXP) $(LIBSXP)
	$(CC) -pg -o xample_p $(OBJXP) $(LIBSXP)
	@copy xample_p. a.out >nul
	strip xample_p.
	stubify xample_p
	@del xample_p. >nul
	@ren a.out xample_p. >nul

libxam_p.a: $(LIBOXP)
	-@if exist libxam_p.a del libxam_p.a >nul
	ar rc libxam_p.a $(LIBOXP)
	$(RANLIB) libxam_p.a

HEADERS=stample.h ample.h ampledef.h punclass.h
#
# sources unique to AMPLE (user interface code)
#
ample.o ample.op ample.ox ample.oxp: ample.c $(HEADERS) version.h
#
# sources shared with other programs as a library
#
atest.h atest.c: atest.y fixyacc.sed
	$(YACC) -d -pampyy atest.y
	@if exist atest.h del atest.h >nul
	@ren y_tab.h atest.h >nul
	$(SED) -f fixyacc.sed y_tab.c >atest.c
	-@del y_tab.c >nul
spreds.c: spreds.l fixflex.sed
	$(FLEX) -8 -ospreds.c -Pampyy spreds.l
	-@if exist spredsl.c del spredsl.c >nul
	@ren spreds.c spredsl.c >nul
	$(SED) -f fixflex.sed spredsl.c >spreds.c
	-@del spredsl.c >nul
anal.o     anal.op     anal.ox     anal.oxp:     anal.c     $(HEADERS)
analda.o   analda.op   analda.ox   analda.oxp:   analda.c   $(HEADERS)
atest.o    atest.op    atest.ox    atest.oxp:    atest.c    $(HEADERS)
envchk.o   envchk.op   envchk.ox   envchk.oxp:   envchk.c   $(HEADERS)
loadcc.o   loadcc.op   loadcc.ox   loadcc.oxp:   loadcc.c   $(HEADERS)
loadtb.o   loadtb.op   loadtb.ox   loadtb.oxp:   loadtb.c   $(HEADERS)
mccpar.o   mccpar.op   mccpar.ox   mccpar.oxp:   mccpar.c   $(HEADERS)
putsd.o    putsd.op    putsd.ox    putsd.oxp:    putsd.c    $(HEADERS)
select.o   select.op   select.ox   select.oxp:   select.c   $(HEADERS)
setsd.o    setsd.op    setsd.ox    setsd.oxp:    setsd.c    $(HEADERS)
spreds.o   spreds.op   spreds.ox   spreds.oxp:   spreds.c   $(HEADERS) atest.h
version.o  version.op  version.ox  version.oxp:  version.c  $(SOURCES)
writests.o writests.op writests.ox writests.oxp: writests.c $(HEADERS)
dynstr.o   dynstr.op   dynstr.ox   dynstr.oxp:   dynstr.c   $(HEADERS)
#
#  shared by AMPLE and STAMP
#
categ.o   categ.op   categ.ox   categ.oxp:   categ.c   stample.h punclass.h
cmdutil.o cmdutil.op cmdutil.ox cmdutil.oxp: cmdutil.c stample.h punclass.h
envpar.o  envpar.op  envpar.ox  envpar.oxp:  envpar.c  stample.h punclass.h
mktest.o  mktest.op  mktest.ox  mktest.oxp:  mktest.c  stample.h punclass.h
morcla.o  morcla.op  morcla.ox  morcla.oxp:  morcla.c  stample.h punclass.h
proper.o  proper.op  proper.ox  proper.oxp:  proper.c  stample.h punclass.h
puncla.o  puncla.op  puncla.ox  puncla.oxp:  puncla.c  punclass.h
validch.o validch.op validch.ox validch.oxp: validch.c stample.h punclass.h

############################################################################

libs: installdirs ../lib/libample.a ../lib/libxampl.a \
	  ../include/ample.h ../include/stample.h ../include/punclass.h

profile_libs: installdirs ../lib/libamp_p.a ../lib/libxam_p.a \
			  ../include/ample.h ../include/stample.h ../include/punclass.h

installdirs:
	-@if not exist ..\include\*.* md ..\include >nul
	-@if not exist ..\lib\*.*     md ..\lib >nul
	-@if not exist $(BINDIR)\*.*  md $(BINDIR) >nul

../include/stample.h: stample.h
	$(INSTALL) stample.h ..\include\stample.h >nul
../include/ample.h: ample.h
	$(INSTALL) ample.h ..\include\ample.h >nul
../include/punclass.h: punclass.h
	$(INSTALL) punclass.h ..\include\punclass.h >nul
../lib/libample.a: libample.a
	$(INSTALL) libample.a ..\lib\libample.a >nul
../lib/libxampl.a: libxampl.a
	$(INSTALL) libxampl.a ..\lib\libxampl.a >nul
../lib/libamp_p.a: libamp_p.a
	$(INSTALL) libamp_p.a ..\lib\libamp_p.a >nul
../lib/libxam_p.a: libxam_p.a
	$(INSTALL) libxam_p.a ..\lib\libxam_p.a >nul

all: libs ample.exe xample.exe

profile: profile_libs ample_p.exe xample_p.exe

install: all
	@$(INSTALL) ample.exe $(BINDIR)\ample.exe >nul
	@$(INSTALL) xample.exe $(BINDIR)\xample.exe >nul

uninstall:
	@if exist $(BINDIR)\ample.exe del $(BINDIR)\ample.exe >nul
	@if exist $(BINDIR)\xample.exe del $(BINDIR)\xample.exe >nul

check: ample.exe
	-@check $(TESTS)
	-@xcheck $(XTESTS)

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
	-@if exist ample. del ample. >nul
	-@if exist ample_p. del ample_p. >nul

maintainer-clean: distclean
	-if exist atest.c del atest.c >nul
	-if exist atest.h del atest.h >nul
	-if exist spreds.c del spreds.c >nul

TAGS: $(SOURCES)
	etags $(SOURCES)

doc dvi html info dist testdist:
	@echo this target does not work on MS-DOS
	@echo you need some variant of Unix (SunOS, Linux, ...) to "make $@"

############################################################################

.PHONY: all check clean dist distclean doc dvi html info install \
		libs maintainer-clean mostlyclean profile profile_libs testdist \
		uninstall installdirs
