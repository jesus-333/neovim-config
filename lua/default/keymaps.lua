local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Default neovim file explorer
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)

-- Move text up and down
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts) -- Up
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts) -- Down

-- Search inside the file
keymap("n", "ff", "yiw/<C-r>\"<CR>:noh<CR>", opts) -- Find the next occurence of the word under the cursor

-- Other
keymap("n", "<C-b>", "<Esc>:bd<CR>", opts) 		-- Close the current buffer
keymap("n", "<leader>w", ":w!<cr>", opts)   	-- Save file
keymap("n", "<leader>z", ":LazyGit<CR>", opts) 	-- Open LazyGit
vim.keymap.set("n", "--", "I<CR><ESC>k<ESC>33i- <ESC><ESC>gccP<ESC>dd", {remap = true, silent = true}) -- Insert a string of dash space char as comment

-- Insert --
keymap("i", "jk", "<ESC>", opts) -- Press jk fast to enter

-- Visual --
keymap("v", "<", "<gv", opts) -- Remove indent
keymap("v", ">", ">gv", opts) -- Indent

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
--[[ keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts) ]]
--[[ keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts) ]]
--[[ keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts) ]]
--[[ keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts) ]]

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Symbols-Outline
keymap("n", "<leader>s", ":SymbolsOutline<cr>", opts)

-- Surround Add/remove (nvim-surround)
vim.keymap.set("n", "((", 	"ysiw)", {remap = true, silent = true})   	-- surround word under the cursor with round brackets 	
vim.keymap.set("n", "))", 	"ds)", 	 {remap = true, silent = true})   	-- remove round brackets around a word (not work perfectly)	
vim.keymap.set("n", "{{", 	"ysiw}", {remap = true, silent = true})   	-- surround word under the cursor with square brackets	
vim.keymap.set("n", "}}", 	"ds}", 	 {remap = true, silent = true})   	-- remove square brackets around a word (not work perfectly 	
vim.keymap.set("n", "\"\"", "ysiw\"",{remap = true, silent = true})		-- surround word under the cursor with single quotaion mark   	
vim.keymap.set("n", "''", 	"ysiw'", {remap = true, silent = true})   	-- surround word under the cursor with double quotaion mark 	

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


-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- Telescope 

-- With leader (space) + f open the telescope default file finder with some option
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>F", "<cmd>lua require'telescope'.extensions.file_browser.file_browser()<cr>", opts)

-- With leader + t open the function to search through text
keymap("n", "<leader>t", "<cmd>Telescope live_grep<cr>", opts)

-- With leader + b open the list of current buffer
keymap("n", "<leader>bb", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)

-- Telescope tab (Not installed)
--[[ keymap("n", "<leader>t", "<cmd>:Telescope telescope-tabs list_tabs<cr>", opts) ]]
keymap("n", "<leader>p", "<cmd>lua require('telescope').extensions.projects.projects(require('telescope.themes').get_dropdown({hidden=true}))<cr>", opts)
-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
