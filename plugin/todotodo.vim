" Exit when your app has already been loaded (or "compatible" mode set)
if exists("g:loaded_todotodo") || &cp
  finish
endif

let g:loaded_todotodo = 1 " Version
let s:keepcpo            = &cpo
set cpo&vim

function! TodotodoDone()
  let cur_line = line('.')
  let cur_column = virtcol('.')
  normal! ^
  let completed = search('\[x\]', 'n', cur_line)
  if !completed
    execute "normal! $a\<space>[x]\<esc>"
  else
    execute "normal! $3hC\<esc>"
  endif
  execute "normal! " . cur_column . "|"
endfunction
