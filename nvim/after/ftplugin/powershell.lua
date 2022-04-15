vim.api.nvim_create_augroup('DKVIM_POWERSHELL', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'DKVIM_POWERSHELL',
  pattern = { '*.ps1' },
  callback = function()
    vim.lsp.buf.formatting_seq_sync(nil, 1000)
  end,
})
