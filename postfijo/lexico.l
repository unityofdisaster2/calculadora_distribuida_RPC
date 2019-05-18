/*zona de declaracion*/
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.post.h"
/*Se declara externamente desde yacc la variable yylval 
esta variable se utilizara como auxiliar para guardar
el valor que se encuentre en los lexemas pero en formato double
*/ 
extern double yylval;
%}
/*expresiones regulares y acciones que se realizaran cuando se encuentren*/
%%
[\-]?[0-9]*\.?[0-9]+    {yylval = atof(yytext);return NUMBER;}
cos                     return COS;
sin                     return SIN;
tan                     return TAN;
cot                     return COT;
csc                     return CSC;
sec                     return SEC;
log                     return LOG;
sqrt                    return SQRT;
\n                      yyterminate();/* finalizar el analisis*/;
[-+*/^()]                  return yytext[0]; /*se retorna cualquiera de estos simbolos para su manejo por el analizador sintactico, este los maneja como tokens pero sin asignar directamente un numero*/
[ ]+                  /* Se ignoran espacios en blanco*/;
%%
//se empaquetan las expresiones regulares declaradas anteriornmente pa
int yywrap(){} 
