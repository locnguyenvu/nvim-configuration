-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'  }
	use { 'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons', opt = true } 
    
    use { 'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension' } -- requires pynvim, python-devel
    use { 'preservim/nerdtree' }
    use { 'ryanoasis/vim-devicons' }
    use { 'tpope/vim-fugitive' }
    use { 'feline-nvim/feline.nvim' }
    
    -- Language server
    use { 'prabirshrestha/vim-lsp' }
    use { 'mattn/vim-lsp-settings' }
    use { 'prabirshrestha/asyncomplete.vim' }
    use { 'prabirshrestha/asyncomplete-lsp.vim' }
    use { 'fatih/vim-go', run = ':GoUpdateBinaries' }

    -- Colorschema
    use { 'dracula/vim', as = 'dracula' }
    use { 'morhetz/gruvbox', as = ' gruvbox' }

end)
