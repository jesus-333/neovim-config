-- Setup nvim-cmp.
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

npairs.setup {
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" }, -- Disable autopairs for files of this type
	
	-- In insert mode after a bracket is written press alt + e to show all the place where the close bracket can be inserted
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, 	-- Offset from pattern match
		end_key = "$", 	-- Characters for the last possible place where to insert a bracket
		keys = "qwertyuiopzxcvbnmasdfghjkl", -- Characters (and relative order) used to indicate where the closing bracket can be inserted
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
}

-- Integration with cmp (completion) plugin
local cmp_autopairs = require "nvim-autopairs.completion.cmp"

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
