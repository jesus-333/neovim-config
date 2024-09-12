-- Server to config
local servers = {
	-- Python LSP
	"jedi_language_server",
	--[[ "pyright", ]]
	--[[ "pylyzer", ]]
	--[[ "pylsp", ]]
	"ruff_lsp",
	
	-- Other Languages
	"clangd",
	"rust_analyzer",
	"lua_ls",
	--[[ "tsserver", ]]
	
	-- Other stuff
	"jsonls",
	"ltex"
	--[[ "harper_ls", ]]
	--[[ "grammarly" ]]
	--[[ "html", ]]
	--[[ "cssls", ]]
}

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

-- Setup lsp servers
for _, server in pairs(servers) do
	opts = {
		on_attach = require("default.lsp.handlers").on_attach,
		capabilities = require("default.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]
	
	-- Get the setting of the server inside the folder settings from the file with the name of the server
	local require_ok, conf_opts = pcall(require, "default.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end

-- Separate setup (the setup of some servers don't work with the cycle)
--[[ require'lspconfig'.grammarly.setup{ init_options = {clientId = "client_BaDkMgx4X19X9UxxYRCXZo"}} ]]
