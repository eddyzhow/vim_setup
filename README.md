vim_setup
=========
##### Installing eddyzhow Vim environment on another machine

```
cd ~
git clone https://github.com/eddyzhow/vim_setup.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```

##### Installing plugins as a git submodule
```
cd ~/.vim/
git submodule add http://github.com/user/someplugin.git bundle/someplugin
git add .
git commit -m "Install plugin bundle as a submodule."

```

##### External modules installation
```
sudo pip install flask8

```
