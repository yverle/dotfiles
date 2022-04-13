vim.cmd([[
augroup DKVIM_TSX
  au!
  autocmd BufWritePre *.tsx :lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
augroup END

setlocal formatoptions-=cro
]])
