# My dotfiles

## Change shell to zsh

```console
chsh -s $(which zsh)
```

## Install Prezto

Backup dotfiles manually

- `.zshrc`, `.zshenv`

Clone

```console
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

Apply

```console
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

See more details [Prezto](https://github.com/sorin-ionescu/prezto)

## Set up dotfiles

```console
git clone https://github.com/Sangen/dotfiles ~/.dotfiles
cd ~/.dotfiles
```

Copy `.gitignore_global`, `.gitconfig`, `.vimrc`, `.zshrc.local` to `~/` if not exist

```console
sh setup.sh -r
```

or replace `.gitignore_global`, `.gitconfig`, `.vimrc`, `.zshrc.local`

```console
sh setup.sh -r
```

## Update other dotfiles (if needed)

- `.zpreztorc`, `.zshrc`, `.zshenv`

## Reload

```console
source ~/.zshrc
source ~/.zpreztorc
```
