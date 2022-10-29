-- Set colorscheme
local colorscheme = "tokyonight"

-- Protected call to vim commandd that set the colorscheme
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

-- If there are errors show a message
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
