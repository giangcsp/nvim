vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local set = vim.api.nvim_set_hl
    set(0, "@lsp.type.namespace.python", { fg = "#4EC9B0" })
    set(0, "@lsp.type.class.python", { fg = "#4EC9B0" })
    set(0, "@lsp.type.type.python", { fg = "#4EC9B0" })
    set(0, "@lsp.type.decorator.python", { fg = "#DCDCAA" })
    set(0, "@lsp.type.function.python", { fg = "#DCDCAA" })
    set(0, "@lsp.type.method.python", { fg = "#DCDCAA" })
    set(0, "@lsp.type.parameter.python", { fg = "#9CDCFE" })
    set(0, "@lsp.type.variable.python", { fg = "#9CDCFE" })
    set(0, "@lsp.mod.defaultLibrary.python", { fg = "#4EC9B0" })
    set(0, "@lsp.typemod.variable.defaultLibrary.python", { fg = "#4EC9B0" })
    set(0, "@lsp.typemod.function.defaultLibrary.python", { fg = "#DCDCAA" })
  end,
})
