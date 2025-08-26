-- nvim-surround
-- https://github.com/kylechui/nvim-surround
--
-- Add/change/delete surrounding delimiter pairs with ease.
return {
  ---@module 'lazy'
  ---@type LazySpec
  {
    'kylechui/nvim-surround',
    version = '^3.0.0',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {}
    end,
  },
}
