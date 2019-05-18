#include <stdio.h>
#include "y.post.h"
#include "lex.post.h"
#include "lex.notacion.h"
#include "stack.h"
#include <stdlib.h>
#include <string.h>
int main(){
    //declaracion de variables
    FILE *entrada,*res_file,*notacion_file;
    double numero; 
    int res_notacion;
    char notacion[2],resultado_final[100];
    char recepcion[100];
    fgets(recepcion,200,stdin);
    //primera entrada
    printf("se recibe peticion...\n");
    entrada = fopen("dato_entrada.txt","w");
    fprintf(entrada,"%s",recepcion);
    fclose(entrada);
    system("./prueba_analiza < dato_entrada.txt");
    notacion_file = fopen("notacion.txt","r");
    if(notacion_file != NULL){
        fread(notacion,1,sizeof notacion,notacion_file);  
        res_notacion = atoi(notacion);  

        //infijo
        if(res_notacion == 1){
            system("./prueba_infijo < dato_entrada.txt");
            printf("calculando infijo...\n");
        }
        //postfijo
        else if(res_notacion == 2){
            system("./prueba_postfijo < dato_entrada.txt");
            printf("calculando postfijo...\n");
        }
        //prefijo
        else if(res_notacion == 3){
            system("./prueba_prefijo < dato_entrada.txt");
            printf("calculando prefijo...\n");
        }
        res_file = fopen("resultado.txt","r");
        fread(resultado_final,1,sizeof resultado_final,res_file);    
        numero = atof(resultado_final);
        printf("resultado: %.2f\n",numero);
        fclose(res_file);

    }
    return 0;
}