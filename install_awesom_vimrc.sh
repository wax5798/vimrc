#!/bin/bash

set -e

# mkdir ~/.vim_runtime
cd ~/.vim_runtime

# git clone git@github.com:wax5798/vimrc.git ./
# git clone https://github.com/wax5798/vimrc.git
echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

try
source ./.vimconfig
catch
endtry' > ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim_runtime/bundle/Vundle.vim

echo "正在努力为您安装bundle程序" > bundle_install
echo "安装完毕将自动退出" >> bundle_install
echo "请耐心等待" >> bundle_install
vim bundle_install -c "PluginInstall" -c "q" -c "q"
rm bundle_install

echo tags > ~/.agignore
echo "*.o" >> ~/.agignore
echo "*.ko" >> ~/.agignore
echo "*.so" >> ~/.agignore
echo "*.a" >> ~/.agignore
echo "*.pyc" >> ~/.agignore

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
echo "And you should install the following tools manually"
echo "- ctags"
echo "- silversearcher-ag or ack-grep"
