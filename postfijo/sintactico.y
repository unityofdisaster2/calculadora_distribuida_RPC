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
calculadora: expr {resultado = $1;};

expr: NUMBER {$$ = $1;}
    | expr expr '+' {$$ = $1 + $2;}
    | expr expr '-' {$$ = $1 - $2;}
    | expr expr '*' {$$ = $1 * $2;}
    | expr expr '/' {$$ = $1 / $2;}
    | expr expr  '^' {$$ = pow($1, $2);}
    | expr SIN {$$ = sin($2);}
    | expr COS {$$ = cos($2);}
    | expr TAN {$$ = tan($2);}
    | expr COT {$$ = 1/tan($2);}
    | expr CSC {$$ = 1/sin($2);}
    | expr SEC {$$ = 1/cos($2);}
    | expr LOG {$$ = log($2);}
    | expr SQRT {$$ = sqrt($2);};

%%

//zona de codigo

//funcion para desplegar mensaje en caso de que la cadena no cumpla con alguna condicion


void yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
        //Se levanta la bandera de error
        error_flag = 1;
} 


double calculadora_postfija(){
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





