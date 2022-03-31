-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'  }
	use {'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons', opt = true } 
    use { 'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension' }
end)
