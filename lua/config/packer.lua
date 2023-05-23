------ PACKER PLUGIN MANAGEMENT ------
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Base --
	use "wbthomason/packer.nvim" -- Packer can handle itself
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"

  -- ColorScheme --
  use "sainnhe/gruvbox-material"

  -- Utillity --
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    -- or    branch = '0.1.x',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-lua/popup.nvim'},
    }
  }
  -- Comments
  use "numToStr/Comment.nvim" -- Easliy comment stuff
  use "JoosepAlviste/nvim-ts-context-commentstring" -- Figure comment string based on context
  -- Treesitter
	use { 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} }
  -- Autopairs
  use "windwp/nvim-autopairs"
  -- Cmp plugins
  use "hrsh7th/nvim-cmp" -- the completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- completion for LSP
  use "hrsh7th/cmp-nvim-lua" -- completion for nvim lua
  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim"  -- simple to use language server installer 
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions
  use "ray-x/lsp_signature.nvim" -- LSP signature helper 
  -- Git
  use "lewis6991/gitsigns.nvim"
  -- Nvim-tree
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"
  -- Lualine
  use "nvim-lualine/lualine.nvim"

  if packer_bootstrap then
    require("packer").sync()
  end
end)
