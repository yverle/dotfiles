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
  use {
    'Th3Whit3Wolf/one-nvim'
    -- 'olimorris/onedarkpro.nvim'
    -- 'shaunsingh/nord.nvim'
    -- 'folke/tokyonight.nvim'
  }

  -- Icons!
  use {
    'kyazdani42/nvim-web-devicons'
  }

  -- Mote icons!
  -- NOTE: I saw TJ disabling this when in WSL
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
    'lewis6991/gitsigns.nvim'
  }

  -- Better git integrations
  -- TODO: https://github.com/TimUntersberger/neogit might be cool
  use {
    'tpope/vim-fugitive'
  }

  -- Colored braces
  use {
    'luochen1990/rainbow'
  }
  -- Required for Telescope and Gitsigns
  use {
    'nvim-lua/plenary.nvim',
  }

  -- Required for Telescope
  use {
    'nvim-lua/popup.nvim',
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',

    -- Better project management plugin for Telescope
    'ahmedkhalf/project.nvim',


    -- Cheat sheet integration with Telescope
    -- TODO: Doesn't seem to create the database correctly
    --[[
    'nvim-telescope/telescope-cheat.nvim',
    'tami5/sqlite.lua',
    --]]
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

  -- Completion for nvim lua
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

  -- Better terminals in vim
  -- TODO: this might be cool
  -- use {
  --   'akinsho/toggleterm.nvim',
  -- }

  -- Stabilize buffer content on window open/close events
  use {
    'luukvbaal/stabilize.nvim',
  }

  -- View nvim startup event timing information
  use {
    'dstein64/vim-startuptime'
  }

  -- Maximise a window in a split
  use {
    'szw/vim-maximizer'
  }

  -- Highlight comments
  use {
    'folke/todo-comments.nvim'
  }

  -- Only really care for this in CSS files
  --[[
  use {
    'norcalli/nvim-colorizer.lua'
  }
  --]]

  -- I've been using Obsidian lately but this could be cool
  --[[
  use {
    'oberlastmeister/neuron.nvim'
  }
  --]]

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

