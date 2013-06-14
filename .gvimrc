source $HOME/.vim/init/powerlinerc
" set statusline+=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" set statusline+=\ %{strftime('%c')}

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

set guioptions-=L
"メニューを削除
set guioptions-=m
set guioptions+=c

set lines=70 columns=210

"-----------------------------------------------------------

"クリックボード共有
set clipboard+=unnamed

" colorscheme molokai
" set background=dark
" colorscheme solarized
colorscheme Tomorrow-Night

" 現在開いているファイルのある場所に常にcdする
au   BufEnter *      exec ":lcd " . expand("%:p:h")
