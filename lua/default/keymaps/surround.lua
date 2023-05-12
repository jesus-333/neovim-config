-- Keymaps relate to surround stuff

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Surround Add/remove (nvim-surround)
vim.keymap.set("n", "((", 	"ysiw)", {remap = true, silent = true})   	-- surround word under the cursor with round brackets 	
vim.keymap.set("n", "))", 	"ds)", 	 {remap = true, silent = true})   	-- remove round brackets around a word (not work perfectly)	
vim.keymap.set("n", "{{", 	"ysiw}", {remap = true, silent = true})   	-- surround word under the cursor with square brackets	
vim.keymap.set("n", "}}", 	"ds}", 	 {remap = true, silent = true})   	-- remove square brackets around a word (not work perfectly 	
vim.keymap.set("n", "\"\"", "ysiw\"",{remap = true, silent = true})		-- surround word under the cursor with double quotaion mark   	
vim.keymap.set("n", "''", 	"ysiw'", {remap = true, silent = true})   	-- surround word under the cursor with single quotaion mark 	
vim.keymap.set("n", "``", 	"ysiw`", {remap = true, silent = true})   	-- surround word under the cursor with backtick	

-- Surround Replace (nvim-surround)
vim.keymap.set("n", "\"(", "cs\"(", {remap = true, silent = true}) 		-- Replace double quoutes with round brackets around a word
vim.keymap.set("n", "\")", "cs\"(", {remap = true, silent = true}) 		-- Replace double quoutes with round brackets around a word
vim.keymap.set("n", "(\"", "cs(\"", {remap = true, silent = true})		-- Replace round brackets with double quoutes around a word
vim.keymap.set("n", ")\"", "cs(\"", {remap = true, silent = true})		-- Replace round brackets with double quoutes around a word
vim.keymap.set("n", "\"'", "cs\"'", {remap = true, silent = true})		-- Replace single quoutes with double quotes around a word
vim.keymap.set("n", "'\"", "cs'\"", {remap = true, silent = true})		-- Replace double quoutes with single quotes around a word

-- Surround Add/remove (with basic VIM)
--[[ keymap("n", "((", "ciw(<C-r>\")<ESC>", opts)   		-- surround word under the cursor with round brackets ]]
--[[ keymap("n", "))", "di(hPl2x", opts)   				-- remove round brackets around a word (not work perfectly) ]]
--[[ keymap("n", "{{", "ciw{<C-r>\"}<ESC>", opts)   		-- surround word under the cursor with square brackets ]]
--[[ keymap("n", "}}", "di{hPl2x", opts)   				-- remove square brackets around a word (not work perfectly) ]]
--[[ keymap("n", "''", "ciw'<C-r>\"'<ESC>", opts)		-- surround word under the cursor with single quotaion mark ]]
--[[ keymap("n", "\"\"", "ciw\"<C-r>\"\"<ESC>", opts)	-- surround word under the cursor with double quotaion mark ]]

-- Surround Replace (with basic VIM)
--[[ keymap("n", "\"(", "vi\"xa(<C-r>\")<ESC>F\"xF\"x", opts) 	-- Replace double quoutes with round brackets around a word ]]
--[[ keymap("n", "\")", "vi\"xa(<C-r>\")<ESC>F\"xF\"x", opts) 	-- Replace double quoutes with round brackets around a word ]]
--[[ keymap("n", "(\"", "vi(xa\"<C-r>\"\"<ESC>F)xF(x", opts)		-- Replace round brackets with double quoutes around a word ]]
--[[ keymap("n", ")\"", "vi(xa\"<C-r>\"\"<ESC>F)xF(x", opts)		-- Replace round brackets with double quoutes around a word ]]
