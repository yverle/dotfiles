require('nvim-treesitter.configs').setup {
  ensure_installed = { 'help', 'lua' },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
}

require ('nvim-treesitter.install').compilers = { 'zig' }
