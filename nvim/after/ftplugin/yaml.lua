vim.api.nvim_create_augroup('DKVIM_YAML', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'DKVIM_YAML',
  pattern = { '*.yaml', '*.yml' },
  callback = function()
    vim.lsp.buf.formatting_seq_sync(nil, 1000)
  end,
})
