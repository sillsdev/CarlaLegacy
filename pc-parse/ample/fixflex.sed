s/yyin = stdin;/yyin = NULL;/
s/yyout = stdout;/yyout = pLogFP_in;/
s/fprintf( stderr,/reportError(0,/
s/exit(/exitSafely(/
