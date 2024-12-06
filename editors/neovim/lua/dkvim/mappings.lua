local utils = require('dkvim.utils')
local is_available = utils.is_available

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('v', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('v', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Next diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Previous diagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open diagnostic in floating window' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list}' })

-- Center my damn screen when I jump
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Copy from cursor to end of line
vim.keymap.set('n', 'Y', 'y$', { silent = true })

vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste without overwriting buffer' })

vim.keymap.set('n', '<leader>d', '"_d', { desc = 'Delete without overwriting buffer' })
vim.keymap.set('v', '<leader>d', '"_d', { desc = 'Delete without overwriting buffer' })

-- Yank to the system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('v', '<leader>y', '"+y')

-- [[ Highlight on yank ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
