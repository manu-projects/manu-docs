## 1. Permisos
## Diferencias entre chmod
> chmod sirve para modificar los permisos

**Lo más recomendado es lo siguiente**
#### 1.1 Dar todos los permisos
Al usuario actual le da todos los permisos, lectura(r) / escritura(w) / ejecucion (x)
`chmod u=rwx archivo.zip`

#### 1.2 Otorgar al grupo permisos de Lectura y ejecución
`chmod g=rx archivo.zip`

#### 1.3 Otrogar a invitados permisos sólo de ejecución
`chmod o=x archivo.zip`

#### 1.4 Otras maneras de dar o quitar permisos
chmod +w archivo.zipagrega permisos de escritura al usuario

#### 1.5 Remover al usuario actual los permisos de escritura
`chmod -w archivo.zip`

#### 1.6 Otorgar al usuario actual permisos de lectura, ejecución pero no de escritura
`chmod u=rx archivo.zip`
