function _G.open_buf_split(split_type)
	vim.cmd(split_type)
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_create_buf(true, true)
	vim.api.nvim_win_set_buf(win, buf)
end

function _G.open_buf_vsplit()
	open_buf_split('vsplit')
end

function _G.open_buf_hsplit()
	open_buf_split('hsplit')
end
