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

echo "Installing .gitignore_global"
ln -sf $base/dot-gitignore_global ~/.gitignore_global

echo "Installing .toprc"
ln -sf $base/dot-toprc ~/.toprc

echo "Installing .vimrc"
ln -sf $base/dot-vimrc ~/.vimrc

echo "Installing .lessfilter"
ln -sf $base/dot-lessfilter ~/.lessfilter

echo "Install .inputrc"
ln -sf $base/dot-inputrc ~/.inputrc

echo "Install .screenrc"
ln -sf $base/dot-screenrc ~/.screenrc

echo "Install powerline config"
mkdir -p ~/.config
unlink ~/.config/powerline
ln -sf $base/dot-config-powerline ~/.config/powerline

echo "Install vundle"
[ -d ~/.vim/bundle/vundle ] && (cd ~/.vim/bundle/vundle && git pull) || git clone -q https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "Run vundle install"
vim +BundleInstall +qall 2&> /dev/null

echo "Install powerline"
pip install --quiet --user git+git://github.com/Lokaltog/powerline

echo "Install powerline fonts"
([ -d ~/.vim/powerline-fonts ] && (cd ~/.vim/powerline-fonts && git pull) || git clone -q https://github.com/Lokaltog/powerline-fonts.git ~/.vim/powerline-fonts) && bash ~/.vim/powerline-fonts/install.sh
