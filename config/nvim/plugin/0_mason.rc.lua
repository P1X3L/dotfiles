local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({
  ensure_installed = {
    "eslint_d",
  }
})

lspconfig.setup {
  automatic_installation = true,
  ensure_installed = {
    "cssls",
    "eslint",
    "elixirls",
    "lua_ls",
    "ts_ls",
  },
}
