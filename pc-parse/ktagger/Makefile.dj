# MS-DOS Makefile for the KTAGGER program
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

SOURCES = ktagger.c version.h

DOCFILES  = ktagger.info ktagger.html ktagger.txt ktagger.dos ktagger.mac
#
#  386 mode KTAGGER program
#
LIBS = ../lib/libkimmo.a ../lib/libpatr.a ../lib/libcmd.a \
	   ../lib/libopac.a ../lib/libcport.a
OBJ  = ktagger.o

ktagger.exe: $(OBJ) $(LIBS)
	$(CC) -o ktagger $(OBJ) $(LIBS)
	@copy ktagger a.out >nul
	strip ktagger
	stubify ktagger
	@del ktagger. >nul
	@ren a.out ktagger >nul
#
#  386 mode KTAGGER program compiled for profiling
#
LIBSP = ../lib/libkim_p.a ../lib/libpat_p.a ../lib/libcmd_p.a \
		../lib/libopa_p.a ../lib/libcpo_p.a
OBJP  = ktagger.op

ktaggerp.exe: $(OBJP) $(LIBSP)
	$(CC) -pg -o ktaggerp $(OBJP) $(LIBSP)
	@copy ktaggerp a.out >nul
	strip ktaggerp
	stubify ktaggerp
	@del ktaggerp. >nul
	@ren a.out ktaggerp >nul
#
#  sources unique to the KTAGGER program
#
ktagger.o   ktagger.op:   ktagger.c version.h

#############################################################################

libs profile_libs: installdirs

installdirs:
	-@if not exist ..\include\*.* md ..\include >nul
	-@if not exist ..\lib\*.*     md ..\lib >nul
	-@if not exist $(BINDIR)\*.*  md $(BINDIR) >nul

all: libs ktagger.exe

profile: profile_libs ktaggerp.exe

install: all
	$(INSTALL) ktagger.exe $(BINDIR)\ktagger.exe >nul

uninstall:
	-if exist $(BINDIR)\ktagger.exe del $(BINDIR)\ktagger.exe >nul

check: ktagger.exe
	-@check eng

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
	-@if exist ktagger. del ktagger. >nul
	-@if exist ktaggerp. del ktaggerp. >nul

maintainer-clean: distclean
	-@if exist ktagger.info del ktagger.info >nul
	-@if exist ktagger.html del ktagger.html >nul
	-@if exist ktagger.txt del ktagger.txt >nul
	-@if exist ktagger.dos del ktagger.dos >nul
	-@if exist ktagger.mac del ktagger.mac >nul

TAGS: $(SOURCES)
	etags $(SOURCES)

doc dvi html info:
	@if exist ..\doc\ktagger.txi  cd ..\doc
	@if exist ktagger.txi         @$(MAKE) ktagger$@
	@if exist ktagger.txi         cd ..\ktagger

dist testdist:
	@echo this target does not work on MS-DOS
	@echo you need some variant of Unix (SunOS, Linux, ...) to "make $@"

############################################################################

.PHONY: all check clean dist distclean doc dvi html info install \
		libs maintainer-clean mostlyclean profile profile_libs testdist \
		uninstall installdirs
