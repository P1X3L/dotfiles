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

lspconfig.setup({
	ensure_installed = {
		"stylelint_lsp",
		"cssls",
		"eslint",
		"elixirls",
		"lua_ls",
		"ts_ls",
	},
})

tool_installer.setup({
	ensure_installed = {
		"eslint_d",
		"prettierd",
		"stylua",
		"stylelint",
	},
})
