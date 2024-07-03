local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Default neovim file explorer
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Search inside the file
keymap("n", "ff", "yiw/<C-r>\"<CR>:noh<CR>", opts) -- Find the next occurence of the word under the cursor
--[[ keymap("n", "ff", "#<ESC>N", opts) -- Find the next occurence of the word under the cursor ]] -- TODO DEBUG

-- Close the current buffer
keymap("n", "<C-b>", "<Esc>:bd<CR>", opts)

-- Save file
keymap("n", "<leader>w", ":w!<cr>", opts)

-- Close windows
keymap("n", "<leader>q", ":q<CR>", opts)

-- Open LazyGit
keymap("n", "<leader>z", ":LazyGit<CR>", opts)

-- Insert a string of dash space char as comment
vim.keymap.set("n", "--", "I<CR><ESC>k<ESC>33i- <ESC><ESC>gccP<ESC>dd", {remap = true, silent = true})

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Trouble plugin
vim.keymap.set("n", "tt", "<cmd>TroubleToggle document_diagnostics<cr>", {noremap = true, silent = true})  -- Create a list with all the lsp notes for the documents

-- Copilot
keymap("n", "<leader>cp", ":Copilot panel<cr>", opts)
keymap("n", "<leader>cs", ":Copilot suggestion<cr>", opts)
vim.keymap.set('i', '<Tab>', function()
	if require("copilot.suggestion").is_visible() then
		require("copilot.suggestion").accept()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
	end
end, { desc = "Super Tab" })

-- Toggle Terminal (Plugin removed)
-- <C-\> Open/Close the terminal. Specified inside the toggleterm plugin file
--[[ keymap("n", "<C-e>", ":ToggleTermSendCurrentLine<cr>", opts) ]]
--[[ keymap("v", "<C-e>", ":ToggleTermSendVisualSelection<cr>", opts) ]]

-- Send text to tmux (TODO)
--[[ keymap("n", "<C-e>", ":lua send_current_line(1)<cr>", opts) ]]
--[[ keymap("v", "<C-e>", ":SendYankedTextIpython<cr>", opts) ]]

-- Replace Text
keymap("n", "<leader>r1", ":%s/", opts)
keymap("n", "<leader>r2", ":s/", opts)

-- Execute custom function
--[[ keymap("n", "<C-x>", ":ExecutePython<CR>", opts) -- Execute python code ]]
keymap("n", "<F12>", ":ReloadConfig<CR>", opts) -- Reload config
keymap("n", "<leader>sb", ":lua switch_bool()<CR>", opts) -- Change true in false and viceversa
keymap("n", "<leader>sc", ":lua switch_case()<CR>", opts) -- Change from CamelCase to snake_case and viceversa
