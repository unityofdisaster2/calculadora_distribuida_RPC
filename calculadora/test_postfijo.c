#include <stdio.h>
#include "y.post.h" /*se llaman bibliotecas de analizador lexico y sintactico*/
#include "lex.post.h"
#include <stdlib.h>
#include <string.h>

//se llama variable externa yyin para uso de archivos como entrada
extern FILE *yyin;
int main(){
    double res_pref = 0;
    res_pref = calculadora_postfija();
    FILE *resultado_final = fopen("resultado.txt","w");
    if(res_pref != -12345.0){
        fprintf(resultado_final,"%.2f",res_pref);
    }else{
        fprintf(resultado_final," ");
    }
    fclose(resultado_final);
    return 0;
}