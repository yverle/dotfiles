vim.cmd([[
augroup DKVIM_TS
  au!
  autocmd BufWritePre *.ts :lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
augroup END

setlocal formatoptions-=cro
]])
