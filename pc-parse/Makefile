# MS-DOS Makefile for the OPAC/PC-PARSE programs and libraries
# GNU C / GNU make (DJGPP 2.01)
# Steve McConnel,  2-Sep-1999

# directory where executable programs are stored
# (this is the only line that you should need to customize)
BINDIR = c:\sil

MAKEFLAGS=--no-print-directory "BINDIR=$(BINDIR)"
MAKE     =make

# make all programs after first making all function libraries

all: libs
	@if exist ample\ample.c     cd ample
	@if exist ample.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist ample.c           cd ..
	@if exist stamp\stamp.c     cd stamp
	@if exist stamp.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist stamp.c           cd ..
	@if exist anadiff\anadiff.c cd anadiff
	@if exist anadiff.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist anadiff.c         cd ..
	@if exist intergen\intergen.c cd intergen
	@if exist intergen.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist intergen.c         cd ..
	@if exist pckimmo\pckimmo.c cd pckimmo
	@if exist pckimmo.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist pckimmo.c         cd ..
	@if exist pcpatr\pcpatr.c   cd pcpatr
	@if exist pcpatr.c          $(MAKE) $(MAKEFLAGS) $@
	@if exist pcpatr.c          cd ..
	@if exist ktagger\ktagger.c cd ktagger
	@if exist ktagger.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist ktagger.c         cd ..
	@if exist ktext\ktext.c     cd ktext
	@if exist ktext.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist ktext.c           cd ..

# make all function libraries

libs profile_libs: config.h Makefile
	-@if not exist lib\*.*     md lib
	-@if not exist include\*.* md include
	@if exist pckimmo\kimmo.h     copy pckimmo\kimmo.h include >nul
	@if exist pcpatr\patr.h       copy pcpatr\patr.h include >nul
	@if exist cportlib\cportlib.h cd cportlib
	@if exist cportlib.h          $(MAKE) $(MAKEFLAGS) $@
	@if exist cportlib.h          cd ..
	@if exist opaclib\opaclib.h   cd opaclib
	@if exist opaclib.h $(MAKE)   $(MAKEFLAGS) $@
	@if exist opaclib.h           cd ..
	@if exist cmdlib\cmd.h        cd cmdlib
	@if exist cmd.h               $(MAKE) $(MAKEFLAGS) $@
	@if exist cmd.h               cd ..
	@if exist ample\ample.c       cd ample
	@if exist ample.c $(MAKE)     $(MAKEFLAGS) $@
	@if exist ample.c             cd ..
	@if exist stamp\stamp.c       cd stamp
	@if exist stamp.c $(MAKE)     $(MAKEFLAGS) $@
	@if exist stamp.c             cd ..
	@if exist pckimmo\pckimmo.c   cd pckimmo
	@if exist pckimmo.c $(MAKE)   $(MAKEFLAGS) $@
	@if exist pckimmo.c           cd ..
	@if exist pcpatr\pcpatr.c     cd pcpatr
	@if exist pcpatr.c $(MAKE)    $(MAKEFLAGS) $@
	@if exist pcpatr.c            cd ..

# install all programs after first making them

install: all installdirs
	@if exist ample\ample.c     cd ample
	@if exist ample.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist ample.c           cd ..
	@if exist stamp\stamp.c     cd stamp
	@if exist stamp.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist stamp.c           cd ..
	@if exist anadiff\anadiff.c cd anadiff
	@if exist anadiff.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist anadiff.c         cd ..
	@if exist intergen\intergen.c cd intergen
	@if exist intergen.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist intergen.c         cd ..
	@if exist pckimmo\pckimmo.c cd pckimmo
	@if exist pckimmo.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist pckimmo.c         cd ..
	@if exist pcpatr\pcpatr.c   cd pcpatr
	@if exist pcpatr.c          $(MAKE) $(MAKEFLAGS) $@
	@if exist pcpatr.c          cd ..
	@if exist ktagger\ktagger.c cd ktagger
	@if exist ktagger.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist ktagger.c         cd ..
	@if exist ktext\ktext.c     cd ktext
	@if exist ktext.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist ktext.c           cd ..

# uninstall all programs

uninstall:
	@if exist ample\ample.c     cd ample
	@if exist ample.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist ample.c           cd ..
	@if exist stamp\stamp.c     cd stamp
	@if exist stamp.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist stamp.c           cd ..
	@if exist anadiff\anadiff.c cd anadiff
	@if exist anadiff.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist anadiff.c         cd ..
	@if exist intergen\intergen.c cd intergen
	@if exist intergen.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist intergen.c         cd ..
	@if exist pckimmo\pckimmo.c cd pckimmo
	@if exist pckimmo.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist pckimmo.c         cd ..
	@if exist pcpatr\pcpatr.c   cd pcpatr
	@if exist pcpatr.c          $(MAKE) $(MAKEFLAGS) $@
	@if exist pcpatr.c          cd ..
	@if exist ktagger\ktagger.c cd ktagger
	@if exist ktagger.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist ktagger.c         cd ..
	@if exist ktext\ktext.c     cd ktext
	@if exist ktext.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist ktext.c           cd ..

# check all programs after first making them

check: all
	@if exist ample\ample.c     cd ample
	@if exist ample.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist ample.c           cd ..
	@if exist stamp\stamp.c     cd stamp
	@if exist stamp.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist stamp.c           cd ..
	@if exist anadiff\anadiff.c cd anadiff
	@if exist anadiff.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist anadiff.c         cd ..
	@if exist intergen\intergen.c cd intergen
	@if exist intergen.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist intergen.c         cd ..
	@if exist pckimmo\pckimmo.c cd pckimmo
	@if exist pckimmo.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist pckimmo.c         cd ..
	@if exist pcpatr\pcpatr.c   cd pcpatr
	@if exist pcpatr.c          $(MAKE) $(MAKEFLAGS) $@
	@if exist pcpatr.c          cd ..
	@if exist ktagger\ktagger.c cd ktagger
	@if exist ktagger.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist ktagger.c         cd ..
	@if exist ktext\ktext.c     cd ktext
	@if exist ktext.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist ktext.c           cd ..

# make all profiling programs after first making all function libraries

profile: profile_libs
	@if exist ample\ample.c     cd ample
	@if exist ample.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist ample.c           cd ..
	@if exist stamp\stamp.c     cd stamp
	@if exist stamp.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist stamp.c           cd ..
	@if exist anadiff\anadiff.c cd anadiff
	@if exist anadiff.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist anadiff.c         cd ..
	@if exist intergen\intergen.c cd intergen
	@if exist intergen.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist intergen.c         cd ..
	@if exist pckimmo\pckimmo.c cd pckimmo
	@if exist pckimmo.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist pckimmo.c         cd ..
	@if exist pcpatr\pcpatr.c   cd pcpatr
	@if exist pcpatr.c          $(MAKE) $(MAKEFLAGS) $@
	@if exist pcpatr.c          cd ..
	@if exist ktagger\ktagger.c cd ktagger
	@if exist ktagger.c         $(MAKE) $(MAKEFLAGS) $@
	@if exist ktagger.c         cd ..
	@if exist ktext\ktext.c     cd ktext
	@if exist ktext.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist ktext.c           cd ..

# do something for all subdirectories

clean mostlyclean TAGS:
	@if exist cportlib\cportlib.h cd cportlib
	@if exist cportlib.h          $(MAKE) $(MAKEFLAGS) $@
	@if exist cportlib.h          cd ..
	@if exist opaclib\opaclib.h   cd opaclib
	@if exist opaclib.h           $(MAKE) $(MAKEFLAGS) $@
	@if exist opaclib.h           cd ..
	@if exist ample\ample.c       cd ample
	@if exist ample.c             $(MAKE) $(MAKEFLAGS) $@
	@if exist ample.c             cd ..
	@if exist stamp\stamp.c       cd stamp
	@if exist stamp.c             $(MAKE) $(MAKEFLAGS) $@
	@if exist stamp.c             cd ..
	@if exist anadiff\anadiff.c   cd anadiff
	@if exist anadiff.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist anadiff.c           cd ..
	@if exist intergen\intergen.c   cd intergen
	@if exist intergen.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist intergen.c           cd ..
	@if exist cmdlib\cmd.h        cd cmdlib
	@if exist cmd.h               $(MAKE) $(MAKEFLAGS) $@
	@if exist cmd.h               cd ..
	@if exist pckimmo\pckimmo.c   cd pckimmo
	@if exist pckimmo.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist pckimmo.c           cd ..
	@if exist pcpatr\pcpatr.c     cd pcpatr
	@if exist pcpatr.c            $(MAKE) $(MAKEFLAGS) $@
	@if exist pcpatr.c            cd ..
	@if exist ktagger\ktagger.c   cd ktagger
	@if exist ktagger.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist ktagger.c           cd ..
	@if exist ktext\ktext.c       cd ktext
	@if exist ktext.c             $(MAKE) $(MAKEFLAGS) $@
	@if exist ktext.c             cd ..

# process the documentation

doc dvi html info:
	@if exist doc\ample.txi  cd doc
	@if exist ample.txi      @$(MAKE) $(MAKEFLAGS) $@
	@if exist ample.txi      cd ..

# clean all subdirectories thoroughly

distclean maintainer-clean: clean
	@if exist cportlib\cportlib.h cd cportlib
	@if exist cportlib.h          $(MAKE) $(MAKEFLAGS) $@
	@if exist cportlib.h          cd ..
	@if exist opaclib\opaclib.h   cd opaclib
	@if exist opaclib.h           $(MAKE) $(MAKEFLAGS) $@
	@if exist opaclib.h           cd ..
	@if exist ample\ample.c       cd ample
	@if exist ample.c             $(MAKE) $(MAKEFLAGS) $@
	@if exist ample.c             cd ..
	@if exist stamp\stamp.c       cd stamp
	@if exist stamp.c             $(MAKE) $(MAKEFLAGS) $@
	@if exist stamp.c             cd ..
	@if exist anadiff\anadiff.c   cd anadiff
	@if exist anadiff.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist anadiff.c           cd ..
	@if exist intergen\intergen.c   cd intergen
	@if exist intergen.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist intergen.c           cd ..
	@if exist cmdlib\cmd.h        cd cmdlib
	@if exist cmd.h               $(MAKE) $(MAKEFLAGS) $@
	@if exist cmd.h               cd ..
	@if exist pckimmo\pckimmo.c   cd pckimmo
	@if exist pckimmo.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist pckimmo.c           cd ..
	@if exist pcpatr\pcpatr.c     cd pcpatr
	@if exist pcpatr.c            $(MAKE) $(MAKEFLAGS) $@
	@if exist pcpatr.c            cd ..
	@if exist ktagger\ktagger.c   cd ktagger
	@if exist ktagger.c           $(MAKE) $(MAKEFLAGS) $@
	@if exist ktagger.c           cd ..
	@if exist ktext\ktext.c       cd ktext
	@if exist ktext.c             $(MAKE) $(MAKEFLAGS) $@
	@if exist ktext.c             cd ..
	-@del Makefile
	-@del config.h
	-@del stamp-h
	-@for %f in (include\*.*) do del %f
	-@rmdir include
	-@for %f in (lib\*.*) do del %f
	-@rmdir lib

installdirs:
	-@if not exist $(BINDIR)\*.* md $(BINDIR)

# update config.h as needed

config.h: config.dos
	@copy config.dos config.h >nul

dist:
	@echo this target does not work on MS-DOS
	@echo you need some variant of Unix (SunOS, Linux, ...) to "make $@"

############################################################################

.PHONY: all check clean dist distclean doc dvi html info install \
		libs maintainer-clean mostlyclean profile profile_libs testdist \
		uninstall installdirs
