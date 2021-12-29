local present, ft = pcall(require, 'filetype')
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
        vim.bo.filetype = 'cs'
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
        vim.bo.shiftwidth = 4

        vim.cmd([[
        augroup DKVIM_CS
          au!
          autocmd BufWritePre *.cs :lua vim.lsp.buf.formatting_sync(nil, 1000)
        augroup END
        ]])
      end,
      -- Gofmt uses tabs, it is what is is
      ['go'] = function()
        vim.bo.filetype = 'go'
        vim.bo.expandtab = false

        vim.cmd([[
        augroup DKVIM_GO
          au!
          autocmd BufWritePre *.go :lua vim.lsp.buf.formatting_sync(nil, 1000)
        augroup END
        ]])
      end,
      -- PEP8 uses 4 spaces
      ['py'] = function()
        vim.bo.filetype = 'python'
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
        vim.bo.shiftwidth = 4

        vim.cmd([[
        augroup DKVIM_PY
          au!
          autocmd BufWritePre *.py :lua vim.lsp.buf.formatting_sync(nil, 1000)
        augroup END
        ]])
      end,
      -- Rustfmt uses 4 spaces
      ['rs'] = function()
        vim.bo.filetype = 'rust'
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
        vim.bo.shiftwidth = 4
      end,
      ['ts'] = function()
        vim.bo.filetype = 'typescript'

        vim.cmd([[
        augroup DKVIM_TS
          au!
          autocmd BufWritePre *.ts :lua vim.lsp.buf.formatting_sync(nil, 1000)
        augroup END
        ]])
      end,
      -- Format my typescriptreact
      ['tsx'] = function()
        vim.bo.filetype = 'typescriptreact'

        vim.cmd([[
        augroup DKVIM_TSX
          au!
          autocmd BufWritePre *.tsx :lua vim.lsp.buf.formatting_sync(nil, 1000)
        augroup END
        ]])
      end,
      -- Format Lua according to stylua.toml
      ['lua'] = function()
        vim.bo.filetype = 'lua'

        vim.cmd([[
        augroup DKVIM_LUA
          au!
          autocmd BufWritePre *.lua :lua vim.lsp.buf.formatting_sync(nil, 1000)
        augroup END
        ]])
      end,
    },
  },
})
