let $PATH = $PATH . ':/opt/local/bin'

"==========================================
" neobundlinserte
"==========================================
set nocompatible " Be iMproved

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'petdance/vim-perl'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'h1mesuke/unite-outline'
" Quickrun {{{
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimproc'
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'jceb/vim-hier'
" }}}
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'myhere/vim-nodejs-complete'
NeoBundle 'itspriddle/vim-marked'
NeoBundle 'git://github.com/glidenote/octoeditor.vim.git'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'rking/ag.vim'
NeoBundle 'tpope/vim-endwise'
" NeoBundle 'glidenote/newdayone.vim'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'godlygeek/tabular'
NeoBundle 'szw/vim-tags'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Align'
NeoBundle 'c9s/perlomni.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'Rip-Rip/clang_complete.git'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'alpaca-tc/alpaca_tags'
NeoBundle 'tpope/vim-rails'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'szw/vim-tags'
" NeoBundle 'hokorobi/vim-tagsgen' 

NeoBundleCheck

"==========================================
" neocom
"==========================================

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" """ Enable heavy omni completion.
" if !exists('g:neocomplcache_omni_patterns')
"   let g:neocomplcache_omni_patterns = {}
" endif
" 
" """ ruby
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
" 
" """ perl
" let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" 
" let g:neocomplcache_force_overwrite_completefunc = 1
" 
" if !exists('g:neocomplcache_omni_patterns')
"   let g:neocomplcache_omni_patterns = {}
" endif
" 
" """ golang
" if !exists('g:neocomplcache_force_omni_patterns')
"   let g:neocomplcache_force_omni_patterns = {}
" endif
" let g:neocomplcache_force_omni_patterns.go = '\h\w*\.\?'
" 
" """ clang
" if !exists('g:neocomplcache_force_omni_patterns')
"   let g:neocomplcache_force_omni_patterns = {}
" endif
" let g:neocomplcache_force_omni_patterns.c =
"   \ '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplcache_force_omni_patterns.cpp =
"   \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" let g:neocomplcache_force_omni_patterns.objc =
"   \ '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplcache_force_omni_patterns.objcpp =
"   \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" let g:clang_complete_auto = 0
" let g:clang_auto_select = 0

"==========================================
" basic
"==========================================

" another file
" source $HOME/.vim/init/bundlerc
" source $HOME/.vim/init/uniterc
" source $HOME/.vim/init/langrc
" source $HOME/.vim/init/viewrc
" source $HOME/.vim/init/insertrc
" source $HOME/.vim/init/neocomplatecache
" source $HOME/.vim/init/memolist

filetype plugin indent on
syntax on

set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp
set history=10000                                          " history 1000
set nobackup                                               " no create backup
set noswapfile                                             " don't make swapfile
set clipboard+=unnamed                                     " share clipboard
au BufEnter * exec ':lcd %:p:h'

" autocmd FileType * set formatoptions-=ro " disable auto comment out

" EasyMotion
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + anything mapping
let g:EasyMotion_leader_key="'"
" 1 priority stroke
let g:EasyMotion_grouping=1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue


" watchdogs
let g:quickrun_config = {
\  "_" : { "outputter/buffer/into" : 1,},}
\   "markdown" : {
\       'outputter' : 'null',
\       'command'   : 'open',
\       'cmdopt'    : '-a',
\       'args'      : 'Marked',
\       'exec'      : '%c %o %a %s',
\   },
\  "go": {
\    'command': '8g',
\    'exec': ['8g %s', '8l -o %s:p:r %s:p:r.8', '%s:p:r %a', 'rm -f %s:p:r']
\   },
\   "watchdogs_checker/_" : {
\       "hook/close_quickfix/enable_exit" : 1,
\   },
\}

let g:watchdogs_check_CursorHold_enable = 1
let g:watchdogs_check_BufWritePost_enable = 1

call watchdogs#setup(g:quickrun_config)

" set autowrite
set autowriteall

" octopress
let g:octopress_path = "$HOME/octopress"

" Vimfiler
nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

" VimShell
nnoremap <silent> <Leader>vv :VimShell<CR>

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]> 

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 1

"==========================================
" view
"==========================================

set expandtab           " change tab into space
set shiftwidth=4        " tab width
set tabstop=4           " tab width
set softtabstop=4       " tab width
set showmatch           " match kakko
set cmdheight=2
set showcmd
set title
set ignorecase          " not distinct UPCASE downcase
set wildmode=list:full  " complete
set wildmenu            " complete
set listchars=tab:>-    " view tab
set list                " view \n
set ruler               " view ruler
set incsearch
set hlsearch
set nowrap
set textwidth=0 "折り返しが勝手に入るので文字数をのばす

set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
set display=uhex

set tw=0                " disable auto indent

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" set shortmess+=I

colorscheme molokai
" set background=dark
" colorscheme solarized
" colorscheme zenburn

" set highlight
execute "highlight ucurl_my gui=undercurl guisp=Red"
let g:hier_highlight_group_qf = "ucurl_my"

let g:lightline = {
      \ 'colorscheme': 'jellybeans'
      \ }


set ttyfast
set lazyredraw

" unite-outline
nnoremap <silent> <Leader>m :<C-u>Unite -vertical -no-quit outline<CR>
let g:unite_winwidth = 40
"==========================================
" insert
"==========================================

" Emacs
imap <C-e> <END>
imap <C-g> <ESC>

" map th :tabnext<CR>
nmap tl :tabprev<CR>
nmap tn :tabnew<CR>
nmap td :tabclose<CR>

imap <C-p> <Up>
imap <C-b> <Left>
imap <C-l> <Right>
imap <C-f> <Right>
imap <C-j> <Down>
imap <C-n> <Down>

" Emacs
imap <C-k> <ESC>l<S-d>a

inoremap <silent> <Esc> <Esc>
inoremap <silent> <C-[> <Esc>

nnoremap <Space>np :<C-u>set paste!<CR>
vnoremap <silent>a ::Tabularize/=<CR>

" out insert mode to IME off
" set noimdisable
" http://www.geocities.co.jp/SiliconValley-SantaClara/1183/computer/gvim.html
set iminsert=0
set imsearch=0

" コメントアウト勝手に入るの止める
set formatoptions-=ro


" Gundo
nmap <Leader>g :GundoToggle<CR>

" textobj
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

" "let g:endwise_no_mappings = 1
" autocmd CohamaAutoCmd FileType perl,c,g,lua,ruby,sh,zsh,vb,vbnet,aspvbs,vim imap <buffer> <CR> <CR><Plug>DiscretionaryEnd

nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap ,p <Plug>(yankround-prev)
nmap ,n <Plug>(yankround-next)

"==========================================
" unite
"==========================================
" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1
" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" 全部
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>


autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <buffer> <Esc><Esc> <Plug>(unite_all_exit)
  imap <buffer> <Esc><Esc> <Esc><Plug>(unite_all_exit)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  nnoremap <silent><buffer><expr> <C-k> unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-k> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-j> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-j> unite#do_action('split')
endfunction

augroup AutoCD
  autocmd!
  autocmd BufEnter * lcd %:p:h
augroup END


"==========================================
" lang
"==========================================

" Perl 
au FileType perl setl ts=4 sw=4 expandtab

map ,pt <Esc>:%! perltidy -se<CR>
map ,ptv <Esc>:'<,'>! perltidy -se<CR>
autocmd BufNewFile *.pl 0r $HOME/.vim/template/template.pl

autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl

""" Ruby
au FileType ruby setl ts=2 sw=2 expandtab
autocmd BufNewFile *.rb 0r $HOME/.vim/template/template.rb
let g:neocomplcache#sources#rsense#home_directory = '/opt/rsense-0.3'
"let g:syntastic_ruby_checkers = ['rubocop']
"let g:syntastic_quiet_warnings = 0


""" C-Lang
au FileType c setl ts=4 sw=4 expandtab
autocmd BufNewFile *.c 0r $HOME/.vim/template/clang.c

" nnoremap <sid>(command-line-enter) q:
" xnoremap <sid>(command-line-enter) q:
" nnoremap <sid>(command-line-norange) q:<C-u>

" nmap :  <sid>(command-line-enter)
" xmap :  <sid>(command-line-enter)

""" golang

" gocode
set rtp+=$GOROOT/misc/vim
" "golint
exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")

au BufNewFile,BufRead *.go set filetype=go
au BufWritePre *.go Fmt
autocmd FileType go setl ts=8 sw=8 expandtab
autocmd BufNewFile *.go 0r $HOME/.vim/template/template.go
let g:syntastic_go_checkers = ['go', 'golint', 'govet'] 

""" LLVM
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


"" golangでプレビューに出ないように
set completeopt=menuone



"==========================================
" memolist
"==========================================

let g:memolist_memo_suffix = "md"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_memo_date = "epoch"
let g:memolist_memo_date = "%D %T"
let g:memolist_prompt_tags = 1
let g:memolist_prompt_categories = 1
let g:memolist_qfixgrep = 1
let g:memolist_vimfiler = 1
" let g:memolist_template_dir_path = "path/to/dir"

map <Leader>ml  :MemoList<CR>
map <Leader>mn  :MemoNew<CR>
map <Leader>mg  :MemoGrep<CR>

"==========================================
" markdown
"==========================================

let g:vim_markdown_folding_disabled=1


" g:godef_split=2
" g:godef_same_file_in_same_window=1
