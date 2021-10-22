vim.bo.tabstop=2
vim.bo.softtabstop=2
vim.bo.shiftwidth=2

vim.cmd([[
augroup DKVIM_JS
  au!
  autocmd BufWritePost *.js :silent! Prettier
  autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
augroup END
]])
