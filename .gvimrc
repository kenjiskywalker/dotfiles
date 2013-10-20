" display
"-----------------------------------------------------------
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set shortmess+=I
set laststatus=2        " status line


" ツールバーを削除
set guioptions-=T

set guioptions-=l " 左スクロールバー非表示
set guioptions-=r " 右スクロールバー非表示

set guioptions-=L
"メニューを削除
set guioptions-=m
set guioptions+=c

set lines=70 columns=210

"透過
set transparency=10

"-----------------------------------------------------------

"クリックボード共有
set clipboard+=unnamed

" colorscheme molokai
" set background=dark
" colorscheme solarized
colorscheme Tomorrow-Night

if has('multi_byte_ime') || has('xim') 
  highlight Cursor guifg=White guibg=White
  highlight CursorIM guifg=NONE guibg=DarkRed
endif

" 現在開いているファイルのある場所に常にcdする
au   BufEnter *      exec ":lcd " . expand("%:p:h")

" インサートモードを抜けたらIMEをオフ
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" autocmd InsertEnter,InsertLeave * set cursorline!

hi Pmenu guibg=#4575A0
hi PmenuSel guifg=#4575A0 guibg=#ffffff
hi PmenuSbar guibg=#4575A0
hi PmenuThumb guifg=#4575A0
