-- Chcek if telescop is installed
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

local ignore_filetypes_list = {
    "venv", "__pycache__", "%.xlsx", "%.jpg", "%.png", "%.webp",
    "%.pdf", "%.odt", "%.ico", "%.npy", "%.pth"
}

telescope.setup {
	defaults = {

		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },

		file_ignore_patterns = ignore_filetypes_list,

		mappings = {
			i = {
				-- Move in history (i.e. the previous stuff you search)
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				-- Move through results search
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},

	pickers = {
		find_files = {
			find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
		},
		git_status = {
			git_icons = {
				added = " ",
				changed = " ",
				copied = " ",
				deleted = " ",
				renamed = "➡",
				unmerged = " ",
				untracked = " ",
			},
		},
	},
	
	-- Config of telescope extensions
	extensions = {
		
	},
}

-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
-- Load extensions

--[[ telescope.load_extension('media_files') ]]
--[[ telescope.load_extension('file_browser') ]]
telescope.load_extension('lazygit')

telescope.load_extension('projects')
-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
