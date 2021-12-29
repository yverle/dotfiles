-- Automatically install packer (https://www.chrisatmachine.com/Neovim-2/03-plugins/)
local install_path = vim.fn.stdpath('data')
  .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  print('Installing packer close and reopen Neovim...')
end

-- Use a protected call so we don't error out on first use
local present, packer = pcall(require, 'packer')
if not present then
  return
end

-- Install plugins
return require('packer').startup(function(use)
  -- Packer can manage itself
  use({
    'wbthomason/packer.nvim',
  })

  -- Improve startup time
  use({
    'lewis6991/impatient.nvim',
  })

  -- Optimise filetype.vim
  use({
    'nathom/filetype.nvim',
    config = function()
      require('dkvim.plugins.filetype')
    end,
  })

  -- Themes
  use({
    'rebelot/kanagawa.nvim',
    -- 'Th3Whit3Wolf/one-nvim',
    after = 'packer.nvim',
    config = function()
      require('dkvim.plugins.kanagawa')
    end,
  })

  -- Clean and fast statusline
  use({
    'nvim-lualine/lualine.nvim',
    event = 'BufWinEnter',
    requires = {
      { 'kyazdani42/nvim-web-devicons' },
    },
    config = function()
      require('dkvim.plugins.lualine')
    end,
    after = 'kanagawa.nvim',
  })

  -- Notification Manager
  use({
    'rcarriga/nvim-notify',
    event = 'VimEnter',
    config = function()
      vim.notify = require('notify')
    end,
  })

  -- LSP configs
  -- NOTE: Pretty sure it would be possible to load everything related to LSP in here (including cmp, snippets, etc)
  use({
    'neovim/nvim-lspconfig',
    event = 'BufRead',
    config = function()
      require('dkvim.plugins.nvim-lspconfig')
    end,
  })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('dkvim.plugins.nvim-treesitter')
    end,
  })

  -- Easily change surrounding things such as parentheses, brackets, quotes, etc. (cs"')
  use({
    'tpope/vim-surround',
    event = 'BufWinEnter',
  })

  -- Zen mode (distraction free) coding
  -- TODO: Look into Pocco81/TrueZen.nvim, I doubt there's a big difference but hey :)
  use({
    'folke/zen-mode.nvim',
    cmd = { 'ZenMode' },
    wants = { 'twilight.nvim' },
    config = function()
      require('dkvim.plugins.zen-mode')
    end,
  })

  -- Dims code for extra focus (used in zen-mode)
  use({
    'folke/twilight.nvim',
    cmd = { 'Twilight' },
  })

  -- Easier commenting
  use({
    'numToStr/Comment.nvim',
    event = 'BufEnter',
    config = function()
      require('Comment').setup()
    end,
  })

  -- Dashboard (Requires VimEnter to start at launch)
  use({
    'goolord/alpha-nvim',
    cmd = { 'Alpha' },
    event = 'VimEnter',
    config = function()
      require('dkvim.plugins.alpha-nvim')
    end,
  })

  -- Fast filetree
  -- NOTE: Basically entirely replaced by Telescope in my current workflow, this will probably be deleted soon
  use({
    'kyazdani42/nvim-tree.lua',
    cmd = {
      'NvimTreeToggle',
      'NvimTreeFocus',
    },
    config = function()
      require('dkvim.plugins.nvim-tree')
    end,
  })

  -- Which Key
  use({
    'folke/which-key.nvim',
    keys = '<leader>',
    config = function()
      require('dkvim.plugins.which-key')
    end,
  })

  -- Better git integrations
  -- TODO: Lazyload; Only load when in a git repo (see https://github.com/wbthomason/packer.nvim/discussions/534)
  use({
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
    requires = {
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      require('gitsigns').setup()
    end,
  })

  -- Magit but in Neovim
  use({
    'TimUntersberger/neogit',
    cmd = { 'Neogit' },
    requires = {
      { 'nvim-lua/plenary.nvim' },
    },
  })

  -- Colored braces in Treesitter
  use({
    'p00f/nvim-ts-rainbow',
    event = 'BufEnter',
  })

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    -- cmd = { 'Telescope' },
    event = 'VimEnter',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-project.nvim' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
    },
    config = function()
      require('dkvim.plugins.telescope')
    end,
  })

  -- Completion
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      require('dkvim.plugins.nvim-cmp')
    end,
  })

  -- Snippets!
  use({
    'L3MON4D3/LuaSnip',
    -- event = 'InsertEnter',
    requires = {
      'rafamadriz/friendly-snippets',
    },
  })

  -- Sql stuff
  use({
    'tpope/vim-dadbod',
    cmd = 'DB',
  })
  use({
    'kristijanhusak/vim-dadbod-completion',
    after = 'vim-dadbod',
  })
  use({
    'kristijanhusak/vim-dadbod-ui',
    cmd = {
      'DBUI',
      'DBUIToggle',
    },
  })

  -- Stabilize buffer content on window open/close events
  use({
    'luukvbaal/stabilize.nvim',
    event = 'BufEnter',
    config = function()
      require('dkvim.plugins.stabilize')
    end,
  })

  -- Maximise a window in a split
  use({
    'szw/vim-maximizer',
    cmd = 'MaxmimizerToggle',
  })

  -- Highlight comments
  use({
    'folke/todo-comments.nvim',
    event = 'BufEnter',
    config = function()
      require('dkvim.plugins.todo-comments')
    end,
  })

  -- Keeps buffer sizing proportional
  use({
    'kwkarlwang/bufresize.nvim',
    event = 'VimEnter',
    config = function()
      require('bufresize').setup()
    end,
  })

  -- Better terminals
  use({
    'akinsho/toggleterm.nvim',
    cmd = 'ToggleTerm',
    config = function()
      require('toggleterm').setup()
    end,
  })

  -- Easier way to move chunks of code
  use({
    'booperlv/nvim-gomove',
    event = 'VimEnter',
    config = function()
      require('gomove').setup()
    end,
  })

  -- Use Neovim as a language server
  use({
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufEnter',
    config = function()
      require('dkvim.plugins.null-ls')
    end,
  })

  -- Want to start managing notes in nvim, look into the following extensions:
  -- https://github.com/vimwiki/vimwiki
  -- https://github.com/nvim-neorg/neorg
  -- https://github.com/stevearc/gkeep.nvim

  -- TODO: This is super cool but seems like a lot of work to configure and learn; maybe someday...
  -- use {
  --    'phaazon/hop.nvim',
  --    event = 'VimEnter',
  -- }

  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end,
    },
    profile = {
      enable = true,
      threshold = 0.2,
    },
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
