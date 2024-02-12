function _G.send_text_tmux_panes(n_panes, command)
	vim.cmd("!tmux send-keys -t " .. n_panes .. " " .. command .. " Enter")
end

function _G.send_current_line(n_panes)
	send_text_tmux_panes(n_panes, vim.api.nvim_get_current_line())
end

--[[ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  ]]
-- Ipython shell interaction

function _G.send_yanked_text_ipython(n_panes)
	send_text_tmux_panes(n_panes, "\\%paste")
end

function _G.send_visual_selection_ipython(n_panes)
	vim.cmd("y")
	send_yanked_text_ipython(n_panes)
end

vim.api.nvim_create_user_command("SendYankedTextIpython", function()
	vim.cmd("y")
	send_yanked_text_ipython(1)
end, {})

