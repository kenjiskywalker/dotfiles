" 突然の死コマンド
command! -nargs=1 Totuzen call g:totuzen(<args>) 

" 突然の死ジェネレート関数
function! g:totuzen(str)
  " 文字列(バイト数)を取得
  let char_num = strlen(a:str)
  " 実際の文字数を取得
  let mchar_num = s:mojisu(a:str)

  " かな／漢字が含まれるときの処理
  if (char_num != mchar_num)
    " utf-8は3バイトなので、差分÷2がかな/漢字文字の文字数
  " かな/漢字文字はアルファベット2文字分の幅として扱う
    let mchar_num += (char_num - mchar_num)/2
  endif

  let str = '＞　'.a:str.'　＜'
  let top = '＿人'
  let bottom = '￣Y^'

  let slen = range(mchar_num/2)
  for e in slen
    let top = top.'人'
    let bottom = bottom.'Y^'
  endfor

  let top = top.'人＿'
  let bottom = bottom.'Y￣'

  echo top
  echo str
  echo bottom
endfunction

" 実際の文字数を取得
function! s:mojisu(str)
  return strlen(substitute(a:str,".","x","g"))
endfunction