local present, kanagawa = pcall(require, 'kanagawa')
if not present then
  return
end

kanagawa.setup({
  undercurl = true,
  commentStyle = 'NONE',
  functionStyle = 'NONE',
  keywordStyle = 'NONE',
  statementStyle = 'bold',
  typeStyle = 'NONE',
  variablebuiltinStyle = 'NONE',
  specialReturn = false,
  specialException = false,
  transparent = false,
  colors = {},
  overrides = {},
})

vim.cmd('colorscheme kanagawa')
