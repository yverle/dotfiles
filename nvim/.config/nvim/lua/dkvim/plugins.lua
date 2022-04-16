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
  use({
    'wbthomason/packer.nvim',
  })

  use({
    'lewis6991/impatient.nvim',
  })

  use({
    'rebelot/kanagawa.nvim',
    after = 'packer.nvim',
    config = function()
      require('dkvim.plugins.kanagawa')
    end,
  })

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

  -- use({
  --   'rcarriga/nvim-notify',
  --   event = 'VimEnter',
  --   config = function()
  --     local notify = require('notify')
  --     notify.setup({
  --       level = 'error',
  --       render = 'default',
  --       timeout = 3000,
  --     })
  --
  --     vim.noitfy = notify
  --   end,
  -- })

  use({
    'neovim/nvim-lspconfig',
    event = 'BufEnter',
  })
  use({
    'williamboman/nvim-lsp-installer',
    after = 'nvim-lspconfig',
    config = function()
      require('dkvim.plugins.lspconfig')
    end,
  })

  -- DAP
  use({
    'mfussenegger/nvim-dap',
    event = 'BufRead',
    config = function()
      require('dkvim.plugins.dap')
    end,
  })
  use({
    'rcarriga/nvim-dap-ui',
    after = 'nvim-dap',
    config = function()
      require('dkvim.plugins.dapui')
    end,
  })
  use({
    'leoluz/nvim-dap-go',
    after = 'nvim-dap',
    ft = { 'go' },
  })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('dkvim.plugins.treesitter')
    end,
  })
  use({
    'p00f/nvim-ts-rainbow',
    event = 'BufEnter',
  })

  use({
    'tpope/vim-surround',
    event = 'BufWinEnter',
  })

  use({
    'numToStr/Comment.nvim',
    event = 'BufEnter',
    config = function()
      require('Comment').setup()
    end,
  })

  use({
    'goolord/alpha-nvim',
    cmd = { 'Alpha' },
    event = 'VimEnter',
    config = function()
      require('dkvim.plugins.alpha-nvim')
    end,
  })

  use({
    'folke/which-key.nvim',
    keys = '<leader>',
    config = function()
      require('dkvim.plugins.which-key')
    end,
  })

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

  use({
    'TimUntersberger/neogit',
    cmd = { 'Neogit' },
    requires = {
      { 'nvim-lua/plenary.nvim' },
    },
  })
  -- use({
  --   'kdheepak/lazygit.nvim',
  --   cmd = { 'LazyGit', 'LazyGitConfig' },
  -- })

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-project.nvim' },
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
      require('dkvim.plugins.cmp')
    end,
  })

  -- Snippets!
  use({
    'L3MON4D3/LuaSnip',
    -- event = 'InsertEnter',
    requires = {
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require('dkvim.plugins.luasnips')
    end,
  })

  -- Sql stuff
  -- use({
  --   'tpope/vim-dadbod',
  --   cmd = 'DB',
  -- })
  -- use({
  --   'kristijanhusak/vim-dadbod-completion',
  --   after = 'vim-dadbod',
  -- })
  -- use({
  --   'kristijanhusak/vim-dadbod-ui',
  --   cmd = {
  --     'DBUI',
  --     'DBUIToggle',
  --   },
  -- })

  use({
    'szw/vim-maximizer',
    cmd = 'MaximizerToggle',
  })
  use({
    'akinsho/toggleterm.nvim',
    cmd = 'ToggleTerm',
    config = function()
      require('toggleterm').setup()
    end,
  })
  use({
    'folke/todo-comments.nvim',
    event = 'BufEnter',
    config = function()
      require('dkvim.plugins.todo-comments')
    end,
  })

  use({
    'luukvbaal/stabilize.nvim',
    event = 'BufEnter',
    config = function()
      require('dkvim.plugins.stabilize')
    end,
  })
  use({
    'kwkarlwang/bufresize.nvim',
    event = 'VimEnter',
    config = function()
      require('bufresize').setup()
    end,
  })

  -- Temporarily removed as I haven't found a good use for it yet
  -- Use Neovim as a language server
  -- use({
  --   'jose-elias-alvarez/null-ls.nvim',
  --   event = 'BufEnter',
  --   config = function()
  --     require('dkvim.plugins.null-ls')
  --   end,
  -- })

  -- Neorg for note taking and GTD
  use({
    'nvim-neorg/neorg',
    config = function()
      require('dkvim.plugins.neorg')
    end,
    requires = 'nvim-lua/plenary.nvim',
  })

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
