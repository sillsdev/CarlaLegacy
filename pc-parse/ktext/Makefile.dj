# MS-DOS Makefile for the KTEXT program
# GNU C / GNU make (DJGPP 2.01)
# Steve McConnel, 25-Sep-1998

# directory where executable programs are stored
# (this is the only line that you should need to customize)
BINDIR=c:\sil

CC      = gcc -g -O2 -Wall -Dalloca=__builtin_alloca
CFLAGS  = -DHAVE_CONFIG_H -I. -I.. -I../include
RANLIB  = ranlib
INSTALL = copy
SED     = sed

.SUFFIXES:
.SUFFIXES: .c .o .op
.c.o:
	$(CC) -ansi -pedantic $(CFLAGS) -c $<
.c.op:
	$(CC) -ansi $(CFLAGS) -pg -c -o$@ $<

############################################################################

SOURCES = ktext.c version.h

DOCFILES = ktext.info ktext.html eng.gif ktext.txt ktext.dos ktext.mac
#
#  386 mode KTEXT program
#
LIBS = ../lib/libkimmo.a ../lib/libpatr.a ../lib/libcmd.a \
	   ../lib/libopac.a ../lib/libcport.a
OBJ  = ktext.o

ktext.exe: $(OBJ) $(LIBS)
	$(CC) -o ktext $(OBJ) $(LIBS)
	@copy ktext a.out >nul
	strip ktext
	stubify ktext
	@del ktext. >nul
	@ren a.out ktext >nul
#
#  386 mode KTEXT program compiled for profiling
#
LIBSP = ../lib/libkim_p.a ../lib/libpat_p.a ../lib/libcmd_p.a \
		../lib/libopa_p.a ../lib/libcpo_p.a
OBJP  = ktext.op

ktextp.exe: $(OBJP) $(LIBSP)
	$(CC) -pg -o ktextp $(OBJP) $(LIBSP)
	@copy ktextp a.out >nul
	strip ktextp
	stubify ktext
	@del ktextp. >nul
	@ren a.out ktextp >nul
#
#  sources unique to the KTEXT program
#
ktext.o    ktext.op:    ktext.c   version.h

#############################################################################

libs profile_libs: installdirs

installdirs:
	-@if not exist ..\include\*.* md ..\include >nul
	-@if not exist ..\lib\*.*     md ..\lib >nul
	-@if not exist $(BINDIR)\*.*  md $(BINDIR) >nul

all: libs ktext.exe

profile: profile_libs ktextp.exe

install: all
	$(INSTALL) ktext.exe $(BINDIR)\ktext.exe >nul

uninstall:
	if exist $(BINDIR)\ktext.exe del $(BINDIR)\ktext.exe >nul

check: ktext.exe
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
	-@if exist ktext. del ktext. >nul
	-@if exist ktextp. del ktextp. >nul

maintainer-clean: distclean
	-@if exist ktext.info del ktext.info >nul
	-@if exist ktext.html del ktext.html >nul
	-@if exist ktext.txt del ktext.txt >nul
	-@if exist ktext.dos del ktext.dos >nul
	-@if exist ktext.mac del ktext.mac >nul

TAGS: $(SOURCES)
	etags $(SOURCES)

doc dvi html info:
	@if exist ..\doc\ktext.txi  cd ..\doc
	@if exist ktext.txi         @$(MAKE) ktext$@
	@if exist ktext.txi         cd ..\ktext

dist testdist:
	@echo this target does not work on MS-DOS
	@echo you need some variant of Unix (SunOS, Linux, ...) to "make $@"

############################################################################

.PHONY: all check clean dist distclean doc dvi html info install \
		libs maintainer-clean mostlyclean profile profile_libs testdist \
		uninstall installdirs
