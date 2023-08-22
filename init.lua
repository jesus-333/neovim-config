-- Neovim option file
require "default.options"

-- Keymaps file
require "default.keymaps"

-- Plugins file
require "default.plugins"

-- Colorscheme file
require "default.colorscheme"

-- Autocompletion and LSP
require "default.cmp"
require "default.lsp"

-- Plugin settings
require "default.telescope"			-- Telescope (Search between text/File)
require "default.treesitter"		-- Treesitter (parser)
require "default.autopairs"			-- Brackets automatic closure
require "default.lualine"			-- lualine statusbar
require "default.comments"			-- Comments plugin (add command to comments line(s))
require "default.gitsign"			-- Gitsign (show diff and other stuff)
require "default.nvim-tree-setup"	-- nvim-tree (file explorer)
require "default.vim-illuminate"	-- vim-illuminate (text highlight)
require "default.symbols-outline"	-- List of symbols (e.g. variable name)
require "default.toggleterm"		-- Terminal plugin
require "default.which-key"			-- Show keybinding
require "default.alpha"				-- Greeter (default menu when open neovim)
require "default.indentline"		-- Show Vertical line corresponding to the various level of indentation
require "default.surround"			-- Surround stuff with brackets et similia
require "default.project"			-- Setup of the project plugin
require "default.trouble"			-- Trouble plugin (list of lsp notes/error in the files)
require "default.function"
