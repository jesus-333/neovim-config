-- Keymaps for telescope plugins

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- With leader (space) + f open the telescope default file finder with some option
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>F", "<cmd>lua require'telescope'.extensions.file_browser.file_browser()<cr>", opts)

-- List of symbols in the file
keymap("n", "<leader>s1", "<cmd> Telescope lsp_document_symbols symbols=function,method,class<cr>", opts)
keymap("n", "<leader>s2", "<cmd> Telescope lsp_document_symbols symbols=variable,constant<cr>", opts)
keymap("n", "<leader>s3", ":SymbolsOutline<cr>", opts) -- Symbols outline plugin. Not telescope but put here because of the keymap

-- With leader + t open the function to search through text
keymap("n", "<leader>tt", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>tg", "<cmd>Telescope grep_string<cr>", opts)

-- Various builtin telescope function
keymap("n", "<leader>bb", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts) 	-- List of open buffer (tab)
keymap("n", "<leader>bo", "<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)	-- List of files open in the past
keymap("n", "<leader>br", "<cmd>lua require'telescope.builtin'.registers(require('telescope.themes').get_cursor({ previewer = false }))<cr>", opts)		-- Show register

-- Telescope projects (require extension)
keymap("n", "<leader>bp", "<cmd>lua require('telescope').extensions.projects.projects(require('telescope.themes').get_dropdown({hidden=true}))<cr>", opts)

