#!/bin/sh

# Prezto
if [ -a $HOME/.zprezto ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done


# Command line options
# -r : replace dot files if these are already exist
while getopts r OPT
do
  case $OPT in
    "r" ) REPLACE="TRUE" ;;
      * ) ;;
  esac
done

mkdir -p ~/.vim/colors ~/.vim/undo

COPY_DOT_FILES=( .gitignore_global .gitconfig .vimrc )
for file in ${COPY_DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    if [ "$REPLACE" = "TRUE" ]; then
      cp $CURRENT/$file $HOME/$file
      echo "$file replaced"
    else
      echo "$file is already exists."
    fi
  else
    cp $CURRENT/$file $HOME/$file
    echo "$file copied"
  fi
done

