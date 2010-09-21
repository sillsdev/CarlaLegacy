@echo off
rem getgram.bat Batch file to automatically build documentation
rem		on the yacc/lex portion of the TonePars program
rem		Andy Black  May 15, 1995
rem                         Updated Dec. 12, 2001
rem
rem Copy key source files so tools can access them from here
copy ..\..\TonePGLib\trule_yg.y . > nul
copy ..\..\TonePGLib\trule_ls.l . > nul

rem Skip non-grammar portion of yacc file:
if exist grammar.tmp del grammar.tmp
cc -n -t getgram.cct -o grammar.tmp trule_yg.y

rem Extract the syntax and comment portions of the yacc file:
grep -f getgram.grp grammar.tmp > grammar.tm2

rem Extract the LX_ definitions from lex file:
grep -f getlex.grp trule_ls.l > lx_subs.tmp

rem Build a sed script to make appropriate substitutions:
if exist lx_subs.tm2 del lx_subs.tm2
cc -n -t getlex.cct -o lx_subs.tm2 lx_subs.tmp
c:\djgpp\bin\sort -r lx_subs.tm2 > lx_subs.sed

rem Build the grammar file itself
echo TonePars Yacc Grammar > grammar
timetag > gramtime
type gramtime >> grammar
echo. >> grammar
echo ------------------------------------------------------------ >> grammar
echo. >> grammar
c:\djgpp\bin\sed -f lx_subs.sed grammar.tm2 >> grammar
echo. >> grammar
echo ------------------------------------------------------------ >> grammar
echo. >> grammar

rem Get those LX_ items which have more than one manifestation
c:\djgpp\bin\awk -f getdups.awk lx_subs.sed >> grammar

rem Clean up temporary files
del grammar.tmp
del grammar.tm2
del lx_subs.tmp
del lx_subs.tm2
del lx_subs.sed
