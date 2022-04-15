vim.api.nvim_create_augroup('DKVIM_GO', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'DKVIM_GO',
  pattern = { '*.go' },
  callback = function()
    vim.lsp.buf.formatting_seq_sync(nil, 1000)
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  group = 'DKVIM_GO',
  pattern = { 'go' },
  callback = function()
    vim.bo.expandtab = false
  end,
})
