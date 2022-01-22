typedef struct persona {
  char nombre[20];
} persona_t;

void free_persona(void *persona);
void crear_persona(char nombre[5]);
