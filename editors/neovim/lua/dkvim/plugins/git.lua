-- Git related plugins
return {
  -- Git on steroids in the editor
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>cg', vim.cmd.Git, { desc = '[C]ode [G]it' })
    end,
  },

  -- Adds git related signs to the gutter
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
}
