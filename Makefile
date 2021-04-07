all: link
	curl -fLo ~/dotfiles/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

link: 
	ln -nfs /home/kyziak/dotfiles/vim/ /home/kyziak/.vim
 
ycm:
	cd ./vim/plugged/YouCompleteMe && sudo python install.py
