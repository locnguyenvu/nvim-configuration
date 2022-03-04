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
Plug 'morhetz/gruvbox'
Plug 'vim-vdebug/vdebug'
Plug 'neovim/nvim-lspconfig'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jszakmeister/vim-togglecursor'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" Themes
set termguicolors
colorscheme gruvbox " nightfly | forest-all-nighter | forest-night | nightfly 
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
    nmap <leader>bt :BTags<CR>
    nmap <leader>bl :BLines<CR>
    nmap <leader>d :bp\|bd #<CR>
    
    " NERDTree
    nmap <leader>nt :NERDTreeToggle<CR>
    nmap <leader>nf :NERDTreeFind %<CR>
    
    " Terminal
    map <F12> :terminal<CR>
endif

" Extensions config
" > Airline
let g:airline_theme='base16_3024'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" > NERDTree
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeShowLineNumbers=1 " enable line numbers
let g:NERDTreeWinSize=50
let g:NERDTreeIgnore = ['__pycache__', '.*\.egg-info']
autocmd FileType nerdtree setlocal relativenumber " make sure relative line numbers are used

" > Tagbar
let g:tagbar_position='botright vertical'
let g:tagbar_width= 50
let g:tagbar_left = 0
let g:tagbar_vertical = 20
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : '/home/loc/go/bin/gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" > FZF config
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_tags_command = '/opt/ctags/ctags -R -f tags'

" Custom commands
function! OnlyAndNerdtree()
    let currentWindowID = win_getid()

    windo if win_getid() != currentWindowID && &filetype != 'nerdtree' | close | endif
endfunction

command! Only call OnlyAndNerdtree()

" vim-go
let g:go_gopls_enabled = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_generate_tags = 1

" gruvbox
let g:gruvbox_contrast_dark = 'hard'

" Setup cursor
if $TERM == 'xterm-256color' 
    let g:togglecursor_force = 'xterm'
endif

source ~/.config/nvim/extends/utility.vim
source ~/.config/nvim/extends/ZendFramework.vim
source ~/.config/nvim/extends/BuffOnly.vim
source ~/.config/nvim/extends/ctags.vim

" enable local config
set exrc
set secure

