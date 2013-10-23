#!/bin/bash
CURRENT_PATH=$(pwd)
cp -f ~/.vim ~/.vimbak
cp ~/.vimrc ~/.vimrcbak
rm -rf ~/.vim
rm -f ~/.vimrc
ln -s $CURRENT_PATH"/vimfiles" ~/.vim
ln -s $CURRENT_PATH"/_vimrc" ~/.vimrc

