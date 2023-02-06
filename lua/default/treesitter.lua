local configs = require("nvim-treesitter.configs")
configs.setup {
	-- List of languages enable in treesitter
	ensure_installed = {
		"c",
		"cpp",
		"lua",
		"python",
		"markdown",
		"javascript"
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
		-- disable = {}, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
  	},
}
