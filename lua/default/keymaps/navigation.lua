local opts = { noremap = true, silent = true }

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