return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local servers = {
        gopls = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
              },
              hint = {
                enable = true,
              },
            },
          },
        },
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = true,
            },
          },
        },
      }

      vim.lsp.config("*", {
        root_markers = { ".git" },
      })

      for name, config in pairs(servers) do
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
      end
    end,
  },
}
