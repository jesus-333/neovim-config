return function(display_name, preset)
	return {
		name = display_name,
		enable = function()
			vim.cmd("Minuet change_preset " .. preset)
			vim.cmd("Minuet virtualtext enable")
		end,
		disable = function() vim.cmd("Minuet virtualtext disable") end,
		is_visible = function()
			return require("minuet.virtualtext").action.is_visible()
		end,
		accept = function()
			require("minuet.virtualtext").action.accept()
		end,
	}
end
