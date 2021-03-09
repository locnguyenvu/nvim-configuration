
" Find by namespace
function! ZFFindNamespace(query)
    let res = []
    let transformed = a:query
    call substitute(a:query, '_\u', '\=add(res, submatch(0))', 'g')
    for i in res
        let transformed = substitute(transformed, i, '/'.tolower(i[1]), 'g')
    endfor
    call fzf#vim#files(getcwd(), {'options': ['-i', '--query='.transformed]})
endfunction
command! -nargs=* -bang Zfn call ZFFindClass(<q-args>)

" Find by class name
function! ZFFindClass(query)
    call fzf#vim#ag('class ' . a:query, fzf#vim#with_preview())
endfunction
command! -nargs=* -bang Zfc call ZFFindClass(<q-args>)

" Find function
function! ZFFindFunction(query)
    call fzf#vim#ag('n '.a:query, fzf#vim#with_preview())
endfunction

nmap <leader>zfc :call ZFFindClass(expand('<cword>'))<CR>

nmap <leader>zfn :call ZFFindNamespace(expand('<cword>'))<CR>

nmap <leader>zff :call ZFFindFunction(expand('<cword>'))<CR>
