# giang-nvim-modern

A cleaned-up rewrite of your config for Neovim 0.11.3+.

## What changed

- Replaced `packer.nvim` with `lazy.nvim` for a simpler maintained layout.
- Removed `lsp-zero.nvim` and all deprecated `require('lspconfig').setup()`-style flows.
- Switched to native Neovim LSP setup via `vim.lsp.config()` and `vim.lsp.enable()`.
- Removed Mason entirely.
- Removed `harpoon`, `refactoring.nvim`, `github/copilot.vim`, and `vim-helm`.
- Moved LSP keymaps to a single `LspAttach` autocommand.
- Removed duplicate `gitsigns.setup()` and other brittle one-line config patterns.

## Install

Back up your current config, then copy this folder into `~/.config/nvim`.

First launch will install `lazy.nvim` and your plugins automatically.

## LSP

This setup does not install language servers for you. Install them with your system package manager or your preferred external tool, then Neovim will attach to them normally.

Configured servers:

- `lua_ls`
- `gopls`
- `rust_analyzer`

## Notes

- This setup assumes Neovim 0.11.3 or newer.
- Use `:checkhealth vim.lsp` if a server does not attach.
