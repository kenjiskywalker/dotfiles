" display
"-----------------------------------------------------------
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set shortmess+=I

" �c�[���o�[���폜
set guioptions-=T

set guioptions-=l " ���X�N���[���o�[��\��

set guioptions-=L
"���j���[���폜
set guioptions-=m
set guioptions+=c

set lines=70 columns=210

"-----------------------------------------------------------

"�N���b�N�{�[�h���L
set clipboard+=unnamed

" colorscheme molokai
" set background=dark
" colorscheme solarized
colorscheme Tomorrow-Night

" ���݊J���Ă���t�@�C���̂���ꏊ�ɏ��cd����
au   BufEnter *      exec ":lcd " . expand("%:p:h")
