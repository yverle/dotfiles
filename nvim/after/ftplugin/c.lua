vim.cmd([[
augroup DKVIM_C
  au!
  autocmd BufWritePre *.c :lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
augroup END

setlocal formatoptions-=cro
]])

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { 'c' }
-- })
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = { 'c' }
-- })
