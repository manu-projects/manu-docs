#include <stdio.h>
#include "../include/player.h"

int main(void){
  printf("La app..!\n");
  saludar();

  Jugador carlitos = jugador("carlitos", 10, 15);
  imprimirDatos(carlitos);

  return 0;
}
