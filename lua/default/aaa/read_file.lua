local concat_string_array = function(string_array, remove_empty_lines)
	return table.concat(string_array, "\n")
end

local aaa = "#%%"
vim.api.nvim_create_user_command("Test", function ()
	local all_buffer_content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)

	local cursor_line_number, _ = unpack(vim.api.nvim_win_get_cursor(0))
	local line_start_block = 0
	local line_end_block = 0

	for line_number, line in ipairs(all_buffer_content) do
		if string.match(line, "#%%") then
			print(line_number, line)
			if line_number <= cursor_line_number then
				line_start_block = line
			elseif line_number > cursor_line_number then
				line_end_block = line 
			end
		end
		
		--[[ print(line_start_block, line_end_block) ]]
		--[[ local block_content = vim.api.nvim_buf_get_lines(0, line_start_block, line_end_block, false) ]]
		--[[ print(concat_string_array(block_content, true)) ]]
	end
end, {})
local aaa = "#%%"

