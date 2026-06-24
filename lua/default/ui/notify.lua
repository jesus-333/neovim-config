local status_ok, notify = pcall(require, "notify")
if not status_ok then
	print("Problem with NOTIFY plugin")
	return
end

notify.setup({
    top_down = false,
})
