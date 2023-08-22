function _G.send_command_tmux_panes(n_panes)
	vim.cmd("!tmux send-keys -t 1 ls Enter")
end

function _G.send_yanked_text_ipython(n_panes)
	command = "!tmux send-keys -t "..n_panes
	command = command .. " \\%paste Enter"
	vim.cmd(command)
end
