local present, ft = pcall(require, 'typetype')
if not present then
  return
end

ft.setup({
  overrides = {
    extensions = {
      bicep = 'bicep',
    },
    function_extensions = {
      ['cs'] = function()
        vim.bo.tabstop=4
        vim.bo.softtabstop=4
        vim.bo.shiftwidth=4

        vim.cmd([[
        augroup DKVIM_CSHARP
          au!
          autocmd BufWritePre *.cs lua vim.lsp.buf.formatting_sync(nil, 1000)
        augroup END
        ]])
      end,
      -- Gofmt uses tabs, it is what is is
      ['go'] = function()
        vim.bo.expandtab = false

        vim.cmd([[
          augroup DKVIM_GO
          au!
           autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
         augroup END
        ]])
      end,
      -- PEP8 uses 4 spaces
      ['py'] = function()
        vim.bo.tabstop=4
        vim.bo.softtabstop=4
        vim.bo.shiftwidth=4

        vim.cmd([[
        augroup DKVIM_PYTHON
          au!
          autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
        augroup END
        ]])
      end,
      -- Rustfmt uses 4 spaces
      ['rs'] = function()
        vim.bo.tabstop=4
        vim.bo.softtabstop=4
        vim.bo.shiftwidth=4

        vim.cmd([[
        augroup DKVIM_RUST
          au!
          autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
        augroup END
        ]])
      end,
      -- Format my typescript
      ['ts'] = function()
        vim.cmd([[
        augroup DKVIM_TS
          au!
          autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)
        augroup END
        ]])
      end,
      -- Format my typescriptreact
      ['tsx'] = function()
        vim.cmd([[
        augroup DKVIM_TSX
          au!
          autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 1000)
        augroup END
        ]])
      end,
    },
  },
})
