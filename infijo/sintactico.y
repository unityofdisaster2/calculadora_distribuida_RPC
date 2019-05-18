//zona de declaracion de variables
%{
#include <stdio.h>
#include <string.h>
#include <math.h>
//se define el tipo de dato que se manejara en la pila de yacc
#define YYSTYPE double
double resultado;
int error_flag = 0;
%} 

//se declaran los tokens y la precedencia de operadores
%token NUMBER COS SIN TAN COT CSC SEC LOG SQRT

%left  '+' '-' /* precedencia menor*/
%left  '*'  /* precedencia media */
%left  '^' '/' /* precedencia mayor */


//declaracion de reglas de la gramatica
//en $$ se guarda el resultado de ejecutar cada operacion establecida despues del igual
//$n representa el numero de posicion del elemento que queremos utilizar para un operacion

%%
calculadora: expr {resultado = $$;}; /*se llama a expresion y el resultado de todos los calculos se guarda en la variable del mismo nombre*/

expr: NUMBER {$$ = $1;}
    | expr '+' expr {$$ = $1 + $3;}
    | expr '-' expr {$$ = $1 - $3;}
    | expr '*' expr {$$ = $1 * $3;}
    | expr '/' expr {$$ = $1 / $3;}
    | expr '^' expr {$$ = pow($1, $3);}
    | '(' expr ')' {$$ = $2;}
    | SIN '(' expr ')' {$$ = sin($3);}
    | COS '(' expr ')' {$$ = cos($3);}
    | TAN '(' expr ')' {$$ = tan($3);}
    | COT '(' expr ')' {$$ = 1/tan($3);}
    | CSC '(' expr ')' {$$ = 1/sin($3);}
    | SEC '(' expr ')' {$$ = 1/cos($3);}
    | LOG '(' expr ')' {$$ = log($3);}
    | SQRT '(' expr ')' {$$ = sqrt($3);}

%%

//zona de codigo

//funcion para desplegar mensaje en caso de que la cadena no cumpla con alguna condicion
void yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
        //Se levanta la bandera de error
        error_flag = 1;
}

double calculadora_infija(){
        //funcion para comenzar con el analisis sintactico 
        yyparse();
        //si el analisis se realizo exitosamente se retorna el resultado, en caso contrario
        //Se maneja el codigo de error -12345.0
        if(error_flag == 0){
                return resultado;
        }else{
                return -12345.0;
        }
}


