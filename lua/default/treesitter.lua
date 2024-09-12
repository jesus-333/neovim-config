local configs = require("nvim-treesitter.configs")
configs.setup {
	-- List of languages enable in treesitter
	ensure_installed = {
		"c",
		"cpp",
		"javascript",
		"json",
		"latex",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"rust"
	},
	sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore installing
	
	highlight = {
		enable = true, 		-- false will disable the whole extension
		disable = { "" }, 	-- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	
	indent = { enable = true },
	
	autopairs = {
		enable = true
	},

	-- Config for rainbow plugin of treesitter
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
	
	-- Create comments based on context
	-- Settings deprecated. More info at https://github.com/JoosepAlviste/nvim-ts-context-commentstring/issues/82
	--[[ context_commentstring = { ]]
	--[[ 	enable = true, ]]
	--[[ 	enable_autocmd = false, ]]
	--[[ 	config = { ]]
 	--[[      		python = '# %s' ]]
 	--[[    	} ]]
 	--[[  	}, ]]
}

require('ts_context_commentstring').setup {
	enable = True,
	enable_autocmd = false,
	languages = {
		python = '# %s',
	},
}

require'treesitter-context'.setup{
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
	trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}
