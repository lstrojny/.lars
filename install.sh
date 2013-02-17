#!/bin/sh
base=`dirname $0`

(cd $base && git pull; cd -)

echo "Installing .bashrc"
ln -sf $base/dot-bashrc ~/.bashrc

echo "Installing .bash_profile"
ln -sf $base/dot-bashrc ~/.bash_profile

echo "Installing .caprc"
ln -sf $base/dot-caprc ~/.caprc

echo "Installing .gitconfig"
ln -sf $base/dot-gitconfig ~/.gitconfig

echo "Installing .vimrc"
ln -sf $base/dot-vimrc ~/.vimrc

echo "Install vundle"
[ -d ~/.vim/bundle/vundle ] && (cd ~/.vim/bundle/vundle && git pull) || git clone -q https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "Run vundle install"
vim +BundleInstall +qall
