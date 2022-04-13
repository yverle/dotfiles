vim.cmd([[
augroup DKVIM_CPP
  au!
  autocmd BufWritePre *.cpp :lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
augroup END

setlocal formatoptions-=cro
]])
