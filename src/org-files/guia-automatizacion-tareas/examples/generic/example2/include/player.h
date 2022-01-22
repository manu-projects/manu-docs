#ifndef PLAYER_H
#define PLAYER_H

#define MAX_FUERZA 500

typedef struct {
  char nombre[255];
  int fuerza;
  int velocidad;
} Jugador;


Jugador jugador(char nombre[255], int fuerza, int velocidad);
void imprimirDatos(Jugador jugador);
char* getNombreJugador();
void saludar();
void wo();

#endif
