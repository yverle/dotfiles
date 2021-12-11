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
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
})

-- Install plugins
return require('packer').startup(function(use)
  -- Packer can manage itself
  use {
    'wbthomason/packer.nvim',
    opt = true
  }

  -- Themes
  use {
    'Th3Whit3Wolf/one-nvim',
    -- 'olimorris/onedarkpro.nvim',
    -- 'ful1e5/onedark.nvim',
    -- 'shaunsingh/nord.nvim',
    -- 'folke/tokyonight.nvim',
    -- 'catppuccin/nvim',
    event = 'VimEnter',
    opt = true,
  }

  -- Clean and fast statusline
  use {
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    requires = {
      { 'kyazdani42/nvim-web-devicons' }
    }
  }

  -- Notification Manager
  use {
    'rcarriga/nvim-notify',
    event = 'BufEnter'
  }

  -- LSP configs
  use {
    'neovim/nvim-lspconfig',
    after = 'cmp-nvim-lsp'
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
    event = 'BufEnter'
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'BufEnter'
 }

 -- TODO:This looks super cool, look into it
 -- use {
 --    'phaazon/hop.nvim',
 --    event = 'VimEnter'
 -- }

  -- Easily change surrounding things such as parentheses, brackets, quotes, etc. (cs"')
  use {
    'tpope/vim-surround',
    event = 'BufEnter'
  }

  -- Zen mode (distraction free) coding
  use {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    event = 'BufEnter'
  }

  -- Dims code for extra focus (used in zen-mode)
  use {
    'folke/twilight.nvim',
    event = 'BufEnter'
  }

  -- Easier commenting
  use {
    'numToStr/Comment.nvim',
    event = 'BufEnter'
  }

  -- Cool dashboard
  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter'
  }

  -- Fast filetree
  use {
    'kyazdani42/nvim-tree.lua',
    event = 'BufEnter'
  }

  use {
    'prettier/vim-prettier',
    ft = { 'html', 'javascript', 'typescript', 'css', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml' },
    run = 'npm install',
    event = 'BufEnter'
  }

  -- Which Key
  use {
    'folke/which-key.nvim',
    event = 'BufEnter'
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
    event = 'User InGitRepo'
  }

  -- Better git integrations
  -- TODO: https://github.com/TimUntersberger/neogit might be cool
  use {
    'tpope/vim-fugitive',
    event = 'User InGitRepo'
  }

  -- Colored braces
  use {
    'luochen1990/rainbow',
    event = 'BufEnter'
  }

  -- Required for Telescope
  use {
    event = 'VimEnter'
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    event = 'VimEnter',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-lua/popup.nvim' },
    }
  }

  -- Projects for neovim
  use {
    -- Better project management plugin for Telescope
    'ahmedkhalf/project.nvim',
    event = 'VimEnter'
  }


  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    after = 'lspkind-nvim'
--    config = ''
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
    Event = 'BufEnter'
  }

  -- Maximise a window in a split
  use {
    'szw/vim-maximizer',
    Event = 'BufEnter'
  }

  -- Highlight comments
  use {
    'folke/todo-comments.nvim',
    Event = 'BufEnter'
  }

  -- Colorize hex values (only used in css)
  -- use {
  --   'norcalli/nvim-colorizer.lua',
  --   ft = 'css',
  --   event = 'BufEnter'
  -- }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
