-- guess-indent.lua
-- https://github.com/NMAC427/guess-indent.nvim
--
-- Automatic indentation style detection for Neovim
return {
  ---@module 'lazy'
  ---@type LazySpec
  {
    'NMAC427/guess-indent.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {},
  },
}
