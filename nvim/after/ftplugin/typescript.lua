vim.api.nvim_create_augroup('DKVIM_TYPESCRIPT', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'DKVIM_TYPESCRIPT',
  pattern = { '*.ts' },
  callback = function()
    vim.lsp.buf.formatting_seq_sync(nil, 1000)
  end,
})
