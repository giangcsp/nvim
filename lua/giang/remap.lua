vim.g.mapleader = " "

vim.keymap.set(
  "",
  "<Leader>ll",
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
)

vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', {noremap = true})

