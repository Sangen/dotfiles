" starting colorscheme ----------------------
"colorscheme molokai
"colorscheme hybrid
colorscheme solarized
set background=light
"set background=dark
set transparency=10

" 全角スペースを視覚化 ----------------------
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" タブ文字や行末など、普段見えないものを可視化する listchars -----------------
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
"set listchars=eol:¬,tab:▸\
