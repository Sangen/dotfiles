# My dotfiles

## Change shell to zsh

```console
chsh -s $(which zsh)
```

## Update and upgrade Homebrew (Mac)

```console
brew upgrade
```

## Set up dotfiles

```console
git clone https://github.com/Sangen/dotfiles ~/.dotfiles
cd ~/.dotfiles
```

### Make symbolic links and copy files if not exist

```console
sh setup.sh
```

Make symbolic links.

- .gitignore_global
- .vimrc
- .zshrc
- .zshenv

Copy files.

- .gitconfig
- .zshrc.local

### Or replace links and files with `-r` option

```console
sh setup.sh -r
```

## Set Git user

```console
git config --global user.name "User Name"
git config --global user.email "example@mail.com"
```

## Peco

Install [peco](https://github.com/peco/peco)

For Mac

```console
brew install peco
```

## Font

Use Powerline font such as `Ricty for Powerline`.

e.g.) Install Ricty for Powerline by Homebrew

```console
brew tap sanemat/font
brew install ricty --with-powerline
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
```

## Vim

Run vim and install plugins.

### CoC

Using [coc.nvim](https://github.com/neoclide/coc.nvim)

You have to install coc extension or configure language servers for LSP support.

e.g.) You can install extensions for JSON, TypeScript and Python as follows:

```vim
:CocInstall coc-json coc-tsserver coc-python
```

---

## Prompt Keyboard Bindings

| Key | Action |
 --- | ---
| `Ctrl + B` | Search a destination from `cdr` list and cd the destination |
| `Ctrl + R` | Search command history |
