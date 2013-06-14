set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
 endif
call neobundle#rc(expand('~/.vim.bundle'))
" ここでプラグインをインストール
NeoBundle "https://github.com/tomasr/molokai.git"
NeoBundle "https://github.com/vim-script/hybrid.vim.git"

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


