local status, mason = pcall(require, "mason")
if not status then
	return
end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
	return
end
local status3, tool_installer = pcall(require, "mason-tool-installer")
if not status3 then
	return
end

mason.setup()

lspconfig.setup()

tool_installer.setup({
	ensure_installed = {
		-- LSP servers (lspconfig names, resolved through the mason-lspconfig integration)
		"stylelint_lsp",
		"cssls",
		"eslint",
		"elixirls",
		"lua_ls",
		"ts_ls",
		-- Tools
		"eslint_d",
		"prettierd",
		"stylua",
		"stylelint",
		"tree-sitter-cli",
	},
})
