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

function _G.check_parser()
	-- Sometimes when packets are update (or neovim) a parser is installed that go into conflict with treesitter
	-- This function return the list of all parsers. 
	vim.cmd("echo nvim_get_runtime_file('parser', v:true)")
end

function _G.flip_bool()
	-- Flip a bool variable
	local filename = vim.api.nvim_buf_get_name(0)

	local word = get_highlighted_word()
	local flip_word = "aaa"

	if string.match(filename, ".py") then
		if word == "False" then
			flip_word = "True"
		elseif word == "True" then
			flip_word = "False"
		end
	elseif string.match(filename, ".cpp") or string.match(filename, ".rs") then
		if word == "false" then
			flip_word = "true"
		elseif word == "true" then
			flip_word = "false"
		end
	else
		print("Language not supported")
	end

	if flip_word ~= "aaa" then
		vim.cmd("normal! diwi" ..  flip_word)
	end
end

function _G.get_highlighted_word() return vim.fn.expand('<cword>') end
