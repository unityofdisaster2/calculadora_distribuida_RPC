#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "stack.h"


/*
Funcion para inicializar todas las variables contenidas
en la pila
Recibe como argumento un apuntador a pila
*/
void inicializa(pila *p){
    p->actual = NULL;
    p->aux = NULL;
    p->size_pila = 0;
}

/*
Funcion para guardar un valor dentro de la pila
Recibe como argumento apuntador a pila y el valor que se desea ingresar
*/
void push(pila *p,char* valor){
    //se crea nodo auxiliar, se guarda valor y se inicializan sus elementos
    p->aux = malloc(sizeof(nodo));
    p->aux->valor = valor;
    p->aux->anterior = NULL;
    //se monitorea el tamanio de la pila
    p->size_pila+=1;
    //si es el primer nodo no se liga con nada los apuntadores
    if(p->actual == NULL){
        p->actual = p->aux;
        p->actual->anterior = NULL;
    }else{
        //si hay mas de un nodo se liga el nodo anterior con el actual 
        p->aux->anterior = p->actual;
        //ahora el nodo actual se iguala con el auxiliar
        p->actual = p->aux;
    }
}
/*
funcion para extraer un elemento de la pila (estos se extraen de la forma: el
ultimo en entrar es el primero en salir)
Recibe como argumento un apuntador a pila
*/
char *pop(pila *p){
    char *ret_val;
    //si la pila esta vacia se retorna -1
    if(p->actual == NULL){
        char *ret = "-1";
        return ret;
    }else{
        //si tiene elementos la pila se decrementa el contador del tamanio
        p->size_pila -=1;
        //se guarda el valor del nodo en variable
        ret_val = p->actual->valor;
        //se liga nodo auxiliar con actual y el actual con su antecesor
        p->aux = p->actual;
        p->actual = p->actual->anterior;
        //se elimina de memoria el nodo auxiliar
        p->aux = NULL;
        free(p->aux);
        return ret_val;
    }
}

/*
Funcion para obtener el valor que se encuentre en el tope de la pila
recibe como argumento una pila
*/
char *tope(pila p){
    if(p.actual == NULL){
        char *ret = "-1";
        return ret;
    }else{
        return p.actual->valor;
    }
}

/*
Funcion para obtener el tamanio de la pila
recibe como argumento una pila
*/
int tamanio_pila(pila p){
    if(p.actual != NULL){
        return p.size_pila;
    }
    return -1;
}

/*
Funcion para liberar memoria cuando ya no sea necesario usar la pila
*/
void libera_memoria(pila *p){
    while(strcat(pop(p),"-1"));
    free(p);
    p = NULL;
}