function _G.snippet_torch_class(class_name)
	print(class_name)
	local class_torch_string = {}

	table.insert(class_torch_string, "class " .. class_name .. "(nn.Module):")
	table.insert(class_torch_string, "\tdef __init__(self, config : dict):")
	table.insert(class_torch_string, "\t\tsuper().__init__()")
	table.insert(class_torch_string,  "\tdef forward(self, x):")
	table.insert(class_torch_string,  "\t\treturn x")
	
	set_text_under_cursor(class_torch_string)
end
