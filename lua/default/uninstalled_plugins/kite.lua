-- Use tab to complete suggestion (If kite autocompletion is active)
vim.cmd("let g:kite_tab_complete=1")

-- Enable support for all languages
vim.cmd("let g:kite_supported_languages = ['python']")

-- Other
vim.cmd("set completeopt+=menuone")

-- Disable kite native autocompletion and integrate kite with LSP
vim.cmd("let g:kite_completions=0")
--vim.cmd("au User lsp_setup call lsp#register_server({'name': 'kite', 'cmd': 'C:/Program Files/Kite/kite-lsp.exe', whitelist': ['python'], }")
