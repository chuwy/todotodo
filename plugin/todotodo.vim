" Exit when your app has already been loaded (or "compatible" mode set)
if exists("g:loaded_todotodo") || &cp
  finish
endif

let g:loaded_todotodo = 1 " Version
let s:keepcpo            = &cpo
set cpo&vim
