local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd

cmd('colorscheme dracula')
cmd('filetype on')

-- Global
o.termguicolors = true
o.incsearch = true
o.hlsearch = true
o.number = true
o.rnu = true
o.mouse = 'a'
o.clipboard = 'unnamed,unnamedplus'

-- Buffer
bo.tabstop = 4
bo.shiftwidth = 4
bo.expandtab = true
bo.autoindent = true
bo.autoread = true


option = { nowait = true }
vim.api.nvim_set_keymap('v', '<Nul>', ':w !pbcopy<cr><cr>', option)
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {})
vim.g.mapleader = ' '

if vim.api.nvim_call_function('executable', {'pyls'}) then

end
