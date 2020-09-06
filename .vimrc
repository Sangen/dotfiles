if has('vim_starting')
  " Install vim-plug if needed
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif


call plug#begin('~/.vim/plugged')
  "カラースキーム
  Plug 'w0ng/vim-hybrid', {'do': 'cp colors/* ~/.vim/colors/'}
  Plug 'cocopon/iceberg.vim', {'do': 'cp colors/* ~/.vim/colors/'}
  "プラグイン追加箇所
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
call plug#end()


colorscheme hybrid
"colorscheme iceberg
"set bg=light
set bg=dark
syntax on

let mapleader = ','

nnoremap Q <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

"----------------------------------------
" キーバインド変更
"----------------------------------------
noremap k gk
noremap j gj
noremap gk k
noremap gj j
noremap <Up> gk
noremap <Down> gj
"行の先頭,末尾に移動(Shift+h,Shift+l)
nnoremap <S-h> 0
nnoremap <S-l> $

"----------------------------------------
" カーソルを自動的に()の中へ
"----------------------------------------
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap `` ``<Left>
imap <> <><Left>


set nocompatible
set encoding=UTF-8
set number
set showcmd
set ruler
set laststatus=2
set cursorline
set list
set listchars=eol:¬,tab:▸\
set scrolloff=20
set ignorecase
set smartcase
set hlsearch
set undodir=~/.vim/undo
set backspace=indent,eol,start
"「Tabキーを押すと, 自動的に半角スペース4つが挿入｣され,
"その状態でバックスペースを押すと｢半角スペースが4つ削除」
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"airlineのinsert->normal表示反映が遅延する問題の対策
set ttimeoutlen=10

"----------------------------------------
"coc
set statusline^=%{coc#status()}

"----------------------------------------
"airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'hybrid'
let g:airline#extensions#branch#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
