#include <stdio.h>
#include "y.post.h"
#include "lex.post.h"
#include <stdlib.h>
#include <string.h>
extern FILE *yyin;
int main(){
    FILE *archivo;
    char *cadena;
    fgets(cadena,100,stdin);
    fflush(stdin);
    printf("cadena: %s\n",cadena);
    archivo = fopen("operacion.txt","w");
    fprintf(archivo,"%s\n",cadena);
    fclose(archivo);
    archivo = fopen("operacion.txt","r");
    yyin = archivo;
    printf("resultado: %.2f\n",calculadora_postfija());

}