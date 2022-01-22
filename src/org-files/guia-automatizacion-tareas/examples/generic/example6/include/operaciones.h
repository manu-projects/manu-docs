int sumar(int a, int b);
int restar(int a, int b);
int operacionCompleja(int x);

enum TIPO_BOTON {
  OPERACION,
  NUMERO,
  LETRA,
};

typedef struct boton {
  char simbolo;
  enum TIPO_BOTON tipo;
} boton_t;
