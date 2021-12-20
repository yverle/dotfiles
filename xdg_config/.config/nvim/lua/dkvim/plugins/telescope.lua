local trouble = require('trouble.providers.telescope')

require('telescope').setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    }
  }
}

-- Project
require('project_nvim').setup {
  manual_mode = false,
  detection_methods = { 'lsp', 'pattern' },
  patterns = { '.git', '.sln', 'Makefile', 'package.json', 'build', 'src', 'README.md' },
  ignore_lsp = {},
  exclude_dirs = {},
  show_hidden = true,
  silent_chdir = true,
  datapath = vim.fn.stdpath('data'),
}

-- Telescope integrations
require('telescope').load_extension('projects')
