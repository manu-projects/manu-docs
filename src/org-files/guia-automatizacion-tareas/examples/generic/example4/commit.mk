# - Usamos el concepto de "target de seguimiento"
# - Al pasarle el parámetro "-s" (ó --short) al "git status", éste imprime una breve descripción
#
# - Si el "git status" devuelve un resultado => el "grep ." devolverá el mismo output, y se ejecutará el comando "touch $@"
# - Si el "git status" NO devuelve un resultado => el "grep ." no devolverá nada, y NO se ejecutará el comando "touch $@"
# (Si no se crea el archivo "status", el "rm status" del objetivo "commit" arrojará error, y no se hará el commit)

status:
	@git status -s | grep . && touch $@

.PHONY: commit
commit: status
	rm status; echo -e "simulamos que hacemos un commit..! :o"
