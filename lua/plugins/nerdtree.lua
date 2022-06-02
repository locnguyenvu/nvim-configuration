local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local set_var = vim.api.nvim_set_var


set_var('NERDTreeQuitOnOpen', 0)
set_var('NERDTreeShowLineNumbers', 1)
set_var('NERDTreeWinSize', 40)
set_var('NERDTreeIgnore', {'.pyc$', '__pycache__', '.egg-info$'})

map('n', '<leader>nt', ':NERDTreeToggle<CR>', {})
map('n', '<leader>nf', ':NERDTreeFind %<CR>', {})
map('n', '<leader>nr', ':NERDTreeRefreshRoot<CR>', {})
cmd('autocmd FileType nerdtree setlocal relativenumber')
