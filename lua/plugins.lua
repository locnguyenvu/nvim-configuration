-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Load lua path
    local lua_path = function(name)
        return string.format("require'plugins.%s'", name)
    end
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons', config = lua_path"bufferline" }
	use { 'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons', opt = true } 
    use { 'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension' } -- requires pynvim, python-devel
    use { "nvim-treesitter/nvim-treesitter", config = lua_path"nvim-treesitter" }
    use { 'feline-nvim/feline.nvim', config = lua_path"feline"}
    use { 'preservim/nerdtree' }
    use { 'tpope/vim-fugitive' }
    use { 'ryanoasis/vim-devicons' }
    
    use { 'prabirshrestha/vim-lsp' }
    use { 'mattn/vim-lsp-settings' }
    use { 'prabirshrestha/asyncomplete.vim' }
    use { 'prabirshrestha/asyncomplete-lsp.vim' }


    -- Themes
    use { 'dracula/vim', as = 'dracula' }

end)
