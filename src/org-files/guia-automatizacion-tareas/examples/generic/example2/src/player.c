#include <stdio.h>
#include <string.h>
#include "../include/player.h"

char* getNombreJugador(){
  return "Jugador";
}

void saludar(){
  printf("Hola tu fuerza es %d..!\n", MAX_FUERZA);
}

void imprimirDatos(Jugador jugador){
  printf("nombre:%s\n", jugador.nombre);
}

Jugador jugador(char nombre[255], int fuerza, int velocidad){
  Jugador jugadorAux;
  strcpy(jugadorAux.nombre, nombre);
  jugadorAux.fuerza = fuerza;
  jugadorAux.velocidad = velocidad;

  return jugadorAux;
}
