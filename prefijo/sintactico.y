%{
#include <stdio.h>
#include <string.h>
#include <math.h>
//se define el tipo de dato que se manejara en la pila de yacc
#define YYSTYPE double
double resultado;
int flag_error = 0;
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
calculadora: E {resultado = $$;};

E: NUMBER { $$ = $1; }
| '+' E E  { $$ = $2 + $3; }
| '-' E E  { $$ = $2 - $3; }
| '*' E E  { $$ = $2 * $3; }
| '/' E E  { $$ = $2 / $3; }
| '^' E E  { $$ = pow($2, $3); }
| COS E    { $$ = cos($2); }
| SIN E    { $$ = sin($2); }
| TAN E    { $$ = tan($2); }
| COT E    { $$ = 1/tan($2); }
| CSC E    { $$ = 1/sin($2); }
| SEC E    { $$ = 1/cos($2); }
| LOG E    { $$ = log($2); }
| SQRT E    { $$ = sqrt($2); }
;

%%

//zona de codigo

//funcion para desplegar mensaje en caso de que la cadena no cumpla con alguna condicion




void yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
        //Se levanta la bandera de error
        flag_error = 1;
}

double calculadora_prefija(){
        //funcion para comenzar con el analisis sintactico 
        yyparse();
        //si el analisis se realizo exitosamente se retorna el resultado, en caso contrario
        //Se maneja el codigo de error -12345.0          
        if(flag_error == 0 ){
                return resultado;
        }else{
                return -12345.0;
        }
}

