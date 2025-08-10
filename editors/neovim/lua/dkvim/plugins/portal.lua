-- portal.nvim
-- https://github.com/cbochs/portal.nvim
--
-- Neovim plugin for improved location list navigation
return {
  {
    'cbochs/portal.nvim',
    keys = {
      { '<C-o>', '<cmd>Portal jumplist backward<CR>', desc = '{Portal} jump backwards' },
      { '<C-i>', '<cmd>Portal jumplist forward<CR>', desc = '{Portal} jump forwards' },
      { 'g;', '<cmd>Portal changelist backward<CR>', desc = '{Portal} change backwards' },
      { 'g,', '<cmd>Portal changelist forward<CR>', desc = '{Portal} change forwards' },
    },
    dependencies = {
      'cbochs/grapple.nvim',
    },
    enabled = true,
    opts = {},
  },
}
