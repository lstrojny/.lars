#!/bin/sh
echo "Installing .bashrc"
ln -sf $PWD/dot-bashrc ~/.bashrc

echo "Installing .bash_profile"
ln -sf $PWD/dot-bashrc ~/.bash_profile

echo "Installing .caprc"
ln -sf $PWD/dot-caprc ~/.caprc

echo "Installing .gitconfig"
ln -sf $PWD/dot-gitconfig ~/.gitconfig

echo "Installing .vimrc"
ln -sf $PWD/dot-vimrc ~/.vimrc

echo "Install vundle"
[ -d ~/.vim/bundle/vundle ] && (cd ~/.vim/bundle/vundle && git pull) || git clone -q https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "Run vundle install"
vim +BundleInstall +qall
