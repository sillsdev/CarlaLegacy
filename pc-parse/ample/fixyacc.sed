/^#ifndef lint$/,/^#endif/d
/^yynewerror:$/d
/^yyerrlab:$/d
s/"y.tab\.c"/"atest.c"/
s/if (yyn = yydefred\[yystate\])/if ((yyn = yydefred[yystate]) != 0)/
s/yylex()/yylex(pLogFP_m)/g
