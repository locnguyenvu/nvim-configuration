lua require('plugins')

augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

set termguicolors
lua << EOF
require("bufferline").setup{
    options = {
        indicator_icon = '▎',
        modified_icon = '●',
        left_trunc_marker = '',
        right_trunc_marker = '',
    }
}
EOF

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

" Shortcut
let mapleader = " "
let localmapleader = "\<Space>"

" Buffer navigator
nmap <leader>l :BufferLineCycleNext<CR>
nmap <leader>h :BufferLineCyclePrev<CR>
nmap <leader>bo :Buffers<CR>
nmap <leader>bt :BTags<CR>
nmap <leader>bl :BLines<CR>
nmap <leader>d :bp\|bw #<CR>
