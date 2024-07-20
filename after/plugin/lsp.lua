local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	'rust_analyzer',
	'gopls',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = 'H',
		info = 'I'
	}
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
	vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover)
	vim.keymap.set(
		"n",
		"<Leader>ll",
		require("lsp_lines").toggle,
		{ desc = "Toggle lsp_lines" }
	)
	vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition)
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
	vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, opts)
	require("lsp_lines").toggle()
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})


