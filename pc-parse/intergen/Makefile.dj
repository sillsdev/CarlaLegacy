# MS-DOS Makefile for the INTERGEN program
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

SOURCES  = intergen.c version.h

DOCFILES = intergen.info intergen.html intergen.txt intergen.dos intergen.mac
TESTS    = ae ck cq cz hg sb
#
# 386 mode Intergen program
#
LIBS = ../lib/libopac.a ../lib/libcport.a
OBJ  = intergen.o

intergen.exe: $(OBJ) $(LIBS)
	$(CC) -o intergen $(OBJ) $(LIBS)
	@copy intergen. a.out >nul
	strip intergen.
	stubify intergen
	@del intergen. >nul
	@ren a.out intergen. >nul
#
# 386 mode Intergen program compiled for profiling
#
LIBSP = ../lib/libopa_p.a ../lib/libcpo_p.a
OBJP  = intergen.op

interg_p.exe: $(OBJP) $(LIBSP)
	$(CC) -pg -o interg_p $(OBJP) $(LIBSP)
	@copy interg_p. a.out >nul
	strip interg_p.
	stubify interg_p
	@del interg_p. >nul
	@ren a.out interg_p. >nul
#
#  sources unique to the INTERGEN program
#
intergen.o intergen.op:  intergen.c version.h

############################################################################

libs profile_libs: installdirs

installdirs:
	-@if not exist ..\include\*.* md ..\include >nul
	-@if not exist ..\lib\*.*     md ..\lib >nul
	-@if not exist $(BINDIR)\*.*  md $(BINDIR) >nul

all: intergen.exe

profile: profile_libs interg_p.exe

install: all
	$(INSTALL) intergen.exe $(BINDIR)\intergen.exe >nul

uninstall:
	if exist $(BINDIR)\intergen.exe del $(BINDIR)\intergen.exe >nul

check: intergen.exe
	-@check $(TESTS)

mostlyclean:
	-if exist *.o* del *.o* >nul
	-@if exist *.c~ del *.c~ >nul
	-@if exist *.h~ del *.h~ >nul

clean: mostlyclean

distclean: clean
	-if exist *.exe del *.exe >nul
	-if exist makefile. del makefile. >nul
	-@if exist TAGS. del TAGS. >nul
	-@if exist intergen. del intergen. >nul
	-@if exist interg_p. del interg_p. >nul

maintainer-clean: distclean

TAGS: $(SOURCES)
	etags $(SOURCES)

doc dvi html info:
	@if exist ..\doc\intergen.txi  cd ..\doc
	@if exist intergen.txi         @$(MAKE) intergen$@
	@if exist intergen.txi         cd ..\intergen

dist testdist:
	@echo this target does not work on MS-DOS
	@echo you need some variant of Unix (SunOS, Linux, ...) to "make $@"

############################################################################

.PHONY: all check clean dist distclean doc dvi html info install \
		libs maintainer-clean mostlyclean profile profile_libs testdist \
		uninstall installdirs
