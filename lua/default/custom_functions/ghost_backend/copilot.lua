-- functions/ghost_backend/copilot.lua
return {
	key = "copilot",
	order = 1,
	name = "Copilot",
	enable = function() vim.cmd("Copilot suggestion") end,
	disable = function()
		local ok, sug = pcall(require, "copilot.suggestion")
		if ok and sug.is_visible() then sug.dismiss() end
		vim.cmd("Copilot disable")
	end,
	is_visible = function() return require("copilot.suggestion").is_visible() end,
	accept = function() require("copilot.suggestion").accept() end,
}
