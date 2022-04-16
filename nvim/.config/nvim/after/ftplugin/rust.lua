vim.api.nvim_create_augroup('DKVIM_RUST', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'DKVIM_RUST',
  pattern = { '*.rs' },
  callback = function()
    vim.lsp.buf.formatting_seq_sync(nil, 1000)
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  group = 'DKVIM_RUST',
  pattern = { 'rs' },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
  end,
})
