vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require('oil').setup {
  default_file_explorer = true,
  skip_confirm_for_simple_edits = true,

  keymaps = {
    ['<C-v>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
    ['q'] = 'actions.close',
  },
  view_options = {
    show_hidden = true,
  },
}

vim.keymap.set('n', '<leader>o', require('oil').toggle_float, { desc = '[O]il in floating window' })
