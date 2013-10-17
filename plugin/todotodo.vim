" Exit when your app has already been loaded (or "compatible" mode set)
if exists("g:loaded_todotodo") || &cp
  finish
endif

let g:loaded_todotodo = 1 " Version
let s:keepcpo            = &cpo
set cpo&vim

hi TodoDone   ctermfg=16 guifg=#9e9e9e ctermbg=47 guibg=#121212
sign define wholeline linehl=TodoDone


function! TodotodoDone()
  let cur_line = line('.')
  let cur_column = col('.')
  normal! ^
  let completed = search('\[x\]', 'n', cur_line)
  if !completed
    execute "normal! $a\<space>[x]\<esc>"
    let com = ":sign place 1 name=wholeline line=" . cur_line . " file=" . expand("%:p")
    exe com
  else
    execute "normal! $3hC\<esc>"
  endif
  execute "normal! " . cur_column . "|"
endfunction

function! FindBastard(...)
  let folded = &g:foldenable
  set nofoldenable
  let last_line = line("w$")
  let line = search('\[x\]$', 'c', last_line)
  let com = ":sign place 1 name=wholeline line=" . line . " file=" . expand("%:p")
  exe com
  normal! ^j
  let new_line = search('\[x\]$', 'c', last_line)
  if new_line < line
    normal! gg
    if folded
      set foldenable
    endif
    return 1
  elseif new_line == line
    normal! gg
    return 1
    if folded
      set foldenable
    endif
  else
    call FindBastard(1)
  endif
  normal! gg
  if folded
    set foldenable
  endif
endfunction

