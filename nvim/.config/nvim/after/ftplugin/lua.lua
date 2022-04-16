vim.api.nvim_create_augroup('DKVIM_LUA', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'DKVIM_LUA',
  pattern = { '*.lua' },
  callback = function()
    vim.lsp.buf.formatting_seq_sync(nil, 1000)
  end,
})
