# Avanzando con Spacemacs

<img src="/images/spacemacs.png">

## 1. Tips - Importantes

Para que se guarden los cambios de la agenda, y se puedan filtrar usar `M-x org-agenda-file-to-front`
Para abrir la agenda `C-c a`

| Comando                                                          | Descripcion             |
| :------                                                          | :---------              |
| <kbd>SPC</kbd> <kbd>q</kbd> <kbd>r</kbd>                         | Reiniciar spacemacs     |
| <kbd>M</kbd> <kbd>m</kbd> <kbd>f</kbd> <kbd>e</kbd> <kbd>R</kbd> | Aplicar configuraciones |


#### 1.2 Atajos con Treemacs/Neotree
| Comando                                                          | Descripcion       |
| :------                                                          | :---------        |
| <kbd>C</kbd> <kbd>c</kbd> <kbd>C</kbd> <kbd>p</kbd> <kbd>a</kbd> | Agregar proyecto  |
| <kbd>C</kbd> <kbd>c</kbd> <kbd>C</kbd> <kbd>p</kbd> <kbd>d</kbd> | Eliminar proyecto |


#### 1.3 Atajos con Projectfile
| Comando                             | Descripcion                                 |
| :------                             | :---------                                  |
| SPC p f                             | Abrir algun archivo del proyecto actual     |
| SPC f r                             | Abrir algun archivo reciente (recent files** |
| SPC p p                             | Cambiar del proyecto actual a otro          |
| M-x projectile-remove-known-project | Eliminar alguno de los proyectos agregados  |

#### 1.4 Referencias

**Sitios web recomendados**

- Referencia #1 - Spacemacs.org, Develop [Ver Pagina](https://develop.spacemacs.org/layers/+filetree/neotree/README.html)
- Referencia #2 - Spacemacs.org, Develop [Ver Pagina](https://develop.spacemacs.org/layers/+filetree/treemacs/README.html)

**Videos recomendados:**

- Referencia #3 - Github, Alexander Miller [Ver Pagina](https://github.com/Alexander-Miller/treemacs)
- Referencia #1 [Ver Video](https://www.youtube.com/watch?v=Bu7nF9hPSts)
- Referencia #2 [Ver Video](https://www.youtube.com/watch?v=Rx3wRl5d-J0)
- Referencia #3 [Ver Video](https://www.youtube.com/watch?v=OrTJ17ivOL0)
- Referencia #4 [Ver Video](https://www.youtube.com/watch?v=Z88ZmeMo1X0)
- Referencia #5 [Ver Video](https://www.youtube.com/watch?v=kPVVuJWS2vo)
 
- - -

## 2. Atajos en Hybrid Mode

El modo hibrido es una combinacion entre el **holy mode** (atajos de emacs) 
y el **evil mode** (atajos de vim). El atajo **SPC** suele ser la tecla **espacio**

#### 2.1 Atajos en Evil Mode (Vim)

| Comando     | Descripción                                          |
| :---------- | :-----------                                         |
| SPC f t     | Abrir gestor de archivos Neotree/Treemac (file tree) |
| SPC f f     | Buscar un archivo (find file)                        |
| SPC f s     | Guardar archivo                                      |
| v           | Seleccionar/Deseleccionar texto                      |


#### 2.2 Atajos en Holy Mode (Emacs)

La metakey **M** suele referirse a la tecla **Alt** seguido a la tecla que haga referencia.
Mientras que **C** es la tecla **Control** seguido de la tecla que se mencione.

| Comando     | Descripción                               |
| :---------- | :-----------                              |
| C-1         | Cierra todos los buffer excepto el actual |
| C-0         | Cierra el buffer actual                   |
| C-2         | Abre un buffer horizontal al actual       |
| C-3         | Abre un buffer vertical al actual         |
| C-x k       | Matar el buffer actual                    |
| C-Shift-Del | Borra una linea entera                    |
| M-%         | Reemplazar palabras                       |
| M-m f-t     | Gestor de archivos Neotree/Treemacs       |
| C-k         | Borrar una linea                          |
| C-e         | Ir al final de la linea                   |
| C-Inicio    | Ir al principio del archivo               |
| C-Fin       | Ir al final del archivo                   |
| C-x C-+     | Aumentar el tamaño de texto               |
| C-x C--     | Disminuir el tamaño de texto              |

**Observacion:***
>El gestor de archivos Neotree/Treemacs es similar al **dired**, con la diferencia
>que este ocupa menos espacio en la pantalla

- - -

## 3. Ecuaciones algebraicas

#### 3.1 Configuraciones

1- Agregar o descomentar las siguientes lineas en los layers de .spacemacs

```
latex
bibtex
auto-completion
```

2- Agregar la siguiente configuracion dentro de user-config de .spacemacs

```
  ;; Aumentamos el tamaño del texto que suele aparecer en tamaño chico
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0)** 
```

3- Aplicar los cambios reiniciando spacemacs con ``SPC-q-r`` 

#### 3.2 Como escribir las ecuaciones

1- Para escribir ecuaciones debemos encerrarlas con el simbolo pesos **$$**

Ej.

```
$$ 4x^2 = 16 \times \frac{2}{4x} $$
```

2- Para visualizar ejecutar `C-c C-x C-l` o  `, T x`
3- Para mostrar el texto en formato latex ejecutar `C-c C-c` o `, ,`

> **Observacion:** Si queremos que muestren todas las formulas al abrir un documento, agregar al principio
> del archivo la siguiente linea

```
#+STARTUP: latexpreview
```

#### 3.3 Posibles Errores

1. No nos permita ver una vista preliminar del archivo

```
>File "/tmp/orgtex9997XKu.dvi" wasn't produced. Please adjust 'dvipng' part of `org-preview-latex-process-alist'.
>Found a log is generated, /tmp/orgtex9997XKu.log. Something interesting is in this log: "LaTeX Error: File `wrapfig.sty' >not found.** Then a quick search tells me texlive-latex-extra package is missing.
```

**Solucion:**

1- En la terminal instalar el paquete ``texlive-latex-extra`` y ``texlive-bin``

```
 sudo pacman -S textlive-latex-extra
 sudo pacman -S textlive-bin
```
 
2. Agregar configuracion en el **user-config** del archivo **.spacemacs** 

```
 ;; (setq org-latex-create-formula-image-program 'imagemagick)
 (setq org-latex-create-formula-image-program 'dvipng)
 ;;(setq-default org-html-with-latex `dvipng)
```

**Referencias puntuales a los errores mencionados:**
 
 - [Referencia #1 (reddit.com)](https://www.reddit.com/r/emacs/comments/5rf9d4/help_org_setup_preview_latex_fragments/)
 - [Referencia #2 (emacs.stackexchange.com)](https://emacs.stackexchange.com/questions/18627/preview-latex-fragment-in-org-mode-blank-square-shown)
 - [Referencia #3 (sourceforge.net)](https://sourceforge.net/projects/dvipng/)
 - [Referencia #4 (ecuadorminingnews.com)](https://ecuadorminingnews.com/install-texlive-bin/)
 -[Referencia #5 (bbs.archlinux.org)](https://bbs.archlinux.org/viewtopic.php?id=168634)
 - [Referencia #6 (stackoverflow.com)](https://stackoverflow.com/questions/30151338/org-latex-preview-is-fuzzy-on-retina-displays)
 - [PDF-tools (github.com)](https://github.com/politza/pdf-tools)

#### 3.4 Referencias

- [Lista de simbolos (orgmode.org)](https://orgmode.org/worg/org-symbols.html)
- [Tutorial (orgmode.org)](https://orgmode.org/worg/org-tutorials/org-latex-preview.html)
- [Tutorial #2 (orgmode.org)](https://orgmode.org/manual/LaTeX-fragments.html)
- [Aumentar tamaño del texto #1 (emacs.stackexchange.com)](https://emacs.stackexchange.com/questions/19880/font-size-control-of-latex-previews-in-org-files)
- [Aumentar tamaño del texto #2 (tex.stackexchange.com)](https://tex.stackexchange.com/questions/78501/change-size-of-the-inline-image-for-latex-fragment-in-emacs-org-mode)


- - -

## 4. Referencias de Sitios Web

#### 4.1 Guias basicas

- Referencia #1 - CharlasCyclon.com - [Ver Pagina](https://charlascylon.com/2017-09-20-spacemacs-mi-configuracion-personal)
- Referencia #2 - Medium.com, Kokegudiel2 - [Ver Pagina](https://medium.com/@kokegudiel2/configuari%C3%B3n-de-spacemacs-para-principiantes-ed43ddf3030f)

#### 4.2 Guias Avanzadas

- Referencia #1 - Wiki, ArchLinux - [Ver Pagina](https://wiki.archlinux.org/index.php/Spacemacs)
- Referencia #2 - Github, Syl20bnr - [Ver Pagina](https://github.com/syl20bnr/spacemacs/blob/master/doc/DOCUMENTATION.org)

#### 4.3 Capas (Layers)

Subprogramas que agregan funcionalidad a spacemacs

- Referencia #1, Spacemacs.org - [Ver Pagina](https://www.spacemacs.org/layers/LAYERS.html)

#### 4.4 Themes

Para cambiar el estilo, la visualizacion, diseño, el color fondo y del texto,..

- Themes, ThemeGallery [Ver Pagina](https://themegallery.robdor.com/)

#### 4.5 Fuentes

El tipo de fuente, puede hacer mas entendible, claro, y ameno luego de muchas horas de lectura.

- Referencia #1 - SourceFoundry.org - [Ver Pagina](https://sourcefoundry.org/hack/playground.html)
- Referencia #2 - Opensource.com - [Ver Pagina](https://opensource.com/article/17/11/how-select-open-source-programming-font)

#### 4.6 Configuraciones de Spacemacs

Las configuraciones se hacen en el archivo **~/.spacemacs**

- Referencia #1 - Out of cheese error - [Ver Pagina](https://out-of-cheese-error.netlify.com/spacemacs-config)
- Referencia #2 - Practicalli - [Ver Pagina](https://practicalli.github.io/spacemacs/install-spacemacs/additional-configuration.html)


## 5. Referencias de Videos

#### 5.1 Canales Favoritos

Conceptos, Atajos, Herramientas, etc.

- Referencia #1 - [Ir a canal](https://www.youtube.com/watch?v=MRYzPWnk2mE&list=PLxj9UAX4Em-IiOfvF2Qs742LxEK4owSkr)
- Referencia #2 - [Ir a Canal](https://www.youtube.com/watch?v=d6iY_1aMzeg&list=PLX2044Ew-UVVv31a0-Qn3dA6Sd_-NyA1n)
- Referencia #3 - [Ir a Canal](https://www.youtube.com/watch?v=BRqjaN4-gGQ&list=PLhXZp00uXBk4np17N39WvB80zgxlZfVwj)

#### 5.2 Configuraciones basicas

Para los que recien estan iniciandose

- Referencia #1 - [Ver Video](https://www.youtube.com/watch?v=8k7BTIqufqQ)
- Referencia #2 - [Ver Video](https://www.youtube.com/watch?v=Ie4z9-z948c)
- Referencia #3 - [Ver video](https://www.youtube.com/watch?v=PKaJoqQQoIA)

#### 5.3 Buffers, ibuffer y Emmet

- Referencia #1 [Ver Video](https://www.youtube.com/watch?v=yUfA-7wWNKA)

#### 5.4 Personalizando la terminal

- Referencia #1 [Ver Video](https://www.youtube.com/watch?v=L9vA7FHoQnk)
