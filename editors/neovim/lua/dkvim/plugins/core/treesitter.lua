-- nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter
--
-- Nvim Treesitter configurations and abstraction layer
return {
  ---@module 'lazy'
  ---@type LazySpec
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'luadoc',
        'vimdoc',
        'lua',
        'vim',
        'markdown',
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = {
        enable = true,
        disable = { 'ruby' },
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
      require('nvim-treesitter.install').compilers = { 'zig' }
    end,
  },
}
