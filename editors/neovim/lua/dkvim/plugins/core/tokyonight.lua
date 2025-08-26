-- Theme
-- https://github.com/folke/tokyonight.nvim
return {
  ---@module 'lazy'
  ---@type LazySpec
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      require('tokyonight').setup {
        styles = {
          comments = { italic = false },
        },
      }

      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
