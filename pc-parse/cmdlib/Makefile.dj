# MS-DOS Makefile for the CMD (interactive command) function library
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

SOURCES = cmd.c      cmdcd.c    cmddata.c  cmddir.c   cmdedit.c  cmdlog.c   \
		  cmdsig.c   cmdtime.c  messages.c setcmdfi.c cmdsys.c   wanthelp.c \
		  cmd.h

DOCFILES = cmdlib.info cmdlib.html cmdlib.txt cmdlib.dos cmdlib.mac
#
# 386 mode CMD function library
#
OBJ=cmd.o      cmdcd.o    cmddir.o   cmdedit.o  cmdsys.o   cmdlog.o   \
	cmdsig.o   cmdtime.o  setcmdfi.o wanthelp.o \
	cmddata.o  messages.o

libcmd.a: $(OBJ)
	-del libcmd.a
	ar rc libcmd.a $(OBJ)
	$(RANLIB) libcmd.a
#
# 386 mode CMD function library compiled for profiling
#
OBJP=cmd.op      cmdcd.op    cmddir.op   cmdedit.op  cmdsys.op   cmdlog.op  \
	 cmdsig.op   cmdtime.op  setcmdfi.op wanthelp.op \
	 cmddata.op  messages.op

libcmd_p.a: $(OBJP)
	-del libcmd_p.a
	ar rc libcmd_p.a $(OBJP)
	$(RANLIB) libcmd_p.a
#
# sources shared as a library
#
cmd.o      cmd.op:      cmd.c      cmd.h
cmddata.o  cmddata.op:  cmddata.c  cmd.h
cmddir.o   cmddir.op:   cmddir.c   cmd.h
cmdedit.o  cmdedit.op:  cmdedit.c  cmd.h
cmdlog.o   cmdlog.op:   cmdlog.c   cmd.h
cmdsig.o   cmdsig.op:   cmdsig.c   cmd.h
cmdsys.o   cmdsys.op:   cmdsys.c   cmd.h
messages.o messages.op: messages.c cmd.h
setcmdfi.o setcmdfi.op: setcmdfi.c cmd.h
wanthelp.o wanthelp.op: wanthelp.c cmd.h
#
#  the following files don't like strict ANSI C
#
cmdcd.o:    cmdcd.c    cmd.h
	$(CC) $(CFLAGS) -c -o$@ $<
cmdcd.op:   cmdcd.c    cmd.h
	$(CC) $(CFLAGS) -pg -c -o$@ $<
cmdtime.o:  cmdtime.c  cmd.h
	$(CC) $(CFLAGS) -c -o$@ $<
cmdtime.op:  cmdtime.c  cmd.h
	$(CC) $(CFLAGS) -pg -c -o$@ $<

############################################################################

libs: installdirs ../include/cmd.h ../lib/libcmd.a

profile_libs: installdirs ../include/cmd.h ../lib/libcmd_p.a

installdirs:
	-@if not exist ..\include\*.* md ..\include >nul
	-@if not exist ..\lib\*.*     md ..\lib >nul
	-@if not exist $(BINDIR)\*.*  md $(BINDIR) >nul

../include/cmd.h: cmd.h
	$(INSTALL) cmd.h ..\include >nul

../lib/libcmd.a: libcmd.a
	$(INSTALL) libcmd.a ..\lib >nul
../lib/libcmd_p.a: libcmd_p.a
	$(INSTALL) libcmd_p.a ..\lib >nul

all install: libs

profile: profile_libs

uninstall:

check:

mostlyclean:
	-if exist *.o* del *.o* >nul
	-@if exist *.c~ del *.c~ >nul
	-@if exist *.h~ del *.h~ >nul

clean: mostlyclean
	-if exist lib*.a del lib*.a >nul
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
	-if exist makefile. del makefile. >nul
	-@if exist TAGS. del TAGS. >nul
	-@if exist *.dvi del *.dvi >nul

maintainer-clean: distclean
	-@if exist cmdlib.info del cmdlib.info >nul
	-@if exist cmdlib.html del cmdlib.html >nul
	-@if exist cmdlib.txt del cmdlib.txt >nul
	-@if exist cmdlib.dos del cmdlib.dos >nul
	-@if exist cmdlib.mac del cmdlib.mac >nul

TAGS: $(SOURCES)
	etags $(SOURCES)

doc dvi html info:
	@if exist ..\doc\cmdlib.txi  cd ..\doc
	@if exist cmdlib.txi         @$(MAKE) cmdlib$@
	@if exist cmdlib.txi         cd ..\cmdlib

dist testdist:
	@echo this target does not work on MS-DOS
	@echo you need some variant of Unix (SunOS, Linux, ...) to "make $@"

############################################################################

.PHONY: all check clean dist distclean doc dvi html info install \
		libs maintainer-clean mostlyclean profile profile_libs testdist \
		uninstall installdirs
