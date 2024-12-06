-- Harpoon but not really
return {
  {
    'cbochs/grapple.nvim',
    config = function()
      vim.keymap.set('n', '<leader>gm', '<cmd>Grapple toggle<CR>', { desc = '{Grapple} Toggle tag' })
      vim.keymap.set('n', '<leader>gM', '<cmd>Grapple toggle_tags<CR>', { desc = '{Grapple} Toggle tags' })
      vim.keymap.set('n', '<leader>gs', '<cmd>Grapple toggle_scopes<CR>', { desc = '{Grapple} Toggle scopes' })
      vim.keymap.set('n', '<leader>g1', '<cmd>Grapple select index=1<CR>', { desc = '{Grapple} select 1' })
      vim.keymap.set('n', '<leader>g2', '<cmd>Grapple select index=2<CR>', { desc = '{Grapple} select 2' })
      vim.keymap.set('n', '<leader>g3', '<cmd>Grapple select index=3<CR>', { desc = '{Grapple} select 3' })
    end,
    enabled = true,
    opts = {},
  },
}
