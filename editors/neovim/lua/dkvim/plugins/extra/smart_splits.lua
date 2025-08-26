-- smart-splits.nvim
-- https://github.com/mrjones2014/smart-splits.nvim
--
-- Smart, seamless, directional navigation and resizing of Neovim + terminal multiplexer splits. Supports tmux, Wezterm, and Kitty. Think about splits in terms of "up/down/left/right".
return {
  ---@module 'lazy'
  ---@type LazySpec
  {
    'mrjones2014/smart-splits.nvim',
    opts = {
      tmux_integration = false,
    },
    config = function()
      vim.keymap.set('n', '<A-h>', require('smart-splits').move_cursor_left, { desc = 'Move to left split' })
      vim.keymap.set('n', '<A-j>', require('smart-splits').move_cursor_down, { desc = 'Move to below split' })
      vim.keymap.set('n', '<A-k>', require('smart-splits').move_cursor_up, { desc = 'Move to above split' })
      vim.keymap.set('n', '<A-l>', require('smart-splits').move_cursor_right, { desc = 'Move to right split' })
      vim.keymap.set('n', '<A-S-h>', require('smart-splits').resize_left, { desc = 'Resize below split' })
      vim.keymap.set('n', '<A-S-j>', require('smart-splits').resize_down, { desc = 'Resize left split' })
      vim.keymap.set('n', '<A-S-k>', require('smart-splits').resize_up, { desc = 'Resize above split' })
      vim.keymap.set('n', '<A-S-l>', require('smart-splits').resize_right, { desc = 'Resize right split' })
    end,
  },
}
