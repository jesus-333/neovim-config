local concat_string_array = function(string_array)
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

-- Read all the text between two delimiter in the current buffer and return it as a single string
-- The text read will be between the delimiter above the cursor and belove the cursor
function _G.read_block(block_delimiter)

	local all_buffer_content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)

	local cursor_line_number, _ = unpack(vim.api.nvim_win_get_cursor(0))
	local line_start_block = 0
	local line_end_block = vim.api.nvim_buf_line_count(0)

	for line_number, line in ipairs(all_buffer_content) do
		if string.match(line, block_delimiter) then
			if line_number <= cursor_line_number then
				line_start_block = line_number - 1
			elseif line_number > cursor_line_number then
				line_end_block = line_number - 1
				break
			end
		end
	end

	local block_content = vim.api.nvim_buf_get_lines(0, line_start_block, line_end_block, false)
	return concat_string_array(block_content)
end

-- Read the text between the delimiter defined as in the Spyder IDE, i.e. the delimiter are #%%
function _G.read_block_spyder()
	local block_text = read_block("#%%")
	return block_text
end

vim.api.nvim_create_user_command("Test", function ()
	vim.cmd('vsplit')
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_create_buf(true, true)
	vim.api.nvim_win_set_buf(win, buf)
end, {})

