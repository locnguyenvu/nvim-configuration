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
    call fzf#vim#ag('(interface|class) '.a:query, fzf#vim#with_preview({ 'options': ['--preview-window', 'up:80%'] }))
endfunction
command! -nargs=* -bang Zfc call ZFFindClass(<q-args>)

" Find function
function! ZFFindFunction(query)
    call fzf#vim#ag('n '.a:query, fzf#vim#with_preview({ 'options': ['--preview-window', 'up:80%'] }))
endfunction


let g:preview_file=$HOME.'/.config/nvim/scripts/tags_preview.sh'

nmap zfc :call ZFFindClass(expand('<cword>'))<CR>
nmap zfn :call ZFFindNamespace(expand('<cword>'))<CR>
nmap zff :call ZFFindFunction(expand('<cword>'))<CR>

" Find lines with pattern in current buffer
nmap zfv :call fzf#vim#buffer_lines(expand('<cword>'))<CR>

" Find defination by tags
nmap zfd :call fzf#vim#tags(expand('<cword>'), {
  \      'options': '
  \         --preview-window="up:80%"
  \         --preview ''' . preview_file . ' {}'''
  \ })<CR>

" Find constant
nmap zfw :call fzf#vim#ag('const '.expand('<cword>'), fzf#vim#with_preview({ 'options': ['--preview-window', 'up:80%'] }))<CR>
