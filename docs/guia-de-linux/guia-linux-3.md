# Guia de Linux - Configuración

## 1. Crear un Alias
>Los **alias** nos permiten ejecutar comandos con un nombre personalizado.
>Puede darse que querramos ejecutar un programa con varios parámetros, con
>solo escribir en la terminal una palabra, que sería más fácil de recordar.

```bash
sudo nano ~/.bashrc # accedemos al archivo .bashrc para modificar

# creamos el alias 'emacs' cada vez que se ejecute en la terminal
# en realidad ejecutará el comando 'emacs -nw' es decir con ese otro parámetro
sed -i "1ialias emacs = 'emacs -nw'"
```

# Referencias
- Como crear referencias [Ver Página](https://vitux.com/how-to-create-aliases-for-customizing-commands-in-ubuntu/)
