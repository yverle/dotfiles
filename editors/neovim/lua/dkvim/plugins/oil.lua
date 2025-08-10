-- oil.nvim
-- https://github.com/stevearc/oil.nvim
--
--  Neovim file explorer: edit your filesystem like a buffer
return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    lazy = false,
  },
}
