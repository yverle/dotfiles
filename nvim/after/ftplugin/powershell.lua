vim.cmd([[
augroup DKVIM_POWERSHELL
  au!
  autocmd BufWritePre *.ps1 :lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
augroup END

setlocal formatoptions-=cro
]])
