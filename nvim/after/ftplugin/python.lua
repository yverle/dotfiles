vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4

vim.cmd([[
augroup DKVIM_PY
  au!
  autocmd BufWritePre *.py :lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
augroup END

setlocal formatoptions-=cro
]])
