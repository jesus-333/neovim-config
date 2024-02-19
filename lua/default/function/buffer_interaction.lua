function _G.read_block(block_delimiter)
	-- Read all the text between two delimiter in the current buffer and return it as a single string
	-- The text read will be between the delimiter above the cursor and belove the cursor
	
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

function _G.get_text_visual_selection()
	local line_start = vim.fn.getpos("'<")[2]
	local line_end = vim.fn.getpos("'>")[2]

	return concat_string_array(vim.fn.getline(line_start, line_end))
end

--[[ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  ]]
-- Get/Set text under the cursor

function _G.get_highlighted_word() return vim.fn.expand('<cword>') end

function _G.set_text_under_cursor(text)
	vim.api.nvim_put(text, "", true, true)
	--[[ vim.api.nvim_buf_set_lines(0, 0, 0, false, text) ]]
end
