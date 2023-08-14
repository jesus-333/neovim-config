vim.api.nvim_create_user_command("ReloadConfig", function()
  for name,_ in pairs(package.loaded) do
    if name:match('^default') and not name:match('nvim-tree') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end, {})


function _G.concat_string_array(string_array)
	local concat_string = ""
	for i in pairs(string_array) do
		local line = string_array[i]
		local blank = (line == nil or #string.gsub(line, "^%s*(.-)%s*$", "%1") == 0)
		if not blank then
			concat_string = concat_string .. line .. "\n"
		end
	end
	return concat_string

end

function _G.test()
	local status_ok, toggleterm = pcall(require, "toggleterm")
	if not status_ok then
		print("toggleterm NOT INSTALLED")
		return
	end
	
end
