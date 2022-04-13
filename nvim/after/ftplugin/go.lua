vim.bo.expandtab = false

vim.cmd([[
augroup DKVIM_GO
  au!
  autocmd BufWritePre *.go :lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
augroup END

setlocal formatoptions-=cro
]])
