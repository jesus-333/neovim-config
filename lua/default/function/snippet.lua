function _G.basic_imports()
	local basic_imports_string = {}

	table.insert(basic_imports_string, "import numpy as np")
	table.insert(basic_imports_string, "import matplotlib.pyplot as plt")
	table.insert(basic_imports_string, "import torch")
end

function _G.snippet_torch_class(class_name)
	local class_torch_string = {}

	table.insert(class_torch_string, "class " .. class_name .. "(nn.Module):")
	table.insert(class_torch_string, "")
	table.insert(class_torch_string, "\tdef __init__(self, config : dict):")
	table.insert(class_torch_string, "\t\tsuper().__init__()")
	table.insert(class_torch_string, "")
	table.insert(class_torch_string, "\tdef forward(self, x):")
	table.insert(class_torch_string, "\t\treturn x")
	
	set_text_under_cursor(class_torch_string)
end

function _G.snippet_plot_config(width, height)
	local plot_config_string = {}

	width = width or 1
	height = height or 1
	
	table.insert(plot_config_string, "plot_config = dict(")
	table.insert(plot_config_string, "\tfigsize = (" .. width .. ", " .. height .. "),")
	table.insert(plot_config_string, "\tfontisze = 15,")
	table.insert(plot_config_string, "\tsave_fig = False,")
	table.insert(plot_config_string, ")")

	set_text_under_cursor(plot_config_string)
end

function _G.snippet_plot_figure(n_rows, n_cols)
	local figure_string = {}

	n_rows = n_rows or 1
	n_cols = n_cols or 1
	
	table.insert(figure_string, "fig, ax = plt.subplots(" .. n_rows .. ", " .. n_cols .. ", figsize = plot_config['figsize'])")
	table.insert(figure_string, "fig.tight_layout()")
	table.insert(figure_string, "fig.show()")

	set_text_under_cursor(figure_string)
end
