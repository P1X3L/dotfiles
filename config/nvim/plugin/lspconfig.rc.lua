local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("ts_ls", {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
	capabilities = capabilities,
})

vim.lsp.enable("ts_ls")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local opts = { noremap = true, silent = true, buffer = bufnr }

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	end,
})

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅙",
			[vim.diagnostic.severity.WARN] = "󰀦",
			[vim.diagnostic.severity.HINT] = "󰌶",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	update_in_insert = true,
	float = {
		source = "always",
	},
})
