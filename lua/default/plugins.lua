local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
	-- Various
	use "wbthomason/packer.nvim"				-- Have packer manage itself
	use "nvim-lua/popup.nvim"					-- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim"					-- Useful lua functions used in lots of plugins
	use "windwp/nvim-autopairs"					-- Autopairs, integrates with both cmp and treesitter
	use "numToStr/Comment.nvim"					-- Easily comment stuff
	use 'kyazdani42/nvim-tree.lua'				-- nvim-tree (file explorer)
	use 'RRethy/vim-illuminate'					-- Highlight text under the cursor
	use 'romgrk/barbar.nvim'					-- Show tabs of the open file
	use 'simrat39/symbols-outline.nvim'			-- List of symbols (e.g. variable name in a file)
	--[[ use 'akinsho/toggleterm.nvim'				-- Persist and toggle multiple terminals during an editing session ]]
	use "folke/which-key.nvim"					-- Show the possible keybinding when you press a key
	use 'goolord/alpha-nvim'					-- Greeter (default stuff when you don't open directly a file)
	use 'BlakeJC94/alpha-nvim-fortune'
	use "lukas-reineke/indent-blankline.nvim" 	-- This plugin adds indentation guides to all lines (including empty lines).
	use "kylechui/nvim-surround"				-- Plugins to add various type of surrounding
	use "ahmedkhalf/project.nvim"				-- Project plugins
	use 'simrat39/rust-tools.nvim'
	use 'ThePrimeagen/harpoon'

	-- Statusline plugin
	use "nvim-lualine/lualine.nvim" -- A blazing fast and easy to configure Neovim statusline written in Lua.
	use "SmiteshP/nvim-navic"		-- A simple statusline/winbar component that uses LSP to show your current code context (e.g. if you are inside a function the name of the function)

	-- completion plugins
	use "hrsh7th/nvim-cmp" 			-- The completion plugin
	use "hrsh7th/cmp-buffer" 		-- buffer completions
	use "hrsh7th/cmp-path" 			-- path completions
	use "hrsh7th/cmp-cmdline" 		-- cmdline completions
	use "hrsh7th/cmp-nvim-lsp"		-- nvim-cmp source for neovim's built-in language server client.
	use "hrsh7th/cmp-nvim-lua"		-- nvim-cmp source for neovim Lua API.

	-- snippets
	use "L3MON4D3/LuaSnip" 					--snippet engine
	use "saadparwaiz1/cmp_luasnip" 			-- snippet completions
	-- use "rafamadriz/friendly-snippets" 	-- a bunch of snippets to use

	-- LSP (Language Server Protocol)
	use {
		"williamboman/mason.nvim",				-- LSP Installer
		"williamboman/mason-lspconfig.nvim",	-- LSP Installer
		"neovim/nvim-lspconfig" 				-- Enalbe LSP
	}
	use "folke/trouble.nvim"					-- List of all the LSP notifications in the files

	-- Colorscheme
	use 'folke/tokyonight.nvim'
	use "lunarvim/darkplus.nvim"

	-- Telescope
	use "nvim-telescope/telescope.nvim"					-- Telescope main repository
	--[[ use 'nvim-telescope/telescope-media-files.nvim'		-- Allow telescope to visualize media files ]]
	--[[ use "nvim-telescope/telescope-file-browser.nvim"	-- Plugin that allow synchronized creation, deletion, renaming, and moving of files ]]

	-- Treesitter
	use	"nvim-treesitter/nvim-treesitter" 				-- Treesitter main repository
	use "p00f/nvim-ts-rainbow" 							-- Plugin for Treesitter for nested parenthesis
	use 'JoosepAlviste/nvim-ts-context-commentstring' 	-- Use treesitter queries to create comments based on the context of the file
	use 'nvim-treesitter/nvim-treesitter-context'		-- Use treesitter to show the current context (e.g. the function you are inside at the moment)

	-- Git
	use 'lewis6991/gitsigns.nvim'	-- Show diff, blame in the editor etc
	use 'kdheepak/lazygit.nvim'		-- Interface with lazygit

	-- Devicons
	use 'nvim-tree/nvim-web-devicons'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
