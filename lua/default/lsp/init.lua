local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "default.lsp.mason"
require("default.lsp.handlers").setup()
require "default.lsp.null-ls"


--[[ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  ]]
-- Add border to LSP floating windows. For some reasons don't work if the code is added to mason config
-- Bugged if added here

--[[ local border = { ]]
--[[     { '┌', 'FloatBorder' }, ]]
--[[     { '─', 'FloatBorder' }, ]]
--[[     { '┐', 'FloatBorder' }, ]]
--[[     { '│', 'FloatBorder' }, ]]
--[[     { '┘', 'FloatBorder' }, ]]
--[[     { '─', 'FloatBorder' }, ]]
--[[     { '└', 'FloatBorder' }, ]]
--[[     { '│', 'FloatBorder' }, ]]
--[[ } ]]
--[[]]
--[[ -- Add the border on hover and on signature help popup window ]]
--[[ local handlers = { ]]
--[[     ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }), ]]
--[[     ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }), ]]
--[[ } ]]
--[[]]
--[[ vim.diagnostic.config({ ]]
--[[     float = { border = border }, ]]
--[[ }) ]]
--[[]]
--[[ -- Add the border (handlers) to the lua language server ]]
--[[ lspconfig.lua_ls.setup({ ]]
--[[     handlers = handlers, ]]
--[[     -- The rest of the server configuration ]]
--[[ }) ]]
--[[]]
--[[ lspconfig.pylsp.setup({ ]]
--[[     handlers = handlers, ]]
--[[     -- The rest of the server configuration ]]
--[[ }) ]]
