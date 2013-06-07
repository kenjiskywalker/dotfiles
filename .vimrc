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

" �R�}���h���C���̗�����10000���ۑ�����
set history=10000

" �o�b�N�A�b�v�t�@�C�����쐬���Ȃ� (���s�̐擪�� " ���폜����ΗL���ɂȂ�)
set nobackup

" �X���b�v�t�@�C�����쐬���Ȃ�
set noswapfile

"�N���b�N�{�[�h���L
set clipboard+=unnamed

" ���݊J���Ă���t�@�C���̂���ꏊ�ɏ��cd����
au   BufEnter *      exec ":lcd " . expand("%:p:h")



" EasyMotion�̐ݒ�
" =================================================
" �z�[���|�W�V�����ɋ߂��L�[���g��
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" �u'�v + �����Ƀ}�b�s���O
let g:EasyMotion_leader_key="'"
" 1 �X�g���[�N�I����D�悷��
let g:EasyMotion_grouping=1
" �J���[�ݒ�ύX
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue


" watchdogs.vim �̐ݒ��ǉ�
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


" octopress�̐ݒ�
" =================================================
let g:octopress_path = "$HOME/doc/octopress"

" �ˑR��
" =================================================
source $HOME/.vim/pluings/totuzen.vim

" Vimfiler
" =================================================
" nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
" nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
"

