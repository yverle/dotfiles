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
  -- LSP Support
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', },
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  -- Autocompletion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'L3MON4D3/LuaSnip' },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  -- Better terminal
  {
    'akinsho/toggleterm.nvim',
    keys = {
      { '<leader>tt', '<cmd>ToggleTerm direction=float<CR>',      desc = '{ToggleTerm} floating' },
      { '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', desc = '{ToggleTerm} horizontal' },
      { '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>',   desc = '{ToggleTerm} vertical' },
    },
    cmd = 'ToggleTerm',
    version = "*",
    opts = {},
  },

  -- Git related plugins
  { 'tpope/vim-fugitive' },
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
    }
  },
  -- Fancier statusline
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = {
          statusline = { 'lazy' },
          winbar = { 'help', 'lazy' },
        },
        always_divide_middle = true,
        globalstatus = true,
      },
    },
  },
  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      char = '┊',
      filetype_exclude = { 'help', 'lazy' },
      show_trailing_blankline_indent = false,
    }
  },
  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {}
  },
  -- Theme, configuration is done in after/plugin/colors.lua as transparancy doesn't work otherwise
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'storm',
      light_style = 'day',
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        sidebars = 'transparent',
        floats = 'transparant'
      }
    },
  },
  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth', },
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
    end
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
      'ThePrimeagen/harpoon',
      'cbochs/grapple.nvim',
    },
    enabled = true,
    opts = {}
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
  -- TODO: When trying to jump to a 'p' symbol I'm pasting from my buffer, is this a bug or is my config wrong?
  {
    'ggandor/flit.nvim',
    -- keys = function()
    --   local ret = {}
    --   for _, key in ipairs { 'f', 'F', 't', 'T' } do
    --     ret[#ret + 1] = { key, mode = { 'n', 'x', 'o' }, desc = key }
    --   end
    --   return ret
    -- end,
    opts = {
      keys = { f = 'f', F = 'F', t = 't', T = 'T' },
      labeled_modes = 'nvx',
      multiline = true,
    }
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
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
