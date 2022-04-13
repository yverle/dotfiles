vim.cmd([[
augroup DKVIM_LUA
  au!
  autocmd BufWritePre *.lua :lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
augroup END

setlocal formatoptions-=cro
]])
