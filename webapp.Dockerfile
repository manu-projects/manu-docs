FROM node:16-alpine

# ---------------------------------------------------------------------------
# Capas exteriores (rara vez sufren modificaciones, docker lo guarda como caché y acelera el build)
RUN apk add --no-cache rsync
# modifica `~/.npmrc` deshabilitando mensajes innecesarios
RUN npm config set fund false
# necesario para correr gulp por terminal
RUN npm install -g gulp

COPY package*.json /tmp/
RUN cd /tmp && npm install

# crea/accede a la ruta del contenedor, la usará como ruta relativa
WORKDIR /opt/manu-docs
# copiamos los ficheros(enlaces simbólicos+permisos) aplicando compresión en los datos
RUN rsync -az /tmp/node_modules .

# ---------------------------------------------------------------------------
# Capas interiores (requieren cambios frecuentes, ante algún cambio se vuelven a ejecutar en el build)

# copiamos archivos de `.` (host) al workdir (contenedor)
COPY . .
# exponemos el puerto del contenedor
EXPOSE 3000

# se ejecuta al iniciar el contenedor (será sustituido si pasamos parámetros al correr el contenedor)
USER node
CMD ["gulp"]
