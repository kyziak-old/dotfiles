# Archivos de configuración *Dotfiles* 

Esta Readme tiene como propósito guiarme paso a paso en la reproducción de las configuraciones que he realizado  en mi computadora personal, esto porque usualmente olvido qué paquetes y qué cosas he instalado. 

## Tabla de contenidos
1. [Clonación](#clonación)
2. [Paquetes Necesarios](#paquetes-necesarios) 
	2.1 [Arch Linux](#arch-linux)
	2.2 [Ubuntu](#ubuntu)
		2.2.1 [Nodejs](#nodejs)
		2.2.2 [Go](#golang)
3. [Bash](#bash)
4. [Vim](#vim)

## Clonación

En primer lugar, debemos realizar la clonación de este repositorio en un directorio ubicado en `~/.dotfiles`. Para esto, hacemos lo siguiente

Para clonar este repositorio, copiamos y pegamos lo siguiente en la línea de comandos que estemos usando. 
```
git clone git@github.com:kyziak/dotfiles.git ~/.dotfiles
```
Eliminamos todos los archivos de configuración de bash y vim que pudiesen existir
```
rm -rf ~/.vim ~/.bash*
```
Y creamos los links simbólicos correspondientes para usar estos archivos como los de configuración de vim y bash 
* vim </br>
```
ln -nfs $HOME/.dotfiles/vim $HOME/.vim
```
* bashrc </br>
```
ln -nfs $HOME/.dotfiles/bashrc $HOME/.bashrc	
```
* bash_aliases </br>
```
ln -nfs $HOME/.dotfiles/aliases $HOME/.bash_aliases
```

## Paquetes necesarios
Los paquetes necesarios para la instalación de los plugins que uso en vim dependen de dos cosas, si estoy usando [Arch Linux](https://archlinux.org/) o si me encuentro en Windows usando **WSL**, en cuyo caso estaré usando [Ubuntu](https://ubuntu.com/). 

Para ambos, sin embargo, existen configuraciones similares, tales como la instalación de las [NERDFonts](https://github.com/ryanoasis/nerd-fonts) para el uso de los íconos en [NERDTree](://github.com/preservim/nerdtree) y en [airline](https://github.com/vim-airline/vim-airline).

Las fuentes las descargamos del siguiente [link](https://www.nerdfonts.com/font-downloads). Y las instalamos manualmente, yo personalmente tengo preferencia por [JetBrains](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip), así que me dejaré el link a la mano para un futuro. 

Ahora sí procedamos con la instalación de los paquetes requeridos para el uso de los Plugines en vim, y en general para mi vida diaria.

### Arch Linux
Para instalar los paquetes de programación en Arch, corremos el siguiente comando; el cual instalará todo lo necesario. 

```
sudo pacman -S nodejs-lts-fermium go clang texlive-most bash-completion code dmenu dosfstools noto-fonts-cjk ntfs-3g zathura vlc ttf-font-awesome htop jre-openjdk 
```

### Ubuntu
En Ubuntu se requieren algunos paquetes más, ya que por defecto no trae ningún tipo de programa de desarrollo, así que corremos el siguiente comando 
```
sudo apt-get install build-essential texlive-full curl wget cmake python3-dev gcc g++
```
La instalación de fuentes y demás cosas se hacen en Windows. Y como **WSL** no tiene `xserver` entonces no es necesario instalar nada más. Sin embargo, `Nodejs` y `golang` deben ser instalados manualmente, ya que la versión del primero es demasiado vieja y en el segundo no existe forma. 

#### Nodejs
Este tutorial mostrará cómo instalar la versión `14.x` de `Nodejs`, para versiones más recientes use su [buscador](https://duckduckgo.com/) de confianza. Este tutorial, además, hace uso de `nvm` así que dudo que exista pierde para un futuro. 

Lo primero es traerse el script para instalar `nvm`
```
 curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
```
Esto modifca las variables de entorno de bash, entonces accedemos a una nueva bash con 
```
source ~/.bashrc
```

y verificamos que `nvm` funciona listando las versiones de `nodejs`
```
nvm list-remote | less
```
Elegimos la versión a instalar y corremos el siguiente comando (`14.x` en nuestro ejemplo)
```
nvm install v14.18.0
```

Y comprobamos que todo esté bien

```
node -v
```
Lo cual debería mostrarnos la versión de `nodejs` instalada en nuestros computadores. 

#### Golang
Para instalar `Golang` basta con seguir las [instrucciones](https://golang.org/doc/install) presentadas en su página web. Pero, como soy perezoso, lo pondré todo en este lugar. De nuevo, esto aplica para la versión `1.17.2` que es la que tengo instalada al momento de escribir esto, para futuras versiones, revisar la página 
```
curl -c https://golang.org/dl/go1.17.2.linux-amd64.tar.gz
```
extraemos el archivo descargado e instalamos en `/usr/local`
```
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.2.linux-amd64.tar.gz
```
En mi bashrc ya está `golang` agregado en el `$PATH`, así que omitiremos este paso que indica la guía de instalación e iremos por la verificación de la versión directamente. 
```
go version
```


## Bash

## Vim
