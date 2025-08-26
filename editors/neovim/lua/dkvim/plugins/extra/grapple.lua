-- grapple.nvim
-- https://github.com/cbochs/grapple.nvim
--
-- Neovim plugin for tagging important files
return {
  ---@module 'lazy'
  ---@type LazySpec
  {
    'cbochs/grapple.nvim',
    opts = {
      scope = 'git',
    },
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = 'Grapple',
    keys = {
      { '<leader>gm', '<cmd>Grapple toggle<CR>', desc = '{Grapple} Toggle tag' },
      { '<leader>gM', '<cmd>Grapple toggle_tags<CR>', desc = '{Grapple} Toggle tags' },
      { '<leader>gs', '<cmd>Grapple toggle_scopes<CR>', desc = '{Grapple} Toggle scopes' },
      { '<leader>g1', '<cmd>Grapple select index=1<CR>', desc = '{Grapple} select 1' },
      { '<leader>g2', '<cmd>Grapple select index=2<CR>', desc = '{Grapple} select 2' },
      { '<leader>g3', '<cmd>Grapple select index=3<CR>', desc = '{Grapple} select 3' },
    },
  },
}
