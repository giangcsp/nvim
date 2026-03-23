local map = vim.keymap.set

map("n", "<leader>ll", function()
  local ok, lsp_lines = pcall(require, "lsp_lines")
  if ok then
    lsp_lines.toggle()
  end
end, { desc = "Toggle LSP lines" })

map("t", "<Esc><Esc>", [[<C-\\><C-n>]], { desc = "Exit terminal mode" })

map("n", "<leader>pf", function()
  require("telescope.builtin").find_files()
end, { desc = "Find files" })

map("n", "<leader>ps", function()
  require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep string" })

map("n", "<leader>pg", function()
  require("telescope.builtin").live_grep()
end, { desc = "Live grep" })

map("n", "<leader>pb", function()
  require("telescope.builtin").buffers()
end, { desc = "Buffers" })

map("n", "<leader>pqf", function()
  require("telescope.builtin").quickfix()
end, { desc = "Quickfix" })

map("n", "<leader>pqh", function()
  require("telescope.builtin").quickfixhistory()
end, { desc = "Quickfix history" })

map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo tree" })
