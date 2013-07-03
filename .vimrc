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
source $HOME/.vim/init/uniterc
source $HOME/.vim/init/langrc
source $HOME/.vim/init/viewrc
source $HOME/.vim/init/insertrc
source $HOME/.vim/init/neocomplatecache
source $HOME/.vim/init/memolist

set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp
set history=10000                                          " history 1000
set nobackup                                               " no create backup
set noswapfile                                             " don't make swapfile
set clipboard+=unnamed                                     " share clipboard
au BufEnter * exec ':lcd %:p:h'

autocmd FileType * set formatoptions-=ro " disable auto comment out


" EasyMotion
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" Åu'Åv + anything mapping
let g:EasyMotion_leader_key="'"
" 1 priority stroke
let g:EasyMotion_grouping=1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue


" watchdogs
let g:quickrun_config = {
\   "watchdogs_checker/_" : {
\       "hook/close_quickfix/enable_exit" : 1,
\   },
\   "ruby" : {
\       "cmdopt" : "-Ku",
\       "type" : "ruby"
\   },
\   "markdown" : {
\       'outputter' : 'null',
\       'command'   : 'open',
\       'cmdopt'    : '-a',
\       'args'      : 'Marked',
\       'exec'      : '%c %o %a %s',
\   },
\   "_" : { "outputter/buffer/into" : 1,}
\}

let g:watchdogs_check_CursorHold_enable = 1
let g:watchdogs_check_BufWritePost_enable = 1

call watchdogs#setup(g:quickrun_config)


" set autowrite
set autowriteall

" octopress
let g:octopress_path = "$HOME/octopress"

" totuzen
source $HOME/.vim/pluings/totuzen.vim

" Vimfiler
nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

" VimShell
nnoremap <silent> <Leader>vv :VimShell<CR>
