-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-- Basic settings

require "default.options" -- Neovim buil-in options
require "default.keymaps" -- Keymaps config (multiple files)
require "default.plugins" -- File with the list of all the plugins used

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-- Completion (LSP, LLMs etc)
require "default.completion.lsp"
require "default.completion.cmp"
require "default.completion.copilot"
require "default.completion.minuet"

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-- File Explorer (All plugins focused on moving between files and directories)

require "default.file_explorer.oil"			-- oil (file explorer)
require "default.file_explorer.telescope"	-- Telescope (Search between text/File)
require "default.file_explorer.yazi"		-- yazi (file explorer written in rust)
--[[ require "default.nvim-tree-setup"	-- nvim-tree (file explorer) ]]
--[[ require "default.triptych"			-- triptych (alternative file explorer) ]]

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-- Text interaction (moving inside a file, editing etc)

require "default.text_interaction.autopairs"	-- Brackets automatic closure
require "default.text_interaction.comments"		-- Comments plugin (add command to comments line(s))
require "default.text_interaction.leap"			-- Navigation plugin
require "default.text_interaction.surround"		-- Surround stuff with brackets et similia

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-- Various (All plugins that don't fit in the other categories)

require "default.treesitter"		-- Treesitter (parser)
require "default.project"			-- Setup of the project plugin
require "default.symbols-outline"	-- List of symbols (e.g. variable name)
require "default.trouble"			-- Trouble plugin (list of lsp notes/error in the files)
require "default.which-key"			-- Show keybindings

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-- UI (All plugins focused on the general neovim interface and its look)

require "default.ui.alpha"			-- Greeter (default menu when open neovim)
require "default.ui.colorscheme" 	-- Colorscheme file (It's here because I use the tokyonight plugin)
require "default.ui.dressing"		-- UI Extension
require "default.ui.gitsign"		-- Gitsign (show diff and other stuff)
require "default.ui.indentline"		-- Show Vertical line corresponding to the various level of indentation. NB. Hai commentato la linea 22 del file utils.lua del plugin (Il file è nella cartella del plugin dentro la cartella packer)
require "default.ui.lualine"		-- lualine statusbar
require "default.ui.noice"			-- Replace cmd
require "default.ui.notify"
require "default.ui.vim-illuminate"	-- vim-illuminate (text highlight)
--[[ require "default.vim-grammarous"	-- Grammar check ]]

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-- Custom functions (All the custom functions I wrote for my personal use)

require "default.function"
