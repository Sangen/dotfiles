if has('vim_starting')
  " Install vim-plub if needed
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif


call plug#begin('~/.vim/plugged')
  "カラースキーム
  Plug 'w0ng/vim-hybrid', {'do': 'cp colors/* ~/.vim/colors/'}
  "プラグイン追加箇所
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme hybrid
"colorscheme jellybeans
"set bg=light
set bg=dark

"syntax on


let mapleader = ','
nnoremap Q <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

noremap k gk
noremap j gj
noremap gk k
noremap gj j
noremap <Up> gk
noremap <Down> gj
"行の先頭,末尾に移動(Shift+h,Shift+l)
nnoremap <S-h> 0
nnoremap <S-l> $

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
set cindent
set pastetoggle=<F2>
set undodir=~/.vim/undo
"----------------------------------------
" 「Tabキーを押すと, 自動的に半角スペース2つが挿入｣され,
" その状態でバックスペースを押すと｢半角スペースが2つ削除」
"----------------------------------------
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

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
