vim.bo.tabstop=2
vim.bo.softtabstop=2
vim.bo.shiftwidth=2

vim.cmd([[
augroup DKVIM_BICEP
  au!
  autocmd BufNewFile,BufRead *.bicep set filetype=bicep
  autocmd BufWritePre *.bicep lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END
]])
