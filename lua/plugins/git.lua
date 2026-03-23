return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        vim.keymap.set("n", "<leader>gb", gs.toggle_current_line_blame, {
          buffer = bufnr,
          desc = "Toggle git blame",
        })
      end,
    },
  },
}
