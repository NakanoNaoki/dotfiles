#!/bin/bash
DIRNAME='dotfiles'

FILENAMES=( .vimrc .vim .gitconfig .gitignore .gitattributes .zshrc .tmux.conf .ideavimrc alias.zsh peco.zsh)

for filename in ${FILENAMES[@]}
do
  ln -s $HOME/$DIRNAME/$filename $HOME/$filename
done

[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git@github.com:Shougo/neobundle.vim.git ~/${DIRNAME}/.vim/bundle/neobundle.vim
exec $SHELL
