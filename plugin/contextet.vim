" vi:set ts=8 sts=2 sw=2 tw=0:
scriptencoding utf-8

" contextet.vim - o,Oコマンド実行時、
"   現在行のインデントに応じて、'et'をセットする。
"
"   'copyindent'により、同じインデントならコピーされるが、
"   CTRL-T等でインデント変更するとスペースでなくタブでのインデントに
"   なったりするので。
"
"   TODO:
"     >>等の対象行に応じて'et'をセットしてから>>等を行う。
"     aやs等で編集を開始して新しい行を追加した場合への対応。
"
" Maintainer: KIHARA Hideto <deton@m1.interq.or.jp>
" Last Change: 2015-11-22

if exists('g:loaded_contextet')
  finish
endif
let g:loaded_contextet = 1

function! s:setet(cmd)
  if getline('.')[0] == "\t"
    se noet
  else
    se et
  endif
  return a:cmd
endfunction

nnoremap <expr> <Plug>(contextet-o) <SID>setet('o')
nnoremap <expr> <Plug>(contextet-O) <SID>setet('O')

nmap o <Plug>(contextet-o)
nmap O <Plug>(contextet-O)
