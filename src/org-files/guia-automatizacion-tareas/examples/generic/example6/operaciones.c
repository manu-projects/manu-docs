#include <stdio.h>
#include "operaciones.h"
#include "lib.h"

#ifndef OPERACIONES_H
#define OPERACIONES_H

int sumar(int a, int b){
  return a + b;
}

int restar(int a, int b){
  return a - b;
}

int operacionCompleja(int x){
  return 0;
  /* return xcos(x) - 1; */
}

#endif
