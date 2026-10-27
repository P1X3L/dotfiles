local status, ts = pcall(require, "nvim-treesitter")
if not status then
	return
end

local languages = {
	"markdown",
	"markdown_inline",
	"javascript",
	"tsx",
	"typescript",
	"toml",
	"fish",
	"php",
	"json",
	"yaml",
	"swift",
	"css",
	"html",
	"lua",
	"elixir",
	"heex",
	"eex",
}

ts.install(languages)

vim.treesitter.language.register("tsx", { "javascript", "typescript.tsx" })

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		if not pcall(vim.treesitter.start, args.buf) then
			return
		end
		vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
