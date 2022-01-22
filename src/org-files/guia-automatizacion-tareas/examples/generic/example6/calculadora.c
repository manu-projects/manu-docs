#include <stdio.h>
#include "operaciones.h"

int main(void){
  printf("Hola..!\n");

  boton_t botonSumar;
  botonSumar.simbolo = '+';
  botonSumar.tipo = OPERACION;

  int a = 2, b = 3;
  printf("La suma de %d y %d es %d\n", a, b, sumar(a, b));
  printf("La resta entre %d y %d es %d\n", a, b, restar(a, b));

  return 0;
}
