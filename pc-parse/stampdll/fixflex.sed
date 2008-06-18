s/yyin = stdin;/yyin = NULL;/
s/yyout = foostdout;/yyout = pLogFP_in;/
s/fprintf( foostderr,/reportError(0,/
s/exit(foo/exitSafely(/
/^#ifndef\ YY_SKIP_YYWRAP$/ i\
\#ifndef yywrap
/^extern int yywrap /a\
#endif
