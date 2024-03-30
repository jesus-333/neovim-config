local status_ok, leap = pcall(require, "leap")
if not status_ok then
	print("ERROR: leap plugin")
    return
end

leap.setup({
	-- Configuration here, or leave empty to use defaults
})

leap.create_default_mappings()
