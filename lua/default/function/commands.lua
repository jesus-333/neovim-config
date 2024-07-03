-- This file contains custom commands for the function that I wrote

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-- Snippet

vim.api.nvim_create_user_command("SnippetPythonTemplate", function()
	local tmp_string
	tmp_string = snippet_python_file_template()
	set_text_under_cursor(tmp_string)
end, {nargs = 0, desc = "Snippet with basic import and headline for python script"})

vim.api.nvim_create_user_command("SnippetTorchClass", function(args)
	local tmp_string
	tmp_string = snippet_torch_class(args.fargs[1])
	set_text_under_cursor(tmp_string)
end, {nargs = 1, desc = "Given a name create the skeleton of a PyTorch nn.Module class"})

vim.api.nvim_create_user_command("SnippetPlotConfig", function(args)
	local input_argument = args.fargs
	local tmp_string

	if #input_argument  == 2 then
		-- Arguments are width and height
		tmp_string = snippet_plot_config(input_argument[1], input_argument[2])
	else
		tmp_string = snippet_plot_config()
	end

	set_text_under_cursor(tmp_string)

end, {nargs = '*', desc = "Snippet of code for a basic dictionary of parameter that I use to save the settings of matplotlib plots. Optionallay you can pass width and height of the figure"})

vim.api.nvim_create_user_command("SnippetPlotFigure", function(args)
	local input_argument = args.fargs
	local tmp_string

	if #input_argument  == 2 then
		-- Arguments are n_rows and n_cols
		tmp_string = snippet_plot_figure(input_argument[1], input_argument[2])
	else
		tmp_string = snippet_plot_figure()
	end

	set_text_under_cursor(tmp_string)

end, {nargs = '*', desc = "Snippet of code for a figure in matplotlib. Optionallay you can pass n_rows and n_cols"})

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-- Other function

vim.api.nvim_create_user_command("CheckParser", function() check_parser() end, {})

vim.api.nvim_create_user_command("ReloadConfig", function()
  for name,_ in pairs(package.loaded) do
    if name:match('^default') and not name:match('nvim-tree') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end, {})

--[[ vim.api.nvim_create_user_command("Format", function() vim.lsp.buf.format() end, {}) ]]
