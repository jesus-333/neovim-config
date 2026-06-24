# Neovim Configuration Summary

## Overview

A personal Neovim configuration managed with **lazy.nvim** (migrated from packer.nvim).
All plugins currently load at startup (`lazy = false`) for packer-like behaviour.
The config is split into focused modules under `lua/default/`, loaded sequentially from `init.lua`.

**Leader key**: `Space`

---

## Directory Structure

```
neovim-config/
├── init.lua                          # Entry point — loads all modules in order
├── lua/default/
│   ├── options.lua                   # Neovim built-in settings
│   ├── plugins.lua                   # Plugin list (lazy.nvim spec)
│   ├── keymaps/                      # Keybindings split by category
│   ├── completion/                   # LSP, cmp, copilot, minuet-ai
│   ├── file_explorer/                # oil, telescope, yazi, nvim-tree
│   ├── text_interaction/             # autopairs, comments, leap, surround
│   ├── ui/                           # colorscheme, lualine, noice, notify, etc.
│   └── custom_functions/             # Personal utilities (ghost, tmux, snippets, etc.)
├── plugin/
│   └── packer_compiled.lua           # Legacy artifact from packer migration (safe to remove)
└── other/                            # Non-Neovim companion configs
    ├── yazi/                         # Yazi file manager config + plugins
    ├── config.fish                   # Fish shell config
    ├── .tmux.conf                    # Tmux config
    ├── starship.toml                 # Starship prompt config
    ├── ghostty_config.txt            # Ghostty terminal config
    ├── keybindings.md                # Human-readable keybinding reference
    ├── nerdfonts/                    # Nerd Font files
    └── screenshot/                   # Neovim screenshots
```

---

## Editor Settings (`options.lua`)

| Setting | Value | Note |
|---|---|---|
| Leader key | `Space` | Set before plugins load |
| Clipboard | `unnamedplus` | Shares system clipboard |
| Line numbers | relative + absolute | `number` + `relativenumber` |
| Tab/indent | 4 spaces (tabs, not spaces) | `expandtab = false`, `shiftwidth = 4` |
| Scrolloff | 20 lines | Large scroll margin |
| Wrap | off | Long lines don't wrap |
| Undo | persistent | `undofile = true` |
| Swapfile | off | No swap files |
| Mouse | all modes | `mouse = "a"` |
| Search | smart case | `ignorecase` + `smartcase` |

---

## Plugins

### File Exploration
| Plugin | Role |
|---|---|
| `stevearc/oil.nvim` | File explorer as a text buffer (primary) |
| `mikavilpas/yazi.nvim` | Yazi terminal file manager integration |
| `nvim-telescope/telescope.nvim` | Fuzzy finder (files, text, buffers, etc.) |
| `kyazdani42/nvim-tree.lua` | Tree-style explorer (installed but disabled) |
| `simonmclean/triptych.nvim` | Miller-column explorer (installed but disabled) |

### LSP & Completion
| Plugin | Role |
|---|---|
| `williamboman/mason.nvim` | LSP/tool installer |
| `williamboman/mason-lspconfig.nvim` | Bridge mason ↔ lspconfig |
| `neovim/nvim-lspconfig` | LSP client configuration |
| `nvimtools/none-ls.nvim` | null-ls community fork (formatters/linters) |
| `hrsh7th/nvim-cmp` | Completion engine |
| `L3MON4D3/LuaSnip` | Snippet engine |
| `zbirenbaum/copilot.lua` | GitHub Copilot (Lua implementation) |
| `milanglacier/minuet-ai.nvim` | AI completion (local + remote LLMs) |

### UI & Appearance
| Plugin | Role |
|---|---|
| `folke/tokyonight.nvim` | Active colorscheme |
| `lunarvim/darkplus.nvim` | Alternative colorscheme |
| `nvim-lualine/lualine.nvim` | Statusline |
| `romgrk/barbar.nvim` | Tab/buffer bar |
| `folke/noice.nvim` | Replaces cmdline, messages, popupmenu |
| `rcarriga/nvim-notify` | Notification popups |
| `goolord/alpha-nvim` | Greeter screen on startup |
| `BlakeJC94/alpha-nvim-fortune` | Fortune quotes on greeter |
| `lukas-reineke/indent-blankline.nvim` | Indentation guides |
| `stevearc/dressing.nvim` | Improved `vim.ui` components |
| `MunifTanjim/nui.nvim` | UI component library |
| `SmiteshP/nvim-navic` | LSP breadcrumb in statusline/winbar |

### Text Interaction & Navigation
| Plugin | Role |
|---|---|
| `leap.nvim` (Codeberg fork) | Fast cursor movement |
| `windwp/nvim-autopairs` | Auto-close brackets/quotes |
| `numToStr/Comment.nvim` | Line/block commenting |
| `kylechui/nvim-surround` | Surround text with brackets, quotes, etc. |
| `RRethy/vim-illuminate` | Highlight all occurrences of word under cursor |

### Git
| Plugin | Role |
|---|---|
| `lewis6991/gitsigns.nvim` | Inline diff, blame, hunk navigation |
| `kdheepak/lazygit.nvim` | Lazygit TUI integration |
| `akinsho/git-conflict.nvim` | Merge conflict resolution |

### Treesitter
| Plugin | Role |
|---|---|
| `nvim-treesitter/nvim-treesitter` | Syntax parsing engine |
| `nvim-treesitter/nvim-treesitter-context` | Shows enclosing function/class at top |
| `JoosepAlviste/nvim-ts-context-commentstring` | Context-aware comment strings |

### Other
| Plugin | Role |
|---|---|
| `folke/which-key.nvim` | Keymap popup guide |
| `folke/trouble.nvim` | Diagnostics list panel |
| `simrat39/symbols-outline.nvim` | Symbols/functions sidebar |
| `ahmedkhalf/project.nvim` | Project management |
| `simrat39/rust-tools.nvim` | Rust-specific LSP enhancements |
| `wakatime/vim-wakatime` | Coding time tracking |
| `nvim-lua/popup.nvim` | Popup API |
| `nvim-lua/plenary.nvim` | Lua utility library (dependency) |
| `nvim-tree/nvim-web-devicons` | File type icons |

---

## LSP Language Servers

Configured under `lua/default/completion/lsp/settings/`:

| Language | Server(s) |
|---|---|
| Python | `pyright`, `ruff`, `ruff_lsp`, `jedi_language_server`, `pylsp`, `pylyzer` |
| Rust | `rust_analyzer` |
| TypeScript/JS | `tsserver` |
| Lua | `lua_ls` |
| LaTeX/Typst | `texlab`, `tinymist` |
| Shell | `bashls` |
| CSS | `cssls` |
| HTML | `html` |
| JSON | `jsonls` |
| TOML | `taplo` |
| Grammar | `ltex`, `ltex_plus`, `harper_ls`, `grammarly` |
| Custom | `sith-language-server`, `sith_lsp` |

---

## AI Completion

Two systems are configured and can be toggled independently:

### GitHub Copilot (`copilot.lua`)
Lua-based Copilot integration, controlled via the Ghost system.

### Minuet-AI (`minuet-ai.nvim`)
Supports multiple local and remote backends:
- **ollama** — local models via Ollama
- **mlx** — Apple Silicon local inference
- **llama.cpp** — local llama.cpp server

### Ghost System (`custom_functions/ghost.lua`)
A custom abstraction layer over AI completion backends:
- Dynamically discovers backends from `ghost_backend/` directory
- `M.toggle()` — enable/disable the active backend
- `M.select()` — pick backend via `vim.ui.select`
- `M.tab()` — accept suggestion with Tab, or pass through to normal Tab

---

## Custom Functions (`custom_functions/`)

| Module | Purpose |
|---|---|
| `buffer_interaction.lua` | Utilities for reading/writing buffer content |
| `commands.lua` | Custom user commands |
| `create_buffers.lua` | Helpers to open scratch/special buffers |
| `execute_code.lua` | Run code from the buffer (e.g. send to terminal) |
| `various.lua` | Miscellaneous helpers |
| `snippet.lua` | Custom snippet utilities |
| `tmux_integration.lua` | Send text to tmux panes |

---

## Keybindings Reference

### Normal Mode

| Key | Action |
|---|---|
| `<Leader>w` | Save file |
| `<Leader>z` | Open Lazygit |
| `<Leader>e` | Open nvim-tree |
| `<Leader>f` | Telescope file search |
| `<Leader>t` | Telescope live grep |
| `<Leader>bb` | Show open buffers |
| `<Leader>bo` | Recently opened files |
| `<Leader>br` | Show registers |
| `<Leader>bp` | Show projects |
| `<Leader>s1` | Symbols (functions) in file |
| `<Leader>s2` | Symbols (variables) in file |
| `Shift+H / Shift+L` | Previous / next tab |
| `Ctrl+H / Ctrl+L` | Move to left / right window |
| `Ctrl+B` | Close current buffer |
| `Alt+J / Alt+K` | Move line down / up |
| `gd / gD` | Go to definition / declaration (LSP) |
| `gl` | Show LSP diagnostic info |
| `gr` | Show references (LSP) |
| `K` | Hover documentation (LSP) |
| `]d / [d` | Next / previous LSP diagnostic |
| `ff` | Jump to next occurrence of highlighted word |
| `gcc / gbc` | Linewise / blockwise comment |

### Insert Mode

| Key | Action |
|---|---|
| `jk` | Escape to normal mode |

### Visual Mode

| Key | Action |
|---|---|
| `>` / `<` | Indent / unindent |
| `Alt+J / Alt+K` | Move selection down / up |
| `gc / gb` | Linewise / blockwise comment |
| `Ctrl+E` | Send selection to tmux console |

### Surround (Normal Mode)

| Key | Action |
|---|---|
| `(( / ))` | Add / remove round brackets around word |
| `{{ / }}` | Add / remove curly braces around word |
| `'' / ""` | Add single / double quotes around word |

---

## Legacy / Cleanup Candidates

- `plugin/packer_compiled.lua` — leftover from packer migration
- `other/packer_compiled.lua` — same
- `lua/default/plugins_backup.lua` — old plugin list backup
- `lua/default/completion/minuet_OLD.lua` — superseded minuet config
- `lua/default/uninstalled_plugins/` — configs for plugins not currently in use (flutter, toggleterm, obsidian, kite)
