vim.bo.tabstop=2
vim.bo.softtabstop=2
vim.bo.shiftwidth=2

vim.cmd([[
augroup DKVIM_TSX
  au!
  autocmd BufWritePost *.tsx :silent! Prettier
  autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)
augroup END
]])
