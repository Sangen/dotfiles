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

SYMBOLIC_LINK_DOT_FILES=( .gitignore_global .vimrc .zshrc .zshenv )
for file in ${SYMBOLIC_LINK_DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    if [ "$REPLACE" = "TRUE" ]; then
      rm $HOME/$file
      ln -s -n $CURRENT/$file $HOME/$file
      echo "replace a symbolic link to $file"
    else
      echo "$file is already exists."
    fi
  else
    ln -s -n $CURRENT/$file $HOME/$file
    echo "made a symbolic link to $file"
  fi
done

COPY_DOT_FILES=( .gitconfig .zshrc.local )
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

exec $SHELL -l