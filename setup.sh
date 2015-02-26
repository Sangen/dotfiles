#!/bin/sh

if [ -a $HOME/.vim/bundle ]; then
  echo ".vim/bundle is already exists."
else
  mkdir -p ~/.vim/bundle
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  echo "set up .vim/bundle"
fi

mkdir ~/.vim/tmp ~/.vim/undo


DOT_FILES=( .gitignore_global .vimrc .vrapperrc .xvimrc .zshrc .zshenv .screenrc )

CURRENT=$(cd $(dirname $0) && pwd)

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    echo "$file is already exists."
  else
    ln -s -n $CURRENT/$file $HOME/$file
    echo "made a symbolic link to $file "
  fi
done


COPY_DOT_FILES=( .gitconfig )
for file in ${COPY_DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    echo "$file is already exists."
  else
    cp $CURRENT/$file $HOME/$file
    echo "$file copied"
  fi 
done

