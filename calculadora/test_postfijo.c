#include <stdio.h>
#include "y.post.h" /*se llaman bibliotecas de analizador lexico y sintactico*/
#include "lex.post.h"
#include <stdlib.h>
#include <string.h>

int main(){
    //no es necesario usar alguna variable para lectura de datos en consola
    //ya que la funcion yyparse contenida en calculadora lo hace automaticamente      
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