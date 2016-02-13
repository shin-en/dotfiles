#!/bin/bash

DOTFILES_DIR=src/github.com/shingt/dotfiles
srcs=(
  .bash_profile
  .bashrc
  .tmux.conf
  .vim
  .vimrc
  .xvimrc
  .zsh.d
  .zshenv
  .zshrc
)

for src in ${srcs[@]}; do
  ln -sf $HOME/$DOTFILES_DIR/$src $HOME/$src
done

cd $HOME/$DOTFILES_DIR
git submodule init
git submodule update
mkdir util

mkdir $HOME/backup

#
# git-completion
#
cd $HOME/$DOTFILES_DIR/.zsh.d
wget https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
wget https://github.com/git/git/raw/master/contrib/completion/git-completion.zsh
mv git-completion.zsh _git

