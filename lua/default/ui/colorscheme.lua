require("tokyonight").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	light_style = "day", -- The theme is used when the background is set to light
	transparent = false, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = false, -- dims inactive windows
	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	---@param colors ColorScheme
	on_colors = function(colors)
		colors.comment = "#5aff3d"
		colors.terminal_black = '#c0caf5' 	-- Variable not used
		colors.fg = '#FFFFFF' 				-- Normal text
		colors.fg_gutter = "#898899" 		-- Line number color
	end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	---@param highlights Highlights
	---@param colors ColorScheme
	on_highlights = function(highlights, colors) 
		-- Color of all lines number
		colors.LineNr = {
			fg = '#696969'
		}

		-- Color of the current line number
		highlights.CursorLineNr = {
			fg = colors.red
		}

		-- Change function color
		highlights.Function = {
			fg = '#8afbff'
		}
	end,
})

-- Set colorscheme
local colorscheme = "tokyonight"

-- Protected call to vim commandd that set the colorscheme
local status_ok, colorscheme_setup = pcall(vim.cmd, "colorscheme " .. colorscheme)


-- If there are errors show a message
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
