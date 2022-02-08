# Archivos de configuración *Dotfiles* 

Esta Readme tiene como propósito guiarme paso a paso en la reproducción de las configuraciones que he realizado  en mi computadora personal, esto porque usualmente olvido qué paquetes y qué cosas he instalado. 

## Tabla de contenidos
- [Clonación](#clonación)
- [Paquetes Necesarios](#paquetes-necesarios) 
	- [Arch Linux](#arch-linux)
	- [Ubuntu](#ubuntu)
		- [Nodejs](#nodejs)
		- [Go](#golang)
- [Vim](#vim)
	- [Go](#go)
	- [Javascript](#javascript)
	- [Plugins](#plugins)

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

Para ambos, sin embargo, existen configuraciones similares, tales como la instalación de las [NERDFonts](https://github.com/ryanoasis/nerd-fonts) para el uso de los íconos en [NERDTree](https://github.com/preservim/nerdtree) y en [airline](https://github.com/vim-airline/vim-airline).

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
sudo apt-get install build-essential texlive-full curl wget cmake python3-dev gcc g++ python3.9-full bash-completion openjdk-jre
```
La instalación de fuentes y demás cosas se hacen en Windows. Y como **WSL** no tiene `xserver` entonces no es necesario instalar nada más. Sin embargo, `Nodejs` y `golang` deben ser instalados manualmente, ya que la versión del primero es demasiado vieja y en el segundo no existe forma. 

#### Nodejs
Este tutorial mostrará cómo instalar la versión `14.x` de `Nodejs`, para versiones más recientes use su [buscador](https://duckduckgo.com/) de confianza. Este tutorial, además, hace uso de `nvm` así que dudo que exista pierde para un futuro. 

Lo primero es traerse el script para instalar `nvm`
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```
Esto modifca las variables de entorno de bash, entonces accedemos a una nueva bash con 
```
source ~/.bashrc
```

y verificamos que `nvm` funciona listando las versiones de `nodejs`
```
nvm list-remote | tail
```
Elegimos la versión a instalar y corremos el siguiente comando (`16.x` en nuestro ejemplo)
```
nvm install v16.14.0
```

Y comprobamos que todo esté bien

```
node -v
```
Lo cual debería mostrarnos la versión de `nodejs` instalada en nuestros computadores. 

#### Golang
Para instalar `Golang` basta con seguir las [instrucciones](https://golang.org/doc/install) presentadas en su página web. Pero, como soy perezoso, lo pondré todo en este lugar. De nuevo, esto aplica para la versión `1.17.2` que es la que tengo instalada al momento de escribir esto, para futuras versiones, revisar la página 
```
curl -c https://go.dev/dl/go1.17.6.linux-amd64.tar.gz
```
extraemos el archivo descargado e instalamos en `/usr/local`
```
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzfv go1.17.6.linux-amd64.tar.gz
```
En mi bashrc ya está `golang` agregado en el `$PATH`, así que omitiremos este paso que indica la guía de instalación e iremos por la verificación de la versión directamente. 
```
go version
```

## Vim

Esta es la verdadera razón de ser de este documento, acá explicaré todas las configuraciones necesarias para que `vim` funcione como editor de `python`, `c/c++`, `golang` y `javascript` por el momento, espero agregar más *features* a medida que sean necesarias y deba aprenderlas. 

Primero, agreguemos el manejador de plugin que uso en `vim`, [vim-plug](https://github.com/junegunn/vim-plug), para esto hacemos 
```
cd && curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Ahora, corremos el instalador de plugines sin entrar a vim como sigue 
```
vim -c ":PlugInstall" -cq -cq
```

Aceptamos lo que nos pregunte y luego instalamos los complementos de [YCM](https://github.com/ycm-core/YouCompleteMe) para `c/c++`, `python` y `javascript`
```
python3 .vim/plugged/YouCompleteMe/install.py --clang-completer --ts-completer
```
Con esto quedan la mayoría de configuraciones listas para usarse. Ahora, detallaremos cómo configurar cada proyecto para poder usar el [ALE](https://github.com/dense-analysis/ale) y [YCM](). 

### Go

Solo hay que correr el siguiente comando y todo se hará mágicamente, gracias a [vim-go](https://github.com/fatih/vim-go.git), debemos correrlos en orden
```
vim -c ":helptags ALL" -c ":q"
```
Y luego
```
vim -c ":GoInstallBinaries" -c ":q"
```

Con esto ya funciona el autocompletar y el lint para verificar errores cuando programando en `Golang`. 

### Javascript

Para `javascript` lo que se debe hacer es que cuando se inicia un nuevo proyecto, se debe copiar el `jsconfig.json` que se encuentra en `templates/` 

```
cp ~/.dotfiles/templates/jsconfig_bsaic.json ./jsconfig.json
```

Y luego activarlo usando `npx`

```
npx jsconfig.json
```

Con esto ya se puede usar ALE y YCM en proyectos que involucren javascript. 

### Cosas por hacer

- [ ] Aumentar la descripción de configuración de Ubuntu.
- [ ] Crear un script en python o bash para automatizar la instalación de las configuraciones. 
- [ ] Incluir la configuración de Neovim 

### Plugins

Lista de plugins que uso en vim 
- [You Complete Me](https://github.com/ycm-core/YouCompleteMe)
- [Vim Go](https://github.com/fatih/vim-go)
- [Vim Polyglot](https://github.com/sheerun/vim-polyglot)
- [NERDTree](https://github.com/preservim/nerdtree)
- [NERDTree Git Plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
- [NERDTree Syntax Highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)
- [NERDCommenter](https://github.com/preservim/nerdcommenter)
- [Ultisnips](https://github.com/SirVer/ultisnips)
- [fuGITive](https://github.com/tpop/vim-fugitive)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [Asynchronous Lint Engine](https://github.com/dense-analysis/ale)
- [Airline](https://github.com/vim-airline/vim-airline)
- [Airline themes](https://github.com/vim-airline/vim-airline-themes)
- [Tagbar](https://github.com/preservim/tagbar)
- [Delimit Mate](https://github.com/Raimondi/delimitMate)
- [Ctlr-p](https://github.com/ctrlpvim/ctrlp.vim)
- [Vimtex](https://github.com/lervag/vimtex)
- [Vim devicons](https://github.com/ryanoasis/vim-devicons)
- [Dracula theme](https://github.com/dracula/vim)
