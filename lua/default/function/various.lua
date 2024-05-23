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

-- Flip a bool variable
function _G.switch_bool()
	-- Get the name of the file
	local filename = vim.api.nvim_buf_get_name(0)
	
	-- Get the word highlighted by the cursor
	local word = get_highlighted_word()
	local flip_word = "aaa"
	
	-- Check if the word is a bool value and flip it
	if string.match(filename, ".py") then
		if word == "False" then
			flip_word = " True"
		elseif word == "True" then
			flip_word = " False"
		end
	elseif string.match(filename, ".cpp") or string.match(filename, ".rs") or string.match(filename, ".lua") then
		if word == "false" then
			flip_word = "true"
		elseif word == "true" then
			flip_word = "false"
		end
	else
		vim.print("Language not supported")
	end
	
	-- Write the flip value instead of the original bool
	if flip_word ~= "aaa" then
		vim.cmd("normal! caw" ..  flip_word)
	end
end

function _G.switch_case()
	-- Get word
	local word = get_highlighted_word()
	local other_case_word = "aaa"

	if word:find('[a-z][A-Z]') then -- Detect camelCase
		-- Convert camelCase to snake_case
		other_case_word = word:gsub('([a-z])([A-Z])', '%1_%2'):lower()
	elseif word:find('_[a-z]') then -- Detect snake_case
		-- Convert snake_case to camelCase
		other_case_word = word:gsub('(_)([a-z])', function(_, l) return l:upper() end)
	else
		print("Not a snake_case or camelCase word")
	end

	if other_case_word ~= "aaa" then
		vim.cmd("normal! diwi" .. other_case_word)
	end
end

function _G.table_to_string(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
