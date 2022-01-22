ARCHIVO = archivos.tar.gz

# - Usamos "tar" para comprimir con -z para que sea con gzip
# - Con $@ agarramos el nombre del target, osea el nombre de archivo a crear
# - Con $< obtenemos la primera dependencia que es el hardlink "." que apunta al mismo
# inodo que el directorio que lo contiene
$(ARCHIVO): .
	tar -czf $@ $<
