vim.api.nvim_create_augroup('DKVIM_CPP', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'DKVIM_CPP',
  pattern = { '*.cpp' },
  callback = function()
    vim.lsp.buf.formatting_seq_sync(nil, 1000)
  end,
})
