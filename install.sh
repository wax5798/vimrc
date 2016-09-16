#!/bin/bash
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
mv -f ~/vim ~/vim_old
cd ~/ && git clonet https://github.com/wax5798/vimrc.git
mv -f ~/.vim ~/.vim_old
mv -f ~/vimrc ~/.vim
mv -f ~/.vimrc ~/.vimrc_old
mv -f ~/.vim/.vimrc ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "wax5798正在努力为您安装bundle程序" > wax5798
echo "安装完毕将自动退出" >> wax5798
echo "请耐心等待" >> wax5798
vim wax5798 -c "BundleInstall" -c "q" -c "q"
rm wax5798
echo "安装完成"
