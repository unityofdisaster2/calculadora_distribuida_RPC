%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
extern double yylval;
%}
%%
[\-]?[0-9]*\.?[0-9]+    {yylval = atof(yytext);return NUMBER;}
cos                     return COS;
sin                     return SIN;
\n                      /* ignore end of line */;
[ \t]+                  /* ignore whitespace */;
%%

int yywrap(){} 