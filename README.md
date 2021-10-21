# Archivos de configuración *Dotfiles* 

Esta Readme tiene como propósito guiarme paso a paso en la reproducción de las configuraciones que he realizado  en mi computadora personal, esto porque usualmente olvido qué paquetes y qué cosas he instalado. 

## Tabla de contenidos
1. [Clonación](#clonación)
2. [Paquetes Necesarios](#paquetes-necesarios) </br>
2.1 [Arch Linux](#arch-linux) </br>
2.2 [Ubuntu](#ubuntu)
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
* vim
		```
		ln -nfs $HOME/.dotfiles/vim $HOME/.vim
		```
* bashrc
		```
		ln -nfs $HOME/.dotfiles/bashrc $HOME/.bashrc	
		```
* bash_aliases
		```
			ln -nfs $HOME/.dotfiles/aliases $HOME/.bash_aliases
		```

## Paquetes necesarios

###Arch Linux

###Ubuntu

## Bash

## Vim
