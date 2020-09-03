#!/bin/sh

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

CURRENT=$(cd $(dirname $0) && pwd)
COPY_DOT_FILES=( .gitignore_global .gitconfig .vimrc .zshrc.local )
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
