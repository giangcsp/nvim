return {
  "powerman/vim-plugin-AnsiEsc",
  lazy = false,
  config = function()
    local function set_ansiesc_colors()
      local set = vim.api.nvim_set_hl

      -- Try both possible naming schemes, depending on plugin/version.
      local palettes = {
        "Ansi",
        "AnsiEsc",
      }

      for _, prefix in ipairs(palettes) do
        set(0, prefix .. "Black",        { fg = "#5c6370" })
        set(0, prefix .. "Red",          { fg = "#e06c75" })
        set(0, prefix .. "Green",        { fg = "#98c379" })
        set(0, prefix .. "Yellow",       { fg = "#e5c07b" })
        set(0, prefix .. "Blue",         { fg = "#61afef" })
        set(0, prefix .. "Magenta",      { fg = "#c678dd" })
        set(0, prefix .. "Cyan",         { fg = "#56b6c2" })
        set(0, prefix .. "White",        { fg = "#abb2bf" })

        set(0, prefix .. "BrightBlack",   { fg = "#7f848e" })
        set(0, prefix .. "BrightRed",     { fg = "#ff7b86" })
        set(0, prefix .. "BrightGreen",   { fg = "#b4f28c" })
        set(0, prefix .. "BrightYellow",  { fg = "#ffd580" })
        set(0, prefix .. "BrightBlue",    { fg = "#82cfff" })
        set(0, prefix .. "BrightMagenta", { fg = "#e5a3ff" })
        set(0, prefix .. "BrightCyan",    { fg = "#8be9fd" })
        set(0, prefix .. "BrightWhite",   { fg = "#ffffff" })
      end
    end

    -- Apply now
    set_ansiesc_colors()

    -- Re-apply after changing colorschemes
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_ansiesc_colors,
    })

    vim.api.nvim_create_user_command("LogView", function(opts)
      vim.cmd("edit " .. vim.fn.fnameescape(opts.args))
      vim.bo.readonly = true
      vim.bo.modifiable = false
      vim.bo.swapfile = false

      vim.cmd("AnsiEsc")

      -- Re-apply after AnsiEsc runs, in case it resets highlights
      set_ansiesc_colors()
    end, {
      nargs = 1,
      complete = "file",
    })
  end,
}
