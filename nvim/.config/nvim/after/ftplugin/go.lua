-- Gofmt output is in tabs, guess I'll just follow along :(
vim.bo.expandtab = false

-- You can't take away my 2 spaces width!
vim.bo.tabstop=2
vim.bo.softtabstop=2
vim.bo.shiftwidth=2

vim.cmd([[
  augroup DKVIM_GO
  au!
   autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
 augroup END
]])
