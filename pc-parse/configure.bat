@echo off
rem this batch file configures this package for MSDOS and MS Windows.

echo configuring for MS-DOS / GNU C (DJGPP 2.01) or MS-Windows / MSVC++
if exist Makefile del Makefile
copy Makefile.dj Makefile >nul
if exist cportlib\Makefile del cportlib\Makefile
if exist cportlib\Makefile.dj copy cportlib\Makefile.dj cportlib\Makefile >nul
if exist opaclib\Makefile del opaclib\Makefile
if exist opaclib\Makefile.dj copy opaclib\Makefile.dj opaclib\Makefile >nul
if exist cmdlib\Makefile del cmdlib\Makefile
if exist cmdlib\Makefile.dj copy cmdlib\Makefile.dj cmdlib\Makefile >nul
if exist doc\Makefile del doc\Makefile
if exist doc\Makefile.dj copy doc\Makefile.dj doc\Makefile >nul
if exist pckimmo\Makefile del pckimmo\Makefile
if exist pckimmo\Makefile.dj copy pckimmo\Makefile.dj pckimmo\Makefile >nul
if exist pcpatr\Makefile del pcpatr\Makefile
if exist pcpatr\Makefile.dj copy pcpatr\Makefile.dj pcpatr\Makefile >nul
if exist ample\Makefile del ample\Makefile
if exist ample\Makefile.dj copy ample\Makefile.dj ample\Makefile >nul
if exist stamp\Makefile del stamp\Makefile
if exist stamp\Makefile.dj copy stamp\Makefile.dj stamp\Makefile >nul
if exist ktext\Makefile del ktext\Makefile
if exist ktext\Makefile.dj copy ktext\Makefile.dj ktext\Makefile >nul
if exist ktagger\Makefile del ktagger\Makefile
if exist ktagger\Makefile.dj copy ktagger\Makefile.dj ktagger\Makefile >nul
if exist anadiff\Makefile del anadiff\Makefile
if exist anadiff\Makefile.dj copy anadiff\Makefile.dj anadiff\Makefile >nul
if exist intergen\Makefile del intergen\Makefile
if exist intergen\Makefile.dj copy intergen\Makefile.dj intergen\Makefile >nul

if not exist include md include
if exist ample\ample.h copy ample\ample.h include\ample.h >nul
if exist ample\punclass.h copy ample\punclass.h include\punclass.h >nul
if exist ample\stample.h copy ample\stample.h include\stample.h >nul
if exist cmdlib\cmd.h copy cmdlib\cmd.h include\cmd.h >nul
if exist cportlib\cportlib.h copy cportlib\cportlib.h include\cportlib.h >nul
if exist opaclib\allocmem.h copy opaclib\allocmem.h include\allocmem.h >nul
if exist opaclib\change.h copy opaclib\change.h include\change.h >nul
if exist opaclib\opaclib.h copy opaclib\opaclib.h include\opaclib.h >nul
if exist opaclib\record.h copy opaclib\record.h include\record.h >nul
if exist opaclib\rpterror.h copy opaclib\rpterror.h include\rpterror.h >nul
if exist opaclib\strclass.h copy opaclib\strclass.h include\strclass.h >nul
if exist opaclib\strlist.h copy opaclib\strlist.h include\strlist.h >nul
if exist opaclib\template.h copy opaclib\template.h include\template.h >nul
if exist opaclib\textctl.h copy opaclib\textctl.h include\textctl.h >nul
if exist opaclib\trie.h copy opaclib\trie.h include\trie.h >nul
if exist pckimmo\kimmo.h copy pckimmo\kimmo.h include\kimmo.h >nul
if exist pcpatr\patr.h copy pcpatr\patr.h include\patr.h >nul
if exist stamp\stamp.h copy stamp\stamp.h include\stamp.h >nul
if not exist lib md lib

if exist config.h del config.h
copy config.DOS config.h >nul
