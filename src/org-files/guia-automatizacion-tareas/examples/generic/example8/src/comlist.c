#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <commons/collections/list.h>
#include "comlist.h"

void free_persona(void* persona){
  free(persona);
  // a...
}

int main(void){
  t_list* lista = list_create();

  persona_t* persona1 = malloc(sizeof(persona_t));
  persona_t* persona2 = malloc(sizeof(persona_t));

  strcpy(persona1->nombre, "pedro");
  strcpy(persona2->nombre, "carlitos");

  list_add(lista, persona1);
  list_add(lista, persona2);

  printf("Hola %s\n", (char*) list_get(lista, 0));

  list_destroy_and_destroy_elements(lista, (void*)free_persona);

  return 0;
}
