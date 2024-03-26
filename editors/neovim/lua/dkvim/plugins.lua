-- Install Lazy
local is_bootstrap = false
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  is_bootstrap = true
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth', },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {},
  },

  -- Autoformat
  {
    'stevearc/conform.nvim',
  },

  -- Highlight TODO's and notes in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false }
  },

  -- Better highlighting in md, org and norg files
  {
    'lukas-reineke/headlines.nvim',
    opts = {},
  },

  -- Change surroundings without getting artritis
  {
    'kylechui/nvim-surround',
    -- event = 'BufReadPre',
    opts = {},
  },

  -- Manages hlsearch
  { 'asiryk/auto-hlsearch.nvim', opts = {} },

  -- Splits for normal people
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

  -- Directory management
  {
    'stevearc/oil.nvim',
    config = {},
    enabled = true,
    opts = {},
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
  },

  -- Harpoon but not really
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

  -- Enhanced jumplist
  {
    'cbochs/portal.nvim',
    keys = {
      { '<C-o>', '<cmd>Portal jumplist backward<CR>',   desc = '{Portal} jump backwards' },
      { '<C-i>', '<cmd>Portal jumplist forward<CR>',    desc = '{Portal} jump forwards' },
      { 'g;',    '<cmd>Portal changelist backward<CR>', desc = '{Portal} change backwards' },
      { 'g,',    '<cmd>Portal changelist forward<CR>',  desc = '{Portal} change forwards' },
    },
    dependencies = {
      'cbochs/grapple.nvim',
    },
    enabled = true,
    opts = {},
  },
  -- s on steroids
  {
    'ggandor/leap.nvim',
    keys = {
      { 's',  mode = { 'n', 'x', 'o' }, desc = '{Leap} forward to' },
      { 'S',  mode = { 'n', 'x', 'o' }, desc = '{Leap} backward to' },
      { 'gs', mode = { 'n', 'x', 'o' }, desc = '{Leap} from windows' },
    },
    config = function(opts)
      local leap = require('leap')
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end

      leap.add_default_mappings(true)
      vim.keymap.del({ 'x', 'o' }, 'x')
      vim.keymap.del({ 'x', 'o' }, 'X')
    end,
  },

  -- f/F/t/T on steroids
  {
    'ggandor/flit.nvim',
    opts = {
      keys = { f = 'f', F = 'F', t = 't', T = 'T' },
      labeled_modes = 'nvx',
      multiline = true,
    },
  },

  require 'dkvim.plugins.theme',
  require 'dkvim.plugins.which_key',
  require 'dkvim.plugins.debug',
  require 'dkvim.plugins.lsp',
  require 'dkvim.plugins.cmp',
  require 'dkvim.plugins.telescope',
  require 'dkvim.plugins.treesitter',
  require 'dkvim.plugins.git',
  require 'dkvim.plugins.git',
}

local opts = {}

require('lazy').setup(plugins, opts)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Lazy completes,'
  print '       then restart nvim'
  print '=================================='
  return
end
