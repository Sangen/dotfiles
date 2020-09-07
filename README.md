# My dotfiles

## Change shell to zsh

```console
chsh -s $(which zsh)
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

## Font

Use Powerline font such as `Ricty for Powerline`.

## Keyboard Bindings

| Key | Action |
 --- | ---
| `Ctrl + B` | Search a destination from `cdr` list and cd the destination |
| `Ctrl + R` | Search command history |
