lua require('plugins')

augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

lua << EOF
require("bufferline").setup{
    options = {
        indicator_icon = '▎',
        modified_icon = '●',
        left_trunc_marker = '',
        right_trunc_marker = '',
        diagnostics = 'nvim_lsp',
        show_close_icon = false,
        show_buffer_close_icons = false,
        offsets = {{filetype = "NvimTree", text = "File Explorer"}},
    }
}

require('feline').setup()
EOF

" Theme
set termguicolors
colorscheme dracula

" IDE config
set tabstop=4       " show existing tab with 4 spaces width
set shiftwidth=4    " when indenting with '>', use 4 spaces width, On pressing tab, insert 4 spaces
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set expandtab
set autoindent
set autoread
set nu
set rnu
set mouse-=a
syntax enable
filetype plugin indent on
set clipboard^=unnamed,unnamedplus
vmap '' :w !pbcopy<CR><CR>


" Shortcut
let mapleader = " "
let localmapleader = "\<Space>"

" BufferLine
nmap <leader>l :BufferLineCycleNext<CR>
nmap <leader>h :BufferLineCyclePrev<CR>
nmap <leader>bd :BufferLinePickClose<CR>
nmap <leader>bb :BufferLinePick<CR>

" NERDTree
nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind %<CR>
nmap <leader>nr :NERDTreeRefreshRoot<CR>
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeShowLineNumbers=1 " enable line numbers
let g:NERDTreeWinSize=50
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.egg-info$']
autocmd FileType nerdtree setlocal relativenumber " make sure relative line numbers are used

" Leaderf
let g:Lf_WildIgnore = {
            \ 'dir': ['vendor', '.venv', '__pycache__'],
            \ 'file': ['*.py[co]']
            \}
let g:Lf_ShortcutB = '<Leader>bo'
let g:Lf_ShortcutF = '<C-p>'
nmap zff :Leaderf file<CR>
nmap zfc :Leaderf function<CR>
nmap zfd :Leaderf tag --cword<CR>

