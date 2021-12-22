-- TODO: https://github.com/wbthomason/packer.nvim/discussions/534

-- Automatically install packer (https://www.chrisatmachine.com/Neovim-2/03-plugins/)
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
-- packer.init({
--   display = {
--     open_fn = function()
--       return require('packer.util').float({ border = 'single' })
--     end
--   }
-- })

-- Install plugins
return require('packer').startup(function(use)
  -- Packer can manage itself
  use {
    'wbthomason/packer.nvim',
  }

  -- Themes
  use {
    'Th3Whit3Wolf/one-nvim',
    'rebelot/kanagawa.nvim',
    -- 'shaunsingh/nord.nvim',
    -- 'folke/tokyonight.nvim',
    config = function()
      require('dkvim.plugins.kanagawa')
    end
    -- opt = true,
  }

  -- Clean and fast statusline
  use {
    'nvim-lualine/lualine.nvim',
    event = 'BufWinEnter',
    requires = {
      { 'kyazdani42/nvim-web-devicons' }
    },
    config = function()
      require('dkvim.plugins.lualine')
    end
  }

  -- Notification Manager
  use {
    'rcarriga/nvim-notify',
    event = 'VimEnter',
    config = function()
      vim.notify = require("notify")
    end
  }

  -- LSP configs
  use {
    'neovim/nvim-lspconfig',
    after = 'cmp-nvim-lsp',
    config = function()
      require('dkvim.plugins.nvim-lspconfig')
    end
  }

  -- Icons in cmp :)
  -- Configuration can be found in _after/plugin/nvim-cmp.lua!_
  use {
    'onsails/lspkind-nvim',
    event = 'BufEnter'
  }

  -- Cool listing for Lsp stuff
  use {
    'folke/trouble.nvim',
    event = 'BufEnter',
    config = function()
      require('trouble').setup()
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'BufEnter',
    config = function()
      require('dkvim.plugins.nvim-treesitter')
    end
 }

 -- TODO:This looks super cool, look into it
 -- use {
 --    'phaazon/hop.nvim',
 --    event = 'VimEnter'
 -- }

  -- Easily change surrounding things such as parentheses, brackets, quotes, etc. (cs"')
  use {
    'tpope/vim-surround',
    event = 'BufWinEnter'
  }

  -- Zen mode (distraction free) coding
  use {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    event = 'BufWinEnter',
    config = function()
      require('dkvim.plugins.zen-mode')
    end
  }

  -- Dims code for extra focus (used in zen-mode)
  use {
    'folke/twilight.nvim',
    event = 'BufEnter'
  }

  -- Easier commenting
  use {
    'numToStr/Comment.nvim',
    event = 'BufEnter',
    config = function()
      require('Comment').setup()
    end
  }

  -- Cool dashboard
  use {
    'glepnir/dashboard-nvim',
    event = 'BufEnter',
    config = function()
      require('dkvim.plugins.dashboard')
    end
  }

  -- Fast filetree
  use {
    'kyazdani42/nvim-tree.lua',
    event = 'BufEnter',
    config = function()
      require('dkvim.plugins.nvim-tree')
    end
  }

  use {
    'prettier/vim-prettier',
    ft = { 'html', 'javascript', 'typescript', 'css', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml' },
    run = 'npm install',
    event = 'BufWinEnter'
  }

  -- Which Key
  use {
    'folke/which-key.nvim',
    event = 'BufWinEnter',
    config = function()
      require('dkvim.plugins.which-key')
    end
  }

  -- NOTE: Maybe someday
  -- Suggestions in the wildmenu
  --[[
  use {
    'gelguy/wilder.nvim'
  }
  -- ]]

  -- Debugger
  use {
    'puremourning/vimspector'
  }

  -- Better git integrations
  use {
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
    requires = {
      { 'nvim-lua/plenary.nvim' }
    },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Better git integrations
  use {
    'tpope/vim-fugitive',
    event = 'BufEnter'
  }

  use {
    'TimUntersberger/neogit',
    event = 'BufEnter',
    requires = {
      { 'nvim-lua/plenary.nvim' }
    }
  }

  -- Colored braces
  use {
    'luochen1990/rainbow',
    event = 'BufEnter'
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    event = 'VimEnter',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'ahmedkhalf/project.nvim' },
    },
    config = function()
      require('dkvim.plugins.telescope')
    end
  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    after = 'lspkind-nvim',
    config = function()
      require('dkvim.plugins.nvim-cmp')
    end
  }

  -- Completion buffer
  use {
    'hrsh7th/cmp-buffer',
    after = 'nvim-cmp'
  }

  -- Completion for lsp
  use {
    'hrsh7th/cmp-nvim-lsp',
    after = 'nvim-cmp'
  }

  -- Completion for nvim lua
  use {
    'hrsh7th/cmp-nvim-lua',
    after = 'nvim-cmp'
  }

  -- Completion for paths
  use {
    'hrsh7th/cmp-path',
    after = 'nvim-cmp'
  }

  -- Completion for command mode
  -- use {
  --   'hrsh7th/cmp-cmdline',
  --   after = 'nvim-cmp'
  -- }

  -- Snippets!
  use {
    'hrsh7th/vim-vsnip',
    after = 'nvim-cmp'
  }

  -- Snippets!
  use {
    'hrsh7th/vim-vsnip-integ',
    after = 'vim-vsnip'
  }

  -- Completion for vsnip
  use {
    'hrsh7th/cmp-vsnip',
    after = 'nvim-cmp'
  }

  -- Collection of snippets
  use {
    'rafamadriz/friendly-snippets',
  }

  -- Sql stuff
  use {
    'tpope/vim-dadbod',
--    ft = 'sql'
  }

  --- Nvim-cmp completions for dadbod
  use {
    'kristijanhusak/vim-dadbod-completion',
  }

  -- UI for dadbod
  use {
    'kristijanhusak/vim-dadbod-ui',
  }

  -- Stabilize buffer content on window open/close events
  use {
    'luukvbaal/stabilize.nvim',
    Event = 'BufEnter',
    config = function()
      require('dkvim.plugins.stabilize')
    end
  }

  -- Maximise a window in a split
  use {
    'szw/vim-maximizer',
    Event = 'BufEnter'
  }

  -- Highlight comments
  use {
    'folke/todo-comments.nvim',
    Event = 'BufEnter',
    config = function()
      require('dkvim.plugins.todo-comments')
    end
  }

  -- Keeps buffer sizing proportional
  use {
    'kwkarlwang/bufresize.nvim',
    Event = 'VimEnter',
    config = function()
      require('bufresize').setup()
    end
  }

  -- Better terminals
  use {
    'akinsho/toggleterm.nvim',
    Event = 'VimEnter',
    config = function()
      require('toggleterm').setup()
    end
  }

  -- Use Neovim as a language server
  --TODO: Research how this works exactly
  use {
    'jose-elias-alvarez/null-ls.nvim',
    Event = 'BufEnter',
    config = function()
      require('dkvim.plugins.null-ls')
    end
  }

  -- Sublime text like multi cursors
  use {
    'mg979/vim-visual-multi',
    event = 'BufEnter'
  }

  -- Colorize hex values (only used in css)
  -- use {
  --   'norcalli/nvim-colorizer.lua',
  --   ft = 'css, scss',
  --   event = 'BufEnter'
  -- }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
