vim_setup
=========
##### Installing your Vim environment on another machine

'''
cd ~
git clone https://github.com/eddyzhow/vim_setup.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule init
git submodule update
'''
