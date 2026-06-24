-- A handler is a routine/function/method which is specialized in a certain type of data or focused on certain special tasks.

-- Variable (dictionary?) where everythong is saved
-- A the end of the file M is returned
local M = {}

-- TODO: backfill this to template
M.setup = function()
	local border = {
		{ '┌', 'FloatBorder' },
		{ '─', 'FloatBorder' },
		{ '┐', 'FloatBorder' },
		{ '│', 'FloatBorder' },
		{ '┘', 'FloatBorder' },
		{ '─', 'FloatBorder' },
		{ '└', 'FloatBorder' },
		{ '│', 'FloatBorder' },
	}

	-- Set icons for error/warnings etc
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		--[[ vim.diagnostic.config(sign.name, { texthl = sign.name, text = sign.text, numhl = "" }) ]]
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
		  active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,

		-- Setup for floating winwdows (error description, funciton documentation etc)
		float = {
		  focusable = true,
		  style = "minimal",
		  border = border,
		  source = "always",
		  header = "",
		  prefix = "",
		},
	}

	vim.diagnostic.config(config)

	-- Set round border on hover and signatureHelp 
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = border,
	})
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = border,
	})
end

-- Personal keybinding for LSP
local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	-- Jump to funciton DECLARATION pressing gD (uppercase D)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	
	-- Jump to funciton DEFINITION pressing gd (lowercase d)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	
	-- Pressing capital K (or shift + k) over something show a description
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	
	-- Pressing gr show all the "place" where the selected text appears in various file
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	--[[ vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) ]]
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	
	-- Show error/diagnostic pressing gl
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gl",
		'<cmd>lua vim.diagnostic.open_float()<CR>',
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	--[[ vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts) ]]
	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
	-- Turn off formatting if ts server is active
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end
	lsp_keymaps(bufnr)
	--[[ lsp_highlight_document(client) ]]
	
	-- Navic setup (A simple statusline/winbar component that uses LSP to show your current code context)
	if client.server_capabilities.documentSymbolProvider then
        --[[ print(client.name, client.name == "pyright", require("nvim-navic")) ]]
		require("nvim-navic").attach(client, bufnr)
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- Depreacted
-- M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
