/*** Seccion de variables accesibles
dentro de yylex() y la funcion principal main()***/
%{ 
//se agrega la cabecera para usar la estructura de pila
#include "stack.h"

pila p;
int tamano = 0,i;
char *copia;
%} 
  
/*** Seccion de reglas  
Primera regla: encargada de encontrar los patrones que coincidan con
funciones de calculadora cientifica
Segunda regla: encargada de encontrar los patrones que coincidan con numeros flotantes
Tercera regla: encargada de encontrar e ignorar espacios
Cuarta regla: cuando se encuentre salto de linea se termina el analisis
cada que se encuentre un elemento que coincida con el paton se agrega a la pila
***/
%% 
cos|sin|tan|cot|log|ln|sqrt|sec|csc|\+|\-|\/|\(|\)|\*|\^  {copia = malloc(sizeof(yytext));
       strcpy(copia,yytext);
       push(&p,copia);} 
[\-]?[0-9]*\.?[0-9]+   {copia = malloc(sizeof(yytext));
       strcpy(copia,yytext);
       push(&p,copia);} 
[ ]  {}
\n    {return 0;} 
%% 
  
/*** Seccion de codigo***/
int yywrap(){} 
int checar_notacion();
int check_num(char *cadena);


/*funcion encargada de verificar en que notacion esta la cadena analizada*/
int checar_notacion(){
	//se inicializa pila
    inicializa(&p);
	//se ejecuta analisis lexico
    yylex();
    //se crean variables para analizar el ultimo y penultimo simbolo de la pila
	char *sim1,*sim2;
	int respuesta = -1;
	sim1 = pop(&p);
	sim2 = pop(&p);
	//si el ultimo valor es parentesis o el ultimo es numero y el penultimo es operador
	//respuesta 1 es infijo
	if(strcmp(sim1,")") == 0  || check_num(sim1) == 1 && check_num(sim2) == 0){

		respuesta = 1;
	}
	//si el ultumo valor es un operador es postfija
	//respuesta 2 expresion postfija
	else if(check_num(sim1) == 0){

		respuesta = 2;
	}
	//si los ultimos dos valores son numeros es prefija
	//respuesta 3 expresion prefija
	else if(check_num(sim1) == 1 && check_num(sim2) == 1){

		respuesta = 3;
	}
	push(&p,sim2);
	push(&p,sim1);
	return respuesta;
}

/*funcion encargada de verificar si el valor es numerico u operador*/
int check_num(char *cadena){
	switch(cadena[0]){
		case '0':
		case '1':
		case '2':
		case '3':
		case '4':
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
			return 1;
		default:
			return 0;
	}
}       
