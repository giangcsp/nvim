return {
    lua_ls = {
        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim" } },
                workspace = {
                    checkThirdParty = false,
                    library = vim.api.nvim_get_runtime_file("", true),
                },
            },
        },
    },

    gopls = {},

    rust_analyzer = {},

    terraformls = {
        cmd = { "terraform-ls", "serve" },
        settings = {
            terraform = {
                path = "/opt/homebrew/bin/tofu",
            },
        },
        init_options = {
            terraform = {
                path = "/opt/homebrew/bin/tofu",
            },
        },
    },
    yamlls = {
        settings = {
            yaml = {
                schemaStore = {
                    enable = true,
                },
                validate = true,
                hover = true,
                completion = true,
            },
        },
    }
}
