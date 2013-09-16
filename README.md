dotfiles in Dropbox
======

```
git clone git@github.com:Sangen/dotfiles.git ~/Dropbox/.dotfiles

rm -rf ~/.vim
rm ~/.vimrc
rm ~/.gvimrc
rm ~/.bashrc

ln -s ~/Dropbox/.dotfiles/.vim ~/.vim
ln -s ~/Dropbox/.dotfiles/.vimrc ~/.vimrc
ln -s ~/Dropbox/.dotfiles/.gvimrc ~/.gvimrc
ln -s ~/Dropbox/.dotfiles/.bashrc ~/.bashrc
```