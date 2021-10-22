vim.bo.tabstop=2
vim.bo.softtabstop=2
vim.bo.shiftwidth=2

vim.cmd([[
augroup DKVIM_JSX
  au!
  autocmd BufWritePost *.jsx :silent! Prettier
  autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
augroup END
]])
