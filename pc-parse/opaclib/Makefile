# MS-DOS makefile for the OPAC function library
# GNU C / GNU make (DJGPP 2.01)
# Steve McConnel, 25-Apr-2000

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

SOURCES = add_sl.c   adjfname.c ambprog.c  appnd_sl.c cat_sl.c   tokenize.c \
		  change.c   copy_sl.c  dtbin.c    dtbout.c   equal_sl.c equiv_sl.c \
		  erasecha.c errcheck.c free_sl.c  free_wt.c  isolatew.c numbrmsg.c \
		  loadintx.c loadoutx.c membr_sl.c merge_sl.c allocmem.c myctype.c  \
		  promptus.c readfiel.c readline.c record.c   resetxtc.c rmstr_sl.c \
		  rpterror.c rptmessg.c rptprgrs.c safeexit.c senttemp.c size_sl.c  \
		  sqz_sl.c   strcla.c   textin.c   textout.c  trie.c     trimspac.c \
		  unlst_sl.c updat_sl.c write_sl.c matchbeg.c matchend.c ufopen.c   \
		  fulldisk.c free_ct.c  write_ct.c wordanal.c dynstr.c   cma.c      \
		  change.h   allocmem.h opaclib.h  record.h   rpterror.h strclass.h \
		  strlist.h  template.h textctl.h  trie.h     dynstr.h

DOCFILES = opaclib.info opaclib.html opaclib.txt opaclib.dos opaclib.mac
#
# 386 mode OPAC function library
#
OBJ=myctype.o  allocmem.o dtbin.o    free_wt.o  resetxtc.o tokenize.o \
	record.o   strcla.o   isolatew.o change.o   dtbout.o   textin.o   \
	trie.o     promptus.o textout.o  loadintx.o loadoutx.o add_sl.o   \
	appnd_sl.o cat_sl.o   copy_sl.o  equal_sl.o equiv_sl.o free_sl.o  \
	membr_sl.o merge_sl.o rmstr_sl.o size_sl.o  sqz_sl.o   write_sl.o \
	rpterror.o rptmessg.o rptprgrs.o erasecha.o readfiel.o errcheck.o \
	numbrmsg.o adjfname.o ambprog.o  unlst_sl.o updat_sl.o safeexit.o \
	senttemp.o readline.o trimspac.o matchbeg.o matchend.o ufopen.o   \
	fulldisk.o free_ct.o  write_ct.o wordanal.o dynstr.o

libopac.a: $(OBJ)
	-del libopac.a
	ar rc libopac.a $(OBJ)
	$(RANLIB) libopac.a
#
#  386 mode OPAC library compiled for profiling
#
OBJP=myctype.op  allocmem.op dtbin.op    free_wt.op  resetxtc.op tokenize.op \
	 record.op   strcla.op   isolatew.op change.op   dtbout.op   textin.op   \
	 trie.op     promptus.op textout.op  loadintx.op loadoutx.op add_sl.op   \
	 appnd_sl.op cat_sl.op   copy_sl.op  equal_sl.op equiv_sl.op free_sl.op  \
	 membr_sl.op merge_sl.op rmstr_sl.op size_sl.op  sqz_sl.op   write_sl.op \
	 rpterror.op rptmessg.op rptprgrs.op erasecha.op readfiel.op errcheck.op \
	 numbrmsg.op adjfname.op ambprog.op  unlst_sl.op updat_sl.op safeexit.op \
	 senttemp.op readline.op trimspac.op matchbeg.op matchend.op ufopen.op   \
	 fulldisk.op free_ct.op  write_ct.op wordanal.op dynstr.op

libopa_p.a: $(OBJP)
	-del libopa_p.a
	ar rc libopa_p.a $(OBJP)
	$(RANLIB) libopa_p.a
#
#  sources shared as a library
#
change.o   change.op:   change.c   allocmem.h textctl.h \
								   strclass.h strlist.h change.h rpterror.h
myctype.o  myctype.op:  myctype.c  textctl.h allocmem.h
allocmem.o allocmem.op: allocmem.c allocmem.h rpterror.h
dtbin.o    dtbin.op:    dtbin.c    template.h strlist.h record.h \
								   allocmem.h
free_wt.o  free_wt.op:  free_wt.c  template.h strlist.h allocmem.h
isolatew.o isolatew.op: isolatew.c
record.o   record.op:   record.c   allocmem.h record.h
strcla.o   strcla.op:   strcla.c   allocmem.h textctl.h \
								   rpterror.h strclass.h strlist.h
textin.o   textin.op:   textin.c   allocmem.h textctl.h \
								   template.h strlist.h change.h
dtbout.o   dtbout.op:   dtbout.c   strlist.h template.h
myctype.o  myctype.op:  myctype.c  textctl.h allocmem.h rpterror.h
add_sl.o   add_sl.op:   add_sl.c   strlist.h allocmem.h
appnd_sl.o appnd_sl.op: appnd_sl.c strlist.h allocmem.h
cat_sl.o   cat_sl.op:   cat_sl.c   strlist.h allocmem.h
copy_sl.o  copy_sl.op:  copy_sl.c  strlist.h allocmem.h
equal_sl.o equal_sl.op: equal_sl.c strlist.h
equiv_sl.o equiv_sl.op: equiv_sl.c strlist.h
free_sl.o  free_sl.op:  free_sl.c  strlist.h allocmem.h
membr_sl.o membr_sl.op: membr_sl.c strlist.h
merge_sl.o merge_sl.op: merge_sl.c strlist.h allocmem.h
rmstr_sl.o rmstr_sl.op: rmstr_sl.c strlist.h allocmem.h
size_sl.o  size_sl.op:  size_sl.c  strlist.h
sqz_sl.o   sqz_sl.op:   sqz_sl.c   strlist.h allocmem.h
write_sl.o write_sl.op: write_sl.c strlist.h
unlst_sl.o unlst_sl.op: unlst_sl.c strlist.h allocmem.h
updat_sl.o updat_sl.op: updat_sl.c strlist.h allocmem.h
trie.o     trie.op:     trie.c     allocmem.h trie.h rpterror.h
textout.o  textout.op:  textout.c  allocmem.h textctl.h \
								   template.h strlist.h change.h
loadintx.o loadintx.op: loadintx.c allocmem.h textctl.h \
								   rpterror.h strclass.h strlist.h \
								   record.h template.h change.h
loadoutx.o loadoutx.op: loadoutx.c record.h rpterror.h \
								   strclass.h strlist.h textctl.h \
								   template.h change.h
resetxtc.o resetxtc.op: resetxtc.c allocmem.h textctl.h \
								   rpterror.h strclass.h strlist.h \
								   record.h template.h change.h
rpterror.o rpterror.op: rpterror.c rpterror.h
rptmessg.o rptmessg.op: rptmessg.c rpterror.h
numbrmsg.o numbrmsg.op: numbrmsg.c rpterror.h
rptprgrs.o rptprgrs.op: rptprgrs.c
erasecha.o erasecha.op: erasecha.c
readfiel.o readfiel.op: readfiel.c allocmem.h
readline.o readline.op: readline.c allocmem.h
adjfname.o adjfname.op: adjfname.c allocmem.h
ambprog.o  ambprog.op:  ambprog.c
trimspac.o trimspac.op: trimspac.c
safeexit.o safeexit.op: safeexit.c
senttemp.o senttemp.op: senttemp.c template.h allocmem.h \
								   rpterror.h
matchbeg.o matchbeg.op: matchbeg.c
matchend.o matchend.op: matchend.c
fulldisk.o fulldisk.op: fulldisk.c
tokenize.o tokenize.op: tokenize.c
free_ct.o  free_ct.op:  free_ct.c  record.h allocmem.h
write_ct.o write_ct.op: write_ct.c record.h
wordanal.o wordanal.op: wordanal.c template.h textctl.h change.h strclass.h \
								   strlist.h allocmem.h
dynstr.o   dynstr.op:   dynstr.c   dynstr.h allocmem.h
#
# these files don't always like strict ANSI C compliance
#
promptus.o:   promptus.c
	$(CC) $(CFLAGS) -c -o$@ promptus.c
promptus.op:  promptus.c
	$(CC) $(CFLAGS) -pg -c -o$@ promptus.c

errcheck.o: errcheck.c rpterror.h
	$(CC) $(CFLAGS) -c -o$@ $<
errcheck.op: errcheck.c rpterror.h
	$(CC) $(CFLAGS) -pg -c -o$@ $<

ufopen.o: ufopen.c
	$(CC) $(CFLAGS) -c -o$@ $<
ufopen.op: ufopen.c
	$(CC) $(CFLAGS) -pg -c -o$@ $<
#
# program for distilling memory allocation trace files
# (cma = Check Memory Allocations)
#
cma cma.exe: cma.c
	$(CC) $(CFLAGS) -o cma cma.c
	@copy cma. a.out >nul
	strip cma.
	stubify cma
	@del cma. >nul
	@ren a.out cma. >nul

############################################################################

headers: installdirs ../include/allocmem.h ../include/change.h \
	  ../include/dynstr.h ../include/opaclib.h ../include/record.h \
	  ../include/rpterror.h ../include/strclass.h ../include/strlist.h \
	  ../include/template.h ../include/textctl.h ../include/trie.h

libs:         headers ../lib/libopac.a

profile_libs: headers ../lib/libopa_p.a

installdirs:
	-@if not exist ..\include\*.* md ..\include >nul
	-@if not exist ..\lib\*.*     md ..\lib >nul
	-@if not exist $(BINDIR)\*.*  md $(BINDIR) >nul

../lib/libopac.a: libopac.a
	$(INSTALL) libopac.a ..\lib >nul
../lib/libopa_p.a: libopa_p.a
	$(INSTALL) libopa_p.a ..\lib >nul

../include/allocmem.h: allocmem.h
	$(INSTALL) allocmem.h ..\include >nul
../include/change.h: change.h
	$(INSTALL) change.h ..\include >nul
../include/dynstr.h: dynstr.h
	$(INSTALL) dynstr.h ..\include >nul
../include/opaclib.h: opaclib.h
	$(INSTALL) opaclib.h ..\include >nul
../include/record.h: record.h
	$(INSTALL) record.h ..\include >nul
../include/rpterror.h: rpterror.h
	$(INSTALL) rpterror.h ..\include >nul
../include/strclass.h: strclass.h
	$(INSTALL) strclass.h ..\include >nul
../include/strlist.h: strlist.h
	$(INSTALL) strlist.h ..\include >nul
../include/template.h: template.h
	$(INSTALL) template.h ..\include >nul
../include/textctl.h: textctl.h
	$(INSTALL) textctl.h ..\include >nul
../include/trie.h: trie.h
	$(INSTALL) trie.h ..\include >nul

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
	-@if exist opaclib.info del opaclib.info >nul
	-@if exist opaclib.html del opaclib.html >nul
	-@if exist opaclib.txt del opaclib.txt >nul
	-@if exist opaclib.dos del opaclib.dos >nul
	-@if exist opaclib.mac del opaclib.mac >nul

TAGS: $(SOURCES)
	etags $(SOURCES)

doc dvi html info:
	@if exist ..\doc\opaclib.txi  cd ..\doc
	@if exist opaclib.txi         @$(MAKE) opaclib$@
	@if exist opaclib.txi         cd ..\opaclib

dist testdist:
	@echo this target does not work on MS-DOS
	@echo you need some variant of Unix (SunOS, Linux, ...) to "make $@"

############################################################################

.PHONY: all check clean dist distclean doc dvi html info install \
		libs maintainer-clean mostlyclean profile profile_libs testdist \
		uninstall installdirs headers
