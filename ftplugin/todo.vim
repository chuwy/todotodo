nnoremap D :call TodotodoDone()<CR>

autocmd BufWritePost * execute '! git todo'
