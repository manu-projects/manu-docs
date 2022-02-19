FROM pandoc/core

RUN apk add --no-cache make rsync

# creamos grupo (gid=901) y usuario (uid=901)
RUN addgroup -g 1000 -S pandoc && \
    adduser -u 1000 -G pandoc -D pandoc
# cambiamos al usuario sin privilegios root (por defecto es root)
USER pandoc

WORKDIR /data
COPY export.mk .
COPY functions.mk .
COPY ./docs ./docs
COPY ./src/views ./src/views

# el punto de entrada por defecto de la imagen base es /bin/pandoc
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["make --no-print-directory -f export.mk watch"]