option = { nowait = true }
vim.api.nvim_set_keymap('v', '<Nul>', ':w !pbcopy<cr><cr>', option)
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {})
vim.g.mapleader = ' '
