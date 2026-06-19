-- ============================================================================
-- lazy.nvim bootstrap (replaces the old packer auto-install block)
-- ============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: <leader> must be set BEFORE this file runs.
-- In your init.lua, `require "default.keymaps"` (which sets vim.g.mapleader)
-- already runs before `require "default.plugins"`, so you're good.

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- ============================================================================
-- Plugin specification
--
-- Structure note: to keep your current setup (each plugin configured in its
-- own file under lua/default/, required from init.lua AFTER this file), every
-- plugin here is declared with `lazy = false`. That means lazy.nvim installs
-- and loads them all at startup, exactly like packer did, and your existing
-- `require "default.xxx"` calls in init.lua keep working unchanged.
--
-- When you later want faster startup, you can move each plugin's config into
-- its spec here (via `config`/`opts`/`event`/`keys`/`ft`) and drop the matching
-- require from init.lua, one plugin at a time.
-- ============================================================================
lazy.setup({
	defaults = { lazy = false }, -- packer-like behaviour: load everything at startup

	spec = {
		-- Various ---------------------------------------------------------------
		{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
		{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used in lots of plugins
		{ "kyazdani42/nvim-tree.lua" }, -- nvim-tree (file explorer)
		{ "stevearc/oil.nvim" }, -- File explorer managed as a text buffer
		{ "simonmclean/triptych.nvim" }, -- triptych (alternative file explorer)
		{ "mikavilpas/yazi.nvim" }, -- Neovim extension for the yazi file explorer

		{ "simrat39/symbols-outline.nvim" }, -- List of symbols in a file (e.g. variable/functions)
		{ "ahmedkhalf/project.nvim" }, -- Project plugin
		{ "simrat39/rust-tools.nvim" },
		{ "wakatime/vim-wakatime" }, -- Stats about coding
		{ "rhysd/vim-grammarous" },
		-- { "akinsho/toggleterm.nvim" }, -- Persist and toggle multiple terminals during an editing session

		-- Navigation/editing ---------------------------------------------------
		{ "RRethy/vim-illuminate" }, -- Highlight text under the cursor
		{ "numToStr/Comment.nvim" }, -- Easily comment stuff
		{ "kylechui/nvim-surround" }, -- Plugin to add various type of surrounding
		{ url = "https://codeberg.org/andyg/leap.nvim"}, -- Navigation plugin
		{ "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter

		-- UI/Graphics/Notifications --------------------------------------------
		{ "romgrk/barbar.nvim" }, -- Show tabs of the open file
		{ "lukas-reineke/indent-blankline.nvim" }, -- Indentation guides on all lines (incl. empty lines)
		{ "folke/which-key.nvim" }, -- Show the possible keybindings when you press a key
		{ "goolord/alpha-nvim" }, -- Greeter (default screen when you don't open a file directly)
		{ "BlakeJC94/alpha-nvim-fortune" }, -- Add citations to alpha greeter
		{ "MunifTanjim/nui.nvim" }, -- UI Component library for Neovim
		{ "stevearc/dressing.nvim" }, -- Improve nvim UI
		{ "rcarriga/nvim-notify" }, -- Notification plugin
		{ "folke/noice.nvim" }, -- Replace UI for messages, cmdline and popupmenu

		-- Statusline ------------------------------------------------------------
		{ "nvim-lualine/lualine.nvim" }, -- Fast, easy to configure statusline written in Lua
		{ "SmiteshP/nvim-navic" }, -- Statusline/winbar component showing current code context via LSP

		-- Completion ------------------------------------------------------------
		{ "hrsh7th/nvim-cmp" }, -- The completion plugin
		{ "hrsh7th/cmp-buffer" }, -- buffer completions
		{ "hrsh7th/cmp-path" }, -- path completions
		{ "hrsh7th/cmp-cmdline" }, -- cmdline completions
		{ "hrsh7th/cmp-nvim-lsp" }, -- nvim-cmp source for Neovim's built-in LSP client
		{ "hrsh7th/cmp-nvim-lua" }, -- nvim-cmp source for Neovim Lua API

		-- Snippets --------------------------------------------------------------
		{ "L3MON4D3/LuaSnip" }, -- snippet engine
		{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions
		-- { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use

		-- LSP (Language Server Protocol) ---------------------------------------
		{ "williamboman/mason.nvim" }, -- LSP Installer
		{ "williamboman/mason-lspconfig.nvim" }, -- LSP Installer
		{ "neovim/nvim-lspconfig" }, -- Enable LSP
		{ "folke/trouble.nvim" }, -- List of all the LSP notifications in the files
		{ "nvimtools/none-ls.nvim" }, -- Community version of null-ls
		{ "zbirenbaum/copilot.lua" }, -- Github Copilot (extension written in lua)
		-- { "github/copilot.vim" }, -- Github Copilot (original version)

		-- Colorscheme -----------------------------------------------------------
		{ "folke/tokyonight.nvim" },
		{ "lunarvim/darkplus.nvim" },

		-- Telescope -------------------------------------------------------------
		{ "nvim-telescope/telescope.nvim" }, -- Telescope main repository
		-- { "nvim-telescope/telescope-media-files.nvim" }, -- Allow telescope to visualize media files
		-- { "nvim-telescope/telescope-file-browser.nvim" }, -- Synchronized create/delete/rename/move of files

		-- Treesitter ------------------------------------------------------------
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- Treesitter main repository
		-- { "p00f/nvim-ts-rainbow" }, -- Treesitter rainbow parens (currently erroring upstream)
		{ "JoosepAlviste/nvim-ts-context-commentstring" }, -- Context-aware commentstring via treesitter
		{ "nvim-treesitter/nvim-treesitter-context" }, -- Show the current context (e.g. enclosing function)

		-- Git -------------------------------------------------------------------
		{ "lewis6991/gitsigns.nvim" }, -- Show diff, blame in the editor etc
		{ "kdheepak/lazygit.nvim" }, -- Interface with lazygit
		{ "akinsho/git-conflict.nvim" }, -- Plugin to resolve merge conflicts

		-- Devicons --------------------------------------------------------------
		{ "nvim-tree/nvim-web-devicons" },
	},

	-- Don't auto-install a colorscheme on the install screen; you set tokyonight
	-- yourself in default/colorscheme.lua.
	install = { colorscheme = { "tokyonight", "habamax" } },

	-- Have lazy use a rounded popup window (matches your old packer float).
	ui = { border = "rounded" },

	-- Disable the automatic update checker (packer didn't do this either).
	checker = { enabled = false },
})
