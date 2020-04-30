# Sincronizar Servicios Cloud con Rclone

## Comandos basicos de Rclone

| Comando                                       | Descripcion                                                    |
| rclone listremotes                            | Lista los servicios                                            |
| rclone config                                 | Muestra la configuracion                                       |
| rclone ls unRemoto:                           | Lista los archivos y directorios de unRemoto                   |
| rclone lsd unRemoto:                          | Lista solo los directorios                                     |
| rclone mkdir unRemoto:unaCarpeta              | Crea el directorio unaCarpeta en el remoto unRemoto            |
| rclone sync unRemoto:unaCarpeta ~/Escritorio/ | Sincroniza contenido del remoto a una carpeta la maquina local |
|                                               |                                                                |

**Observacion:**
Es importante que en los comandos seguido de nombre del remoto Ej. unRemoto, se agreguen dos puntos


## Encriptar archivos 
 - https://rclone.org/crypt/
 - https://www.youtube.com/watch?v=jW_4KRd3Hdo
 - https://www.youtube.com/watch?v=KBr_qf5G4CY
 - https://www.youtube.com/watch?v=-b9Ow2iX2DQ

## Referencias
- [Referencia #1 - Ver video](https://www.youtube.com/watch?v=HblhrGIotFo)
- [Panel de APIs y Servicios (developers.google.com)](https://console.developers.google.com/projectselector2/apis/dashboard)
- [Configurar Google Drive (rclone.org)](https://rclone.org/drive/)
- [Encriptar archivos - Ver Video](https://www.youtube.com/watch?v=jW_4KRd3Hdo)
