vim.cmd([[
augroup DKVIM_YAML
  au!
  autocmd BufWritePre *.yaml :lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
augroup END

setlocal formatoptions-=cro
]])
