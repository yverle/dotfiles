-- vim-sleuth
-- https://github.com/tpope/vim-sleuth
--
-- sleuth.vim: Heuristically set buffer options
return {
  ---@module 'lazy'
  ---@type LazySpec
  {
    'tpope/vim-sleuth',
    event = { 'BufReadPost', 'BufNewFile' },
  },
}
