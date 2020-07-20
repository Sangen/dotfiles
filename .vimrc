set encoding=utf-8
" Save format
set fileencoding=utf-8
" Opem format
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin
set nocompatible
filetype off
filetype plugin indent off

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()


"Colorscheme"
NeoBundle "https://github.com/nanotech/jellybeans.vim.git"

NeoBundle "https://github.com/Lokaltog/vim-powerline.git"
NeoBundle "https://github.com/tpope/vim-surround.git"
NeoBundle "https://github.com/Shougo/unite.vim.git"
NeoBundle "https://github.com/Shougo/vimfiler.vim.git"
NeoBundle "https://github.com/h1mesuke/unite-outline.git"
NeoBundle "https://github.com/pangloss/vim-javascript.git"
NeoBundle "https://github.com/helino/vim-json.git"
NeoBundle 'burnettk/vim-angular'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/syntastic'
NeoBundle "tomtom/tcomment_vim"
NeoBundle 'sudo.vim'
NeoBundle 'rking/ag.vim'

filetype plugin indent on
NeoBundleCheck


"vimfiler {{{

"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
"セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
"現在開いているバッファのディレクトリを開く
nnoremap <Space>fe :<C-u>VimFilerExplorer<CR>
"nnoremap <Leader>fe :VimFilerExplorer<CR>
"現在開いているバッファをIDE風に開く
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

"}}}


let mapleader = ','
nnoremap Q <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

noremap k gk
noremap j gj
noremap gk k
noremap gj j
noremap <Up> gk
noremap <Down> gj
nnoremap <Space>h ^
nnoremap <Space>l $
" カーソル位置の単語をyankする
nnoremap vv vawy

" タブ操作
nnoremap <silent> tt  :<C-u>tabe<CR>
nnoremap <C-p>  gT
nnoremap <C-n>  gt

nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <Leader>ev :tabnew $HOME/.vimrc<CR>
nnoremap <Leader>rv :source $HOME/.vimrc<CR>
set number
set showcmd
set ruler
set laststatus=2
set cmdheight=1
set cursorline
set list
set listchars=eol:¬,tab:▸\
set scrolloff=20
set ignorecase
set smartcase
set hlsearch
set cindent
set pastetoggle=<F2>
set backupdir=~/.vim/tmp
set undodir=~/.vim/undo
"----------------------------------------
" 「Tabキーを押すと, 自動的に半角スペース2つが挿入｣され,
" その状態でバックスペースを押すと｢半角スペースが2つ削除」
"----------------------------------------
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

au BufNewFile,BufRead *.c set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.jade set nowrap tabstop=2 shiftwidth=2

"----------------------------------------
" カーソルを自動的に()の中へ
"----------------------------------------
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>

hi CursorLineNr guifg=#050505

colorscheme jellybeans
set bg=light
"set bg=dark

syntax on

