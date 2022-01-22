# make -f backup.mk
#
BACKUP_PATH = ./backups

# - Target/Objetivo:
# Como los directorios también son un tipo de archivo,
# lo usamos como target para indicar donde copiar los archivos,
# con ayuda de la macro $@ en la rutina que usa el comando "rsync" (similar al cp)
#
# - Dependencias:
# Sólo tenemos una dependencia y es "."
# como "." es un directorio (apunta a la ruta actual) también es un archivo
# lo usamos como dependencia, y la obtenemos en la rutina con la macro $<
# también en el comando "rsync"
#
# Observaciones:
# - el "." es un hardlink porque apunta al mismo inodo que el diretorio que lo contiene
# podemos verlo usando "stat ." y "stat rutaDelDirectorio" ó también con "ls -lai rutaDelDirectorio"
# - Con $< obtenemos la primera dependencia
# - Con $@ nos devuelve el nombre del target
# - Con el parámetro "a" en rsync mantendrá los symbolic links, los permisos (rwx) de cada archivo, entre otras cosas..
$(BACKUP_PATH): .
	rsync -avz $< $@
