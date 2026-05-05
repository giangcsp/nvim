return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "BufReadPost",
  init = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    vim.o.fillchars = table.concat({
      "eob: ",
      "fold: ",
      "foldopen:",
      "foldsep: ",
      "foldclose:",
    }, ",")
  end,
  config = function()
    local ufo = require("ufo")

    ufo.setup({
      provider_selector = function(_, filetype, _)
        local disabled = {
          gitcommit = true,
          markdown = true,
        }
        if disabled[filetype] then
          return { "indent" }
        end
        return { "treesitter", "indent" }
      end,
    })

    vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
    vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
    vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds, { desc = "Open folds except kinds" })
    vim.keymap.set("n", "zp", function()
      local winid = ufo.peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "Peek fold or hover" })
  end,
}
