local status, dracula = pcall(require, 'dracula')
if (not status) then return end

dracula.setup({
  italic_comment = true,
  overrides = function (colors)
    return {
      ['@tag'] = { italic = true },
      ['@tag.attribute']  = { fg = colors.green, italic = true},
    }
  end,
})

vim.cmd[[set termguicolors]]
vim.cmd[[colorscheme dracula]]
