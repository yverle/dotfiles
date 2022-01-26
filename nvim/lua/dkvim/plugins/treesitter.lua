local present, treesitter = pcall(require, 'nvim-treesitter.configs')
if not present then
  return
end

treesitter.setup({
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
    disable = {},
  },
  autopairs = {
    enable = true,
  },
  rainbow = {
    enable = true,
    loaded = true,
    extended_mode = true,
    max_file_lines = 1400,
  },

  vim.cmd('autocmd Filetype * silent! TSEnableAll rainbow'),
})
