-- lua/plugins/mason-lspconfig.lua
return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  opts = function()
    local servers = require("config.lsp")
    local ensure_installed = {}

    for name, opts in pairs(servers) do
      table.insert(ensure_installed, opts.mason_package or name)
    end

    return {
      ensure_installed = ensure_installed,
      automatic_enable = true,
    }
  end,
}
