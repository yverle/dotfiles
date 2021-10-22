vim.bo.tabstop=4
vim.bo.softtabstop=4
vim.bo.shiftwidth=4


vim.cmd([[
augroup DKVIM_PYTHON
  au!
  autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
augroup END
]])
