-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-- treesitter config. Migrating from old version


local ts = require("nvim-treesitter")

-- List of languages you want parsers for (the old `ensure_installed`)
local ensure_installed = {
	"c",
	"cpp",
	"javascript",
	"json",
	-- "latex",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"rust",

	-- Recommended extras for a Lua config (parsers used by other plugins):
	"vim",
	"vimdoc",
	"query",
}

-- Install any parsers from the list that aren't installed yet.
-- install() is asynchronous; it no-ops for parsers already present.
ts.install(ensure_installed)

-- Enable highlighting + indentation per buffer.
-- On `main` these are activated manually via a FileType autocommand rather than the old `highlight = { enable = true }` / `indent = { enable = true }`.
local group = vim.api.nvim_create_augroup("user_treesitter", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = group,
	callback = function(args)
		local buf = args.buf
		local ft = vim.bo[buf].filetype

		-- Map the filetype to a treesitter language, then only start if a
		-- parser actually exists, so non-code buffers don't throw errors.
		local lang = vim.treesitter.language.get_lang(ft)
		if not lang then
			return
		end

		local ok = pcall(vim.treesitter.start, buf, lang)
		if ok then
			-- Treesitter-based indentation (replaces old `indent = { enable = true }`)
			vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-- nvim-ts-context-commentstring — unchanged API, carried over verbatim
require("ts_context_commentstring").setup({
	enable = true,
	enable_autocmd = false,
	languages = {
		python = "# %s",
	},
})


-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-- treesitter-context — unchanged API, carried over verbatim
--
require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	separator = nil, -- Separator between context and content (single char string, e.g. '-')
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})
