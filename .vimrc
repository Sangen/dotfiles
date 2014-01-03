set encoding=utf-8
" Save format
set fileencoding=utf-8
" Opem format
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin
set nocompatible
filetype off
filetype plugin indent off

if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

"Colorscheme"
NeoBundle "https://github.com/tomasr/molokai.git"
NeoBundle "https://github.com/w0ng/vim-hybrid.git"
NeoBundle "https://github.com/nanotech/jellybeans.vim.git"

NeoBundle "https://github.com/Lokaltog/vim-powerline.git"
NeoBundle "https://github.com/tpope/vim-surround.git"
NeoBundle "https://github.com/mattn/zencoding-vim.git"
NeoBundle "https://github.com/Shougo/unite.vim.git"
NeoBundle "https://github.com/h1mesuke/unite-outline.git"
NeoBundle "https://github.com/pangloss/vim-javascript.git"
NeoBundle "https://github.com/helino/vim-json.git"

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck



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
set scrolloff=20
set cindent
"----------------------------------------
" 「Tabキーを押すと, 自動的に半角スペース4つが挿入｣され,
" その状態でバックスペースを押すと｢半角スペースが4つ削除」
"----------------------------------------
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"----------------------------------------
" カーソルを自動的に()の中へ
"----------------------------------------
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>
imap // //<left>
imap /// ///<left>

hi CursorLineNr guifg=#050505

"colorscheme molokai
"colorscheme hybrid
colorscheme jellybeans

syntax on
