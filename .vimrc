set nocompatible               " Be iMproved

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

filetype plugin indent on
syntax on

" another file
source $HOME/.vim/init/bundlerc
source $HOME/.vim/init/powerlinerc
source $HOME/.vim/init/uniterc
source $HOME/.vim/init/langrc
source $HOME/.vim/init/viewrc
source $HOME/.vim/init/neocomplatecache

set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp

" コマンドラインの履歴を10000件保存する
set history=10000

" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup

" スワップファイルを作成しない
set noswapfile

"クリックボード共有
set clipboard+=unnamed

" 現在開いているファイルのある場所に常にcdする
au   BufEnter *      exec ":lcd " . expand("%:p:h")



" EasyMotionの設定
" =================================================
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key="'"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue


" watchdogs.vim の設定を追加
" =================================================
let g:quickrun_config = {
\   "watchdogs_checker/_" : {
\       "hook/close_quickfix/enable_exit" : 1,
\   },
\   "ruby" : {
\       "cmdopt" : "-Ku",
\       "type" : "ruby"
\   },
\   "_" : { "outputter/buffer/into" : 1,}
\}

let g:watchdogs_check_CursorHold_enable = 1
let g:watchdogs_check_BufWritePost_enable = 1

call watchdogs#setup(g:quickrun_config)


" octopressの設定
" =================================================
let g:octopress_path = "$HOME/doc/octopress"

" 突然の
" =================================================
source $HOME/.vim/pluings/totuzen.vim

" Vimfiler
" =================================================
" nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
" nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
"

