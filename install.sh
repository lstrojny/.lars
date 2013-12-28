#!/bin/sh
cd `dirname $0`
base=`pwd -P`

echo "Updating dot files"
git pull

cd $OLDPWD

echo "Installing .bashrc"
ln -sf $base/dot-bashrc ~/.bashrc

echo "Installing .bash_profile"
ln -sf $base/dot-bashrc ~/.bash_profile

echo "Installing .caprc"
ln -sf $base/dot-caprc ~/.caprc

echo "Installing .gitconfig"
ln -sf $base/dot-gitconfig ~/.gitconfig

echo "Installing .toprc"
ln -sf $base/dot-toprc ~/.toprc

echo "Installing .vimrc"
ln -sf $base/dot-vimrc ~/.vimrc

echo "Installing .lessfilter"
ln -sf $base/dot-lessfilter ~/.lessfilter

echo "Install vundle"
[ -d ~/.vim/bundle/vundle ] && (cd ~/.vim/bundle/vundle && git pull) || git clone -q https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "Run vundle install"
vim +BundleInstall +qall
