-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/locnguyen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/locnguyen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/locnguyen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/locnguyen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/locnguyen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  [" gruvbox"] = {
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/ gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  LeaderF = {
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/LeaderF",
    url = "https://github.com/Yggdroot/LeaderF"
  },
  ["asyncomplete-lsp.vim"] = {
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/asyncomplete-lsp.vim",
    url = "https://github.com/prabirshrestha/asyncomplete-lsp.vim"
  },
  ["asyncomplete.vim"] = {
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/asyncomplete.vim",
    url = "https://github.com/prabirshrestha/asyncomplete.vim"
  },
  ["blamer.nvim"] = {
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/blamer.nvim",
    url = "https://github.com/APZelos/blamer.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "require'plugins.bufferline'" },
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  dracula = {
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/dracula",
    url = "https://github.com/dracula/vim"
  },
  ["feline.nvim"] = {
    config = { "require'plugins.feline'" },
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  nerdtree = {
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nvim-treesitter"] = {
    config = { "require'plugins.nvim-treesitter'" },
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-lsp"] = {
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/vim-lsp",
    url = "https://github.com/prabirshrestha/vim-lsp"
  },
  ["vim-lsp-settings"] = {
    loaded = true,
    path = "/Users/locnguyen/.local/share/nvim/site/pack/packer/start/vim-lsp-settings",
    url = "https://github.com/mattn/vim-lsp-settings"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
require'plugins.bufferline'
time([[Config for bufferline.nvim]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
require'plugins.feline'
time([[Config for feline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require'plugins.nvim-treesitter'
time([[Config for nvim-treesitter]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
