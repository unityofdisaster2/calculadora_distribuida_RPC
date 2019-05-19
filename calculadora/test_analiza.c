#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "lex.notacion.h"
#include "stack.h"

int main(){
		//no es necesario usar alguna variable para lectura de datos en consola
		//ya que la funcion yyparse contenida en checar_notacion lo hace automaticamente
        int tipo_notacion;
        tipo_notacion = checar_notacion();
        FILE *salida = fopen("notacion.txt","w");
        fprintf(salida,"%d",tipo_notacion);
        fclose(salida);
        return 0;
}
