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

vim.api.nvim_set_option_value('tabstop', 4, { scope = 'local' })
vim.api.nvim_set_option_value('shiftwidth', 4, { scope = 'local' })
vim.api.nvim_set_option_value('expandtab', true, { scope = 'local' })
