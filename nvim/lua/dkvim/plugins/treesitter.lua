local present, treesitter = pcall(require, 'nvim-treesitter.configs')
local present2, treesitter_parsers = pcall(require, 'nvim-treesitter.parsers')
if not (present or present2) then
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
})

vim.api.nvim_create_augroup('DKVIM_TS_COLORED_BRACES', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'DKVIM_TS_COLORED_BRACES',
  pattern = { '*' },
  callback = function()
    vim.cmd('TSEnable rainbow')
  end,
})

local parser_configs = treesitter_parsers.get_parser_configs()

-- These two are optional and provide syntax highlighting
-- for Neorg tables and the @document.meta tag
parser_configs.norg_meta = {
  install_info = {
    url = 'https://github.com/nvim-neorg/tree-sitter-norg-meta',
    files = { 'src/parser.c' },
    branch = 'main',
  },
}

parser_configs.norg_table = {
  install_info = {
    url = 'https://github.com/nvim-neorg/tree-sitter-norg-table',
    files = { 'src/parser.c' },
    branch = 'main',
  },
}
