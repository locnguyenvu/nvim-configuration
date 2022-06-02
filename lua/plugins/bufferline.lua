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

local map = vim.api.nvim_set_keymap

map('n', '<leader>l', ':BufferLineCycleNext<CR>', {})
map('n', '<leader>h', ':BufferLineCyclePrev<CR>', {})
map('n', '<leader>e', ':BufferLinePick<CR>', {})
map('n', '<leader>d', ':BufferLinePickClose<CR>', {})
