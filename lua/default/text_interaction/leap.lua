local status_ok, leap = pcall(require, "leap")
if not status_ok then
	print("ERROR: leap plugin")
    return
end

leap.setup({
	-- Configuration here, or leave empty to use defaults
})

-- The rewritten leap no longer provides a default-mapping helper function;
-- you set the <Plug> keys yourself. This reproduces the classic defaults.
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
