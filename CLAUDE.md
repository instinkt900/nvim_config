# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration written in Lua, managed with [lazy.nvim](https://github.com/folke/lazy.nvim). The configuration lives in `~/.config/nvim` and is symlinked/copied from this repo.

## Configuration Architecture

Entry point: `init.lua` → `lua/mcotton/init.lua` → loads three core modules:

- `lua/mcotton/set.lua` — vim options and autocommands
- `lua/mcotton/lazy.lua` — plugin manager bootstrap and setup
- `lua/mcotton/remap.lua` — all keymaps

Plugins are defined in `lua/mcotton/plugins/` (one file per plugin) and `lua/mcotton/plugins/lsp/` for LSP-specific setup. Each plugin file returns a lazy.nvim spec table.

## Plugin Manager

lazy.nvim is auto-bootstrapped on first launch. Plugin versions are locked in `lazy-lock.json`. Change detection is disabled (`change_detection = { notify = false }`).

The two plugin import roots are `mcotton.plugins` and `mcotton.plugins.lsp`.

## Key Conventions

**Leader key:** Space

**Keymaps are defined in two places:**
1. `remap.lua` — global keymaps and those not tied to a specific plugin
2. Individual plugin files — plugin-specific keymaps via the lazy.nvim `keys` field

**Indentation:** 4 spaces, no tabs. This applies to all Lua config files.

**Plugin file pattern:**
```lua
return {
    "owner/repo",
    dependencies = { ... },
    config = function()
        require("plugin").setup({ ... })
    end,
}
```

## Notable Plugins and Their Roles

- **LSP:** lsp-zero + mason + mason-lspconfig. Configured languages: TypeScript/JS (ts_ls, eslint), C/C++ (clangd), Lua (lua_ls), Rust (rust_analyzer)
- **Completion:** nvim-cmp with LuaSnip, LSP, and signature-help sources
- **Formatting:** conform.nvim — `<leader>f` formats buffer; prettier for JS/TS/JSON
- **Linting:** nvim-lint — `<C-l>` lints buffer; clang-tidy for C/C++
- **File navigation:** oil.nvim (file explorer), telescope.nvim (fuzzy find), harpoon2 (marked files `<C-h/j/k/l>`)
- **Jump navigation:** flash.nvim — `s`/`S` for jump, `R` for treesitter search
- **Git:** vim-fugitive via `<leader>gs`
- **AI:** claudecode.nvim — `<leader>a*` keybinds; copilot/copilot-chat are present but disabled
- **Custom floating terminal:** `plugin/floaterminal.lua` (hand-rolled, not a plugin dependency) — `<leader>tt`

## LSP Architecture

`plugins/lsp/mason.lua` — installs and configures language servers via mason
`plugins/lsp/lsp-zero.lua` — sets up lsp-zero, nvim-cmp, and LuaSnip; defines LSP keymaps (`gd`, `K`, `<leader>v*`)

LSP keymaps are set inside the `on_attach` callback in lsp-zero.lua, not in remap.lua.
