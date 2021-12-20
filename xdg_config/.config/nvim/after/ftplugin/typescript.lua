vim.bo.tabstop=2
vim.bo.softtabstop=2
vim.bo.shiftwidth=2

vim.cmd([[
augroup DKVIM_TS
  au!
  autocmd BufWritePost *.ts :silent! Prettier
  autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
augroup END
]])
