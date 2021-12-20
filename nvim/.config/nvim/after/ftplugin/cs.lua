vim.bo.tabstop=4
vim.bo.softtabstop=4
vim.bo.shiftwidth=4

vim.cmd([[
augroup DKVIM_CSHARP
  au!
  autocmd BufWritePre *.cs lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END
]])
