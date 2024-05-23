-- Neovim option file
require "default.options"

-- Keymaps config (multiple files)
require "default.keymaps"

-- File with the list of all the plugins used
require "default.plugins"

-- Colorscheme file
require "default.colorscheme"

-- Autocompletion and LSP (multiple files)
require "default.cmp"
require "default.lsp"
require "default.copilot"

-- Plugins settings (each plugin has its own settings file)
require "default.telescope"			-- Telescope (Search between text/File)
require "default.treesitter"		-- Treesitter (parser)
require "default.autopairs"			-- Brackets automatic closure
require "default.lualine"			-- lualine statusbar
require "default.comments"			-- Comments plugin (add command to comments line(s))
require "default.gitsign"			-- Gitsign (show diff and other stuff)
require "default.nvim-tree-setup"	-- nvim-tree (file explorer)
require "default.vim-illuminate"	-- vim-illuminate (text highlight)
require "default.symbols-outline"	-- List of symbols (e.g. variable name)
require "default.which-key"			-- Show keybinding
require "default.alpha"				-- Greeter (default menu when open neovim)
require "default.indentline"		-- Show Vertical line corresponding to the various level of indentation
require "default.surround"			-- Surround stuff with brackets et similia
require "default.project"			-- Setup of the project plugin
require "default.trouble"			-- Trouble plugin (list of lsp notes/error in the files)
require "default.dressing"			-- Ui Extension
require "default.noice"				-- Replace cmd 
require "default.leap"				-- Navigation plugin
require "default.function"			-- Custom function I wrote (not really a plugin)
