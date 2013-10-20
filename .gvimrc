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


" �c�[���o�[���폜
set guioptions-=T

set guioptions-=l " ���X�N���[���o�[��\��
set guioptions-=r " �E�X�N���[���o�[��\��

set guioptions-=L
"���j���[���폜
set guioptions-=m
set guioptions+=c

set lines=70 columns=210

"����
set transparency=10

"-----------------------------------------------------------

"�N���b�N�{�[�h���L
set clipboard+=unnamed

" colorscheme molokai
" set background=dark
" colorscheme solarized
colorscheme Tomorrow-Night

if has('multi_byte_ime') || has('xim') 
  highlight Cursor guifg=White guibg=White
  highlight CursorIM guifg=NONE guibg=DarkRed
endif

" ���݊J���Ă���t�@�C���̂���ꏊ�ɏ��cd����
au   BufEnter *      exec ":lcd " . expand("%:p:h")

" �C���T�[�g���[�h�𔲂�����IME���I�t
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" autocmd InsertEnter,InsertLeave * set cursorline!

hi Pmenu guibg=#4575A0
hi PmenuSel guifg=#4575A0 guibg=#ffffff
hi PmenuSbar guibg=#4575A0
hi PmenuThumb guifg=#4575A0
