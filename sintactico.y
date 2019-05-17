%{
#include <stdio.h>
#include <string.h>
#include <math.h>
#define YYSTYPE double
%}

%token NUMBER COS SIN 

%left  '+' '-' /* precedencia menor*/
%left  '*' '/' /* precedencia media */
%left  '^' /* precedencia mayor */



%%
list: list '\n'
    | list expr '\n' {printf("res: %f\n",$2);}

expr: NUMBER {$$ = $1;}
    | expr '+' expr {$$ = $1 + $2;}
    | expr '-' expr {$$ = $1 - $2;}
    | expr '*' expr {$$ = $1 * $2;}
    | expr '/' expr {$$ = $1 / $2;}
    | expr '^' expr {$$ = pow($1, $2);}
    | '(' expr ')' {$$ = $2;}
    | SIN '(' expr ')' {$$ = sin($3);}

%%




void yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
}

main()
{
        yyparse();
} 


/*
heat_switch:
        TOKHEAT STATE
        {
                printf("\tHeat turned on or off\n");
        }
        ;

target_set:
        TOKTARGET TOKTEMPERATURE NUMBER
        {
                printf("\tTemperature set\n");
        }
        ;
*/