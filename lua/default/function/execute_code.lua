vim.api.nvim_create_user_command("ReloadConfig", function()
  for name,_ in pairs(package.loaded) do
    if name:match('^default') and not name:match('nvim-tree') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end, {})

function _G.execute_python()
	local filename = vim.api.nvim_buf_get_name(0)
	if string.match(filename, ".py") then
		local file_text = concat_string_array(vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false))
		if string.match(file_text, "if __name__ == '__main__':") then
			vim.fn.jobstart({"python", filename}, {
				stdout_buffered = true,
				stderr_buffered = true,
				on_stdout = function (_, data)
					if #data > 1 then
						print("OUT", #data)
						local win, buf = open_buf_vsplit()
						vim.api.nvim_buf_set_lines(buf, 0, 2, false, {"Standard OUTPUT"})
						vim.api.nvim_buf_set_lines(buf, 3, -1, false, data)
					end
				end,
				on_stderr = function (_, data)
					if #data > 1 then
						local win, buf = open_buf_vsplit()
						vim.api.nvim_buf_set_lines(buf, 0, 2, false, {"ERROR"})
						vim.api.nvim_buf_set_lines(buf, 3, -1, false, data)
					end
				end
			})
		else
			print("No main in the file")
		end
	else
		print("Not a python file")
	end
end

vim.api.nvim_create_user_command("ExecutePython", execute_python, {})

