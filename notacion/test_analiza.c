#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "lex.notacion.h"
#include "stack.h"
/*
Se llama de forma externa a la variable yyin
en esta variable podemos asignar el apuntador de un archivo
para que en analisis lexico se realice con base en el texto contenido en el archivo
en caso contrario esperara una entrada desde consola.*/
extern FILE *yyin;



int main(){
        //Se crea variable cadena y se lee desde consola la cadena que se desea analizar
        char cadena[100];
        fgets(cadena,100,stdin);
        int tipo_notacion;
        //se crea archivo donde se guardara cadena que sera analizada
        FILE *entrada = fopen("cadena.txt","w");
        fprintf(entrada,"%s\n",cadena);
        fclose(entrada);
        entrada = fopen("cadena.txt","r");
        //se asigna referencia del archivo a yyin
        yyin = entrada;
        //se guarda en tipo_notacion resultado de analisis de notacion
        tipo_notacion = checar_notacion();
        //se guarda resultado en archivo ntacion
        FILE *salida = fopen("notacion.txt","w");
        fprintf(salida,"%d",tipo_notacion);
        fclose(salida);        
        fclose(entrada);
        return 0;
}

