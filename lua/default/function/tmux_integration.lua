function _G.send_command_tmux_panes(n_panes)
	vim.cmd("!tmux send-keys -t 1 ls Enter")
end
