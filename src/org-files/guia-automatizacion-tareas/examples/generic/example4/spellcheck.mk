# make -f spellcheck.mk

# Ejemplos básicos con el comando "hunspell" para entrar en contexto
#
# 1. echo "hola que tal commo" | hunspell -d dict-es/es_AR
# 2. hunspell -d dict-es/es_AR *.org
# 3. hunspell -d dict-es/es_AR <*.org

# - Si hay algún error de ortografía => makefile arrojará un error (exit 2),
# caso contrario no dirá nada
# - Es útil si queremos validar la documentación de un proyecto,
# porque quizás es compartido por otros, que no lo validaron en su editor
# - Si tenemos el diccionario es_AR instalado, no sería necesario indicar la ruta
# como hacemos en este ejemplo..
#
# https://www.cyberciti.biz/faq/shell-how-to-determine-the-exit-status-of-linux-and-unix-command/
.PONY: spellcheck
spellcheck:
	@hunspell -d dict-es/es_AR -l *.org | grep . && exit 2 || exit 0
#	@exit 2 # <- por si queremos probar como se comporta makefile ante un exit status

