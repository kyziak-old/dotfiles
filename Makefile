all: link

link: 
	ln -nfs /home/kyziak/dotfiles/vim/ /home/kyziak/.vim
	ln -nfs $(HOME)/dotfiles/aliases $(HOME)/.bash_aliases
	ln -nfs $(HOME)/dotfiles/bashrc $(HOME)/.bashrc 
	curl -fLo ~/dotfiles/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim -c ":PlugInstall" -cq -cq	
	sudo python vim/plugged/YouCompleteMe/install.py --clang-completer --go-completer 
