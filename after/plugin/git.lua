require('gitsigns').setup{
	on_attach = function(bf)
		local gs = package.loaded.gitsigns
		vim.keymap.set("n", "<leader>gb", gs.toggle_current_line_blame)
	end
}

	local gs = package.loaded.gitsigns

require('gitsigns').setup()
