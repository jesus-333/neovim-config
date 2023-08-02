vim.api.nvim_create_user_command("ReloadConfig", function()
  for name,_ in pairs(package.loaded) do
    if name:match('^default') and not name:match('nvim-tree') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end, {})

vim.api.nvim_create_user_command("ExecutePython", function ()
	local filename = vim.api.nvim_buf_get_name(0)
	if string.match(filename, ".py") then
		vim.fn.jobstart({"python", filename}, {
			stdout_buffered = true,
			on_stdout = function (_, data)
				if data then
					print("There are data")
				end
			end
		})
	else
		print("Not a python file")
	end
end, {})

local buffer_to_string = function()
	local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
	return table.concat(content, "\n")
end

vim.api.nvim_create_user_command("Test", function ()
	local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
	print(content)

	local line_number, _ = unpack(vim.api.nvim_win_get_cursor(0))
	print(r)
end, {})
