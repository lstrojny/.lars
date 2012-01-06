#!/bin/sh

install_vimext() {
    for dir in $1/*; do
        if [ -d $dir ]; then
            mkdir -p ~/.vim/`basename $dir`
            rsync -r --exclude="*/.git/*" --exclude="*/.svn/*" $dir/* ~/.vim/`basename $dir`
        fi
    done
}

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

rm -rf temp
mkdir temp
echo "Installing Erlang support for VIM"
git clone -q git://github.com/oscarh/vimerl.git temp/vimerl
install_vimext temp/vimerl

echo "Installing Scala support for VIM"
svn -q checkout http://lampsvn.epfl.ch/svn-repos/scala/scala-tool-support/trunk/src/vim/ temp/scala
install_vimext temp/scala

echo "Installing Textile support for VIM"
wget -q "http://www.vim.org/scripts/download_script.php?src_id=9427" -O temp/textile.zip
unzip -q temp/textile.zip -d temp
install_vimext temp/textile

echo "Installing PHP folding support for VIM"
wget -q "http://www.vim.org/scripts/download_script.php?src_id=12114" -O ~/.vim/plugin/phpfolding.vim

echo "Installing Twig support for VIM"
git clone -q git://github.com/beyondwords/vim-twig.git temp/vim-twig
install_vimext temp/vim-twig

echo "Installing coffee-script support for VIM"
git clone -q git://github.com/kchmck/vim-coffee-script.git temp/vim-coffee-script
install_vimext temp/vim-coffee-script
