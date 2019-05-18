#include <stdio.h>
#include <stdlib.h>


typedef struct s_nodo{
    char *valor;
    struct s_nodo *anterior;
}nodo;

typedef nodo *apu_nodo;

typedef struct s_pila{
    apu_nodo aux,actual;
    int size_pila;
}pila;

void inicializa(pila *p);

void push(pila *p,char *valor);

char *pop(pila *p);

char *tope(pila p);

int tamanio_pila(pila p);

void libera_memoria(pila *p);