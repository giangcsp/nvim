return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  config = function()
    require("vscode").setup({
      style = "dark",
      transparent = true,
    })

    vim.cmd.colorscheme("vscode")

    -- keep your UI, only change text colors
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  end,
}
