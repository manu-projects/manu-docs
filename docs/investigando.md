
# Vagrant

Boxes donde ya se pueden ver otros
https://app.vagrantup.com/boxes/search

#1. Instalación
https://linuxize.com/post/how-to-install-vagrant-on-ubuntu-18-04/
#2. Configuración
```bash
vagrant init
vagrant box add ubuntu/precise64 # descargamos ubuntu
# ubuntu/bionic64
```

#Posibles errores
## 1.
https://superuser.com/questions/614941/vagrant-fails-to-create-box-with-libvirt

# 2.
https://rstopup.com/error-al-intentar-vagrant-up.html
$ vagrant box list
Vas a ver algo como laravel/homestead(virtualbox,x.x.x)
Siguiente localizar su Vagrantfile y busque la línea que dice
config.vm.box = "box"
reemplazar box con el nombre de cuadro cuando se ejecuta vagrant box list.

- - -
# Referencias
- General
    - Referencia #1 [Ver Video](https://www.youtube.com/watch?v=UFE-Nz9cxJg)
- Vagrant
    - Pagina Oficial [Ver Página](https://www.vagrantup.com/downloads.html)
    - Referencia #1 [Ver Video](https://www.youtube.com/watch?v=Ud7cmVCNACE&list=PLTd5ehIj0goPCodyeh2ThX37Ceh-2torY)
- Ansible
    - Referencia #1 [Ver Video](https://www.youtube.com/watch?v=slNIwBPeQvE&list=PLTd5ehIj0goP2RSCvTiz3-Cko8U6SQV1P)
- Dotfiles
    - #Referencia #1 https://victoria.dev/blog/how-to-set-up-a-fresh-ubuntu-desktop-using-only-dotfiles-and-bash-scripts/
    - Referencia #2 [Ver Página](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)
    - Referencia #3 [Ver Página](https://www.atareao.es/podcast/dotfiles-o-archivos-de-configuracion/)
    - Referencia #4 [Ver Página](https://github.com/webpro/awesome-dotfiles#tools)
    - Referencia #5 [Ver Página](https://pragdave.me/blog/2018/08/28/maintaining-dotfiles.html)

