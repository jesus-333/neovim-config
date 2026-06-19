local opts = { noremap = true, silent = true }

--[[ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  ]]
-- NAVIGATION

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Better window navigation (move between open windows)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Better terminal navigation (terminal mode)
--[[ keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts) ]]
--[[ keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts) ]]
--[[ keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts) ]]
--[[ keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts) ]]

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)

-- Open/close splits
keymap("n", "<C-s>v", ":vsplit<CR>", opts)
keymap("n", "<C-s>h", ":split<CR>", opts)
keymap("n", "<C-s>d", ":close<CR>", opts)

-- Jump between functions
vim.keymap.set("n", "mk", "[m", {remap = true, silent = true})   	--  Move to the previous method (works in python)	
vim.keymap.set("n", "mj", "]m", {remap = true, silent = true})   	--  Move to the next method (works in python) 	

-- Leap nvim plugins (jump on specific combo of characters)
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")

--[[ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  ]]
-- MOVE TEXT

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Move text up and down
--[[ keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts) -- Down ]]
--[[ keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts) -- Up ]]

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

