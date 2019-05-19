#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "lex.notacion.h"
#include "stack.h"

int main(){
        int tipo_notacion;
        tipo_notacion = checar_notacion();
        FILE *salida = fopen("notacion.txt","w");
        fprintf(salida,"%d",tipo_notacion);
        fclose(salida);
        return 0;
}
