local present, telescope = pcall(require, 'telescope')
if not present then
  return
end

telescope.setup({
  defaults = {},
  pickers = {
    lsp_code_actions = {
      theme = 'dropdown',
    },
    lsp_definitions = {
      theme = 'dropdown',
    },
    lsp_implementations = {
      theme = 'dropdown',
    },
  },
  extensions = {
    project = {
      base_dirs = {
        '~/Projects',
      },
      -- Needed for getting to my dotfiles
      hidden_files = true,
    },
  },
})

-- Telescope integrations
telescope.load_extension('project')
telescope.load_extension('file_browser')
