# MS-DOS makefile for the C Portability function library
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

SOURCES = abs.c      bcmp.c     bcopy.c    bsearch.c  bzero.c    ccommand.c \
	  concat.c   cpystr.c   ctermid.c  ffs.c      fgetss.c   fputss.c   \
	  fsize.c    getopt.c   index.c    iscntrl.c  isgraph.c  isodigit.c \
	  ispunct.c  itoa.c     itoa8.c    itoax.c    labs.c     memccpy.c  \
	  memchr.c   memcmp.c   memcpy.c   memmove.c  memset.c   rand.c     \
	  rindex.c   strcasec.c strchr.c   strcspn.c  streq.c    stricmp.c  \
	  strlwr.c   strpbrk.c  strpos.c   strrchr.c  strrpbrk.c strrpos.c  \
	  strspn.c   strstr.c   strtok.c   strtol.c   strtoul.c  strupr.c   \
	  swapmem.c  toint.c    tolower.c  toupper.c  zapnl.c    \
		  cportlib.h

DOCFILES = cportlib.info cportlib.html cportlib.txt cportlib.dos cportlib.mac
#
# build the 386 mode library
#
OBJS = ccommand.o concat.o   cpystr.o   fgetss.o   fputss.o   fsize.o    \
	   isodigit.o streq.o    swapmem.o  toint.o    zapnl.o    ctermid.o  \
	   strpos.o   strrpbrk.o strrpos.o

libcport.a: $(OBJS)
	-@if exist libcport.a del libcport.a >nul
	ar rc libcport.a $(OBJS)
	$(RANLIB) libcport.a
#
# build the 386 mode profiling library
#
OBJSP=ccommand.op concat.op   cpystr.op   fgetss.op   fputss.op   fsize.op    \
	  isodigit.op streq.op    swapmem.op  toint.op    zapnl.op    ctermid.op  \
	  strpos.op   strrpbrk.op strrpos.op

libcpo_p.a: $(OBJSP)
	-del libcpo_p.a
	ar rc libcpo_p.a $(OBJSP)
	$(RANLIB) libcpo_p.a
#
# ANSI C functions
#
abs.o      abs.op:      abs.c
bsearch.o  bsearch.op:  bsearch.c
iscntrl.o  iscntrl.op:  iscntrl.c
isgraph.o  isgraph.op:  isgraph.c
ispunct.o  ispunct.op:  ispunct.c
labs.o     labs.op:     labs.c
memccpy.o  memccpy.op:  memccpy.c
memchr.o   memchr.op:   memchr.c
memcmp.o   memcmp.op:   memcmp.c
memcpy.o   memcpy.op:   memcpy.c
memmove.o  memmove.op:  memmove.c
memset.o   memset.op:   memset.c
rand.o     rand.op:     rand.c
strchr.o   strchr.op:   strchr.c
strcspn.o  strcspn.op:  strcspn.c
strpbrk.o  strpbrk.op:  strpbrk.c
strrchr.o  strrchr.op:  strrchr.c
strspn.o   strspn.op:   strspn.c
strtok.o   strtok.op:   strtok.c
strtol.o   strtol.op:   strtol.c
strtoul.o  strtoul.op:  strtoul.c
tmpnam.o   tmpnam.op:   tmpnam.c
tolower.o  tolower.op:  tolower.c
toupper.o  toupper.op:  toupper.c
#
# Unix C functions
#
bcmp.o     bcmp.op:     bcmp.c
bcopy.o    bcopy.op:    bcopy.c
bzero.o    bzero.op:    bzero.c
ctermid.o  ctermid.op:  ctermid.c
ffs.o      ffs.op:      ffs.c
getopt.o   getopt.op:   getopt.c
index.o    index.op:    index.c
rindex.o   rindex.op:   rindex.c
strcasec.o strcasec.op: strcasec.c
tempnam.o  tempnam.op:  tempnam.c
#
# other C functions
#
ccommand.o ccommand.op: ccommand.c
concat.o   concat.op:   concat.c
cpystr.o   cpystr.op:   cpystr.c
fgetss.o   fgetss.op:   fgetss.c
fputss.o   fputss.op:   fputss.c

fsize.o: fsize.c
	$(CC) $(CFLAGS) -c fsize.c
fsize.op: fsize.c
	$(CC) $(CFLAGS) -pg -c fsize.c -o$@

isodigit.o isodigit.op: isodigit.c
itoa.o     itoa.op:     itoa.c
itoa8.o    itoa8.op:    itoa8.c
itoax.o    itoax.op:    itoax.c
streq.o    streq.op:    streq.c
stricmp.o  stricmp.op:  stricmp.c
strlwr.o   strlwr.op:   strlwr.c
strpos.o   strpos.op:   strpos.c
strrpbrk.o strrpbrk.op: strrpbrk.c
strrpos.o  strrpos.op:  strrpos.c
strstr.o   strstr.op:   strstr.c
strupr.o   strupr.op:   strupr.c
swapmem.o  swapmem.op:  swapmem.c
toint.o    toint.op:    toint.c
zapnl.o    zapnl.op:    zapnl.c

############################################################################

libs: installdirs ../include/cportlib.h ../lib/libcport.a

profile_libs: installdirs ../include/cportlib.h ../lib/libcpo_p.a

installdirs:
	-@if not exist ..\include\*.* md ..\include >nul
	-@if not exist ..\lib\*.*     md ..\lib >nul
	-@if not exist $(BINDIR)\*.*  md $(BINDIR) >nul

../include/cportlib.h: cportlib.h
	$(INSTALL) cportlib.h ..\include >nul
../lib/libcport.a: libcport.a
	$(INSTALL) libcport.a ..\lib >nul
../lib/libcpo_p.a: libcpo_p.a
	$(INSTALL) libcpo_p.a ..\lib >nul

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
	-@if exist cportlib.info del cportlib.info >nul
	-@if exist cportlib.html del cportlib.html >nul
	-@if exist cportlib.txt del cportlib.txt >nul
	-@if exist cportlib.dos del cportlib.dos >nul
	-@if exist cportlib.mac del cportlib.mac >nul

TAGS: $(SOURCES)
	etags $(SOURCES)

doc dvi html info:
	@if exist ..\doc\cportlib.txi  cd ..\doc
	@if exist cportlib.txi         @$(MAKE) cportlib$@
	@if exist cportlib.txi         cd ..\cportlib

dist testdist:
	@echo this target does not work on MS-DOS
	@echo you need some variant of Unix (SunOS, Linux, ...) to "make $@"

############################################################################

.PHONY: all check clean dist distclean doc dvi html info install \
		libs maintainer-clean mostlyclean profile profile_libs testdist \
		uninstall installdirs
