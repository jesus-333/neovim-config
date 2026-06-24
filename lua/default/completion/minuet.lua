-- lua/default/minuet.lua
local status_ok, minuet = pcall(require, "minuet")
if not status_ok then
  return
end

minuet.setup {
	-- Enable/disable auto-completion for the cmp/blink frontends. Minuet
	-- still must be added to your cmp/blink sources; this only controls
	-- whether it's invoked automatically. Has no effect on manual completion.
	-- Toggle at runtime with `:Minuet cmp/blink toggle`.
	cmp = {
		enable_auto_complete = true,
	},
	blink = {
		enable_auto_complete = true,
	},

	-- In-process LSP server. Recommended ONLY for built-in completion.
	-- If you use cmp or blink, using LSP for Minuet is NOT recommended.
	lsp = {
		enabled_ft = {},
		-- Filetypes excluded from LSP activation. Useful when enabled_ft = { '*' }
		disabled_ft = {},
		completion = {
			enable = true,
			-- Warn if you're on blink/nvim-cmp that you should use the native source instead.
			warn_on_blink_or_cmp = true,
			-- Workaround for an upstream multi-line indentation issue.
			adjust_indentation = true,
			-- Filetypes for which to auto-trigger via `vim.lsp.completion.enable`.
			enabled_auto_trigger_ft = {},
			-- Filetypes excluded from autotriggering. Useful when enabled_auto_trigger_ft = { '*' }
			disabled_auto_trigger_ft = {},
		},
		-- Minuet's own virtualtext frontend is recommended OVER lsp.inline_completion.
		inline_completion = {
			enable = false,
			-- Warn when LSP inline completion is on while Minuet virtual text is also configured.
			warn_on_virtualtext = true,
			-- Warn when both LSP completion and inline completion are enabled (use only one).
			warn_on_lsp_completion = true,
			-- Filetypes to auto-trigger via `vim.lsp.inline_completion.enable`.
			enabled_auto_trigger_ft = {},
			-- Filetypes excluded from inline completion autotriggering.
			disabled_auto_trigger_ft = {},
		},
	},

	-- The ghost-text frontend. This is the one relevant to inline completion.
	virtualtext = {
		-- Filetypes where automatic virtual text completion is enabled,
		-- e.g. { 'python', 'lua' }. Manual completion still works regardless.
		auto_trigger_ft = {},
		-- Filetypes where auto virtual text is disabled. Useful when auto_trigger_ft = { '*' }
		auto_trigger_ignore_ft = {},
		-- NOTE: keymaps default to nil (no keys bound). The README's
		-- quick-start suggests: accept = '<A-A>', accept_line = '<A-a>',
		-- accept_n_lines = '<A-z>', prev = '<A-[>', next = '<A-]>', dismiss = '<A-e>'.
		keymap = {
			accept = nil,
			accept_line = nil,
			accept_n_lines = nil,
			-- Cycle to next completion item, or manually invoke completion.
			next = nil,
			-- Cycle to prev completion item, or manually invoke completion.
			prev = nil,
			dismiss = nil,
		},
		-- Show virtual text suggestion when the cmp/blink completion menu is visible.
		show_on_completion_menu = false,
	},

	-- The active provider. Default is 'codestral' (cloud, needs CODESTRAL_API_KEY).
	-- Others: 'openai', 'claude', 'gemini', 'openai_compatible', 'openai_fim_compatible'.
	provider = "codestral",

	-- Max total characters of context around the cursor.
	-- ~16000 chars ≈ ~4000 tokens.
	context_window = 16000,
	-- When context exceeds the window, ratio of before-cursor to after-cursor
	-- context. Between 0 and 1; 0.75 means a 3:1 ratio favoring before-cursor.
	context_ratio = 0.75,

	-- Only send a request every x milliseconds. 0 disables throttle.
	throttle = 1000,
	-- Debounce the request by x milliseconds. 0 disables debounce.
	debounce = 400,

	-- Notification level: false | "debug" | "verbose" | "warn" | "error".
	-- Use boolean false (not the string "false") to disable all notifications.
	notify = "warn",

	-- Request timeout in seconds. With stream = true a shorter timeout yields
	-- faster (possibly incomplete) items; with stream = false a timeout before
	-- the LLM returns means no items at all.
	request_timeout = 3,

	-- Command used to make HTTP requests, plus any extra args (list of strings).
	curl_cmd = "curl",
	curl_extra_args = {},

	-- If a completion item is multi-line, also create a single-line item from
	-- its first line. Only affects cmp/blink; virtualtext adds no single-line entry.
	add_single_line_entry = true,

	-- Number of completion items requested. For chat LLMs it's encoded in the
	-- prompt; for FIM models it's the number of requests sent. With
	-- add_single_line_entry = true the returned count may exceed this.
	n_completions = 3,

	-- Length of post-cursor context used to filter redundant completion text
	-- (trims overlap from the END of a candidate). Default: 0 for FIM, 15 for chat.
	after_cursor_filter_length = function() end,
	-- Same idea, trimming from the START (prefix) of a candidate.
	-- Default: 0 for FIM, 2 for chat.
	before_cursor_filter_length = function() end,

	-- Proxy port to use.
	proxy = nil,

	-- List of functions; if any returns false, auto-completion won't trigger.
	-- Manual completion still works. Empty list (default) always evaluates true.
	-- Called on every auto-trigger attempt, so keep these functions fast.
	enable_predicates = {},

	-- Per-provider settings (model, endpoint, api_key env var name, etc.).
	-- See the "Providers" section of the README for each provider's defaults.
	provider_options = {},

	-- Default prompt templates for chat-based LLMs and FIM models. These are
	-- large text blocks; leave them at their defaults unless customizing prompts.
	-- See the README "Prompt" section and prompt.md for the actual values.
	-- default_system = { ... },
	-- default_system_prefix_first = { ... },
	-- default_fim_template = { ... },
	-- default_few_shots = { ... },
	-- default_chat_input = { ... },
	-- default_few_shots_prefix_first = { ... },
	-- default_chat_input_prefix_first = { ... },

	-- Config presets for the `:Minuet change_preset` command.
	presets = {},

	-- Next-edit prediction (highly experimental). Configured via `:Minuet duet`
	-- commands. Large subtree (models, prompts, markers) — see README "Duet"
	-- section for the full default. Left unset here to use defaults.
	-- duet = { ... },
}
