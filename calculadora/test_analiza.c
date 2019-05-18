#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "lex.notacion.h"
#include "stack.h"
extern FILE *yyin;

int main(){
        char cadena[100];
        fgets(cadena,100,stdin);
        int tipo_notacion;
        FILE *entrada = fopen("cadena.txt","w");
        fprintf(entrada,"%s\n",cadena);
        fclose(entrada);
        entrada = fopen("cadena.txt","r");
        yyin = entrada;
        tipo_notacion = checar_notacion();
        FILE *salida = fopen("notacion.txt","w");
        fprintf(salida,"%d",tipo_notacion);
        fclose(salida);
        fclose(entrada);
        return 0;
}
