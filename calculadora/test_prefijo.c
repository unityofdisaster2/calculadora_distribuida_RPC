#include <stdio.h>
#include "y.pre.h" /*se llaman bibliotecas de analizador lexico y sintactico*/
#include "lex.pre.h"
#include <stdlib.h>
#include <string.h>

//se llama variable externa yyin para uso de archivos como entrada
extern FILE *yyin;
int main(){
    double res_pref = 0;
    //se calcula expresion prefija y se guarda resultado en archivo de texto
    res_pref = calculadora_prefija();
    FILE *resultado_final = fopen("resultado.txt","w");
    if(res_pref != -12345.0){
        fprintf(resultado_final,"%.2f",res_pref);
    }else{
        fprintf(resultado_final," ");
    }
    fclose(resultado_final);
    return 0;
}

