# Repository Summary: neovim-config

A pure-Lua Neovim configuration. It originally derived from [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) by LunarVim, and has since been migrated from the `packer` plugin manager to [`lazy.nvim`](https://github.com/folke/lazy.nvim). The current branch is used for experimenting with LLM-based completion integrations.

## Entry Point

`init.lua` is the bootstrap. It loads modules in a deliberate order:

1. **Basics** — `options`, `keymaps`, `plugins` (plugin manifest)
2. **File explorers** — oil, telescope, yazi (nvim-tree / triptych available but disabled)
3. **Text interaction** — autopairs, comments, leap, surround
4. **Completion** — LSP, nvim-cmp, copilot, minuet
5. **Various** — treesitter, project, symbols-outline, trouble, which-key
6. **UI** — alpha greeter, colorscheme (tokyonight), dressing, gitsigns, indentline, lualine, noice, notify, vim-illuminate
7. **Custom functions** — personal utilities plus a "ghost" inline-completion layer

## Directory Layout

All configuration lives under `lua/default/`, organized by concern:

| Path | Purpose |
|------|---------|
| `options.lua` | Built-in Neovim options (4-space tabs, system clipboard, relative numbers, persistent undo, etc.) |
| `keymaps/` | Keymaps split by topic (movement, move_text, register, surround, telescope, various). Leader is `<Space>` |
| `plugins.lua` | `lazy.nvim` bootstrap + the full plugin spec (`lazy = false`, packer-like load-everything-at-startup behaviour) |
| `file_explorer/` | oil, telescope, yazi, nvim-tree, triptych |
| `text_interaction/` | autopairs, comments, leap, surround |
| `completion/` | nvim-cmp, copilot, minuet AI, and the `lsp/` subtree |
| `completion/lsp/` | mason, null-ls (none-ls), handlers, and per-server `settings/` (pyright, ruff, lua_ls, rust_analyzer, texlab, tinymist, and many more) |
| `completion/minuet_preset/` | Minuet backends for local LLMs (mlx, ollama, llamacpp) |
| `custom_functions/` | Personal utilities: buffer interaction, code execution, snippets, tmux integration, commands, and the `ghost_backend/` inline-completion layer |
| `ui/` | Statusline, colorscheme, greeter, notifications, git signs, etc. |
| `uninstalled_plugins/` | Parked plugin configs kept for reference (flutter, toggleterm, obsidian, kite) |

## Plugin Stack (via lazy.nvim)

- **LSP**: `mason.nvim` + `mason-lspconfig` + `nvim-lspconfig`, with `none-ls` (community null-ls), `trouble.nvim`, and `nvim-navic` for code context in the statusline
- **Completion**: `nvim-cmp` (buffer/path/cmdline/lsp/lua sources) + `LuaSnip`
- **AI completion**: `copilot.lua`, `minuet-ai.nvim` (supports both remote and local LLMs)
- **Navigation/editing**: `leap.nvim`, `Comment.nvim`, `nvim-surround`, `nvim-autopairs`, `vim-illuminate`
- **File explorers**: `oil.nvim`, `yazi.nvim`, `telescope.nvim`, `nvim-tree.lua`, `triptych.nvim`
- **Treesitter**: `nvim-treesitter` (+ context and context-commentstring)
- **Git**: `gitsigns.nvim`, `lazygit.nvim`, `git-conflict.nvim`
- **UI**: `tokyonight` / `darkplus` colorschemes, `lualine`, `barbar` (tabs), `alpha-nvim` (+ fortune), `noice`, `nvim-notify`, `dressing`, `indent-blankline`, `which-key`
- **Misc**: `project.nvim`, `symbols-outline`, `vim-wakatime`, `vim-grammarous`, `rust-tools`

## Notable Characteristics

- **Migration in progress**: plugins are declared `lazy = false` so everything loads at startup (matching the old packer behaviour); the spec comments note that per-plugin lazy-loading can be adopted incrementally.
- **LLM experimentation**: a custom "ghost" inline-completion system (`custom_functions/ghost.lua` + `ghost_backend/`) wraps multiple backends — Copilot and Minuet against MLX, Ollama, and llama.cpp.
- **Legacy artifacts**: `plugin/packer_compiled.lua`, `plugins_backup.lua`, `minuet_OLD.lua`, and the `uninstalled_plugins/` folder remain from the packer era / earlier configs.

## Other Files

- `README.md` — feature overview, screenshots, and fixes for common bugs (treesitter parser errors, high CPU from lingering `nvim --embed` processes, installing latest Neovim)
- `other/` — bundled Nerd Fonts, a `keybindings.md` reference, yazi config, and fish shell variables
- `.gitattributes`, `.gitignore`
