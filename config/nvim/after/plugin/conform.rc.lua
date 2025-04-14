local status, conform = pcall(require, "conform")
if not status then
	return
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run the first available formatter
		javascript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
		typescript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})
