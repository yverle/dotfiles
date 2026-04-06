vim.pack.add { 'https://github.com/kylechui/nvim-surround' }
vim.pack.add { { src = 'https://github.com/kylechui/nvim-surround', version = vim.version.range '^4.0.0' } }

require('nvim-surround').setup {}
