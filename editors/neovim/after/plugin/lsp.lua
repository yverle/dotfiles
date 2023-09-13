local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- Setup mason so it can manage external tooling
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

-- Set PSE path to where mason extracts it
-- require("lspconfig").powershell_es.setup({
--     bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/"
-- })

-- nvim-cmp setup
local cmp = require('cmp')
local cmp_format = lsp_zero.cmp_format()

cmp.setup {
  formatting = cmp_format,
  -- snippet = {
  --   expand = function(args)
  --     luasnip.lsp_expand(args.body)
  --   end,
  -- },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  -- sources = {
  --   { name = 'nvim_lsp' },
  --   { name = 'luasnip' },
  -- },
}
