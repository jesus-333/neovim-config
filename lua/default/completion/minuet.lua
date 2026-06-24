-- Try to load minuet
local status_ok, minuet = pcall(require, "minuet")
if not status_ok then
	print("ERROR : minuet")
	return
end


-- completion/minuet.lua
local function load_presets()
	local presets = {}
	-- find every .lua file under the minuet_preset folder on the runtimepath
	local files = vim.api.nvim_get_runtime_file(
		"lua/default/completion/minuet_preset/*.lua", true
	)
	for _, path in ipairs(files) do
		local module = "default.completion.minuet_preset."
		.. vim.fn.fnamemodify(path, ":t:r")  -- filename without dir or .lua
		local ok, preset = pcall(require, module)
		if ok and preset and preset.name and preset.config then
			presets[preset.name] = preset.config
		else
			vim.notify("Skipped preset: " .. path, vim.log.levels.WARN)
		end
	end
	return presets
end

minuet.setup {
	virtualtext = { auto_trigger_ft = {} },
	presets = load_presets(),
}
