# MS-DOS makefile for the reference documentation
# GNU C / GNU make (DJGPP 2.01)
# Steve McConnel, 24-Oct-1998
#
# this requires several GNU utilities, TeX, and Perl5.
#
# DJGPP provides makeinfo, texinfo.tex, TeX (i'm not sure about texi2dvi),
# and sed.  The sources to recode are available from FSF/GNU archives such
# as prep.ai.mit.edu.  Perl5 and texi2html are available on the Web.
#
.SUFFIXES: .txi .info .txt .html .dvi .dos .mac
.txi.info:
	makeinfo --no-split $<
.txi.txt:
	makeinfo --no-split --no-headers -D txt --output $@ $<
.txi.dvi:
	texi2dvi $<
.txi.html:
	texi2html -menu -monolithic -number $<
.txi.dos:
	makeinfo --no-split --no-headers -D txt --output $@ $<
	recode latin1:ibmpc $@
.txi.mac:
	makeinfo --no-split --no-headers -D txt --output $@ $<
	recode latin1:applemac $@

all: doc
#
# AMPLE documentation
#
AMPLEINFO = ample.info amplelib.info llample.info ampledll.info
AMPLEHTML = ample.html amplelib.html llample.html ampledll.html
AMPLETXT  = ample.txt  amplelib.txt  llample.txt  ampledll.txt
AMPLEDOS  = ample.dos  amplelib.dos
AMPLEMAC  = ample.mac  amplelib.mac
AMPLEDOC  = $(AMPLEINFO) $(AMPLEHTML) $(AMPLETXT) $(AMPLEDOS) $(AMPLEMAC)
AMPLEDVI  = ample.dvi  amplelib.dvi  llample.dvi  ampledll.dvi

ampleinfo: $(AMPLEINFO)
amplehtml: $(AMPLEHTML)
ampledoc:  $(AMPLEDOC)
ampledvi:  $(AMPLEDVI)

AMPLELIBTXI = amplelib.txi front.txi naming.txi
amplelib.info amplelib.txt amplelib.html amplelib.dos amplelib.mac: \
			  $(AMPLELIBTXI)
amplelib.dvi: $(AMPLELIBTXI) pcparse.tex

AMPLETXI    = ample.txi    front.txi stdfmt.txi dictcode.txi dictochg.txi \
						   dictfile.txi textin.txi changes.txi anafiles.txi
ample.info ample.txt ample.html ample.dos ample.mac: $(AMPLETXI)
ample.dvi:                                           $(AMPLETXI) pcparse.tex

LLAMPLETXI  = llample.txi  front.txi
llample.info llample.txt llample.html: $(LLAMPLETXI)
llample.dvi:                           $(LLAMPLETXI) pcparse.tex

AMPLEDLLTXI  = ampledll.txi  front.txi
ampledll.info ampledll.txt ampledll.html: $(AMPLEDLLTXI)
ampledll.dvi:                             $(AMPLEDLLTXI) pcparse.tex
#
# STAMP documentation
#
STAMPINFO = stamp.info stamplib.info
STAMPHTML = stamp.html stamplib.html
STAMPTXT  = stamp.txt  stamplib.txt
STAMPDOS  = stamp.dos  stamplib.dos
STAMPMAC  = stamp.mac  stamplib.mac
STAMPDOC  = $(STAMPINFO) $(STAMPHTML) $(STAMPTXT) $(STAMPDOS) $(STAMPMAC)
STAMPDVI  = stamp.dvi  stamplib.dvi

stampinfo: $(STAMPINFO)
stamphtml: $(STAMPHTML)
stampdoc:  $(STAMPDOC)
stampdvi:  $(STAMPDVI)

STAMPLIBTXI = stamplib.txi front.txi naming.txi
stamplib.info stamplib.txt stamplib.html stamplib.dos stamplib.mac: \
			  $(STAMPLIBTXI)
stamplib.dvi: $(STAMPLIBTXI) pcparse.tex

STAMPTXI    = stamp.txi    front.txi stdfmt.txi dictcode.txi dictochg.txi \
						   dictfile.txi textout.txi changes.txi anafiles.txi
stamp.info stamp.txt stamp.html stamp.dos stamp.mac: $(STAMPTXI)
stamp.dvi:                                           $(STAMPTXI) pcparse.tex
#
#  ANADIFF documentation
#
anadiffinfo: anadiff.info
anadiffhtml: anadiff.html
anadiffdoc:  anadiff.info anadiff.html anadiff.txt anadiff.dos anadiff.mac
anadiffdvi:  anadiff.dvi

ANADIFFTXI  = anadiff.txi  front.txi anafiles.txi
anadiff.info anadiff.txt anadiff.html anadiff.dos anadiff.mac: \
			 $(ANADIFFTXI)
anadiff.dvi: $(ANADIFFTXI) pcparse.tex
#
#  INTERGEN documentation
#
intergeninfo: intergen.info
intergenhtml: intergen.html
intergendoc:  intergen.info intergen.html intergen.txt intergen.dos \
			  intergen.mac
intergendvi:  intergen.dvi

INTERGENTXI = intergen.txi front.txi anafiles.txi
intergen.info intergen.txt intergen.html intergen.dos intergen.mac: \
			  $(INTERGENTXI)
intergen.dvi: $(INTERGENTXI) pcparse.tex
#
#  CMD library documentation
#
cmdlibinfo: cmdlib.info
cmdlibhtml: cmdlib.html
cmdlibdoc:  cmdlib.info cmdlib.html cmdlib.txt cmdlib.dos cmdlib.mac
cmdlibdvi:  cmdlib.dvi

CMDLIBTXI   = cmdlib.txi   front.txi naming.txi
cmdlib.info cmdlib.txt cmdlib.html cmdlib.dos cmdlib.mac: \
			$(CMDLIBTXI)
cmdlib.dvi: $(CMDLIBTXI) pcparse.tex
#
#  CPORT library documentation
#
cportlibinfo: cportlib.info
cportlibhtml: cportlib.html
cportlibdoc: cportlib.info cportlib.html cportlib.txt cportlib.dos cportlib.mac
cportlibdvi:  cportlib.dvi

CPORTLIBTXI = cportlib.txi front.txi
cportlib.info cportlib.txt cportlib.html cportlib.dos cportlib.mac: \
			  $(CPORTLIBTXI)
cportlib.dvi: $(CPORTLIBTXI) pcparse.tex
#
#  KTAGGER documentation
#
ktaggerinfo: ktagger.info
ktaggerhtml: ktagger.html
ktaggerdoc:  ktagger.info ktagger.html ktagger.txt ktagger.dos ktagger.mac
ktaggerdvi:  ktagger.dvi

KTAGGERTXI  = ktagger.txi  front.txi
ktagger.info ktagger.txt ktagger.html ktagger.dos ktagger.mac: \
			 $(KTAGGERTXI)
ktagger.dvi: $(KTAGGERTXI) pcparse.tex
#
#  KTEXT documentation
#
ktextinfo: ktext.info
ktexthtml: ktext.html eng.gif
ktextdoc:  ktext.info ktext.html eng.gif ktext.txt ktext.dos ktext.mac
ktextdvi:  ktext.dvi

KTEXTTXI    = ktext.txi    front.txi textin.txi textout.txi changes.txi \
						   anafiles.txi
ktext.info ktext.txt ktext.dos ktext.mac: $(KTEXTTXI)
ktext.html:                               $(KTEXTTXI) fixhtml.sed
	texi2html -menu -monolithic -number ktext.txi
	sed -f fixhtml.sed ktext.html >ktext.htm
	mv ktext.htm ktext.html
ktext.dvi:         $(KTEXTTXI) pcparse.tex eng.tex eng.its itf.tex itfchars.tex
#
#  OPAC library documentation
#
opaclibinfo: opaclib.info
opaclibhtml: opaclib.html
opaclibdoc:  opaclib.info opaclib.html opaclib.txt opaclib.dos opaclib.mac
opaclibdvi:  opaclib.dvi

OPACLIBTXI  = opaclib.txi  front.txi naming.txi
opaclib.info opaclib.txt opaclib.html opaclib.dos opaclib.mac: \
			 $(OPACLIBTXI)
opaclib.dvi: $(OPACLIBTXI) pcparse.tex
#
#  PC-Kimmo documentation
#
KIMMOINFO = kimmolib.info pckimmo.info
KIMMOHTML = kimmolib.html pckimmo.html
KIMMOTXT  = kimmolib.txt  pckimmo.txt
KIMMODOS  = kimmolib.dos  pckimmo.dos
KIMMOMAC  = kimmolib.mac  pckimmo.mac
KIMMODVI  = kimmolib.dvi  pckimmo.dvi

kimmoinfo: $(KIMMOINFO)
kimmohtml: $(KIMMOHTML)
kimmodoc:  $(KIMMOINFO) $(KIMMOHTML) $(KIMMOTXT) $(KIMMODOS) $(KIMMOMAC)
kimmodvi:  $(KIMMODVI)

KIMMOLIBTXI = kimmolib.txi front.txi naming.txi
kimmolib.info kimmolib.txt kimmolib.html kimmolib.dos kimmolib.mac: \
			  $(KIMMOLIBTXI)
kimmolib.dvi: $(KIMMOLIBTXI) pcparse.tex

PCKIMMOTXI  = pckimmo.txi  front.txi
pckimmo.info pckimmo.txt pckimmo.html pckimmo.dos pckimmo.mac: \
			  $(PCKIMMOTXI)
pckimmo.dvi:  $(PCKIMMOTXI) pcparse.tex
#
#  PC-PATR documentation
#
PATRINFO = patrlib.info pcpatr.info
PATRHTML = patrlib.html pcpatr.html
PATRTXT  = patrlib.txt  pcpatr.txt
PATRDOS  = patrlib.dos  pcpatr.dos
PATRMAC  = patrlib.mac  pcpatr.mac
PATRDVI  = patrlib.dvi  pcpatr.dvi

patrinfo: $(PATRINFO)
patrhtml: $(PATRHTML)
patrdoc:  $(PATRINFO) $(PATRHTML) $(PATRTXT) $(PATRDOS) $(PATRMAC)
patrdvi:  $(PATRDVI)

PATRLIBTXI  = patrlib.txi  front.txi naming.txi
patrlib.info patrlib.txt patrlib.html patrlib.dos patrlib.mac: \
			 $(PATRLIBTXI)
patrlib.dvi: $(PATRLIBTXI) pcparse.tex

PCPATRTXI   = pcpatr.txi   front.txi
pcpatr.info pcpatr.txt pcpatr.html pcpatr.dos pcpatr.mac: \
			 $(PCPATRTXI)
pcpatr.dvi:  $(PCPATRTXI) pcparse.tex
#
#  combined documentation
#
INFOFILES = $(AMPLEINFO) $(STAMPINFO) anadiff.info intergen.info \
			cmdlib.info cportlib.info ktagger.info ktext.info opaclib.info \
			$(KIMMOINFO) $(PATRINFO)
HTMLFILES = $(AMPLEHTML) $(STAMPHTML) anadiff.html intergen.html \
			cmdlib.html cportlib.html ktagger.html ktext.html opaclib.html \
			$(KIMMOHTML) $(PATRHTML)
TXTFILES  = $(AMPLETXT) $(STAMPTXT) anadiff.txt intergen.txt \
			cmdlib.txt cportlib.txt ktagger.txt ktext.txt opaclib.txt \
			$(KIMMOTXT) $(PATRTXT)
DOSFILES  = $(AMPLEDOS) $(STAMPDOS) anadiff.dos intergen.dos \
			cmdlib.dos cportlib.dos ktagger.dos ktext.dos opaclib.dos \
			$(KIMMODOS) $(PATRDOS)
MACFILES  = $(AMPLEMAC) $(STAMPMAC) anadiff.mac intergen.mac \
			cmdlib.mac cportlib.mac ktagger.mac ktext.mac opaclib.mac \
			$(KIMMOMAC) $(PATRMAC)
DVIFILES  = $(AMPLEDVI) $(STAMPDVI) anadiff.dvi intergen.dvi \
			cmdlib.dvi cportlib.dvi ktagger.dvi ktext.dvi opaclib.dvi \
			$(KIMMODVI) $(PATRDVI)

info: $(INFOFILES)
html: $(HTMLFILES)
doc:  $(INFOFILES) $(HTMLFILES) $(TXTFILES) $(DOSFILES) $(MACFILES)
dvi:  $(DVIFILES)

ampledist dist docdist:
	@echo this target does not work on MS-DOS
	@echo you need some variant of Unix (SunOS, Linux, ...) to "make $@"

############################################################################

mostlyclean:
	rm -f *~

clean: mostlyclean
	rm -f *.aux *.log *.toc
	rm -f *.cp *.cps *.fn *.fns *.ky *.kys *.pg *.pgs *.tp *.tps *.vr *.vrs

distclean: clean
	rm -f Makefile *.info *.html *.txt *.dos *.mac *.dvi

maintainer-clean: distclean

############################################################################

.PHONY: all clean distclean maintainer-clean mostlyclean dist docdist \
		doc dvi html info install uninstall installdirs \
		ampledoc    ampledvi    amplehtml    ampleinfo    \
		anadiffdoc  anadiffdvi  anadiffhtml  anadiffinfo  \
		cmdlibdoc   cmdlibdvi   cmdlibhtml   cmdlibinfo   \
		cportlibdoc cportlibdvi cportlibhtml cportlibinfo \
		intergendoc intergendvi intergenhtml intergeninfo \
		ktaggerdoc  ktaggerdvi  ktaggerhtml  ktaggerinfo  \
		opaclibdoc  opaclibdvi  opaclibhtml  opaclibinfo  \
		kimmodoc    kimmodvi    kimmohtml    kimmoinfo    \
		patrdoc     patrdvi     patrhtml     patrinfo
