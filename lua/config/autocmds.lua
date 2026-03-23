local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local lsp_group = augroup("giang-lsp", { clear = true })

autocmd("LspAttach", {
  group = lsp_group,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local buf = args.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end

    map("n", "K", vim.lsp.buf.hover, "Hover")
    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gr", vim.lsp.buf.references, "References")
    map("n", "gi", vim.lsp.buf.implementation, "Implementation")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>e", vim.diagnostic.open_float, "Line diagnostics")
    map("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, "Format buffer")

    if client and client:supports_method("textDocument/inlayHint") then
      map("n", "<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
      end, "Toggle inlay hints")
    end
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local dir = vim.fn.expand("%:p:h")
    if dir ~= "" then
      vim.cmd("cd " .. dir)
    end
  end,
})
