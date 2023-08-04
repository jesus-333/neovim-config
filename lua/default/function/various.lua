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

