set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
filetype plugin indent on    " required

call plug#begin('~/.config/nvim/plugged')
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'docteurklein/php-getter-setter.vim'
Plug 'elzr/vim-json'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'nvie/vim-flake8'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'huytd/nvim-forest-all-nighter'
call plug#end()

" Themes
set termguicolors
colorscheme forest-all-nighter " forest-night | nightfly 
set encoding=UTF-8
set guifont=Haskplex_Nerd_Regular:h17 

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

" Find in project
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Shortcut
let mapleader = " "
let localmapleader = "\<Space>"

if !exists('g:vscode')
    map <C-p> :Files<CR>
    map <C-m> :TagbarToggle<CR>
    " Copy selected text to clipboard
    set clipboard^=unnamed,unnamedplus
    vmap '' :w !pbcopy<CR><CR>
    
    " Buffer navigator
    nmap <leader>l :bnext<CR>
    nmap <leader>h :bprevious<CR>
    nmap <leader>bo :Buffers<CR>
    
    " NERDTree
    nmap <leader>nt :NERDTreeToggle<CR>
    nmap <leader>nf :NERDTreeFind %<CR>
    
    " Terminal
    map <F12> :terminal<CR>
endif

" Extensions config
" > Airline
let g:airline_theme = 'forest_night'
let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" > NERDTree
let g:NERDTreeQuitOnOpen = 1
let NERDTreeShowLineNumbers=1 " enable line numbers
autocmd FileType nerdtree setlocal relativenumber " make sure relative line numbers are used

" > Tagbar
let g:tagbar_left = 1
let g:tagbar_vertical = 20
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" Custom commands
function! OnlyAndNerdtree()
    let currentWindowID = win_getid()

    windo if win_getid() != currentWindowID && &filetype != 'nerdtree' | close | endif
endfunction

command! Only call OnlyAndNerdtree()

source ~/.config/nvim/extends/utility.vim
source ~/.config/nvim/extends/ZendFramework.vim
source ~/.config/nvim/extends/BuffOnly.vim
source ~/.config/nvim/extends/ctags.vim

" enable local config
set exrc
set secure

