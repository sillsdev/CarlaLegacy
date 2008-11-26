/^#ifndef lint$/,/^#endif/d
/^yynewerror:$/d
/^yyerrlab:$/d
s/"y.tab\.c"/"sytest_l.c"/
s/if (yyn = yydefred\[yystate\])/if ((yyn = yydefred[yystate]) != 0)/
s/yylex(foo)/yylex(pLogFP_m)/g
