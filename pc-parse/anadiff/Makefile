# MS-DOS Makefile for the ANADIFF program
# GNU C / GNU make (DJGPP 2.01)
# Steve McConnel, 25-Sep-1998

# directory where executable programs are stored
# (this is the only line that you should need to customize)
BINDIR=c:\sil

CC      = gcc -g -O2 -Wall -Dalloca=__builtin_alloca
CFLAGS  = -DHAVE_CONFIG_H -I. -I.. -I../include
RANLIB  = ranlib
INSTALL = copy

.SUFFIXES:
.SUFFIXES: .c .o .op
.c.o:
	$(CC) -ansi -pedantic $(CFLAGS) -c $<
.c.op:
	$(CC) -ansi $(CFLAGS) -pg -c -o$@ $<

############################################################################

SOURCES  = anadiff.c version.h

DOCFILES = anadiff.info anadiff.html anadiff.txt anadiff.dos anadiff.mac
TESTS    = a b c
#
# 386 mode AnaDiff program
#
LIBS = ../lib/libopac.a ../lib/libcport.a
OBJ  = anadiff.o

anadiff.exe: $(OBJ) $(LIBS)
	$(CC) -o anadiff $(OBJ) $(LIBS)
	@copy anadiff. a.out >nul
	strip anadiff.
	stubify anadiff
	@del anadiff. >nul
	@ren a.out anadiff. >nul
#
# 386 mode AnaDiff program compiled for profiling
#
LIBSP = ../lib/libopa_p.a ../lib/libcpo_p.a
OBJP  = anadiff.op

anadiffp.exe: $(OBJP) $(LIBSP)
	$(CC) -pg -o anadiffp $(OBJP) $(LIBSP)
	@copy anadiffp. a.out >nul
	strip anadiffp.
	stubify anadiffp
	@del anadiffp. >nul
	@ren a.out anadiffp. >nul
#
#  sources unique to the ANADIFF program
#
anadiff.o anadiff.op:  anadiff.c version.h

############################################################################

libs profile_libs: installdirs

installdirs:
	-@if not exist ..\include\*.* md ..\include >nul
	-@if not exist ..\lib\*.*     md ..\lib >nul
	-@if not exist $(BINDIR)\*.*  md $(BINDIR) >nul

all: anadiff.exe

profile: profile_libs anadiffp.exe

install: all
	$(INSTALL) anadiff.exe $(BINDIR)\anadiff.exe >nul

uninstall:
	if exist $(BINDIR)\anadiff.exe del $(BINDIR)\anadiff.exe >nul

check: anadiff.exe
	-@check $(TESTS)

mostlyclean:
	-if exist *.o* del *.o* >nul
	-@if exist *.c~ del *.c~ >nul
	-@if exist *.h~ del *.h~ >nul

clean: mostlyclean
	-@if exist *.aux del *.aux >nul
	-@if exist *.log del *.log >nul
	-@if exist *.toc del *.toc >nul
	-@if exist *.cp* del *.cp* >nul
	-@if exist *.fn* del *.fn* >nul
	-@if exist *.ky* del *.ky* >nul
	-@if exist *.pg* del *.pg* >nul
	-@if exist *.tp* del *.tp* >nul
	-@if exist *.vr* del *.vr* >nul

distclean: clean
	-if exist *.exe del *.exe >nul
	-if exist makefile. del makefile. >nul
	-@if exist TAGS. del TAGS. >nul
	-@if exist *.dvi del *.dvi >nul
	-@if exist anadiff. del anadiff. >nul
	-@if exist anadiffp. del anadiffp. >nul

maintainer-clean: distclean
	-@if exist anadiff.info del anadiff.info >nul
	-@if exist anadiff.html del anadiff.html >nul
	-@if exist anadiff.txt del anadiff.txt >nul
	-@if exist anadiff.dos del anadiff.dos >nul
	-@if exist anadiff.mac del anadiff.mac >nul

TAGS: $(SOURCES)
	etags $(SOURCES)

doc dvi html info:
	@if exist ..\doc\anadiff.txi  cd ..\doc
	@if exist anadiff.txi         @$(MAKE) anadiff$@
	@if exist anadiff.txi         cd ..\anadiff

dist testdist:
	@echo this target does not work on MS-DOS
	@echo you need some variant of Unix (SunOS, Linux, ...) to "make $@"

############################################################################

.PHONY: all check clean dist distclean doc dvi html info install \
		libs maintainer-clean mostlyclean profile profile_libs testdist \
		uninstall installdirs
