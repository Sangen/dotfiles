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


if [ -a $HOME/.vim/bundle ]; then
  echo ".vim/bundle is already exists."
else
  mkdir -p ~/.vim/bundle
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  echo "set up .vim/bundle"
fi

mkdir ~/.vim/tmp ~/.vim/undo


DOT_FILES=( .gitignore_global .vimrc .vrapperrc .xvimrc .zshrc .zshenv .jshintrc .screenrc )

CURRENT=$(cd $(dirname $0) && pwd)

for file in ${DOT_FILES[@]}
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


COPY_DOT_FILES=( .gitconfig )
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

