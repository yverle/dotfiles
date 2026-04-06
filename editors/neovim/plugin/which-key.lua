-- TODO: No longer required?

vim.pack.add { 'https://github.com/folke/which-key.nvim' }

require('which-key').setup {
  delay = 0,
  icons = {
    mappings = true,
    -- Default which-key.nvim defined Nerd Font icons
    keys = {},
  },

  -- Document existing key chains
  spec = {
    { '<leader>s', group = '[S]earch' },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
  },
}
