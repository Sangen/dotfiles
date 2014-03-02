#!/bin/sh

if [ -a $HOME/.vim/bundle ]; then
  echo ".vim/bundle は既に存在しています"
else
  mkdir -p ~/.vim/bundle
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  echo ".vim/bundle を用意しました"
fi


DOT_FILES=( .gitignore_global .vimrc .bashrc .bash_profile )

CURRENT=$(cd $(dirname $0) && pwd)

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    ln -s -n $CURRENT/$file $HOME/$file.dot
    echo " 既にファイルが存在するため.dotファイルを生成しました: $file"
  else
    ln -s -n $CURRENT/$file $HOME/$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done


COPY_DOT_FILES=( .gitconfig )
for file in ${COPY_DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    cp $CURRENT/$file $HOME/$file.dot
    echo " 既にファイルが存在するため.dotファイルを生成しました: $file"
  else
    cp $CURRENT/$file $HOME/$file
    echo "コピーしました: $file"
  fi 
done
echo "\n以下のように名前とアドレスを設定してください\n\t$ git config --global user.name 'Taro Yamada'\n\t$ git config --global user.email 'hogehoge@fuga.com'"
echo "またvimで There was a problem with the editor 'vi'. のようなエラーが発生する場合は以下のようにvimをコアエディタに設定してください\n\t$ which vim\n\t$ git config --global core.editor [VIM_DIR]"

