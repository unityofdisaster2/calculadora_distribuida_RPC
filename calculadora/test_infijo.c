#include <stdio.h>
#include "y.in.h" /*se llaman bibliotecas de analizador lexico y sintactico*/
#include "lex.in.h"
#include <stdlib.h>
#include <string.h>

//se llama variable externa yyin para uso de archivos como entrada
extern FILE *yyin;
int main(){
    FILE *archivo;
    char cadena[100];
    double res_pref = 0;
    //se obtiene expresion desde consola
    fgets(cadena,100,stdin);
    //se limpia basura de stdin
    fflush(stdin);
    //se muestra en pantalla la cadena ingresada
    printf("cadena: %s\n",cadena);
    //se guarda expresion en un archivo
    archivo = fopen("operacion.txt","w");
    fprintf(archivo,"%s\n",cadena);
    fclose(archivo);
    //se abre archivo en modo lectura y se pasa referencia del archivo a yyin
    archivo = fopen("operacion.txt","r");
    yyin = archivo;
    //se calcula expresion infija y se guarda resultado en archivo de texto
    res_pref = calculadora_infija();
    FILE *resultado_final = fopen("resultado.txt","w");
    if(res_pref != -12345.0){
        fprintf(resultado_final,"%.2f",res_pref);
    }else{
        fprintf(resultado_final," ");
    }
    fclose(resultado_final);
    return 0;
}