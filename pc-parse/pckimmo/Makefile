# MS-DOS Makefile for the PC-KIMMO library and programs
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

SOURCES = convlex.c  generate.c lexicon.c  pckfuncs.c pckimmo.c  pckimmo2.c \
		  pckimmo3.c recogniz.c rules.c    synthesi.c kimmdata.c \
		  kimmo.h    kimmodef.h version.h  pckimmo.h

DOCFILES = kimmolib.info kimmolib.html kimmolib.txt kimmolib.dos kimmolib.mac \
		   pckimmo.info pckimmo.html pckimmo.txt pckimmo.dos pckimmo.mac
#
#  386 mode PC-Kimmo program and function library
#
LIBS = ../lib/libpatr.a ../lib/libcmd.a ../lib/libopac.a ../lib/libcport.a
OBJ  = pckimmo.o pckimmo2.o pckimmo3.o libkimmo.a
LIBO = lexicon.o  rules.o   generate.o recogniz.o synthesi.o pckfuncs.o \
	   kimmdata.o

pckimmo.exe: $(OBJ) $(LIBS)
	$(CC) -o pckimmo $(OBJ) $(LIBS)
	@copy pckimmo a.out >nul
	strip pckimmo
	stubify pckimmo
	@del pckimmo. >nul
	@ren a.out pckimmo >nul

libkimmo.a: $(LIBO)
	@if exist libkimmo.a del libkimmo.a
	ar rc libkimmo.a $(LIBO)
	$(RANLIB) libkimmo.a
#
#  386 mode PC-Kimmo program and function library compiled for profiling
#
LIBSP=../lib/libpat_p.a ../lib/libcmd_p.a ../lib/libopa_p.a ../lib/libcpo_p.a
OBJP =pckimmo.op  pckimmo2.op pckimmo3.op libkim_p.a
LIBOP=lexicon.op  rules.op    generate.op recogniz.op synthesi.op pckfuncs.op \
	  kimmdata.op

pckimmop.exe: $(OBJP) $(LIBSP)
	$(CC) -pg -o pckimmop $(OBJP) $(LIBSP)
	@copy pckimmop a.out >nul
	strip pckimmop
	stubify pckimmop
	@del pckimmop. >nul
	@ren a.out pckimmop >nul

libkim_p.a: $(LIBOP)
	@if exist libkim_p.a del libkim_p.a
	ar rc libkim_p.a $(LIBOP)
	$(RANLIB) libkim_p.a
#
# sources unique to PC-KIMMO (user interface code)
#
pckimmo.o  pckimmo.op:  pckimmo.c  kimmo.h ../include/patr.h pckimmo.h
pckimmo2.o pckimmo2.op: pckimmo2.c kimmo.h ../include/patr.h pckimmo.h
pckimmo3.o pckimmo3.op: pckimmo3.c kimmo.h ../include/patr.h pckimmo.h
#
# sources shared with other programs as a function library
#
generate.o generate.op: generate.c kimmo.h
lexicon.o  lexicon.op:  lexicon.c  kimmo.h ../include/patr.h
pckfuncs.o pckfuncs.op: pckfuncs.c kimmo.h ../include/patr.h
recogniz.o recogniz.op: recogniz.c kimmo.h ../include/patr.h
synthesi.o synthesi.op: synthesi.c kimmo.h ../include/patr.h
rules.o    rules.op:    rules.c    kimmo.h ../include/patr.h
kimmdata.o kimmdata.op: $(SOURCES)
#
#  386 mode ConvLex program
#
convlex.exe: convlex.o
	$(CC) -o convlex -g convlex.o
	@copy convlex a.out >nul
	strip convlex
	stubify convlex
	@del convlex. >nul
	@ren a.out convlex
#
#  386 mode ConvLex program compiled for profiling
#
convlexp.exe: convlex.op
	$(CC) -pg -o convlexp convlex.op
	@copy convlexp a.out >nul
	strip convlexp
	stubify convlexp
	@del convlexp. >nul
	@ren a.out convlexp
#
#  sources unique to the ConvLex program
#
convlex.o convlex.op: convlex.c

#############################################################################

libs: installdirs ../include/kimmo.h ../lib/libkimmo.a

profile_libs: installdirs ../include/kimmo.h ../lib/libkim_p.a

installdirs:
	-@if not exist ..\include\*.* md ..\include >nul
	-@if not exist ..\lib\*.*     md ..\lib >nul
	-@if not exist $(BINDIR)\*.*  md $(BINDIR) >nul

../include/kimmo.h: kimmo.h
	$(INSTALL) kimmo.h ..\include\kimmo.h >nul

../lib/libkimmo.a: libkimmo.a
	$(INSTALL) libkimmo.a ..\lib\libkimmo.a >nul
../lib/libkim_p.a: libkim_p.a
	$(INSTALL) libkim_p.a ..\lib\libkim_p.a >nul
all: libs pckimmo.exe convlex.exe

profile: profile_libs pckimmop.exe convlexp.exe

install: all
	@$(INSTALL) pckimmo.exe $(BINDIR)\pckimmo.exe >nul
	@$(INSTALL) convlex.exe $(BINDIR)\convlex.exe >nul

uninstall:
	-if exist $(BINDIR)\pckimmo.exe del $(BINDIR)\pckimmo.exe >nul
	-if exist $(BINDIR)\convlex.exe del $(BINDIR)\convlex.exe >nul

check: pckimmo.exe
	-@check eng

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
	-if exist *.exe del *.exe >nul
	-if exist makefile. del makefile. >nul
	-@if exist TAGS. del TAGS. >nul
	-@if exist *.dvi del *.dvi >nul
	-@if exist pckimmo. del pckimmo. >nul
	-@if exist pckimmop. del pckimmop. >nul
	-@if exist convlex. del convlex. >nul

maintainer-clean: distclean
	-@if exist kimmolib.info del kimmolib.info >nul
	-@if exist kimmolib.html del kimmolib.html >nul
	-@if exist kimmolib.txt del kimmolib.txt >nul
	-@if exist kimmolib.dos del kimmolib.dos >nul
	-@if exist kimmolib.mac del kimmolib.mac >nul
	-@if exist pckimmo.info del pckimmo.info >nul
	-@if exist pckimmo.html del pckimmo.html >nul
	-@if exist pckimmo.txt del pckimmo.txt >nul
	-@if exist pckimmo.dos del pckimmo.dos >nul
	-@if exist pckimmo.mac del pckimmo.mac >nul

TAGS: $(SOURCES)
	etags $(SOURCES)

doc dvi html info:
	@if exist ..\doc\pckimmo.txi  cd ..\doc
	@if exist pckimmo.txi         @$(MAKE) kimmo$@
	@if exist pckimmo.txi         cd ..\pckimmo

dist testdist:
	@echo this target does not work on MS-DOS
	@echo you need some variant of Unix (SunOS, Linux, ...) to "make $@"

############################################################################

.PHONY: all check clean dist distclean doc dvi html info install \
		libs maintainer-clean mostlyclean profile profile_libs testdist \
		uninstall installdirs
