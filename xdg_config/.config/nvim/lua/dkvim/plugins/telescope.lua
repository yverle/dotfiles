local present, telescope = pcall(require, 'telescope')
if not present then
    return
end

local present, project = pcall(require, 'project_nvim')
if not present then
    return
end

-- Project
project.setup {
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
telescope.load_extension('projects')
