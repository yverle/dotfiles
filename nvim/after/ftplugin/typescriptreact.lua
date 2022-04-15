vim.api.nvim_create_augroup('DKVIM_TYPESCRIPTREACT', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'DKVIM_TYPESCRIPTREACT',
  pattern = { '*.tsx' },
  callback = function()
    vim.lsp.buf.formatting_seq_sync(nil, 1000)
  end,
})
