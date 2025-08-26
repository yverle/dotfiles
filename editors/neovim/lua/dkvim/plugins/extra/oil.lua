-- oil.nvim
-- https://github.com/stevearc/oil.nvim
--
--  Neovim file explorer: edit your filesystem like a buffer
return {
  ---@module 'lazy'
  ---@type LazySpec
  {
    'stevearc/oil.nvim',
    lazy = false,
    keys = {
      {
        '<leader>o',
        function()
          require('oil').toggle_float()
        end,
        desc = '[O]il',
      },
    },
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,

      keymaps = {
        ['<C-v>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
        ['q'] = 'actions.close',
      },
    },
  },
}
