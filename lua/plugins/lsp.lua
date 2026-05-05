return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local servers = require("config.lsp")

            for name, opts in pairs(servers) do
                vim.lsp.config(name, opts)
                vim.lsp.enable(name)
            end
        end,
    },
}
