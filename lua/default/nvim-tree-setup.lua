local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	print("ERROR: nvim-tree")
    return
end

--[[ local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config") ]]
--[[ if not config_status_ok then ]]
--[[ 	print("ERROR nvim-config") ]]
--[[     return 2 ]]
--[[ end ]]
--[[]]
--[[ local tree_cb = nvim_tree_config.nvim_tree_callback ]]

nvim_tree.setup {
    disable_netrw = true, -- Disable defualt file explore
    hijack_netrw = true,

	-- File that nvim_tree ignore
    --[[ ignore_ft_on_setup = { ]]
    --[[     "startify", ]]
    --[[     "dashboard", ]]
    --[[     "alpha", ]]
    --[[ }, ]]
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },

	-- Report diagnostic (error, warning etc) of the files in the tree
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
	sync_root_with_cwd = true,
  	respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = false, 		-- Ignore files based on .gitignore
		show_on_dirs = true,	-- Show status icons of children when directory itself has no status icon
        timeout = 500
    },
	-- Visual settings
    view = {
        width = 30,
        --[[ height = 30, ]] -- OLD
        side = "left",
        --[[ auto_resize = true, ]] -- OLD
        number = false,
        relativenumber = false,
    },
    actions = {
		open_file = {
			quit_on_open = true,
			window_picker = { enable = true },
		}
    },
    renderer = {
        highlight_git = true,
        root_folder_modifier = ":t",
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
            }
        }
    }
}
