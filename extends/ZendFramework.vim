
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


function! UfindClassUnderCursor()
    let classname = expand('<cword>')
    call ZFFindClass(classname)
endfunction
nmap <leader>zfc :call UfindClassUnderCursor()<CR>

function! UfindNamespaceUnderCursor()
    let classname = expand('<cword>')
    call ZFFindNamespace(classname)
endfunction
nmap <leader>zfn :call UfindNamespaceUnderCursor()<CR>

