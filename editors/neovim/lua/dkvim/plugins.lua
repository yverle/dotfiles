-- Install Lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },

  -- "gc" to comment visual regions/lines
  -- {
  --   'numToStr/Comment.nvim',
  --   opts = {},
  -- },

  -- Highlight TODO's and notes in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- Change surroundings without getting artritis
  {
    'kylechui/nvim-surround',
    -- event = 'BufReadPre',
    opts = {},
  },

  -- Manages hlsearch
  { 'asiryk/auto-hlsearch.nvim', opts = {} },

  -- Base (Kickstart)
  require 'dkvim.plugins.theme',
  require 'dkvim.plugins.which_key',
  require 'dkvim.plugins.debug',
  require 'dkvim.plugins.lsp',
  require 'dkvim.plugins.cmp',
  require 'dkvim.plugins.lint',
  require 'dkvim.plugins.treesitter',
  require 'dkvim.plugins.telescope',
  require 'dkvim.plugins.conform',
  require 'dkvim.plugins.git',

  -- Own stuff
  require 'dkvim.plugins.statusline',
  require 'dkvim.plugins.autopairs',
  require 'dkvim.plugins.indent_line',
  require 'dkvim.plugins.smart_splits',
  require 'dkvim.plugins.oil',
  require 'dkvim.plugins.grapple',
  -- require 'dkvim.plugins.portal',
  require 'dkvim.plugins.leap',
  require 'dkvim.plugins.flit',
  require 'dkvim.plugins.spider',

  -- Until nvim 0.12
  require 'dkvim.plugins.multicursors',
}

local opts = {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
}

require('lazy').setup(plugins, opts)
