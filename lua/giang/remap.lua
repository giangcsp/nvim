vim.g.mapleader = " "

vim.keymap.set(
  "",
  "<Leader>ll",
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
)

