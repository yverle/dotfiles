-- Install packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Install plugins
return require('packer').startup(function(use)
  -- Packer can manage itself
  use {
    'wbthomason/packer.nvim',
  }

  -- The best theme known to man
  -- TODO(Yenti): Is this one better? https://github.com/olimorris/onedarkpro.nvim
  use {
    'Th3Whit3Wolf/one-nvim'
  }

  -- The second best theme known to man
  --[[
  use {
    'folke/tokyonight.nvim'
  }
  --]]

  -- Icons!
  use {
    'kyazdani42/nvim-web-devicons'
  }

  -- I saw TJ checking for WSL and now I'm scared
  use {
    'yamatsum/nvim-web-nonicons'
  }

  -- Clean and fast statusline
  use {
    'nvim-lualine/lualine.nvim'
  }

  -- Notification Manager
  use {
    'rcarriga/nvim-notify'
  }

  -- Clipboard manager
  use {
    'AckslD/nvim-neoclip.lua'
  }

  -- LSP configs
  use {
    'neovim/nvim-lspconfig',
  }

  -- Icons in cmp :)
  -- Configuration can be found in _after/plugin/nvim-cmp.lua!_
  use {
    'onsails/lspkind-nvim'
  }

  -- Cool listing for Lsp stuff
  use {
    'folke/trouble.nvim',
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    run = ':TSUpdate' ,
 }

 -- I'm a child and I enjoy messing with things I don't understand
  use {
    'nvim-treesitter/playground',
 }

  -- Easily change surrounding things such as parentheses, brackets, quotes, etc. (cs"')
  use {
    'tpope/vim-surround'
  }

  -- Zen mode (distraction free) coding
  use {
    'folke/zen-mode.nvim'
  }

  -- Dims code for extra focus (used in zen-mode)
  use {
    'folke/twilight.nvim'
  }

  -- Easier commenting
  use {
    'numToStr/Comment.nvim',
  }

  -- Cool dashboard
  use {
    'glepnir/dashboard-nvim',
  }

  -- Fast filetree
  use {
    'kyazdani42/nvim-tree.lua'
  }

  -- Alternative for nvim-tree, I'm currently sticking with nvim-tree but will probably swap soonish
  --[[
  use {
    'luukvbaal/nnn.nvim',
  }
  --]]

  use {
    'prettier/vim-prettier',
    ft = { 'html', 'javascript', 'typescript', 'css', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml' },
    run = 'npm install',
  }

  -- Which Key
  use {
    'folke/which-key.nvim',
  }

  -- NOTE(Yenti): Maybe someday
  -- Suggestions in the wildmenu
  --[[
  use {
    'gelguy/wilder.nvim'
    config = function()

    end
  }
  -- ]]

  -- Debugger
  use {
    'puremourning/vimspector'
  }

  -- Better git integrations
  use {
    'lewis6991/gitsigns.nvim'
--    config = function()
--      require('dkvim.core.gitsigns').setup()
--    end
--    disable = not dkvim.builtin.gitsigns.active
  }

  -- Better git integrations
  use {
    'tpope/vim-fugitive'
  }

  -- Better git integrations
  use {
    'tpope/vim-rhubarb'
  }

  -- Colored braces
  use {
    'luochen1990/rainbow'
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
  }

  -- Required for Telescope and Gitsigns
  use {
    'nvim-lua/plenary.nvim',
  }

  -- Required for Telescope and some custom stuff I'm working on
  use {
    'nvim-lua/popup.nvim',
  }

  -- Better project management (Telescope plugin)
  use {
    'ahmedkhalf/project.nvim'
--    disable = not dkvim.builtin.project-nvim.active,
  }


  -- Completion
  use {
    'hrsh7th/nvim-cmp',
  }

  -- Completion buffer
  use {
    'hrsh7th/cmp-buffer',
  }

  -- Completion for lsp
  use {
    'hrsh7th/cmp-nvim-lsp',
  }

  -- Completion for lua
  use {
    'hrsh7th/cmp-nvim-lua',
  }

  -- Completion for paths
  use {
    'hrsh7th/cmp-path',
  }

  -- Snippets!
  use {
    'hrsh7th/vim-vsnip',
  }

  -- Snippets!
  use {
    'hrsh7th/vim-vsnip-integ',
  }

  -- Completion for vsnip
  use {
    'hrsh7th/cmp-vsnip',
  }

  -- Collection of snippets
  use {
    'rafamadriz/friendly-snippets',
  }

  -- Sql stuff
  use {
    'tpope/vim-dadbod',
  }

  --- Nvim-cmp completions for dadbod
  use {
    'kristijanhusak/vim-dadbod-completion',
  }

  -- UI for dadbod
  use {
    'kristijanhusak/vim-dadbod-ui',
  }

  -- Terminals in neovim
  -- TODO(Yenti): check this out
  -- use {
  --   'akinsho/toggleterm.nvim',
  -- }

  -- Stabilize buffer content on window open/close events
  use {
    'luukvbaal/stabilize.nvim',
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

