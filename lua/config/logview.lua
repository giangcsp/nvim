vim.api.nvim_create_user_command("LogView", function(opts)
  vim.cmd("edit " .. vim.fn.fnameescape(opts.args))
  vim.bo.readonly = true
  vim.bo.modifiable = false
  vim.bo.swapfile = false
  vim.cmd("AnsiEsc")
end, {
  nargs = 1,
  complete = "file",
})
