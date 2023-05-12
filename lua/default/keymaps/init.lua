local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require "default.keymaps.telescope"
require "default.keymaps.surround"
require "default.keymaps.register"
require "default.keymaps.navigation"
require "default.keymaps.various"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Move text up and down
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts) -- Up
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts) -- Down

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
