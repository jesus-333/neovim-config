local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Default neovim file explorer
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Search inside the file
keymap("n", "ff", "yiw/<C-r>\"<CR>:noh<CR>", opts) -- Find the next occurence of the word under the cursor

-- Close the current buffer
keymap("n", "<C-b>", "<Esc>:bd<CR>", opts)

-- Save file
keymap("n", "<leader>w", ":w!<cr>", opts)

-- Open LazyGit
keymap("n", "<leader>z", ":LazyGit<CR>", opts)

-- Insert a string of dash space char as comment
vim.keymap.set("n", "--", "I<CR><ESC>k<ESC>33i- <ESC><ESC>gccP<ESC>dd", {remap = true, silent = true})

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Trouble plugin
vim.keymap.set("n", "tt", "<cmd>TroubleToggle document_diagnostics<cr>", {noremap = true, silent = true})  -- Create a list with all the lsp notes for the documents

-- Toggle Terminal
-- <C-\> Open/Close the terminal. Specified inside the toggleterm plugin file
--[[ keymap("n", "<C-e>", ":ToggleTermSendCurrentLine<cr>", opts) ]]
--[[ keymap("v", "<C-e>", ":ToggleTermSendVisualSelection<cr>", opts) ]]

-- Send text to tmux
keymap("n", "<C-e>", ":lua send_current_line(1)<cr>", opts)
keymap("v", "<C-e>", ":lua send_visual_selection(1)<cr>", opts)

-- Replace Text
keymap("n", "<leader>r1", ":%s/", opts)
keymap("n", "<leader>r2", ":s/", opts)

-- Execute custom function
keymap("n", "<C-x>", ":ExecutePython<CR>", opts) -- Execute python code
keymap("n", "<F12>", ":ReloadConfig<CR>", opts) -- Reload config
keymap("n", "<F10>", ":ToggleTerm<CR>ipython<CR>", opts) -- Open terminal and start ipython 
keymap("n", "<F9>", ":ToggleTerm<CR><CR><C-C>exit<CR>", opts) -- open terminal and close ipython
