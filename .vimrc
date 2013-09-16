set encoding=utf-8
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.dotfiles/.vim/bundle/neobundle.vim
 endif
call neobundle#rc(expand('~/.vim/bundle'))
" ここでプラグインをインストール
NeoBundle "https://github.com/tomasr/molokai.git"
NeoBundle "https://github.com/vim-scripts/hybrid.vim"
NeoBundle "https://github.com/altercation/vim-colors-solarized.git"
NeoBundle "https://github.com/Lokaltog/vim-powerline.git"
NeoBundle "https://github.com/tpope/vim-surround.git"
NeoBundle "https://github.com/mattn/zencoding-vim.git"
NeoBundle "https://github.com/Shougo/unite.vim.git"
NeoBundle "https://github.com/h1mesuke/unite-outline.git"
NeoBundle "https://github.com/pangloss/vim-javascript.git"
NeoBundle "https://github.com/helino/vim-json.git"

filetype plugin indent on

let mapleader = ','
noremap k gk
noremap j gj
noremap gk k
noremap gj j
noremap <Up> gk
noremap <Down> gj
nnoremap <Leader>ev :tabnew $HOME/.vimrc<CR>
nnoremap <Leader>rv :source $HOME/.vimrc<CR>
set number
set cursorline
set list
set listchars=eol:¬,tab:▸\ 
set tabstop=2
set shiftwidth=2
set expandtab
set scrolloff=20

