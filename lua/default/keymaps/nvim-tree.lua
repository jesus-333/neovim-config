--[[ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  ]]
-- Custom function to call
-- More info here: https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes

local api = require("nvim-tree.api")

local function edit_or_open()
	local node = api.tree.get_node_under_cursor()

	if node.nodes ~= nil then
		-- expand or collapse folder
		api.node.open.edit()
	else
		-- open file
		api.node.open.edit()
		-- Close the tree if file was opened
		api.tree.close()
	end
end

-- open as vsplit on current node
local function vsplit_preview()
	local node = api.tree.get_node_under_cursor()

	if node.nodes ~= nil then
		-- expand or collapse folder
		api.node.open.edit()
	else
		-- open file as vsplit
		api.node.open.vertical()
	end

	-- Finally refocus on tree if it was lost
	api.tree.focus()
end

--[[ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  ]]
-- Keymaps call

-- Work also when the focus is not on nvim-tree
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "l", edit_or_open,          opts)
vim.keymap.set("n", "L", vsplit_preview,        opts)
vim.keymap.set("n", "h", api.tree.close,        opts)
vim.keymap.set("n", "H", api.tree.collapse_all, opts)
